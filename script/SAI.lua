function GetMovePoint(x, y, flag)
  local point = 0
  local wofang = WAR.Person[WAR.CurID]["我方"]
  local movearray = MY_CalMoveStep(x, y, 9, 1)
  for i = 1, 9 do
    local step_num = movearray[i].num
    if step_num ~= nil then
    	if step_num == 0 then
    		break;
    	end
	    for j = 1, step_num do
	      local xx = movearray[i].x[j]
	      local yy = movearray[i].y[j]
	      local v = GetWarMap(xx, yy, 2)
	      if v ~= -1 then
	        if v == WAR.CurID then
						break;
					else   
			      if WAR.Person[v]["我方"] == wofang then
			        point = point + i * 2 - 19
			      elseif WAR.Person[v]["我方"] ~= wofang then
			      
			        if flag ~= nil then
			          point = point + i - 10
				      else
				        point = point + 19 - i
				      end
				    end
				  end
		    end
	    end
    end
  end
  return point
end
function MY_CalMoveStep(x, y, stepmax, flag)
  CleanWarMap(3, 255)
  local steparray = {}
  for i = 0, stepmax do
    steparray[i] = {}
    steparray[i].bushu = {}
    steparray[i].x = {}
    steparray[i].y = {}
  end
  SetWarMap(x, y, 3, 0)
  steparray[0].num = 1
  steparray[0].bushu[1] = stepmax
  steparray[0].x[1] = x
  steparray[0].y[1] = y
  War_FindNextStep(steparray, 0, flag)
  return steparray
end

 function unnamed(kfid)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local kungfuid = JY.Person[pid]["武功" .. kfid]
  local kungfulv = JY.Person[pid]["武功等级" .. kfid]
  if kungfulv == 999 then
    kungfulv = 11
  else
    kungfulv = math.modf(kungfulv / 100) + 1
  end
  local m1, m2, a1, a2, a3, a4, a5 = refw(kungfuid, kungfulv)
  local mfw = {m1, m2}
  local atkfw = {a1, a2, a3, a4, a5}
  if kungfulv == 11 then
    kungfulv = 10
  end
  local kungfuatk = JY.Wugong[kungfuid]["攻击力" .. kungfulv]
  local atkarray = {}
  local num = 0
  CleanWarMap(4, -1)
  local movearray = War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
  WarDrawMap(1)
  ShowScreen()
  for i = 0, WAR.Person[WAR.CurID]["移动步数"] do
    local step_num = movearray[i].num
    if step_num ~= nil then
	    for j = 1, step_num do
	      local xx = movearray[i].x[j]
	      local yy = movearray[i].y[j]
	      num = num + 1
	      atkarray[num] = {}
	      atkarray[num].x, atkarray[num].y = xx, yy
	      atkarray[num].p, atkarray[num].ax, atkarray[num].ay = GetAtkNum(xx, yy, mfw, atkfw, kungfuatk)
	      
	      
	    end
    end
  end
  for i = 1, num - 1 do
    for j = i + 1, num do
      if atkarray[i].p < atkarray[j].p then
        atkarray[i], atkarray[j] = atkarray[j], atkarray[i]
      end
    end
  end
  if atkarray[1].p > 0 then
    for i = 2, num do
      if atkarray[i].p == 0 or atkarray[i].p < atkarray[1].p / 2 then
        num = i - 1
        break;
      end
    end
    for i = 1, num do
      atkarray[i].p = atkarray[i].p + GetMovePoint(atkarray[i].x, atkarray[i].y)
    end
    for i = 1, num - 1 do
      for j = i + 1, num do
        if atkarray[i].p < atkarray[j].p then
          atkarray[i], atkarray[j] = atkarray[j], atkarray[i]
        elseif atkarray[i].p == atkarray[j].p and math.random(2) > 1 then
        	atkarray[i], atkarray[j] = atkarray[j], atkarray[i]
        end
      end
    end
    for i = 2, num do
      if atkarray[i].p < atkarray[1].p *4/5 then
        num = i - 1
        break;
      end
    end
    local select = 1
    
    War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
    War_MovePerson(atkarray[select].x, atkarray[select].y)
    War_Fight_Sub(WAR.CurID, kfid, atkarray[select].ax, atkarray[select].ay)
  else
    local jl, nx, ny = War_realjl()
    --if jl == -1 then
      AutoMove()
    --end
    War_RestMenu()
  end
end


