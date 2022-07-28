Config = {
    Generic = {
        Blips = {
            Id = 59, -- Sprite of the blips         --[[
            Size = 0.7, -- Size of the blips            (https://docs.fivem.net/docs/game-references/blips/)
            Color = 2, -- Color of the blips         ]]--
            Name = "Supérette",
        },
        Ped = {
            Model = "mp_m_shopkeep_01", -- (https://docs.fivem.net/docs/game-references/ped-models/)
            Scenario = "WORLD_HUMAN_CLIPBOARD", -- (https://wiki.rage.mp/index.php?title=Scenarios)
            Sound = "GENERIC_HI" -- (https://pastebin.com/Vk9609qj)
        },
        Text = {
            Size = 0.75,
            DrawableDistance = 2.0
        }
    },
    Shops = {
        { position = vector3(372.67, 326.72, 103.55), heading = 263.62, id = 1 },
        { position = vector3(24.29, -1347.00, 29.48), heading = 272.12, id = 2 }
    },
    ShopsCategory = {
        { Label = "Nourriture", Items = {
            { Name = "bread", Label = "Pain", Price = 5 },
            { Name = "chocolate", Label = "Chocolat", Price = 2 }
        }},
        { Label = "Boissons", Items = {
            { Name = "water", Label = "Eau", Price = 3 },
            { Name = "coca", Label = "Coca-Cola", Price = 4}
        }}
    }
}