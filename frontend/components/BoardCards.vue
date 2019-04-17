<template>
  <v-flex xs3>
    <v-card to="boards" color="blue-grey darken-2" class="white--text cards">
      <v-card-title primary-title>
        <div>
          <div>Box</div>
          <br/>
          <span>I'm a box</span>
        </div>
      </v-card-title>
    </v-card>
  </v-flex> 
</template>

<script>
export default {
  params: ['name', 'descrip']
}
</script>
