require ("Point");
require ("PointProcessing");
require("DistToExitComporator");
require("MazeUtility");
require('TableUtility');

os.execute("chcp 65001 > nul");

local openPoints = {};
local closePoints = {};
local exit = {};
setmetatable(exit, {__index = Point});

print("-----------Введите количество строк в лабиринте---------------");
local rows = tonumber(io.read());
print("----------- ----------Введите лабиринт------------------------");
local maze = {};

ReadMaze(maze, exit, rows, openPoints);
if not IsMazeValid(openPoints, exit) then
    return;
end
openPoints[1]:DistToExit(exit);

while not IsListContainsPoint(closePoints, exit) do
    if #openPoints == 0 then
        print("[-----Нет пути до выхода-----]");
        return;
    end
    CheckOpenPoint(openPoints, closePoints, #maze[1], rows, exit, maze);
end

TraceWayInMaze(maze, closePoints);

PrintMaze(maze);

