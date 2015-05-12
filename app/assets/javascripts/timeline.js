document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  var babyInfo = $('.temp_information').data('temp')

  var zoomLevelSmall = 2629746000 * 4

  var zoomLevelBig = 68373396000

// Find baby birthdate, current time, adjust timeline scale accordingly
  var temp = moment()._d
  for(var i = 0; i < babyInfo.length; i++ ) {
        if (moment(babyInfo[i].date)._d < temp) {
          temp = moment(babyInfo[i].date)._d
        }
      }

    var birth = moment(temp).subtract(180,"days")._d
    var present = moment()._d
    var end = moment(present).add(90,"days")._d
    if (moment().subtract(3, "years")._d > birth) {
      var start = moment().subtract(3,"years")._d
    } else {
      var start = birth;
    }


// Create baby events JSON for timeline
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
    min: birth,
    max: end,
    start: start,
    end: present,
    moveable: false,
    zoomMin: zoomLevelSmall,
    zoomMax: zoomLevelBig,
    showCurrentTime: false,
    editable: {
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

  console.log(timeline)



var zoomOut = function() {
  $('#zoom-out').on('click', function() {
  console.log("working")
  if (zoomLevelBig < 68373396000) {
    zoomLevelBig = zoomLevelBig + (zoomLevelSmall * 2)
      timeline.setOptions(options = {
        min: birth,
        max: end,
        start: start,
        end: present,
        zoomMax: zoomLevelBig
      })
    }
  })
}

zoomOut()

var zoomIn = function() {
  $('#zoom-in').on('click', function() {
  console.log("working")
  if (zoomLevelBig > 2629746000 * 4) {
    zoomLevelBig = zoomLevelBig - (2629746000 * 2)
    console.log(zoomLevelBig)
      timeline.setOptions(options = {
        min: birth,
        max: end,
        start: start,
        end: present,
        zoomMax: zoomLevelBig
      })
    }
  })
}

zoomIn()

$('#scroll-on').on('click', function(){
   timeline.setOptions(options = {
    moveable: true
   });
   zoomIn()
   zoomOut()
   $('#scroll-on').hide()
   $('#scroll-off').show()

})


$('#scroll-off').on('click', function() {
  timeline.setOptions(options = {
    moveable: false
   });
   zoomIn()
   zoomOut()
   $('#scroll-off').hide()
   $('#scroll-on').show()
})




});