// A map class which hosts MapElements. It positions them to their
// desired location by converting their location to percentages based on
// the size of the map (as the map will be set to 100% of the screen)

// Makes a map object that fills 100% width.

// Attributes:
//     data-image is the url of the image of the map


Map.prototype = ImageElement.prototype;

function Map(element){
    this.element=element
    var map = this;
    ImageElement.call(this,element.data('image'),function(index){map.init();});
    

}

Map.prototype.init = function()
{
    var map = this;
    this.element.width("100%");
    this.element.prepend(this.image);
    this.image.width("100%");
    this.element.css({position:"relative"});
    var prevent = function(event){
        if(event.preventDefault){
            event.preventDefault();
        }
        };
    this.element.on("touchstart",prevent);
    this.element.on("mousedown",prevent);

    this.element.children('div.MapElement').each(function(index) {
      var element = new MapElement($(this),
                                   function(index){map.add(element);});
    });
    
    this.element.children('div.MapButton').each(function(index, child) {
      var element = new MapButton($(this),
                                  function(index){map.add(element);},
                                  $(child).data('content'),
                                  $(child).data('hold-content'));
    });
    
    this.element.children('div.MapDot').each(function(index, child) {
      var element = new MapButton($(this),
                                  function(index){map.add(element);},
                                  $(child).data('content'),
                                  $(child).data('hold-content'),
                                  true);
    });
}
Map.prototype.add = function(element){
   //moar eventbus
   var calc = element.width/this.width*100;
   element.setPos(element.rawX+"%",element.rawY+"%",calc+"%");
}
