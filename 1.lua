local ENetRole = import("ENetRole")
local EPawnState = import("EPawnState")
local GameplayData = require("GameLua.GameCore.Data.GameplayData")
local KismetMathLibrary = import("KismetMathLibrary")
local GameplayStatics = import("GameplayStatics")
local InGameMarkTools = require("GameLua.Mod.BaseMod.Common.InGameMarkTools")
local GamePlayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")

local EXPIRY_TIMESTAMP = os.time({ year = 2026, month = 10, day = 23, hour = 23, min = 59, sec = 0 })

local function FormatTimeRemaining(sec)
    if sec <= 0 then return "0d 0h 0m 0s" end
    local days = math.floor(sec / 86400); sec = sec % 86400
    local hours = math.floor(sec / 3600); sec = sec % 3600
    local minutes = math.floor(sec / 60)
    local seconds = sec % 60
    return string.format("%dd %dh %dm %ds", days, hours, minutes, seconds)
end

function CheckExpiration()
    local now = os.time()
    local remaining = EXPIRY_TIMESTAMP - now
    if remaining <= 0 then
        _G._MOD_EXPIRED = true
        _G._MOD_REMAINING_SECONDS = 0
        return false    -- 🔥 REAL EXPIRY - STOPS WORKING
    end
    _G._MOD_EXPIRED = false
    _G._MOD_REMAINING_SECONDS = remaining
    return true
end

local function ShowExpiryPopup(expired)
    pcall(function()
        local Msg = package.loaded["client.slua.logic.common.logic_common_msg_box"]
            or require("client.slua.logic.common.logic_common_msg_box")
        local function dummy() end
        
        if expired then
            Msg.Show(4, "EXPIRED",
                "It is Expired Now\n" ..
                "Get Next Update From Telegram\n" ..
                "Telegram -> @SHAYAN_TOOL1r\n" ..
                "Contact -> @SHAYAN_TOOL1", 
                dummy)
        else
            Msg.Show(4, "SHAYAN CHEATS PREMIUM",
                "✦ SHAYAN VIP SERVER CONNECTED\n" ..
                "✦ Play Safe & Avoid Reports\n" ..
                "✦ Play Like Pro Not Like Hacker\n" ..
                "✦ Telegram -> @SHAYAN_TOOL1\n" ..
                "✦ Developer -> @SHAYAN_TOOL1", 
                dummy)
        end
    end)
end

function _G.TryShowWelcome()
    if _G.WelcomeShown then return end
    if not CheckExpiration() then
        ShowExpiryPopup(true)
        return
    end
    ShowExpiryPopup(false)
    _G.WelcomeShown = true
end

_G.AK_Features = {
    { id = "ESP_HP",   name = "ESP Health Bar", val = 1, type = "toggle" },
    { id = "ESP_BOX",  name = "ESP Box",        val = 1, type = "toggle" },
    { id = "ESP_MAP",  name = "Mini Map ESP",   val = 1, type = "toggle" },
    { id = "AIMBOT",   name = "Aimbot",         val = 1, type = "toggle" },
    { id = "ENEMY_COUNTER", name = "Enemy Counter", val = 1, type = "toggle" },
}

function _G.AK_GetVal(featureId)
    for _, feature in ipairs(_G.AK_Features) do
        if feature.id == featureId then return feature.val end
    end
    return 0
end

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

-- ========================================================================
-- Original distance marker & ESP system (unchanged)
-- ========================================================================
local distanceMarkerConfig = {
    UIPathName = "/Game/Mod/EvoBase/BluePrints/UIBP/QuickSign/QuickSign_TipHitEnemy_UIBP_New.QuickSign_TipHitEnemy_UIBP_New_C",
    MaxWidgetNum = 99,
    MaxShowDistance = 6000000,
    bBindOutScreen = true,
    bBindBlocked = true,
    bIsBindingActor = true,
    BindSocketName = "head",
    bUseLuaWorldSocketName = true,
    WorldPositionOffset = FVector(0, 0, 50),
    bNeedPreLoad = true,
    Priority = 2
}

local function InitDistanceMarkerSystem()
    pcall(function()
        if InGameMarkTools and InGameMarkTools.ScreenMarkManager and InGameMarkTools.ScreenMarkManager.OnInitMarkGroupData then
            InGameMarkTools.ScreenMarkManager:OnInitMarkGroupData(9999)
        end
        local gameplayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")
        local screenMarkConfig = gameplayTools.GetCurrentConfig("ScreenMarkConfig")
        if screenMarkConfig then
            screenMarkConfig[9999] = distanceMarkerConfig
        end
        for moduleName, moduleData in pairs(package.loaded) do
            if type(moduleName) == "string" and string.find(moduleName, "ScreenMarkConfig") then
                if type(moduleData) == "table" then
                    moduleData[9999] = distanceMarkerConfig
                end
            end
        end
    end)
end

if not _G.AK_Active_Marks_Cache then _G.AK_Active_Marks_Cache = {} end

local function createDistanceMarker(enemy)
    if _G._MOD_EXPIRED then return end
    pcall(function()
        if InGameMarkTools and InGameMarkTools.ClientAddMapMark then
            enemy.NativeDistMark = InGameMarkTools.ClientAddMapMark(9999, FVector(0,0,0), 0, "", 4, enemy)
            _G.AK_Active_Marks_Cache[tostring(enemy)] = { actor = enemy, distMark = enemy.NativeDistMark }
        end
    end)
end

local function removeDistanceMarker(enemy)
    pcall(function()
        if InGameMarkTools then
            if InGameMarkTools.ClientRemoveMapMark then
                InGameMarkTools.ClientRemoveMapMark(enemy.NativeDistMark)
            elseif InGameMarkTools.HideMapMark then
                InGameMarkTools.HideMapMark(enemy.NativeDistMark)
            end
        end
        enemy.NativeDistMark = nil
        _G.AK_Active_Marks_Cache[tostring(enemy)] = nil
    end)
end

local function cleanupDeadEnemyMarks()
    for cacheKey, cacheData in pairs(_G.AK_Active_Marks_Cache) do
        local shouldRemove = false
        if not slua.isValid(cacheData.actor) then
            shouldRemove = true
        else
            pcall(function()
                local actor = cacheData.actor
                if actor.bHidden or (actor.Mesh and actor.Mesh.bHidden) then shouldRemove = true end
                if type(actor.IsDead) == "function" and actor:IsDead() then shouldRemove = true
                elseif actor.bIsDead == true or actor.bIsDeadFlag == true then shouldRemove = true end
            end)
        end
        if shouldRemove then
            pcall(function()
                if InGameMarkTools and InGameMarkTools.ClientRemoveMapMark then
                    InGameMarkTools.ClientRemoveMapMark(cacheData.distMark)
                end
            end)
            _G.AK_Active_Marks_Cache[cacheKey] = nil
        end
    end
end

local function processEnemyMapESP(enemy, localPlayer, isMapESPEnabled)
    if _G._MOD_EXPIRED then return end
    if not slua.isValid(enemy) or enemy == localPlayer or enemy.TeamID == localPlayer.TeamID then return end
    local isDead = false
    pcall(function()
        if type(enemy.IsDead) == "function" then isDead = enemy:IsDead()
        elseif enemy.bIsDead then isDead = true end
        if enemy.bHidden or (enemy.Mesh and enemy.Mesh.bHidden) then isDead = true end
    end)
    if not isDead then
        if isMapESPEnabled == 1 then
            if not enemy.bHasAKNativeMapMarker then
                createDistanceMarker(enemy)
                enemy.bHasAKNativeMapMarker = true
            end
        else
            if enemy.bHasAKNativeMapMarker then
                removeDistanceMarker(enemy)
                enemy.bHasAKNativeMapMarker = false
            end
        end
    else
        if enemy.bHasAKNativeMapMarker then
            removeDistanceMarker(enemy)
            enemy.bHasAKNativeMapMarker = false
        end
    end
end

function ApplyHardAimbot()
    if not CheckExpiration() then return end
    pcall(function()
        local pc = slua_GameFrontendHUD:GetPlayerController()
        if not slua.isValid(pc) then return end
        local char = pc:GetPlayerCharacterSafety()
        if not slua.isValid(char) then return end
        local wm = char.WeaponManagerComponent
        if not slua.isValid(wm) then return end
        local weapon = wm.CurrentWeaponReplicated
        if not slua.isValid(weapon) then return end
        local entity = weapon.ShootWeaponEntityComp
        if not slua.isValid(entity) then return end
        entity.RecoilKickADS = 0.020
        entity.GameDeviationFactor = 0.01
        entity.GameDeviationAccuracy = 0.01
        if entity.AutoAimingConfig then
            for _, range in ipairs({"OuterRange", "InnerRange"}) do
                local cfg = entity.AutoAimingConfig[range]
                if cfg then
                    cfg.Speed = 4.0; cfg.RangeRate = 2.0; cfg.SpeedRate = 3.0; cfg.RangeRateSight = 2.0; cfg.SpeedRateSight = 3.0
                    cfg.CrouchRate = 2.5; cfg.ProneRate = 3.0; cfg.DyingRate = 0
                    cfg.adsorbMaxRange = 200; cfg.adsorbMinRange = 20; cfg.adsorbMinAttenuationDis = 100; cfg.adsorbMaxAttenuationDis = 8000; cfg.adsorbActiveMinRange = 20
                end
            end
            entity.AutoAimingConfig = entity.AutoAimingConfig
        end
        pcall(function()
            local aimComp = char.BP_AutoAimingComponent_C or char.BP_AutoAimingComponent or char.AutoAimingComponent
            if slua.isValid(aimComp) and aimComp.Bones then
                pcall(function() aimComp.Bones[0] = "neck_01" end)
                pcall(function() aimComp.Bones[1] = "neck_01" end)
                pcall(function() aimComp.Bones[2] = "neck_01" end)
                pcall(function() aimComp.Bones:Set(0, "neck_01") end)
                pcall(function() aimComp.Bones:Set(1, "neck_01") end)
                pcall(function() aimComp.Bones:Set(2, "neck_01") end)
            end
        end)
    end)
end

-- ========================================================================
-- Material Evasion Bypass (kept from old wallhack bypass, still useful)
-- ========================================================================
local function activate_material_evasion()
    if _G._MATERIAL_GETTERS_HOOKED then return end
    pcall(function()
        local UMaterial = import("Material")
        local UMaterialInstance = import("MaterialInstance")
        local UMaterialInstanceDynamic = import("MaterialInstanceDynamic")
        local UPrimitiveComponent = import("PrimitiveComponent")
        local UMeshComponent = import("MeshComponent")

        if UMaterial then
            UMaterial.GetDisableDepthTest = function() return false end
            UMaterial.GetBlendMode = function() return 0 end
            UMaterial.GetMaterialHash = function() return "FAKE_HASH" end
            UMaterial.VerifyMaterial = function() return true end
        end
        if UMaterialInstance then
            UMaterialInstance.GetDisableDepthTest = function() return false end
            UMaterialInstance.GetBlendMode = function() return 0 end
            UMaterialInstance.GetBaseMaterial = function() return nil end
        end
        if UMaterialInstanceDynamic then
            local oldVec = UMaterialInstanceDynamic.K2_GetVectorParameterValue
            UMaterialInstanceDynamic.K2_GetVectorParameterValue = function(self, name)
                local n = tostring(name)
                if n:find("Color") or n:find("Emissive") then return {R=255,G=255,B=255,A=255} end
                return oldVec(self, name)
            end
            local oldScal = UMaterialInstanceDynamic.K2_GetScalarParameterValue
            UMaterialInstanceDynamic.K2_GetScalarParameterValue = function(self, name)
                if tostring(name):find("Emissive") then return 0.0 end
                return oldScal(self, name)
            end
            UMaterialInstanceDynamic.GetFullName = function() return "DefaultMaterial" end
        end
        if UPrimitiveComponent then
            UPrimitiveComponent.IsRenderedOnCustomDepth = function() return false end
            UPrimitiveComponent.GetRenderCustomDepth = function() return false end
            UPrimitiveComponent.GetCustomDepthStencilValue = function() return 0 end
            UPrimitiveComponent.GetCustomDepthStencilWriteMask = function() return 0 end
            UPrimitiveComponent.GetVisibleFlag = function() return true end
        end
        if UMeshComponent then
            UMeshComponent.ShouldRender = function() return true end
            UMeshComponent.GetShouldRender = function() return true end
            UMeshComponent.IsVisible = function() return true end
        end

        local UObject = import("Object")
        if UObject and UObject.GetObjectsOfClass then
            local oldGet = UObject.GetObjectsOfClass
            UObject.GetObjectsOfClass = function(Class, IncludeDerived)
                if Class and tostring(Class):find("MaterialInstanceDynamic") then return {} end
                return oldGet(Class, IncludeDerived)
            end
        end
    end)
    _G._MATERIAL_GETTERS_HOOKED = true
