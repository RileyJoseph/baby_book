document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  var babyInfo = $('.temp_information').data('temp')


  for(var i = 0; i < babyInfo.length; i++ ) {
    var temp = moment()._d
        if (moment( babyInfo[0].date)._d < temp) {
          temp = moment( babyInfo[0].date)._d
        }
      }
    var start = moment(temp).subtract(90,"days")._d
    var present = moment()._d
    var end = moment(temp).add(5,"years")._d


  var baby = []
  for (var i = 0; i < babyInfo.length; i++) {
    baby[i] = {}
    var showId = babyInfo[i].id
    baby[i].id = i
    baby[i].content = "<p class='caption' data-toggle='modal' data-target='#myModal' href= events/" + showId + ">" +
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
    min: start,
    max: end,
    start: start,
    end: present,
    moveable: true,
    showCurrentTime: true,
    editable: {
      add: true,         // add new items by double tapping
      updateTime: true,  // drag items horizontally
      updateGroup: true

    }
  };

  // Create a Timeline
  var timeline = new vis.Timeline(
    container,
    items,
    options
    );

// $('#adjust').on('click', function() {

//   var options = {
//     orientation: "bottom",
//     height: 250,
//     min: start,
//     max: end,
//     start: start,
//     end: present,
//    moveable: true,
//     showCurrentTime: true,
//     editable: {
//       add: true,         // add new items by double tapping
//       updateTime: true,  // drag items horizontally
//       updateGroup: true
//       moveable: true,// drag items from one group to another
//    // delete an item by tapping the delete button top right
//     }
//   };
// })




  // $('#myModal').on('hidden.bs.modal', function(){
  //   $(this).removeData('bs.modal');
  // });


});