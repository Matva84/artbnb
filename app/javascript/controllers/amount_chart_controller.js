import { Controller } from "@hotwired/stimulus"
import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["totalDep", "totalGag"]

  connect() {
    const labels = ["Gain", "Dépense"]
    const data = [this.totalGagTarget.dataset.value, this.totalDepTarget.dataset.value]

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
                'rgb(103, 130, 100)',
                'rgb(130, 77, 77)',
              ],
              hoverOffset: 4
            }
          ]
        }
      }
    );
  }
}
