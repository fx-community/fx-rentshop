---displayHelpText
---@param text string
function displayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

---ping
---@param message string
---@param color number
---@param flash boolean
---@param saveToBrief boolean
function ping(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

---spawnPed
---@param ped string
---@param x number
---@param y number
---@param z number
---@param h number
function spawnPed(ped, x, y, z, h)
    local hashedModel = GetHashKey(ped)
    RequestModel(hashedModel)
    while not HasModelLoaded(hashedModel) do
        Wait(1)
    end
    local _pedHandler = CreatePed(0, hashedModel , x, y, z - 1, h, true)
    FreezeEntityPosition(_pedHandler, true)
    SetEntityInvincible(_pedHandler, true)
    SetEntityVisible(_pedHandler, false)
    SetBlockingOfNonTemporaryEvents(_pedHandler, true)
    SetModelAsNoLongerNeeded(hashedModel)
    return _pedHandler
end

---requestMenu
---@param index number
function requestMenu(index)
    for k,v in pairs(settings.rentShops) do
        if v.id == index then
            isMenuOpen = true
            TriggerEvent('scaleform:fx-rentshop-initMenu', v.id, v.label, settings.carsList)
        end
    end
end