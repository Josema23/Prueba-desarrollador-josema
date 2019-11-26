<template>
  <div class="max-w-sm m-auto my-8">
    <div class="w-full max-w-xs">
      <form class="bg-blue-200 shadow-md rounded px-8 pt-6 pb-8 mb-4" @submit.prevent="signin">
        <div class="text-red" v-if="error">{{error}}</div>
        <h3 class="block text-gray-700 text-lg font-bold mb-2"> Sign in </h3>
        <div class="mb-4">
          <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email Address</label>
          <input type="email" v-model="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email">
        </div>
        <div class="mb-4">
          <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Password</label>
          <input type="password" v-model="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="password">
        </div>

        <button type="submit" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">Sign in</button>

        <div class="my-4">
          <router-link to="/signup" class="font-bold text-sm text-blue-500 hover:text-blue-800">Sign Up</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>

export default {

  name: 'Signin',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },

  created () {
    this.checkSignedIn()
    console.log(localStorage.signedIn)
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signin () {
      this.$http.plain.post('/signin', {email: this.email, password: this.password})
        .then(response => this.signinSuccesful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccesful (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/salas')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },

    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/salas')
      }
    }
  }
}
</script>
