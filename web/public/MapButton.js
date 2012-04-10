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
	this.content="content/one.html";
	var contentError = function (response, status, xhr)
	{
		if (status == "error")
		{
			var msg = "Sorry but there was an error: ";
			contentBox.html(msg + xhr.status + " " + xhr.statusText);
		}
	}
	
	that.element.click(function()
	{
		if(content){
			contentBox.load(content, contentError);
		}
	});

  return that;
}


