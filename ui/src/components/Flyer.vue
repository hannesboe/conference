<template>
  <div class="flayer-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Flyer.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <ul v-else>
          <li v-for="l1 of data.Location" class="location-list-item" v-bind:key="l1">
            <span class="locationnames">{{ l1.name }}</span><span>{{l1.state}}, {{l1.city}}</span>
            <div v-for="room of l1.rooms" v-bind:key="room">
              <span>{{room.name}}</span><span>{{room.type}}:{{room.description}}</span>

              <div v-for="allocation of room.allocations" v-bind:key="allocation">
                <span>{{allocation.startDateTime}}-{{allocation.endDateTime}}</span>
                <div v-for="speaker of allocation.speaker" v-bind:key="speaker">
                           <span> {{speaker.firstName}}, {{speaker.lastName}} </span>
                </div>
                <div v-for="talk of allocation.talk" v-bind:key="talk">
                           <span>{{talk.id}}</span>
                   <div v-for="topic of talk.topics" v-bind:key="topic">
                             <span>{{topic.name}}</span>
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

