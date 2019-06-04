<template>
  <div class="location-main container">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Location.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Location || !data.Location.length">No results</div>
        <table v-else class="highlight">
            <thead>
                <tr>
                    <th><map-marker/>Location</th><th>state</th><th>City</th>
                </tr>
            </thead>
            <tbody>
          <tr v-for="locationnames of data.Location">
            <td class="locationnames">{{ locationnames.name }} </td><td>{{locationnames.state}}</td><td>{{locationnames.city}}</td>
          </tr>
            </tbody>
        </table>
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

</style>

