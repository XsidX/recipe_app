import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
  static targets = ["openIngredientModal", "leaveIngredientModal", "enableNumberField"]
  connect() {
    console.log("connected")
    this.openIngredientModalTarget.addEventListener('click', () => this.toggleOpenIngredientModal())

    this.enableNumberFieldTargets.forEach((target) => {
      target.addEventListener('click', (event) => {
          this.toggleEnableNumberField(event)
        })
    })

    this.hideExtraFields()
  }

  toggleOpenIngredientModal = () => {
    toggle(document.getElementById('ingredient-modal'))
  }

  toggleEnableNumberField = (event) => {
    const index = event.target.dataset.index
    console.log(index)
    const numberField = document.getElementById(`number-field-${index}`)
    console.log(numberField.children[0])
    numberField.children[0].disabled = !numberField.children[0].disabled
  }

  hideExtraFields = () => {
    const extraFields = document.querySelectorAll('.no-ingredient')
    extraFields.forEach((field, index) => {
        if (index > 0) {
            field.classList.add('hidden')
        }
    })
  }
}