--战斗会跳出的问题
function GetAtkNum(x, y, movfw, atkfw, atk)
  local point = {}
  local num = 0
  local kind, len = movfw[1], movfw[2]
  
  if kind == 0 then
    local array = MY_CalMoveStep(x, y, len, 1)
    for i = 0, len do
      local step_num = array[i].num
      if step_num ~= nil then
        if step_num == 0 then
          break;
        end
	      for j = 1, step_num do
	        num = num + 1
	        point[num] = {array[i].x[j], array[i].y[j]}
	      end
	    end
    end
  elseif kind == 1 then
    local array = MY_CalMoveStep(x, y, len * 2, 1)
    for r = 1, len * 2 do
      for i = 0, r do
        local j = r - i
        if len < i or len < j then
          SetWarMap(x + i, y + j, 3, 255)
          SetWarMap(x + i, y - j, 3, 255)
          SetWarMap(x - i, y + j, 3, 255)
          SetWarMap(x - i, y - j, 3, 255)
        end
      end
    end
    for i = 0, len do
      local step_num = array[i].num
      if step_num ~= nil then
        if step_num == 0 then
          break;
        end
	      for j = 1, step_num do
	        if GetWarMap(array[i].x[j], array[i].y[j], 3) < 128 then
	          num = num + 1
	          point[num] = {array[i].x[j], array[i].y[j]}
	        end
	      end
	    end
    end
  elseif kind == 2 then
    if not len then
      len = 1
    end
    for i = 1, len do
      if x + i < CC.WarWidth - 1 and GetWarMap(x + i, y, 1) > 0 and CC.WarWater[GetWarMap(x + i, y, 0)] == nil then
        break;
      end
      num = num + 1
      point[num] = {x + i, y}
    end
    for i = 1, len do
      if x - i > 0 and GetWarMap(x - i, y, 1) > 0 and CC.WarWater[GetWarMap(x - i, y, 0)] == nil then
        break;
      end
      num = num + 1
      point[num] = {x - i, y}
    end
    for i = 1, len do
      if y + i < CC.WarHeight - 1 and GetWarMap(x, y + i, 1) > 0 and CC.WarWater[GetWarMap(x, y + i, 0)] == nil then
        break;
      end
      num = num + 1
      point[num] = {x, y + i}
    end
    for i = 1, len do
      if y - i > 0 and GetWarMap(x, y - i, 1) > 0 and CC.WarWater[GetWarMap(x, y - i, 0)] == nil then
        break;
      end
      num = num + 1
      point[num] = {x, y - i}
    end
  elseif kind == 3 then
    if x + 1 < CC.WarWidth - 1 and GetWarMap(x + 1, y, 1) == 0 and CC.WarWater[GetWarMap(x + 1, y, 0)] == nil then
      num = num + 1
      point[num] = {x + 1, y}
    end
    if x - 1 > 0 and GetWarMap(x - 1, y, 1) == 0 and CC.WarWater[GetWarMap(x - 1, y, 0)] == nil then
      num = num + 1
      point[num] = {x - 1, y}
    end
    if y + 1 < CC.WarHeight - 1 and GetWarMap(x, y + 1, 1) == 0 and CC.WarWater[GetWarMap(x, y + 1, 0)] == nil then
      num = num + 1
      point[num] = {x, y + 1}
    end
    if y - 1 > 0 and GetWarMap(x, y - 1, 1) == 0 and CC.WarWater[GetWarMap(x, y - 1, 0)] == nil then
      num = num + 1
      point[num] = {x, y - 1}
    end
    if x + 1 < CC.WarWidth - 1 and y + 1 < CC.WarHeight - 1 and GetWarMap(x + 1, y + 1, 1) == 0 and CC.WarWater[GetWarMap(x + 1, y + 1, 0)] == nil then
      num = num + 1
      point[num] = {x + 1, y + 1}
    end
    if x - 1 > 0 and y + 1 < CC.WarHeight - 1 and GetWarMap(x - 1, y + 1, 1) == 0 and CC.WarWater[GetWarMap(x - 1, y + 1, 0)] == nil then
      num = num + 1
      point[num] = {x - 1, y + 1}
    end
    if x + 1 < CC.WarWidth - 1 and y - 1 > 0 and GetWarMap(x + 1, y - 1, 1) == 0 and CC.WarWater[GetWarMap(x + 1, y - 1, 0)] == nil then
      num = num + 1
      point[num] = {x + 1, y - 1}
    end
    if x - 1 > 0 and y - 1 > 0 and GetWarMap(x - 1, y - 1, 1) == 0 and CC.WarWater[GetWarMap(x - 1, y - 1, 0)] == nil then
    	num = num + 1
    	point[num] = {x - 1, y - 1}
  	end
  end
  local maxx, maxy, maxnum, atknum = 0, 0, 0, 0
  

  for i = 1, num do
    atknum = GetWarMap(point[i][1], point[i][2], 4)
    
    if atknum == -1 or atkfw[1] > 9 then
      atknum = WarDrawAtt(point[i][1], point[i][2], atkfw, 2, x, y, atk)
      SetWarMap(point[i][1], point[i][2], 4, atknum)
    end
    if atknum~= nil and maxnum < atknum then
      maxnum, maxx, maxy = atknum, point[i][1], point[i][2]
    end
  end
  
  return maxnum, maxx, maxy
end

function AutoMove()
  local x, y = nil, nil
  local minDest = math.huge
  local enemyid=War_AutoSelectEnemy()   --选择最近敌人

	War_CalMoveStep(WAR.CurID,100,0);   --计算移动步数 假设最大100步

	for i=0,CC.WarWidth-1 do
     for j=0,CC.WarHeight-1 do
				local dest=GetWarMap(i,j,3);
        if dest <128 then
          local dx=math.abs(i-WAR.Person[enemyid]["坐标X"])
          local dy=math.abs(j-WAR.Person[enemyid]["坐标Y"])
          if minDest>(dx+dy) then        --此时x,y是距离敌人的最短路径，虽然可能被围住
            minDest=dx+dy;
            x=i;
            y=j;
          elseif minDest==(dx+dy) then
            if Rnd(2)==0 then
                x=i;
                y=j;
            end
          end
        end
    end
	end

	if minDest<math.huge then   --有路可走
	    while true do    --从目的位置反着找到可以移动的位置，作为移动的次序
				local i=GetWarMap(x,y,3);
			if i<=WAR.Person[WAR.CurID]["移动步数"] then
				break;
			end

			if GetWarMap(x-1,y,3)==i-1 then
				x=x-1;
			elseif GetWarMap(x+1,y,3)==i-1 then
				x=x+1;
			elseif GetWarMap(x,y-1,3)==i-1 then
				y=y-1;
			elseif GetWarMap(x,y+1,3)==i-1 then
				y=y+1;
			end
	    end
	  War_MovePerson(x,y);    --移动到相应的位置
  end
end

