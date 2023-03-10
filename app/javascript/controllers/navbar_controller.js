import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["icon"]
  connect() {
    console.log("hello")
  }
 toggle(){
  console.log("welcome")
  if (this.element.style.overflow === "hidden"){
    this.element.style.overflow ="auto"
    iconTargets.classList.toggle = ("X")
  }else{
    this.element.style.overflow ="hidden"


  }

 }


}
