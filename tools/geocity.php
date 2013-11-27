#!/usr/bin/php

<?php
#$line = trim(fgets(STDIN));
#$stdin = fopen('php://stdin', 'r');

$lines = file('php://stdin');

foreach ($lines as $line) {
  $parts = preg_split('/\s+/', trim($line));
  echo $parts[0] . "\t" . getcity($parts[1]) . "\t" . $parts[1] . "\t" . gethostbyaddr ($parts[1]) . "\n";
  
}

function getcity($ip) {
  $record = @geoip_record_by_name($ip);
  return $record['city'] . ' , ' . $record['country_code'];
}
