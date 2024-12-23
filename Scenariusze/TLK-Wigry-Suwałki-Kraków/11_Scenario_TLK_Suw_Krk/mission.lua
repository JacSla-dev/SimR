-- SimRail - The Railway Simulator
-- LUA Scripting scenario
-- Version: 1.0
--
require("SimRailCore")
require("../../libs/EridorCommon")
require("libs/VbTrains")

DeveloperMode = function()
    return false
end

StartPosition = {128053.50, 91.89, 225281.20}
SetCameraView(CameraView.FirstPersonWalkingOutside)

Sounds = {
    ['StaticNoise'] = {
        [Languages.Polish]  = "../../../Sounds/radio-static.mp3",
    },
    ['Krk_11_tlk_WawKrk_Hello'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Hello.mp3",
    },
    ['Krk_11_tlk_WawKrk_Ready'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Ready.mp3",
    },
    ['Krk_11_tlk_WawKrk_Roger'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Roger.mp3",
    },
    ['Krk_11_tlk_WawKrk_Wwa0'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Wwa0.mp3",
    },
	['Krk_11_tlk_WawKrk_Wwa1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Wwa1.mp3",
    },
	['Krk_11_tlk_WawKrk_Wwa2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Wwa2.mp3",
    },
	['Krk_11_tlk_WawKrk_Wwa3'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Wwa3.mp3",
    },
	['Krk_11_tlk_WawKrk_St0'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St0.mp3",
    },
	['Krk_11_tlk_WawKrk_St1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St1.mp3",
    },
	['Krk_11_tlk_WawKrk_St2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St2.mp3",
    },
	['Krk_11_tlk_WawKrk_St3'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St3.mp3",
    },
	['Krk_11_tlk_WawKrk_St4'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St4.mp3",
    },
	['Krk_11_tlk_WawKrk_St5'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St5.mp3",
    },
	['Krk_11_tlk_WawKrk_St6a'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St6a.mp3",
    },
	['Krk_11_tlk_WawKrk_St6b'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St6b.mp3",
    },
	['Krk_11_tlk_WawKrk_St7'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St7.mp3",
    },
	['Krk_11_tlk_WawKrk_St8'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St8.mp3",
    },
	['Krk_11_tlk_WawKrk_St9'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St9.mp3",
    },
	['Krk_11_tlk_WawKrk_St10'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_St10.mp3",
    },
	['Krk_11_tlk_WawKrk_Koz1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Koz1.mp3",
    },
	['Krk_11_tlk_WawKrk_Koz2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Koz2.mp3",
    },
	['Krk_11_tlk_WawKrk_Mi1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Mi1.mp3",
    },
	['Krk_11_tlk_WawKrk_Mi2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Mi2.mp3",
    },
	['Krk_11_tlk_WawKrk_Str1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Str1.mp3",
    },
	['Krk_11_tlk_WawKrk_Str2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Str2.mp3",
    },
	['Krk_11_tlk_WawKrk_Kr1'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Kr1.mp3",
    },
	['Krk_11_tlk_WawKrk_Kr2'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_Kr2.mp3",
    },
	['Krk_11_tlk_WawKrk_tlk_announcement'] = {
        [Languages.Polish]  = "pl/Krk_11_tlk_WawKrk_announcement.mp3",
    },
}
Trains = {}
ScenarioStep = -1
LoadDone = false

function PrepareScenario()
end

function EarlyScenarioStart()
    StartRecorder();
    SetCameraView(CameraView.FirstPersonWalkingOutside)
    Triggers()
    Ai()
end

function StartScenario()
    CreateCoroutine(function()
        ShowMessageBox("#M_Weather", {
                ["Text"] = "#Sunny_Summer",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 06, 12, 2, 45, 00))
                    SetWeather(WeatherConditionCode.ScatteredClouds, 20, 1000, 70, 3500, 10, 5, 5, true)
                    Weather = 0
                end,
            }, {
                ["Text"] = "#Rainy_Autumn",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 10, 29, 2, 45, 00))
                    SetWeather(WeatherConditionCode.ModerateRain, 10, 1000, 70, 1500, 10, 5, 5, true)
                    Weather = 1
                end,
            }, {
                ["Text"] = "#Snowy_Winter",
                ["OnClick"] = function()
                    SetStartDateTime(DateTimeCreate(2024, 12, 29, 2, 45, 00))
                    SetWeather(WeatherConditionCode.Snow, -10, 1000, 70, 1000, 10, 5, 5, true)
                    Weather = 2
                end,
            }
        )
        
        coroutine.yield(CoroutineYields.WaitForSeconds, 1)
        
        ShowMessageBox("#Choose_your_train", {
                ["Text"] = "EU07-085",
                ["OnClick"] = function()
                    SpawnAndMoveTrain(LocomotiveNames.EU07_085)
                end
            }, {
                ["Text"] = "EP07-135",
                ["OnClick"] = function()
                    SpawnAndMoveTrain(LocomotiveNames.EP07_135)
                end
            }, {
                ["Text"] = "ET22-911",
                ["OnClick"] = function()
                    SpawnAndMoveTrain(LocomotiveNames.ET22_911)
                end
            }
        )

        coroutine.yield(CoroutineYields.WaitForSeconds, 2)
		
        Comms(nil, "Krk_11_tlk_WawKrk_Hello")
		end)
	end

