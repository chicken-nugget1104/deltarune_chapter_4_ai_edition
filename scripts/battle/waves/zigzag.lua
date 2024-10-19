local CircleWave, super = Class(Wave)

function CircleWave:init()
    super.init(self)
    self:setArenaSize(200, 200)
end

function CircleWave:onStart()
    local numBullets = 5 -- Reduced number of bullets (the stupid dum ai note)
    local radius = 150
    local arena = Game.battle.arena
    self.arena_sines = Utils.pick({false,true})
    self.siner = 0
    self.timer:every(0.8, function()
        ::start::
        
        local x, y = Utils.random(arena:getLeft(), arena:getRight()), Utils.random(arena:getTop(), arena:getBottom())
        local shift = Utils.random(0, math.pi * 2)

        local bullets = {}

        for i = 1, numBullets do
            local angle = shift + ((math.pi * 2) / numBullets) * i
            local off_x, off_y = math.sin(angle) * 60, math.cos(angle) * 60 -- end numbers control width/height of circle
            local bullet = self:spawnBullet("spiritflame", x + off_x, y + off_y)
            table.insert(bullets, bullet)

            if Hitbox(bullet, 0, 0, bullet.width, bullet.height):collidesWith(Game.battle.soul.collider) then
                for i, bullet in ipairs(bullets) do bullet:remove() end
                bullets = {}
                goto start
            end

            -- Add zigzag movement
            self.timer:after(0.5, function()
                bullet.physics.direction = Utils.angle(x + off_x, y + off_y, x, y)
                bullet.physics.speed = 5 -- defining it in spawnBullet wasnt working so uhh
            end)
        end
    end)
end

function CircleWave:update()
    if self.arena_sines then
        local arena = Game.battle.arena
        self.siner = self.siner + DT
        local offset = math.sin(self.siner * 1.5) * 2.5
        Game.battle.arena:setPosition(Game.battle.arena.x, Game.battle.arena.y + offset)
    end
    super.update(self)
end

return CircleWave
