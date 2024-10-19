local SpiritFlamesWave, super = Class(Wave)

function SpiritFlamesWave:onStart()
    -- Every 1 second, spawn a flame that moves toward the SOUL
    self.timer:every(1, function()
        local arena = Game.battle.arena
        local axis = Utils.pick({"hori","vert"}) -- horizontal, vertical
        local side = Utils.pick({"left","right"})

        local x = axis == "hori" and 
        (side == "left" and Utils.random(arena:getLeft() - 50, arena:getLeft() - 10) or Utils.random(arena:getRight() + 10, arena:getRight() + 50)) or 
        Utils.random(arena:getLeft(), arena:getRight())

        local y = axis == "vert" and
        (side == "left" and Utils.random(arena:getTop() - 50, arena:getTop() - 10) or Utils.random(arena:getBottom() + 10, arena:getBottom() + 50)) or
        Utils.random(arena:getTop(), arena:getBottom())


        -- Spawn Spirit Flame bullet at random positions
        local flame = self:spawnBullet("spiritflame", x, y)
        flame.physics.speed = Utils.random(2, 3) -- Set a slow speed
    end)
end

function SpiritFlamesWave:update()
    for i, bullet in ipairs(self.bullets) do
        bullet.physics.direction = Utils.angle(bullet.x, bullet.y, Game.battle.soul.x, Game.battle.soul.y)
    end
    super.update(self)
end

return SpiritFlamesWave
