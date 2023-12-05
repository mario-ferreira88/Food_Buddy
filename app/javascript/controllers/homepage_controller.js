import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
    setTimeout(() => window.location.replace("/dashboard"), 3000)
  }
}
