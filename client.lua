local ESX = exports['es_extended']:getSharedObject()

RegisterCommand('hud', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'openMenu' })
end)

RegisterNUICallback('closeMenu', function()
    SetNuiFocus(false, false)
end)

CreateThread(function()
    while true do
        Wait(300)

        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)

        SendNUIMessage({
            action  = 'update',
            hp      = math.max(GetEntityHealth(ped) - 100, 0),
            armor  = GetPedArmour(ped),
            stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            inCar   = veh ~= 0,
            speed   = veh ~= 0 and math.floor(GetEntitySpeed(veh) * 3.6) or 0
        })
    end
end)
