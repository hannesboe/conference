<template>
  <div class="conference-main container">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Conference.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Conference && !data.Conference.length"></div>
        <table v-else class="highlight">
            <thead>
            <tr>
          <th>All Conferences</th>
          <th>Start</th>
          <th>End</th>
          </tr>
            </thead>
            <tbody>
          <tr v-for="conferenceObj of data.Conference" class="collection-item">
            <td class="confnames">{{ conferenceObj.name }}</td><td>{{conferenceObj.startDate}}</td> <td>{{conferenceObj.endDate}}</td>
          </tr>
          </tbody>
        </table>
      </template>
    </ApolloQuery>
 </div>
</template>

<script>

import 'materialize-css/dist/css/materialize.css';
import 'materialize-css'

export default {
  data () {
    return {
        Conference: []
    }
  }
}
</script>

<style scoped>

 ul {
  list-style-type: none;
}
.conference-list-item {
  padding: 10px;
  background-color: rgb(202, 197, 199);
  width: 1000px;
}

.conference-list-item span {
  display: block;
}

.conference-list-item span:nth-child(2) {
  color: blue;
  font-size: x-small;
}

</style>
