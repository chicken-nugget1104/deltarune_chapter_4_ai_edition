local YeetBullet, super = Class(Bullet)

function YeetBullet:init(x, y, dir, speed)
    self.yeet_id = Utils.random(1,3,1)
    super.init(self, x, y, "bullets/yeetbullet"..yeet_id)
    local hitboxes = {
        {0,0,10,10}, -- hitbox for yeetbullet1
        {0,0,20,20}, -- hitbox for yeetbullet2
        {0,0,30,30}, -- etc..
    }
    self.collider = Hitbox(self,unpack(hitboxes[yeet_id]))
    
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
