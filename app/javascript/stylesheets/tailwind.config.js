module.exports = {
  purge: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.jsx",
    "./app/javascript/**/*.ts",
    "./app/javascript/**/*.tsx",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
    colors: {
      blurple: {
        lighter: '#8990f9',
        light: '#5b64ef',
        DEFAULT: '#3E49D7',
      },
      yellow: {
        DEFAULT: '#F7CB45'
      },
      pink: {
        DEFAULT: '#F3CBFC'
      },
      white: {
        DEFAULT: '#FFF',
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
