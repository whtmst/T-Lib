-- =============================================================================
-- T-Lib: BossData Module
-- =============================================================================
-- Boss and raid database for Turtle WoW
-- Client version: 1.12
--
-- API:
--   T_Lib:IsBoss(name)              -- check if name is a boss
--   T_Lib:GetRaidByBoss(bossName)   -- get raid name by boss
--   T_Lib:GetRaidName(raidAlias)    -- get full raid name by alias
--   T_Lib:GetBossesByRaid(raid)     -- get all bosses in a raid
--   T_Lib:GetBossCount(raid)        -- get boss count in a raid
--   T_Lib:IsRaid(name)              -- check if name is a raid/alias
--   T_Lib:FindBoss(partialName)     -- find boss by partial match
--   T_Lib:FindRaid(partialName)     -- find raid by partial match
--   T_Lib:CompareBossName(a, b)     -- case-insensitive boss comparison
--   T_Lib:GetAllRaids()             -- get all raid names
--   T_Lib:GetAllRaidAliases()       -- get all raid aliases
-- =============================================================================

-- Ensure T_Lib exists
T_Lib = T_Lib or {}

-- Boss data organized by raid
T_Lib.Raids = {
    -- ========================================================================
    -- RAIDS
    -- ========================================================================

    -- Upper Blackrock Spire (UBRS)
    ["Upper Blackrock Spire"] = {
        "Pyroguard Emberseer",
        "Solakar Flamewreath",
        "Father Flame",
        "Jed Runewatcher",
        "Goraluk Anvilcrack",
        "Warchief Rend Blackhand",
        "Gyth",
        "Awbee",
        "The Beast",
        "Lord Valthalak",
        "General Drakkisath",
    },
    -- Onyxia's Lair (Ony)
    ["Onyxia's Lair"] = {
        "Onyxia",
        "Broodcommander Axelus",
    },
    -- Molten Core (MC)
    ["Molten Core"] = {
        "Core Hound",
        "Ancient Core Hound",
        "Lava Surger",
        "Flame Imp",
        "Incindis",
        "Lucifron",
        "Magmadar",
        "Garr",
        "Baron Geddon",
        "Shazzrah",
        "Golemagg the Incinerator",
        "Sulfuron Harbinger",
        "Majordomo Executus",
        "Twin Golems",
        "Basalthar",
        "Smoldaris",
        "Sorcerer-Thane Thaurissan",
        "Gehennas",
        "Ragnaros",
    },
    -- Blackwing Lair (BWL)
    ["Blackwing Lair"] = {
        "Death Talon Wyrmguard",
        "Razorgore the Untamed",
        "Vaelastrasz the Corrupt",
        "Broodlord Lashlayer",
        "Firemaw",
        "Ebonroc",
        "Flamegor",
        "Chromaggus",
        "Nefarian",
        "Ezzel Darkbrewer",
    },
    -- Lower Karazhan Halls (LKH)
    ["Lower Karazhan Halls"] = {
        "Phantom Servant",
        "Master Blacksmith Rolfen",
        "Brood Queen Araxxna",
        "Grizikil",
        "Clawlord Howlfang",
        "Dark Rider Champion",
        "Lord Blackwald II",
        "Moroes",
    },
    -- Zul'Gurub (ZG)
    ["Zul'Gurub"] = {
        "Gurubashi Bat Rider",
        "Gurubashi Berserker",
        "Mad Servant",
        "High Priestess Jeklik",
        "High Priest Venoxis",
        "High Priestess Mar'li",
        "Bloodlord Mandokir",
        "Gri'lek",
        "Hazza'rah",
        "Renataki",
        "Wushoolay",
        "Gahz'ranka",
        "High Priest Thekal",
        "High Priestess Arlokk",
        "Jin'do the Hexxer",
        "Hakkar",
    },
    -- Emerald Sanctum (ES)
    ["Emerald Sanctum"] = {
        "Sanctum Dragonkin",
        "Sanctum Dreamer",
        "Sanctum Supressor",
        "Sanctum Wyrm",
        "Sanctum Wyrmkin",
        "Erennius",
        "Solnius",
    },
    -- Ruins of Ahn'Qiraj (AQ20)
    ["Ruins of Ahn'Qiraj"] = {
        "Flesh Hunter",
        "Anubisath Guardian",
        "Hive'Zara Soldier",
        "Kurinnaxx",
        "Lieutenant General Andorov",
        "General Rajaxx",
        "Captain Qeez",
        "Captain Tuubid",
        "Captain Drenn",
        "Captain Xurrem",
        "Major Yeggeth",
        "Major Pakkon",
        "Colonel Zerran",
        "Moam",
        "Buru the Gorger",
        "Ayamiss the Hunter",
        "Ossirian the Unscarred",
    },
    -- Ahn'Qiraj / Temple of Ahn'Qiraj (AQ40)
    ["Ahn'Qiraj"] = {
        "Qiraji Brainwasher",
        "Qiraji Champion",
        "Qiraji Mindslayer",
        "Anubisath Defender",
        "Anubisath Sentinel",
        "Anubisath Warder",
        "The Prophet Skeram",
        "The Bug Family",
        "Vem",
        "Lord Kri",
        "Princess Yauj",
        "Battleguard Sartura",
        "Fankriss the Unyielding",
        "Viscidus",
        "Princess Huhuran",
        "The Twin Emperors",
        "Emperor Vek'lor",
        "Emperor Vek'nilash",
        "Ouro",
        "C'Thun",
    },
    -- Timbermaw Hold (TmH)
    ["Timbermaw Hold"] = {
    },
    -- Naxxramas (Naxx)
    ["Naxxramas"] = {
        "Patchwork Golem",
        "Deathknight Captain",
        "Deathknight Cavalier",
        "Gargoyle",
        "Living Monstrosity",
        "Venom Stalker",
        "Patchwerk",
        "Grobbulus",
        "Gluth",
        "Thaddius",
        "Anub'Rekhan",
        "Grand Widow Faerlina",
        "Maexxna",
        "Noth the Plaguebringer",
        "Heigan the Unclean",
        "Loatheb",
        "Instructor Razuvious",
        "Gothik the Harvester",
        "The Four Horsemen",
        "Thane Korth'azz",
        "Lady Blaumeux",
        "Highlord Mograine",
        "Sir Zeliek",
        "Sapphiron",
        "Kel'Thuzad",
    },
    -- Tower of Karazhan (ToK)
    ["Tower of Karazhan"] = {
        "Keeper Gnarlmoon",
        "Ley-Watcher Incantagos",
        "Anomalus",
        "Echo of Medivh",
        "King",
        "Sanv Tas'dal",
        "Rupturan the Broken",
        "Kruul",
        "Mephistroth",
    },
    -- World Bosses
    ["World Bosses"] = {
        "Azuregos",
        "Cla'ckora",
        "Concavius",
        "Moo",
        "Lethon",
        "Emeriss",
        "Taerar",
        "Ysondre",
        "Lord Kazzak",
        "Nerubian Overseer",
        "Ostarius",
        "Dark Reaver of Karazhan",
    },
    -- TW Custom Bosses (Turtle WoW unique bosses)
    ["TW Custom Bosses"] = {
        "Avalanchion",
        "The Windreaver",
        "Baron Charr",
        "Princess Tempestria",
        "Doctor Weavil",
        "Twilight Corrupter",
        "Trigore the Lasher",
        "Boahn",
        "Mad Magglish",
        "Marisa du'Paige",
        "Brainwashed Noble",
        "Foreman Thistlenettle",
        "Kazkaz the Unholy",
        "Zekkis",
        "Veyzhak the Cannibal",
        "Magregan Deepshadow",
        "Techbot",
    },
    -- ========================================================================
    -- DUNGEONS
    -- ========================================================================

    -- Ragefire Chasm (RFC)
    ["Ragefire Chasm"] = {
        "Oggleflint",
        "Taragaman the Hungerer",
        "Jergosh the Invoker",
        "Bazzalan",
    },
    -- Frostmane Hollow (FH)
    ["Frostmane Hollow"] = {
    },
    -- Deadmines (VC)
    ["Deadmines"] = {
        "Jared Voss",
        "Rhahk'Zor",
        "Miner Johnson",
        "Sneed",
        "Sneed's Shredder",
        "Gilnid",
        "Masterpiece Harvester",
        "Mr. Smite",
        "Cookie",
        "Captain Greenskin",
        "Edwin VanCleef",
    },
    -- Wailing Caverns (WC)
    ["Wailing Caverns"] = {
        "Lord Cobrahn",
        "Lady Anacondra",
        "Kresh",
        "Deviate Faerie Dragon",
        "Zandara Windhoof",
        "Lord Pythas",
        "Skum",
        "Vangros",
        "Lord Serpentis",
        "Verdan the Everliving",
        "Mutanus the Devourer",
    },
    -- Shadowfang Keep (SFK)
    ["Shadowfang Keep"] = {
        "Rethilgore",
        "Fel Steed",
        "Razorclaw the Butcher",
        "Baron Silverlaine",
        "Commander Springvale",
        "Sever",
        "Odo the Blindwatcher",
        "Deathsworn Captain",
        "Fenrus the Devourer",
        "Arugal's Voidwalker",
        "Wolf Master Nandos",
        "Archmage Arugal",
        "Prelate Ironmane",
    },
    -- The Stockade (Stock)
    ["The Stockade"] = {
        "Targorr the Dread",
        "Kam Deepfury",
        "Hamhock",
        "Bazil Thredd",
        "Dextren Ward",
        "Bruegal Ironknuckle",
    },
    -- Blackfathom Deeps (BFD)
    ["Blackfathom Deeps"] = {
        "Ghamoo-ra",
        "Lady Sarevess",
        "Gelihast",
        "Lorgus Jett",
        "Velthelaxx the Defiler",
        "Baron Aquanis",
        "Twilight Lord Kelris",
        "Old Serra'kis",
        "Aku'mai",
    },
    -- Windhorn Canyon (WhC)
    ["Windhorn Canyon"] = {
    },
    -- Razorfen Kraul (RFK)
    ["Razorfen Kraul"] = {
        "Roogug",
        "Aggem Thorncurse",
        "Death Speaker Jargba",
        "Overlord Ramtusk",
        "Razorfen Spearhide",
        "Rotthorn",
        "Agathelos the Raging",
        "Blind Hunter",
        "Charlga Razorflank",
        "Earthcaller Halmgar",
    },
    -- Razorfen Downs (RFD)
    ["Razorfen Downs"] = {
        "Tuten'kash",
        "Henry Stern",
        "Lady Falther'ess",
        "Plaguemaw the Rotting",
        "Mordresh Fire Eye",
        "Glutton",
        "Death Prophet Rakameg",
        "Ragglesnout",
        "Amnennar the Coldbringer",
    },
    -- Gnomeregan (Gnome)
    ["Gnomeregan"] = {
        "Grubbis",
        "Chomper",
        "Viscous Fallout",
        "Electrocutioner 6000",
        "Crowd Pummeler 9-60",
        "Dark Iron Ambassador",
        "Mekgineer Thermaplugg",
    },
    -- The Crescent Grove (TCG)
    ["The Crescent Grove"] = {
        "Grovetender Engryss",
        "Elder Blackmaw",
        "Elder \"One Eye\"",
        "Keeper Ranathos",
        "High Priestess A'lathea",
        "Fenektis the Deceiver",
        "Master Raxxieth",
    },
    -- Dragonmaw Retreat (DMR)
    ["Dragonmaw Retreat"] = {
        "Gowlfang",
        "Bogpaw Truthsay",
        "Cavernweb Broodmother",
        "Web Master Torkon",
        "Garlok Flamekeeper",
        "Halgan Redbrand",
        "Slagfist Destroyer",
        "Overlord Blackheart",
        "Elder Hollowblood",
        "Searistrasz",
        "Zuluhed the Whacked",
    },
    -- Scarlet Monastery (SM)
    ["Scarlet Monastery"] = {
        "Herod",
        "Armory Quartermaster Daghelm",
        "High Inquisitor Fairbanks",
        "Scarlet Commander Mograine",
        "High Inquisitor Whitemane",
        "Interrogator Vishas",
        "Scorn",
        "Bloodmage Thalnos",
        "Ironspine",
        "Azshir the Sleepless",
        "Fallen Champion",
        "Duke Dreadmoore",
        "Houndmaster Loksey",
        "Arcanist Doan",
        "Brother Wystan",
    },
    -- Stormwrought Ruins (SwR)
    ["Stormwrought Ruins"] = {
        "Oronok Torn-Heart",
        "Dagar the Glutton",
        "Librarian Theodorus",
        "Duke Balor the IV",
        "Chieftain Stormsong",
        "Deathlord Tidebane",
        "Subjugator Halthas Shadecrest",
        "Mycellakos",
        "Eldermaw the Primordial",
        "Lady Drazare",
        "Ighal'for",
        "Mergothid",
        "Remains of the Innocent",
    },
    -- Gilneas City (GC)
    ["Gilneas City"] = {
        "Matthias Holtz",
        "Packmaster Ragetooth",
        "Judge Sutherland",
        "Dustivan Blackcowl",
        "Marshal Magnus Greystone",
        "Horsemaster Levvin",
        "Regent-Lady Celia Harlow",
        "Regent-Lord Mortimer Harlow",
        "Genn Greymane",
    },
    -- Maraudon (Mara)
    ["Maraudon"] = {
        "The Nameless Prophet",
        "Cursed Centaur",
        "Kolk",
        "Gelk",
        "Magra",
        "Veng",
        "Noxxion",
        "Razorlash",
        "Maraudos",
        "Lord Vyletongue",
        "Meshlok the Harvester",
        "Celebras the Cursed",
        "Landslide",
        "Tinkerer Gizlock",
        "Rotgrip",
        "Princess Theradras",
    },
    -- Uldaman (Ulda)
    ["Uldaman"] = {
        "Baelog",
        "Eric \"The Swift\"",
        "Olaf",
        "Revelosh",
        "Ironaya",
        "Obsidian Sentinel",
        "Ancient Stone Keeper",
        "Galgann Firehammer",
        "Grimlok",
        "Archaedas",
        "Archaedas: Lower",
    },
    -- Zul'Farrak (ZF)
    ["Zul'Farrak"] = {
        "Antu'sul",
        "Theka the Martyr",
        "Witch Doctor Zum'rah",
        "Nekrum Gutchewer",
        "Shadowpriest Sezz'ziz",
        "Dustwraith",
        "Sandfury Executioner",
        "Chief Ukorz Sandscalp",
        "Ruuzlu",
        "Hydromancer Velratha",
        "Gahz'rilla",
        "Zel'jeb the Ancient",
        "Champion Razjal the Quick",
        "Zerillis",
    },
    -- Sunken Temple (ST)
    ["Sunken Temple"] = {
        "Gasher",
        "Loro",
        "Hukku",
        "Zolo",
        "Mijan",
        "Zul'Lor",
        "Atal'alarion",
        "Spawn of Hakkar",
        "Avatar of Hakkar",
        "Jammal'an the Prophet",
        "Ogom the Wretched",
        "Dreamscythe",
        "Weaver",
        "Morphaz",
        "Hazzas",
        "Shade of Eranikus",
    },
    -- Dire Maul (DM)
    ["Dire Maul"] = {
        -- Dire Maul East
        "Pusillin",
        "Zevrim Thornhoof",
        "Hydrospawn",
        "Lethtendris",
        "Pimgib",
        "Alzzin the Wildshaper",
        "Isalien",
        -- Dire Maul North
        "Guard Mol'dar",
        "Stomper Kreeg",
        "Guard Fengus",
        "Guard Slip'kik",
        "Captain Kromcrush",
        "King Gordok",
        "Cho'Rush the Observer",
        -- Dire Maul West
        "Tendris Warpwood",
        "Illyanna Ravenoak",
        "Magister Kalendris",
        "Tsu'zee",
        "Immol'thar",
        "Lord Hel'nurath",
        "Prince Tortheldrin",
        "Revanchion",
    },
    -- Hateforge Quarry (HQ)
    ["Hateforge Quarry"] = {
        "High Foreman Bargul Blackhammer",
        "Engineer Figgles",
        "Corrosis",
        "Hatereaver Annihilator",
        "Har'gesh Doomcaller",
    },
    -- Karazhan Crypt (KC)
    ["Karazhan Crypt"] = {
        "Marrowspike",
        "Hivaxxis",
        "Corpsemuncher",
        "Guard Captain Gort",
        "Archlich Enkhraz",
        "Commander Andreon",
        "Alarus",
    },
    -- Blackrock Depths (BRD)
    ["Blackrock Depths"] = {
        -- Blackrock Mountain (BRM)
        "Overmaster Pyron",
        "Scarshield Quartermaster",
        "The Behemoth",
        -- Blackrock Depths (BRD)
        "Lord Roccor",
        "High Interrogator Gerstahn",
        "Anub'shiah",
        "Eviscerator",
        "Gorosh the Dervish",
        "Grizzle",
        "Hedrum the Creeper",
        "Ok'thor the Breaker",
        "Theldren",
        "Houndmaster Grebmar",
        "Pyromancer Loregrain",
        "Warder Stilgiss",
        "Verek",
        "Watchman Doomgrip",
        "Fineous Darkvire",
        "Lord Incendius",
        "Bael'Gar",
        "General Angerforge",
        "Golem Lord Argelmach",
        "Hurley Blackbreath",
        "Phalanx",
        "Plugger Spazzring",
        "Ribbly Screwspigot",
        "Ambassador Flamelash",
        "Panzor the Invincible",
        "The Lyceum",
        "Magmus",
        "Emperor Dagran Thaurissan",
        "Princess Moira Bronzebeard",
    },
    -- Stratholme (Strat)
    ["Stratholme"] = {
        "Skul",
        "Stratholme Courier",
        "Balzaphon",
        "Hearthsinger Forresten",
        "The Unforgiven",
        "Timmy the Cruel",
        "Malor the Zealous",
        "Crimson Hammersmith",
        "Cannon Master Willey",
        "Archivist Galford",
        "Balnazzar",
        "Sothos",
        "Jarien",
        "Magistrate Barthilas",
        "Stonespine",
        "Baroness Anastari",
        "Black Guard Swordsmith",
        "Nerub'enkan",
        "Maleki the Pallid",
        "Ramstein the Gorger",
        "Baron Rivendare",
        "Postmaster Malown",
        "Atiesh",
    },
    -- Scholomance (Scholo)
    ["Scholomance"] = {
        "Blood Steward of Kirtonos",
        "Kirtonos the Herald",
        "Jandice Barov",
        "Lord Blackwood",
        "Rattlegore",
        "Death Knight Darkreaver",
        "Marduk Blackpool",
        "Vectus",
        "Ras Frostwhisper",
        "Kormok",
        "Instructor Malicia",
        "Doctor Theolen Krastinov",
        "Lorekeeper Polkelt",
        "The Ravenian",
        "Lord Alexei Barov",
        "Lady Illucia Barov",
        "Darkmaster Gandling",
    },
    -- Stormwind Vault (SwV)
    ["Stormwind Vault"] = {
        "Aszosh Grimflame",
        "Tham'Grarr",
        "Black Bride",
        "Damian",
        "Volkan Cruelblade",
    },
    -- Lower Blackrock Spire (LBRS)
    ["Lower Blackrock Spire"] = {
        "Spirestone Butcher",
        "Highlord Omokk",
        "Spirestone Battle Lord",
        "Spirestone Lord Magus",
        "Shadow Hunter Vosh'gajin",
        "War Master Voone",
        "Mor Grayhoof",
        "Bannok Grimaxe",
        "Mother Smolderweb",
        "Crystal Fang",
        "Urok Doomhowl",
        "Quartermaster Zigris",
        "Halycon",
        "Gizrul the Slavener",
        "Ghok Bashguud",
        "Overlord Wyrmthalak",
        "Burning Felguard",
    },
    -- The Black Morass (BM)
    ["The Black Morass"] = {
        "Chronar",
        "Epidamu",
        "Drifting Avatar of Sand",
        "Time-Lord Epochronos",
        "Mossheart",
        "Antnormi",
        "Rotmaw",
    },
    -- Miscellaneous
    ["Miscellaneous"] = {
        -- Alliance Weapon Master's
        "Woo Ping",
        "Bixi Wobblebonk",
        "Buliwyf Stonehand",
        "Ilyenia Moonfire",
        -- Horde Weapon Master's
        "Hanashi",
        "Sayoc",
        "Archibald",
        "Ansekhwa",
    },
}

