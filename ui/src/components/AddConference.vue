<template>
  <div class="add-conference-main">
    <!-- Apollo Query -->
  <ApolloMutation
  :mutation="require('@/graphql/userLogin.gql')"
  :variables="{
    email,
    password,
  }"
  @done="onDone"
>
  <template slot-scope="{ mutate, loading, error }">
    <button :disabled="loading" @click="mutate()">Click me</button>
    <p v-if="error">An error occured: {{ error }}</p>
  </template>
</ApolloMutation>

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
