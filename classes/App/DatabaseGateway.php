<?php

class App_DatabaseGateway implements App_IStorageIO
{
    private static $instances = [];

    protected function __clone() {

    }
    public function __wakeup()
    {
        throw new \Exception("Невозможно десериализовать (реализация паттерна Singleton)");
    }

    protected function __construct()
    {
        $conf=parse_ini_file('../conf/config.ini');
        $dsn = "mysql:host={$conf['host']};dbname={$conf['db']};charset={$conf['charset']}";
        $opt = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ];
        $this->pdo = new PDO($dsn, $conf['user'], $conf['pass'], $opt);
    }

    public static function getInstance()
    {
        $class = static::class;
        if (!isset(self::$instances[$class])) {
            self::$instances[$class] = new static();
        }

        return self::$instances[$class];
    }

    public function saveClientRequest($client, $product)
    {
        if ($client->clientType=="client") {}
        try {
            $sql = "INSERT INTO clients (clientType, surname, name, patronym, inn, dateOfBirth, passportSeries, passportNumber, passportDate,
                                        orgName, orgAddress, orgOGRN, orgINN, orgKPP) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $stmt = $this->pdo->prepare($sql);
            $this->pdo->beginTransaction();

            $stmt->execute([
                $client->clientType,
                $client->surname,
                $client->name,
                $client->patronym,
                $client->inn,
                $client->dateOfBirth,
                $client->passportSeries,
                $client->passportNumber,
                $client->passportDate,
                $client->orgName,
                $client->orgAddress,
                $client->orgOGRN,
                $client->orgINN,
                $client->orgKPP
            ]);
            $product->clientID = $this->pdo->lastInsertId();

            $sql = "INSERT INTO products (clientID, productType, openDate, closeDate, termInMonths,
                                          depositRate, depositCapitalization, loanAmount, loanPaymentSchedule) VALUES (?,?,?,?,?,?,?,?,?)";
            $stmt = $this->pdo->prepare($sql);

            switch ($product->productType) {
                case 'loan':
                    $product->depositRate=NULL;
                    $product->depositCapitalization=NULL;
                    break;
                case 'deposit':
                    $product->loanAmount=NULL;
                    $product->loanPaymentSchedule=NULL;
                    break;
            }
            $stmt->execute([
                $product->clientID,
                $product->productType,
                $product->openDate,
                $product->closeDate,
                $product->termInMonths,
                $product->depositRate,
                $product->depositCapitalization,
                $product->loanAmount,
                $product->loanPaymentSchedule]);

            $this->pdo->commit();

        } catch (Exception $e) {
            $this->pdo->rollback();
            throw $e;
        }
    }

    public function getAllRequests()
    {
    //  $sql = "SELECT * FROM LIST ORDER BY clientID DESC LIMIT ?,?";
        $sql = "SELECT * FROM clients";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $data = $stmt->fetchAll();
        return $data;
    }

    public function logSession($user) {
        try {
        $sql = "INSERT INTO sessions (ip,ipForwarded,userAgent,session) VALUES (?,?,?,?)";
        $stmt = $this->pdo->prepare($sql);
        $this->pdo->beginTransaction();
        $stmt->execute([
            $user->ip,
            $user->ipForwarded,
            $user->userAgent,
            $user->session,
        ]);
        $this->pdo->commit();
        }
        catch (SomeException $e) {}
    }


}