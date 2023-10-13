function ReadMaze(maze, exitPoint, yLen, openPoints)
    for i = 1, yLen, 1 do
        local t = {};
        table.insert(maze, t);
        local inputStr = io.read();
        for j = 1, string.len(inputStr), 1 do
            table.insert(maze[i], string.sub(inputStr, j, j));
            if maze[i][j] == 'S' then
                local p = {}
                setmetatable(p, {__index = Point});
                p.x = j;
                p.y = i;
                table.insert(openPoints, p);
            end
            if maze[i][j] == 'F' then
                exitPoint.x = j;
                exitPoint.y = i;
                exitPoint.distToExit = 0;
            end
        end
    end
end

function PrintMaze(maze)
    print();
    print("+++++[Путь к выходу]+++++");
    for index, value in ipairs(maze) do
        local outStr = "";
        for index2, value2 in ipairs(maze[index]) do
            outStr = outStr..maze[index][index2];
        end
        print(outStr);
    end
end

function TraceWayInMaze(maze, closePoints)
    local parent = closePoints[#closePoints].parent;
    while parent ~= nil do
        maze[parent.y][parent.x] = '*';
        parent = parent.parent;   
    end
    maze[closePoints[1].y][closePoints[1].x] = 'S';
end

function IsMazeValid(openPoints, exitPoint)
    if #openPoints == 0 then
        print("[-----Нет старта лабиринта-----]");
        return false;
    end
    if exitPoint.x == 0 then
        print("[-----Нет выхода из лабиринта-----]");
        return false;
    end
    return true;
end