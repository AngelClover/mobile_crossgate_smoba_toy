init("0", 1);
ret = getLocalInfo()
local bb = require("badboy")
bb.loaduilib()
local json = bb.getJSON()


ret,results = showUI('ui.json')
--content = getUIContent("ui.json")   --获得文件ui.json的内容
--lua_value = json.decode(content)   --对获取到的json字符串解码


bb.loadluasocket()
local socket = bb.socket
local function sleep(sec)
	socket.select(nil,nil,sec);
end

function mylog(x, y, st, prefix)
	--[[
	res = tostring(x)
	res = res + "," + tostring(y)
	res = res + "," + st
	sysLog(res)
	--]]
	res = string.format("%s:%d,%d,%s", prefix, x, y, st)
	sysLog(res)
end

function tap(x, y, stat, deb)
    if deb then
		mylog(x, y, stat, "tap")
	end
    touchDown(0, x, y);
    mSleep(50);
    touchUp(0, x, y);
end

function doubleTap(x, y, stat)
    mylog(x, y, stat, "doubetap")
	tap(x,y,stat, false)
	mSleep(50);
	tap(x,y,stat, false)
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
	
	--副本确认, 650,750  1200,1000
	x, y = findMultiColorInRegionFuzzy(0x844417,"79|-31|0xc37520,82|26|0x6c3813,160|0|0x854417,48|0|0x9a7b5d,68|1|0xbea386,100|12|0xe0c29b", 95, 650, 750, 1200, 1000, 0, 0)
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


function tapsleep(x, y, bigstat, stat, sleeptime)
	tap(x, y, "tapsleep", false)
	sysLog(string.format("tap:%d,%d %s-%s sleep:%f",x,y,bigstat,stat,sleeptime))
	sleep(sleeptime)

end






function tapPets(bigstat, sleeptime)
	tapsleep(2000, 50, bigstat, "宠物", sleeptime)
end

function tapPetState(targetStat, bigstat, sleeptime)

	--select which pet
	y = 1000
	x = -1
	if targetStat == "待机" then
		x = 1085
	end
	if targetStat == "出战" then
		x = 960
	end
	if targetStat == "休息" then
		x = 1220
	end
	if x == -1 then
		return
	end
	
	tapsleep(x, y, bigstat, targetStat, sleeptime)
end


function tapclose(bigstat, sleeptime)
	x, y = findMultiColorInRegionFuzzy(0xe0cda6,"-35|-1|0x7e4329,0|-28|0xc0763d,-4|30|0x6d3a24,28|8|0x784027,-10|-9|0xe7d9ba,-12|9|0xcab487,8|-8|0x716756,9|11|0xd6be8a", 95, 2045, 13, 2427, 115, 0, 0)
	if x > -1 then
		tapsleep(x, y, bigstat, "close", sleeptime)
	end
end

function tapactivities(bigstat, sleeptime)
	x, y = findMultiColorInRegionFuzzy(0x8f6e3a,"-25|2|0xcd3c17,-39|-23|0xf9998f,-12|-35|0xf7e984,5|-40|0xcd4a2e,19|-27|0xe7694a,20|15|0xb37335,-12|43|0x4a3c33,15|42|0x3b2f27", 95, 89, 173, 408, 589, 0, 0)
	if x > -1 then
		tapsleep(x, y, bigstat, "activities", sleeptime)
	end
end 

function tapdragon(bigstat, sleeptime)
	x, y = findMultiColorInRegionFuzzy(0x8a4717,"36|-5|0xcab59e,64|0|0xb09578,115|3|0x854416,-493|26|0xcf6b5e,-480|-10|0xba6648,-311|39|0xffd100,-221|38|0xb49d74,-132|40|0x5bb7ce", 95, 321, 290, 1907, 1013, 0, 0)
	if x > -1 then
		tapsleep(x, y, bigstat, "tapdragon", sleeptime)
	end
end

function findflag()
	
	
	x, y = findMultiColorInRegionFuzzy(0xfdecbb,"-6|-7|0xfdebba,-15|7|0xb83a0e,-9|16|0xdf5f1a,14|10|0xb84910,56|3|0xe3cc9f,80|2|0xac9a77", 95, 358, 265, 704, 367, 0, 0)
	if x > -1 then
		return true
	end
	return false
end

function tapteam(bigstat, sleeptime)
	x, y = findMultiColorInRegionFuzzy(0x0f1316,"13|-23|0x827d93,33|9|0x5c5469,-28|18|0x696370,-25|-8|0x5c5770,-17|48|0xc2b89e,16|53|0x57483a", 95, 1641, 934, 2211, 1099, 0, 0)
	if x > -1 then
		tapsleep(x, y, bigstat, "", sleeptime)
	end
end

function tapsetteam(bigstat, sleeptime)
	--如果在队伍中，点这里可以暂离，回归
	tapsleep(1600, 1000, bigstat, "", sleeptime)
end

function tapleaveteam(bigstat, sleeptime)
	tapsleep(1900, 1000, bigstat, "", sleeptime)
end

