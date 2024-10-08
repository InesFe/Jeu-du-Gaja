# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
#ajouté pour bootstrap
pin "popper", to: 'popper.js', preload: true 
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "canvas-confetti" # @1.9.3
