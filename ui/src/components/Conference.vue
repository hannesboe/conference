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
          <li v-for="conference of data.Conference" class="conference">
            {{ conference }}
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
.form,
.input,
.apollo,
.message {
  padding: 12px;
}

.conference {
  display:block
}

label {
  display: block;
  margin-bottom: 6px;
}

.input {
  font-family: inherit;
  font-size: inherit;
  border: solid 2px #ccc;
  border-radius: 3px;
}

.error {
  color: red;
}

.images {
  display: grid;
  grid-template-columns: repeat(auto-fill, 300px);
  grid-auto-rows: 300px;
  grid-gap: 10px;
}

.image-item {
  display: flex;
  align-items: center;
  justify-content: center;
  background: #ccc;
  border-radius: 8px;
}

.image {
  max-width: 100%;
  max-height: 100%;
}

.image-input {
  margin: 20px;
}
</style>
