local SpiritFlamesWave, super = Class(Wave)

function SpiritFlamesWave:onStart()
    -- Every 1 second, spawn a flame that moves toward the SOUL
    self.timer:every(1, function()
        local arena = Game.battle.arena
        local x = Utils.random(arena.left + 50, arena.right - 50)
        local y = Utils.random(arena.top + 50, arena.bottom - 50)

        -- Spawn Spirit Flame bullet at random positions
        local flame = self:spawnBullet("spiritflame", x, y)
        flame.physics.speed = Utils.random(2, 4) -- Set a slow speed
    end)
end

function SpiritFlamesWave:update()
    super.update(self)
end

return SpiritFlamesWave
