<?php

class App_ProductDeposit extends App_Product
{
    public $depositRate;
    public $depositCapitalization;

    public function __construct()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->productType = $_GET['productType'];
            $this->openDate = $_POST['openDate'];
            $this->termInMonths = $_POST['termInMonths'];
            $this->depositRate = $_POST['depositRate'];
            $this->depositCapitalization = $_POST['depositCapitalization'];
            $counter = new App_DateCounter();
            $this->closeDate = $counter->addMonthsToDate($this->openDate, $this->termInMonths);
        }
    }
}
