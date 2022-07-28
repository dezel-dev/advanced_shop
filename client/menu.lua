openMenu = function(shopId)

    local main = RageUI.CreateMenu("Supérette", "Le catalogue");
    local basket = RageUI.CreateSubMenu(main, "Supérette", "Votre panier")
    local category = RageUI.CreateSubMenu(main, "Supérete", "Le catalogue")

    local shopBasket = Basket[shopId]

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do

        Citizen.Wait(0)

        RageUI.IsVisible(main, function()

            RageUI.Button(("Voir le panier (~r~%s article%s~s~)"):format(shopBasket.article, shopBasket.article > 1 and "s" or ""), nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, basket)
            RageUI.Line()
            for _, v in pairs(Config.ShopsCategory) do
                RageUI.Button(v.Label, nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        selectedCategory = { label = v.Label, items = v.Items }
                    end
                }, category)
            end

        end)


        RageUI.IsVisible(category, function()

            if (selectedCategory) then
                RageUI.Separator("~r~"..selectedCategory.label)
                RageUI.Line()
                for _, v in pairs(selectedCategory.items) do
                    RageUI.Button(v.Label, nil, {RightLabel = ("~g~$%s"):format(v.Price)}, true, {
                        onSelected = function()
                            if (shopBasket.items[v.Name]) then
                                shopBasket.items[v.Name] = { label = v.Label, qty = shopBasket.items[v.Name].qty + 1, price = v.Price}
                            else
                                shopBasket.items[v.Name] = { label = v.Label, qty = 1, price = v.Price}
                            end
                            ESX.ShowNotification("~g~Vous avez ajouté un article à votre panier")
                            shopBasket.article = shopBasket.article + 1
                            shopBasket.totalPrice = shopBasket.totalPrice + v.Price
                        end
                    })
                end
            end

        end)

        RageUI.IsVisible(basket, function()

            if (shopBasket.article <= 0) then
                RageUI.Button("~r~Aucun article dans le panier!", nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {})
            else
                for _, v in pairs(shopBasket.items) do
                    if (v.qty >= 1) then

                        RageUI.Button(("[~r~x%s~s~] %s"):format(v.qty, v.label), "Cliquez sur [~b~ENTER~s~] pour retirer du panier", {}, true, {
                            onSelected = function()
                                local removeQty = tonumber(KeyboardInput("Entrez la quantité", nil, 2))
                                if (removeQty > v.qty) then
                                    return
                                end
                                shopBasket.totalPrice = shopBasket.totalPrice - v.price
                                shopBasket.article = shopBasket.article - removeQty
                                v.qty = v.qty - removeQty
                            end
                        })

                    end
                end
                RageUI.Line()
                RageUI.Button(("Passer au paiement ($%s)"):format(shopBasket.totalPrice), nil, {Color = { BackgroundColor = { 0, 204, 102, 200 }}}, true, {
                    onSelected = function()
                        TriggerServerEvent("advanced_shop:payment", shopBasket.items, shopBasket.totalPrice, shopBasket.article, shopId)
                    end
                })
            end

        end)

        if not RageUI.Visible(main) and not RageUI.Visible(basket) and not RageUI.Visible(category) then
            main = RMenu:DeleteType('main', true)
            basket = RMenu:DeleteType('bakset', true)
            category = RMenu:DeleteType('category', true)
        end
    end
end