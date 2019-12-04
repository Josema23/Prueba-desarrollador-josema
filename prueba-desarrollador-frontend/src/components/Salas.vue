<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <div class="flex justify-between ">
      <div>
        <img src="@/assets/chat_logo.png" width="150px">
      </div>
      <div class = "flex">
        <button @click="show" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">Añadir Sala </button>
      </div>
    </div>
    <div v-if="salas.length" class="flex justify-center py-12">
      <ul clas="list-none mt-4">
        <li class="py-4" v-for="sala in salas" :key="sala.id" :sala="sala">
          <div class="flex items-center justify-between flex-wrap hover:bg-blue-500 hover:text-white cursor-pointer font-semibold">
            <p class="block flex-1 font-mono font-semibold flex items-center border border-gray-600 p-5">
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
import EventBus from '@/eventBus'

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
    EventBus.$on('DATA_PUBLISHED', (sala) => {
      console.log(sala)
      this.fetchData()
    })
    this.fetchData()
  },
  // mounted () {
  //   EventBus.$on('DATA_PUBLISHED', (sala) => {
  //     console.log(sala)
  //     this.fetchData()
  //   })
  // },
  methods: {
    fetchData () {
      if (!localStorage.signedIn) {
        this.$router.replace('/')
      } else {
        this.$http.secured.get('/salas').then(response => {
          this.salas = response.data
          // console.log(this.salas)
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
