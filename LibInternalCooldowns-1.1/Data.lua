local lib, oldminor = LibStub:GetLibrary("LibInternalCooldowns-1.1");

-- Format is spellID = itemID | {itemID, itemID, ... itemID}
local spellToItem = {

	-- Sirus CUSTOM --
	[319125] = 97756, --Оковы погибающего сознания
	[319189] = 97767, --Знаки последнего аргумента
	[319191] = 97768, --Эр'Игни, алчный взор Потрошителя

	[45478] = {34677, 11, 55262, 15}, --Подвеска восстановления воина Расколотого Солнца
	[45479] = {34678, 12}, --Подвеска проничательности воина Расколотого Солнца
	[45480] = {34679, 13, 300098, 16}, --Подвеска мощи Расколотого Солнца 
    --ПВП трини
	[305696] = {100108, 100109, 100110, 100111, 103183,137067, 137068, 137069, 103383, 137083, 137084, 137085, 107191, 107200, 107201, 107202, 108191, 108200, 108201, 108202},
	[305698] = 100117, --Могущество смертоносного гладиатора 213
	[305699] = 100117, --Могущество смертоносного гладиатора 213	
	[305701] = 100116, --Могущество гневного гладиатора 226
	[305702] = 100116, --Могущество гневного гладиатора 226	
	[305704] = 100118, --Могущество неумолимого гладиатора 245
	[305705] = 100118, --Могущество неумолимого гладиатора 245
	[305707] = 100119, --Могущество разгневанного гладиатора 264
	[305708] = 100119, --Могущество разгневанного гладиатора 264
	[308884] = {103384, 137080, 137081, 137082}, --a10
	[308885] = {103384, 137080, 137081, 137082}, --a10
	[307755] = {103184, 137064, 137065, 137066}, --a9
	[307756] = {103184, 137064, 137065, 137066}, --a9
	[316617] = {107192, 108192, 107197, 108197, 107198, 108198, 107199, 108199}, --a11, a12
	[316618] = {107192, 108192, 107197, 108197, 107198, 108198, 107199, 108199}, --a11, a12	

	[305680] = 100101, --Сила смертоносного гладиатора 213
	[305682] = 100100, --Сила гневного гладиатора 226
	[305684] = 100102, --Сила неумолимого гладиатора 245
	[305686] = 100103, --Сила разгневанного гладиатора 264
	[307753] = 103181, --Сила яросного гладиатора 274
 	[308882] = 103381, --Сила беспощадного гладиатора 284
	[316615] = {107189, 107206, 107207, 107208, 108189, 108206, 108207, 108208}, --a11, a12

	[305688] = 100105, --Чародейство смертельного гладиатора 213
	[305690] = 100104, --Чародейство гневного гладиатора 226
	[305692] = 100106, --Чародейство неумолимого гладиатора 245
	[305694] = 100107, --Чародейство разгневанного гладиатора 264
	[307758] = 103182, --Чародейство яросного гладиатора 274
	[308887] = 103382, --Чародейство беспощадного гладиатора 284
	[316620] = {107190, 107203, 107204, 107205, 108190, 108203, 108204, 108205}, --a11, a12

	[307881] = 33829, --Усохшая проклятая голова
	[307879] = 33831, --Зов берсерка
	[300968] = 34029, --Крошечная маска вуду
	[313524] = 151299, --Колдовской камень
	[313525] = 151299, --Колдовской камень
	[300145] = 65140, --Эссенция циклона
	[300146] = 65140, --Эссенция циклона
	[300135] = 65118, --Сокрушительный груз
	[300137] = 58183, --Вместилище души
	[310195] = 77999, --Фиал Теней
	[305504] = 61411, --Поцелуй Матери-Скалы
	[305505] = 61411, --Поцелуй Матери-Скалы
	[305497] = 61462, --Детектор механизмов
	[305498] = 61462, --Детектор механизмов
	[305499] = 61462, --Детектор механизмов
	[305501] = 80773, --Медальон поющего сверчка
	[305502] = 80773, --Медальон поющего сверчка
	[300132] = 60233, --Осколок Горя
	[305101] = 28823, --Граз Грулла
	[304671] = 28727, --Подвеска Аметистового Ока
	[304672] = 28727, --Подвеска Аметистового Ока
	[305103] = 28830, --Трофей драконьего хребта
	[304659] = 28528, --Карманные часы удачи мороуза
	[304660] = 28528, --Карманные часы удачи мороуза
	[304662] = 28590, --Лента жертвоприношения
	[304663] = 28590, --Лента жертвоприношения
	[304664] = 28590, --Лента жертвоприношения
	[304668] = 28785, --Конденсатор молний
	[304669] = 28785, --Конденсатор молний
	[60488] = 40373, --Экстракт некромантского могущества
	[313790] = 151782, --Четки Света
    --Вечное пламя
	[314759] = {153720, 153974, 154126},
	[314761] = {153725, 153979, 154131},
	[314763] = {153730, 153984, 154136},
	[314765] = {153735, 153989, 154141},
	[314767] = {153740, 153994, 154146},
    --Обязывающее обещание
	[314777] = {153721, 153975, 154127},
	[314779] = {153726, 153980, 154132},
	[314781] = {153731, 153985, 154137},
	[314783] = {153735, 153990, 154142},
	[314785] = {153741, 153995, 154147},
    --Рог зверя
	[314787] = {153722, 153976, 154128},
	[314789] = {153727, 153981, 154133},
	[314791] = {153732, 153986, 154138},
	[314793] = {153737, 153991, 154143},
	[314795] = {153742, 153996, 154148},
    --Сердце грома
	[314797] = {153723, 153977, 154129},
	[314799] = {153728, 153982, 154134},
	[314801] = {153733, 153987, 154139},
	[314803] = {153738, 153992, 154144},
	[314805] = {153743, 153997, 154149},
    --Расколотое солнце
	[315521] = {154408, 154413, 154418},
	[314523] = {154409, 154414, 154419},
	[314525] = {154410, 154415, 154420},
	[314527] = {154411, 154416, 154421},
	[314529] = {154412, 154417, 154422},
    --Средоточие спелости
	[300138] = 58184,
	[300139] = 58184,
	[300140] = 58184,
	[300141] = 58184,
	[300142] = 58184,
    --Символ защитника
	[314730] = {153670, 153924, 154076},
	[314738] = {153675, 153929, 154081},
	[314746] = {153680, 153934, 154086},
	[314754] = {153685, 153939, 154091},
	[314772] = {153690, 153944, 154096},
    --Символ воителя
	[314732] = {153672, 153926, 154078, 153673, 153927, 154079},
	[314740] = {153677, 153931, 154083, 153678, 153932, 154084},
	[314748] = {153682, 153936, 154088, 153683, 153937, 154089},
	[314756] = {153687, 153941, 154093, 153688, 153942, 154094},
	[314774] = {153692, 153946, 154098, 153693, 153947, 154099},
    --Символ лекаря
	[314733] = {153674, 153928, 154080},
	[314741] = {153679, 153933, 154085},
	[314749] = {153684, 153938, 154090},
	[314757] = {153689, 153943, 154095},
	[314775] = {153694, 153948, 154100},
    --Символ мудреца
	[314731] = {153671, 153925, 154077},
	[314739] = {153676, 153930, 154082},
	[314747] = {153681, 153935, 154087},
	[314755] = {153686, 153940, 154092},
	[314773] = {153691, 153945, 154097},
    --Предзнаменование конца
	[317904] = 158151,
	[317906] = 158150,
	[317908] = 158149,
	[317910] = 158148,
    --Миродробитель
	[36111] = 30090,		
	------------------------------------------------------------------------
	[64411] = 46017,					-- Val'anyr, Hammer of Ancient Kings
	
	[60065] = {44914, 40684, 49074},	-- Anvil of the Titans, Mirror of Truth, Coren's Chromium 	Coaster
	[60488] = 40373,					-- Extract of Necromatic Power
	[64713] = 45518,					-- Flare of the Heavens
	[60064] = {44912, 40682, 49706},	-- Flow of Knowledge, Sundial of the Exiled, Mithril Pocketwatch

	[67703]	= {47303, 47115},			-- Death's Choice, Death's Verdict (AGI)
	[67708]	= {47303, 47115},			-- Death's Choice, Death's Verdict (STR)
	[67772] = {47464, 47131},			-- Death's Choice, Death's Verdict (Heroic) (AGI)
	[67773] = {47464, 47131},			-- Death's Choice, Death's Verdict (Heroic) (STR)
	
	-- RS Scales
	-- Sharpened Twilight Scale
	[75456] = 54590,
	[75458] = 54569,	
	-- Charred Twilight Scale
	[75473] = 54588,
	[75466] = 54572,
	-- Petrified Twilight Scale
	[75480] = 54591,
	[75477] = 54571,
	
	-- ICC epix
	-- Rep rings
	[72416] = {50398, 50397},
	[72412] = {50402, 50401, 52572, 52571},
	[72418] = {50399, 50400},
	[72414] = {50404, 50403},

	-- Deathbringer's Will (Non-heroic)	(Sirus.su)
	-- Str
	[71484] = 50362,
	[371485] = 50362,
	[371486] = 50362,
	
	-- AP
	[71485] = 50362,
	[71486] = 50362,
	[71491] = 50362,

	-- Deathbringer's Will (Heroic)	(Sirus.su)
	-- Str
	[71561] = 50363,
	[371487] = 50363,
	[371488] = 50363,
	-- AP
	[71558] = 50363,
	[71559] = 50363,
	[71556] = 50363,
	
	[71403] = 50198,			-- Needle-Encrusted Scorpion
	[71610] = 50359,			-- Althor's Abacus
	[71633] = 50352,			-- Corpse-tongue coin
	[71601] = 50353,			-- Dislodged Foreign Object
	[71584] = 50358,			-- Purified Lunar Dust
	[71401] = 50342,			-- Whispering Fanged Skull
	[71605] = 50360,			-- Phylactery of the Nameless Lich
	
	-- Heroic ICC trinkets
	[71636] = 50365,			-- Phylactery of the Nameless Lich
	[71541] = 50343,			-- Whispering Fanged Skull
	[71641] = 50366,			-- Althor's Abacus
	[71639] = 50349,			-- Corpse-tongue coin
	[71644] = 50348,			-- Dislodged Foreign Object
	
	-- DK T9 2pc
	[67117] = {48501, 48502, 48503, 48504, 48505, 48472, 48474, 48476, 48478, 48480, 48491, 48492, 48493, 48494, 48495, 48496, 48497, 48498, 48499, 48500, 48486, 48487, 48488, 48489, 48490, 48481, 48482, 48483, 48484, 48485},
	-- Hunter T8 4pc
	[64861] = {46145, 46144, 46143, 46142, 46141, 45364, 45363, 45362, 45361, 45360},
	-- Mage T8 2pc
	[64868] = {46134, 46133, 46132, 46130, 46129, 46131, 45369, 45368, 45367, 45365},
	
	-- WotLK Epix
	[64739] = 45535, 			-- Show of Faith
	[67671] = 47214,			-- Banner of Victory
	[67669] = 47213, 			-- Abyssal Rune 
	[64772] = 45609, 			-- Comet's Trail
	[65024] = 46038, 			-- Dark Matter
	[60443] = 40371,			-- Bandit's Insignia
	[64790] = 45522,			-- Blood of the Old God
	[60203] = 42990,			-- Darkmoon Card: Death
	[60494] = 40255,			-- Dying Curse
	[65004] = 65005,			-- Elemental Focus Stone
	[60492] = 39229,			-- Embrace of the Spider
	[60530] = 40258,			-- Forethought Talisman
	[60437] = 40256,			-- Grim Toll
	[49623] = 37835, 			-- Je'Tze's Bell
	[65019] = 45931, 			-- Mjolnir Runestone
	[64741] = 45490,			-- Pandora's Plea
	[65014] = 45286,			-- Pyrite Infuser
	[65003] = 45929, 			-- Sif's Remembrance
	[60538] = 40382,			-- Soul of the Dead
	[58904] = 43573,			-- Tears of Bitter Anguish
	[60062] = {40685, 49078},	-- The Egg of Mortal Essence, Ancient Pickled Egg
	[64765] = 45507, 			-- The General's Heart
	
	-- WotLK Blues
	[51353]	= 38358,			-- Arcane Revitalizer
	[60218] = 37220,			-- Essence of Gossamer
	[60479] = 37660,			-- Forge Ember
	[51348] = 38359,			-- Goblin Repetition Reducer
	[63250] = 45131,			-- Jouster's Fury
	[63250] = 45219,			-- Jouster's Fury
	[60302] = 37390,			-- Meteorite Whetstone
	[54808] = 40865, 			-- Noise Machine
	[60483] = 37264, 			-- Pendulum of Telluric Currents
	[52424] = 38675, 			-- Signet of the Dark Brotherhood
	[55018] = 40767,			-- Sonic Booster
	[52419] = 38674,			-- Soul Harvester's Charm
	-- [18350] = 37111,			-- Soul Preserver, no internal cooldown
	[60520] = 37657,			-- Spark of Life
	[60307] = 37064,			-- Vestige of Haldor
	
	-- Greatness cards
	[60233] = {44253, 44254, 44255, 42987},		-- Greatness, AGI
	[60235] = {44253, 44254, 44255, 42987},		-- Greatness, SPI
	[60229] = {44253, 44254, 44255, 42987},		-- Greatness, INT
	[60234] = {44253, 44254, 44255, 42987},		-- Greatness, STR
	
	-- TBC Rings
	[35087] = 29309,			-- Band of the Eternal Restorer
	[35084] = 29305,			-- Band of the Eternal Sage
	[35081] = 29301,			-- Band of the Eternal Champion
	[35078] = 29297,			-- Band of the Eternal Defender
	-- Vanilla Epix/Rares
	[23684] = 19288,			-- Darkmoon Card: Blue Dragon
	[22600] = 18168,			-- Force Reactive Disk
};

