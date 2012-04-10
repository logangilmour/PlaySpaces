/* Map elements have the following properties:
 *
 * Visibility state
 * Location
 * Image
 * Listens to events to change visibility 
 *
 * Requires jQuery
 */
function MapElement(image)
{
  this.element = null;
  this.locationX = 0;
  this.locationY = 0;

  this.image = image;
  this.handleEvent = function() { };
}

/**
 * Pressables paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
*/
function MapPressable(image, content)
{
  var that = new MapElement(image);
  that.content = content;
  that.setHoldContent = function(content)
  {
	this.holdContent = content;
  }

  return that;
}

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
  
  /* TODO:
  - Content box IDs shouldn't be hard coded
  - Need to notify other map elements using event bus 
  */
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

MapElement.prototype.toggleVisibility = function()
{
  this.element.toggle();
}

/*
EventBus.prototype.add = function(callback)
{
    if(typeof callback != "function")
    {
        callback = new Function(callback);
    }
    this.listeners[this.listeners.length]=callback;
}
EventBus.prototype.fire = function(name,value)
{
    for(var i=0; i<this.listeners.length; i++){
        this.listeners[i](name,value);
    }
}
*/
