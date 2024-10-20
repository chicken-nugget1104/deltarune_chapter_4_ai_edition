local Firefly, super = Class(Event)

function Firefly:init(x, y)
    super.init(self, x, y)
    self.sprite = Assets.getTexture("objects/firefly")
    self.timer = 0
end

function Firefly:update()
    super.update(self)
    self.timer = self.timer + DTMULT
    -- Simple hovering effect
    self.y = self.y + math.sin(self.timer * 0.1) * 0.5
end

function Firefly:draw()
    super.draw(self)
    Draw.draw(self.sprite, self.x, self.y)
end

return Firefly
