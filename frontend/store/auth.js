export const state = () => ({
  authToken: null,
  loggedIn: false
})

export const mutations = {
  commit (state, token) {
    state.authToken = token
    state.loggedIn = true
  },
  remove (state) {
    state.authToken = null
    state.loggedIn = false
  }
}