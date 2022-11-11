settings = {} -- initialisation des paramètres

settings.nearDistance = 10 -- distance a partir de laquelle vous entrez en zone (pour afficher les markeurs par exemple)
settings.inDistance = 1 -- distance a partir de laquelle vous êtes considéré comme très proche (pour proposer l'interaction par exemple)
settings.usePedsMethod = false -- si ce paramètre est défini sur @true, un ped apparaîtra aux positions de location, dans le cas contraire un simple markeur sera affiché
settings.initPedDistance = 50 -- distance a partir de laquelle vous chargez le ped (pris en compte uniquement si le paramètre @usePedsMethod est défini sur @true)
settings.carLimit = 3 -- nombre maximum de véhicule louable (se réinitialise à chaque déconnexion) à noter que vous ne pourrez rendre que votre dernier véhicule loué
settings.warpInCar = true -- si ce paramètre est défini sur @true, le joueur sera automatiquement téléporté à l'intérieur du véhicule loué, dans le cas contraire il devra simplement marcher jusqu'à celui-ci

settings.carsList = { -- liste des véhicules louable
    {model = 'blista', label = 'Blista', price = 0, r = 255, g = 255, b = 255}, -- si la valeur @r est définie à -1 alors une couleur aléatoire s'appliquera au véhicule
    {model = 'kalahari', label = 'Kalahari', price = 0, r = 255, g = 255, b = 255}, -- si la valeur @r est définie à -1 alors une couleur aléatoire s'appliquera au véhicule
    {model = 'faggio', label = 'Faggio', price = 0, r = 255, g = 255, b = 255} -- si la valeur @r est définie à -1 alors une couleur aléatoire s'appliquera au véhicule
}

settings.rentShops = { -- liste des points de locations
    {id = 1, label = 'Los Santos Location', x = -42.2881, y = -227.4896, z = 45.7995, h = 67.7461, pedModel = 'a_f_y_business_01', blipType = 171, blipColour = 5, markerType = 6, markerRotation = -90.0, markerScale = 0.8, markerR = 255, markerG = 255, markerB = 255, markerA = 255, helpText = 'Appuyer sur ~INPUT_CONTEXT~ pour intéragir'}, -- si la valeur @blipType est définie à -1 alors ce point de location n'apparaîtra pas sur la carte
    {id = 2, label = 'Paleto Bay Location', x = -138.5727, y = 6360.5932, z = 31.4906, h = 88.0614, pedModel = 'a_f_y_business_01', blipType = 171, blipColour = 5, markerType = 6, markerRotation = -90.0, markerScale = 0.8, markerR = 255, markerG = 255, markerB = 255, markerA = 255, helpText = 'Appuyer sur ~INPUT_CONTEXT~ pour intéragir'} -- si la valeur @blipType est définie à -1 alors ce point de location n'apparaîtra pas sur la carte
} -- la valeur @id doit être unique à chaque point de location

settings.carsReturnpoints = { -- liste des points de retour des véhicules
    {id = 1, x = -47.8637, y = -229.0688, z = 45.5417, h = 244.4004, markerType = 6, markerRotation = -90.0, markerScale = 5.0, markerR = 255, markerG = 0, markerB = 0, markerA = 255, helpText = 'Appuyer sur ~INPUT_CONTEXT~ pour récupérer la caution'}, -- si la valeur @markerType est définie à -1 alors le markeur de ce point de retour des véhicules n'apparaîtra pas
    {id = 2, x = -143.8360, y = 6350.3452, z = 31.4906, h = 142.6473, markerType = 6, markerRotation = -90.0, markerScale = 5.0, markerR = 255, markerG = 0, markerB = 0, markerA = 255, helpText = 'Appuyer sur ~INPUT_CONTEXT~ pour récupérer la caution'} -- si la valeur @markerType est définie à -1 alors le markeur de ce point de retour des véhicules n'apparaîtra pas
} -- la valeur @id de chaque ligne doit impérativement correspondre à la ligne adéquat de la liste des points de locations

settings.carsSpawnpoints = { -- liste des points d'apparition des véhicules
    {id = 1, x = -45.4784, y = -222.0642, z = 44.8378, h = 159.4477},
    {id = 1, x = -48.9880, y = -220.5952, z = 44.8377, h = 159.7516},
    {id = 1, x = -52.6382, y = -219.3120, z = 44.8378, h = 160.0971},
    {id = 1, x = -56.2672, y = -217.9680, z = 44.8377, h = 160.4648},
    {id = 1, x = -59.8329, y = -216.6533, z = 44.8377, h = 160.9588},
    {id = 1, x = -63.5254, y = -215.4302, z = 44.8378, h = 159.8089},
    {id = 1, x = -67.0823, y = -214.0732, z = 44.8377, h = 160.7534},
    {id = 1, x = -70.7214, y = -212.7447, z = 44.8378, h = 159.8956},
    {id = 2, x = -149.4445, y = 6361.9042, z = 31.3147, h = 225.2977},
    {id = 2, x = -151.9058, y = 6359.1274, z = 30.8845, h = 225.3263},
    {id = 2, x = -154.5960, y = 6356.4082, z = 30.8843, h = 225.9226},
    {id = 2, x = -140.0318, y = 6345.2768, z = 30.8837, h = 43.8888},
    {id = 2, x = -136.4386, y = 6346.8632, z = 30.8835, h = 44.7141},
    {id = 2, x = -134.1454, y = 6349.3881, z = 30.8835, h = 45.1426},
    {id = 2, x = -136.6891, y = 6357.1416, z = 30.8833, h = 44.9023}
} -- la valeur @id de chaque ligne doit impérativement correspondre à la ligne adéquat de la liste des points de locations

settings.lang = {} -- initialisation des dialogues
settings.lang.noSpawnpointsAvailable = 'Aucune place n\'est libre' -- lorsque toutes les positions d'apparition sont obstruées
settings.lang.carSpawned = 'Votre véhicule est apparu avec succès' -- lorsque le véhicule loué apparaît
settings.lang.carLimitReached = 'Vous avez loué le maximum de véhicules autorisé' -- lorsque vous atteignez la limite de véhicule loué (@carLimit)
settings.lang.notEnoughMoney = 'Il vous manque ~g~$~s~' -- lorsque que vous ne possédez pas les fonds nécéssaire pour loué le véhicule