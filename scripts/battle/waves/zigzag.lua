local CircleWave, super = Class(Wave)

function CircleWave:init()
    super.init(self)
    self:setArenaSize(200, 200)
end

function CircleWave:onStart()
    local numBullets = 6 -- Reduced number of bullets
    local radius = 150
    Game.battle.waves[1].timer:every(0.5, function()
        local startAngle = love.math.random() * 2 * math.pi -- Random starting angle for each wave
        for i = 1, numBullets do
            local angle = startAngle + (i / numBullets) * 2 * math.pi
            local x = radius * math.cos(angle) + 320
            local y = radius * math.sin(angle) + 170
            local bullet = self:spawnBullet("smallbullet", x, y, angle, 5)
            bullet.remove_offscreen = false

            -- Add zigzag movement
            Game.battle.waves[1].timer:after(0.2, function()
                bullet.physics.direction = Utils.angle(bullet.x, bullet.y, 320, 170)
            end)
        end
    end)
end

function CircleWave:update()
    super.update(self)
end

return CircleWave