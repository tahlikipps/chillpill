import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  connect() {
    const params = new URLSearchParams(window.location.search)

    if (params.get('success')=== "true") {
      this.element.classList.remove("d-none")
      document.querySelector("body").style.overflow = "hidden";
      setTimeout(() => {
        this.element.classList.add("d-none");
        document.querySelector("body").style.overflow = "initial";
      }, 4000);
    }
  }

}
