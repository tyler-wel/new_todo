<template>
  <v-layout row align-center justify-left fill-height wrap>
    
  <v-flex xs3>
    <v-card to="/board/1" color="green darken-2" class="white--text cards">
      <v-card-title primary-title>
        <div>
          <div>Life Board</div>
          <br/>
          <span>Tasks for life</span>
        </div>
      </v-card-title>
    </v-card>
  </v-flex> 

    <v-flex xs3>
    <v-card to="/board/2" color="purple darken-2" class="white--text cards">
      <v-card-title primary-title>
        <div>
          <div>Work Board</div>
          <br/>
          <span>Todo tasks for work</span>
        </div>
      </v-card-title>
    </v-card>
  </v-flex> 

    <v-flex xs3>
    <v-card to="/board/3" color="orange darken-2" class="white--text cards">
      <v-card-title primary-title>
        <div>
          <div>Project 2</div>
          <br/>
          <span>This is a description for project 2</span>
        </div>
      </v-card-title>
    </v-card>
  </v-flex> 
  
  </v-layout>
</template>

<script>
import BoardCards from '~/components/BoardCards.vue'
import {UPDATE_TITLE} from '~/store/mutation_names.js'

export default {

mounted: function() {
    this.$store.commit(UPDATE_TITLE, 'ToDo Boards')
  },

  components: {
    BoardCards
  },

  methods: {
    onclick() {
      console.log('clicked')
    }
  },
  computed: {
    albumExists() {
      return this.albumData.length > 0
    }
  }

}
</script>

<style>

  .cards{
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 20px;
    min-height: 150px;
  }

</style>