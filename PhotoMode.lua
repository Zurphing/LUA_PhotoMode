LUAGUI_NAME = "Photo Mode"
LUAGUI_AUTH = "Zurph, with the No Hud portion of the script from KSX."
LUAGUI_DESC = "Photo Mode"

local canExecute = false
toggle = false

function _OnInit()
	if GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then
		ConsolePrint("Press Select while paused to freeze the game, press select again to unfreeze the game. While time is freezed, hold down R2 to frame advance, and use the D-pad to change levels of brightness/zoom.")
		canExecute = true
		GameSpeed = Regular
	else
		ConsolePrint("Installation Failed.")
	end
end

function PhotoMode()
local offset = 0x56454E
MenuFlag = ReadByte(0x6877DA)
HCamSpd = 0x7169A0-0x56454E 
YCamSpd = 0x716AEC-0x56454E
YCamPos = 0x716AEC
YCamCurrentLook = 0x716A68 - 0x56454E
CommandMenuState = 0x024AA314+0x92
CommandMenuInSubMenu = 0x024AA314+0x96-0xE0
GameSlowdown = 0x07151D4-0x56454E
GameDarken = 0x8A44B8 - 0x56454E
GameDarken2 = ReadFloat(GameDarken)
GameSoundSpeed = 0xB088F - 0x56454E
SoraSoundSpeed = 0x3BE5A - 0x56454E
--ZoomIn = 0x89E9F0 - 0x56454E (Old)
ZoomIn = 0x716AF0 - 0x56454E
ZoomIn2 = ReadFloat(ZoomIn)
ReadInput = 0x1ACF3C
ReadInput2 = ReadInt(ReadInput)
StickInput = 0x29F89F0 - 0x56454E
HCamView = 0x716A70 - 0x56454E
HCamView2 = ReadFloat(HCamView)

-- KSX Part from NoHud
Map = ReadLong(0xABA578 - offset)+0xBC0, true
MapPosition = ReadLong(0xABA578 - offset)+0xBE4, true
CommandHUD = ReadLong(0xAB9D08 - offset)+0x3B4, true
CommandHUDText = ReadLong(0xAB9D08 - offset)+0x3B8, true
SoraHUDPicture = ReadLong(0xABAA48 - offset)+0x100, true
Party1HUDPicture = ReadLong(0xABAA48 - offset)+0x4710, true
Party2HUDPicture = ReadLong(0xABAA48 - offset)+0x5E50, true
sorahpbarpart1 = 0xA04400 - offset
sorahpbarpart2 = 0xA043D8 - offset
sorahpbarpart3 = 0xA043EC - offset
soraredhpbarpart1 = 0xA04428 - offset
soraredhpbarpart2 = 0xA0443C - offset
soraredhpbarpart3 = 0xA04450 - offset
sorahpbarbackgroundpart1 = 0xA04388 - offset
sorahpbarbackgroundpart2 = 0xA0439C - offset
sorahpbarbackgroundpart3 = 0xA043B0 - offset
sorahpbarstart = 0xA04374 - offset
sorahpbarend = 0xA04478 - offset
sorapictureinnercirclepart1 = 0xA04978 - offset
sorapictureinnercirclepart2 = 0xA04964 - offset
sorapictureinnercirclepart3 = 0xA04950 - offset
sorapictureinnercirclepart4 = 0xA0493C - offset
sorapictureoutercirclepart1 = 0xA0498C - offset
sorapictureoutercirclepart2 = 0xA049A0 - offset
sorapictureoutercirclepart3 = 0xA049B4 - offset
sorapictureoutercirclepart4 = 0xA049C8 - offset
mpsymbol = 0xA048B0 - offset
mpsymbolrecharge = 0xA048EC - offset
drivesymbol = 0xA03DFC - offset
drivemaxsymbol = 0xA03D20 - offset
formsymbol = 0xA04248 - offset
summontag = 0xA04AB8 - offset
mpbar = 0xA04914 - offset
mpbarbackground = 0xA048C4 - offset
mpbarrecharge = 0xA04928 - offset
mpbarbackgroundrecharge = 0xA04900 - offset
mpbarend = 0xA048D8 - offset
drivegauge = 0xA03E10 - offset
drivegaugefull = 0xA03E24 - offset
drivebubble = 0xA03EEC - offset
drivebackground = 0xA03F00 - offset
driverestore = 0xA03ED8 - offset
formgauge = 0xA04270 - offset
formgaugebackground = 0xA0425C - offset
summongauge = 0xA04AE0 - offset
summongaugebackground = 0xA04ACC - offset
drivering1 = 0xA03F28 - offset
drivering2 = 0xA03F3C - offset
drivering3 = 0xA03F50 - offset
driverefill1 = 0xA03F68 - offset
driverefill2 = 0xA03F04 - offset
driverefill3 = 0xA03F58 - offset
drivenr0 = 0xA03D34 - offset
drivenr1 = 0xA03D48 - offset
drivenr2 = 0xA03D5C - offset
drivenr3 = 0xA03D70 - offset
drivenr4 = 0xA03D84 - offset
drivenr5 = 0xA03D98 - offset
drivenr6 = 0xA03DAC - offset
drivenr7 = 0xA03DC0 - offset
drivenr8 = 0xA03DD4 - offset
drivenr9 = 0xA03DE8 - offset
formgaugenr0 = 0xA04180 - offset
formgaugenr1 = 0xA04194 - offset
formgaugenr2 = 0xA041A8 - offset
formgaugenr3 = 0xA041BC - offset
formgaugenr4 = 0xA041D0 - offset
formgaugenr5 = 0xA041E4 - offset
formgaugenr6 = 0xA041F8 - offset
formgaugenr7 = 0xA0420C - offset
formgaugenr8 = 0xA04220 - offset
formgaugenr9 = 0xA04234 - offset
drivegaugemprestore = 0xA03EA8 - offset
drivempemptysymbol = 0xA03E9C  - offset
drivempemptyrestore = 0xA03EB0 - offset
partymemberhp1 = 0xA042FC - offset
partymemberhp2 = 0xA04310 - offset
partymembermp1 = 0xA04324 - offset
partymembermp2 = 0xA04338 - offset
partymemberredhp1 = 0xA0434C - offset
partymemberredhp2 = 0xA04360 - offset
partymemberhpbackground1 = 0xA042AC - offset
partymemberhpbackground2 = 0xA042C0 - offset
partymembermpbackground1 = 0xA042E8 - offset
partymembermpbackground2 = 0xA042D4 - offset
partymembercircle1 = 0xA04298 - offset
partymembercircle2 = 0xA04284 - offset
scanhp = 0xA04BEC - offset
scanredhp = 0xA04BFC - offset
scanhpbackground1 = 0xA04BE0 - offset
scanhpbackground2 = 0xA04BE4 - offset
scanhpbackground3 = 0xA04BE8 - offset
scanmultihp1 = 0xA04BE2 - offset
scanmultihp2 = 0xA04BE6 - offset
scanmultihp3 = 0xA04BEA - offset
scanmultihp4 = 0xA04BEE - offset
scanhplose = 0xA04BFE - offset

