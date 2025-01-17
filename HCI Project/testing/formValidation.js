function validateForm() {
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const server = document.getElementById("server").value;
    const description = document.getElementById("description").value.trim();
    const followUp = document.getElementById("followUp").checked;

    // Validation 1: Username should not be empty
    if (username === "") {
        alert("Username is required.");
        return false;
    }

    // Validation 2: Email should contain "@" and "."
    if (!email.includes("@") || !email.includes(".")) {
        alert("Please enter a valid email address.");
        return false;
    }

    // Validation 3: Server must be selected
    if (server === "") {
        alert("Please select a server.");
        return false;
    }

    // Validation 4: Bug description should be at least 20 characters
    if (description.length < 20) {
        alert("Bug description must be at least 20 characters long.");
        return false;
    }

    // Validation 5: Permission checkbox must be checked
    if (!followUp) {
        alert("You must allow follow-up emails to submit the report.");
        return false;
    }

    alert("Bug report submitted successfully. Thank you for your feedback!");
    return true;
}
