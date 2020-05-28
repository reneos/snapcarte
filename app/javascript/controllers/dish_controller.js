import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['nameForm', 'priceForm', 'name', 'price', 'formBox']

  showForm(e) {
    e.currentTarget.parentNode.classList.add('hidden')
    this.formBoxTarget.classList.remove('hidden')
    this.nameFormTarget.size = this.nameFormTarget.value.length;
    if (e.currentTarget == this.nameTarget) {
      this.nameFormTarget.focus();
    } else {
      this.priceFormTarget.focus();
    }
  }

}
