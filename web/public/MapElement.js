/* Map elements have the following properties:

Visibility state
Location
Image
Listens to events to change visibility 

Requires jQuery
*/
MapElement.prototype = ImageElement.prototype;
function MapElement(element,done)
{
    ImageElement.call(this, element.data('image'),done);
    this.element = element;
    this.rawX=element.data('x'); // These values are used by the map to figure out where the element
    this.rawY=element.data('y'); // should actually be placed according to size.
    this.facing = element.data("facing");
    this.facing = this.facing? this.facing : 0;
    
    this.handleEvent = function() { };
    
    element.css({position:"absolute"});
    if(this.facing){
      element.css("-moz-transform", "rotate(" + this.facing + "deg)");
      element.css("-webkit-transform", "rotate(" + this.facing + "deg)");
      element.css("-o-transform", "rotate(" + this.facing + "deg)");
      element.css("-ms-transform", "rotate(" + this.facing + "deg)");
    }
    
    element.prepend(this.image);
    element.css({margin:"0px",padding:"0px"});
    }

// set position of element - to be called by the map in order to place
// correctly relative to size.
MapElement.prototype.setPos = function(x, y,width)
{
    this.element.css({position:"absolute", top: y, left: x, width: width});
    this.image.css({width: "100%"});
}

MapElement.prototype.setVisible = function(isVisible)
{
    if(isVisible) {
       this.element.show(500);
    } else {
        this.element.hide(500);
    }
}

MapElement.prototype.setImage = function(image_url)
{
  this.image.attr('src', image_url);
}
