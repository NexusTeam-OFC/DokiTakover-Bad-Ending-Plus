local menuOpen = false
local selected = 1
local canPress = true
local inputCooldown = false
local baseMenuX = 0
local page = 1
local scanlineEnabled = false
local maxPages = 2
local collorEnabled = false
local baseMenuY = 0
local sillySayo = false
local sensitiveEnabled = false
local performanceEnabled = false
local fpsOptions = {30, 60, 120, 999}
local fpsIndex = 2
local languages = {"PT-BR", "EN"}
local languageIndex = 1

function onCreate()
makeLuaSprite('blurBG', 'Config/ddlcpoc', 0, 0)
setObjectCamera('blurBG', 'other')
screenCenter('blurBG')
setProperty('blurBG.visible', false)
addLuaSprite('blurBG', false)

makeLuaSprite('collorFX', '', 0, 0)
makeGraphic('collorFX', 1280, 720, 'FF8CB3')
setObjectCamera('collorFX', 'other')
setProperty('collorFX.alpha', 0)
setProperty('collorFX.blend', 'add')
addLuaSprite('collorFX', true)

makeLuaSprite('ddlc1', 'Config/ddlcplusFondo', 0, 0)
setObjectCamera('ddlc1', 'other')
addLuaSprite('ddlc1', false)

makeLuaSprite('ddlc2', 'Config/ddlcplusFondo', 1280, 0)
setObjectCamera('ddlc2', 'other')
addLuaSprite('ddlc2', false)

setProperty('ddlc1.visible', false)
setProperty('ddlc2.visible', false)

makeLuaSprite('configBG', 'Config/ConfigMenu', 0, 0)
makeLuaSprite('configBG_pt', 'Config/ConfigMenu_PT', 0, 0)
setObjectCamera('configBG', 'other')
scaleObject('configBG', 0.8, 0.8)
screenCenter('configBG')
baseMenuX = getProperty('configBG.x')
baseMenuY = getProperty('configBG.y')
setProperty('configBG.alpha', 0)
setProperty('configBG.visible', false)
addLuaSprite('configBG', true)

makeLuaSprite('option_seer', 'Config/option_seer', 0, 0)
setObjectCamera('option_seer', 'other')
scaleObject('option_seer', 0.5, 0.5)
setProperty('option_seer.flipX', true)
setProperty('option_seer.visible', false)
addLuaSprite('option_seer', true)

makeLuaSprite('scan1', 'Config/Scanlines', 0, 0)
setObjectCamera('scan1', 'other')
addLuaSprite('scan1', false)

makeLuaSprite('scan2', 'Config/Scanlines', 0, -720)
setObjectCamera('scan2', 'other')
addLuaSprite('scan2', false)

setProperty('scan1.visible', false)
setProperty('scan2.visible', false)

makeLuaSprite('flash', '', 0, 0)
makeGraphic('flash', 1280, 720, 'FFFFFF')
setObjectCamera('flash', 'other')
setProperty('flash.alpha', 0)
addLuaSprite('flash', true)

setObjectCamera('configBG_pt', 'other')
scaleObject('configBG_pt', 0.8, 0.8)
setProperty('configBG_pt.visible', false)
screenCenter('configBG_pt')
addLuaSprite('configBG_pt', true)

makeLuaSprite('tv_low', 'Config/Option6/LowMode-Scaline', 0, 0)
setObjectCamera('tv_low', 'other')
addLuaSprite('tv_low', true)
scaleObject('tv_low', 2, 2)
setProperty('tv_low.antialiasing', false)
screenCenter('tv_low')
setProperty('tv_low.visible', false)

makeLuaSprite('tv_scan', 'Config/Option6/scanlines', 0, 0)
setObjectCamera('tv_scan', 'other')
addLuaSprite('tv_scan', true)
scaleObject('tv_scan', 2, 2)
setProperty('tv_scan.antialiasing', false)
setProperty('tv_scan.x', 0)
setProperty('tv_scan.y', 0)
setProperty('tv_scan.visible', false)
makeLuaSprite('tv_scan2', 'Config/Option6/scanlines', 0, -720)
setObjectCamera('tv_scan2', 'other')
addLuaSprite('tv_scan2', true)
scaleObject('tv_scan2', 2, 2)
setProperty('tv_scan2.antialiasing', false)
setProperty('tv_scan2.visible', false)


