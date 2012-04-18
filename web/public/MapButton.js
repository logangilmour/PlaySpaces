/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
 * isPermanent 
 */
function MapButton(image, done, contentId, holdContentId, isDot)
{
	var that = new MapElement(image, done);
	that.content = contentId;
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
			$(".hidden_content").each(function(){
				stopAutoplay($(this));
				});

			if(event.preventDefault){
			event.preventDefault();
			}

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

			if (event.preventDefault){
			event.preventDefault();
			}

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

			var currId = $(this).attr("id");
			var testRegEx = currId.match("[0-9]");
			var test = testRegEx * 1;
			test++;
			$("#button"+test).css("display", "block");
			});

	return that;
}

/**
 * Builds an overlay div that will house the media
 */
function showMedia(content, camMapElement){
	//var camDomElement = camMapElement.element;
	var camX = camMapElement.element.offset().left;
	var camY = camMapElement.element.offset().top;
	var camWidth = camMapElement.element.width();
	var camHeight = camMapElement.element.height();

	var overlay = $('<div></div>');
	overlay.attr("id", "overlay");
	overlay.attr("class", "overlay");
	overlay.mouseup(function(){
			hideMedia();
			});

	var imageElement = content.find("img").clone(true);
	var videoElement = content.find("video").clone(true);

	overlay.append(imageElement);
	overlay.append(videoElement);

	$("body").append(overlay);

	// minDist is the minimum centroid distance necessary to avoid clipping.
	// This is the sum for each image of thalf their diagonal.
	var minDist = diagonal(overlay)/2 + diagonal(camMapElement.image)/2;

	var deltaX = Math.round(Math.sin(camMapElement.facing * Math.PI / 180) * minDist);
	var deltaY = -Math.round(Math.cos(camMapElement.facing * Math.PI / 180) * minDist);

	// less half widths and heights to use image centers
	var overlayX = Math.round(camX + camWidth/2 + deltaX - overlay.width()/2);
	var overlayY = Math.round(camY + camHeight/2 + deltaY - overlay.height()/2);

	/*
		alert("deltas: " + deltaX + "," + deltaY + "\n" +
		"cam x: " + camX + "\n"+
		"cam x center: " + (camX + camWidth/2) + "\n"
		+ "vid x left: " + (camX + camWidth/2 + deltaX)
		+ "\n\noverlay at: " + overlayX + "," + overlayY);
		*/

	overlay.css("left", overlayX);
	overlay.css("top", overlayY);

	if(videoElement[0]){
		videoElement[0].play();
	}
}

/**
 * Computes the diagonal of a rectanglular JQuery element
 */
function diagonal(rect){
	// hyp = sqrt((h/2^2) + (w/2)^2)
	var height = rect.height();
	var width = rect.width();

	var diag = Math.ceil(Math.sqrt(Math.pow(height, 2) + Math.pow(width, 2)));

	//alert("diagonal of "+ width + "x" + height
	//      + " sized " + rect + "is: " + diag);

	return diag;
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
