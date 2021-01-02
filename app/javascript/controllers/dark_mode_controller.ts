import { Controller } from "stimulus"
import Chartkick from "chartkick"
import {darkModeOptions, lightModeOptions} from "../chartOptions"

export default class extends Controller {
  static targets = [ "html", "toggle", "sunIcon", "moonIcon" ]
  static values = { darkEnabled: Boolean }

  declare darkEnabledValue: Boolean
  declare htmlTarget: HTMLElement
  declare toggleTarget: HTMLElement
  declare sunIconTarget: HTMLElement
  declare moonIconTarget: HTMLElement

  connect() {
    document.addEventListener("turbo:render", () =>{
      this.refresh()
    })
    this.toggleTarget.classList.add('transition-all')
    this.sunIconTarget.classList.add('transition-opacity')
    this.moonIconTarget.classList.add('transition-opacity')
  }

  toggle() {
    this.darkEnabledValue = !this.darkEnabledValue
  }

  darkEnabledValueChanged() {
    this.refresh()
  }

  refresh() {
    if (this.darkEnabledValue) {
      Chartkick.eachChart( function(chart) {
        const oldOptions = chart.getOptions()
        const newOptions = {
          ...oldOptions,
          ...darkModeOptions,
        }
        chart.setOptions(newOptions)
      })
      this.htmlTarget.classList.add('dark')
      this.toggleTarget.classList.add('left-1/2')
      this.sunIconTarget.classList.add('opacity-0')
      this.moonIconTarget.classList.remove('opacity-0')
    } else {
      Chartkick.eachChart( function(chart) {
        const oldOptions = chart.getOptions()
        const newOptions = {
          ...oldOptions,
          ...lightModeOptions,
        }
        chart.setOptions(newOptions)
      })
      this.htmlTarget.classList.remove('dark')
      this.toggleTarget.classList.remove('left-1/2')
      this.sunIconTarget.classList.remove('opacity-0')
      this.moonIconTarget.classList.add('opacity-0')
    }
  }
}
