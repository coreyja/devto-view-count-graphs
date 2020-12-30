import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list" ]

  declare listTarget: HTMLUListElement

  toggle() {
    this.listTarget.classList.toggle("hidden");
  }
}
