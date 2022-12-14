--[[
    TO DO:

    Fix: DropDownToggle
    Fix: Colors

    Fix: Textbox (Try)
]]

function CreateMain(title)
	local destroyIfExist = game.CoreGui:GetChildren()
	for index, destroyIfExist in pairs(destroyIfExist) do
		if destroyIfExist.Name == title then
			print("Destroyed "..tostring(title)..": Already existed")
			destroyIfExist:Destroy()
		end
	end

    local MainColor = Color3.fromRGB(93, 88, 157)
	local Rodus = Instance.new("ScreenGui")
	local Top = Instance.new("Frame")
    local Highlight =  Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Minimize = Instance.new("TextButton")

	Rodus.Name = tostring(title)
	Rodus.Parent = game:WaitForChild("CoreGui")
	Rodus.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Top.Name = "Top"
	Top.Parent = Rodus
	Top.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	Top.BackgroundTransparency = 0
	Top.BorderColor3 = Color3.fromRGB(12, 12, 12)
	Top.BorderSizePixel = 4
	Top.Position = UDim2.new(0, 15, 0, 15)
	Top.Size = UDim2.new(0, 193, 0, 27)

    Highlight.Name = "Highlight"
	Highlight.Parent = Top
	Highlight.BackgroundColor3 = MainColor
	Highlight.BackgroundTransparency = 0.3
	Highlight.BorderColor3 = MainColor
	Highlight.BorderSizePixel = 0
	Highlight.Position = UDim2.new(0, 0, 0, 0)
	Highlight.Size = UDim2.new(0, 193, 0, 1)

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Title.BackgroundTransparency = 1
    Title.RichText = true
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 193, 0, 33)
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 23
	Title.TextXAlignment = Enum.TextXAlignment.Center

	Container.Name = "Container"
	Container.Parent = Top
	Container.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Container.BackgroundTransparency = 0
	Container.BorderColor3 = Color3.fromRGB(12, 12, 12)
	Container.BorderSizePixel = 4
	Container.Position = UDim2.new(0, 0, 1.29629624, 0)
	Container.Size = UDim2.new(0, 193, 0, 24)

	UIListLayout.Parent = Container
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	Minimize.Name = "Minimize"
	Minimize.Parent = Top
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.BackgroundTransparency = 1.000
	Minimize.Position = UDim2.new(0.906735778, 0, 0.185185179, 0)
	Minimize.Size = UDim2.new(0, 18, 0, 17)
	Minimize.Font = Enum.Font.SourceSans
	Minimize.Text = "-"
	Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.TextSize = 14.000
	tog_gled = false
	Minimize.MouseButton1Down:Connect(function()
		tog_gled = not tog_gled
		if tog_gled then Minimize.Text = "+" Container.Visible = false else Minimize.Text = "-" Container.Visible = true end
	end)
	function onKeyPress(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode.RightControl then
			if game.CoreGui[title].Top.Visible == false then game.CoreGui[title].Top.Visible = true
			else game.CoreGui[title].Top.Visible = false end
		end
	end

	game:GetService("UserInputService").InputBegan:connect(onKeyPress)
	
	function CreateTab(text)
		local Tab = Instance.new("TextButton")
		local Arrow = Instance.new("TextLabel")
		Tab.Name = text
		Tab.Parent = Container
		Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BackgroundTransparency = 1.000
		Tab.Size = UDim2.new(0, 193, 0, 24)
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = text
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 20.000
		Tab.TextXAlignment = Enum.TextXAlignment.Center

		Arrow.Name = "Arrow"
		Arrow.Parent = Tab
		Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Arrow.BackgroundTransparency = 1.000
		Arrow.Position = UDim2.new(0.907, 0, 0, 0)
		Arrow.Size = UDim2.new(0, 18, 0, 21)
		Arrow.Font = Enum.Font.SourceSans
		Arrow.Text = ">"
		Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
		Arrow.TextScaled = true
		Arrow.TextSize = 14.000
		Arrow.TextWrapped = true
		
		Container.Size = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, UIListLayout.AbsoluteContentSize.Y)
		
		local TabContainer = Instance.new("Frame")
		TabContainer.Name = "TabContainer"
		TabContainer.Parent = Tab
		TabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		TabContainer.BackgroundTransparency = 0
		TabContainer.BorderColor3 = Color3.fromRGB(12, 12, 12)
		TabContainer.BorderSizePixel = 4
		TabContainer.Position = UDim2.new(1.0569948, 0, 0, -35)
		TabContainer.Visible = false
		Tab.MouseButton1Down:Connect(function()
			if TabContainer.Visible == false then
				local allTabs = TabContainer.Parent.Parent:GetDescendants()
				for index, allTabs in pairs(allTabs) do
					if allTabs.Name == "TabContainer" then
						allTabs.Visible = false
						allTabs.Parent.TextColor3 = Color3.new(255, 255, 255)
						allTabs.Parent.Arrow.TextColor3 = Color3.new(255, 255, 255)
					end
				end
				TabContainer.Visible = true
				Tab.TextColor3 = MainColor
				Tab.Arrow.TextColor3 = MainColor
			else 
				TabContainer.Visible = false
				Tab.TextColor3 = Color3.new(255, 255, 255)
				Tab.Arrow.TextColor3 = Color3.new(255, 255, 255)
			end
		end)
		local UIListLayout2 = Instance.new("UIListLayout")
		UIListLayout2.Parent = TabContainer
		UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		
		function CreateButton(parent, buttonText, note, callback)
			local Button = Instance.new("TextButton")
			local Note = Instance.new("TextLabel")

			Button.Name = buttonText
			Button.Parent = parent.TabContainer
			Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Button.BackgroundTransparency = 1.000
			Button.Size = UDim2.new(0, 193, 0, 24)
			Button.Font = Enum.Font.SourceSans
			Button.Text = " "..buttonText
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 20.000
			Button.TextXAlignment = Enum.TextXAlignment.Center
			Button.MouseEnter:Connect(function()
				Button.Note.Visible = true
			end)
			Button.MouseLeave:Connect(function()
				Button.Note.Visible = false
			end)
			Button.MouseButton1Down:Connect(function()
				Button.TextColor3 = MainColor
				wait(0.2)
				Button.TextColor3 = Color3.new(255, 255, 255)
				pcall(callback)
			end)

			Note.Name = "Note"
			Note.Parent = Button
			Note.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Note.BackgroundTransparency = 1.000
			Note.Position = UDim2.new(1.04145074, 0, 0, 0)
			Note.Size = UDim2.new(0, 193, 0, 24)
			Note.Font = Enum.Font.SourceSans
			Note.Text = note
			Note.TextColor3 = MainColor
			Note.TextSize = 20.000
			Note.TextXAlignment = Enum.TextXAlignment.Center
			Note.Visible = false
			
			parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
		end
		
		function CreateLabel(parent, labelText, color3)
			local Label = Instance.new("TextLabel")
            local Highlight2 = Instance.new("Frame")

			Label.Name = labelText
			Label.Parent = parent.TabContainer
			Label.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
            Label.BorderColor3 = Color3.fromRGB(12, 12, 12)
            Label.BorderSizePixel = 0
			Label.BackgroundTransparency = 0
			Label.Size = UDim2.new(0, 193, 0, 33)
			Label.Font = Enum.Font.SourceSans
			Label.Text = labelText
			Label.TextColor3 = color3
			Label.TextSize = 20.000
			Label.TextXAlignment = Enum.TextXAlignment.Center

            Highlight2.Name = "Highlight"
            Highlight2.Parent = Label
            Highlight2.BackgroundColor3 = MainColor
            Highlight2.BackgroundTransparency = 0.3
            Highlight2.BorderColor3 = MainColor
            Highlight2.BorderSizePixel = 0
            Highlight2.Position = UDim2.new(0, 0, 0, 1)
            Highlight2.Size = UDim2.new(0, 193, 0, 1)
			
			parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
		end
		
		function CreateToggle(parent, buttonText, note, callback)
			local Button = Instance.new("TextButton")
			local Note = Instance.new("TextLabel")
			local Toggle = Instance.new("BoolValue")
			
			Button.Name = buttonText
			Button.Parent = parent.TabContainer
			Toggle.Parent = Button
			Toggle.Name = "Toggled"
			Toggle.Value = false
			Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Button.BackgroundTransparency = 1.000
			Button.Size = UDim2.new(0, 193, 0, 24)
			Button.Font = Enum.Font.SourceSans
			Button.Text = " "..buttonText
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 20.000
			Button.TextXAlignment = Enum.TextXAlignment.Center
			Button.MouseEnter:Connect(function()
				Button.Note.Visible = true
			end)
			Button.MouseLeave:Connect(function()
				Button.Note.Visible = false
			end)
			Button.MouseButton1Down:Connect(function()
				Toggle.Value = not Toggle.Value
				toggled = Toggle.Value
				if Button.TextColor3 == MainColor then
					Button.TextColor3 = Color3.new(255, 255, 255)
				else 
                    Button.TextColor3 = MainColor
				end
				pcall(callback)
			end)
			Note.Name = "Note"
			Note.Parent = Button
			Note.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Note.BackgroundTransparency = 1.000
			Note.Position = UDim2.new(1.04145074, 0, 0, 0)
			Note.Size = UDim2.new(0, 193, 0, 24)
			Note.Font = Enum.Font.SourceSans
			Note.Text = note
			Note.TextColor3 = MainColor
			Note.TextSize = 20.000
			Note.TextXAlignment = Enum.TextXAlignment.Center
			Note.Visible = false
			
			
			parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
		end
		
		function CreateSideDropButton(parent, dropText, list, callback)
			local SideDrop = Instance.new("TextButton")
			local Arrow = Instance.new("TextButton")
			local DropContainer = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")

			SideDrop.Name = dropText
			SideDrop.Parent = parent.TabContainer
			SideDrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			SideDrop.BackgroundTransparency = 1.000
			SideDrop.Size = UDim2.new(0, 193, 0, 24)
			SideDrop.Font = Enum.Font.SourceSans
			SideDrop.Text = " "..dropText
			SideDrop.TextColor3 = Color3.fromRGB(255, 255, 255)
			SideDrop.TextSize = 20.000
			SideDrop.TextXAlignment = Enum.TextXAlignment.Center
			SideDrop.MouseButton1Down:Connect(function()
				if SideDrop.TextColor3 == MainColor then
					SideDrop.TextColor3 = Color3.new(255, 255, 255)
					SideDrop.Arrow.TextColor3 = Color3.new(255, 255, 255)
					DropContainer.Visible = false
				else 
					local allTabs = game.CoreGui[title].Top.Container:GetDescendants()
					for index, allTabs in pairs(allTabs) do
						if allTabs.Name == "DropContainer" then
							allTabs.Visible = false
							allTabs.Parent.TextColor3 = Color3.new(255, 255, 255)
							allTabs.Parent.Arrow.TextColor3 = Color3.new(255, 255, 255)
						end
					end
					SideDrop.TextColor3 = MainColor
					SideDrop.Arrow.TextColor3 = MainColor
					DropContainer.Visible = true
				end
			end)

			Arrow.Name = "Arrow"
			Arrow.Parent = SideDrop
			Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.BackgroundTransparency = 1.000
			Arrow.Position = UDim2.new(0.906735778, 0, 0, 0)
			Arrow.Size = UDim2.new(0, 18, 0, 21)
			Arrow.Font = Enum.Font.SourceSans
			Arrow.Text = ">"
			Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.TextScaled = true
			Arrow.TextSize = 20.000
			Arrow.TextWrapped = true

			DropContainer.Name = "DropContainer"
			DropContainer.Parent = SideDrop
			DropContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			DropContainer.BackgroundTransparency = 0
			DropContainer.BorderColor3 = Color3.fromRGB(12, 12, 12)
			DropContainer.BorderSizePixel = 4
			DropContainer.Position = UDim2.new(1.055, 0, 0, 0)
			DropContainer.Size = UDim2.new(0, 193, 0, 72)
			DropContainer.Visible = false

			UIListLayout.Parent = DropContainer
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			for i,v in next, list do
				local Button = Instance.new("TextButton")
				Button.Name = v
				Button.Parent = SideDrop.DropContainer
				Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Button.BackgroundTransparency = 1.000
				Button.Size = UDim2.new(0, 193, 0, 24)
				Button.Font = Enum.Font.SourceSans
				Button.Text = " "..v
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 20.000
				Button.TextXAlignment = Enum.TextXAlignment.Center
				Button.MouseButton1Down:Connect(function()
					Button.TextColor3 = MainColor
					wait(0.2)
					Button.TextColor3 = Color3.new(255, 255, 255)
					callback(v)
				end)
				DropContainer.Size = UDim2.new(0, DropContainer.UIListLayout.AbsoluteContentSize.X, 0, DropContainer.UIListLayout.AbsoluteContentSize.Y)
				parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
			end
		end
		
		function CreateSideDropToggle(parent, dropText, list, callback)
			local SideDrop = Instance.new("TextButton")
			local Arrow = Instance.new("TextButton")
			local DropContainer = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")

			SideDrop.Name = dropText
			SideDrop.Parent = parent.TabContainer
			SideDrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			SideDrop.BackgroundTransparency = 1.000
			SideDrop.Size = UDim2.new(0, 193, 0, 24)
			SideDrop.Font = Enum.Font.SourceSans
			SideDrop.Text = " "..dropText
			SideDrop.TextColor3 = Color3.fromRGB(255, 255, 255)
			SideDrop.TextSize = 20.000
			SideDrop.TextXAlignment = Enum.TextXAlignment.Center
			SideDrop.MouseButton1Down:Connect(function()
				if SideDrop.TextColor3 == MainColor then
					SideDrop.TextColor3 = Color3.new(255, 255, 255)
					SideDrop.Arrow.TextColor3 = Color3.new(255, 255, 255)
					DropContainer.Visible = false
				else 
					local allTabs = game.CoreGui[title].Top.Container:GetDescendants()
					for index, allTabs in pairs(allTabs) do
						if allTabs.Name == "DropContainer" then
							allTabs.Visible = false
							allTabs.Parent.TextColor3 = Color3.new(255, 255, 255)
							allTabs.Parent.Arrow.TextColor3 = Color3.new(255, 255, 255)
						end
					end
					SideDrop.TextColor3 = MainColor
					SideDrop.Arrow.TextColor3 = MainColor
					DropContainer.Visible = true
				end
			end)

			Arrow.Name = "Arrow"
			Arrow.Parent = SideDrop
			Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.BackgroundTransparency = 1.000
			Arrow.Position = UDim2.new(0.906735778, 0, 0, 0)
			Arrow.Size = UDim2.new(0, 18, 0, 21)
			Arrow.Font = Enum.Font.SourceSans
			Arrow.Text = ">"
			Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.TextScaled = true
			Arrow.TextSize = 14.000
			Arrow.TextWrapped = true

			DropContainer.Name = "DropContainer"
			DropContainer.Parent = SideDrop
			DropContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			DropContainer.BackgroundTransparency = 0
			DropContainer.BorderColor3 = Color3.fromRGB(12, 12, 12)
			DropContainer.BorderSizePixel = 4
			DropContainer.Position = UDim2.new(1.055, 0, 0, 0)
			DropContainer.Size = UDim2.new(0, 193, 0, 72)
			DropContainer.Visible = false

			UIListLayout.Parent = DropContainer
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			for i,v in next, list do
				local Button = Instance.new("TextButton")
				Button.Name = v
				Button.Parent = SideDrop.DropContainer
				Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Button.BackgroundTransparency = 1.000
				Button.Size = UDim2.new(0, 193, 0, 24)
				Button.Font = Enum.Font.SourceSans
				Button.Text = v
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 20.000
				Button.TextXAlignment = Enum.TextXAlignment.Center
				Button.MouseButton1Down:Connect(function()
					if Button.TextColor3 == MainColor then
					Button.TextColor3 = Color3.new(255, 255, 255)
					else Button.TextColor3 = MainColor end
					callback(v)
				end)
				DropContainer.Size = UDim2.new(0, DropContainer.UIListLayout.AbsoluteContentSize.X, 0, DropContainer.UIListLayout.AbsoluteContentSize.Y)
				parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
			end
		end
		
		function CreateTextBox(parent, buttonText, placeholderText, callback)
			local TextBox = Instance.new("TextButton")
			local Arrow = Instance.new("TextButton")
			local Side = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local Box = Instance.new("TextBox")
			local Hover = Instance.new("Frame")
            local Highlight3 = Instance.new("Frame")

			TextBox.Name = buttonText
			TextBox.Parent = parent.TabContainer
			TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BackgroundTransparency = 1.000
			TextBox.Size = UDim2.new(0, 193, 0, 24)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.Text = buttonText
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 20.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Center
			TextBox.MouseButton1Down:Connect(function()
				TextBox.TextColor3 = MainColor
				wait(0.2)
				TextBox.TextColor3 = Color3.new(255, 255, 255)
				callback(Box.Text)
			end)

            TextBox.MouseButton1Down:Connect(function()
				if Side.Visible then
					Side.Visible = false
				else 
                    Side.Visible = true
				end
			end)

			Arrow.Name = "Arrow"
			Arrow.Parent = TextBox
			Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.BackgroundTransparency = 1.000
			Arrow.Position = UDim2.new(0.906735778, 0, 0, 0)
			Arrow.Size = UDim2.new(0, 18, 0, 21)
			Arrow.Font = Enum.Font.SourceSans
			Arrow.Text = ">"
			Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
			Arrow.TextScaled = true
			Arrow.TextSize = 14.000
			Arrow.TextWrapped = true

			Side.Name = "Side"
			Side.Parent = TextBox
			Side.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			Side.BackgroundTransparency = 0
			Side.BorderColor3 = Color3.fromRGB(12, 12, 12)
			Side.BorderSizePixel = 4
			Side.Position = UDim2.new(1.055, 0, 0, 0)
			Side.Size = UDim2.new(0, 193, 0, 24)
			Side.Visible = false
			
			Hover.Name = "Hover"
			Hover.Parent = TextBox
			Hover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hover.BackgroundTransparency = 1.000
			Hover.Size = UDim2.new(0, 209, 0, 32)

            --[[
			Hover.MouseEnter:Connect(function()
				local allTabs = game.CoreGui[tostring(title)].Top.Container:GetDescendants()
				for index, allTabs in pairs(allTabs) do
					if allTabs.Name == "Side" then
						allTabs.Visible = false
					end
				end
			end)
			]]-- 

			UIListLayout.Parent = Side
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			Box.Name = "Box"
			Box.Parent = Side
			Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Box.BackgroundTransparency = 1.000
			Box.Size = UDim2.new(0, 193, 0, 24)
			Box.Font = Enum.Font.SourceSans
			Box.Text = ""
			Box.TextColor3 = Color3.fromRGB(255, 255, 255)
			Box.TextSize = 20.000
			Box.TextWrapped = true
			Box.PlaceholderText = placeholderText

            Highlight3.Name = "Highlight"
            Highlight3.Parent = Box
            Highlight3.BackgroundColor3 = MainColor
            Highlight3.BackgroundTransparency = 0.3
            Highlight3.BorderColor3 = MainColor
            Highlight3.BorderSizePixel = 0
            Highlight3.Position = UDim2.new(0, 0, 0, 1)
            Highlight3.Size = UDim2.new(0, 193, 0, 1)

			parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
		end
	end
	tabs = game.CoreGui[title].Top.Container
end
