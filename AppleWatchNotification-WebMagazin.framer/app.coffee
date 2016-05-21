# Made with Framer
# by Rıza Selçuk Saydam
# www.webmagazin.co

# Import file "AppleWatchNotification"
layers = Framer.Importer.load("imported/AppleWatchNotification@1x")

# A set of states
layers.LongLook.x= 0
layers.LongLook.y= 0
layers.LogoSmall.states.add
	hide: {opacity: 0}
layers.LogoSmall.states.switchInstant "hide"
layers.Logo.states.add
	small: {x:-30, y:-41, scale:0.465}
layers.Info.states.add
	hide: {opacity: 0}
layers.FirstBG.states.add
	hide: {opacity: 0}
layers.LongContent.states.add
	hide:{ opacity: 0, y:200}

# Interactions
Scrollable = ScrollComponent.wrap(layers.LongLook)
Scrollable.scrollHorizontal = false

layers.LongContent.states.switchInstant "hide"

layers.Notification.onClick (event, layer) ->
	layers.Notification.ignoreEvents = true
	layers.Logo.states.next()
	layers.Info.states.next()
	layers.FirstBG.states.next()
	layers.LongContent.states.next()
	
	Utils.delay 0.3, ->
		layers.LogoSmall.opacity = 1
		layers.Logo.opacity = 0
		
layers.LogoSmall.onClick (event, layer) ->
	layers.LogoSmall.opacity = 0
	layers.Logo.opacity = 1
	
	layers.Notification.ignoreEvents = false
	layers.Logo.states.next()
	layers.Info.states.next()
	layers.FirstBG.states.next()
	layers.LongContent.states.next()
	
# Animation options
Framer.Defaults.Animation =
  curve: "spring(500,40,0)"
layers.Info.states.animationOptions =
	time: 0.2