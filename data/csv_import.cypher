# create talks
LOAD CSV WITH HEADERS FROM 'file:///kubeTalksQ.csv' AS line FIELDTERMINATOR ';'
CREATE (:Talk {id: line.id, title: line.title, type: line.type, description: line.description, skill: line.skill});


LOAD CSV WITH HEADERS FROM 'file:///kubeTalksQ.csv' AS line FIELDTERMINATOR ';'
MATCH (t:Talk {id: line.id})
MERGE (r:Room {name : line.room})
MERGE (r)<-[:HELD_IN]-(a:Allocation {talkid: line.id, from: line.fromISO, to: line.toISO})
CREATE (t)<-[:IS_ABOUT]-(a)


LOAD CSV WITH HEADERS FROM 'file:///kubeSpeakers.csv' AS line FIELDTERMINATOR ';'
MATCH (a:Allocation {talkid: line.TalkId})
MERGE (a)-[:HAS_ASSIGNED]->(s:Speaker {name: line.Name, role: line.Role});


CREATE (l:Location {id: "kubeConBarca", state: "Spain", city: "Barcelona", address: "Fira Gran Via Carrer de l’Alumini, s/n
, North Entrance Hall 8", zip: "08908"})
CREATE (l)-[:IN]->(:ROOM)