-- spell ID = {enchant ID, slot1[, slot2]}
local enchants = {
	[55637] = {3722, 15},			-- Lightweave
	[55775] = {3730, 15},			-- Swordguard
	[55767] = {3728, 15},			-- Darkglow
	[59626] = {3790, 16, 17}, 			-- Black Magic ?
	[59625] = {3790, 16, 17}, 			-- Black Magic ? 	
};

-- ICDs on metas assumed to be 45 sec. Needs testing.
local metas = {	
	[23454] = 25899,				-- Brutal Earthstorm Diamond
	[55341] = 41385, 				-- Invigorating Earthsiege Diamond
	[18803] = 25893,				-- Mystical Skyfire Diamond
	[32845]	= 25898,				-- Tenacious Earthstorm Diamond
	[39959] = 32410,				-- Thundering Skyfire Diamond
	[55379] = 41400					-- Thundering Skyflare Diamond
};

-- Spell ID => cooldown, in seconds
-- If an item isn't in here, 45 sec is assumed.
local cooldowns = {
	-- Scales 
	[75456] = 45,
	[75458] = 45,
	[75473] = 45,
	[75466] = 45,
	[75480] = 45,
	[75477] = 45,
	-- ICC rep rings
	[72416] = 60,
	[72412] = 60,
	[72418] = 60,
	[72414] = 60,

	[60488] = 15,
	[51348] = 10,
	[51353] = 10,
	[54808] = 60,
	[55018] = 60,
	[52419] = 30,
	[59620] = 90,
	
	[55382] = 15,
	[32848] = 15,
	[55341] = 90,		-- Invigorating Earthsiege, based on WowHead comments (lol?)
	
	[48517] = 30,
	[48518] = 30,
	
	[47755] = 12,
	
	[67117] = 45, 		-- DK T9 2pc
	[64861] = 45, 		-- Hunter T8 4pc
	[64868] = 45, 		-- Mage T8 2pc
	
	-- Phylactery of the Nameless Lich
	[71636] = 100,
	[71605] = 100,
	
	-- Deathbringer's Will (Sirus.su)
	-- Str
	[71484] = 60,
	[371485] = 60,
	[371486] = 60,
	-- AP
	[71485] = 60,
	[71486] = 60,
	[71491] = 60,
	-- Deathbringer's Will (Heroic) (Sirus.su)
	-- Str
	[71561] = 60,
	[371487] = 60,
	[371488] = 60,
	-- Ap
	[71558] = 60,
	[71559] = 60,
	[71556] = 60,
	
	-- Black Magic
	[59626] = 35,
	[59625] = 35, 
	
	-- TBC Rings
	[35087] = 60,
	[35084] = 60,
	[35081] = 60,
	[35078] = 60,	
	
	-- TBC Trink
	[37656] = 50,
	[37174] = 30,
	[38324] = 15,
	[37243] = 40,
	[34775] = 20,
	[37658] = 2.5,
	[45055] = 15,
	[33649] = 50,
	[41263] = 10,
	[41261] = 10,
	[33523] = 25,
	-- Vanilla Epix/Rares
	[22600] = 1,
	-- Sirus CUSTOM --
	[319125] = 30,
	[319189] = 60,
	[319191] = 30,

	[45478] = 45,
	[45479] = 45,
	[45480] = 45,

	[305696] = 90,

	[305698] = 45,
	[305699] = 45,
	[305701] = 45,
	[305702] = 45,
	[305704] = 45,
	[305705] = 45,
	[305707] = 45,
	[305708] = 45,
	[308884] = 45,
	[308885] = 45,
	[307755] = 45,
	[307756] = 45,

	[305680] = 45,
	[305682] = 45,
	[305684] = 45,
	[305686] = 45,	
	[307753] = 45,		
 	[308882] = 45,
	[316615] = 45, --a11, a12

	[305688] = 45,
	[305690] = 45,
	[305692] = 45,
	[305694] = 45,
	[307758] = 45,
	[308887] = 45,
	[316620] = 45, --a11, a12

	[307881] = 100,
	[71639] = 30,
	[307879] = 45,
	[300968]= 45,
	[313524] = 45,
	[313525] = 45,
	[300145] = 45,
	[300146] = 45,
	[300135] = 45,
	[300137] = 45,
	[310195] = 45,
	[305504] = 6,
	[305505] = 6,
	[305497] = 60,
	[305498] = 60,
	[305499] = 60,
	[305501] = 90,
	[305502] = 90,
	[300132] = 45,
	[305101] = 45,
	[304671] = 45,
	[304672] = 45,
	[305103] = 45,
	[304659] = 45,
	[304660] = 45,
	[304662] = 45,
	[304663] = 45,
	[304664] = 45,
	[304668] = 45,
	[304669] = 45,
	[60494] = 45,
	[60538] = 45,
	[60437] = 45,
	[313790] = 6,

	[314759] = 15,
	[314761] = 15,
	[314763] = 15,
	[314765] = 15,
	[314767] = 15,

	[314777] = 45,
	[314779] = 45,
	[314781] = 45,
	[314783] = 45,
	[314785] = 45,

	[314787] = 45,
	[314789] = 45,
	[314791] = 45,
	[314793] = 45,
	[314795] = 45,

	[314797] = 45,
	[314799] = 45,
	[314801] = 45,
	[314703] = 45,
	[314705] = 45,

	[315521] = 15,
	[314523] = 15,
	[314525] = 15,
	[314527] = 15,
	[314529] = 15,

	[300138] = 105,
	[300139] = 105,
	[300140] = 105,
	[300141] = 105,
	[300142] = 105,

	[314730] = 45,
	[314738] = 45,
	[314746] = 45,
	[314754] = 45,
	[314772] = 45,

	[314733] = 45,
	[314741] = 45,
	[314749] = 45,
	[314757] = 45,
	[314775] = 45,

	[314731] = 45,
	[314739] = 45,
	[314747] = 45,
	[314755] = 45,
	[314773] = 45,

	[314732] = 45,
	[314740] = 45,
	[314748] = 45,
	[314756] = 45,
	[314774] = 45,

	[317904] = 10,
	[317906] = 10,
	[317908] = 10,
	[317910] = 10,

	[36111] = 60,	
};


