import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"


export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      time_24hr: true,
      dateFormat: "d/m/Y H:i",
      altInput: true,
      altFormat: "j \\de F \\de Y, H:i",
      locale: "es"
    })
  }
}
