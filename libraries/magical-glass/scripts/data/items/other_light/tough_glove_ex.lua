local item, super = Class(LightEquipItem, "ut_weapons/tough_glove_ex")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Tough Glove EX"
    self.short_name = "TuffGloveEX"
    self.serious_name = "Glove EX"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Whether this item is for the light world
    self.light = true

    -- Shop description
    self.shop = "Slap 'em."
    -- Default shop price (sell price is halved)
    self.price = 50
    -- Default shop sell price
    self.sell_price = 50
    -- Whether the item can be sold
    self.can_sell = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "A worn pink leather glove.\nFor five-fingered folk."

    -- Light world check text
    self.check = "Weapon AT 5\n* A worn pink leather glove.[wait:10]\nFor five-fingered folk."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    self.bonuses = {
        attack = 5
    }

    self.light_bolt_count = 4
    self.light_bolt_speed = 8
    self.light_bolt_speed_variance = nil
    self.light_bolt_direction = "random"
    self.light_bolt_miss_threshold = 4
    self.light_multibolt_variance = {{15}, {50}, {85}}
    
    self.bolt_count = 4
    self.bolt_speed = 4
    self.multibolt_variance = 30

    self.attack_sound = "punchstrong"

    self.tags = {"punch"}

end

function item:showEquipText(target)
    Game.world:showText("* " .. target:getNameOrYou() .." equipped Tough Glove EX.")
end

function item:showEquipTextFail(target)
    Game.world:showText("* " .. target:getNameOrYou() .. " didn't want to equip Tough Glove EX.")
end

function item:getLightBattleText(user, target)
    local text = "* "..target.chara:getNameOrYou().." equipped "..self:getUseName().."."
    if user ~= target then
        text = "* "..user.chara:getNameOrYou().." gave "..self:getUseName().." to "..target.chara:getNameOrYou(true)..".\n" .. "* "..target.chara:getNameOrYou().." equipped it."
    end
    return text
end

function item:getLightBattleTextFail(user, target)
    local text = "* "..target.chara:getNameOrYou().." didn't want to equip "..self:getUseName().."."
    if user ~= target then
        text = "* "..user.chara:getNameOrYou().." gave "..self:getUseName().." to "..target.chara:getNameOrYou(true)..".\n" .. "* "..target.chara:getNameOrYou().." didn't want to equip it."
    end
    return text
end

function item:onLightBoltHit(lane)
    local battler = lane.battler
    local enemy = Game.battle:getActionBy(battler).target

    if Game.battle:enemyExists(enemy) and lane.bolts[2] then
        Assets.playSound("punchweak")
        local small_punch = Sprite("effects/attack/hyperfist")
        small_punch.battler_id = battler and Game.battle:getPartyIndex(battler.chara.id) or nil
        table.insert(enemy.dmg_sprites, small_punch)
        small_punch:setOrigin(0.5)
        small_punch:setScale(0.5)
        small_punch.layer = BATTLE_LAYERS["above_ui"] + 5
        small_punch.color = {battler.chara:getLightMultiboltAttackColor()}
        small_punch:setPosition(enemy:getRelativePos((love.math.random(enemy.width)), (love.math.random(enemy.height))))
        enemy.parent:addChild(small_punch)
        small_punch:play(2/30, false, function(s) s:remove(); Utils.removeFromTable(enemy.dmg_sprites, small_punch) end)
    end
end

function item:onLightAttack(battler, enemy, damage, stretch, crit)
    if damage <= 0 then
        enemy:onDodge(battler, true)
    end
    local src = Assets.stopAndPlaySound(self:getLightAttackSound() or "laz_c")
    src:setPitch(self:getLightAttackPitch() or 1)

    local sprite = Sprite("effects/attack/hyperfist")
    sprite.battler_id = battler and Game.battle:getPartyIndex(battler.chara.id) or nil
    table.insert(enemy.dmg_sprites, sprite)
    sprite:setOrigin(0.5)
    local relative_pos_x, relative_pos_y = enemy:getRelativePos((enemy.width / 2) - (#Game.battle.attackers - 1) * 5 / 2 + (Utils.getIndex(Game.battle.attackers, battler) - 1) * 5, (enemy.height / 2))
    sprite:setPosition(relative_pos_x + enemy.dmg_sprite_offset[1], relative_pos_y + enemy.dmg_sprite_offset[2])
    sprite.layer = BATTLE_LAYERS["above_ui"] + 5
    sprite.color = {battler.chara:getLightMultiboltAttackColor()}
    enemy.parent:addChild(sprite)

    if crit then
        Assets.stopAndPlaySound("saber3", 0.7)
    end

    Game.battle.timer:during(1, function()
        sprite.x = sprite.x - 2 * DTMULT
        sprite.y = sprite.y - 2 * DTMULT
        sprite.x = sprite.x + Utils.random(4) * DTMULT
        sprite.y = sprite.y + Utils.random(4) * DTMULT
    end)

    sprite:play(2/30, false, function(this)   
        local sound = enemy:getDamageSound() or "damage"
        if sound and type(sound) == "string" and (damage > 0 or enemy.always_play_damage_sound) then
            Assets.stopAndPlaySound(sound)
        end
        enemy:hurt(damage, battler)

        battler.chara:onLightAttackHit(enemy, damage)
        this:remove()
        Utils.removeFromTable(enemy.dmg_sprites, this)
        Game.battle:finishActionBy(battler)
    end)
    return false
end

return item