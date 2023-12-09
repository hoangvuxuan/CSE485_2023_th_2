<?php
include ("./connect.php");
 
if(!empty($_POST["name"]) && !empty($_POST["comment"])){
	$query = "INSERT INTO comment (parent_id, comment, sender) 
                        VALUES (:id, :comment, :sender)";

 
	$stmt = $conn->prepare($query);
    $stmt->execute(['id' => $_POST["commentId"], 'comment' => $_POST["comment"], 'sender' => $_POST["name"]]);	
	$message = '<label class="text-success">Comment posted Successfully.</label>';
	$status = array(
		'error'  => 0,
		'message' => $message
	);	
} else {
	$message = '<label class="text-danger">Error: Comment not posted.</label>';
	$status = array(
		'error'  => 1,
		'message' => $message
	);	
}
echo json_encode($status);
?>