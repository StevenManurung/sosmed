<?php 

	include 'core/init.php';

	if(isset($_GET['hashtag']) && !empty($_GET['hashtag'])){
		$hashtag  = $getFromU->checkInput($_GET['hashtag']);
		$user_id  = @$_SESSION['user_id'];
		$user     = $getFromU->userData($user_id);
		$posts   = $getFromT->getPostsByHash($hashtag);
		$accounts = $getFromT->getUsersByHash($hashtag);
		$notify  = $getFromM->getNotificationCount($user_id);

   	}else{
		header('Location: index.php');
	}
?>
<!doctype html>
<html>

<head>
	<title>#
		<?php echo $hashtag;?> Hashtag on Posty
	</title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.css" />
	<link rel="stylesheet" href="<?php echo BASE_URL;?>assets/css/style-complete.css" />
	<script src="assets/js/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
</head>
<!--Helvetica Neue-->

<body>
	<div class="wrapper">
		<!-- header wrapper -->
		<div class="header-wrapper">
			<div class="nav-container">
				<div class="nav">
					<div class="nav-left">
						<ul>
							<li><a href="<?php echo BASE_URL;?>"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
							</li>
							<?php if($getFromU->loggedIn()=== true){?>
							<li><a href="<?php echo BASE_URL;?>i/notifications"><i class="fa fa-bell"
										aria-hidden="true"></i>Notifications<span id="notificaiton">
										<?php if($notify->totalN > 0){echo '<span class="span-i">'.$notify->totalN.'</span>';}?>
									</span></a></li>
							<li id="messagePopup"><i class="fa fa-envelope" aria-hidden="true"></i>Messages<span
									id="messages">
									<?php if($notify->totalM > 0){echo '<span class="span-i">'.$notify->totalM.'</span>';}?>
								</span></li>
							<?php }?>
						</ul>
					</div><!-- nav left ends-->
					<div class="nav-right">
						<ul>
							<li><input type="text" placeholder="Search" class="search" /><i class="fa fa-search"
									aria-hidden="true"></i>
								<div class="search-result">
								</div>
							</li>
							<?php if($getFromU->loggedIn() === true){?>
							<li class="hover"><label class="drop-label" for="drop-wrap1"><img
										src="<?php echo BASE_URL.$user->profileImage;?>" /></label>
								<input type="checkbox" id="drop-wrap1">
								<div class="drop-wrap">
									<div class="drop-inner">
										<ul>
											<li><a href="<?php echo BASE_URL.$user->username;?>">
													<?php echo $user->username;?>
												</a></li>
											<li><a href="<?php echo BASE_URL;?>settings/account">Settings</a></li>
											<li><a href="<?php echo BASE_URL;?>includes/logout.php">Log out</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li><label class="addPostBtn" for="pop-up-post">Post</label></li>
							<?php } else{
							echo '<li><a href="'.BASE_URL.'/index.php">Have an account? Log in!</a></li>';
						}
				?>
						</ul>
					</div><!-- nav right ends-->
				</div><!-- nav ends -->
			</div><!-- nav container ends -->
		</div><!-- header wrapper end -->


		<!--#hash-header-->
		<div class="hash-header">
			<div class="hash-inner">
				<h1>#
					<?php echo $hashtag;?>
				</h1>
			</div>
		</div>
		<!--#hash-header end-->

		<!--hash-menu-->
		<div class="hash-menu">
			<div class="hash-menu-inner">
				<ul>
					<li><a href="<?php echo BASE_URL.'hashtag/'.$hashtag;?>">Latest</a></li>
					<li><a href="<?php echo BASE_URL.'hashtag/'.$hashtag.'?f=users';?>">Accounts</a></li>
					<li><a href="<?php echo BASE_URL.'hashtag/'.$hashtag.'?f=photos';?>">Photos</a></li>
				</ul>
			</div>
		</div>
		<!--hash-menu-->
		<!---Inner wrapper-->

		<div class="in-wrapper">
			<div class="in-full-wrap">

				<div class="in-left">
					<div class="in-left-wrap">

						<?php $getFromF->whoToFollow($user_id,$user_id);?>

						<?php $getFromT->trends();?>

					</div>
					<!-- in left wrap-->
				</div>
				<!-- in left end-->
				<?php if(strpos($_SERVER['REQUEST_URI'], '?f=photos')):?>
				<!-- POSTS IMAGES  -->
				<div class="hash-img-wrapper">
					<div class="hash-img-inner">
						<?php 
 		foreach ($posts as $post) {
			$likes        = $getFromT->likes($user_id, $post->postID);
			$repost      = $getFromT->checkRepost($post->postID, $user_id);
			$user         = $getFromT->userData($post->repostBy);
   			
 			if(!empty($post->postImage)){
 			echo '<div class="hash-img-flex">
				 	<img src="'.BASE_URL.$post->postImage.'" class="imagePopup" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"/>
				 	<div class="hash-img-flex-footer">
				 		<ul>
				 		'.(($getFromU->loggedIn()) ?   '
										
									<li>'.(((isset($repost['repostID'])) ? $post->postID === $repost['repostID'] OR $user_id === $repost['repostBy'] : '') ? '<button class="reposted" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i style="color:skyblue" class="fa fa-repost" aria-hidden="true"></i><span class="repostsCount">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>' : '<button class="repost" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-repost" aria-hidden="true"></i><span class="repostsCount">'.(($post->repostCount > 0) ? $post->repostCount : '').'</span></button>').'</li>
									<li>'.(((isset($likes['likeOn'])) ? $likes['likeOn'] == $post->postID : '') ? '<button class="unlike-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>' : '<button class="like-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>').'</li>
									'.(($post->postBy === $user_id) ? ' 
									<li>
										<a href="#" class="more"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
										<ul> 
										  <li><label class="deletePost" data-post="'.$post->postID.'">Delete Post</label></li>
										</ul>
									</li>' : '').'
								' : '
										
									<li><button><i class="fa fa-repost" aria-hidden="true"></i></button></li>	
									<li><button><i class="fa fa-heart-o" aria-hidden="true"></i></button></li>	
								').'
				 		</ul>
				 	</div>
				</div>';
			}
 		}
 	?>

					</div>
				</div>
				<!-- POSTS IMAGES -->
				<?php elseif(strpos($_SERVER['REQUEST_URI'], '?f=users')):?>

				<!--POSTS ACCOUTS-->
				<div class="wrapper-following">
					<div class="wrap-follow-inner">
						<?php foreach($accounts AS $users) :?>
						<div class="follow-unfollow-box" style="background-color: #1d2226">
							<div class="follow-unfollow-inner">
								<div class="follow-background">
									<img src="<?php echo BASE_URL.$users->profileCover;?>" />
								</div>
								<div class="follow-person-button-img">
									<div class="follow-person-img">
										<img src="<?php echo BASE_URL.$users->profileImage;?>" />
									</div>
									<div class="follow-person-button">
										<?php echo $getFromF->followBtn($users->user_id, $user_id, $user_id);?>
									</div>
								</div>
								<div class="follow-person-bio">
									<div class="follow-person-name">
										<a href="<?php echo BASE_URL.$users->username;?>">
											<?php echo $users->screenName;?>
										</a>
									</div>
									<div class="follow-person-tname">
										<a href="<?php echo BASE_URL.$users->username;?>">@
											<?php echo $users->username;?>
										</a>
									</div>
									<div class="follow-person-dis">
										<?php echo $getFromT->getPostLinks($users->bio);?>
									</div>
								</div>
							</div>
						</div>
						<?php endforeach;?>
					</div>
				</div>
				<!-- POSTS ACCOUNTS -->
				<?php else:?>

				<div class="in-center">
					<div class="in-center-wrap">
						<?php 
		  	foreach ($posts as $post) {
			$likes        = $getFromT->likes($user_id, $post->postID);
			$repost      = $getFromT->checkRepost($post->postID, $user_id);
			$user         = $getFromT->userData($post->repostBy);
   			
   			echo '<div class="all-post">
					<div class="t-show-wrap">	
					 <div class="t-show-inner">
   							'.(((isset($repost['repostID'])) ? $repost['repostID'] === $post->repostID or $post->repostID > 0 : '') ? ' 
 							<div class="t-show-popup" data-post="'.$post->postID.'" data-user="'.$post->postBy.'">
 							<div class="t-show-banner">
								<div class="t-show-banner-inner">
									<span><i class="fa fa-repost" aria-hidden="true"></i></span><span>'.$user->screenName.'. Reposted</span>
								</div>
							</div>' : '').'
					 		 '.(((isset($repost['repostMsg'])) ? !empty($repost['repostMsg']) && $post->postID === $repost['postID'] or $post->repostID > 0 : '') ? '<div class="t-show-head">
 							<div class="t-show-img">
								<img src="'.BASE_URL.$user->profileImage.'"/>
							</div>
							<div class="t-s-head-content">
								<div class="t-h-c-name" style="color: white;">
									<span><a href="'.BASE_URL.$user->username.'">'.$user->screenName.'</a></span>
									<span>@'.$user->username.' </span>
									<span>'.$getFromT->timeAgo(isset($repost['postedOn'])).'</span>
								</div>
								<div class="t-h-c-dis">
									'.$getFromT->getPostLinks($post->repostMsg).'
								</div>
							</div>
						</div>
						<div class="t-s-b-inner">
							<div class="t-s-b-inner-in">
								<div class="repost-t-s-b-inner">
									'.((!empty($post->postImage)) ? ' 
									<div class="repost-t-s-b-inner-left">
										<img src="'.BASE_URL.$post->postImage.'"/>	
									</div>' : '').'
									<div>
										<div class="t-h-c-name" style="color: white;">
											<span><a href="#">'.$post->screenName.'</a></span>
											<span>@'.$post->username.'</span>
											<span>'.$getFromT->timeAgo($post->postedOn).'</span>
										</div>
										<div class="repost-t-s-b-inner-right-text">		
											'.$getFromT->getPostLinks($post->status).'
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						' : ' 
							<div class="t-show-popup" data-post="'.$post->postID.'" data-user="'.$post->postBy.'">
								<div class="t-show-head">
									<div class="t-show-img">
										<img src="'.BASE_URL.$post->profileImage.'"/>
									</div>
									<div class="t-s-head-co	ntent">
										<div class="t-h-c-name" style="color: white;">
											<span><a href="'.BASE_URL.$post->username.'">'.$post->screenName.'</a></span>
											<span>@'.$post->username.'</span>
											<span>'.$getFromT->timeAgo($post->postedOn).'</span>
										</div>
										<div class="t-h-c-dis">
											'.$getFromT->getPostLinks($post->status).'
										</div>
									</div>
								</div>'.

							 ((!empty($post->postImage)) ?  
						       '<div class="t-show-body">
									  <div class="t-s-b-inner">
										   <div class="t-s-b-inner-in">
										     <img src="'.BASE_URL.$post->postImage.'" class="imagePopup" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"/>
										   </div>
									  </div>	
								   </div>' : '' ) .'
						
				       </div>').'
						<div class="t-show-footer">
							<div class="t-s-f-right">
								<ul> 
								'.(($getFromU->loggedIn()) ?   '
										
									<li>'.(((isset($repost['repostID'])) ? $post->postID === $repost['repostID'] OR $user_id === $repost['repostBy'] : '') ? '<button class="reposted" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i style="color:skyblue" class="fa fa-repost" aria-hidden="true"></i><span class="repostsCount">'.(($post->repostCount > 0) ? $post->repostCount : '').'</span></button>' : '<button class="repost" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-repost" aria-hidden="true"></i><span class="repostsCount">'.(($post->repostCount > 0) ? $post->repostCount : '').'</span></button>').'</li>
									<li>'.(((isset($likes['likeOn'])) ?  $likes['likeOn'] 	== $post->postID : '') ? 
										'<button class="unlike-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>' : 
										'<button class="like-btn" data-post="'.$post->postID.'" data-user="'.$post->postBy.'"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="likesCounter">'.(($post->likesCount > 0) ? $post->likesCount : '').'</span></button>').'
									</li>
										
										'.(($post->postBy === $user_id) ? ' 
										<li>
											<a href="#" class="more"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
											<ul> 
											  <li><label class="deletePost" data-post="'.$post->postID.'">Delete Post</label></li>
											</ul>
										</li>' : '').'
								' : '
										
									<li><button><i class="fa fa-repost" aria-hidden="true"></i></button></li>	
									<li><button><i class="fa fa-heart-o" aria-hidden="true"></i></button></li>	
								').'
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>';
		}
		  ?>
					</div>
				</div>
				<?php endif;?>
				<div class="popupPost"></div>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/popupposts.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/delete.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/popupForm.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/follow.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/repost.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/like.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/messages.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/postMessage.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/hashtag.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/search.js"></script>
				<script type="text/javascript" src="<?php echo BASE_URL;?>assets/js/notification.js"></script>



			</div><!--in full wrap end-->
		</div><!-- in wrappper ends-->

	</div><!-- ends wrapper -->
</body>

</html>