<?php 
	include '../init.php';
	$getFromU->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));
	if(isset($_POST['showImage']) && !empty($_POST['showImage'])){
		$post_id   = $_POST['showImage'];
 		$user_id    = @$_SESSION['user_id'];
		$post      = $getFromT->postPopup($post_id);
		$likes      = $getFromT->likes($user_id,$post_id);
		$repost    = $getFromT->checkRepost($post_id,$user_id);
	}
	
?>
<div class="img-popup">
<div class="wrap6">
<span class="colose">
	<button class="close-imagePopup"><i class="fa fa-times" aria-hidden="true"></i></button>
</span>
<div class="img-popup-wrap">
	<div class="img-popup-body">
		<img src="<?php echo BASE_URL.$post->postImage;?>"/>
	</div>
	<div class="img-popup-footer">
		<div class="img-popup-post-wrap">
			<div class="img-popup-post-wrap-inner">
				<div class="img-popup-post-left">
					<img src="<?php echo BASE_URL.$post->profileImage;?>"/>
				</div>
				<div class="img-popup-post-right">
					<div class="img-popup-post-right-headline">
						<a href="<?php echo BASE_URL.'profile.php?username='.$post->username;?>"><?php echo $post->screenName;?></a><span>@<?php echo $post->username . ' - ' .$getFromU->timeAgo($post->postedOn)	;?></span>
					</div>
					<div class="img-popup-post-right-body">
						<?php echo $getFromT->getPostLinks($post->status);?>
					</div>
				</div>
			</div>
		</div>
		<div class="img-popup-post-menu">
			<div class="img-popup-post-menu-inner">
				<?php 
					echo '<ul> 
						'.(($getFromU->loggedIn()) ?   '
								<li><button><i class="fa fa-share" aria-hidden="true"></i></button></li>	
								<li>'.(($post->postID === isset($repost['repostID']) OR $user_id === isset($repost['repostBy'])) ? '<button class="reposted" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-retweet" aria-hidden="true"></i><span class="repostsCount">'.(($post->repostCount > 0) ? $post->repostCount : '').'</span></button>' : '<button class="repost" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-retweet" aria-hidden="true"></i><span class="repostsCount">'.(($post->repostCount > 0) ? $post->repostCount : '').'</span></button>').'</li>
								<li>'.((isset($likes['likeOn']) == $post->postID) ? '<button class="unlike-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>' : '<button class="like-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>').'</li>
								'.(($post->postBy === $user_id) ? ' 
								<li>
									<a href="#" class="more"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
									<ul> 
									  <li><label class="deletePost" data-post="'.$post->postID.'">Delete Post</label></li>
									</ul>
								</li>' : '').'
							' : '
								<li><button><i class="fa fa-share" aria-hidden="true"></i></button></li>	
								<li><button><i class="fa fa-retweet" aria-hidden="true"></i></button></li>	
								<li><button><i class="fa fa-heart-o" aria-hidden="true"></i></button></li>	
							').'
						</ul>';
				?>
			</div>
		</div>
	</div>
</div>
</div>
</div><!-- Image PopUp ends-->