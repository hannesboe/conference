<template>
  <div class="conference-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Conference.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading, error } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <div v-else-if="!data || !data.Conference && !data.Conference.length"></div>
        <ul v-else>
          <li v-for="conferenceObj of data.Conference" class="conference-list-item">
            <span class="confnames">{{ conferenceObj.name }}</span><span>{{conferenceObj.startDate}} - {{conferenceObj.endDate}}</span>
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
