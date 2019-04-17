<template>
  <v-layout row align-center justify-left fill-height wrap>
    
    <div v-for="(board, index) in boards" v-bind:key="index">
      <BoardCards/>
    </div>
  </v-layout>
</template>

<script>
import BoardCards from '~/components/BoardCards.vue'

export default {
  middleware:['auth'],
  asyncData({ params }) {
      return axios.get(`https://itunes.apple.com/search?term=${params.id}&entity=album`)
        .then((response) => {
          return { albumData: response.data.results }
        })
    },
  mounted: function() {
    this.$store.commit('update', 'ToDo Boards')
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
  }

</style>