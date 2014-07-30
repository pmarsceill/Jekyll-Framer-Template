# Welcome to Framer
# Test
# This is all CoffeeScript. Learn here: http://framerjs.com/learn.html#coffeescript

# Drop an image on the preview screen to create an image layer, or use the generator to import assets from Sketch or Photoshop

imageLayer = new Layer x:0, y:0, width:128, height:128, image:"images/framer-icon.png"
imageLayer.center()

# Define a set of states with names (the original state is 'default')
imageLayer.states.add
	second: {y:100, scale:0.6, rotationZ:100}
	third:  {y:300, scale:1.3, blur:4}
	fourth:	{y:200, scale:0.9, blur:2, rotationZ:200}

# Set the default animation options
imageLayer.states.animationOptions =
	curve: "spring(500,12,0)"

# On a click, go to the next state
imageLayer.on Events.Click, ->
	imageLayer.states.next()
