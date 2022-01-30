import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addButton"]

  connect(){
    console.log("lists javascript loaded")
    // Get the modal
    const modal = document.getElementById("myModal");
    // Get the <span> element that closes the modal
    const span = document.getElementsByClassName("close-modal")[0];

    // When the user clicks on the button, open the modal
    this.addButtonTarget.onclick = function() {
      modal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    }
  }
}
