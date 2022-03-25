--MADE BY:
--  TechHog#8984
--  github.com/TechHog8984

local GUI_NAME = "Shit Business";
-- if game:GetService("CoreGui"):FindFirstChild(GUI_NAME) then
--     game:GetService("CoreGui")[GUI_NAME]:Destroy();
-- end;

local Collection = getgc(true);
for I,V in next, Collection do
    if type(V) ~= 'table' then
        rawset(Collection, I, nil);
    end;
end;

local PlayersTable;
for I, Table in next, Collection do
    if rawget(Table, 'GetCharacter') then
        PlayersTable = Table;
        break;
    end;
end;
local TeamsTable;
for I, Table in next, Collection do
    if rawget(Table, 'SetTeamColor') then
        TeamsTable = Table;
        break;
    end;
end;
local GetConfig;
for I, Table in next, Collection do
    if rawget(Table, 'GivePlayerLoadout') then
        GetConfig = rawget(Table, 'GetConfig');
        break;
    end;
end;

local httpget=game.HttpGet;local function HttpGet(...)return httpget(game, ...)end;
local function HttpLoad(Url)
    return loadstring(HttpGet(Url))();
end;

local Config = {
    Aimlock = false,
    AimlockKey = Enum.UserInputType.MouseButton2,
    TriggerBot = false,
    
    ESP = false,
    ESP_Boxes = false,

    SilentAim = false,

    InfAmmo = false,
    NoRecoil = false,
};

--inf ammo
local index; index = hookmetamethod(game, '__index', newcclosure(function(...)
    local OLD = index(...);
    if type(Config) == 'table' and Config.InfAmmo then
        local Self, Index = ...;
        if tostring(Self) == 'Ammo' and Index == 'Value' then
            if OLD <= 1 then
                return 30;
            end;
        end;
    end;
    return OLD;
end));

--no recoil & fast firerate
local BlankVector = Vector3.new(0,0,0);

local OldGunInfo = {};

local TableClone; TableClone = function(...)
    local Result = {};

    for I, Table in next, ({...}) do
        for I,V in next, Table do
            if type(V) == 'table' then
                Result[I] = TableClone(V);
            elseif type(V) ~= 'nil' then
                Result[I] = V;
            end;
        end;
    end;

    return Result;
end;

local OLD_GetConfig; OLD_GetConfig = hookfunction(GetConfig, function(...)
    local RESULT = OLD_GetConfig(...);
    
    if RESULT then
        if RESULT.Recoil and RESULT.Recoil.Default then
            if not OldGunInfo[RESULT] then OldGunInfo[RESULT] = TableClone(RESULT); end;

            local NoRecoil = type(Config) == 'table' and Config.NoRecoil;
            local OldInfo = OldGunInfo[RESULT];

            for I, Recoil in next, RESULT.Recoil.Default do
                local Old = OldInfo.Recoil.Default[I];
                if type(Recoil) == 'number' then
                    RESULT.Recoil.Default[I] = (NoRecoil and 0) or Old;
                elseif typeof(Recoil) == 'Vector3' then
                    RESULT.Recoil.Default[I] = (NoRecoil and BlankVector) or Old;
                end;
            end;
        end;
        -- if RESULT.FireModeList and RESULT.FireModeList.Auto and RESULT.FireModes then
        --     RESULT.FireModes.Auto.FireRate += 150;
        -- end;
    end;
    
    return RESULT;
end);

local Grayed = HttpLoad('https://raw.githubusercontent.com/TechHog8984/GrayedLib/main/src.lua');
local GUI = Grayed:CreateGui{GUI_NAME};

local VisSection = GUI:CreateSection{'Visuals'};
VisSection:Toggle{'ESP', function(status)Config.ESP = status end};
VisSection:Toggle{'Boxes', function(status)Config.ESP_Boxes = status end};
VisSection:Toggle{'Names', function(status)Config.ESP_Names = status end};

local AimSection = GUI:CreateSection{'Aim'};
AimSection:Toggle{'Silent Aim', function(status)Config.SilentAim = status end};

AimSection:Toggle{'Aimlock', function(status)Config.Aimlock = status end};
AimSection:Dropdown{'Aimlock Key', {'Left Click', 'Right Click', 'F'}, 'Right Click', function(Value)
    if Value == 'Left Click' then
        Config.AimlockKey = Enum.UserInputType.MouseButton1;
    elseif Value == 'Right Click' then
        Config.AimlockKey = Enum.UserInputType.MouseButton2;
    elseif Value == 'F' then
        Config.AimlockKey = Enum.KeyCode.F;
    end;
end};
-- AimSection:Toggle{'TriggerBot', function(status)Config.TriggerBot = status end};

