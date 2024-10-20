local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* why is ralsei wide"

    -- Battle music ("battle" is rude buster)
    self.music = "bigfat"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("wideralsei")
end

return Dummy