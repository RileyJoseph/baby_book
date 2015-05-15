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

  // EVENTS PAGE AJAX CALLS
  // Clear Stats and Slideshow modal once modal closes
  $('#eventModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

});