makeLuaSprite('tv_overlay', 'Config/Option6/scanlines-overlay', 0, 0)
setObjectCamera('tv_overlay', 'other')
addLuaSprite('tv_overlay', true)
scaleObject('tv_overlay', 2, 2)
setProperty('tv_overlay.antialiasing', false)
screenCenter('tv_overlay')
setProperty('tv_overlay.visible', false)

makeAnimatedLuaSprite('langLoader', 'Config/LanguageLoader/LanguageLoad', 0, 0)
setObjectCamera('langLoader', 'other')
addAnimationByPrefix('langLoader', 'en', 'lang_en', 10, true)
addAnimationByPrefix('langLoader', 'br', 'lang_br', 10, true)
addLuaSprite('langLoader', true)
setProperty('langLoader.visible', false)
setProperty('langLoader.alpha', 1)

makeLuaText('menuTitle', '', 600, 0, 0)
setTextFont('menuTitle', 'riffic.ttf')
setTextSize('menuTitle', 40)
setTextAlignment('menuTitle', 'center')
setObjectCamera('menuTitle', 'other')
addLuaText('menuTitle')
setProperty('menuTitle.visible', false)

local texts = {
"1 - Content Filter",
"2 - Performance Mode",
"3 - FPS Cap Selector",
"4 - Language",
"5 - Silly Sayo"
}

for i = 1, 5 do
makeLuaText('opt'..i, texts[i], 400, 0, 0)
setTextFont('opt'..i, 'riffic.ttf')
setTextSize('opt'..i, 32)
setObjectCamera('opt'..i, 'other')
addLuaText('opt'..i)
setProperty('opt'..i..'.visible', false)
end

makeLuaText('captionText', '', 400, 0, 0)
setTextFont('captionText', 'vcr.ttf')
setTextSize('captionText', 24)
setTextAlignment('captionText', 'center')
setObjectCamera('captionText', 'other')
screenCenter('captionText', 'x')
setProperty('captionText.visible', false)
addLuaText('captionText')

makeAnimatedLuaSprite('bf_sens', 'Config/ContentFilter/bf', 0, 0)
addAnimationByPrefix('bf_sens', 'idle', 'BFPoemIdle', 24, true)
setObjectCamera('bf_sens', 'game')
setProperty('bf_sens.visible', false)
scaleObject('bf_sens', 2, 2)
addLuaSprite('bf_sens', true)

makeAnimatedLuaSprite('dad_sens', 'Config/ContentFilter/dad', 0, 0)
addAnimationByPrefix('dad_sens', 'idle', 'SayoPoemIdle', 24, true)
setObjectCamera('dad_sens', 'game')
setProperty('dad_sens.visible', false)
scaleObject('dad_sens', 2, 2)
addLuaSprite('dad_sens', true)
end

function playLanguageTransition(oldLang, newLang)

	canPress = false
	inputCooldown = true

	setProperty('langLoader.visible', true)
	setProperty('langLoader.alpha', 1)

	if oldLang == 1 and newLang == 2 then
		objectPlayAnimation('langLoader', 'en', true)

	elseif oldLang == 2 and newLang == 1 then
		objectPlayAnimation('langLoader', 'br', true)
	end

	runTimer('hideLangLoader', 7)
end

function setFPSCap(value)
runHaxeCode([[
FlxG.updateFramerate = ]]..value..[[;
FlxG.drawFramerate = ]]..value..[[;
]])
end

function onCreatePost()
sillySayo = runHaxeCode([[return FlxG.save.data.sillySayo;]])
if sillySayo == nil then sillySayo = false end

runHaxeCode([[FlxG.save.data.sillySayo = ]]..tostring(sillySayo)..[[; FlxG.save.flush();]])

fpsIndex = runHaxeCode([[return FlxG.save.data.fpsIndex;]])
fpsIndex = tonumber(fpsIndex) or 2

setFPSCap(fpsOptions[fpsIndex])

languageIndex = runHaxeCode([[return FlxG.save.data.languageIndex;]])
languageIndex = tonumber(languageIndex) or 1
updateLanguage()
updateMenuLanguageBG()

sensitiveEnabled = runHaxeCode([[return FlxG.save.data.sensitiveEnabled;]])
if sensitiveEnabled == nil then sensitiveEnabled = false end

performanceEnabled = runHaxeCode([[return FlxG.save.data.performanceEnabled;]])
if performanceEnabled == nil then performanceEnabled = false end

