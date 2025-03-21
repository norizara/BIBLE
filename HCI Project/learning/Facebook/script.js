document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById('login-form');

    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form submission

        let emailOrPhone = document.getElementById('email').value.trim();
        let password = document.getElementById('password').value.trim();

        // Check if fields are empty
        if (emailOrPhone === "" || password === "") {
            alert("Please fill in all the fields");
            return;
        }

        // Check if input is an email or a phone number
        if (!validateEmail(emailOrPhone) && !validatePhone(emailOrPhone)) {
            alert("Please enter a valid Gmail address or a 10-digit phone number.");
            return;
        }

        // Validate password length
        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            return;
        }

        alert("Login successful!");
        form.submit(); // Submit the form if everything is valid
    });

    // Function to validate email format (must be a valid Gmail address)
    function validateEmail(email) {
        const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        return emailPattern.test(email);
    }

    // Function to validate phone number (must be exactly 10 digits)
    function validatePhone(phone) {
        return /^\d{10}$/.test(phone);
    }
});
