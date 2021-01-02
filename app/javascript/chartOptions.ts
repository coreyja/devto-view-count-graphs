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
  colors: ['#fff'], // white.DEFAULT
  download: { background: '#0d1219' }, // dark.DEFAULT
  library: chartJSOptions({ labelColor: '#F3CBFC', gridLineColor: '#F3CBFC'}), // pink.light
}

const lightModeOptions = {
  ...baseOptions,
  colors: ['#3E49D7'], // blurple.DEFAULT
  download: { background: '#FFF' }, // white.DEFAULT
  library: chartJSOptions({ labelColor: '#5b64ef', gridLineColor: '#5b64ef'}), // blurple.light
}

export { darkModeOptions, lightModeOptions }