setFPSCap(fpsOptions[fpsIndex])
setPerformanceMode(performanceEnabled)

collorEnabled = runHaxeCode([[return FlxG.save.data.collorEnabled;]])
if collorEnabled == nil then collorEnabled = false end

scanlineEnabled = runHaxeCode([[return FlxG.save.data.scanlineEnabled;]])
if scanlineEnabled == nil then scanlineEnabled = false end

setObjectOrder('collorFX', 880)
setObjectOrder('tv_low', 890)
setObjectOrder('tv_scan', 900)
setObjectOrder('tv_scan2', 901)
setObjectOrder('tv_overlay', 902)
applyScanlines()
applyCollorPlus()
applyCollor()
callOnLuas('setSillySayo', {sillySayo})
setObjectOrder('langLoader', 9999)
end

function flashWhite()
setProperty('flash.alpha', 1)
doTweenAlpha('flashFade', 'flash', 0, 0.25, 'linear')
end

function applyScanlines()

    setProperty('tv_low.visible', false)
    setProperty('tv_scan.visible', false)
    setProperty('tv_scan2.visible', false)
    setProperty('tv_overlay.visible', false)

    if not scanlineEnabled then
        return
    end

    if performanceEnabled then
        setProperty('tv_low.visible', true)

    else
        setProperty('tv_scan.visible', true)
        setProperty('tv_scan2.visible', true)
        setProperty('tv_overlay.visible', true)
    end
end

function applyCollor()

    if collorEnabled then
        doTweenAlpha('collorOn', 'collorFX', 0.12, 0.3, 'linear')
    else
        doTweenAlpha('collorOff', 'collorFX', 0, 0.3, 'linear')
    end
end

function updateLanguage()
if languageIndex == 1 then
setTextString('opt1', "1 - Content Filter")
setTextString('opt2', "2 - Performance Mode")
setTextString('opt3', "3 - FPS Cap Selector")
setTextString('opt4', "4 - Language")
setTextString('opt5', "5 - Silly Sayo")
else
setTextString('opt1', "1 - Filtro de Conteúdo")
setTextString('opt2', "2 - Modo Performance")
setTextString('opt3', "3 - Limite de FPS")
setTextString('opt4', "4 - Idioma")
setTextString('opt5', "5 - Sayori Bobinha")
end
end

function updateMenuLanguageBG()
if not menuOpen then
    setProperty('configBG.visible', false)
    setProperty('configBG_pt.visible', false)
    return
end

if languageIndex == 1 then
    setProperty('configBG.visible', true)
    setProperty('configBG_pt.visible', false)
else
    setProperty('configBG.visible', false)
    setProperty('configBG_pt.visible', true)
end
end

function startCooldown()
inputCooldown = true
runTimer('inputCD', 1)
end

function setMenu(bool)
menuOpen = bool

if bool then
runHaxeCode([[game.canPause = false; FlxG.sound.music.pause(); if (game.vocals != null) game.vocals.pause();]])

setProperty('ddlc1.visible', true)
setProperty('ddlc2.visible', true)
setProperty('scan1.visible', true)
setProperty('scan2.visible', true)
setProperty('blurBG.visible', true)
callOnLuas('onMenuOpen', {})
setProperty('option_seer.visible', true)
setProperty('captionText.visible', true)
setProperty('menuTitle.visible', true)
screenCenter('menuTitle', 'x')
setProperty('menuTitle.y', baseMenuY + 465)

for i = 1, 5 do setProperty('opt'..i..'.visible', true) end

setProperty('configBG.y', baseMenuY + 80)
setProperty('configBG_pt.y', baseMenuY + 80)
setProperty('configBG.alpha', 0)
setProperty('configBG_pt.alpha', 0)

-- decide qual aparece
updateMenuLanguageBG()

-- anima os dois (só um vai estar visível)
doTweenY('menuInY1', 'configBG', baseMenuY, 0.25, 'quadOut')
doTweenAlpha('menuInA1', 'configBG', 1, 0.25, 'quadOut')

doTweenY('menuInY2', 'configBG_pt', baseMenuY, 0.25, 'quadOut')
doTweenAlpha('menuInA2', 'configBG_pt', 1, 0.25, 'quadOut')
else
runHaxeCode([[game.canPause = true; FlxG.sound.music.resume(); if (game.vocals != null) game.vocals.resume();]])

