-- Eridor's common package v1.0
-- Last edit: 28.11.2024

EN57 = {
    LocomotiveNames.EN57_009,
    LocomotiveNames.EN57_047,
    LocomotiveNames.EN57_614,
    LocomotiveNames.EN57_1003,
    LocomotiveNames.EN57_1051,
    LocomotiveNames.EN57_1219,
    LocomotiveNames.EN57_1316,
}
EN57_KM = {
    LocomotiveNames.EN57_1000,
    LocomotiveNames.EN57_1796,
}
EN71 = {
    LocomotiveNames.EN71_005,
}
EN96 = {
    LocomotiveNames.EN96_001,
}
EN76_KS = {
    LocomotiveNames.EN76_006,
}
EN76_KM = {
    LocomotiveNames.EN76_022,
}
RegionSpecificEzt = {
    LocomotiveNames.EN76_006,
    LocomotiveNames.EN76_022,
    LocomotiveNames.EN57_038,
}

PassengerFastLocos = { 
    LocomotiveNames.EP08_001,
    LocomotiveNames.EP08_013,
    LocomotiveNames.EP07_135,
    LocomotiveNames.EP07_174,
}
PassengerSlowLocos = {
    LocomotiveNames.EU07_085,
    LocomotiveNames.EU07_241,
    LocomotiveNames.EU07_085,
    LocomotiveNames.EP07_194,
}
FreightLocos = {
    LocomotiveNames.ET22_243,
    LocomotiveNames.ET22_256,
    LocomotiveNames.ET22_644,
    LocomotiveNames.ET22_836,
    LocomotiveNames.ET22_911,
    LocomotiveNames.ET22_1163,
    LocomotiveNames.ET25_002,
    LocomotiveNames.EU07_068,
    LocomotiveNames.EU07_070,
    LocomotiveNames.EU07_096,
    LocomotiveNames.EU07_153,
    LocomotiveNames.EU07_193,
    LocomotiveNames.EU07_241,
}

PassOldCarts1 = {
    PassengerWagonNames.Adnu_5051_1900_189_7,
    PassengerWagonNames.Adnu_5051_1908_095_8_,
}
PassOldPaintedCarts1 = {
    PassengerWagonNames.A9ou_5051_1908_136_0,
    PassengerWagonNames.A9ou_5151_1970_003_4,
}
PassNewCarts1 = {
    PassengerWagonNames.A9mnouz_6151_1970_214_5,
    PassengerWagonNames.A9mnouz_6151_1970_234_3
}
PassOldCarts2 = {
    PassengerWagonNames.B10ou_5051_2000_608_3,
    PassengerWagonNames.B10nou_5051_2008_607_7,
}
PassOldPaintedCarts2 = {
    PassengerWagonNames.B10ou_5151_2070_829_9,
    PassengerWagonNames.B10nouz_5151_2071_102_0,
}
PassNewCarts2 = {
    PassengerWagonNames.B10bmnouz_6151_2071_105_1,
    PassengerWagonNames.B11gmnouz_6151_2170_107_7,
    PassengerWagonNames.B11bmnouz_6151_2170_064_0,
    PassengerWagonNames.B11bmnouz_6151_2170_098_8
}
PassNewCartsRestaurant = {
    PassengerWagonNames.WRmnouz_6151_8870_191_1
}

FreightCarts = {
    {
        -- węglarki klasyczne
        FreightWagonNames.EAOS_3151_5349_475_9,
        FreightWagonNames.EAOS_3151_5351_989_9,
    },
    {
        -- węglarki nietuzinkowe
        FreightWagonNames.EAOS_3351_5356_394_5,
        FreightWagonNames.EAOS_3356_5300_118_0,
        FreightWagonNames.EAOS_3356_5300_177_6
    },
    {
        -- nowe węglarki
        FreightWagonNames._441V_31516635283_3,
        FreightWagonNames._441V_31516635512_5
    },
    {
        -- platformy
        FreightWagonNames.SGS_3151_3944_773_6,
        FreightWagonNames.SGS_3151_3947_512_5
    },
    {
        -- beczki bez czerwonych
        FreightWagonNames.Zaes_3351_0079_375_1,
        FreightWagonNames.Zaes_3351_7881_520_5,
        FreightWagonNames.Zaes_3351_7980_031_3,
        FreightWagonNames.Zaes_3351_7982_861_1,
    },
    {
        -- beczki bez niebieskich
        FreightWagonNames.Zaes_3351_7980_031_3,
        FreightWagonNames.Zaes_3351_7982_861_1,
        FreightWagonNames.Zaes_3451_7981_215_0,
        FreightWagonNames.Zas_8451_7862_699_8
    },
    {
        -- gruszki
        FreightWagonNames.UACS_3351_9307_587_6
    }
}

function CreateRandomTrain(loc)
    return CreateRandomTrainset(loc, 0, 3)
end

function CreateRandomEzt(loc)
    return CreateRandomTrainset(loc, 0, 1)
end

function CreateRandomPassengerWagonTrain(loc)
    return CreateRandomTrainset(loc, 1, 2)
end

function CreateRandomPassengerTrain(loc)
    return CreateRandomTrainset(loc, 0, 2)
end

function CreateRandomCargoTrain(loc)
    return CreateRandomTrainset(loc, 2, 3)
end

function CreateRandomWagonTrain(loc)
    return CreateRandomTrainset(loc, 1, 3)
end

