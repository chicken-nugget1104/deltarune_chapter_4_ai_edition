local Leafling, super = Class(EnemyBattler)

function Leafling:init()
    super.init(self)

    -- Enemy name
    self.name = "Leafling"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/leafling.lua)
    self:setActor("leafling")

    -- Enemy health
    self.max_health = 155
    self.health = 155
    -- Enemy attack (determines bullet damage)
    self.attack = 2
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 7

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 7

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "leaf"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Hehe!",
        "Watch out!!",
        "Can't catch me!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 2 DF 1\n* Little leaf creature."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The leafling floats.",
        "* Smells like leafs.",
        "* It's so so small.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The Leafling looks like it's\nabout to cry."
end

function Leafling:onAct(battler, name)
    if name == "test" then
        -- Give the enemy 100% mercy
        self:addMercy(1)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "test"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* test"
        }

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        -- self:addMercy(2)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            self:addMercy(4)
            return "* Ralsei did a dance.\nIt wasn't very effective."
        elseif battler.chara.id == "susie" then
            self:addMercy(1)
            return "* Susie got mad!\nIt wasn't very effective."
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." did something."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Leafling