if ReadInput2 == 65537 and ReadInt(GameSlowdown) == 1065353216 and MenuFlag == 0x03 then --Now toggles with Select in the pause menu.
	WriteFloat(HCamSpd, 1000)
	WriteFloat(YCamSpd, 60000.35099999905)
	WriteFloat(GameSlowdown, 0.00005999999848) --Near 0 FPS, but allows camera functionality while still freezing the game.
	ConsolePrint("DEBUG: Select in Menu detected. Photo Mode Enabled.")
	toggling = true
	WriteFloat(YCamCurrentLook, 250) --Prevents the weird issue where the camera would swing overhead upon activating. Now, just goes low to the floor.

--KSX Part
	WriteFloat(Map, 0, true)
	WriteFloat(MapPosition, 0, true)
	WriteFloat(CommandHUD, 0, true)
	WriteFloat(CommandHUDText, 0, true)
	WriteFloat(SoraHUDPicture, 0, true)
	WriteFloat(Party1HUDPicture, 0, true)
	WriteFloat(Party2HUDPicture, 0, true)
	WriteShort(sorahpbarpart1, 0x0000)
	WriteShort(sorahpbarpart2, 0x0000)
	WriteShort(sorahpbarpart3, 0x0000)
	WriteShort(soraredhpbarpart1, 0x0000)
	WriteShort(soraredhpbarpart2, 0x0000)
	WriteShort(soraredhpbarpart3, 0x0000)
	WriteShort(sorahpbarbackgroundpart1, 0x0000)
	WriteShort(sorahpbarbackgroundpart2, 0x0000)
	WriteShort(sorahpbarbackgroundpart3, 0x0000)
	WriteShort(sorahpbarstart, 0x0000)
	WriteShort(sorahpbarend, 0x0000)
	WriteShort(sorapictureinnercirclepart1, 0x0000)
	WriteShort(sorapictureinnercirclepart2, 0x0000)
	WriteShort(sorapictureinnercirclepart3, 0x0000)
	WriteShort(sorapictureinnercirclepart4, 0x0000)
	WriteShort(sorapictureoutercirclepart1, 0x0000)
	WriteShort(sorapictureoutercirclepart2, 0x0000)
	WriteShort(sorapictureoutercirclepart3, 0x0000)
	WriteShort(sorapictureoutercirclepart4, 0x0000)
	WriteShort(mpsymbol, 0x0000)
	WriteShort(drivesymbol, 0x0000)
	WriteShort(drivemaxsymbol, 0x0000)
	WriteShort(mpsymbolrecharge, 0x0000)
	WriteShort(formsymbol, 0x0000)
	WriteShort(summontag, 0x0000)
	WriteShort(mpbar, 0x0000)
	WriteShort(mpbarbackground, 0x0000)
	WriteShort(mpbarrecharge, 0x0000)
	WriteShort(mpbarbackgroundrecharge, 0x0000)
	WriteShort(mpbarend, 0x0000)
	WriteShort(drivegauge, 0x0000)
	WriteShort(drivegaugefull, 0x0000)
	WriteShort(drivebubble, 0x0000)
	WriteShort(drivebackground, 0x0000)
	WriteShort(driverestore, 0x0000)
	WriteShort(formgauge, 0x0000)
	WriteShort(formgaugebackground, 0x0000)
	WriteShort(summongauge, 0x0000)
	WriteShort(summongaugebackground, 0x0000)
	WriteShort(drivering1, 0x0000)
	WriteShort(drivering2, 0x0000)
	WriteShort(drivering3, 0x0000)
	WriteShort(driverefill1, 0x0000)
	WriteShort(driverefill2, 0x0000)
	WriteShort(driverefill3, 0x0000)
	WriteShort(drivenr0, 0x0000)
	WriteShort(drivenr1, 0x0000)
	WriteShort(drivenr2, 0x0000)
	WriteShort(drivenr3, 0x0000)
	WriteShort(drivenr4, 0x0000)
	WriteShort(drivenr5, 0x0000)
	WriteShort(drivenr6, 0x0000)
	WriteShort(drivenr7, 0x0000)
	WriteShort(drivenr8, 0x0000)
	WriteShort(drivenr9, 0x0000)		
	WriteShort(formgaugenr0, 0x0000)
	WriteShort(formgaugenr1, 0x0000)
	WriteShort(formgaugenr2, 0x0000)
	WriteShort(formgaugenr3, 0x0000)
	WriteShort(formgaugenr4, 0x0000)
	WriteShort(formgaugenr5, 0x0000)
	WriteShort(formgaugenr6, 0x0000)
	WriteShort(formgaugenr7, 0x0000)
	WriteShort(formgaugenr8, 0x0000)
	WriteShort(formgaugenr9, 0x0000)
	WriteShort(drivegaugemprestore, 0x0000)
	WriteShort(drivempemptysymbol, 0x0000)
	WriteShort(drivempemptyrestore, 0x0000)
	WriteShort(partymemberhp1, 0x0000)
	WriteShort(partymemberhp2, 0x0000)
	WriteShort(partymembermp1, 0x0000)
	WriteShort(partymembermp2, 0x0000)
	WriteShort(partymemberredhp1, 0x0000)
	WriteShort(partymemberredhp2, 0x0000)
	WriteShort(partymemberhpbackground1, 0x0000)
	WriteShort(partymemberhpbackground2, 0x0000)
	WriteShort(partymembermpbackground1, 0x0000)
	WriteShort(partymembermpbackground2, 0x0000)
	WriteShort(partymembercircle1, 0x0000)
	WriteShort(partymembercircle2, 0x0000)
	WriteShort(scanhp, 0x0000)
	WriteShort(scanredhp, 0x0000)
	WriteShort(scanhpbackground1, 0x0000)
	WriteShort(scanhpbackground2, 0x0000)
	WriteShort(scanhpbackground3, 0x0000)
	WriteShort(scanmultihp1, 0x0000)
	WriteShort(scanmultihp2, 0x0000)
	WriteShort(scanmultihp3, 0x0000)
	WriteShort(scanmultihp4, 0x0000)
	WriteShort(scanhplose, 0x0000)
