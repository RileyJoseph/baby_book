$(function(){


  // BABIES INDEX AJAX CALLS

  // Clear baby modal once modal closes
  $('#babyModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

  // Clear edit modal once modal closes
  $('#editModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

  // AJAX data create for babies
  $('#babyModal').on('submit','form',function(event){
    event.preventDefault();
    var form = $(this);
    $.ajax({
      url:form.attr('action'),
      method:form.attr('method'),
      data:form.serialize()
    }).done(function(data){
      $('.babies-row').html(data);
      $('#babyModal').modal('hide');
    }).error(function(err){
      alert('Something Broke');
      console.log(err);
    });
  });

  // STATISTICS PAGE AJAX CALLS

  // Clear Stats modal once modal closes
  $('#myModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

  // AJAX data create for stats
  $('#myModal').on('submit', 'form', function(event){
    event.preventDefault();
    var form = $(this);
    $.ajax({
      url:form.attr('action'),
      method:form.attr('method'),
      data:form.serialize()
    }).done(function(data){
      $('.baby-recent tbody').html(data);
      $('#myModal').modal('hide');
    }).error(function(err){
      alert('Something Broke');
      console.log(err);
    });
  });

  // initialize slideshow on click event for modal show
  $('#eventModal').on('loaded.bs.modal', function(){
    console.log("hellllo", $(this).find(".slider-wrapper"))
      $(this).find(".slider-wrapper").sliderReverse({
        animateType   : false,
        autoPlaySpeed : 5000,
        btnsText      : {
          next      : '<span class="side-nav glyphicon glyphicon-chevron-right" aria-hidden="true"></span>',
          prev      : '<span class="side-nav glyphicon glyphicon-chevron-left" aria-hidden="true"></span>',
          play      : "Play",
          pause     : "Pause"
        },
        hoverPause    : true,
        navigation    : true,
        speed         : "normal",
        swipe         : true,
        swipeLimit    : 100,
        responsive    : true,
        width         : "500px"
      });

      // toggle button colors on slider
        if (gon.baby) {
          if (gon.baby.gender === "boy") {
          console.log("its a boy")
            $('.slider-btns').css('background-color','#AAD8F1')
            $('.slider-play-toggle').css('background-color','#AAD8F1')
          } else {
            console.log("its a girl")
            $('.slider-btns').css('background-color','#FDADBA')
            $('.slider-play-toggle').css('background-color','#FDADBA')
          }
        }
  });


  // EVENTS PAGE AJAX CALLS
  // Clear Stats modal once modal closes
  // Clear Slideshow from see more modal when closed
  $('#eventModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
    // finds slideshow timer button, removes class to stop timer, triggers click event automatically
    $(this).find(".slider-play-toggle").removeClass('pause').trigger("click")
    $(this).find(".modal-content").html("")
  });

});