import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  declare inputTarget: HTMLElement

  clickInput() {
    this.inputTarget.click()
  }
}
