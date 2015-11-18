<?php
require_once 'getdbd.class.php';
$getdbd = new getdbd();
if (!isset($_REQUEST['a'])) {
	exit;
}
switch ($_REQUEST['a']) {
	case 'd':
		if (isset($_REQUEST['id'])) {
			/**@TODO: sanitize input */
			$getdbd->download($_REQUEST['id']);
			
		}
		break;
	case 'b':
		foreach ($_REQUEST as $define => $value) {
			$getdbd->setDefine($define, $value);
		}
		
		if (isset($_REQUEST['makeTarget'])) {
			$getdbd->makeTarget = $_REQUEST['makeTarget'];
		}
		
		$getdbd->mkdbdh();
// 		$getdbd->makeTarget = 'unix';
		$getdbd->make();
		$getdbd->download();
		break;
	default:
		exit;
}
?>
