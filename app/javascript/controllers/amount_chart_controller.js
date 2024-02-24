import { Controller } from "@hotwired/stimulus"
import { Chart } from "chart.js";

export default class extends Controller {
  total_amounts = {
    "Gain": 504,
    "Dépense": 496
  };

  connect() {
    const labels = Object.keys(this.total_amounts);
    const data = Object.values(this.total_amounts);

    new Chart(
      this.element,
      {
        type: 'doughnut',
        data: {
          labels: labels,
          datasets: [
            {
              label: 'Bilan',
              data: data,
              backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
              ],
              hoverOffset: 4
            }
          ]
        }
      }
    );
  }
}
