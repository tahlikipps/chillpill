import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="signed-in"
export default class extends Controller {
  connect() {
    const alert =this.element
    setTimeout(
      function() {
        console.log("Signed in successfully, set display: none;");
        alert.style.display = "none";
      }, 3000
    );
  }
  }
