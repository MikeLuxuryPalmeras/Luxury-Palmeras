import { v2 as cloudinary } from 'cloudinary';

(async function() {

    // Configuration
    cloudinary.config({ 
        cloud_name: 'dxrcssdpn', 
        api_key: '485639695972999', 
        api_secret: '<your_api_secret>' // Click 'View API Keys' above to copy your API secret
    });
    
    // Upload an image
     const uploadResult = await cloudinary.uploader
       .upload(
           'https://res.cloudinary.com/demo/image/upload/getting-started/shoes.jpg', {
               public_id: 'shoes',
           }
       )
       .catch((error) => {
           console.log(error);
       });
    
    console.log(uploadResult);
    
    // Optimize delivery by resizing and applying auto-format and auto-quality
    const optimizeUrl = cloudinary.url('shoes', {
        fetch_format: 'auto',
        quality: 'auto'
    });
    
    console.log(optimizeUrl);
    
    // Transform the image: auto-crop to square aspect_ratio
    const autoCropUrl = cloudinary.url('shoes', {
        crop: 'auto',
        gravity: 'auto',
        width: 500,
        height: 500,
    });
    
    console.log(autoCropUrl);    
})();
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

function validateContactForm(){
    const forms = document.getElementById('contactForm')
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