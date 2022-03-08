<?php


class App_DataValidator
{

    public $errors;

    public function checkArrayForKeys(array $array, array $fields)
    {
        foreach ($fields as $key) {
            if (!isset($array[$key])) {
                return false;
            } else {
                return true;
            }
        }
    }

    public function checkPropertiesIsNotNull($entity)
    {
        $pass = true;
        foreach ($entity as $key => $value) {
            if (!$entity->$key) {
                $pass = false;
            }
        }
        return $pass;
    }

    public function validateWithRegExp($data, $regexp)
    {
        if (!preg_match($regexp, $data, $match) > 0) {
            return false;
        }
        return true;
    }

    public function validateNameSurnameEtc($array)
    {
        $booleanResult = true;
        $regexp = "/^(([a-zA-Z' -]{1,33})|([а-яА-ЯЁё-]{1,33}))$/u";
        foreach ($array as $string) {
            if ($this->validateWithRegExp($string, $regexp) == false) {
                $this->errors[] = "Ошибка в полях ФИО: некорректное значение {$string}";
                $booleanResult = false;
            }
        }
        return $booleanResult;
    }

    public function validateINN($inn)
    {
        $regexp = "/^(\d{12}|\d{10})$/";

        $booleanResult = $this->validateWithRegExp($inn, $regexp);

        if ($booleanResult === false) {
            $this->errors[] = "Ошибка в поле ИНН: некорректное значение {$inn}";
        }
        return $booleanResult;
    }

    public function validatePassport($series, $number)
    {
        $regexp1 = "/^(\d){4}$/u";
        $regexp2 = "/^(\d){6}$/u";

        $booleanResult1 = $this->validateWithRegExp($series, $regexp1);
        $booleanResult2 = $this->validateWithRegExp($number, $regexp2);

        if (($booleanResult1 === true) and ($booleanResult2 === true)) {
            return true;
        } else {
            $this->errors[] = 'Ошибка в полях серии и номера паспорта: некорректное значение';
            return false;
        }
    }

    public function validateKPP($kpp)
    {
        $regexp = "/^\d{9}$/";

        $booleanResult = $this->validateWithRegExp($kpp, $regexp);

        if ($booleanResult === false) {
            $this->errors[] = "Ошибка в поле КПП: некорректное значение {$kpp}";
        }
        return $booleanResult;
    }

    public function validateOGRN($ogrn)
    {
        $regexp = "/^\d{13}$/";

        $booleanResult = $this->validateWithRegExp($ogrn, $regexp);

        if ($booleanResult === false) {
            $this->errors[] = "Ошибка в поле ОГРН: некорректное значение {$ogrn}";
        }
        return $booleanResult;
    }
}