doTweenY('menuOutY1', 'configBG', baseMenuY - 80, 0.2, 'quadIn')
doTweenAlpha('menuOutA1', 'configBG', 0, 0.2, 'quadIn')

doTweenY('menuOutY2', 'configBG_pt', baseMenuY - 80, 0.2, 'quadIn')
doTweenAlpha('menuOutA2', 'configBG_pt', 0, 0.2, 'quadIn')
setProperty('ddlc1.visible', false)
setProperty('menuTitle.visible', false)
setProperty('ddlc2.visible', false)
setProperty('scan1.visible', false)
callOnLuas('onMenuClose', {})
setProperty('scan2.visible', false)
setProperty('blurBG.visible', false)
setProperty('option_seer.visible', false)
setProperty('captionText.visible', false)

for i = 1, 5 do setProperty('opt'..i..'.visible', false) end
end
end

function confirmOption()
if page == 2 then

	if selected == 1 then
		scanlineEnabled = not scanlineEnabled

		runHaxeCode([[
		FlxG.save.data.scanlineEnabled = ]]..tostring(scanlineEnabled)..[[;
		FlxG.save.flush();
		]])

		applyScanlines()

		if scanlineEnabled then
			playSound('ConfigMenu/menuSelected', 1.2)
		else
			playSound('ConfigMenu/menuDeactivated', 2)
		end

		flashWhite()
elseif selected == 2 then

    collorEnabled = not collorEnabled

    runHaxeCode([[
    FlxG.save.data.collorEnabled = ]]..tostring(collorEnabled)..[[;
    FlxG.save.flush();
    ]])

    applyCollor()

    if collorEnabled then
        playSound('ConfigMenu/menuSelected', 1.2)
    else
        playSound('ConfigMenu/menuDeactivated', 2)
    end
    flashWhite()
	else
		playSound('ConfigMenu/glitch_selected', 1)
	end
	return
end

if selected == 1 then
	sensitiveEnabled = not sensitiveEnabled

	runHaxeCode([[FlxG.save.data.sensitiveEnabled = ]]..tostring(sensitiveEnabled)..[[; FlxG.save.flush();]])

	if sensitiveEnabled then
		playSound('ConfigMenu/menuSelected', 1.2)
	else
		playSound('ConfigMenu/menuDeactivated', 2)
	end

	flashWhite()

elseif selected == 2 then
	performanceEnabled = not performanceEnabled

	runHaxeCode([[FlxG.save.data.performanceEnabled = ]]..tostring(performanceEnabled)..[[; FlxG.save.flush();]])
	setPerformanceMode(performanceEnabled)
applyScanlines()

	if performanceEnabled then
		playSound('ConfigMenu/menuSelected', 1.2)
	else
		playSound('ConfigMenu/menuDeactivated', 2)
	end

	flashWhite()

elseif selected == 3 then
	fpsIndex = fpsIndex + 1
	if fpsIndex > #fpsOptions then fpsIndex = 1 end

	setFPSCap(fpsOptions[fpsIndex])

	runHaxeCode([[FlxG.save.data.fpsIndex = ]]..fpsIndex..[[; FlxG.save.flush();]])

	playSound('ConfigMenu/menuSelected', 1.2)
	flashWhite()

elseif selected == 4 then

	local oldLang = languageIndex

	languageIndex = languageIndex + 1
	if languageIndex > #languages then
		languageIndex = 1
	end

	runHaxeCode([[FlxG.save.data.languageIndex = ]]..languageIndex..[[; FlxG.save.flush();]])

	updateLanguage()
	updateMenuLanguageBG()

	playLanguageTransition(oldLang, languageIndex)

	playSound('ConfigMenu/menuSelected', 1.2)
	flashWhite()

elseif selected == 5 then
	sillySayo = not sillySayo

	runHaxeCode([[FlxG.save.data.sillySayo = ]]..tostring(sillySayo)..[[; FlxG.save.flush();]])

	callOnLuas('setSillySayo', {sillySayo})

	if sillySayo then
		playSound('ConfigMenu/menuSelected', 1.2)
	else
		playSound('ConfigMenu/menuDeactivated', 2)
	end

	flashWhite()
end
end

