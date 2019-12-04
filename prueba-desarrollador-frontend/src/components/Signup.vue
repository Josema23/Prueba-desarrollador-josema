<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p10 border-grey-light shadow-rounded">
      <form class ="bg-blue-200 shadow-md rounded px-8 pt-6 pb-8 mb-4" @submit.prevent="signup">
        <h3 class="text-2xl mb-6 text-grey-darkest"> Registro </h3>

        <div class="mb-6">
          <label for="nombre" class="block text-gray-700 text-sm font-bold mb-2">Nombre</label>
          <input type="nombre" v-model="nombre" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="nombre">
        </div>

        <div class="mb-6">
          <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email</label>
          <input type="email" v-model="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email">
        </div>

        <div class="mb-6">
          <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Contraseña</label>
          <input type="password" v-model="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email">
        </div>

        <div class="mb-6">
          <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Confirmacion Contraseña</label>
          <input type="password" v-model="password_confirmation" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="password_confirmation">
        </div>

        <div class="text-red-700 py-5" v-if="error">{{ error }} <br></div>
        <button type="submit" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">Registrarse</button>

        <div class="my-4">
          <router-link to="/" class="font-bold text-sm text-blue-500 hover:text-blue-800">Sign In</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>

export default {

  name: 'Signup',
  data () {
    return {
      nombre: '',
      email: '',
      password: '',
      password_confirmation: '',
      error: ''
    }
  },

  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signup () {
      this.$http.plain.post('/signup', {nombre: this.nombre, email: this.email, password: this.password, password_confirmation: this.password_confirmation})
        .then(response => this.signupSuccesful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccesful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/salas')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Algo fue mal'
      delete localStorage.csrf
      delete localStorage.signedIn
    },

    // Donde quiero que me redirija en caso de iniciar sesion

    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/salas')
      }
    }
  }
}
</script>
