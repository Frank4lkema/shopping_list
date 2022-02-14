import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  connect() {
    console.log("product javascript loaded")
  }

  greet(){
    console.log("import")

    fetch()
  }
}
