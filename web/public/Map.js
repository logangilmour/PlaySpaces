// A map class which hosts MapElements. It positions them to their
// desired location by converting their location to percentages based on
// the size of the map (as the map will be set to 100% of the screen)

// Makes a map object that fills 100% width.

// Attributes:
//     data-image is the url of the image of the map

function Map(imageDiv){
    
    var img = imageDiv.data("image");
    var picWidth,picHeight;
    console.log("image url for map: "+img);
    
    this.image = $("<img/>")
        .attr("src",img)
        .load(function() {
            picWidth = this.width;   // Note: $(this).width() will not
            picHeight = this.height; // work for in memory images.
        });

    this.width = picWidth;
    this.height = picHeight; 
    imageDiv.width("100%");
    imageDiv.prepend(this.image);
    this.image.width("100%");
}