local GunSection = GUI:CreateSection{'Guns'};
GunSection:Toggle{'Infinite Ammo', function(status)Config.InfAmmo = status end};
GunSection:Toggle{'No Recoil', function(status)Config.NoRecoil = status end};

local PlayerCharacters = getupvalue(PlayersTable.GetCharacter, 1);
local IsA = workspace.IsA;
local FFC = workspace.FindFirstChild;
local function gethealth(Inst)
    if type(Inst) == 'userdata' then
        local Char;
        if IsA(Inst, 'Player') then
            Char = PlayerCharacters[Inst];
        elseif IsA(Inst, 'Model') then
            Char = Inst;
        end;

        if Char then
            local Health = FFC(Char, 'Health');
            local MaxHealth = Health and FFC(Health, 'MaxHealth');

            if MaxHealth then
                return Health.Value, MaxHealth.Value;
            end;
        end;
    end;
end;

local Players = game:GetService'Players';
local GetPlayers = Players.GetPlayers;
local IDF=workspace.IsDescendantOf;local function IsDescendantOf(Inst1, Inst2)return IDF(Inst1, Inst2);end;
local function GetPlayerFromPart(Part)
    for I, Player in next, GetPlayers(Players) do
        local Health = Player and (gethealth(Player));
        if Part and Health and Health > 0 then
            if IsDescendantOf(Part, Player) then
                return Player;
            end;
        end;
    end;
end;
    
local vector2new = Vector2.new;
local function Vector3ToVector2(Vector)
    return vector2new(Vector.X, Vector.Y);
end;

local LocalPlayer = Players.LocalPlayer;
local LocalCharacter, LocalHumanoidRootPart;

local Camera = workspace.CurrentCamera;
local ClosestPlayer;

local worldtoviewportpoint=Camera.WorldToViewportPoint;local function WorldToViewportPoint(...)return worldtoviewportpoint(Camera, ...);end;

local Raycast = workspace.Raycast;
local function IsPartVisible(Part, PartAncestor)
    --credits to https://github.com/Stefanuk12
    if Part and PartAncestor then
        local Character = PlayerCharacters[LocalPlayer];
        local CamPos = Camera.CFrame.Position;

        local V, OnScreen = WorldToViewportPoint(Part.Position);

        if OnScreen then
            local Params = RaycastParams.new();
            Params.FilterType = Enum.RaycastFilterType.Blacklist;
            Params.FilterDescendantsInstances = {Camera, Character};

            local Res = Raycast(workspace, CamPos, Part.Position - CamPos, Params);
            if Res then
                local Hit = Res.Instance;

                local Visible = not Hit or IsDescendantOf(Hit, PartAncestor);

                if Visible then return true end;
            end;

            if LocalHumanoidRootPart then
                local Pos = LocalHumanoidRootPart.Position;
                local Res = Raycast(workspace, Pos, Part.Position - Pos, Params);
                if Res then
                    local Hit = Res.Instance;

                    local Visible = not Hit or IsDescendantOf(Hit, PartAncestor);

                    if Visible then return true end;
                end;
            end;
        end;

        return false;
    end;
end

local Characters = workspace.Characters;
local function IsPlayerVisible(Player)
    local Character = PlayerCharacters[Player];
    if type(Character) == 'userdata' and Character.Parent == Characters and FFC(Character, 'Body') then
        for I, Part in next, Character.Body:GetChildren() do
            if type(Part) == 'userdata' and IsA(Part, 'Part') then
                if IsPartVisible(Part, Character) then
                    return true;
                end;
            end;
        end;
    end;
end;

local Mouse = LocalPlayer:GetMouse();
local function GetClosestPlayerToCursor(IgnoreVisibleCheck)
    if Mouse.Target then
        local Player = GetPlayerFromPart(Mouse.Target);
        local LPHealth = (gethealth(LocalPlayer));
        if Player and LPHealth and LPHealth > 0 then return Player end;
    end

    local ClosestPlayer = nil;
    local MaxDist = math.huge;

    local function DoPlayer(Player)
        if Player and not TeamsTable:ArePlayersFriendly(LocalPlayer, Player) then
            LocalCharacter = PlayerCharacters[LocalPlayer];
            LocalHumanoidRootPart = LocalCharacter and FFC(LocalCharacter, 'Body') and FFC(LocalCharacter.Body, 'Chest');

            if LocalHumanoidRootPart then
                local PlayerCharacter = PlayerCharacters[Player];
                local HumanoidRootPart = PlayerCharacter and FFC(PlayerCharacter, 'Body') and FFC(PlayerCharacter.Body, 'Chest');
                local PHealth = (gethealth(Player));

                -- local IsVisible = IgnoreVisibleCheck or IsPlayerVisible(Player);
                local IsVisible = IgnoreVisibleCheck or IsPartVisible(HumanoidRootPart, PlayerCharacter);

                if HumanoidRootPart and IsVisible and PHealth and PHealth > 0 then
                    if ClosestPlayer then
                        local MousePos = vector2new(Mouse.X, Mouse.Y);
                        local ScreenPos, Onscreen = WorldToViewportPoint(HumanoidRootPart.Position);

                        if Onscreen or IgnoreVisibleCheck then
                            local Distance = (MousePos - Vector3ToVector2(ScreenPos)).Magnitude;
                            if Distance < MaxDist then
                                MaxDist = Distance;
                                ClosestPlayer = Player;
                            end;
                        end;
                    else
                        ClosestPlayer = Player;
                    end;
                end;
            end;
        end;
    end;

    for I, Player in next, GetPlayers(Players) do
        DoPlayer(Player);
    end;

    return ClosestPlayer;
