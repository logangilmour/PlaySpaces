/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
 * isPermanent 
*/
function MapButton(image, done, contentId, holdContentId, isDot)
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
		if(contentId) {
			contentBox.html($("#" + contentId).html());
		}
		
		if(holdContentId){
			origContent = contentBox.html();
			contentBox.append($("#" + holdContentId).html());
		}
	});
	
	that.element.mouseup(function()
	{
		// change state when touched
		if(isDot){
			that.element.data('image', 'gui/dot_on.png');
			that.setImage(that.element.data('image'));	
		}
		
		if(holdContentId){
			contentBox.html(origContent);
		}
	});

  return that;
}


