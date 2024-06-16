import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clip"
export default class extends Controller {
  static targets = [ "source" ];
  copy() {
    // console.log("Puppies");
    navigator.clipboard.writeText(this.sourceTarget.textContent)
  };
}
