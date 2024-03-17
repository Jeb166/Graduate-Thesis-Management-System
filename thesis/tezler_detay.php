<?php
include("db/db.php");

$thesis_no = intval($_GET['thesis_no']); 

$stmt = $db->prepare("SELECT t.thesis_no, CONCAT_WS(' ',p1.personName, p1.personSurname) author,  CONCAT_WS(' ',p2.personName, p2.personSurname) supervisor, 
i.instituteName, u.universityName, l.languageName, t.type, t.title, t.abstract, t.year, t.submissionDate, t.numberOfPages, GROUP_CONCAT(DISTINCT s.subjectName) subject, GROUP_CONCAT(DISTINCT k.keywordName) keyword
FROM thesis t
LEFT JOIN person p1 ON p1.id=t.author_id
LEFT JOIN person p2 ON p2.id=t.supervisor_id
LEFT JOIN institute i ON i.id=t.institute_id
LEFT JOIN university u ON u.id=i.university_id
LEFT JOIN language l ON l.id=t.language_id
LEFT JOIN thesis_subject ts ON ts.thesis_id = t.thesis_no
LEFT JOIN subject s ON ts.subject_id = s.id
LEFT JOIN thesis_keyword tk ON tk.thesis_id = t.thesis_no
LEFT JOIN keyword k ON tk.keyword_id = k.id
WHERE thesis_no=?");
$stmt->execute([$thesis_no]); 
$tez = $stmt->fetch(5);

if(!$tez){
    header("Location: ./tezler.php");
    die();
}
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tez Merkezi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
</head>

<body>
    <header class="container">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="./index.php">Anasayfa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./tezler.php">Tezler</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Kategoriler</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./universiteler.php">Üniversiteler</a></li>
                            <li><a class="dropdown-item" href="./fakulteler.php">Fakülteler</a></li>
                            <li><a class="dropdown-item" href="./kisiler.php">Kişiler</a></li>
                            <li><a class="dropdown-item" href="./konular.php">Konular</a></li>
                            <li><a class="dropdown-item" href="./etiketler.php">Anahtar Kelimeler</a></li>
                            <li><a class="dropdown-item" href="./diller.php">Diller</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <nav class="container" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./index.php">Anasayfa</a></li>
            <li class="breadcrumb-item"><a href="./tezler.php">Tezler</a></li>
            <li class="breadcrumb-item active" aria-current="page">Tez Detayı</li>
        </ol>
    </nav>
    <main class="container">
        <h1>Tez Detayları</h1>
        <table class="table table-bordered table-striped" style="width:100%">
            <tbody>
                <tr>
                    <td>Tez No</td>
                    <td><?php echo $tez->thesis_no ?></td> 
                </tr>
                <tr>
                    <td style="min-width: 150px;" >Başlık</td>
                    <td><?php echo $tez->title ?></td>
                </tr>
                <tr>
                    <td>Yazar</td>
                    <td><?php echo $tez->author ?></td> 
                </tr>
                <tr>
                    <td>Danışman</td>
                    <td><?php echo $tez->supervisor ?></td> 
                </tr>
                <tr>
                    <td>Tip</td>
                    <td><?php echo $tez->type ?></td>
                </tr>
                <tr>
                    <td>Yıl</td>
                    <td><?php echo $tez->year ?></td>
                </tr>
                <tr>
                    <td>Tarih</td>
                    <td><?php echo date('d.m.Y', strtotime($tez->submissionDate)) ?></td>
                </tr>
                <tr>
                    <td>Üniversite</td>
                    <td><?php echo $tez->instituteName.'<br><b>'.$tez->universityName.'</b>' ?></td> 
                </tr>
                <tr>
                    <td>Dil</td>
                    <td><?php echo $tez->languageName ?></td> 
                </tr>
                <tr>
                    <td>Sayfa Sayısı</td>
                    <td><?php echo $tez->numberOfPages ?></td>
                </tr>
                <tr>
                    <td>Konu</td>
                    <td><?php echo str_replace(",", ", ", ($tez->subject ? $tez->subject : "")) ?></td> 
                </tr>
                <tr>
                    <td>Özet</td>
                    <td><?php echo $tez->abstract ?></td>
                </tr>
                <tr>
                    <td>Anahtar Kelimeler</td>
                    <td><?php echo str_replace(",", ", ", ($tez->keyword ? $tez->keyword : "")) ?></td> 
                </tr>
            </tbody>
        </table>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>