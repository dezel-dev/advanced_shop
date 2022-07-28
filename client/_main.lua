Basket = {}

RegisterNetEvent("advanced_shop:emptyBasket", function(shopId)
    RageUI.CloseAll()
    Basket[shopId] = nil
end)