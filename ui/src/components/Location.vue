<template>
  <div class="location-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Location.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <ul v-else>
          <li v-for="locationnames of data.Location" class="location-list-item">
            <span class="locationnames">{{ locationnames.name }} </span><span>({{locationnames.state}}-{{locationnames.city}})</span>
          </li>
        </ul>
      </template>
    </ApolloQuery>
  </div>
</template>

<script>

export default {
    data () { return {
    }
}
}


</script>

<style scoped>

.location-main ul {
    list-style-type: none;
}

.location-list-item {
  padding: 10px;
  background-color: rgb(202, 197, 199);
  width: 1000px;
}

.location-list-item span:last-child {
 color: crimson;
 font-size: smaller;
}

</style>

