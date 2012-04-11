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
    this.handleEvent = function() { }; 
    element.css({position:"absolute"});
    element.prepend(this.image);
    element.css({margin:"0px",padding:"0px"});
}

/*
MapElement.prototype.add = function(map, x, y)
{
  this.locationX = x;
  this.locationY = y;
  
  this.element = $('<img src="' + this.image + '" class="map_element">')
                 .toggle()
                 .css('bottom', this.locationY + 'px')
                 .css('left', this.locationX + 'px');
				 
  var contentError = function (response, status, xhr)
  {
	if (status == "error")
	{
	  var msg = "Sorry but there was an error: ";
	  $("#content_box").html(msg + xhr.status + " " + xhr.statusText);
	}
  }
  
  // TODO:
  //- Content box IDs shouldn't be hard coded
  //- Need to notify other map elements using event bus 
  
  var contentBox = $("#content_box");
	   
  // Set up mouse handlers to switch the content box to the content. 
  // These both need an extra variable because the inner function's scope
  // changes what "this" resolves to
  if(this.holdContent){
	var holdContent = this.holdContent;
	var origContent;
	this.element.mousedown(function()
	{
	  origContent = contentBox.html();
	  contentBox.load(holdContent, contentError);
    });
	
	this.element.mouseup(function()
	{
	  contentBox.html(origContent);
    });
  }

  if(this.content){
    var content = this.content;
    this.element.click(function()
    {
      contentBox.load(content, contentError);
    });
  }

  // Add the element to the map
  $(map).append(this.element);
}
*/

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

