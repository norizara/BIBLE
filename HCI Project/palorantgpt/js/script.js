document.getElementById('bug-form').addEventListener('submit', function(event) {
    let formValid = true;
  
    // Validate username
    const username = document.getElementById('username').value;
    if (username.length < 3) {
      formValid = false;
      alert('Username must be at least 3 characters long');
    }
  
    // Validate email
    const email = document.getElementById('email').value;
    if (!email.includes('@')) {
      formValid = false;
      alert('Please enter a valid email address');
    }
  
    // Validate server
    const server = document.getElementById('server').value;
    if (!server) {
      formValid = false;
      alert('Please select a server');
    }
  
    // Validate description
    const description = document.getElementById('description').value;
    if (description.length < 20) {
      formValid = false;
      alert('Bug description must be at least 20 characters');
    }
  
    if (!formValid) {
      event.preventDefault();
    }
  });
  