local YeetBullet, super = Class(Bullet)

function YeetBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/yeetbullet1")

    self:setSprite("bullets/yeetbullet" .. Utils.random(1,3,1))
    self.collider = Hitbox(self, self.width/4, self.height/4, self.width/2, self.height/2)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function YeetBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return YeetBullet
