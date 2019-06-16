var eve = $('div.sched-container');

$.fn.immediateText = function() {
    return this.contents().not(this.children()).text();
};

# talks, locations

eve.each(function(index) {
  var curreobj =$(this);
  var timeslot = curreobj.find("div.sched-event-details-timeandplace").immediateText().split(" - ");
  var talkName = curreobj.find('a.name').text().split(" - ")[0].trim();
  var id = curreobj.find('a.name').attr('id');
  if (!talkName.startsWith("Registration")) {
    console.log(id+"#\""+curreobj.find("a.name").text().split(" - ")[0].trim() + "\"#"+ curreobj.find("div.sched-event-details > div.sched-event-type a").text().trim()  +"\"#\""+ curreobj.find("div.sched-event-details  div.tip-description").text().trim() +"\"#\"" + curreobj.find("div.sched-event-details  ul.tip-custom-fields li:first-child a").text().trim() +"\"#\""+ timeslot[0].trim() + "\"#\"" + timeslot[0].trim().substring(0,timeslot[0].trim().length-6) + " " + timeslot[1].trim()+"\"#\""+curreobj.find("div.sched-event-details-timeandplace a").text()+"\"")
}});

# speakers

eve.each(function(index) {
  var curreobj =$(this);
  var timeslot = curreobj.find("div.sched-event-details-timeandplace").immediateText().split(" - ");
  var talkName = curreobj.find('a.name').text().split(" - ")[0].trim();
  var id = curreobj.find('a.name').attr('id');
  if (!talkName.startsWith("Registration")) {
    curreobj.find('div.sched-person').each(function() {
    var speakerObj = $(this);
    console.log('"'+id+"\";\""+speakerObj.find('h2').text()+"\";\""+speakerObj.find('div.sched-event-details-role-company').text()+"\";\""+speakerObj.find('div.sched-event-details-role-bio').text()+"\"");
})
}});

# topics

$("[id^=sched-type-] a").each(function(elem) {
 type = $(this);
 console.log("\"" + type.text() + "\"");

});

