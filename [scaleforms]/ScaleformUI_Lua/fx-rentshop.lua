local fxrentshopPool = nil
local mainMenu = nil
local mainButton = nil

function fxrentshopinitMenu(index, shopLabel, carTable)
    fxrentshopPool = MenuPool.New()
    mainMenu = UIMenu.New(shopLabel, 'Options', 50, 50, true, nil, nil, true)
    mainMenu.Settings.MouseControlsEnabled = false
    mainMenu.Settings.ControlDisablingEnabled = false
    mainMenu:MaxItemsOnScreen(7)
    mainMenu:BuildAsync(true) -- set to false to build in a sync way (might freeze game for a couple ms for high N of items in menus)
    mainMenu:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
    mainMenu:AnimationType(MenuAnimationType.CUBIC_INOUT)
    fxrentshopPool:Add(mainMenu)

    if carTable then
        for k,v in pairs(carTable) do
            local currentHashModel = GetHashKey(v.model)
            local maxspeed = GetVehicleModelEstimatedMaxSpeed(currentHashModel) * 3.6
            local maxspeedRounded = round(maxspeed)
            local maxseats = GetVehicleModelNumberOfSeats(currentHashModel)
            mainButton = UIMenuItem.New(v.label, 'Vitesse max (approx) : '..maxspeedRounded..' km/h\nNombre de place : '..maxseats..'\nPrix : $'..v.price)
            local acceleration = GetVehicleModelAcceleration(currentHashModel)
            local accelerationRounded = (round(acceleration, 0.001) * 100 * 2)
            local maxbrake = GetVehicleModelMaxBraking(currentHashModel)
            local maxbrakeRounded = round(maxbrake, 0.001) * 100
            local agility = GetVehicleModelEstimatedAgility(currentHashModel)
            local agilityRounded = round(agility, 0.001) * 100
            local statisticsPanel = UIMenuStatisticsPanel.New()
            statisticsPanel:AddStatistic("Puissance", accelerationRounded)
            statisticsPanel:AddStatistic("Freinage", maxbrakeRounded)
            statisticsPanel:AddStatistic("Agilité", agilityRounded)
            mainButton:AddPanel(statisticsPanel)
            mainMenu:AddItem(mainButton)  
        end
    end

    mainMenu.OnMenuChanged = function(old, new, type)
		if type == "closed" then 
            TriggerEvent('fx-rentshop:updateMenuState', false)
            fxrentshopPool:FlushAllMenus()
            mainMenu = nil
            mainButton = nil
            fxrentshopPool = nil
		end
	end 

    mainMenu.OnItemSelect = function(menu, item, index)
        for k,v in pairs(item) do
            if k == '_label' then
                TriggerEvent('fx-rentshop:requestCar', v)
            end
        end
    end  

    mainMenu:Visible(true)
end

RegisterNetEvent('scaleform:fx-rentshop-initMenu')
AddEventHandler('scaleform:fx-rentshop-initMenu', function(index, shopLabel, carTable)
    fxrentshopinitMenu(index, shopLabel, carTable)
end)

RegisterNetEvent('scaleform:fx-rentshop-closeMenu')
AddEventHandler('scaleform:fx-rentshop-closeMenu', function(index, shopLabel, carTable)
    if fxrentshopPool:IsAnyMenuOpen() then              
        fxrentshopPool:CloseAllMenus()
    end
end)

AddEventHandler('fx-rentshop:onReturnedCar', function(lastCar, carList)
    print(lastCar.label..' as been returned')
    for k,v in pairs(carList) do
        if v.model == lastCar.model then
            local carPrice = v.price
            local cashBack = carPrice / 100 * 40 -- this make 40% of vehicle price
            print('you get $'..round(cashBack)..' back of $'..carPrice) -- final value
        end
    end
end)