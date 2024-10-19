local SpiritFlame, super = Class(Bullet)

function SpiritFlame:init(x, y)
    -- Sprite path for spirit flame
    super.init(self, x, y, "bullets/flame")

    self:setHitbox(0, 0, self.width, self.height)
    self.destroy_on_hit = true
    self:setScale(1, 1)
    self.physics.speed = 2
end

function SpiritFlame:update()
    super.update(self)
end

return SpiritFlame
