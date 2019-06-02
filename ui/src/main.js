import Vue from 'vue'
import App from './App.vue'
import { createProvider } from './vue-apollo'
import router from './router';

// our plugin for authentication/authorization services
import AuthPlugin from "./plugins/auth";

Vue.use(AuthPlugin);

Vue.config.productionTip = false;

new Vue({
  router,
  apolloProvider: createProvider({"cors":"*"}),
  render: h => h(App)
}).$mount('#app')
