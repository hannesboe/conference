<template>
  <div id="conference-app">
      <div class ="topnav">
          <a v-for="item in navheaders" v-bind:key="item.name" v-on:click="activeComponent=item.component">
              {{ item.name }}
          </a>
      </div>
      <div class="content">
         <component v-bind:is="activeComponent"/>
    </div>
  </div>
</template>

<script>
import Conference from './components/Conference.vue'

export default {
  name: 'app',
  components: {
    Conference
  },
  data() {
      return {
        navheaders: [
           {name : "Conferences", component : "Conference"},
           {name: "Locations"},
           {name: "Talks"},
           {name: "Room-Flyer"} 
        ],
        activeComponent :  'Conference'
      }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.topnav {
  background-color: #333;
  overflow: hidden;
}

.content {
  margin: 40px;

}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

</style>