function SpawnAndMoveTrain(loc)
    Trains[0] = SpawnTrainsetOnSignal(
        "tlk-wigry",
        FindSignal("WSD_Y"),
        20,
        false,
        false,
        true,
        false,
        {
            CreateNewSpawnFullVehicleDescriptor(loc, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10ou_5151_2070_829_9, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.A9ou_5151_1970_003_4, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
			CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.B10nouz_5151_2071_102_0, false, "", 0, BrakeRegime.R),
            CreateNewSpawnFullVehicleDescriptor(PassengerWagonNames.Bc9ou_5051_5978_003_8, false, "", 0, BrakeRegime.R)
        }
    )
		Trains[0].SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
		Trains[0].SetTimetable(LoadTimetableFromFile("Timetable.xml"), false)
		Trains[0].SetRadioChannel(2, true)
end
--START
function Triggers()

    CreateSignalTrigger(FindSignal("WSD_J4"), 100, 
    {
        check = function(trainset)
            return Trains[0] == trainset
        end,
        result = function(trainset)
            CreateCoroutine(function()
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Comms(nil, "Możesz teraz wejść do kabiny aby przejąć skład od drużyny trakcyjnej z Białegostoku i zgłoś gotowość do drogi.")
                TakeoverTrainset(trainset)
                ScenarioStep = "Waw_Wsch"
            end)
        end
    })

	
    CreateSignalTrigger(FindSignal("WSD_J10"), 150, {
        check = function ()
			return Trains[0] == trainset
        end, 
        result = function (state) 
            CreateCoroutine(function()
                VDEnableFireAlarmState("Warszawa Centralna")
                CreateRoute("WSD_B", "WSD_K4", VDOrderType.TrainRoute)
                coroutine.yield(CoroutineYields.WaitForVehicleStartedMoving, RailstockGetPlayerVehicle())
                SpawnTrainsetOnSignalAsync("8-randomPass", FindSignal("WSD_B"), 807, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                    trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                    Trains[8] = trainset
                end)
            end)
        end
    })
	
    CreateSignalTrigger(FindSignal("WDC_G"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
                CreateRoute("WDC_G", "WDC_Akps", VDOrderType.TrainRoute)
                CreateRoute("WZD_E", "WZD_K1", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WZD_K1"), 500, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
                CreateRoute("WZD_U1", "WZD_Wkps", VDOrderType.TrainRoute)
                CreateRoute("WZD_K1", "WZD_U1", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_45S"), 152, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()                
                CreateRoute("Wl_E", "Wl_N", VDOrderType.TrainRoute)
                CreateRoute("Wl_N", "Wl_Rkps", VDOrderType.TrainRoute)
                CreateRoute("Jz_C", "Jz_Ekps", VDOrderType.TrainRoute)
                CreateRoute("Pr_D", "Pr_L1", VDOrderType.TrainRoute)
                CreateRoute("Pr_L1", "Pr_Wkps", VDOrderType.TrainRoute)
            end)
        end
    })
	
	CreateSignalTrigger(FindSignal("Pr_L1"), 100, 
	{
		check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()
				CreateRoute("Gr_D", "Gr_M14", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
				CreateRoute("Gr_M14", "Gr_P1", VDOrderType.TrainRoute)
				CreateRoute("Gr_P1", "Gr_Wkps", VDOrderType.TrainRoute)
            end)
        end
	})
	
    CreateSignalTrigger(FindSignal("Gr_P1"), 231, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioKor"
        end
    })
	
    CreateSignalTrigger(FindSignal("L4_529"), 149, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "Strza1"
        end
    })
		
	CreateSignalTrigger(FindSignal("OP_L"), 400, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            CreateCoroutine(function()     
				CreateRoute("OP_L", "Pl_B", VDOrderType.TrainRoute)
				CreateRoute("OP_L", "OP_Tkps", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))			
            end)
        end
    })
	
	CreateSignalTrigger(FindSignal("Pl_B"), 150, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
			CreateCoroutine(function()    
				CreateRoute("Pl_B", "Pl_Ckps", VDOrderType.TrainRoute)
				CreateRoute("Ol_B", "Ol_N", VDOrderType.TrainRoute)
				CreateRoute("Ol_N", "Ol_Tkps", VDOrderType.TrainRoute)
				CreateRoute("WP_B", "WP_N", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))		
			end)
        end
    })
	
	CreateSignalTrigger(FindSignal("WP_N"), 150, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
			CreateCoroutine(function()    
				CreateRoute("WP_N", "WP_Tkps", VDOrderType.TrainRoute)
				CreateRoute("Kn_C", "Kn_Ekps", VDOrderType.TrainRoute)
				CreateRoute("Ps_B", "Ps_N", VDOrderType.TrainRoute)
				CreateRoute("Ps_N", "Ps_Wkps", VDOrderType.TrainRoute)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("L570_15"), 1102, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
                ScenarioStep = "RadioStarzyny"
        end
    })
	
    CreateSignalTrigger(FindSignal("Sp_D"), 2800, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("Sp_D", "Sp_Akps", VDOrderType.TrainRoute)
            end)
        end
    })

    CreateTrackTriggerFront(FindTrack("t17303"), 154, 1, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioKoz"
        end
    })
    
    CreateSignalTrigger(FindSignal("L8_2699"), 916, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            ScenarioStep = "RadioMiech"
        end
    })
    
    CreateSignalTrigger(FindSignal("Mi_L"), 1100, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("3923_Sm_J", "3923_Sm_Lkps", VDOrderType.TrainRoute)
                CreateRoute("3923_Sm_B", "3923_Sm_J", VDOrderType.TrainRoute)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("L8_2843"), 1501, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            VDSetCrossingFault("L8_285.014_B", true)
        end
    })

    CreateSignalTrigger(FindSignal("3923_Sm_J"), 1100, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("2820_Nd_B", "2820_Nd_L", VDOrderType.TrainRoute)
                CreateRoute("2820_Nd_L", "2820_Nd_Pkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("2820_Nd_L"), 1100, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("5251_Zs_B", "5251_Zs_K", VDOrderType.TrainRoute)
                CreateRoute("5251_Zs_K", "5251_Zs_Pkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("3475_Rc_B"), 1300, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("3475_Rc_B", "3475_Rc_Ckps", VDOrderType.TrainRoute)
            end)
        end
    })
    
	CreateSignalTrigger(FindSignal("1937_BT_B"), 1300, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("1937_BT_B", "1937_BT_O", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("1937_BT_O"), 900, {
        check = PlayerTrainsetCheck, 
        result = function (state)
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
                CreateRoute("1937_BT_O", "1937_Bt_Ykps", VDOrderType.TrainRoute) 
            end)
        end
    })
	
    CreateSignalTrigger(FindSignal("2020_KPm_B"), 1200, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                CreateRoute("2020_KPm_B", "2020_KPm_Ekps", VDOrderType.TrainRoute)
                CreateRoute("1952_KG_R11", "1952_KG_U4", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("1952_KG_U4"), 650, {
        check = PlayerTrainsetCheck, 
        result = function (state) 
            CreateCoroutine(function()
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeStart, RailstockGetPlayerTrainset())
                coroutine.yield(CoroutineYields.WaitForSeconds, 180)
                FinishMission(MissionResultEnum.Success)
            end)
        end
    })
