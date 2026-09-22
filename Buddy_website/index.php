<?php
require_once 'config.php';


$taal_id      = isset($_GET['taal']) ? (int)$_GET['taal'] : 0;
$onderwerp_id = isset($_GET['onderwerp']) ? (int)$_GET['onderwerp'] : 0;
$zoek         = isset($_GET['zoek']) ? trim($_GET['zoek']) : '';


$alleTalen = $pdo->query("SELECT * FROM talen ORDER BY naam")->fetchAll();
$alleOnderwerpen = $pdo->query("SELECT * FROM onderwerpen ORDER BY naam")->fetchAll();
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ETBC AT - Vind jouw buddy</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="site-header">
    <div class="container header-inhoud">
        <div class="logo">ETBC <span>AT</span></div>
        <nav>
            <a href="index.php">Vind een buddy</a>
            <a href="#" class="btn-outline">Word buddy</a>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h1>Vind jouw buddy</h1>
        <p>Hulp in jouw taal, voor al je vragen. Kies een buddy die bij jou past.</p>
    </div>
</section>

<div class="container">


    


     
<footer class="site-footer">
    <div class="container">
        <p>&copy; <?= date('Y') ?> ETBC AT - Buddy Systeem. Samen sterker in een nieuw land.</p>
    </div>
</footer>

</body>
</html>
