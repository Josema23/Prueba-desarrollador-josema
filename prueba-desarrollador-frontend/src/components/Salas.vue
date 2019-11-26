<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <button @click="show" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">Añadir Sala </button>
    <div v-if="salas.length">
      <ul clas="list-reset mt-4">
        <li class="py-4" v-for="sala in salas" :key="sala.id" :sala="sala">
          <div class="flex items-center justify-between flex-wrap">
            <p class="block flex-1 font-mono font-semibold flex items-center">
              <router-link :to="`/salas/${sala._id.$oid}`" class="link-grey px-2 no-underline">{{ sala.nombre }}</router-link>
            </p>
          </div>
        </li>
      </ul>
    </div>
    <div v-else>
      <p class="text-4xl py-12"> No hay salas disponibles. ¡Crea una sala! </p>
    </div>
  </div>
</template>

<script>
import createSala from '@/components/createSala.vue'

export default {
  components: {
    createSala
  },
  name: 'Sala',
  data () {
    return {
      salas: [],
      newSala: [],
      error: ''

    }
  },
  created () {
    // this.$on(this.fetchData)
    this.fetchData()
  },
  methods: {
    fetchData () {
      if (!localStorage.signedIn) {
        this.$router.replace('/')
      } else {
        this.$http.secured.get('/salas').then(response => {
          this.salas = response.data
          console.log(this.salas)
        })
      }
    },
    show () {
      this.$modal.show(createSala, {
        salas: this.salas
      }, {
        draggable: false
      })
    }
    // setError (error, text) {
    //   this.error = (error.response && error.response.data && error.response.data.error) || text
    // },
    // addSala () {
    //   const value = this.newSala
    //   if (!value) {
    //     return
    //   }
    //   this.$http.secured.post('/salas', {sala: {nombre: this.newSala.nombre}}).then(response => {
    //     this.sala.push(response.data)
    //     this.newSala = []
    //   })
    //     .catch(error => this.setError(error, 'Error creando sala'))
    // }
  }

}

</script>
