/**
 * Pressables paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
*/
function MapPressable(image, content)
{
  var that = new MapElement(image);
  that.content = content;

  return that;
}


