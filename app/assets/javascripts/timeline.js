document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  var babyInfo = $('.temp_information').data('temp')

  var baby = []
  for (var i = 0; i < babyInfo.length; i++) {
    baby[i] = {}
    baby[i].id = i
    var showId = babyInfo[i].id
    baby[i].content =  "<p class='caption' data-toggle='modal' data-target='#myModal' href= events/" + showId + ">" +
                        babyInfo[i].topic + "</p>"
    baby[i].start = babyInfo[i].date
    baby[i].body = babyInfo[i].body
  }


  // Create a DataSet (allows two way data-binding)
  var items = new vis.DataSet(baby);

  // Configuration for the Timeline
  var options = {
    orientation: "bottom",
    height: 250,
    min: "2013",
    max: "2018",
    start: "2013",
    end: "2015",
    // moveable: false,
    showCurrentTime: true,
    editable: {
      add: true,         // add new items by double tapping
      updateTime: true,  // drag items horizontally
      updateGroup: true // drag items from one group to another
   // delete an item by tapping the delete button top right
    }
  };

  // Create a Timeline
  var timeline = new vis.Timeline(
    container,
    items,
    options
    );



  $('#myModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });


});