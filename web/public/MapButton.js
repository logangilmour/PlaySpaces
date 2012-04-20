/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
 * isPermanent 
 */

MapButton.prototype = MapElement.prototype;
function MapButton(image, done, contentId, holdContentId, isDot)
{
	MapElement.call(this,image, done);
    this.offImage = $("<img/>")
        .attr("src","gui/dot_off.png")
        .load(function() {
            
        });
    
    var that = this;
	that.content = contentId;
    that.setHoldContent = function(content)
	{
		this.holdContent = content;
	};

	var contentBox = $("#content_box");
	this.content="content1";

	// Set up mouse handlers to switch the content box to the content.
	var origContent;
	var holdContent = holdContentId? $("#" + holdContentId) : null;
	var buttonClick = function(event)
	{

    // stops playback of any and all audio recorings
    $(".hidden_content").each(function(){
          try{
           stopAutoplay($(this));
           }catch(exception){

           }
			}); 
                
		// prevents the dragging of map buttons
		if(event.preventDefault){
			event.preventDefault();
		}

		if(contentId) {
			contentBox.html($("#" + contentId).html());
		}
	try{	
        if(holdContentId){
			origContent = contentBox.html();
			showMedia(holdContent, that);
			startAutoplay(holdContent);
		}
    }catch(ex){
        //alert("Bad stuff: "+ex);
    }

    // change state when touched
            if(isDot){
           that.off();
           }
            
        
	    var enableList = $(this).data("enables");
		if (enableList && enableList.length > 0){
			var enable = enableList.split(",");
			for (var i = 0; i < enable.length; i++){
				$("#" + enable[i].trim()).fadeIn(2000);
			}
		}


	};

	var buttonRelease = function(event)
	{
		if (event.preventDefault){
			event.preventDefault();
		}
        try {
            if(holdContentId){
                stopAutoplay($("#" + holdContentId));
                hideMedia();
                contentBox.html(origContent);
            }
        }catch(ex){
        }
	};

	that.element.on("mousedown", buttonClick);
	$(document.body).on("mouseup", buttonRelease);
	that.element.on("touchstart", buttonClick);
	$(document.body).on("touchend", buttonRelease);
	return that;
}

MapButton.prototype.off = function(){
    this.image.detach();
    this.offImage.css({width:"100%"});
    this.element.prepend(this.offImage);
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
        try{
		audioElement.play();
        }catch(ex){
            Window.alert(ex);
        }
	}

	return content;
}

function stopAutoplay(content){
    
        var audioElement = content.find("audio")[0];
        if(audioElement){
            audioElement.currentTime = 0;
            audioElement.pause();
        }
	return content;
}
