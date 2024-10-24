local EncGroup, super = Class(RandomEncounter, "leafling")

function EncGroup:init()
    super.init(self)
    
    self.population = nil
    self.use_population_factor = true
    
    -- Table with the encounters that can be triggered by this random encounter
    self.encounters = {"leafling"}

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A leafling appears!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true
end

return EncGroup