<template>
  <div class="location-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Location.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <ul v-else>
          <li v-for="loc of data.Location" class="location-list-item" v-bind:key="loc">
            <span class="locationnames">{{ loc.name }}</span><span>{{loc.state}}</span>
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

</style>

