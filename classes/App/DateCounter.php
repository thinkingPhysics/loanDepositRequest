<?php

class App_DateCounter
{
    public function addMonthsToDate($date,$months)
    {
        $date = new DateTime($date);
        $date->modify($months . ' month');
        return $date->format('Y-m-d');
    }
}