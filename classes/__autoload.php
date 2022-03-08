<?php

spl_autoload_register('autoload');
function autoload($className)
{
    $path = '..' . DIRECTORY_SEPARATOR . 'classes' . DIRECTORY_SEPARATOR;
    $className = str_replace("_", DIRECTORY_SEPARATOR, $className);
    include $path . $className . '.php';
}
