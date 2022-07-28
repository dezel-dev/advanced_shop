local model <const> = GetHashKey(Config.Generic.Ped.Model)

Citizen.CreateThread(function()
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(20)
    end
end)

function SpawnPed(position, heading)
    local newPed = CreatePed(4, model, position.x, position.y, position.z - 1.0, heading, false, true)
    SetEntityInvincible(newPed, true)
    TaskSetBlockingOfNonTemporaryEvents(newPed, true)
    TaskStartScenarioInPlace(newPed, Config.Generic.Ped.Scenario)
    return (newPed)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
    blockinput = true --Blocks new input while typing if **blockinput** is used

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() --Gets the result of the typing
        Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
        blockinput = false --This unblocks new Input when typing is done
        return result --Returns the result
    else
        Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
        blockinput = false --This unblocks new Input when typing is done
        return nil --Returns nil if the typing got aborted
    end
end