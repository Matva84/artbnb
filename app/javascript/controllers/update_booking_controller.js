import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-booking"
export default class extends Controller {

  static targets = ["bookingStart", "bookingEnd", "days", "price", "totalprice"]

  connect() {
    console.log("hello here")
  }

  update(event) {
    console.log("nouvelle date")
    let startDate = new Date(this.bookingStartTarget.value)
    let endDate = new Date (this.bookingEndTarget.value)
    console.log(startDate.getTime())
    console.log(endDate.getTime())
    let dateDiff = Math.abs(endDate - startDate);
    let jour = Math.round(dateDiff/(1000*60*60*24))+1;

    this.daysTarget.innerText = jour


    let price = this.priceTarget.innerText
    this.totalpriceTarget.innerText = jour * parseFloat(price)

  }
















  // update(event) {
  //   console.log("ancienne date")
  //   console.log(event)

  //   console.log("nouvelle dates")
  //   if (event.target.name === "booking[start_at]") {
  //     console.log("here start");
  //     let dateStart = event.target._flatpickr.selectedDates[0]
  //     console.log(dateStart)
  //   } else {
  //     console.log("here end");
  //     let dateEnd = event.target._flatpickr.selectedDates[0]
  //     console.log(dateEnd)
  //   }
  //   let totalPrice = document.getElementById('totalprice')
  //   let days = document.getElementById('days')
  //   let price = document.getElementById('price').innerText
  //   console.log(price)
  //   // let dateDiff = Math.abs(dateEnd.getTime() - dateStart.getTime());
  //   // let jour = Math.round(dateDiff/(1000*60*60*24))+1;
  //   // console.log(jour)

  // }
}
