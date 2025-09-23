<?php
$DB_HOST = '10.10.20.11';   
$DB_NAME = 'prova'; 
$DB_USER = 'paolo';          
$DB_PASS = 'admin';        
// Output testuale per verificare subito l'esito
header('Content-Type: text/plain');

try {
	//Apre la connessione usando la codifica utf8mb4, che permette di leggere qualsiasi carattere, e gestisce gli errori attraverso le eccezioni.
	$pdo = new PDO(
		"mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4",
		$DB_USER,
		$DB_PASS,
		[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
	);
	echo "Sei connesso a $DB_HOST/$DB_NAME come $DB_USER\n";

} catch (PDOException $e) {
    http_response_code(500);
	echo "Errore nella connessione: " . $e->getMessage() . "\n";
}
?>
