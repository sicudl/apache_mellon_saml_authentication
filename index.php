<?php
header('Content-Type: text/plain');

foreach($_SERVER as $key => $value) {
  if(str_starts_with($key, 'MELLON_')) {
    echo($key . '=' . $value . "\r\n");
  }
}
?>
