Citizen.CreateThread(function()
    while (true) do
        local interval = 1000
        for _, v in pairs(Config.Shops) do
            local dst = #(v.position - GetEntityCoords(PlayerPedId()))
            if (dst <= Config.Generic.Text.DrawableDistance) then
                interval = 0
                ESX.Game.Utils.DrawText3D(v.position, Litterals.TEXT_OPEN_MENU, Config.Generic.Text.Size, 4)
                if (IsControlJustPressed(0, 54)) then
                    if (not Basket[v.id]) then
                        Basket[v.id] = {}
                        Basket[v.id].article = 0
                        Basket[v.id].totalPrice = 0
                        Basket[v.id].items = {}
                    end
                    PlayPedAmbientSpeechNative(newPed, Config.Generic.Ped.Sound, "SPEECH_PARAMS_STANDARD")
                    openMenu(v.id)
                end
            end
        end

        Citizen.Wait(interval)
    end
end)