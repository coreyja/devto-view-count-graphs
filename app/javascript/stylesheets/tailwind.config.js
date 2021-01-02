const colors = require('./colors.ts')

module.exports = {
  purge: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.jsx",
    "./app/javascript/**/*.ts",
    "./app/javascript/**/*.tsx",
  ],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {},
    colors: colors,
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
