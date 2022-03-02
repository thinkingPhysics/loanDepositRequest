<?php


class App_User
{

    public $ip;
    public $ipForwarded;
    public $userAgent;
    public $session;

    public function __construct()
    {
        session_start();
        $_SESSION['auth'] = true;
        $this->ip  = $_SERVER['REMOTE_ADDR'];
        $this->ipForwarded = $_SERVER['HTTP_X_FORWARDED_FOR'];
        $this->userAgent = $_SERVER['HTTP_USER_AGENT'];
        $this->session = $_COOKIE['PHPSESSID'];
    }
}