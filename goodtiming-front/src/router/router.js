import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '../views/Dashboard.vue'
import Stopwatch from '@/components/Stopwatch'
import Home from '../views/Home.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/stopwatches/:id',
      name: 'Stopwatch',
      props: true,
      component: Stopwatch
    }
  ]
})