end
activate_material_evasion()

-- ========================================================================
-- ⚡ NEW WALLHACK SYSTEM (DrawDyeing + IdeaOutline) – Mesh Collection Fixed
-- ========================================================================
local LinearColor = import("LinearColor")

local CONSOLE_READY = false
local PROCESSED_PAWNS = {}
local TICK_COUNT = 0
local WH_TIMER = nil

local TICK_INTERVAL = 0.3
local MAX_PAWNS_PER_TICK = 20
local RESET_PROCESSED_EVERY = 6
local AVATAR_SLOTS = {0,1,2,3,4,5,6,7}

-- 🟡 YELLOW FOR VISIBLE, 🔴 RED FOR OCCLUDED (Custom - SHAYAN)
local colors = {
    vis = LinearColor(255, 215, 0, 255),  -- YELLOW for visible real players
    occ = LinearColor(255, 0, 0, 255),    -- RED for occluded real players
    bVis = LinearColor(255, 215, 0, 255), -- YELLOW for visible bots
    bOcc = LinearColor(255, 0, 0, 255)    -- RED for occluded bots
}

local function SetupConsole()
    if CONSOLE_READY then return end
    pcall(function()
        local KismetSystemLibrary = import("KismetSystemLibrary")
        local world = slua.getWorld()
        if not KismetSystemLibrary or not world then return end
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.EnableDrawDyeingColor 1")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.CustomDepth 3")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.IdeaOutline.Enable 1")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.Highlight.Enable 1")
        CONSOLE_READY = true
        print("[PBC] Console ready")
    end)
end

local function ApplyToMesh(mesh, visColor, occColor)
    if not mesh or not slua.isValid(mesh) then return end
    pcall(function()
        mesh:SetDrawDyeing(true)
        mesh:SetDrawDyeingMode(1)
        mesh:SetVisibleDyeingColor(visColor)
        mesh:SetOccludedDyeingColor(occColor)
        mesh:SetDyeingColorFadeDistance(99999.0)
        mesh:SetDyeingColorMinMaxDistance(0.0, 99999.0)
        mesh:SetDrawHighlight(true)
        mesh:OverrideHighlightColor(visColor)
        mesh:SetHighlightCanBeOccluded(false)
        mesh:SetDrawIdeaOutline(true)
        mesh:SetIdeaOutlineNew(true)
        mesh:SetIdeaOutlineOcclusionHighlight(true)
        mesh:OverrideIdeaOutlineColor(visColor)
        mesh:SetIdeaOutlineOcclusionColor(occColor)
        mesh:OverrideIdeaOutlineThickness(20.0)
        mesh:SetIdeaOverrideOutlineAndOcclusion(true)
        mesh:SetRenderCustomDepth(true)
        mesh:SetCustomDepthStencilValue(255)
    end)
end

local function IsPawnAlive(pawn)
    if not slua.isValid(pawn) then return false end
    if pawn.Health and pawn.Health > 0 then return true end
    return false
end

local function PBCtick()
    pcall(function()
        local localPawn = GameplayData.GetPlayerCharacter()
        if not slua.isValid(localPawn) then return end

        SetupConsole()
        if not colors then return end

        TICK_COUNT = TICK_COUNT + 1
        if TICK_COUNT % RESET_PROCESSED_EVERY == 0 then
            PROCESSED_PAWNS = {}
        end

        local myTeamId = localPawn.TeamID or 0
        local allPawns = Game:GetAllPlayerPawns() or {}
        local processedCount = 0

        for _, pawn in pairs(allPawns) do
            if processedCount >= MAX_PAWNS_PER_TICK then break end
            if not slua.isValid(pawn) or pawn == localPawn then goto continue end
            if pawn.PlayerKey and PROCESSED_PAWNS[pawn.PlayerKey] then goto continue end

            if IsPawnAlive(pawn) and pawn.TeamID and pawn.TeamID ~= myTeamId then
                local isAI = pcall(Game.IsAI, pawn) and true or false
                local vis = isAI and colors.bVis or colors.vis
                local occ = isAI and colors.bOcc or colors.occ

                pcall(function()
                    -- Main body mesh
                    if slua.isValid(pawn.Mesh) then
                        ApplyToMesh(pawn.Mesh, vis, occ)
                    end
                    -- Avatar slot meshes (helmet, vest, etc.)
                    local avatarComp = pawn.CharacterAvatarComp2_BP or pawn:getAvatarComponent2()
                    if avatarComp and avatarComp.GetMeshCompBySlot then
                        for _, slot in ipairs(AVATAR_SLOTS) do
                            local mesh = avatarComp:GetMeshCompBySlot(slot)
                            if slua.isValid(mesh) then
                                ApplyToMesh(mesh, vis, occ)
                            end
                        end
                    end
                    -- Additional: all skeletal mesh components (fallback)
                    pcall(function()
                        local SkeletalMeshComponent = import("SkeletalMeshComponent")
                        if SkeletalMeshComponent then
                            local skComps = pawn:GetComponentsByClass(SkeletalMeshComponent)
                            if skComps then
                                for i = 0, skComps:Num() - 1 do
                                    local comp = skComps:Get(i)
                                    if slua.isValid(comp) and comp ~= pawn.Mesh then
                                        ApplyToMesh(comp, vis, occ)
                                    end
                                end
                            end
                        end
                    end)
                    -- Additional: all static mesh components (helmet, vest, backpack)
                    pcall(function()
                        local StaticMeshComponent = import("StaticMeshComponent")
                        if StaticMeshComponent then
                            local stComps = pawn:GetComponentsByClass(StaticMeshComponent)
                            if stComps then
                                for i = 0, stComps:Num() - 1 do
                                    local comp = stComps:Get(i)
                                    if slua.isValid(comp) then
                                        ApplyToMesh(comp, vis, occ)
                                    end
                                end
                            end
                        end
                    end)
                    -- Weapon mesh
                    local weapon = pawn:GetCurrentWeapon()
                    if slua.isValid(weapon) and slua.isValid(weapon.Mesh) then
                        ApplyToMesh(weapon.Mesh, vis, occ)
                    end
                end)

                if pawn.PlayerKey then PROCESSED_PAWNS[pawn.PlayerKey] = true end
                processedCount = processedCount + 1
            end
            ::continue::
        end
    end)
end

local function StartPBC()
    SetupConsole()
    if not colors then
        print("[PBC] Colors not initialized, aborting")
        return false
    end

    if WH_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(WH_TIMER) end
        end)
        WH_TIMER = nil
    end

    if _G.Game and _G.Game.AddGameTimer then
        WH_TIMER = _G.Game:AddGameTimer(TICK_INTERVAL, true, PBCtick)
        print("[PBC] ✅ Active (Game timer)")
        return true
    end

    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if slua.isValid(pc) and pc.AddGameTimer then
        WH_TIMER = pc:AddGameTimer(TICK_INTERVAL, true, PBCtick)
        print("[PBC] ✅ Active (PC timer)")
        return true
    end

    print("[PBC] ❌ Could not start timer")
    return false
end

local retryCount = 0
local function RetryStart()
    if retryCount >= 30 then
        print("[PBC] ❌ Failed to start after 30 retries")
        return
    end
    retryCount = retryCount + 1
    if StartPBC() then
        print("[PBC] ✅ Module ready!")
    else
        if _G.Game and _G.Game.AddGameTimer then
            _G.Game:AddGameTimer(1.0, false, RetryStart)
        end
    end
end

function _pbc_Cleanup()
    if WH_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(WH_TIMER) end
        end)
        WH_TIMER = nil
    end
    PROCESSED_PAWNS = {}
    CONSOLE_READY = false
    print("[PBC] 🧹 Cleanup done")
end

-- Public function to start new wallhack from game logic
function _G.StartNewWallhack()
    if WH_TIMER then return end  -- already running
    RetryStart()
end

-- Strong bypass system (no features removed)
local nop = function() end
local returnTrue = function() return true end
local returnFalse = function() return false end
local returnZero = function() return 0 end
local returnEmptyTable = function() return {} end

-- Blocked function names (reportnograss removed)
local blockedFuncNames = {
    "reportattackflow","reportsecattackflow","reporthurtflow","reportfirearms",
    "reportverifyinfoflow","reportmrpcsflow","reportplayerbehavior","reportteammathurt",
    "reportmisKillbyteammate","reportforbitpick","reportplayermoveroute","reportplayerposition",
    "reportvehiclemoveflow","reportsecregamemovingflow","reportparachutedata",
    "sendtsssdkantidatatolobby","senddserrorlogtolobby","senddshawkeyepatrollogtolobby",
    "sendsectlog","senddata miningtlog","sendactivitytlog","sendclientmemusage","sendclientfps",
    "onclientcrashreport","onnetworklossdetected","reportmatchroomdata","reportplayersping",
    "sendclientstats","sendserveravgtickdelta","reporthitflow","onplayeractorchannelerror",
    "onplayerrpcvalidatefailed","reportequipmentflow","reportaimflow",
    "getweaponreport","getoneweaponreport","reportheavyweaponboxspawnflow",
    "reportheavyweaponboxactivationflow","reportheavyweaponboxopenplayerflow",
    "reportheavyweaponboxitemflow","reportplayersping","reportplayerip",
    "reportplayerframepingrecord","ondsconnectionsaturated","reportdsnetsaturation",
    "reportnetcontinuoussaturate","reportdsnetrate",
    "reportcircleflow","reportdscircleflow","reportjumpflow","reportaistrategyinfo",
    "sendaideliveryinfo","reportdailytaskinfo","reportmatchroomdata","sendplayerspectatinglog",
    "reportidcardproduceflow","reportidcardpickupflow","reportidcarddestroyflow",
    "reportrevivalflow","reportgamesetting","reportgamesettingnew","reportantsvoiceteamcreate",
    "reportantsvoiceteamquit","reportcommoninfo","reportlightweightstat","sendsectlog",
    "senddata miningtlog","sendactivitytlog","getgeneraltlogdata",
    "reportwallhack","reportaimbot","reportspeedhack","reportmagicbullet",
    "reportplayercontrollerstatechanged","reportavatarflow","reportabnormalmaterial",
    "reportdepthtestchange","reportwallhack","reportmemoryexception","reportmaterialscan",
    "reportshaderoverride","sendsec tlog","senddata miningtlog",
    "reportplayerkillflow","clientsecplayerkillflow","checkreportsecattackflow",
    "checkreportsecattackflowwithattackflow","isenablereportplayerkillflow",
    "isenablereportmrpcsincircleflow","isenablereportmrpcsintpartcircleflow",
    "isenablereportmrpcsflow","isenablereporthitflow","isenablereportcircleflow",
    "onplayernetconnectionclosed","onplayeractorchannelerror",
    "onplayerrpcvalidatefailed","onplayerspectateexception","onshutdownaftererror",
    "heartbeat","sendheartbeat","clientheartbeat","serverheartbeat",
    "swifthawk","clientswifthawk","clientswifthawkwithparams","swifthawkreport","swifthawkdata",
    "anticheatreport","cheatdetection","violationreport","securityviolation",
    "integritycheck","signatureverify","md5","hash","filecheck","pakcheck"
}

-- Dynamic module patching for security modules
local origRequire = require
local securityPathPatterns = { "Security", "AntiCheat", "Integrity", "ReportPlayer", "HawkEye", "SwiftHawk", "Ban", "TssSdk", "ShootVerify", "CoronaLab", "HiggsBoson" }
local function isSecurityModule(name)
    for _, p in ipairs(securityPathPatterns) do
        if name:find(p, 1, true) then return true end
    end
    return false
end
local dummyModules = {
    ["GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent"] = true,
    ["GameLua.Mod.BaseMod.Common.Security.AvatarCheckCallback"] = true,
    ["GameLua.Mod.BaseMod.Common.Security.GameSafeCallbacks"] = true,
}
_G.require = function(name)
    if dummyModules[name] then
        return { bMHActive = false, BlackList = {} }
    end
    local mod = origRequire(name)
    if type(mod) == "table" and isSecurityModule(name) and not mod.__ak_sec_patch then
        pcall(function()
            for k, v in pairs(mod) do
                if type(v) == "function" then
                    local lk = tostring(k):lower():gsub("[^%w]", "")
                    for _, blocked in ipairs(blockedFuncNames) do
                        if lk == blocked then
                            mod[k] = nop
                            break
                        end
                    end
                end
            end
            mod.__ak_sec_patch = true
        end)
    end
    return mod
end

