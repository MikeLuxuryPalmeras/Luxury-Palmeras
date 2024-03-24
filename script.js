// Example starter JavaScript for disabling form submissions if there are invalid fields
function validateForm(){
    const forms = document.getElementById('recensieForm')
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        console.log(form)
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        console.log("pass")
        form.classList.add('was-validated')
      }, false)
    })
  }