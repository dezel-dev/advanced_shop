Citizen.CreateThread(function()
    for _, v in pairs(Config.Shops) do
        local blip = AddBlipForCoord(v.position)
        SetBlipScale(blip, Config.Generic.Blips.Size)
        SetBlipSprite(blip, Config.Generic.Blips.Id)
        SetBlipColour(blip, Config.Generic.Blips.Color)
        SetBlipAsShortRange(blip, true)
        AddTextEntry("BLIPS", Config.Generic.Blips.Name)
        BeginTextCommandSetBlipName("BLIPS")
        EndTextCommandSetBlipName(blip)
    end
end)