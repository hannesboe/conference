<template>
  <div class="talk-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Talk.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <ul v-else class="talks">
          <li v-for="locationObj of data.Location" class="location-list-item">
          <div v-if="locationObj.talks && locationObj.talks.length" class="talk-container">
            <h2 class="location">{{locationObj.state}}, {{locationObj.city}} - {{ locationObj.name }}</h2>

            <div v-for="talk of locationObj.talks" class="talk-items">
            <span class="talk-header">{{talk.name}}{{talk.type}}: </span><br/><div class="description">{{talk.description}}</div>

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
  margin-left: 10px;
  font-style:italic;
  font-variant:full-width;
}

.talks div.talk-items > span.talk-header {
  font-size:larger;
  font-weight: bold;
  margin-left: 30px;
}

.talks div.talk-items > span.talk-header {
  font-size:larger;
  font-weight: bold;
  margin-left: 30px;
}

.talk-container div.description {
  margin-left: 50px;
  color: darkred;
  font-size: smaller;

}
</style>

