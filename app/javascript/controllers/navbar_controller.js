import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["icon"]
  connect() {
    console.log("hello")
  }
 toggle() {
  if (this.element.style.overflow === "hidden"){
    this.element.style.overflow = "auto"
  } else {
    this.element.style.overflow = "hidden"
  }

  this.iconTargets.forEach((icon) => {
    icon.classList.toggle("d-none")
  })
 }
}
