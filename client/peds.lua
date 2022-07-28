local function initPed()
    CreateThread(function()
        for _, v in pairs(Config.Shops) do
            newPed = SpawnPed(v.position, v.heading)
            while (not DoesEntityExist(newPed)) do
                Wait(20)
            end
        end
    end)
end

Citizen.CreateThread(function()
    initPed()
end)

RegisterNetEvent("esx:playerLoaded", initPed)