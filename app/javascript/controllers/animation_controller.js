import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  connect() {
    const params = new URLSearchParams(window.location.search)

    if (params.get('success')=== "true") {
      this.element.classList.remove("d-none")

      setTimeout(() => {
        this.element.classList.add("d-none")
      }, 5000);
    }


  }

}
