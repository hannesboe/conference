LOAD CSV WITH HEADERS FROM 'file:///2017_kubeTalks.csv' AS line FIELDTERMINATOR ';'
CREATE (:Talk {id: line.talkid, title: line.title, type: line.type, description: line.description, skill: line.skill});

LOAD CSV WITH HEADERS FROM 'file:///2017_kubeTalks.csv' AS line FIELDTERMINATOR ';'
MATCH (t:Talk {id: line.talkid})
MERGE (r:Room {name : line.room})
MERGE (r)<-[:HELD_IN]-(a:Allocation {talkid: line.talkid, from: line.fromIso, to: line.toIso})
CREATE (t)<-[:IS_ABOUT]-(a)

LOAD CSV WITH HEADERS FROM 'file:///2017_kubeSpeakers.csv' AS line FIELDTERMINATOR ';'
MATCH (a:Allocation {talkid: line.talkid})
CREATE (a)-[:HAS_ASSIGNED]->(s:Speaker {name: line.name, role: line.role});

CREATE (c:Conference {id: "id1", name: "KubeCon + CloudNativeCon North America 2017", startDate: "2017-12-04", endDate: "2017-12-08"})
CREATE (c)-[:TAKES_PLACE]->(l:Location {id: "northamerica2017", state: "USA", city: "Texas", address: "Conference Location", zip: "73301"})

match (r:Room) match (l:Location)
CREATE (l)-[:IN]->(r)

LOAD CSV WITH HEADERS FROM 'file:///topics.csv' AS line FIELDTERMINATOR ';'
CREATE (t:Topic {id: line.id, topic: line.topic})
WITH t, line
MATCH (h:Topic {id: line.parent})
create (h)-[:IS_PARENT]->(t);
