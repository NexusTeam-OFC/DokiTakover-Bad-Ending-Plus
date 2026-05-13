-- PauseArt System By Nexus Team 
local pauseArtVisible = false

function showPauseArt()
    
    if not luaSpriteExists('pauseArt') and songName == "STAGNANT" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/HappySayo', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "HAPPY POEMS" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/SadSayo', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
        if not luaSpriteExists('pauseArt') and songName == "VIOLET" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/YuriCrazy', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "MARKOV" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/YuriGlitch', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "EYES" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/YuriCloset', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "PLAY WITH ME" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/HomeNat', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "HOME" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/HomeNat', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "FESTIVAL" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/Dokies', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "THE TRAITOR" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/GFDeceiver', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "MINE" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/GFDeceiver', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
   if not luaSpriteExists('pauseArt') and songName == "DEAR SAYORI" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/SadSayo', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "MY REALITY" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/MoniSayo', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "FINAL POEM" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/TheEnd', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
end
    if not luaSpriteExists('pauseArt') and songName == "LAST CHANCE" then

        makeLuaSprite('pauseArt', 'pauseUI/PauseArt/MonikaFile', 1400, 64)
        setObjectCamera('pauseArt', 'other')
        addLuaSprite('pauseArt', true)
        doTweenX('pauseArtEnter', 'pauseArt', 500, 0.6, 'quartOut')
    end
end

