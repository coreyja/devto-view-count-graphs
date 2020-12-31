import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list", "icon" ]
  static values = { expanded: Boolean }

  declare listTarget: HTMLUListElement
  declare iconTarget: HTMLElement
  declare expandedValue: Boolean

  toggle() {
    this.expandedValue = !this.expandedValue
  }

  expandedValueChanged() {
    if (this.expandedValue) {
      this.listTarget.classList.remove("hidden")
      this.iconTarget.classList.add("rotate-90")
    } else {
      this.listTarget.classList.add("hidden")
      this.iconTarget.classList.remove("rotate-90")
    }
  }
}
