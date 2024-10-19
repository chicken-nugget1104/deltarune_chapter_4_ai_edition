local Basic2, super = Class(Wave)

function Basic2:onStart()
    local arena = Game.battle.arena
    -- Get all enemies that selected this wave as their attack
    local attackers = self:getAttackers()

    -- Every 0.33 seconds...
    self.timer:every(1/3, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = Utils.random(arena.top, arena.bottom)
        local shift = Utils.random(0, math.pi * 2)
        local x2 = Game.battle.soul.x - 15
        local y2 = Game.battle.soul.y + 2

        local bullets = {}
        -- Get the angle between the bullet position and the soul's position
        local anglesoul = Utils.angle(x2, y2, Game.battle.soul.x, Game.battle.soul.y)
        local angle = shift + ((math.pi * 2) * x) + anglesoul - 2

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("yeet", x + shift, y - 1, math.rad(179), 8)
        table.insert(bullets, bullet)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic2:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic2