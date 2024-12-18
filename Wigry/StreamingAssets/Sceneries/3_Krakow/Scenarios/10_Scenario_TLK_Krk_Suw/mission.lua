-- SimRail - The Railway Simulator
-- LUA Scripting scenario
-- Version: 1.0
--
require("SimRailCore")
require("../../libs/EridorCommon")
require("../../libs/VbTrains")

DeveloperMode = function()
    return false
end

StartPosition = {55307.08, 221.42, -17977.95}
Sounds = {
    ['StaticNoise'] = {
        [Languages.Polish]  = "../../../Sounds/radio-static.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Hello'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Hello.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG3'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG3.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG4'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG4.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG5'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG5.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG6'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG6.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG7'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG7.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG8'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG8.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG9'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG9.mp3",
    },
    ['Krk_10_tlk_KrkSuw_KG10'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_KG10.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Tl1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Tl1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Tl2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Tl2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Sp1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Sp1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Sp2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Sp2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Ps1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Ps1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Ps2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Ps2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_BR0'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_BR0.mp3",
    },
    ['Krk_10_tlk_KrkSuw_BR1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_BR1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_BR2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_BR2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_BR3'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_BR3.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Gr1'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Gr1.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Gr2'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Gr2.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Ready'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Ready.mp3",
    },
    ['Krk_10_tlk_KrkSuw_Roger'] = {
        [Languages.Polish]  = "pl/Krk_10_tlk_KrkSuw_Roger.mp3",
    },
}
Trains = {}
ScenarioStep = -1
LoadDone = false
DepLock = false
Lock = false

--- Function called by SimRail when the loading of scenario starts - generally designed for setting up necessery data and preloading-assets
function PrepareScenario()

end

function EarlyScenarioStart()
    StartRecorder();
    Triggers()
    Ai()
    ScenarioStep = "KG_Start"
end

function StartScenario()
    CreateCoroutine(function()
        ShowMessageBox("#M_Weather", {
                ["Text"] = "#Sunny_Summer",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 06, 11, 19, 35, 00))
                    SetWeather(WeatherConditionCode.ScatteredClouds, 20, 1000, 70, 3500, 10, 5, 5, true)
                    Weather = 0
                end,
            }, {
                ["Text"] = "#Rainy_Autumn",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 10, 28, 19, 35, 00))
                    SetWeather(WeatherConditionCode.ModerateRain, 10, 1000, 70, 1500, 10, 5, 5, true)
                    Weather = 1
                end,
            }, {
                ["Text"] = "#Snowy_Winter",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 12, 28, 19, 35, 00))
                    SetWeather(WeatherConditionCode.Snow, -10, 1000, 70, 1000, 10, 5, 5, true)
                    Weather = 2
                end,
            }
        )
        
        coroutine.yield(CoroutineYields.WaitForSeconds, 1)
        
        ShowMessageBox("#Choose_your_train", {
                ["Text"] = "M_EP08",
                ["OnClick"] = function()
                    SpawnPlayer(LocomotiveNames.EP08_013)
                end
            }, {
                ["Text"] = "M_EP07",
                ["OnClick"] = function()
                    SpawnPlayer(LocomotiveNames.EP07_135)
                end
            }, {
                ["Text"] = "M_ET22",
                ["OnClick"] = function()
                    SpawnPlayer(LocomotiveNames.ET22_911)
                end
            }
        )

        coroutine.yield(CoroutineYields.WaitForSeconds, 1)
		
		ShowMessageBox("Prowadzimy pociąg TLK Wigry nr 10118. Zaczynamy na żeberku południowego zakładu taboru w Krakowie. Aby rozpocząć scenariusz zgłoś się do dyżurnego używając radia. Ustaw nastawnik na jazdę wstecz, aby wymanewrować skład w perony Krakowa Głównego - wspomagaj się kamerą nr 6. Kliknij OK, aby rozpocząć.", {
            ["Text"] = "OK",
            ["OnClick"] = function()
            end
        })
		
		coroutine.yield(CoroutineYields.WaitForSeconds, 3)
		
        Comms(nil, "Krk_10_tlk_KrkSuw_Hello")
    end)
