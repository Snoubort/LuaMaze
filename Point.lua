Point = {};

Point.x = 0;
Point.y = 0;
Point.parent = nil;
Point.distToExit = 0;

function Point:DistToExit(exitPoint)
    self.distToExit = math.sqrt((exitPoint.x - self.x)^2 + (exitPoint.y - self.y)^2);
end

function CreateNewPoint(pointX, pointY, parent, exitPoint)
    local newPoint = {}
    setmetatable(newPoint, {__index = Point});
    newPoint.y = pointY;
    newPoint.x = pointX;
    newPoint.parent = parent;
    newPoint:DistToExit(exitPoint);
    return newPoint;
end