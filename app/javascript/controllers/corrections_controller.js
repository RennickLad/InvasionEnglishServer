import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    toggleForm(event) {
        console.log("I clicked the button");
        event.preventDefault();
        event.stopPropagation();

        // Grab Params
        const formID = event.params["form"];
        const commentBodyID = event.params["body"];

        // Grab Elements
        const form = document.getElementById(formID);
        const commentBody = document.getElementById(commentBodyID);

        // Toggle Visibility
        form.classList.toggle("d-none");
        form.classList.toggle("mt-5");
        commentBody.classList.toggle("d-none");
    }
}
