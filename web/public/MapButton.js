/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
*/
function MapButton(image, done, content)
{
  var that = new MapElement(image, done);
  that.content = content;
  that.setHoldContent = function(content)
  {
		this.holdContent = content;
  }
	
	var contentBox = $("#content_box");
	this.content="content1";
	
	that.element.click(function()
	{
		that.element.data('image', 'gui/dot_on.png');
		that.setImage(that.element.data('image'));
		if(content)
		{
			contentBox.html($("#" + content).html());
		}
	});

  return that;
}


