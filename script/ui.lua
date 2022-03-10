local httpget=game.HttpGet;local function HttpGet(...)return httpget(game, ...)end;
local function HttpLoad(Url)
    return loadstring(HttpGet(Url))();
end;
local CreateEvent = HttpLoad("https://raw.githubusercontent.com/TechHog8984/Event-Manager/main/src.lua");
assert(CreateEvent, "Failed to get CreateEvent function.");

local OLD = game:GetService"CoreGui":FindFirstChild"ChrysalismUI";
if type(OLD) == "userdata" then OLD:Destroy(); end;

local function GetGuiObject()
    --GuiToLua V3

    --objects
    local ChrysalismUI = Instance.new'ScreenGui'

    local Templates = Instance.new'Folder'
    local Sections = Instance.new'Folder'
    local Master = Instance.new'Frame'
    local Body = Instance.new'Frame'
    local UICorner = Instance.new'UICorner'
    local Container = Instance.new'Frame'
    local UICorner__2 = Instance.new'UICorner'
    local Template_Toggle = Instance.new'TextButton'
    local UICorner__3 = Instance.new'UICorner'
    local Indicator = Instance.new'TextLabel'
    local UICorner__4 = Instance.new'UICorner'
    local Circle = Instance.new'TextLabel'
    local UICorner__5 = Instance.new'UICorner'
    local Template_Button = Instance.new'TextButton'
    local UICorner__6 = Instance.new'UICorner'
    local ButtonIcon = Instance.new'ImageButton'
    local Template_Label = Instance.new'TextButton'
    local UICorner__7 = Instance.new'UICorner'
    local BodyShadow = Instance.new'Frame'
    local UICorner__8 = Instance.new'UICorner'
    local SectionList = Instance.new'Frame'
    local UICorner__9 = Instance.new'UICorner'
    local Container__2 = Instance.new'Frame'
    local UICorner__10 = Instance.new'UICorner'
    local Template_SectionButton = Instance.new'TextButton'
    local UICorner__11 = Instance.new'UICorner'
    local SectionListShadow = Instance.new'Frame'
    local UICorner__12 = Instance.new'UICorner'
    local TopLeft = Instance.new'Frame'
    local UICorner__13 = Instance.new'UICorner'
    local Title = Instance.new'TextLabel'
    local UICorner__14 = Instance.new'UICorner'
    local TopMiddle = Instance.new'Frame'
    local UICorner__15 = Instance.new'UICorner'
    local Title__2 = Instance.new'TextLabel'
    local UICorner__16 = Instance.new'UICorner'
    local UISettings = Instance.new'Frame'
    local UICorner__17 = Instance.new'UICorner'
    local UISettingsShadow = Instance.new'Frame'
    local UICorner__18 = Instance.new'UICorner'
    local StopScript = Instance.new'TextButton'
    local UICorner__19 = Instance.new'UICorner'
    local smooth_drag = Instance.new'LocalScript'

    --properties
    ChrysalismUI.Name = "ChrysalismUI"
    ChrysalismUI.Parent = game:GetService'CoreGui';
    ChrysalismUI.ResetOnSpawn = false
    ChrysalismUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Templates.Name = "Templates"
    Templates.Parent = ChrysalismUI

    Sections.Name = "Sections"
    Sections.Parent = ChrysalismUI

    Master.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Master.BackgroundTransparency = 1
    Master.BorderSizePixel = 0
    Master.Name = "Master"
    Master.Parent = ChrysalismUI
    Master.Position = UDim2.new(0, 240, 0, 100)
    Master.Size = UDim2.new(0, 597, 0, 471)

    Body.BackgroundColor3 = Color3.fromRGB(59.00000028312206, 51.00000075995922, 76.0000030696392)
    Body.BorderSizePixel = 0
    Body.Name = "Body"
    Body.Parent = Master
    Body.Position = UDim2.new(0, 134, 0, 0)
    Body.Size = UDim2.new(0, 464, 0, 471)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Body

    Container.BackgroundColor3 = Color3.fromRGB(90.00000223517418, 84.00000259280205, 125.00000014901161)
    Container.Name = "Container"
    Container.Parent = Body
    Container.Position = UDim2.new(0, 8, 0, 23)
    Container.Size = UDim2.new(0, 445, 0, 440)

    UICorner__2.CornerRadius = UDim.new(0, 6)
    UICorner__2.Parent = Container

    Template_Toggle.Active = false
    Template_Toggle.AutoButtonColor = false
    Template_Toggle.BackgroundColor3 = Color3.fromRGB(76.0000030696392, 71.00000336766243, 121.00000038743019)
    Template_Toggle.BorderSizePixel = 0
    Template_Toggle.Name = "Template-Toggle"
    Template_Toggle.Parent = Container
    Template_Toggle.Position = UDim2.new(0, 3, 0, 2)
    Template_Toggle.Selectable = false
    Template_Toggle.Size = UDim2.new(0, 439, 0, 22)
    Template_Toggle.Font = Enum.Font.Code
    Template_Toggle.Text = "Toggle"
    Template_Toggle.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Template_Toggle.TextSize = 20
    Template_Toggle.TextTransparency = 0.19999998807907104
    Template_Toggle.TextWrapped = true

    UICorner__3.CornerRadius = UDim.new(0, 4)
    UICorner__3.Parent = Template_Toggle

    Indicator.BackgroundColor3 = Color3.fromRGB(93.00000205636024, 85.0000025331974, 140.00000685453415)
    Indicator.BorderSizePixel = 0
    Indicator.Name = "Indicator"
    Indicator.Parent = Template_Toggle
    Indicator.Position = UDim2.new(0, 377, 0, 2)
    Indicator.Size = UDim2.new(0, 53, 0, 19)
    Indicator.Font = Enum.Font.Code
    Indicator.Text = ""
    Indicator.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Indicator.TextScaled = true
    Indicator.TextSize = 17
    Indicator.TextTransparency = 0.19999998807907104
    Indicator.TextWrapped = true

    UICorner__4.CornerRadius = UDim.new(1, 0)
    UICorner__4.Parent = Indicator

    Circle.BackgroundColor3 = Color3.fromRGB(113.00000846385956, 104.00000900030136, 171.00000500679016)
    Circle.BackgroundTransparency = 0.5
    Circle.BorderSizePixel = 0
    Circle.Name = "Circle"
    Circle.Parent = Indicator
    Circle.Position = UDim2.new(0, 4, 0, 0)
    Circle.Size = UDim2.new(0, 24, 0, 19)
    Circle.Font = Enum.Font.Code
    Circle.Text = ""
    Circle.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Circle.TextScaled = true
    Circle.TextSize = 17
    Circle.TextTransparency = 0.19999998807907104
    Circle.TextWrapped = true

    UICorner__5.CornerRadius = UDim.new(1, 0)
    UICorner__5.Parent = Circle

    Template_Button.Active = false
    Template_Button.AutoButtonColor = false
    Template_Button.BackgroundColor3 = Color3.fromRGB(78.00000295042992, 71.00000336766243, 116.00000068545341)
    Template_Button.BorderSizePixel = 0
    Template_Button.Name = "Template-Button"
    Template_Button.Parent = Container
    Template_Button.Position = UDim2.new(0, 3, 0, 2)
    Template_Button.Selectable = false
    Template_Button.Size = UDim2.new(0, 439, 0, 22)
    Template_Button.Font = Enum.Font.Code
    Template_Button.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Template_Button.TextSize = 20
    Template_Button.TextTransparency = 0.19999998807907104
    Template_Button.TextWrapped = true

    UICorner__6.CornerRadius = UDim.new(0, 4)
    UICorner__6.Parent = Template_Button

    ButtonIcon.BackgroundTransparency = 1
    ButtonIcon.Name = "ButtonIcon"
    ButtonIcon.Parent = Template_Button
    ButtonIcon.Position = UDim2.new(0.00569474883377552, 0, -0.04545453190803528, 0)
    ButtonIcon.Size = UDim2.new(0, 25, 0, 25)
    ButtonIcon.ZIndex = 2
    ButtonIcon.Image = "rbxassetid://6764432293"
    ButtonIcon.ImageRectOffset = Vector2.new(100, 400)
    ButtonIcon.ImageRectSize = Vector2.new(100, 100)

    Template_Label.Active = false
    Template_Label.AutoButtonColor = false
    Template_Label.BackgroundColor3 = Color3.fromRGB(76.0000030696392, 71.00000336766243, 121.00000038743019)
    Template_Label.BorderSizePixel = 0
    Template_Label.Name = "Template-Label"
    Template_Label.Parent = Container
    Template_Label.Position = UDim2.new(0, 3, 0, 2)
    Template_Label.Selectable = false
    Template_Label.Size = UDim2.new(0, 439, 0, 22)
    Template_Label.Visible = false
    Template_Label.Font = Enum.Font.Code
    Template_Label.Text = "Label"
    Template_Label.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Template_Label.TextSize = 20
    Template_Label.TextTransparency = 0.19999998807907104
    Template_Label.TextWrapped = true

    UICorner__7.CornerRadius = UDim.new(0, 4)
    UICorner__7.Parent = Template_Label

    BodyShadow.BackgroundColor3 = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
    BodyShadow.BackgroundTransparency = 0.800000011920929
    BodyShadow.BorderSizePixel = 0
    BodyShadow.Name = "BodyShadow"
    BodyShadow.Parent = Body
    BodyShadow.Position = UDim2.new(0, 8, 0, 23)
    BodyShadow.Size = UDim2.new(0, 445, 0, 440)

    UICorner__8.Parent = BodyShadow

    SectionList.BackgroundColor3 = Color3.fromRGB(59.00000028312206, 51.00000075995922, 76.0000030696392)
    SectionList.BorderSizePixel = 0
    SectionList.Name = "SectionList"
    SectionList.Parent = Master
    SectionList.Position = UDim2.new(0, 0, 0, 38)
    SectionList.Size = UDim2.new(0, 142, 0, 433)

    UICorner__9.CornerRadius = UDim.new(0, 6)
    UICorner__9.Parent = SectionList

    Container__2.BackgroundColor3 = Color3.fromRGB(90.00000223517418, 84.00000259280205, 125.00000774860382)
    Container__2.Name = "Container"
    Container__2.Parent = SectionList
    Container__2.Position = UDim2.new(0, 7, 0, 7)
    Container__2.Size = UDim2.new(0, 121, 0, 301)

    UICorner__10.CornerRadius = UDim.new(0, 6)
    UICorner__10.Parent = Container__2

    Template_SectionButton.Active = false
    Template_SectionButton.AutoButtonColor = false
    Template_SectionButton.BackgroundColor3 = Color3.fromRGB(88.00000235438347, 68.00000354647636, 113.00000846385956)
    Template_SectionButton.BackgroundTransparency = 1
    Template_SectionButton.BorderSizePixel = 0
    Template_SectionButton.Name = "Template-SectionButton"
    Template_SectionButton.Parent = Container__2
    Template_SectionButton.Position = UDim2.new(0, 3, 0, 0)
    Template_SectionButton.Selectable = false
    Template_SectionButton.Size = UDim2.new(0, 112, 0, 24)
    Template_SectionButton.Font = Enum.Font.Code
    Template_SectionButton.Text = "section"
    Template_SectionButton.TextColor3 = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
    Template_SectionButton.TextScaled = true
    Template_SectionButton.TextSize = 17
    Template_SectionButton.TextTransparency = 0.19999998807907104
    Template_SectionButton.TextWrapped = true

    UICorner__11.CornerRadius = UDim.new(0, 6)
    UICorner__11.Parent = Template_SectionButton

    SectionListShadow.BackgroundColor3 = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
    SectionListShadow.BackgroundTransparency = 0.800000011920929
    SectionListShadow.BorderSizePixel = 0
    SectionListShadow.Name = "SectionListShadow"
    SectionListShadow.Parent = SectionList
    SectionListShadow.Position = UDim2.new(0, 7, 0, 6)
    SectionListShadow.Size = UDim2.new(0, 121, 0, 301)

    UICorner__12.Parent = SectionListShadow

    TopLeft.BackgroundColor3 = Color3.fromRGB(59.00000028312206, 51.00000075995922, 76.0000030696392)
    TopLeft.BorderSizePixel = 0
    TopLeft.Name = "TopLeft"
    TopLeft.Parent = Master
    TopLeft.Size = UDim2.new(0, 142, 0, 45)
    TopLeft.ZIndex = 0

    UICorner__13.CornerRadius = UDim.new(0, 6)
    UICorner__13.Parent = TopLeft

    Title.BackgroundColor3 = Color3.fromRGB(90.00000223517418, 84.00000259280205, 125.00000774860382)
    Title.BackgroundTransparency = 1
    Title.BorderSizePixel = 0
    Title.Name = "Title"
    Title.Parent = TopLeft
    Title.Position = UDim2.new(0, 1, 0, 6)
    Title.Size = UDim2.new(0, 123, 0, 32)
    Title.Font = Enum.Font.Code
    Title.Text = "Chrysalism"
    Title.TextColor3 = Color3.fromRGB(235.0000163912773, 235.0000163912773, 235.0000163912773)
    Title.TextSize = 20
    Title.TextTransparency = 0.19999998807907104
    Title.TextWrapped = true

    UICorner__14.CornerRadius = UDim.new(0, 6)
    UICorner__14.Parent = Title

    TopMiddle.BackgroundColor3 = Color3.fromRGB(59.00000028312206, 51.00000075995922, 76.0000030696392)
    TopMiddle.BorderSizePixel = 0
    TopMiddle.Name = "TopMiddle"
    TopMiddle.Parent = Master
    TopMiddle.Position = UDim2.new(0, 148, 0, 0)
    TopMiddle.Size = UDim2.new(0, 450, 0, 23)

    UICorner__15.CornerRadius = UDim.new(0, 6)
    UICorner__15.Parent = TopMiddle

    Title__2.BackgroundColor3 = Color3.fromRGB(90.00000223517418, 84.00000259280205, 125.00000774860382)
    Title__2.BackgroundTransparency = 1
    Title__2.BorderSizePixel = 0
    Title__2.Name = "Title"
    Title__2.Parent = TopMiddle
    Title__2.Position = UDim2.new(0, 96, 0, 0)
    Title__2.Size = UDim2.new(0, 256, 0, 18)
    Title__2.Font = Enum.Font.Code
    Title__2.Text = "Current Section: "
    Title__2.TextColor3 = Color3.fromRGB(235.0000163912773, 235.0000163912773, 235.0000163912773)
    Title__2.TextSize = 15
    Title__2.TextTransparency = 0.19999998807907104
    Title__2.TextWrapped = true

    UICorner__16.CornerRadius = UDim.new(0, 6)
    UICorner__16.Parent = Title__2

    UISettings.BackgroundColor3 = Color3.fromRGB(90.00000223517418, 84.00000259280205, 125.00000774860382)
    UISettings.Name = "UISettings"
    UISettings.Parent = Master
    UISettings.Position = UDim2.new(0, 7, 0, 364)
    UISettings.Size = UDim2.new(0, 121, 0, 96)

    UICorner__17.CornerRadius = UDim.new(0, 6)
    UICorner__17.Parent = UISettings

    UISettingsShadow.BackgroundColor3 = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
    UISettingsShadow.BackgroundTransparency = 0.800000011920929
    UISettingsShadow.BorderSizePixel = 0
    UISettingsShadow.Name = "UISettingsShadow"
    UISettingsShadow.Parent = UISettings
    UISettingsShadow.Size = UDim2.new(0, 121, 0, 96)

    UICorner__18.Parent = UISettingsShadow

    StopScript.Active = false
    StopScript.AutoButtonColor = false
    StopScript.BackgroundColor3 = Color3.fromRGB(88.00000235438347, 68.00000354647636, 113.00000846385956)
    StopScript.BackgroundTransparency = 1
    StopScript.BorderSizePixel = 0
    StopScript.Name = "StopScript"
    StopScript.Parent = UISettings
    StopScript.Position = UDim2.new(0, 9, 0, 0)
    StopScript.Selectable = false
    StopScript.Size = UDim2.new(0, 102, 0, 19)
    StopScript.Font = Enum.Font.Code
    StopScript.Text = "Stop Script"
    StopScript.TextColor3 = Color3.fromRGB(235.0000163912773, 235.0000163912773, 235.0000163912773)
    StopScript.TextScaled = true
    StopScript.TextSize = 17
    StopScript.TextTransparency = 0.19999998807907104
    StopScript.TextWrapped = true

    UICorner__19.CornerRadius = UDim.new(0, 6)
    UICorner__19.Parent = StopScript

    smooth_drag.Name = "smooth_drag"
    smooth_drag.Parent = Master
    --scripts
    coroutine.wrap(function()
        local script = smooth_drag
        
        function dragify(Frame)
            local dragToggle = nil
            local dragSpeed = .25
            local dragInput = nil
            local dragStart = nil
            local startPos = nil
            
            local function updateInput(input)
                local Delta = input.Position - dragStart
                local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
                game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed, 8), {Position = Position}):Play()
            end
            
            Frame.InputBegan:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    dragToggle = true
                    dragStart = input.Position
                    startPos = Frame.Position
                    input.Changed:Connect(function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end)
                end
            end)
            
            Frame.InputChanged:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    dragInput = input
                end
            end)
            
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if input == dragInput and dragToggle then
                    updateInput(input)
                end
            end)
        end
        
        dragify(script.Parent)
    end)()






    -- ---------------------------------------------------------------------------------------------------------------------------------
    

    Template_SectionButton.Parent = Templates;
    Template_SectionButton.Visible = false;

    Template_Button.Parent = Templates;
    Template_Button.Visible = false;

    Template_Label.Parent = Templates;
    Template_Label.Visible = false;

    Template_Toggle.Parent = Templates;
    Template_Toggle.Visible = false;

    return ChrysalismUI;
