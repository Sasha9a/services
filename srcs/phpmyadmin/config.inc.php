<?php

$cfg['blowfish_secret'] = 'dfghjksdfghjksdfghjksdfghjkasdfg';

$i = 0;

$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'mysql-svc';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'jlyessa';
$cfg['Servers'][$i]['password'] = 'jlyessa';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';