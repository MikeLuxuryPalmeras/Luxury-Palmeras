<?php
function IsInjected($str)
{
    $injections = array('(\n+)',
           '(\r+)',
           '(\t+)',
           '(%0A+)',
           '(%0D+)',
           '(%08+)',
           '(%09+)'
           );
               
    $inject = join('|', $injections);
    $inject = "/$inject/i";
    
    if(preg_match($inject,$str))
    {
      return true;
    }
    else
    {
      return false;
    }
}


$name = $_GET['name'];
$visitor_email = $_GET['email'];
$message = $_GET['recensie'];
$subject = $_GET['woning'];

$email_from = 'Mike@luxurypalmeras.com';
$email_subject = "New recensie submission: $recensie"; 
$email_body = "Je hebt een nieuwe recensie van $name.\n".
                        "Recensie:\n $message";


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