function onUpdate()
if scanlineEnabled and not performanceEnabled then

    setProperty('tv_scan.y', getProperty('tv_scan.y') + 1.5)
    setProperty('tv_scan2.y', getProperty('tv_scan2.y') + 1.5)

    if getProperty('tv_scan.y') >= 720 then
        setProperty('tv_scan.y', getProperty('tv_scan2.y') - 720)
    end

    if getProperty('tv_scan2.y') >= 720 then
        setProperty('tv_scan2.y', getProperty('tv_scan.y') - 720)
    end
end

if menuOpen then
setProperty('ddlc1.x', getProperty('ddlc1.x') - 1.2)
setProperty('ddlc2.x', getProperty('ddlc2.x') - 1.2)

if getProperty('ddlc1.x') <= -1280 then setProperty('ddlc1.x', 1280) end
if getProperty('ddlc2.x') <= -1280 then setProperty('ddlc2.x', 1280) end

setProperty('scan1.y', getProperty('scan1.y') + 0.5)
setProperty('scan2.y', getProperty('scan2.y') + 0.5)

if getProperty('scan1.y') >= 720 then setProperty('scan1.y', -720) end
if getProperty('scan2.y') >= 720 then setProperty('scan2.y', -720) end
end
if getPropertyFromClass('flixel.FlxG','keys.justPressed.ONE') and not inputCooldown then
setMenu(not menuOpen)
startCooldown()
end

if not menuOpen and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TWO') then

    collorEnabled = not collorEnabled

    runHaxeCode([[
    FlxG.save.data.collorEnabled = ]]..tostring(collorEnabled)..[[;
    FlxG.save.flush();
    ]])

    applyCollor()

    if collorEnabled then
        playSound('ConfigMenu/menuSelected', 0.8)
    else
        playSound('ConfigMenu/menuDeactivated', 0.8)
    end
end

if not menuOpen then return end

local up =
getPropertyFromClass('flixel.FlxG','keys.justPressed.UP') or
getPropertyFromClass('flixel.FlxG','keys.justPressed.W')

local down =
getPropertyFromClass('flixel.FlxG','keys.justPressed.DOWN') or
getPropertyFromClass('flixel.FlxG','keys.justPressed.S')

if up then
selected = selected - 1
if selected < 1 then selected = 5 end
end

if down then
selected = selected + 1
if selected > 5 then selected = 1 end
end

local leftPage =
getPropertyFromClass('flixel.FlxG','keys.justPressed.LEFT') or
getPropertyFromClass('flixel.FlxG','keys.justPressed.A')

local rightPage =
getPropertyFromClass('flixel.FlxG','keys.justPressed.RIGHT') or
getPropertyFromClass('flixel.FlxG','keys.justPressed.D')

if leftPage then
	page = page - 1
	if page < 1 then page = maxPages end
	playSound('ConfigMenu/menu_pageflip', 1)
end

if rightPage then
	page = page + 1
	if page > maxPages then page = 1 end
	playSound('ConfigMenu/menu_pageflip', 1)
end

if getPropertyFromClass('flixel.FlxG','keys.justPressed.E') and canPress and not inputCooldown then
canPress = false
confirmOption()
startCooldown()
runTimer('pressCD', 0.2)
end
end

function onUpdatePost()
local x = baseMenuX
local y = baseMenuY
local startX = x - 20
local startY = y + 50
local gap = 80

if page == 1 then
    updateLanguage()

elseif page == 2 then
    if languageIndex == 1 then
        setTextString('opt1', "1 - Scanlines")
        setTextString('opt2', "2 - Color Correction")
        setTextString('opt3', "3 - Coming Soon")
        setTextString('opt4', "4 - Coming Soon")
        setTextString('opt5', "5 - Coming Soon")
    else
        setTextString('opt1', "1 - Linhas CRT")
        setTextString('opt2', "2 - Correção Cor")
        setTextString('opt3', "3 - Em Breve")
        setTextString('opt4', "4 - Em Breve")
        setTextString('opt5', "5 - Em Breve")
    end
end

local titleText = ""

if page == 1 then
    titleText = "Game Controls"
else
    titleText = "Visual"
end

setTextString('menuTitle', titleText)

for i = 1, 5 do
setProperty('opt'..i..'.x', startX)
setProperty('opt'..i..'.y', startY + (i-1)*gap)
setProperty('opt'..i..'.alpha', selected == i and 1 or 0.5)
end

local txtWidth = getProperty('opt'..selected..'.width')
setProperty('option_seer.x', startX + txtWidth + 25)
setProperty('option_seer.y', startY + (selected - 1) * gap)

