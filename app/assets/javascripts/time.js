var eventObject = {
    "timeline":
    {
        "headline":gon.baby.name+"'s binkline",
        "type":"default",
    "text":"I was born on "+gon.birthday,
    // Date format is YYY,DD,MM (strftime("%Y,%m,%e"))
    "startDate":gon.bornDate,
        "date": [
                    {
                        "startDate":"2015,05,11",
                        "headline":gon.events[0].topic,
                        "text":gon.events[0].body,
                        "asset":
                        {
                            "media":"http://i.stack.imgur.com/xdkXE.jpg",
                            "credit":"",
                            "caption":""
                        }
                    },
                    {
                        "startDate":"2015,05,11",
                        "headline":gon.events[1].topic,
                        "text":gon.events[1].body,
                        "asset":
                        {
                            "media":"http://www.8daysageek.com/wp-content/uploads/2012/01/tony-stark-bourbon-in-hand.jpg",
                            "credit":"",
                            "caption":""
                        }
                    },
                ]
    }
};


// for (var key in gon.events) {
//    if (gon.events.hasOwnProperty(key)) {
//        var obj = gon.events[key];
//     }
// }

$(document).ready(function() {
    createStoryJS({
        type:       'timeline',
        width:      '1140',
        height:     '525',
        source:     eventObject,
        embed_id:   'my-timeline'
    });
});