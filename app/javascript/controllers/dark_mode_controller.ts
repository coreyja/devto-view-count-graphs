import { Controller } from "stimulus"
import Chartkick from "chartkick"
import {darkModeOptions, lightModeOptions} from "../chartOptions"

export default class extends Controller {
  static targets = [ "html", "toggle", "sunIcon", "moonIcon" ]
  static values = { darkEnabled: Boolean, preferredTheme: String }

  declare darkEnabledValue: Boolean
  declare preferredThemeValue: String
  declare htmlTarget: HTMLElement
  declare toggleTarget: HTMLElement
  declare sunIconTarget: HTMLElement
  declare moonIconTarget: HTMLElement

  connect() {
    if (this.preferredThemeValue === 'light') {
      this.darkEnabledValue = false
    } else if (this.preferredThemeValue === 'dark' || window.matchMedia('(prefers-color-scheme: dark)').matches) {
      this.darkEnabledValue = true
    }

    document.addEventListener("turbo:render", () =>{
      this.refresh()
    })
    this.toggleTarget.classList.add('transition-all')
    this.sunIconTarget.classList.add('transition-opacity')
    this.moonIconTarget.classList.add('transition-opacity')
  }

  toggle() {
    this.darkEnabledValue = !this.darkEnabledValue

    this.recordPreferredTheme()
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

  private async recordPreferredTheme() {
    const theme = this.darkEnabledValue ? 'dark' : 'light'
    const token = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement).content;

    await fetch(
      '/preferred_theme',
      {
        method: 'POST',
        headers: {
          "X-CSRF-Token": token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({preferred_theme: theme})
      }
    )
  }
}
