/**
 * Map Buttons paracitically extend MapElements.
 * They have content that they can send to the Content box when pressed.
 * Pressables can have content that appears/plays only when held added to them.
 * isPermanent 
 */

MapButton.prototype = MapElement.prototype;
function MapButton(element, done){
	MapElement.call(this,element, done);
    
	return this;
}

MapButton.prototype.addPressHandler = function(handler){
  this.element.on("mousedown", handler);
	this.element.on("touchstart", handler);
}

MapButton.prototype.addReleaseHandler = function(handler){
	$(document.body).on("mouseup",handler);
	$(document.body).on("touchend",handler);
}
