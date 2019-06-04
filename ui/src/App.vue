<template>
  <div id="conference-app">
      <nav class="blue">
          <div class="nav-wrapper">
          <a href="#" class="brand-logo right">Conference</a>
              <ul id="nav-mobile" class="left hide-on-med-and-down">
          <li v-for="item in navheaders" v-bind:key="item.name" v-on:click="activeComponent=item.component">
              <a>{{ item.name }}</a>
          </li>
          <li class="right" v-if="!isAuthenticated" href="#" @click.prevent="login"><a>Login <account/> </a></li>
          <li class="right" v-if="isAuthenticated" href="#" @click.prevent="logout"><a>Logout</a></li>
          </ul>
          </div>
      </nav>
      <div class="content">
         <component v-bind:is="activeComponent"/>
    </div>
    <router-view></router-view>

  </div>
</template>

<script>
import Conference from './components/Conference.vue'
import Location from './components/Location.vue'
import Talk from './components/Talk.vue'
import Flyer from './components/Flyer.vue'

export default {
  name: 'app',
  components: {
    Conference, Location, Talk, Flyer
  },
  data() {
      return {
        isAuthenticated: false,
        navheaders: [
           {name : "Conferences", component : "Conference"},
           {name: "Locations", component: "Location"},
           {name: "Talks", component: "Talk"},
           {name: "Room-Flyer", component: "Flyer"},
        ],
        activeComponent :  ''
      }
  },
   async created() {
    try {
      await this.$auth.renewTokens();
    } catch (e) {
      console.log(e);
    }
  },
    methods: {
    login() {
        this.$auth.login();
    },
    logout() {
        this.$auth.logOut();
    },
     handleLoginEvent(data) {
      this.isAuthenticated = data.loggedIn;
      this.profile = data.profile;
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

.topnav a.login {
  float:right;
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