end;

local UIS = game:GetService'UserInputService';
local gml = UIS.GetMouseLocation; local function GetMouseLocation(...)
    return gml(UIS, ...);
end;

local IsMouseButtonPressed = UIS.IsMouseButtonPressed;
local IsKeyDown = UIS.IsKeyDown;

local Helper = loadstring(game:HttpGet'https://raw.githubusercontent.com/TechHog8984/Drawing-API-Helper/main/script/latest')();

local PlayerObjects = {};
local function PlayerAdded(Player)
    local Name = Player.Name;
    local DisplayName = Player.DisplayName;
    local NameText = Name;
    if DisplayName ~= Name then
        NameText ..= ' (@' .. DisplayName .. ')';
    end;
    PlayerObjects[Player] = {
        Box = Helper:CreateQuad{Name = Player.Name .. '-Box',
            Thickness = 5,
            Filled = false,
        },
        Name = Helper:CreateText{Name = Player.Name .. '-Name',
            Size = 18,
            Font = 3,
            Text = NameText,
        },
    };
end;

local function PlayerRemoving(Player)
	if PlayerObjects[Player] then
		for I, Object in next, PlayerObjects[Player] do
			if Object then Object:Destroy(); end;
		end;
	end;
	PlayerObjects[Player] = nil;
end;

for I, Player in next, GetPlayers(Players) do
	if Player and Player ~= LocalPlayer then
		PlayerAdded(Player);
	end;
end;
Players.PlayerAdded:Connect(function(Player)
	if Player and Player ~= LocalPlayer then
		PlayerAdded(Player);
	end;
end);
Players.PlayerRemoving:Connect(function(Player)
	if Player and Player ~= LocalPlayer then
		PlayerRemoving(Player);
	end;
end);


