<template>
  <div class="flayer-main">
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
            <span class="locationnames">{{ locationObj.name }}</span><span>{{locationObj.state}}, {{locationObj.city}}</span>
            <div v-for="roomObj of locationObj.rooms">
              <span>{{roomObj.name}}</span><span>{{roomObj.type}}:{{roomObj.description}}</span>
              <div v-for="allocationObj of roomObj.allocations">
                <span>{{allocationObj.startDateTime}}-{{allocationObj.endDateTime}}</span>
                <div v-for="speakerObj of allocationObj.speaker">
                           <span> {{speakerObj.firstName}}, {{speakerObj.lastName}} </span>
                </div>
                <div v-for="talkObj of allocationObj.talk">
                           <span>{{talkObj.id}}</span>
                   <div v-for="topicObj of talkObj.topics">
                             <span>{{topicObj.name}}</span>
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
    }
  }
}
</script>

<style scoped>

</style>