--elseif ReadInt(ReadInput) & 0x0C00 == 0x0C00 and ReadInt(GameSlowdown) == 1031127695 or ReadInt(ReadInput) & 0x0C00 == 0x0C00 and ReadInt(GameSlowdown) == 0 or ReadInt(ReadInput) & 0x0C00 == 0x0C00 and ReadInt(GameSlowdown) == 947628162 then -- and toggle == true then
elseif ReadInput2 == 65537 and ReadInt(GameSlowdown) == 1031127695 and toggling == true or ReadInput == 65537 and ReadInt(GameSlowdown) == 0 and toggling == true or ReadInput2 == 65537 and ReadInt(GameSlowdown) == 947628162 and toggling == true then -- and toggle == true then
	WriteFloat(GameSlowdown, 1) --Back to defaults.
	WriteFloat(HCamSpd, 0.05235987902)
	WriteFloat(YCamSpd, 0.01)
	WriteFloat(GameDarken, 1)
	--WriteFloat(ZoomIn, 1) Old ZoomIn.
	WriteFloat(ZoomIn, 1.5) --This version of ZoomIn also zooms hud elements like the lock-on, instead of leaving them awkwardly out.
	toggling = false
	ConsolePrint("DEBUG: Select in Menu/In-Game detected. Photo Mode Disabled.")
