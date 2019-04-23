<template>
  <v-layout row align-center justify-left fill-height wrap>
  
    <v-flex xs3 v-for="(board, key) in boards" :key="key">
      <v-card :to="`board/${board.id}`" color="green darken-2" class="white--text board-card">
        <v-card-title primary-title>
          <div>
            <div>{{board.name}}</div>
            <br/>
            <span>{{board.description}}</span>
            <br/><br/>
            <span>Owner: {{board.owner[0].username}}</span>
          </div>
        </v-card-title>
      </v-card>
    </v-flex> 
    
    <v-dialog v-model="dialog" max-width="600px">
      <template v-slot:activator="{ on }">
        <v-flex xs3>
          <v-card v-on="on" color="white darken-2" class="black--text board-card">
          <v-card-title primary-title>
            <div>
              <div>New Board</div>
              <br/>
              <span>+</span>
            </div>
          </v-card-title>
        </v-card>
        </v-flex> 
      </template>
      <v-card>
        <v-card-text>
          <v-container grid-list-md>
            <v-layout wrap>
              <v-flex xs12>
                <v-text-field label="Name" required></v-text-field>
              </v-flex>
              <v-flex xs12>
                <v-text-field label="Description" required></v-text-field>
              </v-flex>
            </v-layout>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" flat @click="dialog = false">Close</v-btn>
          <v-btn color="blue darken-1" flat @click="saveNewBoard()">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>
</template>

<script>
import BoardCards from '~/components/BoardCards.vue'
import {UPDATE_TITLE} from '~/store/mutation_names.js'
import getBoards from '~/gql/get_user_boards.gql'

export default {
  middleware:['auth'],
  mounted: function() {
    this.$store.commit(UPDATE_TITLE, 'ToDo Boards')
  },
  data() {
    return {
      boards: {},
      dialog: false
    }
  },
  methods: {
    onclick() {
      console.log('clicked')
    },
    saveNewBoard() {
      this.dialog = false
      console.log('clicked save')
    }
  },
  computed: {
    albumExists() {
      return this.albumData.length > 0
    }
  },
  apollo: {
    boards: {
      query: getBoards,
      update: ({userBoards}) => { console.log(userBoards); return userBoards }
    }
  },
  components: {
    BoardCards
  },


}
</script>

<style>

  .board-card{
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 20px;
    min-height: 150px;
    cursor: pointer;
  }

</style>