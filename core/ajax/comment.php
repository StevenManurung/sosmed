<?php 
	include '../init.php';
 
	if(isset($_POST['comment']) && !empty($_POST['comment'])){
		$comment = $getFromU->checkInput($_POST['comment']);
		$user_id = $_SESSION['user_id'];
		$postID = $_POST['post_id'];

		$getFromU->create('comments', array('comment' => $comment, 'commentOn' => $postID, 'commentBy' => $user_id));
		$comments = $getFromT->comments($postID);
		$post = $getFromT->postPopup($postID);

		foreach ($comments as $comment) {
	 			echo '<div class="post-show-popup-comment-box">
						<div class="post-show-popup-comment-inner">
							<div class="post-show-popup-comment-head">
								<div class="post-show-popup-comment-head-left">
									 <div class="post-show-popup-comment-img">
									 	<img src="'.BASE_URL.$comment->profileImage.'">
									 </div>
								</div>
								<div class="post-show-popup-comment-head-right">
									  <div class="post-show-popup-comment-name-box">
									 	<div class="post-show-popup-comment-name-box-name"> 
									 		<a href="'.BASE_URL.'profile.php?username='.$comment->username.'">'.$comment->screenName.'</a>
									 	</div>
									 	<div class="post-show-popup-comment-name-box-tname">
									 		<a href="'.BASE_URL.'profile.php?username='.$comment->username.'">@'.$comment->username.'</a>
									 	</div>
									 </div>
									 <div class="post-show-popup-comment-right-post">
									 		<p><a href="'.BASE_URL.'profile.php?username='.$post->username.'">@'.$post->username.'</a> '.$comment->comment.'</p>
									 </div>
								 	<div class="post-show-popup-footer-menu">
										<ul>
										
											<li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i></a></li>
											'.(($comment->commentBy === $user_id) ?  
											'<li>
												<a href="#" class="more"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
												<ul> 
												  <li><label class="deleteComment" data-post="'.$post->postID.'" data-comment="'.$comment->commentID.'">Delete post</label></li>
												</ul>
											</li>' : '').'
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--POST SHOW POPUP COMMENT inner END-->
						</div>
						';
	 		}
	}
?>