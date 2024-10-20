local uhhh, super = Class(PhaseEncounter)

function uhhh:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Who?"

    -- Battle music ("battle" is rude buster)
    self.music = "mus_uhhh"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the uhhh enemy to the encounter
    self:addEnemy("uhhh")

    -- defines the first phase of the battle
    self:addPhase({
        {
            dialogue = {
                ["uhhh"] = {"The pit grow's.", "Be warned."}
            },
            wave = "yeetwavother",
        },
        {
            dialogue = {
                ["uhhh"] = {"..."}
            },
            wave = "yeetwav",
            text = "* Be warned.",
        },
        {
            dialogue = {
                ["uhhh"] = {"I have followed you.", "Now...", "It's my turn to smile."}
            },
            wave = "yeetwavother",
            text = "* What?",
        }    })
end

return uhhh