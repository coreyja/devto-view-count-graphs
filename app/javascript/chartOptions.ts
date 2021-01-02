const colors = require('./stylesheets/colors')
import * as dd from 'tailwindcss/colors'

const baseOptions = {
}

const chartJSAxes = ({labelColor, gridLineColor}: { labelColor: string, gridLineColor: string }) => ({
  gridLines: { color: gridLineColor, zeroLineColor: gridLineColor },
  scaleLabel: { display: true, fontColor: labelColor },
  ticks: { fontColor: labelColor },
})

const chartJSOptions = (colors: { labelColor: string, gridLineColor: string }) => ({
    scales: {
      yAxes: [chartJSAxes(colors)],
      xAxes: [chartJSAxes(colors)],
    }
})

const darkModeOptions = {
  ...baseOptions,
  colors: [colors.white.DEFAULT],
  download: { background: colors.dark.DEFAULT },
  library: chartJSOptions({ labelColor: colors.pink.light, gridLineColor: colors.pink.light}),
}

const lightModeOptions = {
  ...baseOptions,
  colors: [colors.blurple.DEFAULT],
  download: { background: colors.white.DEFAULT },
  library: chartJSOptions({ labelColor: colors.blurple.light, gridLineColor: colors.blurple.lighter}),
}

export { darkModeOptions, lightModeOptions }
