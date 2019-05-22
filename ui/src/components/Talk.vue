<template>
  <div class="talk-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Talk.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <ul v-else>
          <li v-for="location of data.Location" class="location-list-item" v-bind:key="location">
            <span class="locationnames">{{ location.name }}</span><span>{{location.state}}, {{location.city}}</span>
            <div v-for="talk of location.talks" v-bind:key="talk">
            <span>{{talk.name}}</span><span>{{talk.type}}:{{talk.description}}</span>
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
    }  
}
}


</script>

<style scoped>

</style>

