<?php
//to test, run: php -f devops/testmail.php
mail ('mstumpf@ellefsontech.com', 'Test Postfix', 'Test mail from postfix at '.date('m/d/Y h:i:s a', time()));