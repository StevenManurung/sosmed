<?php 
	include '../init.php';
	$getFromU->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));
 	if(isset($_POST) && !empty($_POST)){
		$status     = $getFromU->checkInput($_POST['status']);
		$postImage = '';
		$user_id  = $_SESSION['user_id'];

		if(!empty($status) or !empty($_FILES['file']['name'][0])){

			if(!empty($_FILES['file']['name'][0])){
				$postImage = $getFromU->uploadImage($_FILES['file']);
			}

			if(strlen($status) > 140){
				$error  = "The text of your post is too long";
			}

			$post_id = $getFromU->create('posts', array('status' => $status, 'postBy' => $user_id, 'postImage' => $postImage, 'postedOn' => date('Y-m-d H:i:s')));
			preg_match_all("/#+([a-zA-Z0-9_]+)/i", $status, $hashtag);

			if(!empty($hashtag)){
				$getFromT->addTrend($status);
			}
			$getFromT->addMention($status, $user_id, $post_id);


			$result['success'] = "Your Post has been posted";
			echo json_encode($result);	

		}else {
			$error = "Please type or choose image to post";
		}

		if(isset($error)){
			$result['error'] = $error;
			echo json_encode($result);
		}
	}
 

?>