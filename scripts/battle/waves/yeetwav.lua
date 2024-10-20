local Basic2, super = Class(Wave)

function Basic2:onStart()
    local arena = Game.battle.arena

    -- Every 0.33 seconds...
    self.timer:every(1/3, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = Utils.random(arena.top, arena.bottom)
        local shift = Utils.random(0, math.pi * 2)

        local bullets = {}
        local angle = shift + ((math.pi * 2) * x)

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("yeet", x + shift, y - 1, math.rad(179), 8)
        table.insert(bullets, bullet)
        for i, attacker in ipairs(self:getAttackers()) do
    		attacker:setAnimation("throw")
        end

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic2:onArenaExit()
    for i, attacker in ipairs(self:getAttackers()) do
        attacker:setAnimation("idle")
    end
end

function Basic2:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic2