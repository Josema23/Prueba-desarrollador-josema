<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p10 border-grey-light shadow-rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest"> Sign Up </h3>
      <form @submit.prevent="signup">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="nombre" class="label">Nombre</label>
          <input type="nombre" v-model="nombre" class="input" id="nombre">
        </div>

        <div class="mb-6">
          <label for="email" class="label">Email Address</label>
          <input type="email" v-model="email" class="input" id="email">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="email">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="input" id="password_confirmation">
        </div>

        <button type="submit" class="">Sign up</button>

        <div class="my-4">
          <router-link to="/" class="link">Sign In</router-link>
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
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
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
