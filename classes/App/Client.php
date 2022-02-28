<?php

class App_Client
{
    protected $clientID;

    public $clientType;
    public $surname;
    public $name;
    public $patronym;
    public $inn;
    public $dateOfBirth;
    public $passportSeries;
    public $passportNumber;
    public $passportDate;

    public $orgName;
    public $orgAddress;
    public $orgOGRN;
    public $orgINN;
    public $orgKPP;

    public function __construct() {
        if (($_POST) and ($_GET)) {
            $this->clientType = $_GET['clientType'];
            $this->surname = $_POST['surname'];
            $this->name = $_POST['name'];
            $this->patronym = $_POST['patronym'];
            $this->inn = $_POST['inn'];
            $this->dateOfBirth = $_POST['dateOfBirth'];
            $this->passportSeries = $_POST['passportSeries'];
            $this->passportNumber = $_POST['passportNumber'];
            $this->passportDate = $_POST['passportDate'];
        }

        if (($_POST) and ($this->clientType === 'organization')) {
            $this->orgName = $_POST['orgName'];
            $this->orgAddress = $_POST['orgAddress'];
            $this->orgOGRN = $_POST['orgOGRN'];
            $this->orgINN = $_POST['orgINN'];
            $this->orgKPP = $_POST['orgKPP'];
        }
    }
}