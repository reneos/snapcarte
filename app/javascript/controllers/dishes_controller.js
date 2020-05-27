import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "editForm", "submitButton", "name", "price", "nameForm", "priceForm", "info" ]

  showEditForm(e) {
    this.editFormTarget.classList.remove('hidden-form')
    this.nameTarget.classList.add('hidden-form')
    this.infoTarget.classList.remove('w-100')
    this.nameFormTarget.size = this.nameFormTarget.value.length;
    this.priceTarget.classList.add('hidden-form')
    if (e.currentTarget == this.nameTarget) {
      this.nameFormTarget.focus();
    } else {
      this.priceFormTarget.focus();
    }
  }

  submitOnEnter(e) {
    if (e.key === 'Enter'){
      e.preventDefault()
      this.submitButtonTarget.click()
    }
  }

}
