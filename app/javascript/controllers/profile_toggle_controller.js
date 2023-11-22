import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="profile-toggle"

export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    console.log("Hello from toggle_controller.js");
  }

  fire() {
    console.log(
      "Before toggle: ",
      this.togglableElementTarget.classList.contains("d-none")
    );
    this.togglableElementTarget.classList.toggle("d-none");
    console.log(
      "After toggle: ",
      this.togglableElementTarget.classList.contains("d-none")
    );
  }
}
