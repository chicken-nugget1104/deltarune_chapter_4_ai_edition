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
        local x2 = Game.battle.soul.x - 15
        local y2 = Game.battle.soul.y + 2

        local bullets = {}
        -- Get the angle between the bullet position and the soul's position
        local anglesoul = Utils.angle(x2, y2, Game.battle.soul.x, Game.battle.soul.y)
        local shift = Utils.random(0, math.pi * 2) + anglesoul - 12

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("yeet", x + shift, y - Utils.random(1, 2) + Utils.random(2, 3), math.rad(179), Utils.random(2, 10))
        table.insert(bullets, bullet)
        for i, attacker in ipairs(self:getAttackers()) do
    		attacker:setAnimation("throw")
        end

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic2:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic2