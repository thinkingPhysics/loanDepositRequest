<?php

require_once("../conf/config.php");
$val=new App_ValidationFacade();
$isRequestFieldsSet = $val->checkRequestForFields($_GET,['productType','clientType']);
if (!$isRequestFieldsSet) {
    throw new Exception('Некорректные параметры запроса.');
}
if ($_POST and $_GET) {
    $client = new App_Client();

    switch ($_GET['productType']) {
        case 'loan':
            $product = new App_ProductLoan();
            break;
        case 'deposit':
            $product = new App_ProductDeposit();
            break;
    }
$errors=$val->checkInputObjects($client,$product);
    if ($errors) {
        foreach ($errors as $error) {
            echo $error."<br>";
        }
    } else {
        $dbGateway = App_DatabaseGateway::getInstance();
        $dbGateway->saveClientRequest($client,$product);

        $spy = new App_Spy();
        $user = new App_User();

        $spy->writeLog($user,$dbGateway);

        header('Location: success.php');
        exit;
    }
}