end

--AI trains
function Ai()
    SpawnTrainsetOnSignalAsync("6-randomEzt", FindSignal("WSD_Tm14"), 15, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
        trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
        Trains[6] = trainset
        Halt(trainset)
    end)
    SpawnTrainsetOnSignalAsync("7-randomPass", FindSignal("WSD_J12"), 72, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
        trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
        Trains[7] = trainset
        Halt(trainset)
    end)
	
    CreateSignalTrigger(FindSignal("L2_16D"), 179, 
    {
        check = function (trainset)
            return Trains[2] == trainset
        end,
        result = function(trainset)
            DespawnTrainset(trainset)
            SpawnTrainsetOnSignalAsync("3-randomPass", FindSignal("WSD_B"), 307, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[3] = trainset
                CreateCoroutine(function()
                    CreateRoute("WSD_B", "WSD_K4", VDOrderType.TrainRoute)
                    
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WSD_K4"), 163, 
    {
        check = function (trainset)
            return Trains[3] == trainset
        end,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("4-randomEzt", FindSignal("WSD_D"), 60, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[4] = trainset
                CreateCoroutine(function()
                    CreateRoute("WSD_D", "WSD_F", VDOrderType.TrainRoute)
                    CreateRoute("WSD_F", "WSD_K22", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WSD_K22"), 73, 
    {
        check = function (trainset)
            return Trains[4] == trainset
        end,
        result = function(trainset)
            CreateCoroutine(function()
                CreateRoute("WSD_K4", "WSD_Ukps", VDOrderType.TrainRoute)
                CreateRoute("WSD_F", "WSD_K22", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WSD_M70"), 327, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("5-randomEzt", FindSignal("WSD_V"), 278, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[5] = trainset
                CreateCoroutine(function()
                    coroutine.yield(CoroutineYields.WaitForSeconds, 60)
                    CreateRoute("WSD_V", "WSD_J1", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_12D"), 532, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("10-randomEzt", FindSignal("L448_22"), 15, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[10] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_10D"), 514, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("11-randomPass", FindSignal("WDC_P"), 10, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[11] = trainset
                CreateCoroutine(function()
                    CreateRoute("WDC_P", "WDC_Ukps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("WDC_G"), 757, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("12-randomPass", FindSignal("WDC_H"), 40, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[12] = trainset
                Halt(trainset)
            end)

            SpawnTrainsetOnSignalAsync("13-randomPass", FindSignal("WDC_R"), 40, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[13] = trainset
                Halt(trainset)
            end)

            SpawnTrainsetOnSignalAsync("14-randomEzt", FindSignal("WDC_T"), 40, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[14] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WDC_G"), 200, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("15-randomPass", FindSignal("WDC_B"), 10, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[15] = trainset
                CreateCoroutine(function()
                    coroutine.yield(CoroutineYields.WaitForSeconds, 60)
                    CreateRoute("WDC_B", "WDC_P", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L2_6D"), 412, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("16-randomEzt", FindSignal("L448_5"), 116, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[16] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("17-randomPass", FindSignal("L2_3D"), 456, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[17] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WZD_E"), 219, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("18-randomPass", FindSignal("WZD_G3"), 40, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[18] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("19-randomPass", FindSignal("WZD_K8"), 40, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[19] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WZD_K1"), 95, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("20-randomPass", FindSignal("WZD_Z"), 200, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[20] = trainset
                CreateCoroutine(function()
                    CreateRoute("WZD_Z", "WZD_G4", VDOrderType.TrainRoute)
                    coroutine.yield(CoroutineYields.WaitForSeconds, 40)
                    CreateRoute("WZD_S202", "WZD_Tm204", VDOrderType.ManeuverRoute)
                    CreateRoute("WZD_Tm204", "WZD_G5", VDOrderType.ManeuverRoute)
                    coroutine.yield(CoroutineYields.WaitForSeconds, 30)
                    CreateRoute("WZD_O", "WZD_H23", VDOrderType.TrainRoute)
                end)
            end)
            SpawnTrainsetOnSignalAsync("21-randomEzt", FindSignal("WZD_S202"), 340, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsShunting, true)
                Trains[21] = trainset
            end)
            SpawnTrainsetOnSignalAsync("22-randomEzt", FindSignal("WZD_O"), 75, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[22] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_45S"), 505, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetAsync("22-randomEzt", FindTrack("t19734"), 18, true, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[22] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetAsync("23-randomEzt", FindTrack("t24563"), 2, true, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[23] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetAsync("24-randomEzt", FindTrack("t19822"), 2, true, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[24] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Wl_E"), 400, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("25-randomEzt", FindSignal("Wl_J"), 15, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[24] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("26-randomPass", FindSignal("Wl_S"), 1267, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[26] = trainset
                CreateCoroutine(function()
                    CreateRoute("Wl_S", "Wl_Dkps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Wl_N"), 100, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("27-randomPass", FindSignal("Wl_H"), 1267, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[27] = trainset
                CreateCoroutine(function()
                    CreateRoute("Wl_H", "Wl_Bkps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_87S"), 536, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("28-randomEzt", FindSignal("L447_101"), 848, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[28] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("29-randomPass", FindSignal("L1_102S"), 1002, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[29] = trainset
            end)
            SpawnTrainsetOnSignalAsync("30-randomCargo", FindSignal("Jz_F"), 700, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[30] = trainset
                CreateCoroutine(function()
                    CreateRoute("Jz_F", "Jz_Bkps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_135S"), 557, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("31-randomPass", FindSignal("Pr_G2"), 10, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[31] = trainset
                CreateCoroutine(function()
                    CreateRoute("Pr_G2", "Pr_Ckps", VDOrderType.TrainRoute)
                    coroutine.yield(CoroutineYields.WaitForSeconds, 15)
                    CreateRoute("Pr_G4", "Pr_Akps", VDOrderType.TrainRoute)
                end)
            end)
            SpawnTrainsetOnSignalAsync("32-randomEzt", FindSignal("Pr_G4"), 150, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[32] = trainset
            end)
            SpawnTrainsetOnSignalAsync("33-randomCargo", FindSignal("Pr_L7"), 15, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[33] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_193S"), 1321, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("34-randomEzt", FindSignal("L447_193"), 569, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                trainset.SetTimetable(LoadTimetableFromFile("TimetableSKM.xml"), false)
                Trains[34] = trainset
            end)
            SpawnTrainsetOnSignalAsync("35-randomEzt", FindSignal("L447_208"), 1170, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[35] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L1_223S"), 202, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("36-random", FindSignal("L1_238S"), 488, false, false, true, CreateRandomWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[36] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L1_267"), 495, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainset(Trains[35])
            DespawnTrainset(Trains[36])
            
            CreateCoroutine(function()
                CreateRoute("Gr_H2", "Gr_Ckps", VDOrderType.TrainRoute)
                coroutine.yield(CoroutineYields.WaitForSeconds, 10)
                CreateRoute("Gr_H4", "Gr_Akps", VDOrderType.TrainRoute)
            end)

            SpawnTrainsetOnSignalAsync("37-randomEzt", FindSignal("Gr_H4"), 337, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[37] = trainset
            end)

            SpawnTrainsetOnSignalAsync("38-randomWag", FindSignal("Gr_H2"), 10, false, false, true, CreateRandomWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[38] = trainset
            end)

            SpawnTrainsetOnSignalAsync("40-randomEzt", FindSignal("Gr_Tm23"), 5, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[40] = trainset
                Halt(trainset)
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("Gr_P1"), 306, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("41-random", FindSignal("L1_340"), 554, false, false, true, CreateRandomTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[41] = trainset
            end)
            SpawnTrainsetOnSignalAsync("42-randomWag", FindSignal("L4_50"), 1871, false, false, true, CreateRandomWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[42] = trainset
            end)
        end
    })

    CreateSignalTrigger(FindSignal("L4_73"), 488, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("43-random", FindSignal("L1_383"), 755, false, false, true, CreateRandomTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[43] = trainset
            end)
            SpawnTrainsetOnSignalAsync("44-random", FindSignal("L1_368"), 1017, false, false, true, CreateRandomTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[44] = trainset
            end)
            SpawnTrainsetOnSignalAsync("45-randomPassWag", FindSignal("L4_108"), 470, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[45] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("Kr_C"), 242, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("46-randomCargo", FindSignal("Kr_S"), 15, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[46] = trainset
            end)
            SpawnTrainsetOnSignalAsync("47-randomCargo", FindSignal("Kr_J"), 15, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[47] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L4_167"), 1783, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("48-randomPassWag", FindSignal("L4_184"), 6, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[48] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L4_197"), 1080, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("49-randomPassWag", FindSignal("L4_198"), 1590, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[49] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Se_C"), 300, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("50-randomPassWag", FindSignal("Se_S"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[50] = trainset
            end)
            SpawnTrainsetOnSignalAsync("51-randomPassWag", FindSignal("Se_J"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[51] = trainset
            end)
            SpawnTrainsetOnSignalAsync("52-randomPassWag", FindSignal("Se_Z"), 1000, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[52] = trainset
                
                CreateCoroutine(function()
                    CreateRoute("Se_Z", "Se_H", VDOrderType.TrainRoute)
                    CreateRoute("Se_H", "Se_Bkps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_261"), 744, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("53-randomPassWag", FindSignal("L4_292"), 8, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[53] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_307"), 1499, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("54-randomPassWag", FindSignal("L4_332"), 22, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[54] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_345"), 824, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("55-randomPassWag", FindSignal("L4_384"), 214, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[55] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("BR_B"), 156, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("56-random", FindSignal("L4_422"), 1250, false, false, true, CreateRandomTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[56] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_455"), 1684, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("57-randomPassWag", FindSignal("L4_476"), 106, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[57] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_499"), 1914, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("58-randomPassWag", FindSignal("L4_530"), 32, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[58] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("St_B"), 434, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("59-randomPassWag", FindSignal("St_Z"), 10, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[59] = trainset
                CreateCoroutine(function()
                    CreateRoute("St_Z", "St_H", VDOrderType.TrainRoute)
                    CreateRoute("St_H", "St_Akps", VDOrderType.TrainRoute)
                end)
            end)
            SpawnTrainsetOnSignalAsync("60-randomCargo", FindSignal("St_P"), 15, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[60] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_595"), 1177, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("61-randomPassWag", FindSignal("L4_610"), 1206, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[61] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_633"), 641, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("62-randomPassWag", FindSignal("L4_668"), 282, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[62] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_691"), 1322, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("63-randomPassWag", FindSignal("L4_732"), 56, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[63] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_751"), 1636, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("64-randomPassWag", FindSignal("L4_766"), 759, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[64] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_785"), 1960, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("65-randomCargo", FindSignal("L573_21N"), 895, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[65] = trainset
            end)
            SpawnTrainsetOnSignalAsync("66-randomCargo", FindSignal("Id_G"), 10, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[66] = trainset
                VDSetRoute("Id_G", "Id_Ekps", VDOrderType.TrainRoute)
            end)

            SpawnTrainsetOnSignalAsync("67-randomEzt", FindSignal("Id_M6"), 30, false, false, true, CreateRandomEzt(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[67] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("68-randomPassWag", FindSignal("Id_S"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[68] = trainset
            end)
            SpawnTrainsetOnSignalAsync("69-randomCargo", FindSignal("Id_T5"), 10, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[69] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_839"), 1080, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("70-randomPassWag", FindSignal("L4_868"), 271, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[70] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_885"), 1061, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("71-randomPassWag",FindSignal("L4_900"), 323, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[71] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("OP_B"), 471, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("73-randomCargo", FindSignal("OP_E"), 10, false, false, true, CreateRandomCargoTrain(Loc.Warszawa), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[73] = trainset
            end)
        end
    })
	
    CreateSignalTrigger(FindSignal("L4_1001"), 1480, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("75-randomPassWag", FindSignal("L4_1018"), 34, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[75] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1041"), 2006, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("76-randomCargo", FindSignal("L4_1040"), 1330, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[76] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Pl_B"), 151, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("77-randomPassWag", FindSignal("L4_1108"), 9, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[77] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1131"), 1953, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("78-randomPassWag",FindSignal("L4_1146"), 886, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[78] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1163"), 455, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("79-randomPassWag",FindSignal("L4_1216"), 99, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[79] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Ol_B"), 152, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("80-randomPassWag",FindSignal("Ol_O"), 15, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[80] = trainset
            end)
            SpawnTrainsetOnSignalAsync("81-randomPassWag",FindSignal("L4_1280"), 37, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[81] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1295"), 1069, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("82-randomPassWag", FindSignal("L4_1332"), 34, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[82] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1355"), 2067, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("83-randomPassWag", FindSignal("L4_1370"), 108, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[83] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1393"), 1761, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("84-randomPassWag", FindSignal("L4_1432"), 29, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[84] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1455"), 1748, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("85-randomPassWag", FindSignal("L4_1470"), 628, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[85] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L4_1489"), 984, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("86-randomPassWag", FindSignal("L4_1510"), 502, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[86] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("WP_B"), 504, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("87-randomPassWag", FindSignal("WP_J"), 178, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[87] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("88-randomCargo", FindSignal("WP_P"), 12, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[88] = trainset
            end)
            SpawnTrainsetOnSignalAsync("89-randomPassWag", FindSignal("L572_25N"), 1049, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[89] = trainset
                VDSetRoute("WP_S", "WP_F", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1587"), 1454, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("90-randomCargo", FindSignal("Cz_Y"), 600, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[90] = trainset
            end)
            SpawnTrainsetOnSignalAsync("91-randomCargo", FindSignal("L571_19N"), 1492, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[88] = trainset
            end)

        end
    })
    CreateSignalTrigger(FindSignal("L4_1625"), 1457, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("92-randomPassWag", FindSignal("L4_1642"), 1145, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[92] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L4_1673"), 1733, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("93-randomPassWag", FindSignal("L4_1674"), 1176, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[93] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Ps_B"), 150, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("94-randomCargo", FindSignal("Ps_O"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[94] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L570_15"), 1065, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("95-randomPassWag", FindSignal("Ps_V"), 1383, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[95] = trainset
            end)
            SpawnTrainsetAsync("96-randomPassWag", FindTrack("t17148"), 74, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[96] = trainset
                SetTrainsetGoingLeftTrack(trainset, true)
                VDSetRoute("Sp_C", "Sp_Bkps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Kz_C"), 1984, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainset(Trains[95])
            SpawnTrainsetOnSignalAsync("97-randomCargo", FindSignal("Kz_D"), 998, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[97] = trainset
                VDSetRoute("Kz_D", "Kz_S5", VDOrderType.TrainRoute)
            end)
            SpawnTrainsetOnSignalAsync("98-randomEzt", FindSignal("Kz_G2"), 410, false, false, true, CreateRandomEzt(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[98] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("99-randomCargo", FindSignal("Kz_S7"), 15, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[99] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L62_2639"), 509, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("100-random", FindSignal("L62_2666"), 31, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[100] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Tl_B"), 458, 
    {
        check = PlayerTrainsetCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("100a-random", FindSignal("Tl_D"), 15, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[100] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2699"), 841, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("101-rnd", FindSignal("L8_2704"), 804, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[101] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2719"), 349, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("102-rnd", FindSignal("L8_2374"), 39, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[102] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2745"), 492, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("103-rnd", FindSignal("L8_2756"), 10, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[103] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("Mi_B"), 150, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("104-rndCargo", FindSignal("Mi_M"), 20, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[104] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("105-rndPass", FindSignal("L8_2798"), 10, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[105] = trainset
                CreateCoroutine(function()
                    VDSetRoute("Mi_O", "Mi_E", VDOrderType.TrainRoute)
                    VDSetRoute("Mi_E", "Mi_Akps", VDOrderType.TrainRoute)
                end)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2811"), 601, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("106-rnd", FindSignal("L8_2828"), 7, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[106] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L8_2843"), 1287, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("107-rnd", FindSignal("L8_2842"), 446, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[107] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L8_2857"), 486, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("108-rnd", FindSignal("L8_2868"), 188, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[108] = trainset
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("L8_2883"), 411, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("109-rnd", FindSignal("L8_2882"), 1217, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[109] = trainset
            end)
        end
    })

    CreateSignalTrigger(FindSignal("3923_Sm_B"), 219, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("110-rndCargo", FindSignal("3923_Sm_F"), 20, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[110] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("111-rnd", FindSignal("3923_Sm_K"), 15, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                Trains[111] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2925"), 1300, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("112-rnd", FindSignal("3923_Sm_M"), 1420, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[112] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2935"), 541, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("113-rnd", FindSignal("L8_2936"), 555, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[113] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("2820_Nd_B"), 99, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("114-rndCargo", FindSignal("2820_Nd_N"), 20, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[114] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2981"), 1001, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("115-rnd", FindSignal("L8_2984"), 60, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[115] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_2993"), 338, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("116-rnd", FindSignal("L8_2994"), 757, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[116] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_3007"), 390, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("117-rnd", FindSignal("L8_3018"), 8, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[117] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_3029"), 613, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("118-rnd", FindSignal("L8_3032"), 984, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[118] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("L8_3064"), 827, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("119-rnd", FindSignal("L8_3058"), 572, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[119] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("5251_Zs_B"), 174, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("120-rndCargo", FindSignal("5251_Zs_F"), 20, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[120] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("121-rndPass", FindSignal("5251_Zs_R"), 500, false, false, true, CreateRandomPassengerWagonTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[121] = trainset
                VDSetRoute("5251_Zs_E", "5251_Zs_Akps", VDOrderType.TrainRoute)
                VDSetRoute("5251_Zs_R", "5251_Zs_E", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("3475_Rc_B"), 1700, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("122-rnd", FindSignal("5251_Zs_R"), 2115, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[122] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("3475_Rc_B"), 100,
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("123-rndCargo", FindSignal("3475_Rc_E"), 5, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[123] = trainset
                Halt(trainset)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("1937_BT_B"), 911, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("124-rndCargo", FindSignal("783_Dl_E"), 1386, false, false, true, CreateRandomCargoTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[124] = trainset
                VDSetRoute("783_Dl_E", "t38392kps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("2020_KPm_B"), 2100, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("125-rnd", FindSignal("1937_Bt_W"), 2215, false, false, true, CreateRandomTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[125] = trainset
            end)
        end
    })
    CreateSignalTrigger(FindSignal("2020_KPm_B"), 50, 
    {
        check = UnconditialCheck,
        result = function(trainset)
            DespawnTrainsets(false)
            SpawnTrainsetOnSignalAsync("126-rndPass", FindSignal("2020_KPm_F"), 654, false, false, true, CreateRandomPassengerTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                Trains[126] = trainset
                VDSetRoute("2020_KPm_F", "2020_KPm_Akps", VDOrderType.TrainRoute)
            end)
        end
    })
    CreateSignalTrigger(FindSignal("1952_KG_R11"), 88,
    {
        check = UnconditialCheck,
        result = function(trainset)
            SpawnTrainsetOnSignalAsync("127-rndPass", FindSignal("1952_KG_T2"), 30, false, false, true, CreateRandomPassengerTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[127] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("128-rndPass", FindSignal("1952_KG_T6"), 40, false, false, true, CreateRandomPassengerTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[128] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("129-rndPass", FindSignal("1952_KG_U1"), 30, false, false, true, CreateRandomPassengerTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                Trains[129] = trainset
                Halt(trainset)
            end)
            SpawnTrainsetOnSignalAsync("130-rndPass", FindSignal("1952_KG_U10"), 20, false, false, true, CreateRandomPassengerTrain(Loc.Other), function (trainset)
                trainset.SetState(DynamicState.dsStop, TrainsetState.tsShunting, true)
                Trains[130] = trainset
                Halt(trainset)
            end)
        end
    })
end

--Radio-methods
function OnVirtualDispatcherReady()
    Log("VD is ready, setting route...")
    LoadDone = true

    CreateCoroutine(function()
		CreateRoute("WSD_Y", "WSD_L16", VDOrderType.TrainRoute)
        CreateRoute("WSD_L16", "WSD_J4", VDOrderType.TrainRoute)
		Comms(nil, "Krk_11_tlk_WawKrk_tlk_announcement")
    end)
	
	
end
function OnPlayerRadioCall(trainsetInfo, radio_SelectionCall)
    Log("Call pressed in " .. trainsetInfo.name .. ". Call type: " .. tostring(radio_SelectionCall) .. ", Step: " ..tostring(ScenarioStep))
	if (ScenarioStep == "Waw_Wsch") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 2) then
            ScenarioStep = 0
            CreateCoroutine(function()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Wwa0")
                Comms("Waw", "Krk_11_tlk_WawKrk_Wwa1")
				Comms("Caller_You", "Krk_11_tlk_WawKrk_Wwa2")
				Comms("Waw", "Krk_11_tlk_WawKrk_Wwa3")
                coroutine.yield(CoroutineYields.WaitUntil, function()
                    return LoadDone
                end)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))
				CreateRoute("WDC_W", "WDC_G", VDOrderType.TrainRoute)
                CreateRoute("WSD_J4", "WSD_Akps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioKor") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Kr1")
                Comms("Kr", "Krk_11_tlk_WawKrk_Kr2")
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Roger")
                CreateRoute("Kr_R", "Kr_Wkps", VDOrderType.TrainRoute)
                CreateRoute("Kr_C", "Kr_R", VDOrderType.TrainRoute)
                CreateRoute("Se_C", "Se_R", VDOrderType.TrainRoute)
                CreateRoute("Se_R", "Se_Wkps", VDOrderType.TrainRoute)
                CreateRoute("BR_B", "BR_Ckps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "Strza1") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_St0")
				coroutine.yield(CoroutineYields.WaitForSeconds, 9)
                Comms("Caller_You", "Krk_11_tlk_WawKrk_St1")
				coroutine.yield(CoroutineYields.WaitForSeconds, 6)
                Comms("Caller_You", "Krk_11_tlk_WawKrk_St2")
                Comms("St", "Krk_11_tlk_WawKrk_St3")
				Comms("Caller_You", "Krk_11_tlk_WawKrk_St4")
                Comms("St", "Krk_11_tlk_WawKrk_St5")
				Comms("Caller_You", "Krk_11_tlk_WawKrk_St6a")
				coroutine.yield(CoroutineYields.WaitForSeconds, 5)
				Comms("Caller_You", "Krk_11_tlk_WawKrk_St6b")
				Comms("St", "Krk_11_tlk_WawKrk_St7")
				CreateRoute("St_B", "St_O", VDOrderType.TrainRoute)
				Comms("Caller_You", "Krk_11_tlk_WawKrk_St8")
				Comms("St", "Krk_11_tlk_WawKrk_St9")
				Comms("Caller_You", "Krk_11_tlk_WawKrk_St10")
				CreateRoute("St_O", "St_Wkps", VDOrderType.TrainRoute)
				CreateRoute("Id_C", "Id_R", VDOrderType.TrainRoute)
				CreateRoute("Id_R", "Id_Wkps", VDOrderType.TrainRoute)
				CreateRoute("OP_B", "OP_L", VDOrderType.TrainRoute)				
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioStarzyny") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 5) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Str1")
                Comms("Str", "Krk_11_tlk_WawKrk_Str2")
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Roger")
                
                CreateRoute("Str_C", "Str_Akps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioKoz") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 4) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Koz1")
                Comms("Koz", "Krk_11_tlk_WawKrk_Koz2")
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Roger")
                                
                CreateRoute("Kz_C", "Kz_S1", VDOrderType.TrainRoute)
				coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))		
                CreateRoute("Kz_S1", "Kz_Ykps", VDOrderType.TrainRoute)
                CreateRoute("Tl_B", "Tl_J", VDOrderType.TrainRoute)
                CreateRoute("Tl_J", "Tl_Rkps", VDOrderType.TrainRoute)
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
    if(ScenarioStep == "RadioMiech") then
        if(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 1) then
            ScenarioStep = 0
            CreateCoroutine(function ()
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Mi1")
                Comms("Mi", "Krk_11_tlk_WawKrk_Mi2")
                Comms("Caller_You", "Krk_11_tlk_WawKrk_Roger")
				CreateRoute("Mi_B", "Mi_L", VDOrderType.TrainRoute) 
                coroutine.yield(CoroutineYields.WaitForTrainsetPassengerExchangeFinished, RailstockGetPlayerTrainset(), TimeSpanCreate(0, 0, 0, 30, 0))		
                CreateRoute("Mi_L", "Mi_Nkps", VDOrderType.TrainRoute)               
            end)
        else
            CreateCoroutine(function()
                Comms(false, "StaticNoise")
            end)
        end
    end
end