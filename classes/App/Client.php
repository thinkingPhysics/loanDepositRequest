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

    public function __construct()
    {
        if (($_POST) and ($_GET)) {
            $this->clientType = $_GET['clientType'];
            $this->surname = trim($_POST['surname']);
            $this->name = trim($_POST['name']);
            $this->patronym = trim($_POST['patronym']);
            $this->inn = trim($_POST['inn']);
            $this->dateOfBirth = $_POST['dateOfBirth'];
            $this->passportSeries = trim($_POST['passportSeries']);
            $this->passportNumber = trim($_POST['passportNumber']);
            $this->passportDate = $_POST['passportDate'];
        }

        if (($_POST) and ($this->clientType === 'organization')) {
            $this->orgName = trim($_POST['orgName']);
            $this->orgAddress = trim($_POST['orgAddress']);
            $this->orgOGRN = trim($_POST['orgOGRN']);
            $this->orgINN = trim($_POST['orgINN']);
            $this->orgKPP = trim($_POST['orgKPP']);
        }
    }
}