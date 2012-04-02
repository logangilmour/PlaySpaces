/* Map elements have the following properties:

Visibility state
Location
Image
Listens to events to change visibility 

Requires jQuery
*/

function MapElement(content)
{
  // this.visible = false;
  this.element = null;
  this.locationX = 0;
  this.locationY = 0;
  this.content = content;
  this.image = 'images/dot_off.png';
  this.handleEvent = function() { };
}

MapElement.prototype.add = function(map, x, y)
{
  this.locationX = x;
  this.locationY = y;
  
  this.element = $('<img src="images/dot_off.png" class="map_element">')
                 .toggle()
                 .css('bottom', this.locationY + 'px')
                 .css('left', this.locationX + 'px');

  /* Set up click handler to switch the content box to the content.
     TODO:
       - Content box ID shouldn't be hard coded
       - Need to notify other map elements using event bus */

  // Need this extra variable because the scoping of the inner function changes
  // "this"
  var content = this.content;
  this.element.click(function()
  {
    $("#content_box").load(content, function(response, status, xhr) 
    {
      if (status == "error")
      {
        var msg = "Sorry but there was an error: ";
        $("#content_box").html(msg + xhr.status + " " + xhr.statusText);
      }
    });
  });

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
