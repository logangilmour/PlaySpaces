MapDot.prototype = MapButton.prototype;
function MapDot(element, done){
	MapButton.call(this,element, done);

	var contentId = $(element).data('content');
	var holdContentId = $(element).data('hold-content');

	this.offImage = $("<img/>")
		.attr("src","gui/dot_off.png")
		.load(function() {

				});

	this.content = contentId;

	var contentBox = $("#content_text");

	var me = this;	
	this.addPressHandler(function(event)
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
					startAutoplay($("#"+holdContentId));
				}
			}catch(ex){
			}

			// change state when touched
			me.off();


			var enableList = $(element).data("enables");
			if (enableList && enableList.length > 0){
				var enable = enableList.split(",");
				for (var i = 0; i < enable.length; i++){
					$("#" + enable[i].trim()).fadeIn(2000);
				}
			}


			});

	this.addReleaseHandler(function(event)
			{
			if (event.preventDefault){
			event.preventDefault();
			}
			try {
			if(holdContentId){
			stopAutoplay($("#" + holdContentId));
			}
			}catch(ex){
			}
			});

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

MapDot.prototype.off = function(){
	this.image.detach();
	this.offImage.css({width:"100%"});
	this.element.prepend(this.offImage);
}