---@return array<SpawnVehicleDescription> trainset
function CreateRandomTrainset(loc, typeLow, TypeHigh)
    local trainset = {}
    local type = GetRandomInt(typeLow, TypeHigh)
    local order = GetRandomInt(0, 2)

    if(type == 0) then
        --ezt
        local subtype = GetEztType()
        local quantity = GetEztQuantity()
        Log("S: ezt [" .. subtype .. "] * " .. quantity)
        for i = 1, quantity do
            table.insert(trainset, CreateVehicle(GetSemiRandomEzt(subtype, loc)))
        end

    elseif type == 1 then 
        --pass train
        local subtype = GetRandomInt(0, 2)
        if subtype == 0 then
            --slow, old            
            local quantity = GetPassengerCartsQuantity(false)
            local secondClass = GetRandomInt(math.ceil(quantity / 2), quantity)
            local firstClass = quantity - secondClass
            Log("S: pass [" .. subtype .. "], quant: " .. quantity .. " [I*" .. firstClass .. ", II*" .. secondClass .. "]")
            local colors = GetRandomInt(0, 2)
            if colors == 0 then
                --red-green
                trainset = ConcatArray(trainset, CreateCartList(PassOldCarts1, firstClass))
                trainset = ConcatArray(trainset, CreateCartList(PassOldCarts2, secondClass))
            else
                --blue
                trainset = ConcatArray(trainset, CreateCartList(PassOldPaintedCarts1, firstClass))
                trainset = ConcatArray(trainset, CreateCartList(PassOldPaintedCarts2, secondClass))
            end

            trainset = order == 0 and trainset or Reverse(trainset)
            table.insert(trainset, 1, CreateVehicle(GetRandomObj(PassengerSlowLocos)))
        else
            --fast, new
            local quantity = GetPassengerCartsQuantity(true)
            local restaurantCarts = GetRestaurantCarts(quantity)
            local secondClass = GetRandomInt(math.ceil(quantity / 2), quantity - restaurantCarts)
            local firstClass = quantity - secondClass - restaurantCarts

            Log("S: pass [" .. subtype .. "], quant: " .. quantity .. " [I*" .. firstClass .. ", II*" .. secondClass .. ", R*" .. restaurantCarts .. "]")
            local age = GetRandomInt(0, 2)
            if age == 0 then
                --new
                trainset = ConcatArray(trainset, CreateCartList(PassNewCarts1, firstClass))
                trainset = ConcatArray(trainset, CreateCartList(PassNewCartsRestaurant, restaurantCarts))
                trainset = ConcatArray(trainset, CreateCartList(PassNewCarts2, secondClass))
            else
                --old
                trainset = ConcatArray(trainset, CreateCartList(PassOldPaintedCarts1, firstClass))
                trainset = ConcatArray(trainset, CreateCartList(PassOldPaintedCarts2, secondClass))
            end
            
            trainset = order == 0 and trainset or Reverse(trainset)
            table.insert(trainset, 1, CreateVehicle(GetRandomObj(PassengerFastLocos)))
        end
    elseif type == 2 then 
        --freight train
        local specialCases = GetRandomInt(0, 40)
        if specialCases == 1 then
            --locos 
            local quantity = GetRandomInt(1, 6)
            Log("S: cargo special: ".. quantity .. " locos")
            for i = 1, quantity do
                table.insert(trainset, CreateVehicle(GetRandomObj(ConcatArray(PassengerFastLocos, ConcatArray(PassengerSlowLocos, FreightLocos)))))
            end
        elseif specialCases == 2 then
            --loco+ezt
            Log("S: cargo special: ezt")
            table.insert(trainset, CreateVehicle(GetRandomObj(ConcatArray(EN57, ConcatArray(EN71, ConcatArray(EN96, RegionSpecificEzt))))))
        elseif specialCases == 3 then
            --just loco
            Log("S: cargo special: solo loco")
        else
            local subtype = GetRandomInt(1, #FreightCarts + 1)
            local quantity = GetRandomInt(10, 30)
            local cartContent = GetCartContent(subtype)
            for i = 1, quantity do
                table.insert(trainset, CreateCargoVehicle(GetRandomObj(FreightCarts[subtype]), GetRandomObj(cartContent)))
            end
            local extraFrontLoc = GetRandomInt(0, 30)
            local extraBackLoc = GetRandomInt(0, 30)
            if extraFrontLoc == 0 then
                table.insert(trainset, 1, CreateVehicle(GetRandomObj(FreightLocos)))
            end
            if extraBackLoc == 0 then
                table.insert(trainset, CreateVehicle(GetRandomObj(FreightLocos)))
            end
            Log("S: cargo [" .. subtype .. "] * " .. quantity .. "; extra front [" .. extraFrontLoc .. "] back [" .. extraBackLoc .. "]")
        end
       
        table.insert(trainset, 1, CreateVehicle(GetRandomObj(FreightLocos)))
    end

    return trainset
end

function GetCartContent(wagonType)
    if wagonType == 1 or wagonType == 2 then
        local cargo = GetRandomInt(0, 5)
        if cargo == 0 then return {FreightLoads_412W_v4.Ballast }
        elseif cargo == 1 then return {FreightLoads_412W_v4.Coal}
        elseif cargo == 2 then return {FreightLoads_412W_v4.Sand}
        elseif cargo == 3 then return {FreightLoads_412W_v4.WoodLogs}
        else return {}
        end

    elseif wagonType == 3 then
        local cargoType = GetRandomInt(0, 4)
        if cargoType == 0 then
            return {
                FreightLoads_412W.RandomContainer1x20,
                FreightLoads_412W.RandomContainer1x40,
                FreightLoads_412W.RandomContainer2040,
                FreightLoads_412W.RandomContainer2x20,
                FreightLoads_412W.RandomContainer3x20,
                FreightLoads_412W.RandomContainerAll
            }
        else 
            local cargo = GetRandomInt(0, 11)
            if cargo == 0 then return {FreightLoads_412W.Concrete_slab }
            elseif cargo == 1 then return {FreightLoads_412W.Gas_pipeline}
            elseif cargo == 2 then return {FreightLoads_412W.Pipeline}
            elseif cargo == 3 then return {FreightLoads_412W.Sheet_metal}
            elseif cargo == 4 then return {FreightLoads_412W.Steel_circle}
            elseif cargo == 5 then return {FreightLoads_412W.T_beam}
            elseif cargo == 6 then return {FreightLoads_412W.Tie}
            elseif cargo == 7 then return {FreightLoads_412W.Tree_trunk}
            elseif cargo == 8 then return {FreightLoads_412W.Wooden_beam}
            elseif cargo == 9 then return {FreightLoads_412W.Sheet_metal, FreightLoads_412W.Steel_circle}
            else return {}
            end
        end

    elseif wagonType == 4 then
        local cargo = GetRandomInt(0, 5)
        if cargo == 0 then return {FreightLoads_406Ra.Crude_Oil }
        elseif cargo == 1 then return {FreightLoads_406Ra.Ethanol}
        elseif cargo == 2 then return {FreightLoads_406Ra.Heating_Oil}
        elseif cargo == 3 then return {FreightLoads_406Ra.Petrol}
        else return {}
        end
        return {FreightLoads_406Ra[cargo]}
    else 
        return {}
    end
end

function CreateCartList(list, count)
    local output = {}
    if(count > 0) then
        for i = 1, count do
            table.insert(output, CreateVehicle(GetRandomObj(list)))
        end
    end
    return output
end

function Reverse(tab)
    
    if(#tab > 0) then
        for i = 1, math.floor(#tab/2), 1 do
            tab[i], tab[#tab-i+1] = tab[#tab-i+1], tab[i]
        end
    end
    return tab
end

function ConcatArray(a, b)
    local data = {}
    for k,v in pairs(a) do
        data[k] = v
    end
    
    if(#b > 0) then
        for i = 1, #b do
            table.insert(data, b[i])
        end
    end
    return data
  end
  

function CreateCargoVehicle(veh, cargo)
    return CreateNewSpawnFullVehicleDescriptor(veh, false, cargo, 10, BrakeRegime.P)
end

function CreateVehicle(veh)
    return CreateNewSpawnFullVehicleDescriptor(veh, false, "", 0, BrakeRegime.P)
end



function GetSemiRandomEzt(subtype, loc)
    if subtype == Types.EN57 then 
        if(loc == Loc.Warszawa) then return GetRandomObj(EN57_KM)
        else return GetRandomObj(EN57) end
        
    elseif subtype == Types.EN71 then return GetRandomObj(EN71)
    elseif subtype == Types.EN96 then
        local subroll = GetRandomInt(0, 3)
        if(subroll == 0) then
            return GetRandomObj(EN96)
        else
            if(loc == Loc.Warszawa) then return GetRandomObj(EN76_KM)
            elseif(loc == Loc.Katowice) then return GetRandomObj(EN76_KS)
            else return GetRandomObj(EN96) end
        end
        
    end
end

function GetEztQuantity() 
    local rnd = GetRandomInt(0, 20)
    if rnd == 0 then return 3
    elseif rnd < 13 then return 2
    else return 1
    end
end

function GetPassengerCartsQuantity(isIc)
    local standaloneLoco = GetRandomInt(0, 100)
    if standaloneLoco == 0 then
        return 0
    end
    if isIc then
        return GetRandomInt(3, 12)
    else
        return GetRandomInt(2, 9)
    end
    
end

function GetEztType() 
    local rnd = GetRandomInt(0, 10)
    if rnd < 5 then return Types.EN57
    elseif rnd < 7 then return Types.EN71
    else return Types.EN96
    end
end

function GetRestaurantCarts(quantity)
    if quantity < 4 then
        return 0
    elseif quantity < 8 then
        local rnd = GetRandomInt(0, 2)
        if rnd == 0 then return 0
        else return 1
        end
    else
        return 1
    end
    
end

function GetRandomObj(table)
    if #table == 0 then
        return ""
    end
    local rnd = GetRandomInt(1, #table + 1)
    local ret = table[rnd]
    return ret
end

---------

Types = {
	EN57 = 0,
	EN71 = 1,
	EN96 = 2,
}

Loc = {
    Other = 0,
    Katowice = 1,
    Warszawa = 2
}
