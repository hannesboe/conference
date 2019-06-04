<template>
  <div class="talk-main container">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Talk.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <ul v-else class="collection with-header">
        <li class="collection-header"><h5>Conference Talks</h5></li>
          <li v-for="locationObj of data.Location" class="collection-item">
          <div v-if="locationObj.talks && locationObj.talks.length" class="talks">
            <div v-for="talk of locationObj.talks" class="talk-items card-panel hoverable blue lighten-4">
                <span class="talk-header">{{talk.name}}{{talk.type}}: </span><br/><div class="description">{{talk.description}}</div>
            </div>
               <div class="location right-align blue-text text-darken-4">{{locationObj.state}}, {{locationObj.city}} - {{ locationObj.name }}</div>

            </div>
          </li>
        </ul>
      </template>
    </ApolloQuery>
  </div>
</template>

<script>

export default {
    data () { return {
        Location: [],
        error: {}
    }
}
}


</script>

<style scoped>

.talk-main ul {
    list-style-type: none;
}

.location-list-item {
  padding: 10px;
  background-color: rgb(202, 197, 199);
  width: 1000px;
}

.talk-container .location {
  margin :10px;
  font-size: larger;
}

.talks div.talk-items > span.talk-header {
  font-size:larger;
  font-weight: bold;
  margin-left: 20px;
}


 div.description {
  margin-left: 50px;
  font-size: smaller;
}

</style>

