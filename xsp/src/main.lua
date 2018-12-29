init("0", 1);
ret = getLocalInfo()
local bb = require("badboy")
bb.loaduilib()
local json = bb.getJSON()


ret,results = showUI('ui.json')
--content = getUIContent("ui.json")   --获得文件ui.json的内容
--lua_value = json.decode(content)   --对获取到的json字符串解码


function tap(x, y)
    touchDown(0, x, y);
    mSleep(50);
    touchUp(0, x, y);
end

function doubleTap(x, y)
	tap(x,y)
	mSleep(50);
	tap(x,y)
end

if( ret == 0 )
then
    sysLog("exit")
end

sysLog(json.encode(results))



--iphonex
-- for function0
function stateJudge0()

	stat = "normal_state"

	x, y = findMultiColorInRegionFuzzy(0xfffbc5,"-33|-40|0xfffbc6,25|-40|0xfffbc6,-50|46|0xfff9c7,9|47|0xfffbc7", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "fight_counting"
		return stat, x, y
	end
	
	
	x, y = findMultiColorInRegionFuzzy(0xffffe8,"-18|25|0xefd26a,-19|74|0xf0d56b,36|9|0xc44d36", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "fighting_light"
		return stat, x, y
	end


	x, y = findMultiColorInRegionFuzzy(0xcbb390,"-25|43|0x5a423d,14|44|0x7f5b52,-13|104|0xe2d9ca,26|105|0xcfc7ba", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "fighting_gray"
		return stat, x, y
	end

	x, y = findMultiColorInRegionFuzzy(0x864517,"80|-32|0xc57821,72|28|0x6c3812,167|-1|0x874517,63|-1|0xac9175,101|-2|0xbba288", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "diaglog1"
		return stat, x, y
	end
	
	
	x, y = findMultiColorInRegionFuzzy(0x854517,"86|-29|0xc1731f,83|25|0x6d3913,174|6|0x7f4115,29|3|0x653b19,147|3|0xd8c1a4", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "diaglog2"
		return stat, x, y
	end


	--退出登录状态，确定按钮
	x, y = findMultiColorInRegionFuzzy(0x824416,"72|-29|0xbc6d1d,68|26|0x6b3712,132|1|0x814315,49|-1|0x603918,87|2|0xcdb393", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "diaglog3"
		return stat, x, y
	end
	
	--副本确认
	x, y = findMultiColorInRegionFuzzy(0x844417,"79|-31|0xc37520,82|26|0x6c3813,160|0|0x854417,48|0|0x9a7b5d,68|1|0xbea386,100|12|0xe0c29b", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "fubendiaglog"
		return stat, x, y
	end
	
	--按钮确定，判定域太广，发送按钮也进来了
	--[[
	x, y = findMultiColorInRegionFuzzy(0x824315,"67|-32|0xc1721e,62|23|0x6c3813,130|-2|0x854517", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "diaglog4"
		return stat, x, y
	end
	--]]
	
	
	--奖励按钮点击
	x, y = findMultiColorInRegionFuzzy(0xb3631c,"100|1|0xb1621b,10|39|0x6c3812,99|40|0x6e3913,12|21|0x815835,28|20|0xd4bc9f", 95, 0, 0, 2435, 1124, 0, 0)
	if x > -1 then
		stat = "diaglog5"
		return stat, x, y
	end
	
	
	return stat, -1, -1
end


function stateJudgesmoba()

    local stat = "smoba_normal"
	local x = -1
	local y = -1
	
	x, y = findMultiColorInRegionFuzzy(0xde9325,"-26|-21|0xd18a2f,66|-29|0xe4a730,64|27|0xecaa1f,137|2|0xd58421,157|29|0xd67b15,15|-2|0xffffff,52|1|0xffffff,70|0|0xffffff", 95, 1000, 600, 1250, 749, 0, 0)
	if x > -1 then
		return "smoba_fight_again", x, y
	end
	
	x, y = findMultiColorInRegionFuzzy(0xd28e31,"48|28|0xe69d24,97|55|0xefb01f,93|-2|0xe3a731,177|58|0xdf9b19", 90, 896, 576, 1134, 683, 0, 0)
	if x > -1 then
		return "smoba_start", x, y
	end

	x, y = findMultiColorInRegionFuzzy(0x3c4f90,"9|0|0x3c4e8f,16|0|0x3c4e8e,25|0|0x3c4d8c", 95, 0, 600, 333, 749, 0, 0)
	if x > -1 then
		return "smoba_reading", x, y
	end
		
	x, y = findMultiColorInRegionFuzzy(0xe19414,"34|17|0xe79a1c,67|-4|0xe9ad21,62|33|0xeaa821,124|28|0xce7015", 95, 1163, 10, 1329, 84, 0, 0)
	if x > -1 then
		return "smoba_story_yellow", x, y
	end
		
	x, y = findMultiColorInRegionFuzzy(0x339dd4,"-29|-1|0x3579bb,35|-18|0x39acda,30|19|0x37b1e2,65|3|0x2f82c7,87|1|0x2f67a6", 95, 1000, 0, 1333, 100, 0, 0)
	if x > -1 then
		return "smoba_story_blue", x, y
	end
		
	x, y = findMultiColorInRegionFuzzy(0x25687f,"-16|11|0x3d778b,1|18|0x299cc7,3|28|0x219ec8,18|17|0x2da3c9,20|1|0x1575a2", 95, 1000, 0, 1333, 100, 0, 0)
	if x > -1 then
		return "smoba_not_auto", x, y
	end
		
	x, y = findMultiColorInRegionFuzzy(0x3bb7d1,"0|-14|0x2ecdec,16|-11|0x1db0cc,20|6|0x1e87ab,35|13|0x289bd0,42|16|0x185c9c,45|-21|0x185c9c,1|-18|0x1870b0,0|27|0x185c9c", 95, 1000, 0, 1333, 100, 0, 0)
	if x > -1 then
		return "smoba_auto", x, y
	end
		
	x, y = findMultiColorInRegionFuzzy(0xffffff,"-8|6|0xf8fafb,-9|14|0xffffff,1|15|0xffffff,10|14|0xffffff,10|10|0xffffff,33|9|0xffffff,168|17|0xffffff", 95, 500, 680, 800, 749, 0, 0)
	if x > -1 then
		return "smoba_close_waiting_click", x, y
	end
		

	
	return stat, x, y
	
end


function workloop()
	bb.loadluasocket()
	local socket = bb.socket
	local function sleep(sec)
		socket.select(nil,nil,sec);
	end
	--local t0 = socket.gettime()
	
	
	while (true)
	do
		

		--0功能 弹窗处理
		if (string.find(results.functionType, "0") ~= nil)
		then
			sysLog("0")
			local stat, x, y = stateJudge0()
			sysLog(stat)

			
			--确定
			if (stat == "diaglog1")
			then
				tap(x, y)
			end
			
			--登录列表
			if (stat == "diaglog2")
			then
				tap(x, y)
			end
			
			--退出登录状态
			if (stat == "diaglog3")
			then
				tap(x, y)
			end
			
			--奖励确认
			if (stat == "diaglog5")
			then
				tap(x, y)
			end
		end
		
		
		--1号功能 魔力免3秒
		if (string.find(results.functionType, "1") ~= nil)
		then
			sysLog("1")
			local stat, x, y = stateJudge0()
			sysLog(stat)
			
			if (stat == "fight_counting")
			then
				doubleTap(2200, 1000)  --iphonex 自动按钮
			end
			
		end
		
		--2功能 副本确定
		if (string.find(results.functionType, "2") ~= nil)
		then
			sysLog("2")
			local stat, x, y = stateJudge0()
			sysLog(stat)
			
			if (stat == "fubendiaglog")
			then
				tap(x, y)
			end
			
		end	
			
		--3功能 农药自动挂金币
		if (string.find(results.functionType, "3") ~= nil)
		then
			sysLog("3")
			local stat, x, y = stateJudgesmoba()
			sysLog(stat)
		
			if (stat == "smoba_start")
			then
				tap(x, y)
				sleep(3)
			end
			
			if (stat == "smoba_fight_again")
			then
				sleep(1)
				tap(x, y)
				sleep(3)
			end
			
			if (stat == "smoba_story_yellow")
			then
				tap(x, y)
			
			end

			if (stat == "smoba_story_blue")
			then
				tap(x, y)
			
			end
			
			if (stat == "smoba_not_auto")
			then
				tap(x, y)
	
			end
			if (stat == "smoba_close_waiting_click")
			then
				tap(x, y)
				sleep(0.5)
			end
			
		end
		
		sleep(0.5);
	end
end


workloop()


-- double click 2200,1000