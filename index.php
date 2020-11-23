<?php
require 'Database/db.php';
require 'include/function.php';
$db = Database::connect();
$Nom = $Prenom = $Telephone = $zone  = $NomError = $PrenomError=  $TelephoneError = $ZoneError ="";
$isSuccess  = $status =  true;
$stmt = $db->prepare('SELECT  * FROM repas_du_jours WHERE id_tm ="0" ');
    $stmt->execute();
    $item = $stmt->fetch();

    $stmt2 = $db->prepare('SELECT  * FROM repas WHERE meal = ? ');
    $stmt2->execute(array($item['today_meal']));
    $img = $stmt2->fetch();


if(!empty($_POST)){
    $Nom = checkInput($_POST['NOM']);
    $Prenom  = checkInput($_POST['Prenom']);
    $Telephone = checkInput($_POST['Telephone']);
    $zone = checkInput($_POST['zone']);

    if(empty($Nom)){
        $NomError = "ce champ ne peut pas etre vide";
        $isSuccess = false;
       }
       if(empty($Prenom)){
        $PrenomError = "ce champ ne peut pas etre vide";
        $isSuccess = false;
       }
       if(empty($Telephone)){
        $TelephoneError = "ce champ ne peut pas etre vide";
        $isSuccess = false;
       }
       if(empty($zone)){
        $ZoneError = "ce champ ne peut pas etre vide";
        $isSuccess = false;
       }


 if($isSuccess){
        $status = false;
        try{
            $db = Database::connect();
            $statement = $db->prepare("Insert into commandemeal (nom,prénom,numero,zone,plat) value(?,?,?,?,?)");
            $statement->execute(array($Nom,$Prenom,$Telephone,$zone,$item['today_meal'])); 
            $status = true;
        }catch(Exception $e){
            die('Erreur : ' . $e->getMessage());
                            }
        Database::disconnect();  
        if($status){
            mail('mehdisnaikidono2@gmail.com','commande','nom :'.$Nom.'prenom: '.$Prenom.'numero: '.$Telephone.'zone de distribution: '.$zone.'plat:'.$item['today_meal'],'From: mehdisnaikidono2@gmail.com');
            header("Location: success.php");
                 } 
            }
         }
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body>
<div class="container">
<div class="left"><div class="titles">
<h1>Le repas du jours:</h1>
    <h2><?=$item['today_meal']?></h2>
</div>
    <div class="image">
    <img src="<?= $img['img_repas']?>" alt="" >
    </div>
    
</div>
<div class="right">
<form class="form" action="" enctype="multipart/form-data" id="formulaire" method="post">
            <h1><strong>commander maintenant</strong></h1>
            <!-- nom -->
            <div class="form-group" enctype="multipart/form-data">
                <input type="text" name="NOM"  id="name" placeholder="Nom"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $NomError; ?>
                </span>                
                </div> 
                 <!--prenom  -->
                <div class="form-group" enctype="multipart/form-data">
                <input type="text" name="Prenom"  id="Prenom" placeholder="Prenom"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $PrenomError; ?>
                </span>                
                </div> 
                <!-- tel -->
                <div class="form-group" enctype="multipart/form-data">
                <input type="text" name="Telephone"  id="Telephone" placeholder="Telephone"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $TelephoneError; ?>
                </span>                
                </div>
                <!-- zone de livraison -->
                <div class="form-group" enctype="multipart/form-data">
                <input type="text" name="zone"  id="zone" placeholder="zone de livraison"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $ZoneError; ?>
                </span>                
                </div> 
            
            <div class="form-actions">
            
            <button type="submit" class="btn btn-success" > <span class="glyphicon glyphicon-pencil"></span>confirmer   </button>
           
            </div>
                 </form>

</div>
   
</div>
    
</body>
</html>