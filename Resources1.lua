local _Resources = { -- This table is to load in 'UNIVERSAL' needs
    general_resources = {
      ['antiAFK'] = function() 
        local VirtualUser = game:GetService("VirtualUser") -- anti-AFK
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
       end,
      ['Call_Lib'] = function() -- leaving room for another function if i want
         local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity7915/Project-Paragon/main/Library_Main.lua"))()
        end,
      ['Credits_'] = function() 
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Infinity7915/Project-Paragon/main/Credits.lua'),true))()
       end,
    }
  }
  ---- # Call Table
  for name, func in pairs(_Resources.general_resources) do
    func()
  end
