<?php

require_once("../conf/config.php");
$val = new App_ValidationFacade();
$isRequestFieldsSet = $val->checkRequestForFields($_GET, ['productType', 'clientType']);

if (!$isRequestFieldsSet) {
    throw new Exception('Некорректные параметры запроса.');
}

$clientType = $_GET['clientType'];
$product = $_GET['productType'];

$xw = new XMLWriter();
$xw->openMemory();
$xw->setIndent(TRUE);
$xw->startDocument("1.0", "UTF-8");
$xw->writePi("xml-stylesheet", "type=\"text/xsl\" href=\"stylesheets/pageRequest.xsl\"");

$title = 'Заявка на ';
if ($product == 'loan') {
    $title .= 'кредит';
} else if ($product == 'deposit') {
    $title .= 'вклад';
}

if ($clientType == 'client') {
    $title .= ' ФЛ';
} else if ($clientType == 'organization') {
    $title .= ' ЮЛ';
}

$xw->startElement('page');
$xw->writeElement('header');
$xw->writeElement('menu');

$xw->startElement('title');
$xw->writeRaw($title);
$xw->endElement();

$xw->startElement('request');

$xw->writeElement('clientType', $clientType);
$xw->writeElement('product', $product);
$xw->endElement();

$xw->writeElement('footer');

$xw->endDocument();
header("Content-Type: text/xml");
echo $xw->flush();
