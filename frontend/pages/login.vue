<template>
  <v-card height="100%">
    <v-toolbar dark color="primary">
      <v-toolbar-title>Login</v-toolbar-title>
    </v-toolbar>
    <v-alert type="error" :value="error">{{error}}</v-alert>
    <v-card-text>
      <v-form
        ref="form"
        v-model="valid"
      >
        <v-text-field 
          v-model="email"
          prepend-icon="person" 
          :rules="emailRules"
          label="Email"
          required 
        ></v-text-field>
        <v-text-field 
          v-model="password"
          prepend-icon="lock"
          type="password"
          :rules="passwordRules"  
          label="Password" 
          hint="At least 6 characters"
          counter>
        </v-text-field>
        <v-spacer></v-spacer>
        <v-btn 
          color="primary"
          @click="validate"
        >
          Login
        </v-btn>

      </v-form>
    </v-card-text>
  </v-card>
</template>
      

<script>
import { mapMutations } from 'vuex'
import {UPDATE_TITLE, UPDATE_TOKEN} from '~/store/mutation_names.js'
export default {
  mounted: function (){
    this.$store.commit(UPDATE_TITLE, 'Login')
  },
  data() { 
    return {
      error: null,
      valid: true,
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ],
      password: '',
      passwordRules: [
        v => !!v || 'Password is required',
        v => v.length >= 6 || 'Min 6 characters'
      ],
    }
  },
  methods: {
   async validate () {
      if (this.$refs.form.validate()) {
        await this.$auth.loginWith('local', {
          data: {
            email: this.email,
            password: this.password
          }
        })
        .catch(e => {
          console.log(e)
          this.error = "Wrong email and/or password"
        })
  
        if(this.$auth.loggedIn){
          console.log("Logged in ok!")
          const token = this.$auth.getToken('local').split(" ").pop()
          this.$store.commit(UPDATE_TOKEN, token)
        }
      }
   }
  }
}
</script>