function LifeJudgeUnit(x1,y1,x2,y2)
	local x, y
	x, y = findMultiColorInRegionFuzzy(0xd20303,"19|3|0xe80909,45|3|0xe80909,83|2|0xe30c0c,97|2|0xe30c0c", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 100
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919,-62|0|0xe80909,-80|-2|0xdb0808,-93|-1|0xe30c0c,-102|1|0xec0e0e", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 90
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919,-62|0|0xe80909,-80|-2|0xdb0808,-93|-1|0xe30c0c", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 80
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919,-62|0|0xe80909,-80|-2|0xdb0808", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 60
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919,-62|0|0xe80909,-80|-2|0xdb0808", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 60
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919,-62|0|0xe80909", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 50
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909,-41|2|0xf11919", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 40
	end
	x, y = findMultiColorInRegionFuzzy(0xe80808,"-18|0|0xe80909", 95, x1,y1,x2,y2, 0, 0)
	if x > -1 then
		return 20
	end
	return 0
end

function LifeJudge()
	local x, y
	--human
	x = LifeJudgeUnit(2081, 14, 2206, 34)
	
	--pet
	y = LifeJudgeUnit(1826,10,1953,36)
	
	return x,y
end



function thereIsLife()
	local x, y
	x, y = LifeJudge()
	sysLog(string.format("there is life:%d pet:%d", x, y))
	if x > 0 then
		return true
	end
	sysLog("there is no life")
	return false
end

function failureIcontap()
	x, y = findMultiColorInRegionFuzzy(0xd23e0d,"-15|-17|0xe95a13,-17|16|0xc22c09,12|-16|0xeb5a12,14|17|0xc42c09", 95, 1625, 219, 1866, 421, 0, 0)
	if x > -1 then
		tapsleep(x, y, "fight failure", "x", 1)
		return true
	end
	return false
end

function tapOptions(nd, bigstat, sleeptime)
	tapsleep(2180,760,bigstat,"战斗", 1)

end

function workloop()
	
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
				tap(x, y, stat, true)
			end
			
			--登录列表
			if (stat == "diaglog2")
			then
				tap(x, y, stat, true)
			end
			
			--退出登录状态
			if (stat == "diaglog3")
			then
				tap(x, y, stat, true)
			end
			
			--奖励确认
			if (stat == "diaglog5")
			then
				tap(x, y, stat, true)
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
				doubleTap(2200, 1000, stat)  --iphonex 自动按钮
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
				tap(x, y, stat, true)
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
				tap(x, y, stat, true)
				sleep(3)
			end
			
			if (stat == "smoba_fight_again")
			then
				sleep(1)
				tap(x, y, stat, true)
				sleep(3)
			end
			
			if (stat == "smoba_story_yellow")
			then
				tap(x, y, stat, true)
			
			end

			if (stat == "smoba_story_blue")
			then
				tap(x, y, stat, true)
			
			end
			
			if (stat == "smoba_not_auto")
			then
				tap(x, y, stat, true)
	
			end
			if (stat == "smoba_close_waiting_click")
			then
				tap(x, y, stat, true)
				sleep(0.5)
			end
			
		end
		
		--4功能 溜达刷怪
		if (string.find(results.functionType, "4") ~= nil)
		then
			for i = 0,3 do
				tap(500, 600)
				sleep(0.5)
			end
			for i = 0,3 do
				tap(1800, 600)
				sleep(0.5)
			end
		end
		
		--5功能 自动进牛2
		if (string.find(results.functionType, "5") ~= nil)
		then
			while true do
				--确定自己在normal界面
				tapsleep(1260,1033,"牛2","挑战", 0.5)
			
				--挑战副本
				tapsleep(1260,900,"牛2","挑战副本", 0.5)
			
				--逆袭的牛鬼
				tapsleep(600,500,"牛2","逆袭的牛鬼", 0.5)
				
				--牛姬红叶
				--tap(1250,450)
				--sleep(0.5)
				--进入副本
				tapsleep(1900,1000,"牛2","进入副本", 2)
				
				--前往
				tapsleep(2160,450,"牛2","前往", 10)
		
				--duihua
				for i=0,2 do
					tapsleep(2000, 900,"牛2","duihua", 1)
				end
				--让我们出发吧
				tapsleep(2180,760,"牛2","让我们出发吧", 1)
				--now，在副本里了
				--we need fight
				sleep(1)
				
				while thereIsLife() or failureIcontap() do
					for i = 0,3 do
						tap(500, 600)
						sleep(0.5)
					end
					for i = 0,3 do
						tap(1800, 600)
						sleep(0.5)
					end
				end
				sleep(3)
				failureIcontap()
				--出去
				tapsleep(2230, 610,"牛2","离开", 1)
				--ok
			end
		end
		
		--11功能 小龙逃跑
		if (string.find(results.functionType, "11") ~= nil)
		then
			--be sure in normal
			--1. change pets be home
				--tapsleep(2000, 50, "龙跑", "宠物", 1)
				tapPets("龙跑1", 1)
				--tapsleep(1085, 1016, "龙跑", "待机", 1)
				tapPetState("待机", "龙跑1", 1)
				tapclose("龙跑1", 1)
				
				
			--1.5 set a team
				if findflag() == false then
					tapteam("龙跑2", 1)
					tapsetteam("龙跑2", 1)
					tapclose("龙跑2", 1)
				end
			--2. select the acts
				tapactivities("龙跑2", 1)
				tapdragon("龙跑2", 10)
			--2.5 diaglog tap first option
				tapOptions(1, "龙跑2.5", 1)
			--3. fight
				sleep(0.5)
				while checkTheDragonLivePoint() do
					changeToNonAutoState()
					tapRun("龙跑3", 1)
					tapRun("龙跑4", 1)
					waitFigntOnesection()
				end
			--4. call out the pets
				tapPets("龙跑4", 1)
				tapPetState("出战", "龙跑4", 1)
			
		
		end
		
		sleep(0.5);
	end
end


workloop()


-- double click 2200,1000