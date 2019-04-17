import VuetifyLoaderPlugin from 'vuetify-loader/lib/plugin'
import pkg from './package'

export default {
  mode: 'spa',

  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      {
        rel: 'stylesheet',
        href:
          'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons'
      }
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: [
    '~/assets/style/app.styl'
  ],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
    '@/plugins/vuetify',
    '@/plugins/vuedraggable'
  ],

  /*
  ** Nuxt.js modules
  */
  modules: [
    '@nuxtjs/pwa',
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    '@nuxtjs/apollo'
  ],
  
// Give apollo module options
apollo: {
  tokenName: 'apollo-token', // optional, default: apollo-token
  tokenExpires: 7, // optional, default: 7 (days)
  includeNodeModules: true, // optional, default: false (this includes graphql-tag for node_modules folder)
  authenticationType: 'Authentication', // optional, default: 'Bearer'
  // optional
  errorHandler (error) {
    console.log('%cError', 'background: red; color: white; padding: 2px 4px; border-radius: 3px; font-weight: bold;', error.message)
  },
  // required
  clientConfigs: {
    default: {
      // required  
      httpEndpoint: 'http://localhost:3000',
      // optional
      // See https://www.apollographql.com/docs/link/links/http.html#options
      //httpLinkOptions: {
      //  credentials: 'same-origin'
      //},
      // You can use `wss` for secure connection (recommended in production)
      // Use `null` to disable subscriptions
      //wsEndpoint: 'ws://localhost:4000', // optional
      // LocalStorage token
      tokenName: 'apollo-token', // optional
      // Enable Automatic Query persisting with Apollo Engine
      //persisting: false, // Optional
      // Use websockets for everything (no HTTP)
      // You need to pass a `wsEndpoint` for this to work
      //websocketsOnly: false // Optional
    },
    test: {
      httpEndpoint: 'http://localhost:3000',
      //wsEndpoint: 'ws://localhost:5000',
      tokenName: 'apollo-token'
    },
    // alternative: user path to config which returns exact same config options
    test2: '~/plugins/my-alternative-apollo-config.js'
  }
},


  // Axios setup
  axios: {
    host: 'localhost',
    port: 8000
  },
  // Auth Options
  auth: {
    redirect: {
      login: '/login',
      logout: '/',
      callback: '/',
      home: '/'
    },
    strategies: {
      local: {
        endpoints: {
          login:  { url: '/auth/login', method: 'post', propertyName: 'authorization'},
          user:   { url: '/auth/user', method: 'get', propertyName: 'user'},
          logout: { url: '/auth/logout', method: 'post', propertyName: 'message'}
        }
      }
    }
  },
  /*
  ** Build configuration
  */
  build: {
    transpile: ['vuetify/lib'],
    plugins: [new VuetifyLoaderPlugin()],
    loaders: {
      stylus: {
        import: ['~assets/style/variables.styl']
      }
    },
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      /*if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }*/
    }
  }
}
