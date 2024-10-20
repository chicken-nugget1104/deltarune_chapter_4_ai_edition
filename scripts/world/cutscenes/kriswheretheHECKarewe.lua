return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `WorldCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene WorldCutscene
    wall = function(cutscene, event)
        -- If we have Susie, play a cutscene
        local susie = cutscene:getCharacter("susie")
        if susie then
            -- All text from now is spoken by Susie
            cutscene:setSpeaker(susie)
            susie:setAnimation("turn_around")
            cutscene:text("* GOD DAMN IT KRIS WHERE\n THE HELL ARE WE", "angry")

            cutscene:wait(1)

            -- Reset Susie's sprite
            susie:resetSprite()
        end
    end
}
