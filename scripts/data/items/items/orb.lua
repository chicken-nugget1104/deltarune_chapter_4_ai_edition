local item, super = Class(Item, "orb")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Spore"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Random"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Strange spore."

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "battle"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions
    self.reactions = {}
end

function item:onBattleUse(target)
    -- Generate a random effect
    local effect = math.random(3)

    if effect == 1 then
        -- Restore 20 HP to the user
        target:heal(20)
        Game.world:showText(target.name .. " restored 20 HP!")
    elseif effect == 2 then
        -- Deal 5 damage to the user
        target:hurt(5)
        Game.world:showText(target.name .. " took 5 damage!")
    elseif effect == 3 then
        -- Grant 10 TP to the user
        Game:addTP(10)
        Game.world:showText(target.name .. " gained 10 TP!")
    end

    return true
end

return item