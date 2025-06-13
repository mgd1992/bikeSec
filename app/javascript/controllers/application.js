import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }
