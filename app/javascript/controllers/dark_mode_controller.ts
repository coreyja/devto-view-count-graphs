import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "html" ]
  static values = { darkEnabled: Boolean }

  declare darkEnabledValue: Boolean
  declare htmlTarget: HTMLElement

  toggle() {
    this.darkEnabledValue = !this.darkEnabledValue
  }

  darkEnabledValueChanged() {
    if (this.darkEnabledValue) {
      this.htmlTarget.classList.add('dark')
    } else {
      this.htmlTarget.classList.remove('dark')
    }
  }
}