--KSX Part: No HUD. Restores most of the HUD elements to normal. 
	WriteFloat(Map, 1, true)
	WriteFloat(MapPosition, 1, true)
	WriteFloat(CommandHUD, 1, true)
	WriteFloat(CommandHUDText, 1, true)
	WriteFloat(SoraHUDPicture, 1, true)
	WriteFloat(Party1HUDPicture, 1, true)
	WriteFloat(Party2HUDPicture, 1, true)
	WriteShort(sorahpbarpart1, 0x006B)
	WriteShort(sorahpbarpart2, 0x006B)
	WriteShort(sorahpbarpart3, 0x006B)
	WriteShort(soraredhpbarpart1, 0x006C)
	WriteShort(soraredhpbarpart2, 0x006C)
	WriteShort(soraredhpbarpart3, 0x006C)
	WriteShort(sorahpbarbackgroundpart1, 0x006A)
	WriteShort(sorahpbarbackgroundpart2, 0x006A)
	WriteShort(sorahpbarbackgroundpart3, 0x006A)
	WriteShort(sorahpbarstart, 0x006D)
	WriteShort(sorahpbarend, 0x0071)
	WriteShort(sorapictureinnercirclepart1, 0x007F)
	WriteShort(sorapictureinnercirclepart2, 0x007F)
	WriteShort(sorapictureinnercirclepart3, 0x007F)
	WriteShort(sorapictureinnercirclepart4, 0x007F)
	WriteShort(sorapictureoutercirclepart1, 0x0080)
	WriteShort(sorapictureoutercirclepart2, 0x0080)
	WriteShort(sorapictureoutercirclepart3, 0x0080)
	WriteShort(sorapictureoutercirclepart4, 0x0080)
	WriteShort(mpsymbol, 0x0077)
	WriteShort(drivesymbol, 0x002F)
	WriteShort(drivemaxsymbol, 0x003E)
	WriteShort(mpsymbolrecharge, 0x0075)
	WriteShort(formsymbol, 0x0035)
	WriteShort(summontag, 0x003B)
	WriteShort(mpbar, 0x007A)
	WriteShort(mpbarbackground, 0x0078)
	WriteShort(mpbarrecharge, 0x007B)
	WriteShort(mpbarbackgroundrecharge, 0x0076)
	WriteShort(mpbarend, 0x0079)
	WriteShort(drivegauge, 0x0030)
	WriteShort(drivegaugefull, 0x0032)
	WriteShort(drivebubble, 0x004B)
	WriteShort(drivebackground, 0x004A)
	WriteShort(driverestore, 0x0031)
	WriteShort(formgauge, 0x0033)
	WriteShort(formgaugebackground, 0x0034)
	WriteShort(summongauge, 0x0033)
	WriteShort(summongaugebackground, 0x0034)
	WriteShort(drivering1, 0x004C)
	WriteShort(drivering2, 0x004C)
	WriteShort(drivering3, 0x004C)
	WriteShort(driverefill1, 0x0010)
	WriteShort(driverefill2, 0x0011)
	WriteShort(driverefill3, 0x0100)
	WriteShort(drivenr0, 0x003F)
	WriteShort(drivenr1, 0x0040)
	WriteShort(drivenr2, 0x0041)
	WriteShort(drivenr3, 0x0042)
	WriteShort(drivenr4, 0x0043)
	WriteShort(drivenr5, 0x0044)
	WriteShort(drivenr6, 0x0045)
	WriteShort(drivenr7, 0x0046)
	WriteShort(drivenr8, 0x0047)
	WriteShort(drivenr9, 0x0048)		
	WriteShort(formgaugenr0, 0x005B)
	WriteShort(formgaugenr1, 0x005C)
	WriteShort(formgaugenr2, 0x005D)
	WriteShort(formgaugenr3, 0x005E)
	WriteShort(formgaugenr4, 0x005F)
	WriteShort(formgaugenr5, 0x0060)
	WriteShort(formgaugenr6, 0x0061)
	WriteShort(formgaugenr7, 0x0062)
	WriteShort(formgaugenr8, 0x0063)
	WriteShort(formgaugenr9, 0x0064)
	WriteShort(drivegaugemprestore, 0x0040)
	WriteShort(drivempemptysymbol, 0x003C)
	WriteShort(drivempemptyrestore, 0x0030)
	WriteShort(partymemberhp1, 0x0067)
	WriteShort(partymemberhp2, 0x0067)
	WriteShort(partymembermp1, 0x0068)
	WriteShort(partymembermp2, 0x0068)
	WriteShort(partymemberredhp1, 0x0069)
	WriteShort(partymemberredhp2, 0x0069)
	WriteShort(partymemberhpbackground1, 0x0065)
	WriteShort(partymemberhpbackground2, 0x0065)
	WriteShort(partymembermpbackground1, 0x0065)
	WriteShort(partymembermpbackground2, 0x0065)
	WriteShort(partymembercircle1, 0x0066)
	WriteShort(partymembercircle2, 0x0066)
	WriteShort(scanhp, 0x006F)
	WriteShort(scanredhp, 0x0076)
	WriteShort(scanhpbackground1, 0x006B)
	WriteShort(scanhpbackground2, 0x006D)
	WriteShort(scanhpbackground3, 0x006E)
	WriteShort(scanmultihp1, 0x0002)
	WriteShort(scanmultihp2, 0x0001)
	WriteShort(scanmultihp3, 0x0001)
	WriteShort(scanmultihp4, 0x0001)
	WriteShort(scanhplose, 0x0001)		
