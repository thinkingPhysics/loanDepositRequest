<?php

interface App_IStorageIO
{
    public function SaveClientRequest($client, $product);
    public function logSession($user);
}