-- Raid aliases (short names -> full names)
T_Lib.RaidAliases = {
    -- ========================================================================
    -- RAIDS
    -- ========================================================================
    -- Upper Blackrock Spire (UBRS)
    ["UBRS"] = "Upper Blackrock Spire",
    ["Upper Blackrock Spire"] = "Upper Blackrock Spire",
    -- Onyxia's Lair (Ony)
    ["Ony"] = "Onyxia's Lair",
    ["Onyxia"] = "Onyxia's Lair",
    ["Onyxia's Lair"] = "Onyxia's Lair",
    -- Molten Core (MC)
    ["MC"] = "Molten Core",
    ["Molten Core"] = "Molten Core",
    -- Blackwing Lair (BWL)
    ["BWL"] = "Blackwing Lair",
    ["Blackwing Lair"] = "Blackwing Lair",
    -- Zul'Gurub (ZG)
    ["ZG"] = "Zul'Gurub",
    ["Zul'Gurub"] = "Zul'Gurub",
    -- Emerald Sanctum (ES)
    ["ES"] = "Emerald Sanctum",
    ["EmeraldSanctum"] = "Emerald Sanctum",
    ["Emerald Sanctum"] = "Emerald Sanctum",
    -- Lower Karazhan Halls (LKH)
    ["Kara10"] = "Lower Karazhan Halls",
    ["LKH"] = "Lower Karazhan Halls",
    ["Lower Karazhan Halls"] = "Lower Karazhan Halls",
    -- Ruins of Ahn'Qiraj (AQ20)
    ["AQ20"] = "Ruins of Ahn'Qiraj",
    ["RoA"] = "Ruins of Ahn'Qiraj",
    ["Ruins of Ahn'Qiraj"] = "Ruins of Ahn'Qiraj",
    -- Ahn'Qiraj / Temple of Ahn'Qiraj (AQ40)
    ["AQ40"] = "Ahn'Qiraj",
    ["Ahn'Qiraj"] = "Ahn'Qiraj",
    ["ToA"] = "Ahn'Qiraj",
    ["Temple of Ahn'Qiraj"] = "Ahn'Qiraj",
    -- Timbermaw Hold (TmH)
    ["TmH"] = "Timbermaw Hold",
    ["Timbermaw Hold"] = "Timbermaw Hold",
    -- Naxxramas (Naxx)
    ["Naxx"] = "Naxxramas",
    ["Naxxramas"] = "Naxxramas",
    -- Tower of Karazhan (ToK)
    ["Kara40"] = "Tower of Karazhan",
    ["Karazhan"] = "Tower of Karazhan",
    ["KarazhanUpper"] = "Tower of Karazhan",
    ["ToK"] = "Tower of Karazhan",
    ["TowerofKarazhan"] = "Tower of Karazhan",
    ["Tower of Karazhan"] = "Tower of Karazhan",

    -- ========================================================================
    -- DUNGEONS
    -- ========================================================================
    -- Ragefire Chasm (RFC)
    ["RFC"] = "Ragefire Chasm",
    ["Ragefire Chasm"] = "Ragefire Chasm",
    -- Frostmane Hollow (FH)
    ["FH"] = "Frostmane Hollow",
    ["Frostmane Hollow"] = "Frostmane Hollow",
    -- Deadmines (VC)
    ["VC"] = "Deadmines",
    ["Deadmines"] = "Deadmines",
    -- Wailing Caverns (WC)
    ["WC"] = "Wailing Caverns",
    ["Wailing Caverns"] = "Wailing Caverns",
    -- Shadowfang Keep (SFK)
    ["SFK"] = "Shadowfang Keep",
    ["Shadowfang Keep"] = "Shadowfang Keep",
    -- The Stockade (Stock)
    ["Stockade"] = "The Stockade",
    ["Stock"] = "The Stockade",
    -- Blackfathom Deeps (BFD)
    ["BFD"] = "Blackfathom Deeps",
    ["Blackfathom Deeps"] = "Blackfathom Deeps",
    -- Windhorn Canyon (WhC)
    ["WhC"] = "Windhorn Canyon",
    ["Windhorn Canyon"] = "Windhorn Canyon",
    -- Razorfen Kraul (RFK)
    ["RFK"] = "Razorfen Kraul",
    ["Razorfen Kraul"] = "Razorfen Kraul",
    -- Razorfen Downs (RFD)
    ["RFD"] = "Razorfen Downs",
    ["Razorfen Downs"] = "Razorfen Downs",
    -- Gnomeregan (Gnome)
    ["Gnomeregan"] = "Gnomeregan",
    ["Gnome"] = "Gnomeregan",
    -- The Crescent Grove
    ["The Crescent Grove"] = "The Crescent Grove",
    ["TCG"] = "The Crescent Grove",
    ["Crescent Grove"] = "The Crescent Grove",
    ["Crescent"] = "The Crescent Grove",
    -- Dragonmaw Retreat (DMR)
    ["DmR"] = "Dragonmaw Retreat",
    ["Dragonmaw Retreat"] = "Dragonmaw Retreat",
    ["Dragonmaw"] = "Dragonmaw Retreat",
    -- Scarlet Monastery (SM)
    ["SM"] = "Scarlet Monastery",
    ["SM Armory"] = "Scarlet Monastery",
    ["SM Cathedral"] = "Scarlet Monastery",
    ["SM Graveyard"] = "Scarlet Monastery",
    ["SM Library"] = "Scarlet Monastery",
    ["Scarlet Monastery"] = "Scarlet Monastery",
    -- Stormwrought Ruins
    ["SwR"] = "Stormwrought Ruins",
    ["Stormwrought Ruins"] = "Stormwrought Ruins",
    ["Stormwrought"] = "Stormwrought Ruins",
    ["SW Ruins"] = "Stormwrought Ruins",
    -- Gilneas City (GC)
    ["GC"] = "Gilneas City",
    ["Gilneas City"] = "Gilneas City",
    ["Gilneas"] = "Gilneas City",
    -- Maraudon (Mara)
    ["Maraudon"] = "Maraudon",
    ["Mara"] = "Maraudon",
    -- Uldaman (Ulda)
    ["Uldaman"] = "Uldaman",
    ["Ulda"] = "Uldaman",
    -- Zul'Farrak (ZF)
    ["ZF"] = "Zul'Farrak",
    ["Zul'Farrak"] = "Zul'Farrak",
    -- Sunken Temple (ST)
    ["Sunken Temple"] = "Sunken Temple",
    -- Dire Maul (DM)
    ["DM"] = "Dire Maul",
    ["DME"] = "Dire Maul",
    ["DMN"] = "Dire Maul",
    ["DMW"] = "Dire Maul",
    ["DireMaul"] = "Dire Maul",
    ["Dire Maul"] = "Dire Maul",
    -- Hateforge Quarry (HQ)
    ["HQ"] = "Hateforge Quarry",
    ["Hateforge Quarry"] = "Hateforge Quarry",
    -- Karazhan Crypt (KC)
    ["KC"] = "Karazhan Crypt",
    ["Kara Crypt"] = "Karazhan Crypt",
    ["Karazhan Crypt"] = "Karazhan Crypt",
    -- Blackrock Depths (BRD)
    ["BRD"] = "Blackrock Depths",
    ["Blackrock Depths"] = "Blackrock Depths",
    -- Stratholme (Strat)
    ["Stratholme"] = "Stratholme",
    ["Strat Live"] = "Stratholme",
    ["Strat UD"] = "Stratholme",
    -- Scholomance (Scholo)
    ["Scholomance"] = "Scholomance",
    ["Scholo"] = "Scholomance",
    -- Stormwind Vault (SwV)
    ["SwV"] = "Stormwind Vault",
    ["SV"] = "Stormwind Vault",
    ["Stormwind Vault"] = "Stormwind Vault",
    ["Storm Vault"] = "Stormwind Vault",
    -- Lower Blackrock Spire (LBRS)
    ["LBRS"] = "Lower Blackrock Spire",
    ["Lower Blackrock Spire"] = "Lower Blackrock Spire",
    -- The Black Morass (BM)
    ["BM"] = "The Black Morass",
    ["BlackMorass"] = "The Black Morass",
    ["The Black Morass"] = "The Black Morass",

    -- ========================================================================
    -- WORLD BOSSES
    -- ========================================================================
    -- World Bosses
    ["World Bosses"] = "World Bosses",
    ["Azshara"] = "World Bosses",
    ["Desolace"] = "World Bosses",
    ["Deadwind Pass"] = "World Bosses",
    ["Dustwallow Marsh"] = "World Bosses",
    ["Ashenvale"] = "World Bosses",
    ["Blasted Lands"] = "World Bosses",
    ["Eastern Plaguelands"] = "World Bosses",
    ["Tanaris"] = "World Bosses",
    ["Duskwood"] = "World Bosses",

    -- TW Custom Bosses
    ["TWCustom"] = "TW Custom Bosses",
    ["TW Custom Bosses"] = "TW Custom Bosses",

    -- Miscellaneous
    ["Other"] = "Other",
    ["Miscellaneous"] = "Miscellaneous",
}

