local function ischinese(object)
   
    if object ~= "" then
        local lenInByte = string.len(object)
        for i = 1, lenInByte do
            local curByte = string.byte(object, i)
            -- local byteCount = 1
            if curByte <= 0 or curByte > 127 then
                return true
            end
        end
    end
    return false
end
local loc = GetLocale()
function GetENItem(key)
    if not key then return end
    if PLSNEFrame or loc == "zhCN" or not ischinese(key) then return key end
    local str = key
    if strfind(key, "exact") then
        _, _, str = string.find(key, "(.*)%/exact")
    end
    for i, var in pairs(MrBCatItems) do
        if var == str then
            return i .. "/exact"
        end
    end
    return key;
end

function MrBCatGetLib(key, unit)
    --if PLSNEFrame then return key end
    if loc == "zhCN" then return key end
    if unit == "unit" then
        reqtab = MrBCatUnits
    elseif unit == "item" then
        reqtab = MrBCatItems
    elseif unit == "area" then
        reqtab = MrBCatAreas
    end
    if key ~= "" and reqtab[key] then
        return reqtab[key]
    end
    return key
end

local function ChangeMapNametoen(object)
    if not MrBCatAreas then return object end
    for i, v in pairs(MrBCatAreas) do
        if v == object then
            return i
        end
    end
    return object
end
local function zGetMapIDByName(areaname)
    if not pfDB and not pfDB["zones"] then return end
    for id, name in pairs(pfDB["zones"]["enUS"]) do
        if name == areaname then
            return id
        end
    end
end
function MrBCat_GetMapIdByName(areaname)
    --if loc=="zhCN" then return object end
    if loc=="zhCN" then
        areaname = ChangeMapNametoen(areaname)
    end
    local mapid =zGetMapIDByName(areaname)
    return mapid
end

function GetpfDBtitle(key)
    if loc == "zhCN" then return key end
    local res = pfDBtitle[key]
    if res then
        return res
    else
        return key;
    end
end
