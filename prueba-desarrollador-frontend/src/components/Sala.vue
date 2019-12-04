<template>
  <div class="jumbotron">
    <div class="text-red" v-if="error">{{ error }}</div>
    <div class = "py-10">
      <div>
        <router-link to="/salas" tag="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Salas de Chat</router-link>
      </div>
      <!-- <button type="input"></button> -->
    </div>
    <div class="exterior">
      <div class="chat">
        <ul>
          <li v-for="mensaje in mensajes" :key="mensaje.id">
            <div v-if="mensaje.mensaje">
              <p>
                [{{mensaje.mensajes.created_at | moment("HH:mm:ss")}}] > {{mensaje.mensajes.cuerpo}}
                <!-- {{mensaje}} -->
              </p>
            </div>
            <div v-else>
              <p>
                <!-- {{mensaje}} -->
                [{{mensaje.created_at | moment("HH:mm:ss")}}] > {{mensaje.cuerpo}}
              </p>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="mensaje-exterior">
      <div class="mensaje-editor">
        <form class="flex flex-wrap formulario" @submit.prevent="addMensaje">
          <div class="prueba">
            <input type="text"
              class="input shadow appearance-none border rounded w-full py-2 px-8 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              autofocus="off"
              placeholder="Escribe un mensaje..."
              v-model="newMensaje.cuerpo">
          </div>
          <div class="add">
            <button type="submit" value="Enviar" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">Enviar</button>
          </div>
          <div>
            <p v-if="errors.length">
              <b class="px-2">Por favor, corrija el(los) siguiente(s) error(es):</b>
              <ul>
                <li class="text-red-700 text-lg font-bold mb-2 px-2" v-for="error in errors" v-bind:key="error">{{ error }}</li>
              </ul>
            </p>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>

export default {

  name: 'Message',
  data () {
    return {
      sala: '',
      salaid: [],
      error: '',
      newMensaje: [],
      mensajes: [],
      datas: [],
      errors: []

    }
  },
  channels: {
    ChatChannel: {
      connected () { console.log('Conectado') },
      rejected () { console.log('No se ha podido conectar') },
      received (mensaje) {
        const idSala = this.$route.params.id
        this.$http.secured.get('mensajes/' + idSala).then(response => {
          this.mensajes = response.data
          // this.mensajes.push(mensaje)
        })
        // console.log(mensaje)
      },
      disconnected () { console.log('Desconectado del chat') }
    }
  },
  mounted () {
    this.$cable.subscribe({
      channel: 'ChatChannel',
      room: 'public'
    })
  },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      const idSala = this.$route.params.id
      this.$http.secured.get('mensajes/' + idSala).then(response => {
        this.mensajes = response.data
        // console.log('Response mensajes')
        // console.log(response.data)
      })
        .catch(error => this.setError(error, 'Algo fue mal en created'))
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addMensaje () {
      const value = this.newMensaje
      const salaId = this.$route.params.id
      if (!value) {
        return
      }
      if (!this.newMensaje.cuerpo) {
        this.errors.push('Escribe algo!')
      } else {
        this.errors = []
        const idSala = this.$route.params.id
        this.$http.secured.post('/mensajes', {mensaje: {cuerpo: this.newMensaje.cuerpo, sala_id: salaId}})
          .then(response => {
            this.$http.secured.get('mensajes/' + idSala).then(response => {
              this.mensajes = response.data
            })
            const mensaje = response.data
            this.sendMessage(mensaje)
            this.newMensaje = []
          })
          .catch(error => this.setError(error, 'No se pudo crear el mensaje'))
      }
    },
    sendMessage (mensaje) {
      // console.log(mensaje)
      this.$cable.perform({
        channel: 'ChatChannel',
        action: 'send_message',
        data: {
          mensaje: mensaje
        }
      })
    }
  }
}
</script>

<style lang="css">

  .text-red {
    color: #cf0c0c
  }

  .chat {
    border: 1px solid black;
    width: 50%;
    height: 500px;
    display: flex;
    justify-content: center
  }

  .exterior {
    display: flex;
    justify-content: center;
  }

  .formulario {
    display: flex;
    justify-content: space-between;
    margin-top: 25px;
  }

  .mensaje-exterior {

    display: flex;
    justify-content: center;
    height: 150px;

  }

  .mensaje-editor {
    margin-top: 25px;
    margin-bottom: 50px;
    width: 50%;
    display: flex;
    justify-content: center;
    border: 1px solid black
  }

  .input{
    width: 100%;
  }

</style>