end

--ZoomIn/Brightness toggles.
if ReadInt(ReadInput) & 0x10 == 0x10 and ReadInt(GameSlowdown) == 947628162 then
	WriteFloat(ZoomIn, ZoomIn2-0.02)
elseif ReadInt(ReadInput) & 0x40 == 0x40 and ReadInt(GameSlowdown) == 947628162 then
	WriteFloat(ZoomIn, ZoomIn2+0.02)
elseif ReadInt(ReadInput) & 0x20 == 0x20 and ReadInt(GameSlowdown) == 947628162 then
	WriteFloat(GameDarken, GameDarken2+0.02)
elseif ReadInt(ReadInput) & 0x80 == 0x80 and ReadInt(GameSlowdown) == 947628162 then
	WriteFloat(GameDarken, GameDarken2-0.02)
end

local togglevar = true
if togglevar and ReadInt(ReadInput) & 0x0200 == 0x0200 and ReadInt(GameSlowdown) == 947628162 then
    WriteFloat(GameSlowdown, 0.06)
	WriteFloat(HCamSpd, 1)
	WriteFloat(YCamSpd, 0.35)
--	WriteFloat(YCamCurrentLook, 250)
   ConsolePrint("DEBUG: Ok, frame advancing!")
   elseif ReadInt(ReadInput) & 0x0200 ~= 0x0200 and ReadInt(GameSlowdown) == 1031127695 then
	WriteFloat(GameSlowdown, 0.00005999999848) --Near 0 FPS, but allows camera functionality.
	WriteFloat(HCamSpd, 1000)
	--WriteFloat(YCamSpd, 20000.35099999905)
--	WriteFloat(YCamCurrentLook, 250)
--	WriteFloat(YCamSpd, 600000) --Failed test. Camera will immediately swing overhead upon going from Frame Advance to Frozen.
	ConsolePrint("DEBUG: Ok, back to frozen time!") --Detect if player is no longer holding the button. Will then immediately stop.
 end
end


function _OnFrame()
PhotoMode()
end

--Current issues to solve/improvements to make:
	--General code cleanup.
	--Better toggling system that prevents input lockout.
	--Fix refreshing scripts while time is frozen causing you to not be able to resume time.
	--Better Y-axis camera system, by fixing the overhead weirdness?
	--Fix Map not being restored when unfreezing time.
	--More options like zoom/brightness, bound to L3/L2 or other button combinations. (Avoid combinations already used, like Soft Reset or SaveAnywhere)
