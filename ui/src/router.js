import Vue from 'vue';
import VueRouter from 'vue-router';
import Callback from './components/Callback';
import Conference from './components/Conference';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'home',
    component: Conference
  },
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
