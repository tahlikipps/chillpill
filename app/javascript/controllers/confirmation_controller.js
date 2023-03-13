import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirmation"
export default class extends Controller {
  connect() {
    console.log("hola");
  }
  showModal(event){

    // window.location.href = this.element.href
  }
}
