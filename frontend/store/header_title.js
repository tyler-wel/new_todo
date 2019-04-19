export const state = () => ({
  title: 'Vuetify.js'
})

export const mutations = {
  update (state, newTitle) {
    state.title = newTitle
  },
}