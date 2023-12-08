import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  connect() {
    const element = document.querySelector(".animated-title")

    element.addEventListener('click', (_event) => {
      element.classList.add("animate__animated");
      element.classList.add("animate__hinge");
      setTimeout(() => window.location.replace("/dashboard"), 3000)
    });
  }
}
