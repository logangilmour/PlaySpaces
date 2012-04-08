// A map class which hosts MapElements. It positions them to their
// desired location by converting their location to percentages based on
// the size of the map (as the map will be set to 100% of the screen)

// Makes a map object that fills 100% width.

// Attributes:
//     data-image is the url of the image of the map


Map.prototype = ImageElement.prototype;

function Map(element){
    this.element=element 
    ImageElement.call(this,imageDiv.data('image'),this.init);
    element.width("100%");
    element.prepend(this.image);
    this.image.width("100%");
    element.css({position:"relative"});


}
Map.prototype.init = function(){
    var map=this;
    this.element.children('div.MapElement').each(function(index){
        element = new MapElement($(this));
        map.add(element); 
    });
}
Map.prototype.add = function(element){
   //moar eventbus
   var calc = this.width;
   alert(calc);
   element.setPos(element.rawX+"%",element.rawY+"%",calc+"%");
}
