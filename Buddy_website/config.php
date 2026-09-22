<?php


$host = "localhost";       
$dbname = "db_buddy_systeem";     
$username = "yanyueyukai";         
$password = "wuyankai200781Ab";             
try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException $e) {
    die("Databaseverbinding mislukt: " . $e->getMessage());
}


function getTalenVanBuddy($pdo, $buddy_id) {
    $stmt = $pdo->prepare("
        SELECT t.naam FROM talen t
        JOIN buddy_talen bt ON t.id = bt.taal_id
        WHERE bt.buddy_id = ?
        ORDER BY t.naam
    ");
    $stmt->execute([$buddy_id]);
    return $stmt->fetchAll(PDO::FETCH_COLUMN);
}


function getOnderwerpenVanBuddy($pdo, $buddy_id) {
    $stmt = $pdo->prepare("
        SELECT o.naam FROM onderwerpen o
        JOIN buddy_onderwerpen bo ON o.id = bo.onderwerp_id
        WHERE bo.buddy_id = ?
        ORDER BY o.naam
    ");
    $stmt->execute([$buddy_id]);
    return $stmt->fetchAll(PDO::FETCH_COLUMN);
}


function getReviewInfo($pdo, $buddy_id) {
    $stmt = $pdo->prepare("
        SELECT AVG(sterren) AS gemiddeld, COUNT(*) AS aantal
        FROM reviews WHERE buddy_id = ?
    ");
    $stmt->execute([$buddy_id]);
    return $stmt->fetch();
}


function avatarInitialen($voornaam, $achternaam) {
    return strtoupper(substr($voornaam, 0, 1) . substr($achternaam, 0, 1));
}
