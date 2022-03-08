<?php

define('annuitetHelp',
    'Аннуитет — график погашения кредита, предполагающий выплату основного долга и процентов по кредиту равными суммами через равные промежутки времени.');
define('depositHelp',
    'При ежемесячной капитализации проценты ежемесячно зачисляются на счёт вклада.
    <br/><br/>
    Если же капитализация осуществляется при закрытии вклада, выплата процентов производится только один раз - в конце срока
    <br/><br/>');


if (($_SERVER['REQUEST_METHOD'] == 'GET' and ($_GET['productType']))) {
    switch ($_GET['productType']) {
        case 'loan':
            echo annuitetHelp;
            break;
        case 'deposit':
            echo depositHelp;
            break;
    }
}
