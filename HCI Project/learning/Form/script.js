let form = document.getElementById('register');

form.addEventListener('submit', function(event) {
    event.preventDefault();

    let username = document.getElementById('inputUsername').value;
    let password = document.getElementById('inputPassword').value;
    let confirmpassword = document.getElementById('inputConfirmPassword').value;
    let email = document.getElementById('inputEmail').value;
    let phone = document.getElementById('inputPhone').value;

    if(username == "" || password == "" || confirmpassword == "" || email == "" || phone == "") {
        alert("Please fill in all the fields");
        return;
    }

    if(password != confirmpassword) {
        alert("Passwords do not match");
        return;
    }

    if(!email.endsWith("@gmail.com")) {
        alert("Email must end with @gmail.com");
        return;
    }
    if(phone.length != 10 || !checkPhone(phone)){
        alert("Phone number must have 10 digits");
        return;
    }

    alert("Registration successful");
});

function checkPhone(phone){
    for(let i = 0; i < phone.length; i++){
        if(phone[i] < '0' || phone[i] > '9'){
            return false;
        }
    }
    return true;
}