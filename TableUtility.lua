function IsListContainsPoint (list, searchPoint)
    for index, value in ipairs(list) do
        if searchPoint.x == value.x and searchPoint.y == value.y then
            return true;
        end
    end
    return false;
end

function IsListContainsCoords (list, xCord, yCord)
    for index, value in ipairs(list) do
        if xCord == value.x and yCord == value.y then
            return true;
        end
    end
    return false;
end