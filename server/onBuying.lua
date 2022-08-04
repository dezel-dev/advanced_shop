RegisterNetEvent("advanced_shop:payment", function(items, total, article, shopId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if (xPlayer.getMoney() < total) then
        return TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent pour vous acheter les articles")
    end
    for itemName, v in pairs(items) do
        if (not xPlayer.canCarryItem(itemName, v.qty)) then
            return TriggerClientEvent("esx:showNotification", _src, ("~r~Vous ne pouvez pas porter sur vous %s"):format(v.label))
        end
    end
    for itemName, v in pairs(items) do
        xPlayer.addInventoryItem(itemName, v.qty)
    end
    xPlayer.removeMoney(total)
    TriggerClientEvent("esx:showNotification", _src, ("~g~Vous avez acheté %s articles"):format(article))
    TriggerClientEvent("advanced_shop:emptyBasket", _src, shopId)
end)
