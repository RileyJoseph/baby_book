$(function() {

  // globally set cloudName
  cloudinary.setCloudName('hfi2i1sfv');

  var uploadOptions = {
                  upload_preset: 'testing',
                  multiple: true,
                  max_files: 10,
                  max_image_width: 900,
                  max_image_height: 900,
                  thumbnails: '.preview',
                  button_class: 'btn btn-success btn-md add-media-btn',
                  button_caption: '+ Pictures',
                  theme: 'minimal'
                };

  // Cloudinary direct upload via widget
  cloudinary.applyUploadWidget(document.getElementById('upload_widget_opener'), uploadOptions, function(error, result) {
    console.log(error, result)
    var images = result.map(function(image){
      return image.public_id
    })
    // add hidden input values to form
    images.forEach(function(public_id,idx) {
      $('#new_medium').prepend('<input type="hidden" name="url[]" value="' + public_id + '" class="cloudinary-hidden-field" data-cloudinary-public-id="' + public_id + '">');
    });
  });
});
