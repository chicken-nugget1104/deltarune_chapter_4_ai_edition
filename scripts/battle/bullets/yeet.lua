local YeetBullet, super = Class(Bullet)

function YeetBullet:init(x, y, dir, speed)
    self.yeet_id = Utils.random(1,3,1)
    super.init(self, x, y, "bullets/yeetbullet"..self.yeet_id)
    local hitboxes = {
        {0,0,7,19}, -- hitbox for yeetbullet1
        {0,6,10,15}, -- hitbox for yeetbullet2
        {0,0,16,15}, -- etc..
    }
    self.collider = Hitbox(self,unpack(hitboxes[self.yeet_id]))
    
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