end;

local Library = {};

local HideSection, ShowSection, SwitchToSection;
do --Section Functions
    HideSection = function(Section)
        local Objects = Section.Objects;
        for I = 1, #Objects do
            local Object = Objects[I];
            Object.Object.Visible = false;
        end;
    end;
    ShowSection = function(Section)
        local Objects = Section.Objects;
        for I = 1, #Objects do
            local Object = Objects[I];
            Object.Object.Visible = true;
        end;
    end;
    SwitchToSection = function(Section)
        local GUI = Section.GUI;
        for I, V in next, GUI.Sections do
            if V and V ~= Section then
                HideSection(V);
            end;
        end;
        local GuiObject = GUI.Object;
        GuiObject.Master.TopMiddle.Title.Text = "Current Section: " .. Section.Name;

        ShowSection(Section);
    end;
end;

local CreateButton, CreateLabel, CreateToggle;
do --Create Object Functions
    CreateButton = function(Section, info)
        local GUI = Section.GUI;
        local GuiObject = GUI.Object;
        
        local ButtonObject = GuiObject.Templates["Template-Button"]:Clone();
        local Button = {Object = ButtonObject, GUI = GUI, Section = Section, Name = info.Name or "Button"};
        ButtonObject.Name = info.Name;
        ButtonObject.Text = info.Name;
        ButtonObject.Parent = GuiObject.Master.Body.Container;
        ButtonObject.Visible = false;
        ButtonObject.Position = UDim2.new(ButtonObject.Position.X.Scale, ButtonObject.Position.X.Offset, ButtonObject.Position.Y.Scale, 5 + ButtonObject.Position.Y.Offset + ((ButtonObject.Size.Y.Offset + 2) * #Section.Objects) - 5);

        if info.Callback then
            ButtonObject.MouseButton1Click:Connect(function()
                task.spawn(info.Callback, Button);
            end);
        end;

        table.insert(Section.Objects, Button);

        return Button;
    end;
    CreateLabel = function(Section, info)
        local GUI = Section.GUI;
        local GuiObject = GUI.Object;
        
        local LabelObject = GuiObject.Templates["Template-Label"]:Clone();
        local Label = {Object = LabelObject, GUI = GUI, Section = Section, Name = info.Name or "Label"};
        LabelObject.Name = info.Name;
        LabelObject.Text = info.Name;
        LabelObject.Parent = GuiObject.Master.Body.Container;
        LabelObject.Visible = false;
        LabelObject.Position = UDim2.new(LabelObject.Position.X.Scale, LabelObject.Position.X.Offset, LabelObject.Position.Y.Scale, 5 + LabelObject.Position.Y.Offset + ((LabelObject.Size.Y.Offset + 2) * #Section.Objects) - 5);

        table.insert(Section.Objects, Label);

        return Label;
    end;
    CreateToggle = function(Section, info)
        local GUI = Section.GUI;
        local GuiObject = GUI.Object;
        
        local ToggleObject = GuiObject.Templates["Template-Toggle"]:Clone();
        local Toggle = {Status = info.Default or false, Object = ToggleObject, GUI = GUI, Section = Section, Name = info.Name or "Toggle"};
        ToggleObject.Name = info.Name;
        ToggleObject.Text = info.Name;
        ToggleObject.Parent = GuiObject.Master.Body.Container;
        ToggleObject.Visible = false;
        ToggleObject.Position = UDim2.new(ToggleObject.Position.X.Scale, ToggleObject.Position.X.Offset, ToggleObject.Position.Y.Scale, 5 + ToggleObject.Position.Y.Offset + ((ToggleObject.Size.Y.Offset + 2) * #Section.Objects) - 5);

        if info.Callback then
            ToggleObject.MouseButton1Click:Connect(function()
                Toggle.Status = not Toggle.Status;
                task.spawn(info.Callback, Toggle.Status);
                ToggleObject.Indicator.Circle.Position = UDim2.new(0, Toggle.Status and 25 or 4, 0, 0);
            end);
        end;

        table.insert(Section.Objects, Toggle);

        return Toggle;
    end;
end;

local function CreateSection(GUI, info)
    local Section = {GUI = GUI, Objects = {}, Name = info.Name or "Section"};
    
    local GuiObject = GUI.Object;
    
    local SectionObject = Instance.new("Folder");
    SectionObject.Name = Section.Name;
    SectionObject.Parent = GuiObject.Sections;
    Section.Object = SectionObject;

    local SectionListButton = GuiObject.Templates["Template-SectionButton"]:Clone();

    SectionListButton.MouseButton1Click:Connect(function()
        SwitchToSection(Section);
    end);

    SectionListButton.Parent = GuiObject.Master.SectionList.Container;
    SectionListButton.Text = Section.Name;
    SectionListButton.Visible = true;
    SectionListButton.Position = UDim2.new(SectionListButton.Position.X.Scale, SectionListButton.Position.X.Offset, SectionListButton.Position.Y.Scale, 5 + SectionListButton.Position.Y.Offset + ((SectionListButton.Size.Y.Offset + 2) * #GUI.Sections) - 5);

    Section.CreateButton = CreateButton;
    Section.Button = CreateButton;
    Section.CreateLabel = CreateLabel;
    Section.Label = CreateLabel;
    Section.CreateToggle = CreateToggle;
    Section.Toggle = CreateToggle;

    table.insert(GUI.Sections, Section);
    return Section;
end;

local function CloseGui(GUI)
    GUI.OnClosed:Fire();
    GUI.Object:Destroy();
end;
local function CreateGui(self, info)
    local GuiObject = GetGuiObject();
    
    local GUI = {Object = GuiObject, Sections = {}, OnClosed = CreateEvent{Name = "GUI_OnClosed"}};
    if info.OnClosed then
        GUI.OnClosed:Connect(function()
            task.spawn(info.OnClosed, GUI);
        end);
    end;
    GUI.Close = CloseGui;
    GuiObject.Master.UISettings.StopScript.MouseButton1Click:Connect(function()
        task.spawn(CloseGui, GUI);
    end);
    
    GUI.CreateSection = CreateSection;
    GUI.Section = CreateSection;

    return GUI;
end;

Library.CreateGui = CreateGui;

-- local GUI = Library:CreateGui{Name = "GUI", OnClosed = function(GUI)print("The gui was closed.")end};
-- local Section = GUI:CreateSection{Name = "Section1"};
-- local Section2 = GUI:CreateSection{Name = "Section2"};

-- Section:CreateButton{Name = "Button", Callback = function(Button)print("Button clicked")end};
-- Section:Toggle{Name = "Toggle", Callback = function(Status)print(Status)end};
-- Section:CreateLabel{Name = "Label"};

-- Section2:CreateButton{Name = "Other Button", Callback = function(Button)print("Other Button clicked")end};
-- Section2:Button{Name = "Other Button2", Callback = function(Button)print("Other Button2 clicked")end};

return Library;
