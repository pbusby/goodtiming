import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueAxios from 'vue-axios'
import { plainAxiosInstance } from './backend/axios'

Vue.config.productionTip = false

Vue.use(VueAxios, {
  plain: plainAxiosInstance
})

new Vue({
  router,
  store,
  plainAxiosInstance,
  render: h => h(App)
}).$mount('#app')
