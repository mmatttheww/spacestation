local import = require(game.ReplicatedStorage.Shared.Import)

local Roact = import "Roact"
local StyleConstants = import "Shared/Data/StyleConstants"

return function(props, children)
	children.TopTab = Roact.createElement("Frame", {
		BackgroundColor3 = StyleConstants.TAB_COLOR,
		Size = UDim2.new(1,0,0.15,0),
		BorderSizePixel = 0,
		BackgroundTransparency = 0,
		Position = UDim2.new(0,0,0,0),
		ZIndex = 1,
	})
	children.CloseButton = Roact.createElement("ImageButton", {
		Size = UDim2.new(0.1,0,0.1,0),
		Position = UDim2.new(.9, 0, 0, 3),
		AnchorPoint = Vector2.new(0.5,0.5),
		SizeConstraint = "RelativeYY",
		BorderSizePixel = 0,
		Visible = false,
		BackgroundTransparency = .2,
		BackgroundColor3 = StyleConstants.CLOSE_COLOR,
		[Roact.Event.Activated] = function()
			props.closeCallback()
		end,
		ZIndex = 2,
		Modal = true,
	})
	children.UIAspectRatioConstraint = Roact.createElement("UIAspectRatioConstraint", {
		AspectRatio = props.aspectRatio,
	})
	return Roact.createElement("Frame", {
		Size = props.size,
		Position = props.position,
		Visible = props.visible,
		BorderSizePixel = 0,
		BackgroundTransparency = .2,
		BackgroundColor3 = StyleConstants.WINDOW_BG,
		AnchorPoint = props.anchorPoint,
		[Roact.Ref] = props.ref or Roact.createRef(),
	},children)
end
