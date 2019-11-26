// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueAxios from 'vue-axios'
import VModal from 'vue-js-modal'
// import VueBus from 'vue-bus'
import ActionCableVue from 'actioncable-vue'
import VueMoment from 'vue-moment'
import '@/assets/styles/tailwind.css'

import { securedAxiosInstance, plainAxiosInstance } from './backend/axios'

Vue.config.productionTip = false

Vue.use(VModal, { dynamic: true, injectModalsContainer: true })
// Vue.use(VueBus)
Vue.use(VueMoment)

Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

Vue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'error',
  connectionUrl: 'ws://localhost:3000/cable',
  connectImmediately: true
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  securedAxiosInstance,
  plainAxiosInstance,
  components: { App },
  template: '<App/>'
})