-- Reverse mapping: boss -> raid
T_Lib.BossToRaid = {}

-- Initialize reverse mapping
function T_Lib:InitializeBossData()
    for raidName, bosses in pairs(self.Raids) do
        for _, bossName in ipairs(bosses) do
            self.BossToRaid[bossName] = raidName
        end
    end
end

-- Get exact boss name (check if exists)
function T_Lib:GetBossName(bossName)
    if self.BossToRaid[bossName] then
        return bossName
    end
    return nil
end

-- Get full raid name by alias or short name
function T_Lib:GetRaidName(raidAlias)
    return self.RaidAliases[raidAlias]
end

-- Get raid name by boss name
function T_Lib:GetRaidByBoss(bossName)
    return self.BossToRaid[bossName]
end

-- Check if name is a boss
function T_Lib:IsBoss(name)
    return self.BossToRaid[name] ~= nil
end

-- Check if name is a raid (or raid alias)
function T_Lib:IsRaid(name)
    return self.RaidAliases[name] ~= nil
end

-- Get all bosses in a raid by name or alias
function T_Lib:GetBossesByRaid(raidAlias)
    local raidName = self.RaidAliases[raidAlias] or raidAlias
    return self.Raids[raidName] or {}
end

-- Get boss count in a raid
function T_Lib:GetBossCount(raidAlias)
    local bosses = self:GetBossesByRaid(raidAlias)
    return #bosses
