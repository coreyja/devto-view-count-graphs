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
    colors: {
      blurple: {
        lighter: '#8990f9',
        light: '#5b64ef',
        DEFAULT: '#3E49D7',
      },
      yellow: {
        light: '#fce8ab',
        DEFAULT: '#F7CB45'
      },
      pink: {
        light: '#F3CBFC',
        DEFAULT: '#e376fc'
      },
      white: {
        blurple: '#c9cbf2',
        DEFAULT: '#FFF',
      },
      dark: {
        DEFAULT: '#131533'
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