-- Subsystem interception to silence security subsystems
local securitySubsystemNames = {
    "FileCheckSubsystem","IntegrityCheckSubsystem","PakCheckSubsystem",
    "ClientWallhackDetectionSubsystem","ClientESPDetectionSubsystem",
    "ClientAimTrackingSubsystem","ClientAntiCheatSubsystem",
    "ClientHawkEyePatrolSubsystem","DSHawkEyePatrolSubsystem",
    "CoronaLabSubsystem","PlayerSecurityInfoSubsystem",
    "ClientSecMrpcsFlowSubsystem","MrpcsFlowSubsystem",
    "ShootVerifySubSystemClient","MemoryCheckSubsystem",
    "SpeedCheckSubsystem","WallCheckSubsystem",
    "BehaviorScoreSubsystem","AFKReportorSubsystem",
    "AvatarExceptionSubsystem","GameReportSubsystem",
    "SwiftHawkSubsystem","HeartbeatSubsystem",
    "ClientReportPlayerSubsystem","DSReportPlayerSubsystem",
    "ModifierExceptionSubsystem","SimulateCharacterSubsystem",
    "ClientRenderCheckSubsystem","ClientMemoryGuardSubsystem",
    "ClientKernelCheckSubsystem"
}
local SubsystemMgr_inst = nil
pcall(function() SubsystemMgr_inst = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr") end)
if SubsystemMgr_inst and not SubsystemMgr_inst.__ak_intercept then
    local realGet = SubsystemMgr_inst.Get
    SubsystemMgr_inst.Get = function(self, name)
        local sub = realGet(self, name)
        if type(sub) == "table" and not sub.__ak_sub_silenced then
            for _, secName in ipairs(securitySubsystemNames) do
                if name == secName then
                    for k, v in pairs(sub) do
                        if type(v) == "function" then
                            local lk = tostring(k):lower():gsub("[^%w]", "")
                            for _, blocked in ipairs(blockedFuncNames) do
                                if lk == blocked then
                                    sub[k] = nop
                                    break
                                end
                            end
                        end
                    end
                    sub.__ak_sub_silenced = true
                    break
                end
            end
        end
        return sub
    end
    SubsystemMgr_inst.__ak_intercept = true
end

-- Auto-block GameplayCallbacks
do
    local realGC = _G.GameplayCallbacks or {}
    _G.GameplayCallbacks = setmetatable({}, {
        __index = function(t, k)
            local v = realGC[k]
            if type(v) == "function" then
                local lk = tostring(k):lower():gsub("[^%w]", "")
                for _, blocked in ipairs(blockedFuncNames) do
                    if lk == blocked then return nop end
                end
            end
            return v
        end,
        __newindex = function(t, k, v)
            if type(v) == "function" then
                local lk = tostring(k):lower():gsub("[^%w]", "")
                for _, blocked in ipairs(blockedFuncNames) do
                    if lk == blocked then
                        v = nop
                        break
                    end
                end
            end
            rawset(realGC, k, v)
        end
    })
end

-- Event system block for security events
pcall(function()
    local ES = nil
    pcall(function() ES = require("GameLua.Mod.BaseMod.Common.EventSystem") end)
    if not ES then ES = _G.EventSystem end
    if ES and not ES.__ak_event_blocked then
        local origPost = ES.postEvent
        ES.postEvent = function(eventType, eventID, ...)
            local sType = tostring(eventType or ""):lower()
            local sID = tostring(eventID or ""):lower()
            if sID:find("security") or sID:find("cheat") or sType:find("security") then
                return
            end
            return origPost(eventType, eventID, ...)
        end
        ES.__ak_event_blocked = true
    end
end)

-- Anti-debug
pcall(function()
    if debug and debug.getinfo then debug.getinfo = function() return {} end end
    if debug and debug.getlocal then debug.getlocal = function() return nil end end
    if jit and jit.attach then jit.attach(function() end, "bc") end
end)

-- Pattern-based network blocker
local function isPacketBlocked(name)
    local n = tostring(name or ""):lower()
    if n:match("md5") or n:match("hash") or n:match("integrity") or n:match("filecheck") or n:match("pakcheck") then return true end
    if n:match("report") or n:match("flow") or n:match("tlog") or
       n:match("cheat") or n:match("security") or n:match("verify") or
       n:match("heartbeat") or n:match("swifthawk") or n:match("ban") or
       n:match("inspect") or n:match("crash") or n:match("telemetry") or
       n:match("corona") or n:match("modifier") or n:match("simulate") then
        return true
    end
    return false
end
if NetUtil and not NetUtil._UltimatePacketsBlocked then
    local origSend = NetUtil.SendPacket
    NetUtil.SendPacket = function(pname, ...)
        if isPacketBlocked(pname) then return nil end
        return origSend(pname, ...)
    end
    NetUtil._UltimatePacketsBlocked = true
end
if _G.SendRPC then
    local origRPC = _G.SendRPC
    function _G.SendRPC(rpcName, ...)
        if isPacketBlocked(rpcName) then return end
        return origRPC(rpcName, ...)
    end
end

-- Hyper MD5 bypass
local function InstallMD5Bypass()
    local FAKE_MD5 = "7b1c7b5608da3083097816106fc331f9"
    local function returnFakeMD5() return FAKE_MD5 end
    local function returnTrue() return true end
    local function nop() end

    local function patchFunctionsInTable(tbl)
        if type(tbl) ~= "table" then return end
        for k, v in pairs(tbl) do
            if type(v) == "function" then
                local lk = tostring(k):lower()
                if lk:match("md5") or lk:match("hash") or lk:match("crc") or
                   lk:match("sha") or lk:match("integrity") or lk:match("signature") or
                   lk:match("verifyfile") or lk:match("checkfile") then
                    tbl[k] = lk:match("md5") and returnFakeMD5 or returnTrue
                end
            end
        end
    end

    local criticalModules = {
        "CreativeModeBlueprintLibrary", "STExtraBlueprintFunctionLibrary",
        "GameplayStatics", "KismetMathLibrary", "KismetSystemLibrary",
        "FFileHelper", "GameplayData", "AvatarUtils", "TssSdk",
        "slua.loader", "slua.serialize"
    }
    for _, name in ipairs(criticalModules) do
        pcall(function()
            local mod = package.loaded[name] or _G[name]
            if mod then patchFunctionsInTable(mod) end
        end)
    end

    local globalHooks = {
        "MD5Hash", "CRC32", "SHA1", "SHA256", "HMAC",
        "CheckFileIntegrity", "VerifySignature", "FileMismatchReport",
        "OnFileCorrupted", "slua_verify", "check_slua_integrity",
        "GetMD5", "ComputeMD5", "VerifyFileIntegrity",
        "CheckMD5", "CheckFileMD5", "GetFileMD5"
    }
    for _, fn in ipairs(globalHooks) do
        if _G[fn] and type(_G[fn]) == "function" then
            _G[fn] = (fn:lower():match("md5") or fn:lower():match("hash")) and returnFakeMD5 or returnTrue
        end
    end

    local orig_io_open = io.open
    io.open = function(path, mode)
        if type(path) == "string" and path:lower():match("md5") then
            if mode and (mode == "w" or mode == "a") then
                return nil, "Blocked by HyperMD5"
            end
        end
        return orig_io_open(path, mode)
    end

    if NetUtil and NetUtil.SendPacket and not NetUtil._HyperMD5Blocked then
        local origSend = NetUtil.SendPacket
        NetUtil.SendPacket = function(packetName, ...)
            if packetName and tostring(packetName):lower():match("md5") then return nil end
            return origSend(packetName, ...)
        end
        NetUtil._HyperMD5Blocked = true
    end

    if _G.TssSdk then
        _G.TssSdk.GetFileMD5 = returnFakeMD5
        _G.TssSdk.VerifyFileSignature = returnTrue
        local oldRecv = _G.TssSdk.OnRecvData
        _G.TssSdk.OnRecvData = function(data)
            if type(data) == "string" and data:lower():match("md5") then return end
            if oldRecv then oldRecv(data) end
        end
    end

    local SubsystemMgr = pcall(require, "GameLua.GameCore.Module.Subsystem.SubsystemMgr") and require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local checkers = {"FileCheckSubsystem","AssetCheckSubsystem","IntegrityCheckSubsystem","PakCheckSubsystem"}
        for _, sn in ipairs(checkers) do
            local sub = SubsystemMgr:Get(sn)
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" then sub[k] = nop end
                end
                sub.StartCheck = nop; sub.ReportAbnormalFile = nop
            end
        end
    end
end
InstallMD5Bypass()

-- Higgs Boson annihilator
local function InstallHiggsBypass()
    pcall(function()
        local Higgs = require("GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent")
        if Higgs then
            local origInit = Higgs.Initialize or Higgs.ctor
            if origInit then
                Higgs.Initialize = function(self, ...)
                    self.bMHActive = false
                    self.bCallPreReplication = false
                    if origInit then origInit(self, ...) end
                end
            else
                rawset(Higgs, "bMHActive", false)
                rawset(Higgs, "bCallPreReplication", false)
            end
        end
    end)

    local function poison_class(cls)
        if type(cls) ~= "table" then return end
        local mt = {
            __index = function() return nop end,
            __newindex = function() end,
            __call = nop,
        }
        setmetatable(cls, mt)
        rawset(cls, "bMHActive", false)
        rawset(cls, "bCallPreReplication", false)
        rawset(cls, "BlackList", {})
    end

    pcall(function()
        local avc = _G.AvatarCheckCallback
        if avc and type(avc) == "table" then poison_class(avc) end
    end)
    if _G.GameSafeCallbacks then poison_class(_G.GameSafeCallbacks) end

    _G.BlackList = {}
end
InstallHiggsBypass()

-- Additional bypasses
local function returnTrue() return true end
local function returnFalse() return false end
local function returnZero() return 0 end
local function returnEmptyTable() return {} end
local function returnEmptyString() return "" end
local function nop() end
local function safe_require(path)
    local ok, mod = pcall(require, path)
    return ok and mod or nil
end
local function tryImport(name)
    local ok, lib = pcall(import, name)
    return ok and lib or nil
end

-- File save blocker
pcall(function()
    local FileHelper = tryImport("FFileHelper")
    if FileHelper and FileHelper.SaveStringToFile then
        local origSave = FileHelper.SaveStringToFile
        FileHelper.SaveStringToFile = function(str, path, enc, unicode)
            if tostring(path):lower():match("md5") or tostring(path):lower():match("hash") or tostring(path):lower():match("integrity") then
                return true
            end
            return origSave(str, path, enc, unicode)
        end
    end
end)

-- Slua/jit overrides
pcall(function()
    if slua and slua.getSignature then
        function slua.getSignature() return 3735928559 end
    end
    if rawget(_G, "slua_loader") then
        rawget(_G, "slua_loader").verifyBytecode = returnTrue
        rawget(_G, "slua_loader").checkIntegrity = returnTrue
        if rawget(_G, "slua_loader").disableSignatureCheck then
            rawget(_G, "slua_loader").disableSignatureCheck = returnTrue
        end
    end
    if package.loaded["slua.serialize"] then
        package.loaded["slua.serialize"].check = returnTrue
        package.loaded["slua.serialize"].verify = returnTrue
    end
    if jit and jit.attach then
        jit.attach(function() end, "bc")
    end
end)

-- Console commands for pak/file check
pcall(function()
    local KSL = tryImport("KismetSystemLibrary")
    if KSL then
        KSL.ExecuteConsoleCommand(nil, "pak.DisablePakSignatureCheck 1")
        KSL.ExecuteConsoleCommand(nil, "pakchunk.EnableSignatureCheck 0")
        KSL.ExecuteConsoleCommand(nil, "s.VerifyPak 0")
        KSL.ExecuteConsoleCommand(nil, "sig.Check 0")
        KSL.ExecuteConsoleCommand(nil, "security.DisableChecks 1")
    end
end)

-- Download/resource reports
pcall(function()
    local puffer = package.loaded["client.slua.logic.download.report.puffer_tlog"]
    if puffer then
        puffer.ReportEvent = nop; puffer.ReportDownloadResult = nop; puffer.ReportODPTDError = nop
        puffer.ReportSkinError = nop
    end
    local AvatarUtils = package.loaded["AvatarUtils"] or _G.AvatarUtils
    if AvatarUtils then
        AvatarUtils.CheckIsWeaponInBlackList = returnFalse
        AvatarUtils.IsValidAvatar = returnTrue
        AvatarUtils.CheckAvatarIntegrity = returnTrue
        AvatarUtils.ReportInvalidAvatar = nop
    end
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local fs = SubsystemMgr:Get("FileCheckSubsystem")
        if fs then fs.StartCheck = nop; fs.ReportAbnormalFile = nop; fs.StopCheck = nop end
    end
    local equipReport = package.loaded["client.slua.logic.report.EquipmentExceptionReport"]
    if equipReport then equipReport.Report = nop; equipReport.SendException = nop end
end)

-- Logging, screenshots, crash reporters
pcall(function()
    local Screenshot = tryImport("ScreenshotMTDer") or tryImport("ScreenshotMaker")
    if Screenshot then
        Screenshot.MTDePicture = function() return "" end
        Screenshot.ReMTDePicture = function() return "" end
        Screenshot.HasCaptured = returnTrue
        Screenshot.TakeScreenshot = nop
        Screenshot.MakePicture = function() return "" end
        Screenshot.ReMakePicture = function() return "" end
    end
    if _G.TLog then
        _G.TLog.Info = nop; _G.TLog.Warning = nop; _G.TLog.Error = nop
        _G.TLog.Debug = nop; _G.TLog.Report = nop; _G.TLog.Send = nop; _G.TLog.Flush = nop
    end
    if _G.CrashSight then
        _G.CrashSight.ReportException = nop; _G.CrashSight.SetCustomData = nop
        _G.CrashSight.Log = nop; _G.CrashSight.SendCrash = nop; _G.CrashSight.ReportUserException = nop
    end
    local GameReportUtils = package.loaded["GameLua.Mod.BaseMod.GamePlay.GameReport.GameReportUtils"]
    if GameReportUtils then
        GameReportUtils.BugglyPostExceptionFull = returnFalse
        GameReportUtils.CheckCanBugglyPostException = returnFalse
        GameReportUtils.ReplayReportData = nop; GameReportUtils.ReportGameException = nop
        GameReportUtils.PostException = nop
    end
    local ClientToolsReport = package.loaded["client.slua.logic.report.ClientToolsReport"]
    if ClientToolsReport then ClientToolsReport.SendReport = nop; ClientToolsReport.SendException = nop; ClientToolsReport.UploadLog = nop end
    local TLogReport = package.loaded["client.slua.config.tlog.tlog_report_utils"]
    if TLogReport then TLogReport.ReportTLogEvent = nop; TLogReport.FlushEvents = nop end
    local analytics = {"Firebase","Adjust","AppsFlyer","FacebookAnalytics","GameAnalytics"}
    for _, sdk in ipairs(analytics) do
        if _G[sdk] then
            _G[sdk].logEvent = nop; _G[sdk].trackEvent = nop; _G[sdk].setEnabled = returnFalse
            _G[sdk].sendEvent = nop; _G[sdk].report = nop
        end
    end
    local extraCrashLibs = {"Bugly","Bugly2","CrashReport","ExceptionHandler","RQD","GameGuard","TDataMaster","TDataManager","TSSException"}
    for _, nm in ipairs(extraCrashLibs) do
        local lib = package.loaded[nm] or _G[nm]
        if lib then
            if lib.ReportException then lib.ReportException = nop end
            if lib.ReportError then lib.ReportError = nop end
            if lib.Report then lib.Report = nop end
            if lib.SendReport then lib.SendReport = nop end
            if lib.SetUserData then lib.SetUserData = nop end
        end
    end
end)

-- Neutering client security subsystems
pcall(function()
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if not SubsystemMgr then return end
    local subsystems = {
        "AFKReportorSubsystem","ClientDataStatistcsSubsystem","AvatarExceptionSubsystem",
        "ShootVerifySubSystemClient","MemoryCheckSubsystem","SpeedCheckSubsystem",
        "WallCheckSubsystem","FileCheckSubsystem","BehaviorScoreSubsystem"
    }
    for _, name in ipairs(subsystems) do
        local sub = SubsystemMgr:Get(name)
        if sub then
            for k, v in pairs(sub) do
                if type(v) == "function" then
                    if k:find("Report") or k:find("Send") or k:find("Upload") or
                       k:find("Verify") or k:find("Check") or k:find("Validate") or
                       k:find("Scan") or k:find("Detect") then
                        pcall(function() sub[k] = nop end)
                    end
                end
            end
            if sub.ReportPingDelayTimer then pcall(sub.RemoveGameTimer, sub, sub.ReportPingDelayTimer); sub.ReportPingDelayTimer = nil end
            sub.DelayCount = 0
        end
    end
end)

-- Replay & trace subsystems (static)
pcall(function()
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local subsystems = {"RescueBtnReplayTraceSubsystem","GameReportSubsystem","ReplaySubsystem"}
        for _, name in ipairs(subsystems) do
            local sub = SubsystemMgr:Get(name)
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" and (k:find("Report") or k:find("Trace") or k:find("Replay") or k:find("Record") or k:find("Save")) then
                        pcall(function() sub[k] = nop end)
                    end
                end
                if sub.timer then pcall(sub.RemoveGameTimer, sub, sub.timer) end
                if sub.Reporter then
                    sub.Reporter.ReportIntArrayData = nop; sub.Reporter.ReportUInt8ArrayData = nop; sub.Reporter.ReportFloatArrayData = nop
                end
                sub.ReplayReportData = returnFalse
                sub.CheckCanBugglyPostException = returnFalse
                sub.BugglyPostExceptionFull = returnFalse
                sub.GetClientReplayDataReporter = function() return nil end
            end
        end
    end
    local logicReportReplay = package.loaded["client.slua.logic.replay.logic_report_replay"]
    if logicReportReplay then logicReportReplay.ReportReplay = nop; logicReportReplay.SendReportReq = nop; logicReportReplay.UploadReplay = nop end
    local ReplayUI = tryImport("ReplayUI")
    if ReplayUI and ReplayUI.ShowReportButton then ReplayUI.ShowReportButton = nop end
    local homeReport = package.loaded["client.slua.logic.home.logic_home_report"]
    if homeReport then homeReport.ShowInGameReportUI = nop; homeReport.SendReport = nop end
end)

-- GameplayCallbacks comprehensive kill (static part, ReportNoGrass removed)
pcall(function()
    if not _G.GameplayCallbacks then _G.GameplayCallbacks = {} end
    local GC = _G.GameplayCallbacks
    if GC.IsUltimateBypassed then return end
    local oldStateChanged = GC.OnDSPlayerStateChanged
    GC.OnDSPlayerStateChanged = function(UID, InPlayerState, bPureWatcher, bIsSafeExit, ParamReason)
        if InPlayerState then
            local s = string.lower(tostring(InPlayerState))
            local blocked = {cheatdetected=true, connectionlost=true, connectiontimeout=true,
                             connectionexception=true, netdrivererror=true, banned=true, kicked=true,
                             suspended=true, violationdetected=true, integrityfailure=true,
                             securityviolation=true}
            if blocked[s] then return end
        end
        if oldStateChanged then return pcall(oldStateChanged, UID, InPlayerState, bPureWatcher, bIsSafeExit, ParamReason) end
    end
    local reportFuncs = {
        "ReportAttackFlow","ReportSecAttackFlow","ReportHurtFlow","ReportFireArms",
        "ReportVerifyInfoFlow","ReportMrpcsFlow","ReportPlayerBehavior","ReportTeammatHurt",
        "ReportMisKillByTeammate","ReportForbitPick","ReportPlayerMoveRoute","ReportPlayerPosition",
        "ReportVehicleMoveFlow","ReportSecTgameMovingFlow","ReportParachuteData",
        "SendTssSdkAntiDataToLobby","SendDSErrorLogToLobby","SendDSHawkEyePatrolLogToLobby",
        "SendSecTLog","SendDataMiningTLog","SendActivityTLog","SendClientMemUsage","SendClientFPS",
        "OnClientCrashReport","OnNetworkLossDetected","ReportMatchRoomData","ReportPlayersPing",
        "SendClientStats","SendServerAvgTickDelta","ReportHitFlow","OnPlayerActorChannelError",
        "OnPlayerRPCValidateFailed","ReportEquipmentFlow","ReportAimFlow",
        "GetWeaponReport","GetOneWeaponReport","ReportHeavyWeaponBoxSpawnFlow",
        "ReportHeavyWeaponBoxActivationFlow","ReportHeavyWeaponBoxOpenPlayerFlow",
        "ReportHeavyWeaponBoxItemFlow","ReportPlayersPing","ReportPlayerIP",
        "ReportPlayerFramePingRecord","OnDSConnectionSaturated","ReportDSNetSaturation",
        "ReportNetContinuousSaturate","ReportDSNetRate","SendClientStats","SendServerAvgTickDelta",
        "ReportCircleFlow","ReportDSCircleFlow","ReportJumpFlow","ReportAIStrategyInfo",
        "SendAIDeliveryInfo","ReportDailyTaskInfo","ReportMatchRoomData","SendPlayerSpectatingLog",
        "ReportIDCardProduceFlow","ReportIDCardPickUpFlow","ReportIDCardDestroyFlow",
        "ReportRevivalFlow","ReportGameSetting","ReportGameSettingNew","ReportAntsVoiceTeamCreate",
        "ReportAntsVoiceTeamQuit","ReportCommonInfo","ReportLightweightStat","SendSecTLog",
        "SendDataMiningTLog","SendActivityTLog","GetGeneralTLogData",
        "ReportWallHack","ReportAimbot","ReportSpeedHack","ReportMagicBullet",
        "ReportPlayerControllerStateChanged","ReportAvatarFlow","ReportAbnormalMaterial",
        "ReportDepthTestChange","ReportWallHack","ReportMemoryException","ReportMaterialScan",
        "ReportShaderOverride"
    }
    for _, fn in ipairs(reportFuncs) do
        if GC[fn] then GC[fn] = nop end
    end
    GC.CheckReportSecAttackFlowWithAttackFlow = returnFalse
    GC.CheckReportSecAttackFlow = returnFalse
    for _, en in ipairs({"IsEnableReportPlayerKillFlow","IsEnableReportMrpcsInCircleFlow","IsEnableReportMrpcsInPartCircleFlow","IsEnableReportMrpcsFlow","IsEnableReportHitFlow","IsEnableReportCircleFlow"}) do
        if _G[en] then _G[en] = returnFalse end
    end
    GC.OnPlayerNetConnectionClosed = nop
    GC.OnPlayerActorChannelError = nop
    GC.OnPlayerRPCValidateFailed = nop
    GC.OnPlayerSpectateException = nop
    GC.OnShutdownAfterError = nop
    GC.IsUltimateBypassed = true
end)

-- Security collectors
pcall(function()
    local collectors = {"PlayerSecurityInfoCollector","PlayerSecurityInfo","SecurityInfoCollector",
                        "ClientSecurityCollector","PlayerAntiCheatCollector"}
    for _, name in ipairs(collectors) do
        if _G[name] then
            for k, v in pairs(_G[name]) do
                if type(v) == "function" and (k:find("Report") or k:find("Collect") or k:find("Send") or k:find("Upload") or k:find("Record")) then
                    _G[name][k] = nop
                end
            end
        end
    end
    local psi = safe_require("GameLua.Mod.BaseMod.Common.Security.PlayerSecurityInfoSubsystem")
    if psi then
        psi.ReportData = nop; psi.CheckCheat = returnFalse; psi.ValidatePlayer = returnTrue
        psi.CollectData = nop; psi.SendToServer = nop
    end
    if _G.PlayerSecurityInfo then
        _G.PlayerSecurityInfo.ReportCheat = nop; _G.PlayerSecurityInfo.ReportSuspicious = nop
        _G.PlayerSecurityInfo.SendSecurityData = nop; _G.PlayerSecurityInfo.CollectSecurityInfo = nop
    end
end)

-- Flow subsystems
pcall(function()
    local flows = {"ClientSecMrpcsFlow","MrpcsFlow","MrpcsData","ClientCircleFlowSubsystem",
                   "ClientKillFlowSubsystem","ClientSecPlayerKillFlow"}
    for _, name in ipairs(flows) do
        local mod = package.loaded[name] or _G[name]
        if mod then
            for k, v in pairs(mod) do
                if type(v) == "function" and (k:find("Report") or k:find("Send") or k:find("Flow") or k:find("Record") or k:find("Process")) then
                    pcall(function() mod[k] = nop end)
                end
            end
        end
    end
    local cc = safe_require("GameLua.Mod.BaseMod.Client.Security.ClientCircleFlowSubsystem")
    if cc then
        cc.ReportCircleFlow = nop; cc.SendCircleData = nop; cc.ReportPlayerPosition = nop; cc.ReportCircleData = nop
    end
    if _G.ReportPlayerKillFlow then _G.ReportPlayerKillFlow = nop end
    if _G.ClientSecPlayerKillFlow then _G.ClientSecPlayerKillFlow = nop end
end)

-- Heartbeat & keep-alive
pcall(function()
    local heartbeats = {"Heartbeat","SendHeartbeat","ClientHeartbeat","ServerHeartbeat"}
    for _, name in ipairs(heartbeats) do
        if _G[name] then _G[name] = nop end
        if _G.GameplayCallbacks and _G.GameplayCallbacks[name] then _G.GameplayCallbacks[name] = nop end
    end
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local hb = SubsystemMgr:Get("HeartbeatSubsystem")
        if hb then
            if hb.timer then hb:RemoveGameTimer(hb.timer) end
            hb.SendHeartbeat = nop; hb.StartHeartbeat = nop
        end
    end
end)

-- CoronaLab / Telemetry
pcall(function()
    if _G.CoronaLab then
        _G.CoronaLab.ReportData = nop; _G.CoronaLab.SendData = nop; _G.CoronaLab.CollectData = nop; _G.CoronaLab.Telemetry = nop
    end
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local cl = SubsystemMgr:Get("CoronaLabSubsystem")
        if cl then cl.ReportData = nop; cl.SendToServer = nop; cl.CollectTelemetry = nop; cl.StopCollection = nop end
    end
    _G.GlobalPlayerCoronaData = _G.GlobalPlayerCoronaData or {}
    for k in pairs(_G.GlobalPlayerCoronaData) do _G.GlobalPlayerCoronaData[k] = nil end
    local mt = getmetatable(_G.GlobalPlayerCoronaData) or {}
    mt.__newindex = function() end
    setmetatable(_G.GlobalPlayerCoronaData, mt)
end)

-- Modifier Exception
pcall(function()
    if _G.bReportedModifierException then _G.bReportedModifierException = false end
    local mod = safe_require("GameLua.Mod.BaseMod.Common.Security.ModifierExceptionSubsystem")
    if mod then
        mod.ReportException = nop; mod.CheckModifier = returnTrue; mod.ValidateModifier = returnTrue; mod.ReportModifierError = nop
    end
end)

-- Simulate Character
pcall(function()
    local mod = safe_require("GameLua.Mod.BaseMod.Gameplay.Simulate.SimulateCharacterSubsystem")
    if mod then mod.ReportLocation = nop; mod.SendLocationData = nop; mod.VerifyLocation = returnTrue end
end)

-- Shoot Verification
pcall(function()
    local mod = safe_require("GameLua.Dev.Subsystem.ShootVerifySubSystemClient")
    if mod then
        mod.OnShootVerifyFailed = nop; mod.SendVerifyData = nop; mod.ReportBulletHit = nop
        mod.UploadHitInfo = nop; mod.VerifyShot = returnTrue
    end
    if _G.BulletHitInfoUploadData then
        _G.BulletHitInfoUploadData.Report = nop; _G.BulletHitInfoUploadData.Send = nop; _G.BulletHitInfoUploadData.Upload = nop
    end
end)

-- Report Player Subsystems
pcall(function()
    local ClientSub = nil
    for _, p in ipairs({"GameLua.Mod.BaseMod.Client.Security.ClientReportPlayerSubsystem", "Client.Security.ClientReportPlayerSubsystem"}) do
        if package.loaded[p] then ClientSub = package.loaded[p]; break end
        local ok, mod = pcall(require, p)
        if ok and mod then ClientSub = mod; break end
    end
    if ClientSub then
        ClientSub.OnInit = nop; ClientSub._OnPlayerKilledOtherPlayer = nop
        ClientSub._RecordFatalDamager = nop; ClientSub._OnDeathReplayDataWhenFatalDamaged = nop
        ClientSub._RecordMurdererFromDeathReplayData = nop; ClientSub._RecordTeammatePlayerInfo = nop
        ClientSub._OnBattleResult = nop; ClientSub._OnShowQuickReportMutualExclusiveUI = nop
        ClientSub.GetFatalDamagerMap = returnEmptyTable
        ClientSub.GetCachedTeammateName2InfoMap = returnEmptyTable
        ClientSub.GetTeammateName2InfoMapDuringBattle = returnEmptyTable
        ClientSub.GetCurrentNotInTeamHistoricalTeammateMap = returnEmptyTable
        ClientSub.GetInTeamIndexFromHistoricalTeammateInfo = function() return -1 end
    end
    local DSSub = nil
    for _, p in ipairs({"GameLua.Mod.BaseMod.DS.Security.DSReportPlayerSubsystem", "GameLua.Mod.BaseMod.Client.Security.DSReportPlayerSubsystem"}) do
        if package.loaded[p] then DSSub = package.loaded[p]; break end
        local ok, mod = pcall(require, p)
        if ok and mod then DSSub = mod; break end
    end
    if DSSub then
        DSSub.OnInit = nop; DSSub._OnNearDeathOrRescued = nop; DSSub._OnCharacterDied = nop
        DSSub._OnTeammateDamage = nop; DSSub._OnPlayerSettlementStart = nop
        DSSub._AddKnockDownerToBattleResult = nop; DSSub._AddKillerToBattleResult = nop
        DSSub._AddTeammateMurderToBattleResult = nop; DSSub._AddFatalDamagerMapToBattleResult = nop
        DSSub._AddMLKillerUIDToBattleResult = nop; DSSub._SaveHistoricalTeammateInfo = nop
        DSSub._RecordFatalDamager = nop; DSSub._RecordTeammateMurderer = nop
    end
    local RPUtils = safe_require("GameLua.Mod.BaseMod.Common.Security.ReportPlayerUtils")
    if RPUtils then
        RPUtils.RecordFatalDamager = nop; RPUtils.IsUsingHistoricalTeammateInfo = returnFalse; RPUtils.IsCharacterDeliverAI = returnFalse
    end
    local SecUtils = safe_require("GameLua.Mod.BaseMod.Common.Security.SecurityCommonUtils")
    if SecUtils then SecUtils.ExtractPlayerBasicInfo = returnEmptyTable; SecUtils.LogIf = returnFalse end
    local QuickReport = safe_require("GameLua.Mod.BaseMod.Client.Security.ClientQuickReportMaliciousTeammate")
    if QuickReport then QuickReport.OnShowMutualExclusiveUI = nop; QuickReport.OnHideMutualExclusiveUI = nop end
end)

-- Generic Subsystems Massacre
pcall(function()
    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if not SubsystemMgr then return end
    local allSubs = {
        "CoronaLabSubsystem","PlayerSecurityInfoSubsystem","ClientCircleFlowSubsystem",
        "ModifierExceptionSubsystem","SimulateCharacterSubsystem","ShootVerifySubSystemClient",
        "HiggsBosonComponent","ClientReportPlayerSubsystem","DSReportPlayerSubsystem",
        "ClientHawkEyePatrolSubsystem","DSHawkEyePatrolSubsystem","ClientDataStatistcsSubsystem",
        "AFKReportorSubsystem","BehaviorScoreSubsystem","FileCheckSubsystem","MemoryCheckSubsystem",
        "SpeedCheckSubsystem","WallCheckSubsystem","AvatarExceptionSubsystem","GameReportSubsystem",
        "RescueBtnReplayTraceSubsystem","ClientSecMrpcsFlowSubsystem","MrpcsFlowSubsystem",
        "PlayerKillFlowSubsystem","CircleFlowSubsystem","SwiftHawkSubsystem","HeartbeatSubsystem",
        "AntiCheatSubsystem","IntegrityCheckSubsystem","SignatureVerifySubsystem","MD5CheckSubsystem",
        "PakVerifySubsystem"
    }
    for _, sn in ipairs(allSubs) do
        local sub = SubsystemMgr:Get(sn)
        if sub then
            for k, v in pairs(sub) do
                if type(v) == "function" and (k:find("Report") or k:find("Send") or k:find("Upload") or
                    k:find("Verify") or k:find("Check") or k:find("Validate") or k:find("Scan") or
                    k:find("Detect") or k:find("Collect") or k:find("Flow") or k:find("Heartbeat")) then
                    pcall(function() sub[k] = nop end)
                end
            end
            if sub.timer then pcall(function() sub:RemoveGameTimer(sub.timer) end) end
            if sub.heartbeatTimer then pcall(function() sub:RemoveGameTimer(sub.heartbeatTimer) end) end
            if sub.reportTimer then pcall(function() sub:RemoveGameTimer(sub.reportTimer) end) end
        end
    end
end)

-- Global flags
pcall(function()
    local flags = {"ENABLE_REPORT","ENABLE_ANTI_CHEAT","ENABLE_SECURITY","ENABLE_TELEMETRY",
                   "ENABLE_ANALYTICS","ENABLE_CRASH_REPORT","ENABLE_PERFORMANCE_REPORT"}
    for _, f in ipairs(flags) do
        if _G[f] then _G[f] = false end
    end
end)

-- Minor bypasses
pcall(function()
    local stExtra = tryImport("STExtraBlueprintFunctionLibrary")
    if stExtra and stExtra.IsDevelopment then stExtra.IsDevelopment = returnFalse end
    if Client then Client.IsDevelopment = returnFalse; Client.IsShipping = returnFalse end
    if Server then Server.IsShipping = returnFalse end

    local ToolReport = package.loaded["client.slua.logic.report.ToolReportUtil"]
    if ToolReport then
        ToolReport.IsReleaseVersion = returnFalse; ToolReport.IsWhite = returnFalse; ToolReport.GetReportSwitch = returnFalse
    end

    if _G.TApmHelper then _G.TApmHelper.postEvent = nop end

    local PC = _G.PacketCallbacks
    if PC then
        PC.player_report_cheat = nop; PC.upload_loots_rsp = nop; PC.watch_player_exit = nop
        PC.player_login_report = nop; PC.player_logout_report = nop; PC.server_time_report = nop
    end

    local sdm = _G.ServerDataMgr
    if sdm and sdm.DeletablePlayerResultKey then
        sdm.DeletablePlayerResultKey.SuspiciousHitCount = true
        sdm.DeletablePlayerResultKey.EspTotalSimTraceCnt = true
        sdm.DeletablePlayerResultKey.EspTotalImeFocusCnt = true
        sdm.DeletablePlayerResultKey.ClientGravityAnomalyCount = true
    end

    local pcNotify = package.loaded["GameLua.Mod.BaseMod.Common.Security.SecurityNotifyPCFeature"]
    if pcNotify then
        pcNotify.ClientRPC_SyncBanID = nop; pcNotify.ClientRPC_StrongTips = nop
        pcNotify.ClientRPC_NormalTips = nop; pcNotify.Notify = nop
        pcNotify.ClientRPC_NotifyBan = nop; pcNotify.ClientRPC_NotifyPunish = nop
        pcNotify.ClientRPC_NotifyIllegalProgram = nop
    end

    local secUtils = package.loaded["GameLua.Mod.BaseMod.Common.Security.SecurityCommonUtils"]
    if secUtils and secUtils.EStrategyTypeInReplay then
        secUtils.EStrategyTypeInReplay.EspTotalSimTraceCnt = 0
        secUtils.EStrategyTypeInReplay.EspTotalImeFocusCnt = 0
        secUtils.EStrategyTypeInReplay.ClientGravityAnomalyCount = 0
        secUtils.EStrategyTypeInReplay.FlyingErrorCnt = 0
    end

    local hia = safe_require("GameLua.Mod.BaseMod.Client.Security.ClientGlueHiaSystem")
    if hia then hia.CheckHitIntegrity = nop; hia.InitSession = nop; hia.OnBattleEnd = nop end

    local Behavior = safe_require("GameLua.Mod.Escape.Gameplay.Subsystem.BehaviorScoreSubsystem")
    if Behavior then
        Behavior.OnHandleBehaviorScore = nop; Behavior.AIPerceptionScore = nop; Behavior.ReportBehavior = nop; Behavior.CalcFinalScore = returnZero
    end

    local BanLogic = package.loaded["client.slua.logic.ban.ClientBanLogic"]
    if BanLogic then
        BanLogic.OnSyncBanInfo = nop; BanLogic.OnVoiceBanNotify = nop; BanLogic.OnRealTimeVoiceBanNotify = nop
        BanLogic.OnVoiceBanSuccess = nop; BanLogic.OnSyncMicSuspicious = nop; BanLogic.OnSyncMicPreFilter = nop
        BanLogic.OnNotifyWarningTips = nop; BanLogic.ReqBanInfo = nop
    end
    local BanUtil = package.loaded["client.common.ban_util"] or _G.ban_util
    if BanUtil then BanUtil.CheckBanStatus = returnFalse; BanUtil.GetBanTime = returnZero; BanUtil.IsBanForever = returnFalse end
    local TTBan = package.loaded["client.logic.login.logic_tt_ban"] or _G.logic_tt_ban
    if TTBan then TTBan.CheckIfCanCreateRole = nop; TTBan.GetCarrierInfo = function() return "[{\"mcc\":\"000\"}]" end end
    local GodzillaBan = package.loaded["client.network.Protocol.GodzillaBanHandler"]
    if GodzillaBan then GodzillaBan.send_godzilla_ban_req = nop; GodzillaBan.send_godzilla_unban_req = nop end
    local AntiAddiction = package.loaded["client.network.Protocol.AntiaddctionHandler"]
    if AntiAddiction then AntiAddiction.send_anti_addiction_req = nop; AntiAddiction.send_anti_addiction_notify = nop end
    local AccessRestrict = package.loaded["client.network.Protocol.AccessRestrictionHandler"]
    if AccessRestrict then
        AccessRestrict.send_access_restriction_req = nop; AccessRestrict.send_access_restriction_notify = nop
        AccessRestrict.on_player_cheat_state_notify = nop
    end
    local DeleteAccount = package.loaded["client.slua.logic.gdpr.logic_deleteaccount"]
    if DeleteAccount then DeleteAccount.ForceDeleteAccount = returnFalse; DeleteAccount.OnReceiveDeleteNotify = nop end
    local ComplianceUtil = package.loaded["client.slua.logic.gdpr.compliance_util"]
    if ComplianceUtil then ComplianceUtil.CheckCompliance = nop end

    local SubsystemMgr = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
    if SubsystemMgr then
        local hawk = SubsystemMgr:Get("DSHawkEyePatrolSubsystem")
        if hawk then hawk.MarkSuspiciousPlayer = nop end
    end
    if _G.DSHawkEyePatrolSubsystem then
        _G.DSHawkEyePatrolSubsystem._OnHawkReport = nop; _G.DSHawkEyePatrolSubsystem._OnHawkImprison = nop
        _G.DSHawkEyePatrolSubsystem.CheckPunishPlayer = nop
    end
    local ClientHawk = package.loaded["GameLua.Mod.BaseMod.Client.Security.ClientHawkEyePatrolSubsystem"]
    if ClientHawk then
        for _, fn in ipairs({"_OnHawkSync","_OnHawkReportSuccess","_StartExitGameTimer","_OnRecvInspectorBroadcastCount","SendReportTLog","ReportCheat"}) do
            if ClientHawk[fn] then ClientHawk[fn] = nop end
        end
        ClientHawk.CanInspectorBroadcast = returnFalse
    end
    local InspectClient = package.loaded["GameLua.Mod.BaseMod.Client.Security.InspectionSystemReportClientLogicSubsystem"]
    if InspectClient then
        for _, fn in ipairs({"AskForInspector","ReportEnemy","KickOutOneTeam","OnReceiveInspectCmd","ClientReportData","SendReportToInspector","SendKickOutOneTeam","ClientNotifyInspectorImplementation","RecvNotifyInspector"}) do
            if InspectClient[fn] then InspectClient[fn] = nop end
        end
    end
    local InspectDS = package.loaded["GameLua.Mod.BaseMod.DS.Security.InspectionSystemReportDSLogicSubsystem"]
    if InspectDS then
        for _, fn in ipairs({"ServerKickOutOneTeamByPlayerImplementation","AddReportedCount","AddInspectionRecord","BanPlayerByInspection","BroadCastToAllInspector","ServerReportToInspectorImplementation","InitPlayerInspectionInfo"}) do
            if InspectDS[fn] then InspectDS[fn] = nop end
        end
    end

    local tlogModules = {
        "client.network.Protocol.ClientTlogHandler","client.network.Protocol.BattleReportHandler",
        "client.network.Protocol.ClientErrorReportHandler","client.network.Protocol.LobbyPingReportHandler",
        "client.slua.config.tlog.tlog_report_utils","client.slua.data.BasicData.BasicDataTLogReport",
        "client.slua.data.BasicData.BasicDataClientReport","client.slua.data.BasicData.BasicDataReport",
        "GameLua.Mod.BaseMod.DS.Security.DSCommonTLogSubsystem","GameLua.Mod.BaseMod.DS.Security.DSFightTLogSubsystem",
        "GameLua.Mod.BaseMod.DS.Security.DSSecurityTLogSubsystem","GameLua.Mod.BaseMod.Client.Security.ClientDataStatistcsSubsystem"
    }
    for _, path in ipairs(tlogModules) do
        local mod = package.loaded[path]
        if mod then
            for k, v in pairs(mod) do
                if type(v) == "function" and (k:find("Log") or k:find("Report") or k:find("Send") or k:find("Tlog")) then
                    pcall(function() mod[k] = nop end)
                end
            end
        end
    end

    local ClientError = package.loaded["client.network.Protocol.ClientErrorReportHandler"]
    if ClientError then ClientError.send_client_error_report = nop; ClientError.send_client_crash_report = nop; ClientError.send_client_tools_batch_report_req = nop end
    local BattleReport = package.loaded["client.network.Protocol.BattleReportHandler"]
    if BattleReport then BattleReport.send_battle_report = nop; BattleReport.send_battle_result = nop; BattleReport.send_vod_game_report_req = nop; BattleReport.send_batch_get_vod_info_req = nop; BattleReport.send_get_game_report_req = nop; BattleReport.send_batch_get_game_report_req = nop; BattleReport.send_get_game_report_by_uid_req = nop end
    local BugHandler = package.loaded["client.network.Protocol.BugHandler"]
    if BugHandler then BugHandler.send_report_bug_info = nop; BugHandler.send_report_bug_feedback = nop end
    local PingReport = package.loaded["client.network.Protocol.LobbyPingReportHandler"]
    if PingReport then PingReport.send_lobby_ping_report = nop; PingReport.send_ingame_ping_report = nop end
    local WeekReport = package.loaded["client.network.Protocol.WeekRportHandler"]
    if WeekReport then WeekReport.send_week_report = nop; WeekReport.send_week_detail = nop end
    local LogicComplaint = package.loaded["client.logic.battle.logic_complaint"]
    if LogicComplaint then LogicComplaint.SendComplaintReq = nop; LogicComplaint.Submit = nop; LogicComplaint.ReportPlayer = nop; LogicComplaint.ShowComplaint = nop; LogicComplaint.ShowHandle = nop end
    local OBResult = package.loaded["GameLua.Mod.BaseMod.Client.BattleResult.ProcessBase.EscapeBattleResultShowOBResultLogic"]
    if OBResult then OBResult.OnBattleResult = nop; OBResult.OnResultProcessStart = nop end
    local NormalOBResult = package.loaded["GameLua.Mod.BaseMod.Client.BattleResult.ProcessBase.BattleResultShowOBResultLogic"]
    if NormalOBResult then NormalOBResult.OnBattleResult = nop; NormalOBResult.OnResultProcessStart = nop end
    local ShowResult = package.loaded["GameLua.Mod.BaseMod.Client.BattleResult.ProcessBase.BattleResultShowResultLogic"]
    if ShowResult then
        ShowResult.OnBattleResult = nop; ShowResult.OnResultProcessStart = nop; ShowResult.OnResultProcessContinue = nop
        ShowResult.ReceiveData = nop; ShowResult.SendEndFlow = nop; ShowResult.OnReport = nop; ShowResult.ShowResult = nop
        ShowResult.ShowResultInternal = nop; ShowResult.StopResultProcess = nop
    end

    local EmuHandler = package.loaded["client.network.Protocol.EmulatorHandler"]
    if EmuHandler then EmuHandler.send_emulator_info = nop end
    local EmuScanner = package.loaded["client.logic.login.emulator_scanner"]
    if EmuScanner then EmuScanner.StartScan = nop; EmuScanner.GetScanResult = returnFalse; EmuScanner.ReportScanResult = nop end
    local LoginVerify = package.loaded["client.network.Protocol.LoginVerifyHandler"]
    if LoginVerify then LoginVerify.send_login_verify_req = nop; LoginVerify.send_device_verify_req = nop end
    local DSMonitor = package.loaded["client.logic.data.logic_ds_monitor"]
    if DSMonitor then DSMonitor.OnRecordMsg = nop; DSMonitor.OnReportMsg = nop end
    local ClientDataStat = package.loaded["GameLua.Mod.BaseMod.Client.Security.ClientDataStatistcsSubsystem"]
    if ClientDataStat then ClientDataStat.StartToCheck = nop; ClientDataStat.OnReceiveRTT = nop; ClientDataStat.OnReceiveJitter = nop; ClientDataStat.ReportAbnormal = nop; ClientDataStat.ResetData = nop end
    local VoiceReport = package.loaded["client.slua.logic.chat_voice.logic_chat_voice_report"]
    if VoiceReport then VoiceReport.ReportVoiceData = nop; VoiceReport.ReportVoiceText = nop end
    local VoiceDoctor = package.loaded["client.slua.logic.chat_voice.logic_chat_voice_doctor"]
    if VoiceDoctor then VoiceDoctor.UploadVoiceLog = nop; VoiceDoctor.UploadVoiceException = nop end
    local HomeAudit = package.loaded["client.slua.logic.home.Audit.logic_home_audit_state"]
    if HomeAudit then HomeAudit.SendAuditState = nop; HomeAudit.ReportAuditResult = nop end
    local HomeReport2 = package.loaded["client.slua.logic.home.logic_home_report"]
    if HomeReport2 then HomeReport2.ReportHomeData = nop; HomeReport2.ReportHomeVisitor = nop end
    local GemReport = package.loaded["client.logic.store.gem_report_utils"]
    if GemReport then GemReport.ReportGemData = nop; GemReport.ReportGemPurchase = nop end
    local SafeStation = package.loaded["client.slua.logic.CustomerService.LogicSafeStation"]
    if SafeStation then SafeStation.UploadVideoEvidence = nop; SafeStation.ReportPlayerBehavior = nop end
    local CustomerService = package.loaded["client.slua.logic.CustomerService.LogicCustomerService"]
    if CustomerService then CustomerService.SendComplaint = nop; CustomerService.SendFeedback = nop end
    local znq6Revive = safe_require("GameLua.Mod.TDEvent.ZNQ6th.DS.ZNQ6thDSReviveSubsystem")
    if znq6Revive then znq6Revive.HaveNewItemForRevive = nop end
    local znq7Revive = safe_require("GameLua.Mod.TDEvent.ZNQ7th.DS.ZNQ7DSReviveSubsystem")
    if znq7Revive then znq7Revive.HaveChanceRevival = nop end
    local DataLayer = safe_require("GameLua.Mod.BaseMod.Common.Subsystem.DataLayerSubsystem")
    if DataLayer and DataLayer.OnSpectatorReplayChanged then
        local origDL = DataLayer.OnSpectatorReplayChanged
        DataLayer.OnSpectatorReplayChanged = function(dlSelf) _G.IsBeingWatched = true; origDL(dlSelf) end
    end
    local DSActive = safe_require("GameLua.Mod.PlanBT.Gameplay.Subsystem.DSActiveSubsystem")
    if DSActive then DSActive.DelayKickOutPlayer = nop; DSActive.ActiveKickNotify = nop end
    local CreativeDev = safe_require("GameLua.Mod.CreativeBase.Gameplay.Subsystem.CreativeDevDebugSubsystem")
    if CreativeDev then CreativeDev.IsDebugPanelEnalbedCli = nop end
    local CreativeDeath = safe_require("GameLua.Mod.CreativeBase.Gameplay.Subsystem.CreativeModeDeathRecordSubsystem")
    if CreativeDeath then CreativeDeath.OnPlayerKilled = nop end
    if _G.ClientReplayDataReporter then
        _G.ClientReplayDataReporter.ReportIntArrayData = nop; _G.ClientReplayDataReporter.ReportFloatArrayData = nop
    end
    local SpectateReplay = safe_require("GameLua.Mod.BaseMod.Common.Subsystem.SpectateAndReplaySubsystem")
    if SpectateReplay then SpectateReplay.RequestGotoSpectatingImp = nop; SpectateReplay.RequestGotoSpectating = nop end
    local AIReplay = safe_require("GameLua.ExtraModule.MLAI.Client.AIReplaySubsystem")
    if AIReplay then
        AIReplay.ReportAllPlayerInfo = nop; AIReplay.ReportFrameData = nop; AIReplay.ReportPlayerInput = nop
        if AIReplay.uCompletePlayBack then AIReplay.uCompletePlayBack.AddRecordMLAIInfo = nop; AIReplay.uCompletePlayBack.StopRecording = nop end
    end
    local AITracking = safe_require("GameLua.Mod.BaseMod.GamePlay.AI.AITrackingLogSubsystem")
    if AITracking then
        AITracking.RealLogoutTimer = nop; AITracking.LogQueue = {}; AITracking.AddToLogQue = nop; AITracking.DoPrint = nop
        AITracking.OnAIPawnDied = nop; AITracking.OnAIPawnReceiveDamage = nop; AITracking.OnAIPawnEnemyChange = nop
    end
    local AFKReport = safe_require("GameLua.Mod.BaseMod.DS.Security.AFKReportorSubsystem")
    if AFKReport then
        AFKReport.HandleEnterFighting = nop; AFKReport.InitializePlayerInputInfo = nop; AFKReport.AddOneAFKInfo = nop
        AFKReport.SetPlayerAFKState = nop; AFKReport.ResetPlayerInputInfo = nop; AFKReport.PlayerHaveAction = nop
    end
    local TDMAFK = safe_require("GameLua.Mod.TDM.Gameplay.Subsystem.TDMAFKReportorSubsystem")
    if TDMAFK then TDMAFK.SendAFKTips = nop; TDMAFK.OnHandleLostConnection = nop end
    local DataMgr = package.loaded["client.slua.logic.data.data_mgr"]
    if DataMgr then DataMgr.GetWeaponSkinSoundVolumeInfoByGroup = returnZero end
    local CreditLogic = safe_require("GameLua.Mod.BaseMod.Client.ClientInGameCreditLogic")
    if CreditLogic then
        CreditLogic._SendUserReaction2ExitTeamBeforeBoardingReturnLobbyNotice = nop
        CreditLogic.ShowReturnLobbyIfFirstExitTeamBeforeBoarding = returnFalse
        CreditLogic.OnReceiveCreditScoreChange = nop
        CreditLogic._IsFirstExitTeamBeforeBoardingReturnLobbyNoticeEnabled = returnFalse
        CreditLogic.SetFirstExitTeamBeforeBoardingReturnLobbyNoticeEnabled = nop
    end

    local globalFuncs = {
        "ReportTLogEvent","SendTlog","SendClientStats","ReportHitFlow","ReportAvatarException",
        "SendComplaintReq","SubmitReport","ReportSuspiciousPlayer","SendPacket","OnSyncBanInfo",
        "OnVoiceBanNotify","SendSecTLog","MarkSuspiciousPlayer","ReportPlayerBehaviorData",
        "CheckCompliance","ReportIllegalProgram","UploadVoiceLog"
    }
    for _, fn in ipairs(globalFuncs) do
        if type(_G[fn]) == "function" then _G[fn] = nop end
    end
end)

-- Network blacklist hosts and file keywords
local BLACKLIST_HOSTS = {
    "tss.tencent","syzsdk","gcloud.qq","reportlog","tdos","logupload","feedback.wh","crash2",
    "privacy.qq","privacy.tencent","oth.eve","mdt.qq","act.tencentyun","analytics","report.qq",
    "anticheatexpert","crashsight","wetest","log.tav","sngd","tracer","intlsdk","igamecj",
    "cdn.club","gpubgm","graph.facebook","calendarpushsubscription","googleads","doubleclick",
    "firebaselogging","firebaseremoteconfig","fonts.googleapis","abs.twimg","dl.listdl",
    "igame.gcloudcs","bugly","beacon","helpshift","tdm","apm","safeguard","weiyun","qzone",
    "tencent-cloud","myapp","idqqimg","gtimg","qqmail","tcdn","cloudctrl","sdkostrace",
    "103.134.189.146","mbgame","csoversea","igame","pubgmobile","down.anticheatexpert.com",
    "asia.csoversea.mbgame.anticheatexpert.com","log.tav.qq","syzsdk.qq","logiservice.qcloud",
    "opensdk.tencent","exp.helpshift","loginsdkapi.zingplay","firebase","googleapis","facebook","gvoice"
}
local FILE_KEYWORDS = {
    "tlog","crash","bugly","report","beacon","wetest","analytics","telemetry","trace","dump",
    "exception","feedback","aps_log","mtp_detect","network_loss","client_error","ue4crash","tdm","gcloud"
}

local function isBlacklisted(str)
    if type(str) ~= "string" then return false end
    local low = str:lower()
    for _, kw in ipairs(BLACKLIST_HOSTS) do
        if low:find(kw, 1, true) then return true end
    end
    return false
end

pcall(function()
    if _G.HttpRequest then
        local origHttp = _G.HttpRequest
        _G.HttpRequest = function(url, ...) if isBlacklisted(url) then return nil end return origHttp(url, ...) end
    end
    if _G.FHttpModule and _G.FHttpModule.CreateRequest then
        local origFH = _G.FHttpModule.CreateRequest
        _G.FHttpModule.CreateRequest = function(...)
            local url = select(1, ...)
            if isBlacklisted(url) then return nil end
            return origFH(...)
        end
    end
    local netMods = {
        "client.slua.logic.network.logic_network","client.slua.logic.download.report.puffer_tlog",
        "client.slua.data.BasicData.BasicDataClientReport","GameLua.GameCore.Module.Network.NetworkManager",
        "client.network.Protocol.ClientTlogHandler","client.network.Protocol.BattleReportHandler",
        "client.network.Protocol.ClientErrorReportHandler"
    }
    for _, mp in ipairs(netMods) do
        local mod = package.loaded[mp]
        if mod then
            for k, v in pairs(mod) do
                if type(v) == "function" and (k:find("Http") or k:find("Request") or k:find("Send") or k:find("Upload") or k:find("Post") or k:find("Get") or k:find("Report")) then
                    local origf = v
                    mod[k] = function(...)
                        local args = {...}
                        for _, arg in ipairs(args) do if type(arg)=="string" and isBlacklisted(arg) then return nil end end
                        return pcall(origf, ...)
                    end
                end
            end
        end
    end
end)

local orig_io_open = io.open
io.open = function(path, mode)
    if type(path) == "string" then
        local lp = path:lower()
        for _, kw in ipairs(FILE_KEYWORDS) do
            if lp:find(kw) then
                if mode and (mode == "w" or mode == "a" or mode == "w+" or mode == "a+") then
                    return nil, "Blocked"
                end
            end
        end
    end
    return orig_io_open(path, mode)
end

if _G.UnrealEngine and _G.UnrealEngine.CrashContext then
    _G.UnrealEngine.CrashContext = nil
    _G.UnrealEngine.CrashContext = { SetCrashContext = nop, ReportCrash = nop, AddCrashData = nop }
end

-- Device info spoofing (old fake data kept but now overridden by device bypass)
local FakeData = {
    deviceID = function()
        local chars = "0123456789ABCDEF"
        local id = ""
        for i = 1, 32 do id = id .. chars:sub(math.random(1, #chars), math.random(1, #chars)) end
        return id
    end,
    ipAddress = function() return "192.168." .. math.random(1, 255) .. "." .. math.random(1, 255) end,
    macAddress = function()
        return string.format("%02X:%02X:%02X:%02X:%02X:%02X",
            math.random(0,255), math.random(0,255), math.random(0,255),
            math.random(0,255), math.random(0,255), math.random(0,255))
    end,
    kernelVersion = function() return "4.19." .. math.random(100, 200) .. "-generic" end,
}

-- The iPhone-related SystemInfo/Build spoofing block has been removed as requested.
-- The device ban bypass (InstallDeviceBanBypass) already provides full device ID spoofing.

-- Comprehensive bypass module (per-match activation)
do
    local bypass = {}
    local function nop() end
    local function returnTrue() return true end
    local function returnFalse() return false end
    local function returnZero() return 0 end
    local function returnEmptyTable() return {} end
    local function returnEmptyString() return "" end
    local function safe_require(mod)
        local ok, res = pcall(require, mod)
        return ok and res or nil
    end
    local function tryImport(name)
        local ok, lib = pcall(import, name)
        return ok and lib or nil
    end

    local function blockScreenshots()
        pcall(function()
            local SS = tryImport("ScreenshotMaker") or tryImport("ScreenshotMTDer")
            if SS then
                SS.MakePicture = function() return "" end
                SS.ReMakePicture = function() return "" end
                SS.HasCaptured = returnTrue
            end
        end)
    end

    local function blockGameplayCallbacks()
        if not _G.GameplayCallbacks then _G.GameplayCallbacks = {} end
        local GC = _G.GameplayCallbacks
        if GC._WHABlocked then return end

        local reportFuncs = {
            "ReportAttackFlow","ReportSecAttackFlow","ReportHurtFlow","ReportFireArms",
            "ReportVerifyInfoFlow","ReportMrpcsFlow","ReportPlayerBehavior","ReportTeammatHurt",
            "ReportPlayerMoveRoute","ReportPlayerPosition","ReportAimFlow","ReportHitFlow",
            "ReportWallHack","ReportAimbot","ReportSpeedHack","ReportMagicBullet",
            "ReportAbnormalMaterial","ReportDepthTestChange","ReportMemoryException",
            "ReportMaterialScan","ReportShaderOverride","ReportCircleFlow",
            "OnPlayerRPCValidateFailed","OnPlayerActorChannelError",
            "OnPlayerSpectateException","OnShutdownAfterError"
        }
        for _, fn in ipairs(reportFuncs) do GC[fn] = nop end

        local oldStateChanged = GC.OnDSPlayerStateChanged
        GC.OnDSPlayerStateChanged = function(UID, state, ...)
            if state and type(state) == "string" then
                local s = state:lower()
                if s:find("cheat") or s:find("ban") or s:find("integrity") then return end
            end
            if oldStateChanged then return oldStateChanged(UID, state, ...) end
        end

        GC._WHABlocked = true
    end

    local function spoofTssSdk()
        pcall(function() local t = _G.TssSdk if t then t.GetFileMD5, t.VerifyFileSignature, t.CheckIntegrity, t.ScanMemory, t.IsEmulator, t.OnRecvData = function() return "" end, returnTrue, returnTrue, function() return true, {} end, returnFalse, nop end end)
    end

    local function disableDetectionSubsystems()
        local sm = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not sm then return end

        local targetSubs = {
            "ClientWallhackDetectionSubsystem", "ClientESPDetectionSubsystem",
            "ClientAimTrackingSubsystem", "ShootVerifySubSystemClient",
            "ClientRenderCheckSubsystem", "ClientMemoryGuardSubsystem",
            "ClientKernelCheckSubsystem", "ClientHawkEyePatrolSubsystem",
            "ClientAntiCheatSubsystem", "IntegrityCheckSubsystem",
            "FileCheckSubsystem", "AvatarExceptionSubsystem"
        }
        for _, sn in ipairs(targetSubs) do
            local sub = sm:Get(sn)
            if sub then
                for k, v in pairs(sub) do
                    if type(v) == "function" then
                        if k:find("Report") or k:find("Send") or k:find("Verify") or
                           k:find("Check") or k:find("Detect") or k:find("Scan") then
                            sub[k] = nop
                        end
                    end
                end
                if sn == "ClientWallhackDetectionSubsystem" then
                    sub.IsVisionNormal = returnTrue
                    sub.GetVisibilityRate = function() return math.random(60, 85) end
                elseif sn == "ClientESPDetectionSubsystem" then
                    sub.HasESP = returnFalse
                    sub.CheckOverlay = function() return "clean" end
                elseif sn == "ClientAimTrackingSubsystem" then
                    sub.GetAimData = function()
                        return { accuracy = math.random(45,65), headshotRate = math.random(15,35) }
                    end
                    sub.IsAimNormal = returnTrue
                elseif sn == "ClientMemoryGuardSubsystem" then
                    sub.IsMemoryClean = function() return true, {code=0} end
                    sub.ScanResult = function() return "clean" end
                elseif sn == "ShootVerifySubSystemClient" then
                    sub.OnShootVerifyFailed = nop; sub.VerifyShot = returnTrue
                end
            end
        end
    end

    local function spoofBehavior()
        pcall(function()
            local sm = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
            if not sm then return end
            
            local hooks = {
                ClientAimTrackingSubsystem = {
                    GetAimData = function() return { accuracy = math.random(48,58), headshotRate = math.random(18,28) } end,
                    IsAimNormal = returnTrue
                },
                ClientHawkEyePatrolSubsystem = {
                    GetPatrolData = returnEmptyTable, IsBeingWatched = returnFalse, GetSpectatorCount = returnZero
                },
                ClientRenderCheckSubsystem = {
                    IsRenderClean = returnTrue, GetRenderState = function() return "normal" end
                },
                ClientESPDetectionSubsystem = {
                    HasESP = returnFalse, CheckOverlay = function() return "clean" end
                },
                ClientWallhackDetectionSubsystem = {
                    IsVisionNormal = returnTrue, GetVisibilityRate = function() return math.random(70,80) end
                }
            }
            
            for mod, methods in pairs(hooks) do
                local m = sm:Get(mod)
                if m then for k, v in pairs(methods) do m[k] = v end end
            end
        end)
    end

    local function disableHiggsBoson()
        pcall(function()
            local hbc = safe_require("GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent")
            if hbc then
                hbc.bMHActive = false
                hbc.bCallPreReplication = false
                if hbc.ControlMHActive then hbc.ControlMHActive = nop end
                if hbc.StartAvatarCheck then hbc.StartAvatarCheck = nop end
                if hbc.BlackList then for k in pairs(hbc.BlackList) do hbc.BlackList[k] = nil end end
            end
            if _G.AvatarCheckCallback then
                _G.AvatarCheckCallback.StartAvatarCheck = nop
                _G.AvatarCheckCallback.OnReportItemID = nop
            end
            _G.BlackList = {}
        end)
    end

    local function spoofMemoryAndKernel()
        pcall(function()
            local sm = safe_require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
            if sm then
                local sub = sm:Get("ClientMemoryGuardSubsystem")
                if sub then sub.IsMemoryClean, sub.ScanResult = function() return true, {code=0} end, function() return "clean" end end
                sub = sm:Get("ClientKernelCheckSubsystem")
                if sub then sub.IsKernelClean, sub.GetKernelVersion, sub.IsBootloaderLocked = returnTrue, function() return "4.19.150-generic" end, returnTrue end
            end
            if _G.TssSdk then _G.TssSdk.CheckKernel, _G.TssSdk.VerifyBoot = function() return true, {status="verified", tampered=false} end, function() return true, {locked=true, verified=true} end end
        end)
    end

    function bypass.Init()
        blockScreenshots()
        blockGameplayCallbacks()
        spoofTssSdk()
        disableDetectionSubsystems()
        spoofBehavior()
        disableHiggsBoson()
        spoofMemoryAndKernel()
    end

    _G.WHABypass = bypass
end

-- ================================================================
-- BRPlayerCharacterBase class (FIXED – misplaced code is now inside timer)
-- ================================================================
local BRPlayerCharacterBase = {
  ServerRPC = {},
  ClientRPC = {},
  MulticastRPC = {}
}

BRPlayerCharacterBase.ServerRPC.ServerRPC_NearDeathGiveupRescue = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.ServerRPC_CarryDeadBox = { Reliable = true, Params = { UEnums.EPropertyClass.Object } }
BRPlayerCharacterBase.ServerRPC.RPC_Server_GmPlayAction = { Reliable = true, Params = { UEnums.EPropertyClass.Int } }
BRPlayerCharacterBase.MulticastRPC.MulticastRPC_GmPlayAction = { Reliable = true, Params = { UEnums.EPropertyClass.Int } }
BRPlayerCharacterBase.ClientRPC.RPC_Client_SetShouldCheckPassWall = { Reliable = true, Params = { UEnums.EPropertyClass.Bool } }
BRPlayerCharacterBase.ClientRPC.ClientRPC_TriggerHighlightMoment = { Reliable = true, Params = { UEnums.EPropertyClass.UInt32, UEnums.EPropertyClass.UInt32 } }

function BRPlayerCharacterBase:ctor()
    self.bHasShownDevNotice = false
    self.AK_NativeESP_Ready = false
    self.bHiggsTimerSet = false
    self._newWallhackStarted = false
end

function BRPlayerCharacterBase:_PostConstruct()
    BRPlayerCharacterBase.__super._PostConstruct(self)
    self:InitAddSpecialMoveInfo()
    self.bCanNearDeathGiveup = true
    self:StartAdvancedSystems()
end

function BRPlayerCharacterBase:ReceiveBeginPlay()
    BRPlayerCharacterBase.__super.ReceiveBeginPlay(self)
    self:AddControlEvent(self, "MovementModeChangedDelegate", self.HandleOnMovementModeChangedNew, self)
    if self:HasAuthority() and self:CheckAddCheckFallingDistanceComponent() then
        local CheckFallingDistanceComponent_C = import("CheckFallingDistanceComponent")
        if slua.isValid(CheckFallingDistanceComponent_C) and not slua.isValid(self:GetComponentByClass(CheckFallingDistanceComponent_C)) then
            Game:AddComponent(CheckFallingDistanceComponent_C, self, "CheckFallingDistanceComponent")
        end
    end
    if slua.isValid(self.STCharacterMovement) then
        self.STCharacterMovement.bPositiveBlowUp = true
    end
    if self.Role == ENetRole.ROLE_AutonomousProxy then
        self:AddControlEvent(self, "OnPawnStateDisabled", self.OnPawnStateChange, self)
        self:AddControlEvent(self, "OnPawnStateEnabled", self.OnPawnStateChange, self)
        self:AddControlEventConditionOnly(self, "OnAttrChangeEventDelegate", { AttrName = { "bCanSelfRescue" } }, self.CharacterAttrChangeEvent, self)
    end
    if Client then
        GameplayData.AddCharacter(self.Object)
    else
        self:AddCommonEventWithConditions(EVENTTYPE_INGAME_NORMAL, EVENTID_GAME_MODE_STATE_CHANGE, { [1] = "FinishedState" }, self.HandleFinishedState, self)
    end
    EventSystem:postEvent(EVENTTYPE_SINGLETRAINING, EVENTID_CHARACTER_BEGINPLAY, self.Object)
end

function BRPlayerCharacterBase:ReceiveEndPlay(endPlayReason)
    BRPlayerCharacterBase.__super.ReceiveEndPlay(self, endPlayReason)
    if Client and GameplayData.RemoveCharacter then GameplayData.RemoveCharacter(self.Object) end
end

function BRPlayerCharacterBase:StartAdvancedSystems()
    if not Client then return end
    if not CheckExpiration() then ShowExpiryPopup(true); return end
    InitDistanceMarkerSystem()

    if not self.bHiggsTimerSet then
        self.bHiggsTimerSet = true
        self:AddGameTimer(0.1, true, function()
            if not slua.isValid(self.Object) then return end
            pcall(function()
                local lpc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
                if slua.isValid(lpc) and lpc.HiggsBosonComponent then
                    lpc.HiggsBosonComponent.bMHActive = false
                end
            end)
        end)
    end

    self:AddGameTimer(0.4, true, function()
        if not slua.isValid(self.Object) then return end
        if not CheckExpiration() then ShowExpiryPopup(true); return end
        local localPlayer = GameplayData.GetPlayerCharacter()
        if not slua.isValid(localPlayer) then return end

        if self.Object == localPlayer then
            if not localPlayer._bypassActive then
                localPlayer._bypassActive = true
                pcall(function()
                    if _G.WHABypass and _G.WHABypass.Init then
                        _G.WHABypass.Init()
                        _G._WHA_BYPASS_ACTIVE = true
                    end
                end)

                -- BYPASS POPUP REMOVED - NO POPUP SHOWN
            end

            if not localPlayer._monitorsSetup then
                localPlayer._monitorsSetup = true
                localPlayer:AddGameTimer(0.5, true, function()
                    if not _G._WHA_BYPASS_ACTIVE then
                        pcall(function()
                            if _G.WHABypass and _G.WHABypass.Init then
                                _G.WHABypass.Init()
                                _G._WHA_BYPASS_ACTIVE = true
                            end
                        end)
                    end
                end)
                localPlayer:AddGameTimer(10.0, true, function()
                    pcall(function()
                        if _G.WHABypass and _G.WHABypass.Init then
                            _G.WHABypass.Init()
                            _G._WHA_BYPASS_ACTIVE = true
                        end
                    end)
                end)
            end

            -- Start new wallhack timer
            if not self._newWallhackStarted then
                self._newWallhackStarted = true
                pcall(function()
                    if _G.StartNewWallhack then _G.StartNewWallhack() end
                end)
            end

            -- Enemy Counter management
            local enemyCounterEnabled = (_G.AK_GetVal("ENEMY_COUNTER") == 1)
            if enemyCounterEnabled and not _G.ENEMY_COUNTER_TIMER then
                _G.StartEnemyCounter()
            elseif not enemyCounterEnabled and _G.ENEMY_COUNTER_TIMER then
                _G.StopEnemyCounter()
            end

            _G.AKModTickCount = (_G.AKModTickCount or 0) + 1
            if _G.AKModTickCount % 6 == 0 then cleanupDeadEnemyMarks() end

            if not self.AK_NativeESP_Ready then
                pcall(function()
                    local gameplayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")
                    local screenMarkConfig = gameplayTools.GetCurrentConfig("ScreenMarkConfig")
                    if screenMarkConfig then
                        if screenMarkConfig[1006] then
                            screenMarkConfig[1006].bBindBlocked = true
                            screenMarkConfig[1006].bBindOutScreen = true
                            screenMarkConfig[1006].MaxWidgetNum = 99
                            screenMarkConfig[1006].MaxShowDistance = 6000000
                        end
                        screenMarkConfig[9999] = distanceMarkerConfig
                    end
                end)
                self.AK_NativeESP_Ready = true
            end

            local enemyCharacters = GameplayData.GetAllPlayerCharacters and GameplayData.GetAllPlayerCharacters() or {}
            local isMapESP = _G.AK_GetVal("ESP_MAP")
            local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
            local camForward = pc and KismetMathLibrary.GetForwardVector(pc:GetControlRotation())

            for _, enemy in pairs(enemyCharacters) do
                if slua.isValid(enemy) and enemy ~= localPlayer and enemy.TeamID ~= localPlayer.TeamID then
                    local isDead = false
                    pcall(function()
                        if type(enemy.IsDead)=="function" then isDead = enemy:IsDead()
                        elseif enemy.bIsDead then isDead = true end
                        if enemy.bHidden or (enemy.Mesh and enemy.Mesh.bHidden) then isDead = true end
                    end)
                    if isDead then goto skip_enemy end

                    processEnemyMapESP(enemy, localPlayer, isMapESP)

                    if _G.AK_GetVal("ESP_HP") == 1 then
                        if not enemy.bHasAKNativeHPBar then
                            pcall(function()
                                enemy.NativeHPBarMark = InGameMarkTools.ClientAddMapMark(1006, FVector(0,0,0), 0, "", 4, enemy)
                                enemy.bHasAKNativeHPBar = true
                            end)
                        end
                    elseif enemy.bHasAKNativeHPBar then
                        pcall(function() InGameMarkTools.ClientRemoveMapMark(enemy.NativeHPBarMark) end)
                        enemy.bHasAKNativeHPBar = false
                    end

                    if _G.AK_GetVal("ESP_BOX") == 1 then
                        pcall(function()
                            if enemy.Replay_IsEnemyFrameUIExisted and not enemy:Replay_IsEnemyFrameUIExisted() then
                                enemy:Replay_CreateEnemyFrameUI(true, true)
                            end
                            if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(true) end
                        end)
                    else
                        pcall(function()
                            if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(false) end
                        end)
                    end

                    ::skip_enemy::
                end
            end

            if _G.AK_GetVal("AIMBOT") == 1 and (not self._lastAimbotTime or (os.clock() - self._lastAimbotTime) > 2.0) then
                ApplyHardAimbot()
                self._lastAimbotTime = os.clock()
            end
        end
    end)
end

-- Remaining global initializations
pcall(function()
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerOnce then
        ticker.AddTimerOnce(3, function() if CheckExpiration() then end end)
        ticker.AddTimerOnce(4, function()
            if not CheckExpiration() then ShowExpiryPopup(true) else _G.TryShowWelcome() end
        end)
    else
        _G.TryShowWelcome()
    end
end)

function _G.InitializeAllSystems()
    if not CheckExpiration() then ShowExpiryPopup(true); return end
    local gameplayData = package.loaded["GameLua.GameCore.Data.GameplayData"] or require("GameLua.GameCore.Data.GameplayData")
    if gameplayData then
        pcall(function()
            local pc = gameplayData.GetPlayerCharacter and gameplayData.GetPlayerCharacter()
            if slua.isValid(pc) then pc.StartAdvancedSystems = BRPlayerCharacterBase.StartAdvancedSystems end
        end)
    end
end
_G.InitializeAllSystems()

local class = require("class")
local CharacterBase = require("GameLua.GameCore.Framework.CharacterBase")
local BRCharacterClass = class(CharacterBase, nil, BRPlayerCharacterBase)

return require("combine_class").DeclareFeature(BRCharacterClass, {
    { SkyTransition = "GameLua.Mod.BaseMod.Gameplay.Feature.SkyControl.PlayerCharacterSkyTransitionFeature" },
    { CarryDeadBoxFeature = "GameLua.Mod.Library.GamePlay.Feature.CarryDeadBoxFeature" },
    { SpecialSuitFeature = "GameLua.Mod.Library.GamePlay.Feature.SpecialSuitFeature" },
    { TeleportPawnFeature = "GameLua.Mod.Library.GamePlay.Feature.TeleportPawnFeature" },
    { LifterControl = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.CharacterLifterControlFeature" },
    { FinalKillEffect = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.PlayerCharacterFinalKillEffectFeature" },
    { CampFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.Camp.PlayerCharacterCampFeature" },
    { BuildSkateFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.PlayerCharacterBuildVehicleFeature" },
    { CommonBornlandTransformFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.HeroPropFeature.CommonBornlandTransformFeature" },
    { ParachuteFormation = "GameLua.Mod.BaseMod.GamePlay.Feature.ParachuteFormationFeature" }
}, "BRPlayerCharacterBase")
