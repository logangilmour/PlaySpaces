/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
 * isPermanent 
*/
function MapButton(image, done, content, isPermanent)
{
  var that = new MapElement(image, done);
  that.content = content;
  that.setHoldContent = function(content)
  {
		this.holdContent = content;
  }
	
	var contentBox = $("#content_box");
	this.content="content1";
	
	// Set up mouse handlers to switch the content box to the content.
	var origContent;
	that.element.mousedown(function()
	{

		that.element.data('image', 'gui/dot_on.png');
		that.setImage(that.element.data('image'));

		if(content)
		{
			origContent = contentBox.html();
			contentBox.html($("#" + content).html());
		}
	});
	
	that.element.mouseup(function()
	{
		// change state when touched
		that.element.data('image', 'gui/dot_on.png');
		that.setImage(that.element.data('image'));
		
		if(content){
			if(!isPermanent)
			{
				contentBox.html(origContent);
			}
		}
	});

  return that;
}


