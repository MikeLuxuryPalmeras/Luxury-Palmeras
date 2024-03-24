<html>
<body>
<?php
// function IsInjected($str)
// {
//     $injections = array('(\n+)',
//            '(\r+)',
//            '(\t+)',
//            '(%0A+)',
//            '(%0D+)',
//            '(%08+)',
//            '(%09+)'
//            );
               
//     $inject = join('|', $injections);
//     $inject = "/$inject/i";
    
//     if(preg_match($inject,$str))
//     {
//       return true;
//     }
//     else
//     {
//       return false;
//     }
// }

$name = $_POST['name'];
$visitor_email = $_POST['email'];
$message = $_POST['message'];
$subject = $_POST['subject'];

$email_from = 'Mike@luxurypalmeras.com';
$email_subject = "New Form submission: $subject"; 
$email_body = "Je hebt een nieuw bericht van $name.\n".
                        "Bericht:\n $message";

$to = "Mike@luxurypalmeras.com";
$headers = "From: $email_from \r\n";
$headers .= "Reply-To: $visitor_email \r\n";

if(IsInjected($visitor_email))
{
    echo "Bad email value!";
    exit;
}

mail($to,$email_subject,$email_body,$headers);
?>
</body>
</html>