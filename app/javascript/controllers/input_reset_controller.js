import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-reset"
export default class extends Controller {
  connect() {
  }

  resetForm(event) {
    event.target.reset()
  }
}
