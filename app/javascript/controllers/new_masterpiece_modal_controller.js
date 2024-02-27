import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "openButton", "closeButton", "form"];

  connect() {
    this.openButtonTarget.addEventListener("click", () => this.openModal());
    this.closeButtonTarget.addEventListener("click", () => this.closeModal());
    this.formTarget.addEventListener("submit", (event) => this.handleSubmit(event));
  }

  openModal() {
    this.modalTarget.style.display = "block";
  }

  closeModal() {
    this.modalTarget.style.display = "none";
  }

  handleSubmit(event) {
    event.preventDefault();

    const formData = new FormData(this.formTarget);
    fetch('/masterpieces', {
      method: 'POST',
      body: formData
    })
    .then(response => {
      if (response.ok) {
        this.closeModal();
        alert("The new artwork has been added successfully.");
        window.location.reload();
      } else {
        alert("An error occurred while adding the artwork.");
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert("An error occurred while adding the artwork.");
    });
  }
}
