// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import DatepickerController from "./datepicker_controller"

application.register("datepicker", DatepickerController)

eagerLoadControllersFrom("controllers", application)
