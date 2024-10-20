local Leafling, super = Class(Recruit)

function Leafling:init()
    super.init(self)
    
    -- Display Name
    self.name = "Leafling"
    
    -- How many times an enemy needs to be spared to be recruited
    self.recruit_amount = 6
    
    -- Organize the order that recruits show up in the recruit menu
    self.index = 1
    
    -- Selection Display
    self.description = "A leaf creature."
    self.chapter = 4
    self.level = 3
    self.attack = 2
    self.defense = 1
    self.element = "LEAF"
    self.like = "Hiding"
    self.dislike = "Chaos"
    
    -- Controls the type of the box gradient
    -- Available options: dark, bright
    self.box_gradient_type = "bright"
    
    -- Dyes the box gradient
    self.box_gradient_color = {0,1,1,1}
    
    -- Sets the animated sprite in the box
    -- Syntax: Sprite/Animation path, offset_x, offset_y, animation_speed
    self.box_sprite = {"enemies/Leafling/idle", 0, 12, 4/30}
    
    -- Recruit Status (saved to the save file)
    -- Number: Recruit Progress
    -- Boolean: True = Recruited | False = Lost Forever
    self.recruited = 0
    
    -- Whether the recruit will be hidden from the recruit menu (saved to the save file)
    self.hidden = false
end

return Leafling