import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
import Signin from '@/components/Signin'
import Signup from '@/components/Signup'
import Salas from '@/components/Salas'
import Sala from '@/components/Sala'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/salas',
      name: 'Salas',
      component: Salas
    },
    {
      path: '/salas/:id',
      name: 'Sala',
      component: Sala
    }
  ]
})
