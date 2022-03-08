<?php


class App_Spy
{
    public function writeLog($user, $dbGateway)
    {
        $interfaces = class_implements($dbGateway);
        if ($interfaces['App_IStorageIO']) {
            $dbGateway->logSession($user);
        }
    }
}