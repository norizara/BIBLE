function validateForm() {
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const server = document.getElementById("server").value;
    const description = document.getElementById("description").value.trim();
    const followUp = document.getElementById("followUp").checked;

    if (username === "") {
        alert("Username is required.");
        return false;
    }

    if (!email.includes("@") || !email.includes(".")) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (server === "") {
        alert("Please select a server.");
        return false;
    }

    if (description.length < 20) {
        alert("Bug description must be at least 20 characters long.");
        return false;
    }

    if (!followUp) {
        alert("You must allow follow-up emails to submit the report.");
        return false;
    }

    alert("Bug report submitted successfully. Thank you for your feedback!");
    return true;
}
