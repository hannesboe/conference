// 2017 KubeCon

CREATE (l:Location {id: "northamerica2017", state: "USA", city: "Texas", address: "Conference Location", zip: "73301"})
CREATE  (c:Conference {id: "id1", name: "KubeCon + CloudNativeCon North America 2017", startDate: "2017-12-04", endDate: "2017-12-08"})
MERGE (c)-[:TAKES_PLACE]->(l);

LOAD CSV WITH HEADERS FROM 'file:///2017_kubeTalks.csv' AS line FIELDTERMINATOR ';'
CREATE (t:Talk {id: line.talkid, title: line.title, type: line.type, description: line.description, skill: line.skill})
MERGE (r:Room {name : line.room})
MERGE (r)<-[:HELD_IN]-(a:Allocation {talkid: line.talkid, from: line.fromIso, to: line.toIso})
CREATE (t)<-[:IS_ABOUT]-(a)
WITH r
MATCH (l:Location) where l.id = "northamerica2017"
MATCH (c:Conference) where c.id = "id1"
MERGE (l)-[:IN]->(r);

LOAD CSV WITH HEADERS FROM 'file:///2018_kubeSpeakers.csv' AS line FIELDTERMINATOR ';'
MATCH (a:Allocation {talkid: line.talkid})
CREATE (a)-[:HAS_ASSIGNED]->(s:Speaker {name: line.name, role: line.role, bio: line.bio});


// 2018 KubeCon


CREATE (l:Location {id: "northamerica2018", state: "USA", city: "Seattle", address: "705 Pike St", zip: "98101"})
CREATE (c:Conference {id: "id2", name: "KubeCon + CloudNativeCon North America 2018", startDate: "2018-10-10", endDate: "2017-10-13"})
MERGE (c)-[:TAKES_PLACE]->(l);

LOAD CSV WITH HEADERS FROM 'file:///2018_kubeTalks.csv' AS line FIELDTERMINATOR ';'
CREATE (t:Talk {id: line.talkid, title: line.title, type: line.type, description: line.description, skill: line.skill})
MERGE (r:Room {name : line.room})
MERGE (r)<-[:HELD_IN]-(a:Allocation {talkid: line.talkid, from: line.fromIso, to: line.toIso})
CREATE (t)<-[:IS_ABOUT]-(a)
WITH r
MATCH (l:Location) where l.id = "northamerica2018"
MATCH (c:Conference) where c.id = "id2"
MERGE (l)-[:IN]->(r);

LOAD CSV WITH HEADERS FROM 'file:///2018_kubeSpeakers.csv' AS line FIELDTERMINATOR ';'
MATCH (a:Allocation {talkid: line.talkid})
CREATE (a)-[:HAS_ASSIGNED]->(s:Speaker {name: line.name, role: line.role, bio: line.bio});



// 2019 KubeCon


CREATE (l:Location {id: "spain2019", state: "Spain", city: "Barcelona", address: "  Fira Gran Via", zip: "08908"})
CREATE (c:Conference {id: "id3", name: "KubeCon + CloudNativeCon Europe 2019", startDate: "2019-05-20", endDate: "2010-05-23"})
MERGE (c)-[:TAKES_PLACE]->(l);

LOAD CSV WITH HEADERS FROM 'file:///2019_kubeTalks.csv' AS line FIELDTERMINATOR ';'
CREATE (t:Talk {id: line.talkid, title: line.title, type: line.type, description: line.description, skill: line.skill})
MERGE (r:Room {name : line.room})
MERGE (r)<-[:HELD_IN]-(a:Allocation {talkid: line.talkid, from: line.fromIso, to: line.toIso})
CREATE (t)<-[:IS_ABOUT]-(a)
WITH r
MATCH (l:Location) where l.id = "spain2019"
MATCH (c:Conference) where c.id = "id3"
MERGE (l)-[:IN]->(r);

LOAD CSV WITH HEADERS FROM 'file:///2019_kubeSpeakers.csv' AS line FIELDTERMINATOR ';'
MATCH (a:Allocation {talkid: line.talkid})
CREATE (a)-[:HAS_ASSIGNED]->(s:Speaker {name: line.name, role: line.role, bio: line.bio});


// Topics Taxonomy

LOAD CSV WITH HEADERS FROM 'file:///kubeTopicsTaxonomy.csv' AS line FIELDTERMINATOR ';'
CREATE (t:Topic {id: line.topicid, topic: line.name})
WITH t, line
MATCH (h:Topic {id: line.parentid})
CREATE (h)-[:IS_PARENT]->(t);

MATCH (ta:Talk), (to:Topic)
where ta.type STARTS WITH to.topic
CREATE (to)-[:REFERS_TO]->(ta);