end

-- Get all raid names
function T_Lib:GetAllRaids()
    local raids = {}
    for raidName, _ in pairs(self.Raids) do
        table.insert(raids, raidName)
    end
    return raids
end

-- Get all raid aliases
function T_Lib:GetAllRaidAliases()
    local aliases = {}
    for alias, _ in pairs(self.RaidAliases) do
        table.insert(aliases, alias)
    end
    return aliases
end

-- Case-insensitive boss name comparison
function T_Lib:CompareBossName(inputName, bossName)
    if not inputName or not bossName then
        return false
    end
    return string.lower(inputName) == string.lower(bossName)
end

-- Find boss by partial name match
function T_Lib:FindBoss(partialName)
    if not partialName then
        return nil
    end
    local lowerInput = string.lower(partialName)
    for bossName, _ in pairs(self.BossToRaid) do
        if string.find(string.lower(bossName), lowerInput, 1, true) then
            return bossName
        end
    end
    return nil
end

-- Find raid by partial name match
function T_Lib:FindRaid(partialName)
    if not partialName then
        return nil
    end
    local lowerInput = string.lower(partialName)
    for raidName, _ in pairs(self.Raids) do
        if string.find(string.lower(raidName), lowerInput, 1, true) then
            return raidName
        end
    end
    return nil
end

-- Initialize on load
T_Lib:InitializeBossData()
