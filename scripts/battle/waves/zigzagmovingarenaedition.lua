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

    local numBullets = 5 -- Reduced number of bullets (the stupid dum ai note)
    local radius = 150

    local bullets = {}

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y

    self.timer:every(0.8, function()
        ::start::
            
        local shift = Utils.random(0, math.pi * 2) -- Random starting angle for each wave

        for i = 1, numBullets do
            local angle = shift + ((math.pi * 2) / numBullets) * i
            local x, y = Utils.random(arena:getLeft(), arena:getRight()), Utils.random(arena:getTop(), arena:getBottom())
            local off_x, off_y = math.sin(angle) * 60, math.cos(angle) * 60 -- end numbers control width/height of circle
            local bullet = self:spawnBullet("spiritflame", x + off_x, y + off_y)
            table.insert(bullets, bullet)

            if Hitbox(bullet, 0, 0, bullet.width, bullet.height):collidesWith(Game.battle.soul.collider) then
                for i, bullet in ipairs(bullets) do bullet:remove() end
                goto start
            end

            -- Add zigzag movement
            self.timer:after(0.5, function()
                bullet.physics.direction = Utils.angle(bullet.x, bullet.y, 320, 170)
                bullet.physics.speed = 5 -- defining it in spawnBullet wasnt working so uhh
            end)
        end
    end)
end

function CircleWave:update()
    local arena = Game.battle.arena
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 60

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x, self.arena_start_y + offset)
    local x, y = Utils.random(arena:getLeft(), arena:getRight()), Utils.random(arena:getTop(), arena:getBottom())

    super.update(self)
end

return CircleWave
