local SpiritFlame, super = Class(Bullet)

function SpiritFlame:init(x, y)
    super.init(self, x, y, "bullets/flame") -- only texture change...
    self:setScale(1)
end

return SpiritFlame
