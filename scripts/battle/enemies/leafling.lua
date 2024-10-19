local Leafling, super = Class(EnemyBattler)

function Leafling:init()
    super.init(self)

    -- Enemy name
    self.name = "Leafling"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/Leafling.lua)
    self:setActor("Dummy")

    -- Enemy health
    self.max_health = 150
    self.health = 150
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
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Hehe!",
        "Watch out!!",
        "Can't catch me!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 2 DF 0\n* Little leaf creature."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The Leafling gives you a soft\nsmile.",
        "* The power of fluffy boys is\nin the air.",
        "* Smells like cardboard.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The Leafling looks like it's\nabout to fall over."

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Tell Story", "", {"ralsei"})
end

function Leafling:onAct(battler, name)
    if name == "Smile" then
        -- Give the enemy 100% mercy
        self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "... ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The Leafling smiles back.",
            "* It seems the Leafling just wanted\nto see you happy."
        }

    elseif name == "Tell Story" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            enemy:setTired(true)
        end
        return "* You and Ralsei told the Leafling\na bedtime story.\n* The enemies became [color:blue]TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The Leafling spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/Leafling.lua)
            Game.battle:startActCutscene("Leafling", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\nLeafling's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Leafling