require("Point");
require("TableUtility");
function CheckPointCords(pointX, pointY, xLen, yLen)
    if pointX >= 1 and pointX <= xLen then
        if pointY >=1 and pointY <=yLen then
            return true;
        end
    end
    return false;
end

function CheckPointState(pointX, pointY, maze)
    if maze[pointY][pointX] == "_" or 
    maze[pointY][pointX] == "F" then
        return true;
    end
    return false;
end

function IsPointCanOpen(pointX, pointY, xLen, yLen, maze, closePoints)
    if CheckPointCords(pointX, pointY, xLen, yLen) then
        if CheckPointState(pointX, pointY, maze) then
            if not IsListContainsCoords(closePoints, pointX, pointY) then
                return true;
            end           
        end
    end
    return false;
end

function InsertChecedPoint(pointX, pointY, parentPoint, openPoints, closePoints, xLen, yLen, exit, maze)
    if IsPointCanOpen(pointX, pointY, xLen, yLen, maze, closePoints) then
        table.insert(openPoints, CreateNewPoint(pointX, pointY, parentPoint, exit));
    end
end

function AddNearPointToOpenList (point, openPoints, closePoints, xLen, yLen, exit, maze)
    InsertChecedPoint(point.x - 1, point.y, point, openPoints, closePoints, xLen, yLen, exit, maze)
    InsertChecedPoint(point.x + 1, point.y, point, openPoints, closePoints, xLen, yLen, exit, maze)
    InsertChecedPoint(point.x, point.y - 1, point, openPoints, closePoints, xLen, yLen, exit, maze)
    InsertChecedPoint(point.x, point.y + 1, point, openPoints, closePoints, xLen, yLen, exit, maze)
end

function CheckOpenPoint(openPointList, closePoints, xLen, yLen, exit, maze)
    AddNearPointToOpenList(openPointList[1], openPointList, closePoints, xLen, yLen, exit, maze);
    table.insert(closePoints, openPointList[1]);
    table.remove(openPointList, 1);
    table.sort(openPointList, DistExitComp);
end