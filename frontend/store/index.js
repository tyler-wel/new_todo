export const state = () => ({
  authToken: null
})

export const mutations = {
  commit (state, token) {
    state.authToken = token
  },
  remove (state) {
    state.authToken = null
  }
}