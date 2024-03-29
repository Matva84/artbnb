import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-add-masterpiece"
export default class extends Controller {
  static targets = ["togglableElement"]

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
