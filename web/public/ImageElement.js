// Base class for things made out of an image
// that need to know what the size of their image
// before any css shenanigans goes on is

// The 'done' function is called once the image is actually loaded and the size is know.


function ImageElement(url,done){
     
    var element = this;
    this.image = $("<img/>")
        .attr("src",url)
        .load(function() {
            element.width = this.width;   // Note: $(this).width() will not
            element.height = this.height; // work for in memory images.
            done();
        })

} 
