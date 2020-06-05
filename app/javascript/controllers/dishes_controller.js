import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitButton", "previewButton", "hiddenField"]



  submitOnEnter(e) {
    if (e.key === 'Enter'){
      e.preventDefault();
      this.submitButtonTarget.click();
    }
  }
  submitRedirect(e) {
    e.preventDefault();
    this.hiddenFieldTarget.value = "true";
    this.submitButtonTarget.click();
  }
}
