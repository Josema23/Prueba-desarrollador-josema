<template>
  <div class="modal" @before-open="beforeOpen">
    <div class="bg-blue-600 py-4 text-center text-lg font-bold mb-2">
      <p>
        Creación de Sala
      </p>
    </div>
    <div class="flex justify-center py-8">
      <label for="salas" class="text-gray-700 text-lg font-bold mb-2 px-2">Nombre:</label>
      <form @submit.prevent="addSala">
        <div class="mb-6">
          <input type="text"
            class="input py-2 shadow appearance-none border rounded w-full px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            autofocus="off"
            title="Nombre"
            placeholder="Escribe el nombre"
            v-model="newSala.nombre">
        </div>
        <div class="w-full flex justify-around text-center text-sm font-bold mb-2">
          <button class = "bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" type="submit" value="Añadir Sala"> Añadir Sala</button>
          <button class = "bg-red-600 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" @click="$emit('close')"> Cancelar </button>
        </div>
      </form>
    </div>
    <div>
      <p v-if="errors.length">
        <b class="px-2">Por favor, corrija el(los) siguiente(s) error(es):</b>
        <ul>
          <li class="text-gray-700 text-lg font-bold mb-2 px-2" v-for="error in errors" v-bind:key="error">{{ error }}</li>
        </ul>
      </p>
    </div>
  </div>
</template>
<script>
export default {
  name: 'createSala',
  data () {
    return {
      salas: [],
      newSala: [],
      error: '',
      errors: []

    }
  },
  methods: {
    beforeOpen (event) {
      console.log(event.params)
    },
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addSala () {
      const value = this.newSala
      if (!value) {
        return
      }
      if (!this.newSala.nombre) {
        this.errors.push('Introduce un nombre')
      } else {
        this.$http.secured.post('/salas', {sala: {nombre: this.newSala.nombre}}).then(response => {
          this.sala.push(response.data)
          this.newSala = []
        })
          .catch(error => this.setError(error, 'Error creando sala'))
        this.$emit('close')
      }
      // this.$bus.$emit('close')
      // console.log(this.$bus)
    }
  }
}

</script>