local caption = ""
local lang = languages[languageIndex]

if page == 2 then

	if selected == 1 then
		caption = (languageIndex == 1)
		and "Old TV scanlines effect"
		or "Efeito de TV antiga"

    elseif selected == 2 then
    caption = (languageIndex == 1)
    and "Recreate the game's colors"
    or "Recria as cores do jogo"
	else
		caption = (languageIndex == 1)
		and "New options coming soon..."
		or "Novas opções em breve..."
end

elseif selected == 1 then
caption = (languageIndex == 1) and "Toggle sensitive content" or "Ativar/desativar conteúdo sensível"

elseif selected == 2 then
caption = (languageIndex == 1) and "Performance mode toggle" or "Alternar modo performance"

elseif selected == 3 then
if fpsOptions[fpsIndex] == 999 then
caption = (languageIndex == 1) and "FPS Cap: Unlimited (May Cause Lags)" or "FPS: Ilimitado (pode lagar)"
else
caption = "FPS Cap: " .. fpsOptions[fpsIndex]
end

elseif selected == 4 then
caption = (languageIndex == 1) and "Change language" or "Mudar idioma"
elseif selected == 5 then
caption = (languageIndex == 1) and "Summons a chibi Sayori" or "Cria uma sayori do lado do bf"
end

setTextString('captionText', caption)
setProperty('captionText.y', getProperty('opt'..selected..'.y') + 45)

if sensitiveEnabled then
setProperty('bf_sens.x', 70)
setProperty('bf_sens.y', 400)
setProperty('dad_sens.x', 100)
setProperty('dad_sens.y', 240)
end
end

function setPerformanceMode(state)
setPropertyFromClass('ClientPrefs', 'lowQuality', state)

setProperty('boyfriend.antialiasing', not state)
setProperty('dad.antialiasing', not state)
setProperty('gf.antialiasing', not state)

if getProperty('boyfriend') ~= nil then
runHaxeCode([[
game.boyfriend.antialiasing = ]]..tostring(not state)..[[;
game.dad.antialiasing = ]]..tostring(not state)..[[;
game.gf.antialiasing = ]]..tostring(not state)..[[;
]])
end
end

function onTimerCompleted(tag)

	if tag == 'pressCD' then
		canPress = true
	end

	if tag == 'inputCD' then
		inputCooldown = false
	end

	if tag == 'hideLangLoader' then
		doTweenAlpha('langFade', 'langLoader', 0, 0.4, 'linear')
		runTimer('removeLangLoader', 0.45)
	end

	if tag == 'removeLangLoader' then
		setProperty('langLoader.visible', false)
		setProperty('langLoader.alpha', 1)

		canPress = true
		inputCooldown = false
	end
end

function onDestroy()
setPropertyFromClass('ClientPrefs', 'sensitiveEnabled', sensitiveEnabled)
setPropertyFromClass('ClientPrefs', 'performanceEnabled', performanceEnabled)
end

function updateContentFilter()
local safe = sensitiveEnabled
local bfName = getProperty('boyfriend.curCharacter')
local dadName = getProperty('dad.curCharacter')
if bfName == 'bfpoem' then
setProperty('bf_sens.visible', safe)
setProperty('boyfriend.visible', not safe)
else
setProperty('bf_sens.visible', false)
setProperty('boyfriend.visible', true)
end

if dadName == 'sayopoem' then
setProperty('dad_sens.visible', safe)
setProperty('dad.visible', not safe)
else
setProperty('dad_sens.visible', false)
setProperty('dad.visible', true)
end
end

function applyCollorPlus()

	if collorPlusEnabled then

		setProperty('camGame.color', getColorFromHex('FFFAFF'))
		setProperty('camHUD.color', getColorFromHex('FFFAFF'))
		setProperty('bloomFX.alpha', 0.10)
		setProperty('chromLeft.alpha', 0.05)
		setProperty('chromRight.alpha', 0.05)

	else
		setProperty('camGame.color', getColorFromHex('FFFFFF'))
		setProperty('camHUD.color', getColorFromHex('FFFFFF'))

		setProperty('bloomFX.alpha', 0)

		setProperty('chromLeft.alpha', 0)
		setProperty('chromRight.alpha', 0)

	end
end


function onEvent(name, value1, value2)
if name == 'Change Character' then
updateContentFilter()
end
end

function onPause()
if menuOpen then return Function_Stop end
end