function hidePauseArt()
    if luaSpriteExists('pauseArt') then
        doTweenX('pauseArtExit', 'pauseArt', 1400, 0.6, 'quartOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'pauseArtExit' then
        removeLuaSprite('pauseArt', true)
    end
end

-- Pause UI script by Ansfoxy

local Paused = false
local resume = true
local restart = false
local quit = false 

function onCreate()
makeLuaSprite('fundodoki','pauseUI/Credits_LeftSide',0, 0)
makeLuaSprite('logo', 'pauseUI/DokiTakeover', 70, -70);
makeLuaText('songname',songName,  0, 1100, 10);
if difficultyName == 'Hard' then
makeLuaText('difficulty',difficultyName,  0, 1185, 50);
elseif difficultyName == 'Normal' then
makeLuaText('difficulty',difficultyName,  0, 1165, 50);
elseif difficultyName == 'Easy' then
makeLuaText('difficulty',difficultyName,  0, 1165, 50);
end
makeLuaText('blueballed',Deleted,  0, 1070, 90);
makeLuaSprite('perso','pauseUI/no',1500, 0)
if botPlay  == true then
makeLuaText('bptext','botplay', 0, 1130, 130)
end
--
runTimer('no',0.1)

scaleObject('perso', 1, 1)
setObjectCamera('perso', 'other');

makeLuaSprite('box', '', -740, 190)
makeGraphic('box', 330, 400, 'FFFFFF')
setProperty('box.alpha', 0.001)
setObjectCamera('box', 'other')

scaleObject('fundodoki', 1, 1)
setObjectCamera('fundodoki', 'other');

setObjectCamera('logo', 'other');
scaleObject('logo', 0.5, 0.5);
doTweenX('logoX', 'logo.scale', 0.475, 0.0001, 'linear')
doTweenY('logoY', 'logo.scale', 0.475, 0.0001, 'linear')

makeLuaSprite('fundonegro', '', -600, -300);
makeGraphic('fundonegro',2560,1400,'000000');
screenCenter('fundonegro');
addLuaSprite('fundonegro',true);
setProperty('fundonegro.alpha',0.6);
setObjectCamera('fundonegro', 'other');

makeLuaText('resume', 'Resume', 0, 90, 350);
setTextBorder("resume", 2, "C22EFF")
makeLuaText('restart', 'Restart Song', 0, 90, 450);
makeLuaText('quit', 'Exit to Menu', 0, 90, 550);

setTextAlignment('songname', 'right')
setTextAlignment('difficulty', 'right')
setTextAlignment('blueballed', 'right')

setTextSize('resume', 35);
setTextSize('restart', 35);
setTextSize('quit', 35);
setTextSize('bptext', 35);
setTextSize('songname', 30);
setTextSize('difficulty', 30);
setTextSize('blueballed', 30);

setObjectCamera('resume', 'other');
setObjectCamera('restart', 'other');
setObjectCamera('quit', 'other');
setObjectCamera('songname', 'other');
setObjectCamera('diff', 'other');
setObjectCamera('bptext', 'other');
setObjectCamera('difficulty', 'other');
setObjectCamera('blueballed', 'other');

setTextFont('resume', 'pixel_comic.TTF')
setTextFont('restart', 'pixel_comic.TTF')
setTextFont('quit', 'pixel_comic.TTF')
setTextFont('songname', 'pixel_comic.TTF')
setTextFont('bptext', 'pixel_comic.TTF')
setTextFont('difficulty', 'pixel_comic.TTF')
setTextFont('blueballed', 'pixel_comic.TTF')

setObjectOrder('fundonegro', 99999);
setObjectOrder('perso', 100000);
setObjectOrder('fundodoki', 100001);
setObjectOrder('logo', 100002);

addLuaSprite('box', true)
addLuaSprite('perso', true)
addLuaSprite('fundodoki', true)
addLuaSprite('logo',true);
end

function onSongStart()
yeahPermite=true
end

function onUpdatePost()
setProperty('logo.x', getProperty('box.x') + 77)
setProperty('fundodoki.x', getProperty('box.x') - 1)

if Paused == true then
doTweenX('sidebarin', 'box', -50, 1.0, 'expoOut')

doTweenX('sidetbtarin', 'perso', 400, 1.0, 'expoOut')
doTweenX('resume', 'resume', 20, 1.0, 'expoOut')
doTweenX('Restart', 'restart', 20, 1.0, 'expoOut')
doTweenX('Quit', 'quit', 20, 1.0, 'expoOut')

if yeahPermite then
runHaxeCode(
        [[
            game.generatedMusic = false;
            game.vocals.pause();
            FlxG.sound.music.pause();
            return;
        ]]
    )
    
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
setProperty('vocals.volume', 0)
end

setProperty("boyfriend.animation.curAnim.paused", true)
setProperty("dad.animation.curAnim.paused", true)
setProperty("gf.animation.curAnim.paused", true)
setProperty("playerStrums.animation.curAnim.paused", true)
setProperty("boyfriend.heyTimer", 0)
setProperty("dad.heyTimer", 0)
setProperty("gf.heyTimer", 0)
setProperty('fundonegro.visible', true)
setProperty('box.visible', true)
setProperty('logo.visible', true)
setProperty('fundodoki.visible', true)
setProperty('name.visible', true)
setProperty('perso.visible', true)
showPauseArt()
addLuaText('resume')
addLuaText('restart')
addLuaText('quit')
addLuaText('songname')
addLuaText('diff')
setProperty('boyfriend.stunned', true);
addLuaText('bptext')
addLuaText('difficulty')
addLuaText('blueballed')
else

if not quit and not restart and yeahPermite then
runHaxeCode(
            [[
                FlxG.sound.music.play();
                game.vocals.play();
                game.generatedMusic = true;
                return;
            ]]
        )
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
end

doTweenX('songtweenout','box', -740, 0.000001,'expoIn')
doTweenX('songtweenou', 'perso', 1500, 0.00000001, 'expoOut')
doTweenX('resume', 'resume', -425, 0.000001, 'expoOut')
doTweenX('Restart', 'restart', -437, 0.000001, 'expoOut')
doTweenX('Quit', 'quit', -507, 0.000001, 'expoOut')
sound=false; stopSound('MenuSoundtrack');
setProperty('dad.animation.curAnim.paused', false)
setProperty('gf.animation.curAnim.paused', false)
setProperty('boyfriend.animation.curAnim.paused', false)
setProperty("playerStrums.animation.curAnim.paused", false)
setProperty('fundonegro.visible', false)
removeLuaText('resume',false)
removeLuaText('restart',false)
removeLuaText('quit',false)
setProperty('box.visible', false)
setProperty('logo.visible', false)
setProperty('name.visible', false)
setProperty('perso.visible', false)
setProperty('fundodoki.visible', false)
hidePauseArt()
removeLuaText('songname',false)
removeLuaText('diff',false)
setProperty('boyfriend.stunned', false);
removeLuaText('bptext',false)
removeLuaText('difficulty',false)
removeLuaText('blueballed',false)
end

if resume == true then
setTextColor('resume', 'FFFFFF')
setTextBorder("resume", 2, "FF0000")
else
setTextColor('resume', 'FFFFFF')
setTextBorder("resume", 2, "000000")
end

if restart == true then
setTextColor('restart', 'FFFFFF')
setTextBorder("restart", 2, "FF0000")
else
setTextColor('restart', 'FFFFFF')
setTextBorder("restart", 2, "000000")
end

if quit == true then
setTextColor('quit', 'FFFFFF')
setTextBorder("quit", 2, "FF0000")
else
setTextColor('quit', 'FFFFFF')
setTextBorder("quit", 2, "000000")
end

if keyJustPressed ('up') and Paused == true then
playSound('scrollMenu',1)
if resume == true then
quit = true
resume = false
elseif restart == true then
resume = true
restart = false
elseif quit == true then
restart = true
quit = false
end
end
if keyJustPressed ('down') and Paused == true then
playSound('scrollMenu',1)
if resume == true then
resume = false
restart = true 
elseif restart == true then
restart = false
quit = true
elseif quit == true then
quit = false
resume = true
end
end

local Blueb = ""..getPropertyFromClass("PlayState", "deathCounter")
setTextString("blueballed", "Blueballed: " .. Blueb )
end

function onGameOver()
yeahPermite=false
runHaxeCode(
        [[
            game.generatedMusic = false;
            game.vocals.pause();
            FlxG.sound.music.pause();
            return;
        ]]
    )
end

function onEndSong()
yeahPermite=false
runHaxeCode(
        [[
            game.generatedMusic = false;
            game.vocals.pause();
            FlxG.sound.music.pause();
            return;
        ]]
    )
end

function onPause()
if resume == true then
runTimer('sound',0.1)
runTimer('songMenu',0.1)
if sound then
playSound('confirmMenu',2)
end
end
if restart == true then
restartSong(false);
end
if quit == true then
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
setProperty('vocals.volume', 0)
exitSong(false);
end
if yeahPermite then
Paused = not Paused
pos = getPropertyFromClass('Conductor', 'songPosition')
playSound('scrollMenu',2)
end
return Function_Stop
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag=='yes' then
setProperty('logo.scale.x', 0.550)
setProperty('logo.scale.y', 0.550)
doTweenX('logoX', 'logo.scale', 0.475, 0.3, 'linear')
doTweenY('logoY', 'logo.scale', 0.475, 0.3, 'linear')
runTimer('no',0.7)
elseif tag=='no' then
runTimer('yes',0.7)
end
if tag=='sound' then
sound=true
end
if tag=='songMenu' and sound then
playSound('ghost', 2, 'MenuSoundtrack')
runTimer('songMenu',14.8)
end
end
