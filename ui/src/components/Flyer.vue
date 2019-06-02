<template>
  <div class="flyer-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Flyer.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <ul v-else>
          <li v-for="locationObj of data.Location" class="location-list-item">
            <h2 class="locationnames">{{ locationObj.name }}, {{locationObj.state}}, {{locationObj.city}}</h2>
            <div v-for="roomObj of locationObj.rooms">
              <h3>{{roomObj.name}}</h3><span v-if="roomObj.type">Room Type:{{roomObj.type}}{{roomObj.description}}</span>
              <div v-for="allocationObj of roomObj.allocations" class="allocation">
                <span class="timeslot">{{getDateString(allocationObj.startDateTime)}} to {{getDateString(allocationObj.endDateTime)}}</span>
                <div v-for="talkObj of allocationObj.talk" class="talks">
                   <span>{{talkObj.name}}</span>
                   <div v-if="talkObj.topics && talkObj.topics.length">
                    Topics:
                        <span v-for="topicObj of talkObj.topics">
                                    <span>{{topicObj.name}}</span>
                        </span>
                    </div>

                </div>
                <span v-for="speakerObj of allocationObj.speaker" class="speakers">
                {{speakerObj.firstName}}, {{speakerObj.lastName}}
                </span>
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
    }
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

.flyer-main ul {
    list-style-type: none;
}

.location-list-item {
  padding: 10px;
  background-color: rgb(202, 197, 199);
  width: 1000px;
}
.flyer-main .timeslot {
  font-style: oblique;
  font-optical-sizing: auto;
  font-size: 17px;
  margin-left: 20px;
  font-weight: bold;
}

.allocation {
  border: 1px;
  border-style: inset;
  background-color: #E7B3B3;

}

</style>

