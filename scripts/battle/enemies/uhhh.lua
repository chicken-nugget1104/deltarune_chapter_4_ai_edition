local uhhh, super = Class(EnemyBattler)

function uhhh:init()
    super.init(self)

    -- Enemy name
    self.name = "???"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/uhhh.lua)
    self:setActor("uhhh")

    -- Enemy health
    self.max_health = 8501
    self.health = 8501
    -- Enemy attack (determines bullet damage)
    self.attack = 6
    -- Enemy defense (usually 0)
    self.defense = 3
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Fall.",
        "The pit grows.",
        "..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "What?"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* What.",
        "* It smiles.",
        "* It's happy.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* ..."
end

function uhhh:onAct(battler, name)
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

return uhhh