<?php
include("db/db.php");

$tezler = $db->query("
SELECT t.thesis_no, CONCAT_WS(' ',p1.personName, p1.personSurname) author, i.instituteName, u.universityName, t.type, t.title, t.year, GROUP_CONCAT(s.subjectName) subject FROM thesis t
LEFT JOIN person p1 ON p1.id=t.author_id
LEFT JOIN institute i ON i.id=t.institute_id
LEFT JOIN university u ON u.id=i.university_id
LEFT JOIN thesis_subject ts ON ts.thesis_id = t.thesis_no
LEFT JOIN subject s ON ts.subject_id = s.id
GROUP BY t.thesis_no
")->fetchAll(5);
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
        </ol>
    </nav>
    <main class="container">
        <h1>Tezler</h1>
        <table id="tbl_thesis" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                    <th>Tez No</th>
                    <th>Tez Başlığı</th>
                    <th>Tez Yazarı</th>
                    <th>Tipi</th>
                    <th>Yıl</th>
                    <th>Üniversite</th>
                    <th>Konu</th>
                    <th>Tez Detayı</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($tezler as $tez): ?>
                <tr>
                    <td><?php echo $tez->thesis_no ?></td>
                    <td><?php echo $tez->title ?></td>
                    <td><?php echo $tez->author ?></td>
                    <td><?php echo $tez->type ?></td>
                    <td><?php echo $tez->year ?></td>
                    <td><?php echo $tez->instituteName.'<br><b>'.$tez->universityName.'</b>' ?></td>
                    <td><?php echo str_replace(",", ", ", ($tez->subject ? $tez->subject : "")) ?></td>
                    <td>
                        <div class="d-flex" style="gap:4px;">
                            <a href="tezler_detay.php?thesis_no=<?php echo $tez->thesis_no; ?>" class="btn btn-info" role="button"><i class="fa-sharp fa-solid fa-circle-info"></i></a>
                            <a href="tezler_duzenle.php?thesis_no=<?php echo $tez->thesis_no; ?>" class="btn btn-warning" role="button"><i class="fa-solid fa-pen-to-square"></i></a>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <br>
        <a class="btn btn-primary btn-lg" href="./yeni_tez.php" role="button">Yeni Tez Ekle</a>
        </br>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>
    
    <script>
    $( document ).ready(function() {
        new DataTable('#tbl_thesis', {
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/tr.json',
            },
        });
    });   
    </script>
</body>

</html>