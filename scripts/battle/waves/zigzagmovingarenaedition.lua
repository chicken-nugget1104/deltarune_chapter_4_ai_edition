local CircleWave, super = Class(Wave)

function CircleWave:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0

    -- Set up size
    self:setArenaSize(200, 200)
end

function CircleWave:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    local numBullets = 6 -- Reduced number of bullets (the stupid dum ai note)
    local radius = 150

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y

    Game.battle.waves[1].timer:every(0.8, function()
        local startAngle = love.math.random() * 2 * math.pi -- Random starting angle for each wave
        for i = 1, numBullets do
            local angle = startAngle + (i / numBullets) * 2 * math.pi
            local x = radius * math.cos(angle) + 320
            local y = radius * math.sin(angle) + 170
            local bullet = self:spawnBullet("spiritflamenomove", x, y, angle, 5)
            bullet.remove_offscreen = false

            -- Add zigzag movement
            Game.battle.waves[1].timer:after(0.2, function()
                bullet.physics.direction = Utils.angle(bullet.x, bullet.y, 320, 170)
            end)
        end
    end)
end

function CircleWave:update()
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 60

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x, self.arena_start_y + offset)

    super.update(self)
end

return CircleWave