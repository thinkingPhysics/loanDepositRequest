<?php

class App_ValidationFacade
{
    public $validator;

    public function __construct() {
       $this->validator = new App_DataValidator();
    }

    public function checkRequestForFields(array $array, array $fields) {
        $result=$this->validator->checkArrayForKeys($array, $fields);
        return $result;
    }

    public function checkInputObjects($client,$product) {
        $this->validator->checkPropertiesIsNotNull($client);
        $this->validator->checkPropertiesIsNotNull($product);
        $this->validator->validateNameSurnameEtc([$client->name, $client->surname, $client->patronym]);
        $this->validator->validateINN($client->inn);
        $this->validator->validatePassport($client->passportSeries, $client->passportNumber);

        if ($client->clientType == 'organization') {
            $this->validator->validateINN($client->orgINN);
            $this->validator->validateKPP($client->orgKPP);
            $this->validator->validateOGRN($client->orgOGRN);
        }
        return $this->validator->errors;
    }
}