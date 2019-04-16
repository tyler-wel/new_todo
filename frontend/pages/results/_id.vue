<template>
  <div>
    <h1>Results for {{$route.params.id}}</h1>
    <div v-if="albumExists">
      <div v-for="(album, index) in albumData" v-bind:key="index">
        <Card
          :title="album.collectionCensoredName"
          :image="album.artworkUrl100"
          :artist="album.artistName"
          :url="album.artistViewUrl"
          :color="picker(index)"
        />
      </div>
    </div>
    <div v-else>
      <h1>Could not find any albums</h1>
    </div>
  </div>
</template>
<script>
import Card from '~/components/Card.vue'
import axios from 'axios'
export default {
  asyncData({ params }) {
    return axios.get(`https://itunes.apple.com/search?term=${params.id}&entity=album`)
      .then((response) => {
        return { albumData: response.data.results }
      })
  },
  components: {
    Card
  },
  methods: {
    picker(index) {
      return index % 2 === 0 ? 'cyan darken-2' : 'blue-grey darken-2'
    }
  },
  computed: {
    albumExists() {
      return this.albumData.length > 0
    }
  }
}
</script>
