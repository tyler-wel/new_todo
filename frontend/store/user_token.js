export const state = () => ({
  authToken: ''
})

export const mutations = {
  update_token (state, token) {
    state.authToken = token
    console.log('updated the user token: ' + state.authToken)
  },
}