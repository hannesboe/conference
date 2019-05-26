import Vue from 'vue';
import VueRouter from 'vue-router';
import Callback from './components/Callback';

Vue.use(VueRouter);

const routes = [
  {
    path: '/callback',
    name: 'callback',
    component: Callback
  }
];

const router = new VueRouter({
  mode: 'history',
  routes
});

export default router;
