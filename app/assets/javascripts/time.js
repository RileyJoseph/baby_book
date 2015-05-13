var eventObject = {
    "timeline":
    {
        "headline":gon.baby.name+"'s binkline",
        "type":"default",
        "text":"I was born on "+gon.birthday,
        // Date format is YYY,DD,MM (strftime("%Y,%m,%e"))
        "startDate":gon.bornDate,
            "date":[]
    }
};

for (var key in gon.events) {
    var obj = gon.events[key];
    eventObject.timeline.date.push({
                        "startDate":moment.utc(obj.date).format("YYYY,MM,DD").toString(),
                        "headline":obj.topic,
                        "text":obj.body,
                        "asset":
                        {
                            "media":"http://i.stack.imgur.com/xdkXE.jpg",
                            "credit":"",
                            "caption":""
                        }
                    });
}

$(document).ready(function() {
    createStoryJS({
        type:       'timeline',
        width:      '1140',
        height:     '525',
        source:     eventObject,
        embed_id:   'my-timeline'
    });
});