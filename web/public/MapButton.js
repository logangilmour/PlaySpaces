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
	var holdContent = holdContentId? $("#" + holdContentId) : null;
	that.element.mousedown(function()
	{
		if(contentId) {
			contentBox.html($("#" + contentId).html());
		}
		
		if(holdContentId){
			origContent = contentBox.html();
			showMedia(holdContent, that);
			startAutoplay(holdContent);
		}
	});
	
	that.element.mouseup(function()
	{
		// change state when touched
		if(isDot){
			that.element.data('image', 'gui/dot_off.png');
			that.setImage(that.element.data('image'));	
		}
		
		if(holdContentId){
			stopAutoplay($("#" + holdContentId));
			hideMedia();
			contentBox.html(origContent);
		}
	});

  return that;
}

/**
 * Builds an overlay div that will house the media
 */
function showMedia(content, camMapElement){
	var camDomElement = camMapElement.element;
	var overlay = $('<div></div>');
  overlay.attr("id", "overlay");
  overlay.attr("class", "overlay");
	overlay.mouseup(function(){
		hideMedia();
	});
	overlay.css("top", camDomElement.offset().top);
	overlay.css("left", camDomElement.offset().left);
	
	var imageElement = content.find("img").clone(true)[0];
	var videoElement = content.find("video").clone(true)[0];
	
	overlay.append(imageElement);
	overlay.append(videoElement);
	
  $("body").append(overlay);
	
	if(videoElement){
		videoElement.play();
	}
}

function hideMedia(){
	$("#overlay").detach();
}

function startAutoplay(content){
	var audioElement = content.find("audio")[0];
	
	if(audioElement){
		audioElement.play();
	}
	
	return content;
}

function stopAutoplay(content){
	var audioElement = content.find("audio")[0];
	
	if(audioElement){
		audioElement.pause();
		audioElement.currentTime = 0;
	}
	
	return content;
}


