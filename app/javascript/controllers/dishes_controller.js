import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitButton"]



  submitOnEnter(e) {
    if (e.key === 'Enter'){
      e.preventDefault()
      this.submitButtonTarget.click()
    }
  }

}
