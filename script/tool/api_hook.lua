-- 需要Hook的api
-- 开启标志
local Sur_cache_open_flag = 0;

function h_lib_SaveSur(x, y, x1, y1)
    if Sur_cache_open_flag == 1 then
        return lib.SaveSur(x, y, x1, y1);
    else
        return 0;
    end
end

function h_lib_LoadSur(surid, x, y)
    if Sur_cache_open_flag == 1 then
        return lib.LoadSur(surid, x, y);
    else
        return 0;
    end
end

function h_lib_FreeSur(surid)
    if Sur_cache_open_flag == 1 then
        return lib.FreeSur(surid);
    else
        return 0;
    end
end