local ClosestPlayer2;
game:GetService'RunService'.RenderStepped:Connect(function()
    LocalCharacter = PlayerCharacters[LocalPlayer];
    ClosestPlayer = GetClosestPlayerToCursor();
    ClosestPlayer2 = GetClosestPlayerToCursor(true);
    task.spawn(function()
        for Player, Objects in next, PlayerObjects do
            if Objects then
                for I,V in next, Objects do
                    V.Visible = false;
                end;
            end;
            if Player and not TeamsTable:ArePlayersFriendly(LocalPlayer, Player) then
                task.spawn(function()
                    local Character = PlayerCharacters[Player];
                    local Torso = type(Character) == 'userdata' and type(FFC(Character, 'Body')) == 'userdata' and FFC(Character.Body, 'Chest');
                    local Head = type(Torso) == 'userdata' and FFC(Character.Body, 'Head');
                    if Torso and Character.Parent == Characters then
                        -- local IsVisible = IsPlayerVisible(Player);
                        local IsVisible = IsPartVisible(Torso, Character) or (Head and IsPartVisible(Head, Character));
                        
                        local TWO_Y_Vector3 = Vector3.new(0, 2, 0);
                        local ONE_THREE_Y_Vector3 = Vector3.new(0, 1.3, 0);
                        
                        --BOX
                        task.spawn(function()
                            if Objects.Box and rawget(Objects.Box, '__exists') then
                                local Position = Torso.Position;
                                local CFrame = Torso.CFrame;
                                local XVector = CFrame.XVector;

                                local FlatXV = Vector3.new(XVector.X, 0, XVector.Z);
                                local TopLeft, TopLeftVis = WorldToViewportPoint(Position + TWO_Y_Vector3 - FlatXV);
                                local BottomRight, BottomRightVis = WorldToViewportPoint(Position - TWO_Y_Vector3 + FlatXV - ONE_THREE_Y_Vector3);
                                local TopRight, TopRightVis = WorldToViewportPoint(Position + TWO_Y_Vector3 + FlatXV);
                                local BottomLeft, BottomLeftVis = WorldToViewportPoint(Position - TWO_Y_Vector3 - FlatXV - ONE_THREE_Y_Vector3);
                                
                                Objects.Box.TopRight = Vector2.new(TopRight.X, TopRight.Y);
                                Objects.Box.TopLeft = Vector2.new(TopLeft.X, TopLeft.Y);
                                Objects.Box.BottomLeft = Vector2.new(BottomLeft.X, BottomLeft.Y);
                                Objects.Box.BottomRight = Vector2.new(BottomRight.X, BottomRight.Y);
                                
                                local Health = (gethealth(Player));
                                Objects.Box.Color = (IsVisible and Color3.new(.4,1,.4)) or Color3.new(.9,.9,.9);
                                Objects.Box.Transparency = (IsVisible and 1) or .6;
                                Objects.Box.Visible = (Health and Health > 0 and type(Config) == 'table' and Config.ESP and Config.ESP_Boxes and (TopLeftVis or TopRightVis or BottomLeftVis or BottomRightVis)) or false;
                            end;
                        end);
                        --NAME
                        task.spawn(function()
                            if Head and Objects.Name and rawget(Objects.Name, '__exists') then
                                local HeadPos, HeadVis = WorldToViewportPoint(Head.Position + ONE_THREE_Y_Vector3);
                                Objects.Name.Position = Vector2.new(HeadPos.X, HeadPos.Y);
                                local Health = (gethealth(Player));
                                Objects.Name.Visible = (Health and Health > 0 and type(Config) == 'table' and Config.ESP_Names and HeadVis) or false;
                            end;
                        end);
                    -- else
                    --     PlayerRemoving(Player);
                    end;
                end);
                task.spawn(function()
                    local Health = gethealth(LocalPlayer);
                    if LocalCharacter and LocalCharacter.Parent == Characters and LocalHumanoidRootPart and Health and Health > 0 then
                        --TRIGGERBOT
                        task.spawn(function()
                            local Target = Mouse.Target;
                            local Player = GetPlayerFromPart(Target);
                            local Character = type(Player) == 'userdata' and PlayerCharacters[Player];

                            if Config.TriggerBot and Target then
                                print(Target:GetFullName());
                            end;
                            if type(Character) == 'userdata' and Config.TriggerBot then
                                if iswindowactive() then
                                    mouse1press();
                                    task.wait(.002);
                                    mouse1release();
                                end;
                            end;
                        end);

                        --AIMLOCK
                        task.spawn(function()
                            if Config and Config.Aimlock and Config.AimlockKey and ((Config.AimlockKey.EnumType == Enum.UserInputType and IsMouseButtonPressed(UIS, Config.AimlockKey)) or (Config.AimlockKey.EnumType == Enum.KeyCode and IsKeyDown(UIS, Config.AimlockKey))) then
                                local Character = ClosestPlayer and PlayerCharacters[ClosestPlayer];
                                local Head = type(Character) == 'userdata' and FFC(Character, 'Body') and FFC(Character.Body, 'Head');
                                if Head and Character.Parent == Characters then
                                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, Head.Position);
                                end;
                            end;
                        end);
                    end;
                end);
            -- else
            --     PlayerRemoving(Player);
            end;
        end;
    end);
end);

local Projectiles;
for I,V in next, game:GetService("ReplicatedStorage"):GetDescendants() do
    if type(V) == 'userdata' and V.Name == 'Projectiles' then
        Projectiles = V;
        break;
    end;
end;

local NC; NC = hookmetamethod(game, '__namecall', newcclosure(function(...)
    local Args = {...};
    if getnamecallmethod() == 'FireServer' then
        if Config and Config.SilentAim and Args[1] == Projectiles and Args[2] == '__Hit' then
            local Part;
            local OldCharacter = Args[7];
            if OldCharacter then
                local Head = FFC(OldCharacter, 'Hitbox') and FFC(OldCharacter.Hitbox, 'Head');
                if Head then
                    Part = Head;
                end;
            elseif ClosestPlayer2 then
                local Character = PlayerCharacters[ClosestPlayer2];
                local Head = type(Character) == 'userdata' and Character.Parent == Characters and FFC(Character, 'Hitbox') and FFC(Character.Hitbox, 'Head');
                if Head then
                    Part = Head;
                end;
            end;

            if type(LocalCharacter) == 'userdata' and LocalCharacter.Parent == Characters and Part then
                Args[4] = Part.Position;
                Args[5] = Part;
                return NC(unpack(Args));
            end;
        end;
    end;
    return NC(unpack(Args));
end));
