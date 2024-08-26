ByYoSe = {}
ByYoSe.Config = {}

ByYoSe.Config.Locale = 'en' -- locale for the script (fr, en, es, pr, uk)

ByYoSe.Config.CameraCoords = vector3(-965.9412, -1429.7676, 9.4541 + -1.1) -- camera coords ped location
ByYoSe.Config.CameraRotation = vector3(0.0, 0.0, -70.0) -- camera rotation

ByYoSe.Config.Start = {
    {
        ped = 'g_m_y_salvaboss_01', -- ped model
        location = vector3(-965.5225, -1429.6128, 7.7636 - 1.0), -- ped location
        heading = 106.2077, -- ped heading
        cooldown = 180, -- cooldown in minutes
        notify = 'ESX', -- notification type (ESX, okokNotify)
    },
}

ByYoSe.Config.Missions = {
    {
        label = 'va me chercher mon véhicule', -- label for the mission
        type = 'mission_vehicle', -- type of mission (mission_vehicle, mission_location, mission_hitman)
        model = 'sultan', -- vehicle model
        start_location = vector3(-372.8938, -2665.4636, 6.0139), heading = 313.4203, -- start location for the mission
        guard = {
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-301.2993, -2611.7720, 17.1009), heading = 294.9145, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-305.6265, -2607.2156, 12.5016), heading = 330.1400, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-300.2484, -2597.4104, 6.0003), heading = 308.8520, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-316.1713, -2596.0881, 6.0157), heading = 312.9332, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-305.2414, -2604.9944, 6.0003), heading = 353.1470, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-369.9311, -2725.6226, 6.0431), heading = 305.8007, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-387.4860, -2687.2017, 6.0099), heading = 123.6301, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-387.5145, -2687.1985, 6.0106), heading = 120.0433, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-402.3459, -2680.6802, 6.0002), heading = 108.5721, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-411.1349, -2704.7737, 6.0002), heading = 254.0834, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-314.6182, -2577.8159, 6.0003), heading = 253.6633, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-314.4893, -2637.1748, 19.2841), heading = 225.1884, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
        },
        final_location = vector3(-1189.8834, 291.9585, 69.8925), -- final location for the mission
        item = 'money', -- item to give
        amount = 8500, -- amount of the item to give
    },
    {
        label = 'va récupérer mon argent', -- label for the mission
        msg = 'pour récupérer l\'argent', -- message to show when the player is near the mission
        type = 'mission_location', -- type of mission (mission_vehicle, mission_location, mission_hitman)
        start_location = vector3(-570.9897, -1606.8104, 27.0159), -- start location for the mission
        guard = {
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-588.6925, -1630.6176, 25.0075), heading = 273.1154, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-606.0330, -1629.3850, 27.0108), heading = 262.0632, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-604.4569, -1614.2623, 27.0108), heading = 179.9743, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-588.8282, -1608.4110, 27.0108), heading = 66.2759, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(-601.8875, -1602.7737, 30.4052), heading = 180.1301, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
        },
        final_location = vector3(405.7091, -1751.1957, 29.7103), -- final location for the mission
        item = 'money', -- item to give
        amount = 2500, -- amount of the item to give
    },
    {
        label = 'va récupérer ma drogue', -- label for the mission
        msg = 'pour récupérer la drogue', -- message to show when the player is near the mission
        type = 'mission_location', -- type of mission (mission_vehicle, mission_location, mission_hitman)
        start_location = vector3(887.4540, -953.7116, 39.2141), -- start location for the mission
        guard = {
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(880.8429, -950.0336, 39.2228), heading = 31.6272, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(880.7715, -941.9746, 34.8497), heading = 357.7404, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(880.4257, -933.5613, 30.7837), heading = 59.5407, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(888.1160, -934.0182, 26.2833), heading = 268.2123, -- ped location and heading
                weapon = 'WEAPON_COMBATPISTOL', -- ped weapon
            },
            {
                ped = 'g_m_y_salvaboss_01', -- ped model
                location = vector3(886.2457, -952.7533, 39.2141), heading = 59.6188, -- ped location and heading
                weapon = 'WEAPON_PISTOL', -- ped weapon
            },
        },
        final_location = vector3(550.3088, -1775.5214, 29.3122), -- final location for the mission
        item = 'money', -- item to give
        amount = 2500, -- amount of the item to give
    },
    {
        label = 'va tuer un mec', -- label for the mission
        type = 'mission_hitman', -- type of mission (mission_vehicle, mission_location, mission_hitman)
        ped = 'g_m_y_salvaboss_01', -- ped model
        weapon = 'WEAPON_PISTOL', -- ped weapon
        start_location = vector3(443.9816, -1593.7719, 29.2914), heading = 45.8869, -- start location for the mission
        item = 'black_money', -- item to give
        amount = 5000, -- amount of the item to give
    },
}
