<?php
include_once("connect.php");
$query = "SELECT id, parent_id, comment, sender, date FROM comment WHERE parent_id = '0' ORDER BY id DESC";

$stmt = $conn->prepare($query);
$stmt -> execute();
$comments = $stmt->fetchAll();

$commentHTML = '';
foreach($comments as $comment){
     

   
	$commentHTML .= '
		<div class="panel panel-primary">
		<div class="panel-heading">By <b>'.$comment["sender"].'</b> on <i>'.$comment["date"].'</i></div>
		<div class="panel-body">'.$comment["comment"].'</div>
		<div class="panel-footer" align="right"><button type="button" onclick="myFunction('.$comment["id"].')" class="btn btn-primary reply" id="11'.$comment["id"].'">Reply</button></div>
		<div id = "'.$comment["id"].'">comment: </div>
		</div> ';
	//$commentHTML .= getCommentReply($conn, $comment["id"]);
}
echo $commentHTML;
?>