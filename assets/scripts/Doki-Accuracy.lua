function onUpdateScore(missed)
    local ratingPercent = getProperty("ratingPercent")

    if getProperty("ratingName") ~= "?" then
        if ratingPercent == 1 then
            setRatingName("AAA")
        elseif ratingPercent > 0.9 then
            setRatingName("AA")
        elseif ratingPercent > 0.8 then
            setRatingName("A")
        elseif ratingPercent > 0.7 then
            setRatingName("B")
        elseif ratingPercent > 0.6 then
            setRatingName("B+")
        elseif ratingPercent > 0.5 then
            setRatingName("B-")
        elseif ratingPercent > 0.4 then
            setRatingName("C")
        elseif ratingPercent > 0.3 then
            setRatingName("C+")
        elseif ratingPercent > 0.2 then
            setRatingName("C-")
        elseif ratingPercent > 0.1 then
            setRatingName("Suicide!")
        elseif ratingPercent == 0.0 then
            setRatingName("Suicide!")
        end
    else
        setRatingName(nil)
    end
end

function setRatingName(newRating)
    local score = getProperty("songScore")
    local songMisses = getProperty("songMisses")
    local ratingPercent = getProperty("ratingPercent")
    local ratingFC = getProperty("ratingFC")

    local ratingDetails = ""

    if ratingPercent and ratingPercent ~= nil then
        if getPropertyFromClass("Highscore", "floorDecimal") then
            local percentFormatted = getPropertyFromClass("Highscore", "floorDecimal", ratingPercent * 100, 2)
            ratingDetails = " (" .. percentFormatted .. "%) - " .. ratingFC
        else
            ratingDetails = " (" .. math.floor(ratingPercent * 100) .. "%) - " .. ratingFC
        end
    end

    setProperty("scoreTxt.text", "Score: " .. score .. " | Misses: " .. songMisses .. " | Rating: " .. newRating .. ratingDetails)
end