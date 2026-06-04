local ok, err = pcall(function()

    local gui = Instance.new("ScreenGui")
    gui.Parent = game:GetService("CoreGui")

    local label = Instance.new("TextLabel")
    label.Parent = gui
    label.Size = UDim2.new(0, 300, 0, 50)
    label.Text = "ROUTE RECORDER CARREGADO"

end)

if not ok then
    warn(err)
end
