import Vue from 'vue'
import Router from 'vue-router'
// import Dashboard from '../views/Dashboard.vue'
import Canvas from '../views/Canvas.vue'
import Stopwatch from '@/views/Stopwatch'
import Stats from '@/components/Stats'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Canvas',
      component: Canvas
    },
    {
      path: '/stats',
      name: 'Stats',
      component: Stats
    },
    {
      path: '/stopwatches/:id',
      name: 'Stopwatch',
      props: true,
      component: Stopwatch
    }
  ]
})
