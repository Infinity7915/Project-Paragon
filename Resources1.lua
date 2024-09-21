-- # This table is to load in 'UNIVERSAL' needs
local _Resources = {
    general_resources = {
        ["antiAFK"] = function()
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(
                function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end
            )
        end,
        ["Load_Performance_Stats"] = function()
            local yPos = 0.7
            fpsLabel = Instance.new("TextLabel")
            fpsLabel.Size = UDim2.new(0, 200, 0, 28)
            fpsLabel.BackgroundTransparency = 1
            fpsLabel.TextColor3 = Color3.new(1, 1, 1)
            fpsLabel.TextStrokeTransparency = 0
            fpsLabel.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
            fpsLabel.Font = Enum.Font.SourceSans
            fpsLabel.TextSize = 30
            fpsLabel.Text = ""
            fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            fpsLabel.Position = UDim2.new(0.7, 0, yPos, 0)
            fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
            fpsLabel.BorderSizePixel = 0
            fpsLabel.Parent = game.CoreGui.RobloxGui
            fpsLabel.Visible = true
            local FPS = {}
            local sec = nil
            local function calculateFPS()
                local fr = tick()
                for index = #FPS, 1, -1 do
                    FPS[index + 1] = (FPS[index] >= fr - 1) and FPS[index] or nil
                end
                FPS[1] = fr
                local fps = (tick() - sec >= 1 and #FPS) or (#FPS / (tick() - sec))
                fps = math.floor(fps)
                fpsLabel.Text = "" .. fps .. "  -  FPS"
                if fps < 30 then
                    fpsLabel.TextColor3 = Color3.new(0, 0, 0)
                elseif fps < 45 then
                    fpsLabel.TextColor3 = Color3.new(100, 0, 0)
                elseif fps < 60 then
                    fpsLabel.TextColor3 = Color3.new(100, 100, 0)
                else
                    fpsLabel.TextColor3 = Color3.new(0, 100, 0)
                end
            end
            local RunService = game:GetService("RunService")
            local RenderStepped = RunService.RenderStepped
            sec = tick()
            RenderStepped:Connect(calculateFPS)
            yPos = yPos + 0.05
            cpuLabel = Instance.new("TextLabel")
            cpuLabel.Size = UDim2.new(0, 200, 0, 28)
            cpuLabel.BackgroundTransparency = 1
            cpuLabel.TextColor3 = Color3.new(1, 1, 1)
            cpuLabel.TextStrokeTransparency = 0
            cpuLabel.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
            cpuLabel.Font = Enum.Font.SourceSans
            cpuLabel.TextSize = 30
            cpuLabel.Text = ""
            cpuLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            cpuLabel.Position = UDim2.new(0.7, 0, yPos, 0)
            cpuLabel.TextXAlignment = Enum.TextXAlignment.Right
            cpuLabel.BorderSizePixel = 0
            cpuLabel.Parent = game.CoreGui.RobloxGui
            cpuLabel.Visible = true
            local function UpdateCPULabel()
                spawn(
                    function()
                        repeat
                            wait(0)
                            local cpu =
                                tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").CPU:GetValue())
                            cpu = math.floor(cpu)
                            cpuLabel.Text = cpu .. "%  -  CPU"
                            if cpu > 75 then
                                cpuLabel.TextColor3 = Color3.new(0, 0, 0)
                            elseif cpu > 50 then
                                cpuLabel.TextColor3 = Color3.new(100, 0, 0)
                            elseif cpu > 25 then
                                cpuLabel.TextColor3 = Color3.new(100, 100, 0)
                            else
                                cpuLabel.TextColor3 = Color3.new(0, 100, 0)
                            end
                        until cpuLabel == nil
                    end
                )
            end
            UpdateCPULabel()
            yPos = yPos + 0.05
            gpuLabel = Instance.new("TextLabel")
            gpuLabel.Size = UDim2.new(0, 200, 0, 28)
            gpuLabel.BackgroundTransparency = 1
            gpuLabel.TextColor3 = Color3.new(1, 1, 1)
            gpuLabel.TextStrokeTransparency = 0
            gpuLabel.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
            gpuLabel.Font = Enum.Font.SourceSans
            gpuLabel.TextSize = 30
            gpuLabel.Text = ""
            gpuLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            gpuLabel.Position = UDim2.new(0.7, 0, yPos, 0)
            gpuLabel.TextXAlignment = Enum.TextXAlignment.Right
            gpuLabel.BorderSizePixel = 0
            gpuLabel.Parent = game.CoreGui.RobloxGui
            gpuLabel.Visible = true
            local function UpdateGPULabel()
                spawn(
                    function()
                        repeat
                            wait(0)
                            local gpu =
                                tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").GPU:GetValue())
                            gpu = math.floor(gpu)
                            gpuLabel.Text = gpu .. "%  -  GPU"
                            if gpu > 75 then
                                gpuLabel.TextColor3 = Color3.new(0, 0, 0)
                            elseif gpu > 50 then
                                gpuLabel.TextColor3 = Color3.new(100, 0, 0)
                            elseif gpu > 25 then
                                gpuLabel.TextColor3 = Color3.new(100, 100, 0)
                            else
                                gpuLabel.TextColor3 = Color3.new(0, 100, 0)
                            end
                        until gpuLabel == nil
                    end
                )
            end
            UpdateGPULabel()
            yPos = yPos + 0.05
            pingLabel = Instance.new("TextLabel")
            pingLabel.Size = UDim2.new(0, 200, 0, 28)
            pingLabel.BackgroundTransparency = 1
            pingLabel.TextColor3 = Color3.new(1, 1, 1)
            pingLabel.TextStrokeTransparency = 0
            pingLabel.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
            pingLabel.Font = Enum.Font.SourceSans
            pingLabel.TextSize = 30
            pingLabel.Text = ""
            pingLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            pingLabel.Position = UDim2.new(0.7, 0, yPos, 0)
            pingLabel.TextXAlignment = Enum.TextXAlignment.Right
            pingLabel.BorderSizePixel = 0
            pingLabel.Parent = game.CoreGui.RobloxGui
            pingLabel.Visible = true
            local function UpdatePingLabel()
                spawn(
                    function()
                        repeat
                            wait(0)
                            local ping =
                                tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
                            ping = math.floor(ping)
                            pingLabel.Text = ping .. "ms  -  Ping"
                            if ping > 1000 then
                                pingLabel.TextColor3 = Color3.new(0, 0, 0)
                            elseif ping > 300 then
                                pingLabel.TextColor3 = Color3.new(100, 0, 0)
                            elseif ping > 150 then
                                pingLabel.TextColor3 = Color3.new(100, 100, 0)
                            else
                                pingLabel.TextColor3 = Color3.new(0, 100, 0)
                            end
                        until pingLabel == nil
                    end
                )
            end
            UpdatePingLabel()
        end,
        ["Delete_ads"] = function()
            if
                game.PlaceId == 3276265788 or game.PlaceId == 3101667897 or game.PlaceId == 3232996272 or
                    game.PlaceId == 3623096087
             then
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                local adsAllowed = localPlayer:FindFirstChild("adsAllowed")

                if adsAllowed then
                    adsAllowed.Value = false
                else
                    warn("Local ads not found")
                end
            end
        end,
        ["Credits_"] = function()
            loadstring(
                game:HttpGet(("https://raw.githubusercontent.com/Infinity7915/Project-Paragon/main/Credits.lua"), true)
            )()
        end
    }
}
---- # Call Table
for name, func in pairs(_Resources.general_resources) do
    func()
end
