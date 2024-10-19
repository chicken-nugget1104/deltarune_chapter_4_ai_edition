---@class MysteriousStone: Object
local MysteriousStone, super = Class(Object)

function MysteriousStone:init(x, y)
    super.init(self, x, y, 48, 48)  -- Adjust size as needed
    self.sprite = Sprite("world/objects/mysterious_stone")  -- Path to stone sprite
    self:addChild(self.sprite)

    self:setOrigin(0.5, 1)  -- Set the origin to the bottom center
end

function MysteriousStone:onInteract()
    -- Display message or lore when interacted with
    Game.world.dialogue:show("The stone has strange markings... it feels like it holds a secret.")
end

function MysteriousStone:update()
    super.update(self)
end

function MysteriousStone:draw()
    super.draw(self)
end

return MysteriousStone
