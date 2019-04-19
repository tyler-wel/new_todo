<template>
  <v-card height="100%">
    <v-toolbar dark color="primary">
      <v-toolbar-title>Hello TODO USER HERE! </v-toolbar-title>
    </v-toolbar>
    <v-alert type="error" :value="error">{{error}}</v-alert>
    <v-card-text>
      Logged in as TODO PUT USER HERE
    </v-card-text>
    <v-card-actions>
      <v-btn 
        color="primary"
        @click="logout"
        >
          Log out
        </v-btn>
    </v-card-actions>
  </v-card>
</template>
      

<script>
export default {
  props: [],
  data() { 
    return {
      error: null,
    }
  },
  methods: {
    async logout(){

    }
  }
}
</script>