-- Procced spell effect ID = unique name
-- The name doesn't matter, as long as it's non-numeric and unique to the ICD.
local talents = {
	-- Druid
	[48517] = "Eclipse",
	[48518] = "Eclipse",
	
	-- Hunter
	[56453] = "Lock and Load",
	
	-- Death Knight
	[52286] = "Will of the Necropolis",
	
	-- Priest
	[47755] = "Rapture"
};
-----------------------------------------------------------------------
-- Don't edit past this line									--
-----------------------------------------------------------------------

------------------------------------
-- Upgrade this data into the lib
------------------------------------

lib.spellToItem = lib.spellToItem or {};
lib.cooldowns = lib.cooldowns or {};
lib.enchants = lib.enchants or {};
lib.metas = lib.metas or {};
lib.talents = lib.talents or {};

local tt, tts = {}, {}
local function merge(t1, t2)
	wipe(tts)
	for _, v in ipairs(t1) do
		tts[v] = true
	end
	for _, v in ipairs(t2) do
		if not tts[v] then
			tinsert(t1, v);
		end
	end
end;

for k, v in pairs(spellToItem) do
	local e = lib.spellToItem[k]
	if e and e ~= v then
		if type(e) == "table" then
			if type(v) ~= "table" then
				wipe(tt)
				tinsert(tt, v)
			end
			merge(e, tt);
		else
			lib.spellToItem[k] = {e, v};
		end
	else
		lib.spellToItem[k] = v;
	end
end;

for k, v in pairs(cooldowns) do
	lib.cooldowns[k] = v
end;

for k, v in pairs(enchants) do
	lib.enchants[k] = v
end;

for k, v in pairs(metas) do
	lib.metas[k] = v
end;

for k, v in pairs(talents) do
	lib.talents[k] = v
end;