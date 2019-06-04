<template>
  <div class="flyer-main container">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Flyer.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading" class="progress"><div class="indeterminate"></div></div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <ul v-else class="collection with-header">
          <li v-for="locationObj of data.Location" class="">
            <div class="locationnames collection-header"><h5>{{ locationObj.name }}, {{locationObj.state}}, {{locationObj.city}}</h5></div>
            <div v-for="roomObj of locationObj.rooms" class="#f3e5f5 purple lighten-5 collection-body">
            <div v-if="roomObj.allocations && roomObj.allocations.length" class="">
              <div class="room"><span class="room-header">{{roomObj.name}}</span>
              <div class="room-metadata"><span v-if="roomObj.description">{{roomObj.description}}</span>
              <span v-if="roomObj.size">, Capacity:{{roomObj.size}}</span></div></div>
              <div v-for="allocationObj of roomObj.allocations" class="card-panel hoverable blue lighten-4">
                <span class="timeslot align-left">{{getDateString(allocationObj.startDateTime)}} to {{getDateString(allocationObj.endDateTime)}}</span>
                <div  v-for="talkObj of allocationObj.talk" class="talks">
                   <span>{{talkObj.name}}</span>
                   <div v-if="talkObj.topics && talkObj.topics.length">
                        <span  v-for="topicObj of talkObj.topics"  class="badge">
                                    {{topicObj.name}}
                        </span>
                    </div>

                </div>
                <div v-for="speakerObj of allocationObj.speaker" class="speakers blue-grey-text darken-1">
                {{speakerObj.firstName}}, {{speakerObj.lastName}}
                </div>
              </div>
              </div>
            </div>
          </li>
        </ul>
      </template>
    </ApolloQuery>
  </div>
</template>

<script>


export default {
    data () {
        return {
            Location: {}
    }},
    mounted() {

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);});


  },
   methods : {
       getDateString: function(utcDateString) {
           function twoDigit(n){
                return n > 9 ? "" + n: "0" + n;
           }
           let datObj = new Date(utcDateString);
          return datObj.getFullYear() + "-" + (twoDigit(datObj.getMonth() + 1)) + "-" + twoDigit(datObj.getDate()) + " " + twoDigit(datObj.getHours()) + ":" + twoDigit(datObj.getMinutes());
       }
   }

}
</script>

<style scoped>

.room {
    padding:10px;
}

.room-header {
    margin-left: 10px;
    font-style: italic;
    font-size: larger;
    font-weight: bolder;
}
.room-metadata {
    font-stretch: expanded;
    margin-left: 10px;
    text-transform: uppercase;
}
.timeslot {

    font-weight: bolder;
    margin: 5px;
}
.talks {
    margin-left: 20px;
}

.speakers {
    margin-left: 20px;
    font-style: italic;


}

</style>

