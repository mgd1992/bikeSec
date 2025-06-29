
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "@rails/ujs", to: "@rails--ujs.js"
pin "flatpickr"
pin "datepicker_controller", to: "controllers/datepicker_controller.js"
