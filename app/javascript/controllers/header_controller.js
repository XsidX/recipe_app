import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["openMobileMenu", "openUserMenu", "openRecipeMenu", "openFoodMenu"]
    connect() {
        console.log('connected')
        this.openMobileMenuTarget.addEventListener('click', this.toggleMobileDropdownMenu)
        this.openRecipeMenuTarget.addEventListener('click', this.toggleRecipeDropdownMenu)
        this.openUserMenuTarget.addEventListener('click', this.toggleUserDropdownMenu)
        this.openFoodMenuTarget.addEventListener('click', this.toggleFoodDropdownMenu)
    }

    toggleMobileDropdownMenu() {
        toggle(document.getElementById('mobile-dropdown-menu'))
    }

    toggleUserDropdownMenu() {
        toggle(document.getElementById('user-dropdown-menu'))
    }

    toggleRecipeDropdownMenu() {
        toggle(document.getElementById('recipe-dropdown-menu'))
    }

    toggleFoodDropdownMenu() {
        toggle(document.getElementById('food-dropdown-menu'))
    }
}