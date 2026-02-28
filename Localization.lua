-- =============================================================================
-- T-Lib: Localization Module
-- =============================================================================
-- Localization support for T-Lib
--
-- Usage:
--   T_Lib.L:GetText(key)        -- get localized text by key
--   T_Lib.L:SetLocale(locale)   -- set current locale (enUS, ruRU, etc.)
--   T_Lib.L:GetLocale()         -- get current locale
--
-- Example:
--   local text = T_Lib.L:GetText("BOSS_FOUND")
--   T_Lib.L:SetLocale("ruRU")
-- =============================================================================

T_Lib = T_Lib or {}

-- Localization table
T_Lib.L = {}

-- Current locale (detect from game client)
local currentLocale = GetLocale()

-- Localization strings database
local L = {
    -- English (default)
    enUS = {
        -- Boss data
        BOSS_FOUND = "Boss found: %s",
        BOSS_NOT_FOUND = "No boss found",
        RAID_FOUND = "Raid: %s",
        UNKNOWN_RAID = "Unknown raid",

        -- Common
        YES = "Yes",
        NO = "No",
        UNKNOWN = "Unknown",
    },

    -- Russian
    ruRU = {
        -- Boss data
        BOSS_FOUND = "Босс найден: %s",
        BOSS_NOT_FOUND = "Босс не найден",
        RAID_FOUND = "Рейд: %s",
        UNKNOWN_RAID = "Неизвестный рейд",

        -- Common
        YES = "Да",
        NO = "Нет",
        UNKNOWN = "Неизвестно",
    },
}

-- Get text by key
function T_Lib.L:GetText(key)
    local localeData = L[currentLocale] or L.enUS
    return localeData[key] or L.enUS[key] or key
end

-- Set current locale
function T_Lib.L:SetLocale(locale)
    if L[locale] then
        currentLocale = locale
    end
end

-- Get current locale
function T_Lib.L:GetLocale()
    return currentLocale
end

-- Add new localization string
function T_Lib.L:AddString(locale, key, text)
    if not L[locale] then
        L[locale] = {}
    end
    L[locale][key] = text
end
