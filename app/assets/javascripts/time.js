// Timeline source. Passed through in DOM within createStoryJS in "source".
var eventObject = {
    "timeline":
    {
        "headline":gon.baby.name+"'s binkline",
        "type":"default",
        "text":"Born on "+gon.birthday,
        // Date format is YYY,DD,MM (strftime("%Y,%m,%e"))
        "startDate":gon.bornDate,
            "asset": {
            // This will be the baby's profile picture
            "media":"http://i.stack.imgur.com/xdkXE.jpg",
            "credit":"",
            "caption":"Isn't it adorable?"
            },
            "date":[]
    }
};

// Loop that creates ticks in the timeline for ever data object passed through in the returning Events array.
// Refer to events_controller.rb to see "gon" (gem) variables.
for (var key in gon.events) {
    var obj = gon.events[key];
    eventObject.timeline.date.push({
                        "startDate":moment.utc(obj.date).format("YYYY,MM,DD").toString(),
                        "headline":obj.topic,
                        "text":obj.body + "<br><a data-toggle='modal' data-target='#eventModal' href='/babies/" + obj.baby_id + "/events/" + obj.id + "'>See more</a><br><a data-toggle='modal' data-target='#eventModal' href='/babies/" + obj.baby_id + "/events/" + obj.id + "/edit'>Edit</a>",
                        "classname":"this-is-a-class-name",
                        "asset":
                        {
                            // This will be the cover photo for the event, however we determine that.
                            "media":gon.media[key].media,
                            // This will be a cropped version of the cover photo.
                            "thumbnail":gon.media[key].thumb,
                            "credit":"",
                            "caption":""
                        }
                    });
}

// DOM Loads timeline. JSON is loaded before timeline is rendered.
$(document).ready(function() {
    createStoryJS({
        type:       'timeline',
        width:      '1140',
        height:     '525',
        source:     eventObject,
        embed_id:   'my-timeline'
    });
});