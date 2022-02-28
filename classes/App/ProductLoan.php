<?php

class App_ProductLoan extends App_Product
{
    public $loanAmount;
    public $loanPaymentSchedule;

    public function __construct()
    {
        if ($_POST) {
            $this->productType = $_GET['productType'];
            $this->openDate = $_POST['openDate'];
            $this->termInMonths = $_POST['termInMonths'];
            $this->loanAmount = $_POST['loanAmount'];
            $this->loanPaymentSchedule = $_POST['loanPaymentSchedule'];
            $counter = new App_DateCounter();
            $this->closeDate=$counter->addMonthsToDate($this->openDate,$this->termInMonths);
            }
    }
}