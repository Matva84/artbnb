// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

let searchBar = document.querySelector(".searchdesc")
console.log(searchBar)
searchBar.addEventListener("click", (event) => {
   let searchForm = document.querySelector(".divsearch")
   console.log(searchForm)
  searchForm.classList.toggle("hidden")
})
