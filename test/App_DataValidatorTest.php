<?php

require_once('../classes/App/DataValidator.php');

use PHPUnit\Framework\TestCase;

class App_DataValidatorTest extends TestCase
{
    protected function setUp(): void
    {
        $this->val = new App_DataValidator();
    }

    protected function tearDown(): void
    {
        $this->val = NULL;
    }

    public function data_checkArrayForKeysData()
    {
        return array(
            array(["cat" => "dog", "test" => "123"], ['cat', 'test'], true),
            array(["cat" => "dog", "test" => "123"], ['test', 'cat'], true),
            array(["cat" => "dog", "test" => "123"], ['dog'], false),
        );
    }

    /**
     * @dataProvider data_checkArrayForKeysData
     */
    public function test_checkArrayForKeys($array, $keys, $expected)
    {
        $result = $this->val->checkArrayForKeys($array, $keys);
        $this->assertEquals($expected, $result);
    }
}
