MapCam.prototype = MapButton.prototype;
function MapCam(element, done){
    
    MapButton.call(this,element, done);
    

    var me = this;	
    this.addPressHandler(function(event)
	{
       
		if(event.preventDefault){
			event.preventDefault();
		}
	//try{	
			me.showMedia();
    //}catch(ex){
    //    alert("Bad stuff: "+ex);
    //}
	});

	this.addReleaseHandler(function(event)
	{
		if (event.preventDefault){
			event.preventDefault();
		}
        try {
                me.hideMedia();
        }catch(ex){
        }
	});


   	return this;
}


/**
 * Builds an overlay div that will house the media
 */
MapCam.prototype.showMedia = function (){
	
    var content =$("#"+$(this.element).data('hold-content'))
        .find("img,video").first().clone(true);
    var overlay = $("#overlay").first();
    overlay.html(content);
    overlay.fadeIn(500);
    
  
	if(content.is('video')){
        content[0].play();
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

MapCam.prototype.hideMedia = function(){
	$("#overlay").fadeOut(500);
}
