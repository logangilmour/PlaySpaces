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
	this.content="content/one.html";
	var contentError = function (response, status, xhr)
	{
		if (status == "error")
		{
			var msg = "Sorry but there was an error: ";
			contentBox.html(msg + xhr.status + " " + xhr.statusText);
		}
	}
	
	// Set up mouse handlers to switch the content box to the content.
	var origContent;
	that.element.mousedown(function()
	{
<<<<<<< HEAD
<<<<<<< HEAD
		that.element.data("image", "gui/dot_on.png");
		if(content){
=======
		that.element.data('image', 'gui/dot_on.png');
		that.setImage(that.element.data('image'));
		if(content)
		{
>>>>>>> 4e9199220315b216205f184780abc8aefe7202c5
			contentBox.load(content, contentError);
=======
		if(content && !isPermanent){
			origContent = contentBox.html();
			contentBox.html(content);
		}
	});
	
	that.element.mouseup(function()
	{
		// change state when touched
		that.element.data('image', 'gui/dot_on.png');
		that.setImage(that.element.data('image'));
		
		if(content){
			if(isPermanent){
				contentBox.load(content, contentError);
			} else {
				contentBox.html(origContent);
			}
>>>>>>> e079769fce4198f75d726af71ba966faee818681
		}
	});

  return that;
}


