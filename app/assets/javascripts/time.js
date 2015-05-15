$(document).ready(function() {
    if(!gon || !gon.baby) return;
    // Timeline source. Passed through in DOM within createStoryJS in "source".
    var eventObject = {
        "timeline":
        {
            "headline":gon.baby.name,
            "type":"default",
            "text":"Born on "+gon.birthday,
            // Date format is YYY,DD,MM (strftime("%Y,%m,%e"))
            "startDate":gon.bornDate,
                "asset": {
                // This will be the baby's profile picture
                "media":gon.profile,
                "credit":"",
                "caption":""
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
                            "text":obj.body + "<br><a data-toggle='modal' data-target='#eventModal' href='/babies/" + obj.baby_id + "/events/" + obj.id + "'>See Details and Add Pictures</a><br><a data-toggle='modal' data-target='#eventModal' href='/babies/" + obj.baby_id + "/events/" + obj.id + "/edit'>Edit</a>",
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
    };

// DOM Loads timeline. JSON is loaded before timeline is rendered.
    createStoryJS({
        type:       'timeline',
        width:      '100%',
        height:     '525',
        source:     eventObject,
        embed_id:   'my-timeline',
        start_at_end: true,
        font:       'Rancho-Gudea'
    });
});