end


function SpawnPlayer(loc)Trains[0] = SpawnTrainsetOnSignal(
        "Player",
        FindSignal("5465_KGA_Tm131"),
        250,
        false,  -- is reversed
        true,  --is player vehicle
        false, --dummy vehicle
        true, --teleport to cabin
        {
			CreateNewSpawnFullVehicleDescriptor(loc, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10ou_5151_2070_829_9, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R)
        }
    )
    
    Trains[0].SetState(DynamicState.dsStop, TrainsetState.tsShunting, true)
    Trains[0].SetPaperTimetable("paper")
    Trains[0].SetTimetable(LoadTimetableFromFile("Timetable.xml"), false)

    CreateCoroutine(function()
        coroutine.yield(CoroutineYields.WaitForSeconds, 10)
        Log("Start dep loop")
        while true do
            coroutine.yield(CoroutineYields.WaitForTrainsetDepartureWhistle, RailstockGetPlayerTrainset())
            coroutine.yield(CoroutineYields.WaitUntil, function ()
                return DepLock
            end)
            Comms("Caller_Conductor", "Krk_10_tlk_KrkSuw_Ready")
            coroutine.yield(CoroutineYields.WaitForSeconds, 60)
        end
    end)
end

function Triggers()
    CreateSignalTrigger(FindSignal("1952_KG_Tm315"), 306, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("1-rndPass", FindSignal("1952_KG_R11"), 300, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[1] = trainset
                CreateRoute("1952_KG_R11", "1952_KG_U4", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateTrackTriggerBack(FindTrack("t31917"), 6, 1, 
    {
        check = function(trainset)
            return trainset == Trains[1]
        end,
        result = function(trainset)
            CreateCoroutine(function ()
                CreateRoute("1952_KG_Tm323", "1952_KG_U12", VDOrderType.ManeuverRoute)
                CreateRoute("1952_KG_Tm315", "1952_KG_Tm323", VDOrderType.ManeuverRoute)
                Comms("KG", "Krk_10_tlk_KrkSuw_KG5")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_KG6")
            end)
        end
    })


    CreateSignalTrigger(FindSignal("1952_KG_U12"), 300, {
        check = PlayerTrainsetCheck, 
        result = function (state)
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 20, 0))
                coroutine.yield(CoroutineYields.WaitUntil, function ()
                    return Lock
                end)
                CreateRoute("1952_KG_T12", "1952_KG_R12kps", VDOrderType.TrainRoute)
                DepLock = true
                CreateRoute("2020_KPm_F", "2020_KPm_Akps", VDOrderType.TrainRoute)
            end)

            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForVehicleStop, RailstockGetPlayerVehicle())
                CreateRoute("1952_KG_Z4", "1952_KG_T10", VDOrderType.TrainRoute)
                Proceed(Trains[4])
                coroutine.yield(CoroutineYields.WaitForSeconds, 65)
                ScenarioStep = "KG_Dep"
                Comms("KG", "Krk_10_tlk_KrkSuw_KG7")
                coroutine.yield(CoroutineYields.WaitForSeconds, 75)
                CreateRoute("1952_KG_T3", "t31949kps", VDOrderType.TrainRoute)
                Proceed(Trains[5])
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("1937_Bt_W"), 1300, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("1937_Bt_W", "1937_Bt_D", VDOrderType.TrainRoute)
            end)
        end
    })
	
	CreateSignalTrigger(FindSignal("1937_Bt_D"), 150, {  -- 50m przed semaforem D lub inna odległość
    check = PlayerTrainsetCheck,
    result = function(state)
        CreateCoroutine(function()
            coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
			CreateRoute("1937_Bt_D", "1937_BT_B2kps", VDOrderType.TrainRoute)
        end)
    end
})
	
    CreateSignalTrigger(FindSignal("3475_Rc_D"), 1200, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("3475_Rc_D", "3475_Rc_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("5251_Zs_R"), 1500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("5251_Zs_E", "5251_Zs_Akps", VDOrderType.TrainRoute)
                CreateRoute("5251_Zs_R", "5251_Zs_E", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("5251_Zs_E"), 1400, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("2820_Nd_R", "2820_Nd_G", VDOrderType.TrainRoute)
                CreateRoute("2820_Nd_G", "2820_Nd_Akps", VDOrderType.TrainRoute)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("2820_Nd_G"), 1400, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("3923_Sm_E", "3923_Sm_Akps", VDOrderType.TrainRoute)
                CreateRoute("3923_Sm_M", "3923_Sm_E", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2756"), 1376, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioTunel"
        end
    })
    CreateSignalTrigger(FindSignal("Tl_D"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("Kz_X", "Kz_G2", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
				CreateRoute("Kz_G2", "Kz_Bkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateTrackTriggerFront(FindTrack("t8126"), 3, 1, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioSprowa"
        end
    })
    CreateSignalTrigger(FindSignal("Str_B"), 2000, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("Str_B", "St_Ckps", VDOrderType.TrainRoute)                
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L570_15N"), 1375, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioPsary"
        end
    })
    CreateSignalTrigger(FindSignal("Ps_G"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Kn_F", "Kn_Bkps", VDOrderType.TrainRoute)
            end)
        end
    })
	-- postój Włoszczowa Północ 
    CreateSignalTrigger(FindSignal("Kn_F"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("WP_U", "WP_J", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 20, 0))
                CreateRoute("WP_J", "WP_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WP_J"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Ol_W", "Ol_G", VDOrderType.TrainRoute)
                CreateRoute("Ol_G", "Ol_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
	--postój Opoczno południe
    CreateSignalTrigger(FindSignal("Ol_G"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Pl_D", "Pl_Akps", VDOrderType.TrainRoute)
                CreateRoute("OP_W", "OP_H", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 20, 0))
                CreateRoute("OP_H", "OP_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("OP_H"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Id_Z", "Id_K", VDOrderType.TrainRoute)
                CreateRoute("Id_K", "Id_Bkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Id_K"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("St_Z", "St_H", VDOrderType.TrainRoute)
                CreateRoute("St_H", "St_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_456"), 870, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioBR"
            CreateCoroutine(function()
                Comms("BR", "Krk_10_tlk_KrkSuw_BR0")
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("Se_H"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Kr_Z", "Kr_H", VDOrderType.TrainRoute)
                CreateRoute("Kr_H", "Kr_Bkps", VDOrderType.TrainRoute)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("L4_108"), 1641, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioGrodzisk"
        end
    })
	--Postój Grodzisk 
    CreateSignalTrigger(FindSignal("Gr_H14"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Pr_X", "Pr_K2", VDOrderType.TrainRoute)
                CreateRoute("Pr_K2", "Pr_G2", VDOrderType.TrainRoute)
                CreateRoute("Pr_G2", "Pr_Ckps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Pr_G2"), 500, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("Jz_F", "Jz_Akps", VDOrderType.TrainRoute)
                CreateRoute("Wl_S", "Wl_Dkps", VDOrderType.TrainRoute)
                CreateRoute("WZD_Z", "WZD_G6", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WZD_G6"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
                CreateRoute("WZD_G6", "WZD_Ckps", VDOrderType.TrainRoute)
                CreateRoute("WDC_B", "WDC_P", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WDC_P"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
                CreateRoute("WDC_P", "WDC_Ukps", VDOrderType.TrainRoute)
                CreateRoute("WSD_B", "WSD_K1", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WSD_K1"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeStart, RailstockGetPlayerTrainset())
                coroutine.yield(CoroutineYields.WaitForSeconds, 300)
                FinishMission(MissionResultEnum.Success)
            end)
        end
    })
end

function Ai()
    SpawnTrainsetOnSignalAsync("2-rndPass", FindSignal("1952_KG_U6"), 80, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[2] = trainset
        Halt(trainset)
    end)
	
	SpawnTrainsetOnSignalAsync("bocznica-KGA-1-rndPass", FindSignal("5465_KGA_Tm210"), 10, false, false, true, {
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R)
    }, function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[2] = trainset
        Halt(trainset)
    end)
	
	SpawnTrainsetOnSignalAsync("bocznica-KGA-2-rndPass", FindSignal("5465_KGA_Tm210"), 200, false, false, true, {
       CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10ou_5151_2070_829_9, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
		CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R)
    }, function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[2] = trainset
        Halt(trainset)
    end)
	
	SpawnTrainsetOnSignalAsync("bocznica-KGA-3-rndPass", FindSignal("5465_KGA_Tm208"), 100, false, false, true, {
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Adnu_5051_1908_095_8_, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Adnu_5051_1908_095_8_, false, "", 0, BrakeRegime.R)
    }, function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[2] = trainset
        Halt(trainset)
    end)
	
	SpawnTrainsetOnSignalAsync("bocznica-KGA-4-rndPass", FindSignal("5465_KGA_Tm206"), 50, false, false, true, {
	   CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bcdu_5051_5970_048_0_The80s, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bcdu_5051_5970_048_0_The80s, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Bcdu_5051_5970_048_0_The80s, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
       CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false, "", 0, BrakeRegime.R),
    }, function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[2] = trainset
        Halt(trainset)
    end)

    SpawnTrainsetOnSignalAsync("3-locos", FindSignal("1952_KG_T7"), 80, false, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_005, false),
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_092, false),
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_085, false)
    }, function (trainset)
        trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
        Trains[3] = trainset
    end)

    SpawnTrainsetOnSignalAsync("4-rndEzt", FindSignal("1952_KG_Z4"), 100, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        -- Dodać rozkład: jakiś Tarnów - Kraków
        Trains[4] = trainset
        Halt(trainset)
    end)
    
    SpawnTrainsetOnSignalAsync("5-rndPass", FindSignal("1952_KG_T3"), 50, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
        Trains[5] = trainset
        Halt(trainset)
    end)

    CreateSignalTrigger(FindSignal("2020_KPm_F"), 350, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("6-rnd", FindSignal("2020_KPm_B"), 2411, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[6] = trainset
            end)
        end
    })

    CreateSignalTrigger(FindSignal("1937_Bt_W"), 201, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("7-rndcargo", FindSignal("1937_BT_L2"), 30, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[7] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("8-rndcargo", FindSignal("1937_Bt_H"), 30, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[8] = trainset
                CreateCoroutine(function()
                    CreateRoute("1937_Bt_J", "1937_BT_A2kps", VDOrderType.TrainRoute)
                    CreateRoute("1937_Bt_H", "1937_Bt_J", VDOrderType.TrainRoute)
                    CreateRoute("783_Dl_D", "t38392kps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("5251_Zs_R"), 2340, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("6-rnd", FindSignal("3475_Rc_B"), 2281, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[6] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("5251_Zs_R"), 100, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("7-rndcargo", FindSignal("5251_Zs_F"), 13, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[7] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_3058"), 525, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("8-rndEzt", FindSignal("L8_3043"), 47, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[8] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_3032"), 550, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2984"), 819, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("9-rndPass", FindSignal("2820_Nd_L"), 18, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[9] = trainset
                VDSetRoute("2820_Nd_L", "2820_Nd_Pkps", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("10-rndcargo", FindSignal("2820_Nd_M"), 13, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[10] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2936"), 488, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("3923_Sm_M"), 67, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("11-rndEzt", FindSignal("3923_Sm_F"), 253, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[11] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("12-rndcargo", FindSignal("3923_Sm_D"), 13, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[12] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2882"), 1056, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("13-rnd", FindSignal("L8_2843"), 259, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[13] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2842"), 600,
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("14-rnd",FindSignal("L8_2811"), 1289, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[14] = trainset
            end)
            SpawnTrainsetOnSignalAsync("15-rndEzt-sbl", FindSignal("L8_2798"), 10, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                -- Rozkład - peron Miechów
                Trains[15] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2828"), 901, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            Proceed(Trains[15])
        end
    })
	
	--MIECHOW 
	--Miechów MI_E - spod Tego wyjezdza
    CreateSignalTrigger(FindSignal("L8_2798"), 200, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function ()
                CreateRoute("Mi_O", "Mi_F", VDOrderType.TrainRoute)
                CreateRoute("Mi_O", "Mi_E", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 20, 0))
				CreateRoute("Mi_E", "Mi_Akps", VDOrderType.TrainRoute) 
                --coroutine.yield(CoroutineYields.WaitForSeconds, 20)
            end)
            SpawnTrainsetOnSignalAsync("16-rndcargo", FindSignal("Mi_M"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[16] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2756"), 993, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("17-rnd",FindSignal("L8_2731"), 793, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[17] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2704"), 821, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("Tl_S"), 464, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("18-rnd",FindSignal("Tl_J"), 10, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[18] = trainset
                VDSetRoute("Tl_J", "Tl_Mkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L62_2666"), 782, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("19-rnd",FindSignal("L62_2639"), 588, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[19] = trainset
            end)
        end
    })
	--Kozłów KZ_X - na tym wjeżdza
	--Kozłów KZ_G2 - Spot tego wyjezda 
    CreateSignalTrigger(FindSignal("Kz_X"), 268, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("20-rndcargo", FindSignal("Kz_D"), 300, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[20] = trainset
                VDSetRoute("Kz_D", "Kz_S7", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("21-ex-4", FindSignal("Kz_C"), 4500, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[21] = trainset
                VDSetRoute("Kz_C", "Kz_S1", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("22-rndEzt", FindSignal("Kz_G4"), 430, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[22] = trainset
                VDSetRoute("Kz_G4", "Kz_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateTrackTriggerFront(FindTrack("t17452"), 5, 1,
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("Sp_B"), 243, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("23-rnd",FindSignal("Sp_D"), 5000, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[23] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Str_B"), 2020, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("Ps_W"), 451, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("24-rndWag",FindSignal("Ps_L"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[24] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("25-rndCargo",FindSignal("Ps_O"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[25] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("26-rndCargo",FindSignal("Ps_J"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[26] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1674"), 392, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1656"), 1167, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("27-rndWag",FindSignal("L4_1625"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[27] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Kn_F"), 238, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("28-rndCargo",FindSignal("Kn_A"), 1517, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[28] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1564"), 1720, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("29-rndWag",FindSignal("WP_M"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[29] = trainset
                VDSetRoute("WP_M", "WP_Tkps", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("29a-rndCargo",FindSignal("WP_P"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[291] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1510"), 1038, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("31-ex-5", FindSignal("L4_1469"), 45, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[31] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1454"), 1215, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("32-rndCargo", FindSignal("L4_1433"), 1557, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[32] = trainset
            end)

        end
    })
    CreateSignalTrigger(FindSignal("L4_1392"), 1948, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("33-rndWag", FindSignal("L4_1355"), 8, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[33] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1332"), 1800, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("34-rndWag", FindSignal("L4_1295"), 18, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[34] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1280"), 1036, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("35-rndCargo", FindSignal("L4_1267"), 1090, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[35] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Ol_W"), 149, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("36-rndCargo",FindSignal("Ol_O"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[36] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("37-rndWag",FindSignal("Ol_H"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[37] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1216"), 1300, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("38-rndWag", FindSignal("L4_1181"), 44, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[38] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1162"), 1332, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("39-rndWag", FindSignal("L4_1131"), 1043, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[39] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1108"), 855, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("40-rndCargo", FindSignal("L4_1087"), 1788, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[40] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1018"), 1874, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("41-rndWag", FindSignal("L4_1001"), 789, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[41] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_982"), 297, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("42-rndWag", FindSignal("L4_953"), 400, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[42] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("OP_W"), 197, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            --SpawnTrainsetOnSignalAsync("43-rndWag",FindSignal("OP_L"), 340, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
            --    trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
            --    Trains[43] = trainset
            --    Halt(trainset)
            --end)
            SpawnTrainsetOnSignalAsync("44-rndCargo",FindSignal("OP_O"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[44] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_900"), 436, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("45-rndWag", FindSignal("L4_855"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[45] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Id_Z"), 131, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("47-rndCargo",FindSignal("Id_T5"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[47] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("48-rndCargo",FindSignal("Id_T9"), 20, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsDeactivation, true)
                Trains[48] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("49-rndEzt",FindSignal("Id_M10"), 35, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsDeactivation, true)
                Trains[49] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("50-rndEzt",FindSignal("Id_M14"), 15, false, false, true, CreateRandomEzt(Loc.Katowice), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsDeactivation, true)
                Trains[50] = trainset
                Halt(trainset)
            end)
            --SpawnTrainsetOnSignalAsync("51-rndWag",FindSignal("Id_L"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
            --    trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
            --    Trains[51] = trainset
            --    Halt(trainset)
            --end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_784"), 887, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("51-rndCargo", FindSignal("L573_33N"), 10, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[51] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_750"), 950, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("52-ex-1", FindSignal("L4_711"), 1751, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[52] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_668"), 2253, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("53-rndWag", FindSignal("L4_653"), 1069, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[53] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_634"), 411, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("54-ex-2", FindSignal("L4_595"), 347, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[54] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("St_Z"), 163, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("55-rndWag",FindSignal("St_P"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[55] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("56-rndCargo",FindSignal("St_J"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[56] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_544"), 986, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("57-rndWag", FindSignal("L4_499"), 64, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[57] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_476"), 1841, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("58-rndWag", FindSignal("L4_439"), 9, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[58] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("BR_D"), 926, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("59-rndCargo",FindSignal("L4_346"), 728, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[59] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_331N"), 947, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("60-rndCargo",FindSignal("L4_292N"), 325, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET25_002, false)
            }, function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[60] = trainset
                SetTrainsetGoingLeftTrack(trainset, true)
                Proceed(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Se_W"), 243, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("61-rndCargo",FindSignal("Se_S"), 10, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[61] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("62-rndWag",FindSignal("Se_R"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[62] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("63-rndWag",FindSignal("Se_O"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[63] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("64-rndCargo",FindSignal("Se_K"), 10, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[64] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_198"), 1557, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("65-rndWag", FindSignal("L4_167"), 812, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[65] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Kr_Z"), 209, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("66-rndWag",FindSignal("Kr_J"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[66] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_108"), 783, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("67-rndWag", FindSignal("L4_73"), 307, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[67] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_50"), 1156, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("68-rnd", FindSignal("L1_327"), 1187, false, false, true, CreateRandomTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[68] = trainset
            end)
            SpawnTrainsetOnSignalAsync("69-rndWag", FindSignal("L4_31"), 1167, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[69] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Gr_X"), 121, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("70-rndEzt",FindSignal("Gr_H4"), 342, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[70] = trainset
                Halt(trainset)
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L1_266"), 1388, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("72-rndEzt",FindSignal("L447_271"), 896, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[72] = trainset
            end)
            SpawnTrainsetOnSignalAsync("73-rndWag", FindSignal("L1_237S"), 483, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[73] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_222S"), 739, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("74-rndEzt",FindSignal("L447_208"), 1155, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[74] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("75-rndEzt",FindSignal("L447_193"), 808, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[75] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Pr_X"), 174, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("76-rndWag",FindSignal("Pr_L7"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[76] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("77-rndCargo",FindSignal("Pr_K5"), 10, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[77] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_140S"), 1037, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("78-rndEzt",FindSignal("L447_127"), 182, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[78] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_102S"), 1087, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("79-rndWag", FindSignal("L1_87S"), 960, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[79] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Wl_S"), 198, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("80-rndEzt",FindSignal("L447_56"), 456, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[80] = trainset
                VDSetRoute("WZD_O", "WZD_H20", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WZD_Z"), 140, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("81-rndWag", FindSignal("L2_4D"), 442, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[81] = trainset
                VDSetRoute("WZD_E", "WZD_K1", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("82-rndWag",FindSignal("WZD_G8"), 18, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[82] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_1D"), 96, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("83-rndEzt",FindSignal("L448_6"), 10, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[83] = trainset
                Halt(trainset)
            end)
            
            SpawnTrainsetOnSignalAsync("84-ex-3", FindSignal("Kz_C"), 4500, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[84] = trainset
                VDSetRoute("WDC_G", "WDC_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WDC_P"), 754, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("85-rndWag",FindSignal("WDC_H"), 63, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[85] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WDC_P"), 240, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("86-rndWag", FindSignal("WDC_W"), 1000, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[86] = trainset
                VDSetRoute("WDC_W", "WDC_G", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_3DD"), 278, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("87-rndWag", FindSignal("L2_12D"), 187, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[87] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_15D"), 266, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("88-rndEzt", FindSignal("L448_28"), 359, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[88] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WSD_B"), 64, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("88-rndEzt", FindSignal("WSD_J5"), 19, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[88] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("89-rndWag", FindSignal("WSD_J4"), 20, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[89] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("90-rndWag", FindSignal("WSD_K3"), 40, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[90] = trainset
                Halt(trainset)
            end)
        end
    })
    


end

function OnVirtualDispatcherReady()
    Log("VD is ready, setting route...")
    LoadDone = true
end

function OnPlayerRadioCall(trainsetInfo, radio_SelectionCall)
    Log("Call pressed in " .. trainsetInfo.name .. ". Call type: " .. tostring(radio_SelectionCall) .. ", Step: " ..tostring(ScenarioStep))
    if(ScenarioStep == "KG_Start") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_KG1")
                Comms("KG", "Krk_10_tlk_KrkSuw_KG2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_KG3")
                Comms("KG", "Krk_10_tlk_KrkSuw_KG4")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Roger")
                coroutine.yield(CoroutineYields.WaitUntil, function ()
                    return LoadDone
                end)
                CreateRoute("5465_KGA_Tm211", "1952_KG_Tm301", VDOrderType.ManeuverRoute)
                CreateRoute("1952_KG_Tm301", "1952_KG_Tm307", VDOrderType.ManeuverRoute)
                CreateRoute("1952_KG_Tm307", "1952_KG_Tm315", VDOrderType.ManeuverRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "KG_Dep") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_KG8")
                Comms("KG", "Krk_10_tlk_KrkSuw_KG9")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_KG10")

                Lock = true
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioTunel") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 4) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Tl1")
                Comms("Tl", "Krk_10_tlk_KrkSuw_Tl2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Roger")

                CreateRoute("Tl_D", "Tl_Akps", VDOrderType.TrainRoute) 
                CreateRoute("Tl_S", "Tl_D", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioSprowa") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 5) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Sp1")
                Comms("Sp", "Krk_10_tlk_KrkSuw_Sp2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Roger")
                
                CreateRoute("Sp_B", "Sp_Ckps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioPsary") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Ps1")
                Comms("Ps", "Krk_10_tlk_KrkSuw_Ps2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Roger")

                CreateRoute("Ps_G", "Ps_Akps", VDOrderType.TrainRoute)
                CreateRoute("Ps_W", "Ps_G", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioBR") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_BR1")
                Comms("BR", "Krk_10_tlk_KrkSuw_BR2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_BR3")

                CreateRoute("BR_D", "BR_Bkps", VDOrderType.TrainRoute)
                CreateRoute("Se_W", "Se_H", VDOrderType.TrainRoute)
                CreateRoute("Se_H", "Se_Bkps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioGrodzisk") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 2) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Gr1")
                Comms("Gr", "Krk_10_tlk_KrkSuw_Gr2")
                Comms("Caller_You", "Krk_10_tlk_KrkSuw_Roger")
				CreateRoute("Gr_X", "Gr_H14", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 20, 0))
                CreateRoute("Gr_H14", "Gr_Ckps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
end