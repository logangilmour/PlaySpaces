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
    element.width("100%");
    element.prepend(this.image);
    this.image.width("100%");
    element.css({position:"relative"});
}
Map.prototype.init = function(){
    var map=this;
    this.element.children('div.MapElement').each(function(index){
        var element = new MapElement($(this),function(index){map.add(element);});
    });
    this.element.children('div.MapButton').each(function(index){
        var element = new MapButton($(this),function(index){map.add(element);}, "content/one.html");
    });
    this.element.children('div.MapDot').each(function(index){
        var element = new MapButton($(this),function(index){map.add(element);}, "content/two.html", "<img src=\"content/image/yard_house.png\" alt=\"\">");
    });
}
Map.prototype.add = function(element){
   //moar eventbus
   var calc = element.width/this.width*100;
   element.setPos(element.rawX+"%",element.rawY+"%",calc+"%");
}
