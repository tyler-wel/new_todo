<template>
  <div>
    <h1>Search iTunes</h1>
    <br/>
    <form @submit.prevent="submit">
      <input placeholder="Enter Artist Name" 
              v-model="search" autofocus/>

    </form>
  </div>

</template>

<script>
import {UPDATE_TITLE} from '~/store/mutation_names.js'

export default {
  mounted: function() {
    this.$store.commit(UPDATE_TITLE, "iTunes Album Search")
  },
  data() {
    return {
      search: ''
    }
  },
  methods: {
    submit(event) {
      this.$router.push("results/" + this.search)
    }
  }
}
</script>

<style>

  * {
    text-align: center;
  }

  h1 {
    padding: 20px;
  }

</style>

