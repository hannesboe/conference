<template>
  <div class="conference-main">
    <!-- Apollo Query -->
    <ApolloQuery :query="require('@/graphql/Conference.gql')">
      <!-- The result will automatically updated -->
      <template slot-scope="{ result: { data, loading } }">
        <!-- Some content -->
        <div v-if="loading">Loading...</div>
        <div v-else-if="error" class="error apollo">An error occured {{error}} </div>
        <ul v-else>
          <li v-for="conference of data.Conference" class="conference-list-item" v-bind:key="conference">
            <span class="confnames">{{ conference.name }}</span><span>{{conference.startDate}} - {{conference.endDate}}</span>
          </li>
        </ul>
      </template>
    </ApolloQuery>
 </div>
</template>

<script>

export default {
  data: {
     Conference: {}
  },
  data () {
    return {
    }
  },

  apollo: {
  },

  computed: {

  },

  methods: {
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
  width: 500px;
}

.conference-list-item span {
  display: block;
}

.conference-list-item span:nth-child(2) {
  color: blue;
  font-size: x-small;
}

</style>
