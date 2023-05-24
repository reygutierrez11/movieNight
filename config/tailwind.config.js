const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
	doble: ["doble", "double"],
      },
      colors: {
       'slate': 'CE5FF',
      },
      backgroundImage: {
	'cinema': "url('cinema.png')",
	'moviesug': "url('moviesug.jpeg')",
	'moviesug2': "url('moviesug2.png')",
	'moviesug3': "url('moviesug3.jpg')",
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
