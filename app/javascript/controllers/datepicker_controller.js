import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    flatpickr(this.element, {
        minDate: "today" // Empêche de sélectionner les jours avant aujourd'hui
    });

    this.fire();
}


  fire() {
    console.log("ca click dans datepicker!")

    const dateStart = document.getElementById('booking_start_at');
    const dateEnd = document.getElementById('booking_end_at');
    const price = document.getElementById('price').innerText;
    const totalPrice = document.getElementById('totalprice')
    const totalNight = document.getElementById('night')
    console.log(dateEnd,dateStart.value,parseFloat(price),totalPrice.innerText,totalNight.innerText);

    //function updatePrice() {
      const Date1 = new Date(dateStart.value);
      const Date2 = new Date(dateEnd.value);

      const dateDebut = Date1.getTime();
      const dateFin = Date2.getTime();

      const dateDiff = Math.abs(dateFin - dateDebut);
      let jour = Math.round(dateDiff/(1000*60*60*24))+1;
      totalNight.innerText = jour;
      totalPrice.innerText = jour * parseFloat(price);
    //}

    //[dateStart, dateEnd].forEach(date => {
    //  date.addEventListener("change", (event) => {
    //    console.log("click")
    //    updatePrice();
    //  });

  }
}
