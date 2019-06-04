import Vue from 'vue'
import App from './App.vue'
import { createProvider } from './vue-apollo'
import router from './router';

// our plugin for authentication/authorization services
import AuthPlugin from "./plugins/auth";
import VueMaterial from 'vue-material';
import VueJquery from 'vue-jquery';
import 'vue-material/dist/vue-material.css';
import 'vue-material/dist/vue-material.js';

import Account from "vue-material-design-icons/AccountArrowRight.vue";
import MapMarker from "vue-material-design-icons/MapMarker.vue";


Vue.use(AuthPlugin);
Vue.use(VueMaterial);
Vue.use(VueJquery);
Vue.component("account", Account)
Vue.component("map-marker", MapMarker)

Vue.config.productionTip = false;

new Vue({
  router,
  apolloProvider: createProvider({"cors":"*"}),
  render: h => h(App)
}).$mount('#app')
