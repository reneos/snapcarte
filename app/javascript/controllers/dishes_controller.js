import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitButton", "previewButton"]



  submitOnEnter(e) {
    if (e.key === 'Enter'){
      e.preventDefault()
      this.submitButtonTarget.click()
    }
  }

}
