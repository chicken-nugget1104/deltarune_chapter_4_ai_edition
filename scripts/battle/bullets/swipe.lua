local BranchSwipe, super = Class(Bullet)

function BranchSwipe:init(x, y, direction, diagonal)
    -- Create the first segment as the head of the branch
    super.init(self, x, y, "bullets/woodsegment")

    -- Set the rotation and scaling
    if diagonal then
        self.rotation = math.pi / 4
    else
        self.rotation = direction
    end
    self:setOrigin(0.5, 0.5)
    self:setScale(2, 1)

    -- Initialize segments
    self.segments = {}
    self.segment_count = 6 -- Number of segments in the branch

    -- Alternate between "woodsegment" and "woodsegmentalt"
    for i = 1, self.segment_count do
        local sprite = (i % 2 == 0) and "bullets/woodsegmentalt" or "bullets/woodsegment"
        local segment = Sprite(sprite, self.x, self.y + (i * 32)) -- 32 pixels between each segment
        segment:setOrigin(0.5, 0.5)
        segment:setScale(2, 1)
        Game.battle:addChild(segment) -- Add segment to the game

        table.insert(self.segments, segment)
    end

    self:setHitbox(0, 0, self.width, 16)
    self.destroy_on_hit = false
    self.physics.speed = 4
end

function BranchSwipe:update()
    -- Move all the segments together
    for i, segment in ipairs(self.segments) do
        segment.x = self.x
        segment.y = self.y + (i * 32)
        segment.rotation = self.rotation
    end

    -- Remove the branch when it goes offscreen
    if self.x > Game.battle.arena:getRight() or self.x < Game.battle.arena:getLeft() then
        for _, segment in ipairs(self.segments) do
            segment:remove()
        end
        self:remove()
    end

    super.update(self)
end

return BranchSwipe
