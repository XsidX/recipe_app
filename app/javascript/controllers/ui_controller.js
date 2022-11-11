import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["enableEditIngredient", " updateIngredient"]
    connect() {
        console.log("connected")

        this.enableEditIngredientTargets.forEach((target) => {
            target.addEventListener('click', (event) => {
                this.toggleEnableEditIngredient(event, target)
            })
        })

        this.updateIngredientTargets.forEach((target) => {
            target.addEventListener('click', (event) => {
                this.toggleUpdateIngredient(event, target)
            })
        })

    }

    toggleEnableEditIngredient = (event, target) => {
        const index = event.target.dataset.index
        console.log(index)
        const normalFiled = document.getElementById(`normal-field-${index}`)
        const numberField = document.getElementById(`number-field-${index}`)
        normalFiled.classList.toggle('hidden')
        numberField.classList.toggle('hidden')
        target.classList.toggle('hidden')
        const updateButton = document.getElementById(`update-btn-${index}`)
        updateButton.classList.toggle('hidden')

    }

    toggleUpdateIngredient = (event, target) => {
        const index = event.target.dataset.index
        const normalFiled = document.getElementById(`normal-field-${index}`)
        const numberField = document.getElementById(`number-field-${index}`)
        normalFiled.classList.toggle('hidden')
        numberField.classList.toggle('hidden')
        target.classList.toggle('hidden')
        const editButton = document.getElementById(`edit-btn-${index}`)
        editButton.classList.toggle('hidden')
    }

}