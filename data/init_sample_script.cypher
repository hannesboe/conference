create (c:Conference {name: "Global Innovation Summit" , startDate: "2019-08-25", endDate: "2019-08-29"})-[t:TAKES_PLACE]->(l:Location {state:"USA", city: "New York", address: "New Yor Street 14", name: "Hotel Conference Room"})

create (c:Conference {name: "IFA 2018" , startDate: "2019-09-06", endDate: "2019-09-11"})-[t:TAKES_PLACE]->(l:Location {state:"Germany", city: "Berlin", address: "Berlin Street 14", name: "Hotel Conference Room"})

create (c:Conference {name: "ApacheCon" , startDate: "2019-09-09", endDate: "2019-09-12"})-[t:TAKES_PLACE]->(l:Location {state:"USA", city: "Las Vegas", address: "Las Vegas Street 14", name: "Hotel Conference Room"})

create (c:Conference {name: "Gartner Digital Workplace & Summit" , startDate: "2019-09-12", endDate: "2019-09-13"})-[t:TAKES_PLACE]->(l:Location {state:"England", city: "London", address: "London Street 14", name: "Hotel Conference Room"})

match (c:Location) 
CREATE (c)-[:IN]->(:Room {id:1, name: "Room A", size: 200, description: "big room sith beamer"})
CREATE (c)-[:IN]->(:Room {id:2, name: "Room B", size: 100, description: ""})
CREATE (c)-[:IN]->(:Room {id:3, name: "Room C", size: 500, description: "workgroup room"})
CREATE (c)-[:IN]->(:Room {id:4, name: "Room D", size: 300, description: "no food"})
CREATE (c)-[:IN]->(:Room {id:5, name: "Room E", size: 700, description: "keynote room"})

create (s:Speaker {firstName: "Tan", lastName: "Le", role:"CEO", company: "Emotiv", mail: "tan.le@emotiv.com"})-[:HOLDS]->(t:Talk {name: "", description: ""});

create (s:Speaker {firstName: "Steve", lastName: "Wozniak", role:"Cult Icon", company: "", mail: "steve.wozniak@mail.com"})-[:HOLDS]->
(t:Talk {name: "Blockchain", description: "In depth investment blockchain"})
create (s)-[:HOLDS]->(:TALK { name: "", description: ""})
create (s)-[:HOLDS]->(:TALK { name: "", description: ""});

create (s:Speaker {firstName: "Adnan", lastName: "Abdulhussein", role:"Software Engineer", company: "Bitnami", mail: "adnan.abdulhussein@bitnami.com"})-[:HOLDS]->(t:Talk 
{name: "Intro + Deep Dive: Apps SIG", description: "Kubernetes SIG Apps covers developing, deploying, and operating applications on Kubernetes with a focus on the application developer and application operator experience. In this deep dive we will look at the general experience for application developers and operators along with specifics of the Workloads API and Application CRD. The topics discussed will be based on the desires of those in attendance and the conversation will go where attendees would like it to go."})

create (:Speaker {firstName: "Michelle", lastName: "Casbon", role:"Senior Engineer", company: "Google", mail: "michael@google.com"})
create (:Speaker {firstName: "David", lastName: "Aronchick", role:"Program Manager", company: "Microsoft", mail: "aronchick@microsoft.com"})
create (:Speaker {firstName: "Jonathan Juares", lastName: "Beber", role:"Distinguished Engineer", company: "IBM", mail: "dberg@ibm.com"})
create (:Speaker {firstName: "Ria", lastName: "Bhatia", role:"Program Manager", company: "Microsoft", mail: "riarabita@microsoft.com"})
create (:Speaker {firstName: "Dan", lastName: "Berg", role:"Senior Engineer", company: "Google", mail: "michael@google.com"})
create (:Speaker {firstName: "Taylor", lastName: "Carpenter", role:"Partner", company: "Vulk Coop ", mail: "taylor.carpender@vulk.com"})

