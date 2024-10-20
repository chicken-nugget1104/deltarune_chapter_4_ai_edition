local Leafling, super = Class(EnemyBattler)

function Leafling:init()
    super.init(self)

    -- Enemy name
    self.name = "the widest ralsei"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/leafling.lua)
    self:setActor("wideralsei")

    -- Enemy health
    self.max_health = 7777
    self.health = 7777
    -- Enemy attack (determines bullet damage)
    self.attack = 66666666
    -- Enemy defense (usually 0)
    self.defense = 111112318481284
    -- Enemy reward
    self.money = 124991249125995

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "usarmy"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "i am ralsei",
        "wide",
        "hehehwioALSHIOFAKas"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "wide ralsei"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* ralsei is wide",
        "* a",
        "* YOU 🫵 SHOULD JOIN US ARMY",
        "* fortnite battle pass"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* gow dhow how dhowhwowhwiwow HOW"
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