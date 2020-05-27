import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "editForm", "submitButton", "name", "price", "nameForm", "priceForm" ]

  showEditForm(e) {
    this.editFormTarget.classList.remove('hidden-form')
    this.nameTarget.classList.add('hidden-form')
    this.nameFormTarget.size = this.nameFormTarget.value.length;
    this.priceTarget.classList.add('hidden-form')
  }

  submitOnEnter(e) {
    if (e.key === 'Enter'){
      e.preventDefault()
      this.submitButtonTarget.click()
    }
  }

}