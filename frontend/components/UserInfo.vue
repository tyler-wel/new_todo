<template>
  <v-card height="100%">
    <v-toolbar dark color="primary">
      <v-toolbar-title>Hello {user}!</v-toolbar-title>
    </v-toolbar>
    <v-alert type="error" :value="error">{{error}}</v-alert>
    <v-card-text>
      Logged in as {{this.$auth.state.user.email}}
    </v-card-text>
    <v-card-actions>
      <v-btn @click="logout">Log out</v-btn>
    </v-card-actions>
  </v-card>
</template>
      
