import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  connect() {
    console.log('hello');
  }

  show() {
    console.log('action');
  }
}
