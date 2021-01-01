import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "html", "toggle", "sunIcon", "moonIcon" ]
  static values = { darkEnabled: Boolean }

  declare darkEnabledValue: Boolean
  declare htmlTarget: HTMLElement
  declare toggleTarget: HTMLElement
  declare sunIconTarget: HTMLElement
  declare moonIconTarget: HTMLElement

  toggle() {
    this.darkEnabledValue = !this.darkEnabledValue
  }

  darkEnabledValueChanged() {
    if (this.darkEnabledValue) {
      this.htmlTarget.classList.add('dark')
      this.toggleTarget.classList.add('left-1/2')
      this.sunIconTarget.classList.add('opacity-0')
      this.moonIconTarget.classList.remove('opacity-0')
    } else {
      this.htmlTarget.classList.remove('dark')
      this.toggleTarget.classList.remove('left-1/2')
      this.sunIconTarget.classList.remove('opacity-0')
      this.moonIconTarget.classList.add('opacity-0')
    }
  }
}