create (:Talk {name: "Connect from Browsers Using gRPC-Web", description: "", type:"talk", commission:"free"})
create (:Talk {name: "V	Linkerd in Production 101 by Buoyant ", description: "This is a hands-on workshop that teaches how to use Linkerd in production, covering both Kubernetes and non-Kubernetes environments. This workshop is presented by Buoyant, the primary sponsors of the Linkerd project, and includes training by Linkerd maintainers.", type:"workshop", commission:"free"})
create (:Talk {name: "LF Networking Reception", description: "LF Networking, an initiative at the Linux Foundation made up of several prominent projects in the open networking stack — FD.io, ONAP, OpenDaylight, ONFV, PNDA, SNAS, and Tungsten Fabric, will be hosting a reception onsite at KubeCon + CloudNativeCon North America.", type:"talk", commission:"free"})
create (:Talk {name: "Real-time Vision Processing on Kubernetes: Working with Data Locality - Yisui Hu, Google ", description: "Kubernetes as a general purpose cloud native application platform simplifies the operation of applications. Data processing is one of the common of applications that benefit from the power of Kubernetes. However attempting real-time computer vision processing on Kubernetes isn't that straightforward, as the maximum processing time for a single frame is expected to be less than 30ms to reach 30fps or no more than 60ms (15fps, start being laggy). This presentation demonstrates the actual issues, feature gaps encountered and workarounds applied running a real-time vision pipeline on Kubernetes from the presenter's hobby robotics project. The pipeline involves a few image pre-processing tasks, a ML model (SSD mobilenet) for object detection and depth estimation with a single camera. The biggest challenge is how to distribute the tasks across nodes with data locality in consideration.", type:"talk", commission:"free"})
create (:Talk {name: "Experience Report: Running a Distributed System Across Kubernetes Clusters" , description: "Kubernetes makes it easy to run distributed applications, even those that manage persistent state, within the confines of a single cluster. Running the same applications in a multi-region or multi-cloud fashion across multiple Kubernetes clusters, however, is considerably more difficult due to the networking and service discovery problems involved.", type:"talk", commission:"free"})
create (:Talk {name: "	Tutorial: Developing Production Ready Cloud Native NATS Applications", description: "Learn how to develop secure and reliable cloud native applications using NATS simple but powerful pub/sub messaging features. In this tutorial, members of the core NATS team will show how to implement from scratch a service that uses NATS with all the recommended best practices for production operation.", type:"talk", commission:"free"})
create (:Talk {name: "C	Using Istio and GKE On Prem to Manage On-Prem Data Center Downtime and Maintenance", description: "In this workshop, we will show how to combine Istio, GKE, and GKE On Prem to handle common data center operations. First, we will go through the steps of deploying Istio across environments and setting up Istio routing rules. Next we will show how you can use Kubernetes cron jobs to push traffic to the cloud for scheduled on-prem downtime and configure a “watchdog” to prioritize traffic to the cloud in the event of a traffic spike that your on-prem cannot handle.", type:"workshop", comission:"free"})
create (:Talk {name: "The Cloud Native Culture & Industry Summit by Oracle" , description: "
About the Summit
Join some of the industry's top cloud native minds for a concentrated dose of technical talks paired with hands-on learning.
We’ll host an innovator’s panel, cover all things serverless, including the Fn Project, how to extend Kubernetes to ease application development, how to deploy secure, agile microservices on top of Kubernetes, and much more.
You won’t want to miss the Cloud Native Past, Present, and Future panel as it's chock full of your favorite practitioners, innovators, and maintainers including Kris Nova, Ashley McNamara, John Harris, and more. They will delve into milestones of our evolution, what’s driving key technology choices today, and how innovation is being defined for the future. These influencers will hash out what’s at stake and distill what really matters.
Hear from the creator of the Fn Project, the container-native serverless platform, and former Co-Founder and CEO of Iron.IO, Chad Arimura, and from an HPC Fn user, Christopher Woods of the University of Bristol, who is pushing the boundaries of compute with open source", type:"workshop", comission:"free"})

create (it:Topic {name: "Information Technology"}) 
create (it)-[:IS_PARENT]->(db:Topic {name: "Databases"})
create (it)-[:IS_PARENT]->(cc:Topic {name: "Cloud Computing"})
create (it)-[:IS_PARENT]->(n:Topic {name: "Networking"})
create (cc)-[:IS_PARENT]->(k:Topic {name: "Kubernetes"})
create (k)-[:IS_PARENT]->(sm:Topic {name: "Service Mesh"})
create (it)-[:IS_PARENT]->(do:Topic{name:"DevOps"})
create (it)-[:IS_PARENT]->(f:Topic {name:"Frontend"})
create (f)-[:IS_PARENT]->(spa:Topic {name:"Single Page Application"})
create (cc)-[:IS_PARENT]->(sm)
create (n)-[:IS_PARENT]->(:Topic {name: "IPV6"})
create (it)-[:IS_PARENT]->(:Topic {name: "Security"})
create (n)-[:IS_PARENT]->(lb:Topic {name: "Load Balancer"})
create (k)-[:IS_PARENT]->(lb)


match (r:Room)--(l:Location) set r.id = l.state + ID(r);

match (s1:Speaker) where s1.firstName = "Taylor"
match (s2:Speaker) where s2.firstName = "Adnan"
match (r:Room) where r.id = "USA30"
match (t:Talk) where t.id = "TALK8"
create (a:Allocation { startDateTime:"2019-09-10T12:00:00.0000Z", endDateTime:"2019-09-10T14:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:HAS_ASSIGNED]-> (s2)
create (a)-[:IS_ABOUT]->(t)


match (s1:Speaker) where s1.firstName = "Taylor"
match (s2:Speaker) where s2.firstName = "Adnan"
match (r:Room) where r.id = "USA30"
match (t:Talk) where t.id = "TALK8"
create (a:Allocation { startDateTime:"2019-09-10T12:00:00.0000Z", endDateTime:"2019-09-10T14:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:HAS_ASSIGNED]-> (s2)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "Michelle"
match (r:Room) where r.id = "USA27"
match (t:Talk) where t.id = "TALK14"
create (a:Allocation { startDateTime:"2019-09-15T08:00:00.0000Z", endDateTime:"2019-09-15T10:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "David"
match (r:Room) where r.id = "Germany13"
match (t:Talk) where t.id = "TALK61"
create (a:Allocation { startDateTime:"2019-09-06T08:00:00.0000Z", endDateTime:"2019-09-06T10:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "Jonathan Juares"
match (r:Room) where r.id = "Germany13"
match (t:Talk) where t.id = "TALK75"
create (a:Allocation { startDateTime:"2019-09-06T13:00:00.0000Z", endDateTime:"2019-09-06T15:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "Jonathan Juares"
match (r:Room) where r.id = "Germany13"
match (t:Talk) where t.id = "TALK76"
create (a:Allocation { startDateTime:"2019-09-06T13:00:00:00.0000Z", endDateTime:"2019-09-06T15:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "Ria"
match (r:Room) where r.id = "Germany13"
match (t:Talk) where t.id = "TALK78"
create (a:Allocation { startDateTime:"2019-09-06T17:00:00:00.0000Z", endDateTime:"2019-09-06T18:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)

match (s1:Speaker) where s1.firstName = "Adnan"
match (r:Room) where r.id = "USA36"
match (t:Talk) where t.id = "TALK77"
create (a:Allocation { startDateTime:"2019-09-06T15:00:00:00.0000Z", endDateTime:"2019-09-06T17:00:00.0000Z"})
-[:HELD_IN]->(r)
create (a)-[:HAS_ASSIGNED]-> (s1)
create (a)-[:IS_ABOUT]->(t)


match (t:Topic {name: "Single Page Application"})
match (ta:Talk {id : "TALK8"})
create (t)<-[:BELONGS_TO]-(ta)

match (t:Topic {name: "Service Mesh"})
match (ta:Talk {id : "TALK14"})
match (ta2:Talk {id : "TALK77"})
create (t)<-[:BELONGS_TO]-(ta)
create (t)<-[:BELONGS_TO]-(ta2)

match (t:Topic {name: "Kubernetes"})
match (ta1:Talk {id : "TALK77"})
match (ta2:Talk {id : "TALK75"})
match (ta3:Talk {id : "TALK61"})
create (t)<-[:BELONGS_TO]-(ta1)
create (t)<-[:BELONGS_TO]-(ta2)
create (t)<-[:BELONGS_TO]-(ta3)

match (t:Topic {name: "Cloud Computing"})
match (ta1:Talk {id : "TALK76"})
match (ta2:Talk {id : "TALK78"})
create (t)<-[:BELONGS_TO]-(ta1)
create (t)<-[:BELONGS_TO]-(ta2)

match (t:Topic {name: "Service Mesh"})
match (ta:Talk {id : "TALK14"})
create (t)<-[:BELONGS_TO]-(ta)

match (t:Topic {name: "Networking"})
match (ta:Talk {id : "TALK42"})
create (t)<-[:BELONGS_TO]-(ta);

match (t:Topic {name: "Databases"})
match (ta:Talk {id : "TALK78"})
create (t)<-[:BELONGS_TO]-(ta);
