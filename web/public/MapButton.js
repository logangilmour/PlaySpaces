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


