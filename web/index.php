<?php

require_once("../conf/config.php");
$xw = new XMLWriter();

$xw->openMemory();
$xw->setIndent(TRUE);
$xw->startDocument("1.0", "UTF-8");
$xw->writePi("xml-stylesheet", "type=\"text/xsl\" href=\"stylesheets/pageMain.xsl\"");

$xw->startElement('page');
$xw->writeElement('header');
$xw->writeElement('menu');
$xw->writeElement('footer');
$xw->endElement();

$xw->endDocument();
header("Content-Type: text/xml");
echo $xw->flush();