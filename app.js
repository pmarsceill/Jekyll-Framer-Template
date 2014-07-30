(function() {
  var imageLayer;

  imageLayer = new Layer({
    x: 0,
    y: 0,
    width: 128,
    height: 128,
    image: "images/framer-icon.png"
  });

  imageLayer.center();

  imageLayer.states.add({
    second: {
      y: 100,
      scale: 0.6,
      rotationZ: 100
    },
    third: {
      y: 300,
      scale: 1.3,
      blur: 4
    },
    fourth: {
      y: 200,
      scale: 0.9,
      blur: 2,
      rotationZ: 200
    }
  });

  imageLayer.states.animationOptions = {
    curve: "spring(500,12,0)"
  };

  imageLayer.on(Events.Click, function() {
    return imageLayer.states.next();
  });

}).call(this);
