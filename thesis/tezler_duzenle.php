<?php
include("db/db.php");

$thesis_no = intval($_GET['thesis_no']); 

$stmt = $db->prepare("SELECT * FROM thesis WHERE thesis_no=?");
$stmt->execute([$thesis_no]); 
$tez = $stmt->fetch(5);

if(!$tez){
    header("Location: ./tezler.php");
    die();
}

if (isset($_POST['submit_button'])) { 

    $params = [
        intval($_POST['author_id']),
        intval($_POST['supervisor_id']),
        intval($_POST['institute_id']),
        intval($_POST['subject'][0]),
        intval($_POST['language_id']),
        $_POST['type'],
        $_POST['title'],
        $_POST['abstract'],
        intval($_POST['year']),
        intval($_POST['numberOfPages']),
        $_POST['submissionDate'],
        $tez->thesis_no
    ];

    $sql = "UPDATE thesis SET author_id=?, supervisor_id=?, institute_id=?, subject_id=?, language_id=?, type=?, title=?, abstract=?, year=?, numberOfPages=?, submissionDate=? WHERE thesis_no=? LIMIT 1";
    $stmt= $db->prepare($sql);
    $stmt->execute($params);

    $sql = "DELETE FROM thesis_subject WHERE thesis_id=?";
    $stmt= $db->prepare($sql);
    $stmt->execute([$tez->thesis_no]);

    $sql = "DELETE FROM thesis_keyword WHERE thesis_id=?";
    $stmt= $db->prepare($sql);
    $stmt->execute([$tez->thesis_no]);

    foreach($_POST['subject'] as $subject){
        $sql = "INSERT INTO thesis_subject (thesis_id, subject_id) VALUES (?, ?)";
        $stmt= $db->prepare($sql);
        $stmt->execute([$tez->thesis_no, $subject]);
    }

    foreach($_POST['keyword'] as $keyword){
        $sql = "INSERT INTO thesis_keyword (thesis_id, keyword_id) VALUES (?, ?)";
        $stmt= $db->prepare($sql);
        $stmt->execute([$tez->thesis_no, $keyword]);
    }

    header("Location: ./tezler_duzenle.php?thesis_no=".$tez->thesis_no);
    die();
}

$persons = $db->query("SELECT id, CONCAT_WS(' ', personName,  personSurname) person FROM person ORDER BY personName, personSurname")->fetchAll(5);

$institutes = $db->query("SELECT i.id, CONCAT_WS(' - ', u.universityName, i.instituteName) institute FROM institute i
LEFT JOIN university u ON u.id=i.university_id
ORDER BY u.universityName, i.instituteName")->fetchAll(5);

$languages = $db->query("SELECT id, languageName FROM language ORDER BY languageName")->fetchAll(5);

$stmt = $db->prepare("SELECT s.*, IF(ts.thesis_id IS NOT NULL,1,0) is_checked FROM subject s
LEFT JOIN thesis_subject ts ON ts.subject_id=s.id AND ts.thesis_id=?");
$stmt->execute([$thesis_no]); 
$subjects = $stmt->fetchAll(5);

$stmt = $db->prepare("SELECT k.*, IF(tk.thesis_id IS NOT NULL,1,0) is_checked FROM keyword k
LEFT JOIN thesis_keyword tk ON tk.keyword_id=k.id AND tk.thesis_id=?");
$stmt->execute([$thesis_no]); 
$keywords = $stmt->fetchAll(5);
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
            <li class="breadcrumb-item active" aria-current="page">Tez Düzenle</li>
        </ol>
    </nav>
    <main class="container">
        <h1>Tez Düzenle</h1>
        <form style="display:flex; flex-direction: column; gap: 16px;" method="POST" action="tezler_duzenle.php?thesis_no=<?php echo $tez->thesis_no ?>" >
            <div>
                <label class="form-label">Tez Başlığı</label>
                <input type="text" class="form-control" placeholder="Lütfen giriniz" name="title" value="<?php echo $tez->title ?>" required>
            </div>
            <div>
                <label class="form-label">Yazar</label>
                <select class="form-select" name="author_id" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php foreach($persons as $person): ?>
                    <option value="<?php echo $person->id ?>" <?php echo $person->id==$tez->author_id ? 'selected="selected"' : '' ?> ><?php echo $person->person ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Danışman</label>
                <select class="form-select" name="supervisor_id" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php foreach($persons as $person): ?>
                    <option value="<?php echo $person->id ?>" <?php echo $person->id==$tez->supervisor_id ? 'selected="selected"' : '' ?> ><?php echo $person->person ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Tez Tipi</label>
                <select class="form-select" name="type" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php foreach(['Master','Doctorate','Specilization in Medicine','Proficiency in Art'] as $type): ?>
                    <option value="<?php echo $type ?>" <?php echo $type==$tez->type ? 'selected="selected"' : '' ?> ><?php echo $type ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Yıl</label>
                <select class="form-select" name="year" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php for($i=date('Y'); $i>=date('Y')-30; $i--): ?>
                    <option value="<?php echo $i ?>" <?php echo $i==$tez->year ? 'selected="selected"' : '' ?> ><?php echo $i ?></option>
                    <?php endfor; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Tarih</label> 
                <input type="date" class="form-control" name="submissionDate" value="<?php echo $tez->submissionDate ?>" required>
            </div>

            <div>
                <label class="form-label">Fakülte</label>
                <select class="form-select" name="institute_id" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php foreach($institutes as $institute): ?>
                    <option value="<?php echo $institute->id ?>" <?php echo $institute->id==$tez->institute_id ? 'selected="selected"' : '' ?> ><?php echo $institute->institute ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Dil</label> 
                <select class="form-select" name="language_id" >
                    <option selected>Lütfen Seçiniz</option>
                    <?php foreach($languages as $language): ?>
                    <option value="<?php echo $language->id ?>" <?php echo $language->id==$tez->language_id ? 'selected="selected"' : '' ?> ><?php echo $language->languageName ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label class="form-label">Sayfa Sayısı</label>
                <input type="number" class="form-control" placeholder="Lütfen giriniz" name="numberOfPages" value="<?php echo $tez->numberOfPages ?>" required>
            </div>
            <div>
                <label class="form-label">Konu</label><br>
                <?php foreach($subjects as $subject): ?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" name="subject[]" type="checkbox" id="inpSubject<?php echo $subject->id ?>" value="<?php echo $subject->id ?>" <?php echo $subject->is_checked ? 'checked="checked"' : '' ?> >
                    <label class="form-check-label" for="inpSubject<?php echo $subject->id ?>"><?php echo $subject->subjectName ?></label>
                </div>
                <?php endforeach; ?>
            </div>
            <div>
                <label class="form-label">Özet</label>
                <textarea class="form-control" placeholder="Lütfen giriniz" name="abstract" rows="10" ><?php echo $tez->abstract ?></textarea>
            </div>
            <div>
                <label class="form-label">Anahtar Kelimeler</label><br>
                <?php foreach($keywords as $keyword): ?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" name="keyword[]" type="checkbox" id="inpKeyword<?php echo $keyword->id ?>" value="<?php echo $keyword->id ?>" <?php echo $keyword->is_checked ? 'checked="checked"' : '' ?> >
                    <label class="form-check-label" for="inpKeyword<?php echo $keyword->id ?>"><?php echo $keyword->keywordName ?></label>
                </div>
                <?php endforeach; ?>
            </div>
            <button type="submit" name="submit_button" class="btn btn-primary">Kaydet</button>
        </form>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>