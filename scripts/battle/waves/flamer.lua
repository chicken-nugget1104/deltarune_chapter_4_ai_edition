local SpiritFlamesWave, super = Class(Wave)

function SpiritFlamesWave:onStart()
    -- Every 1 second, spawn a flame that moves toward the SOUL
    self.timer:every(1, function()
        local x = Utils.random(Game.battle.arena.left + 50, Game.battle.arena.right - 50)
        local y = Utils.random(Game.battle.arena.top + 50, Game.battle.arena.bottom - 50)

        -- Spawn Spirit Flame bullet at random positions
        local flame = self:spawnBullet("spiritflame", x, y)
        flame.physics.speed = Utils.random(2, 4) -- Set a slow speed
    end)
end

function SpiritFlamesWave:update()
    super.update(self)
end

return SpiritFlamesWave
