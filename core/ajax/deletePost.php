<?php 
    include '../init.php';
    if(isset($_POST['deletePost']) && !empty($_POST['deletePost'])){
      $post_id  = $_POST['deletePost'];
      $user_id   = $_SESSION['user_id'];
      //get post data from post id
      $post     = $getFromT->postPopup($post_id);
      //create link for post image to delete from
      $imageLink = '../../'.$post->postImage;
      //delete the post from database
      $getFromT->delete('posts', array('postID' => $post_id, 'postBy' => $user_id));
      //check if post has image
      if(!empty($post->postImage)){
        //delete the file
        unlink($imageLink);
      }
     }

    if(isset($_POST['showpopup']) && !empty($_POST['showpopup'])){
       $post_id  = $_POST['showpopup'];
       $user_id   = $_SESSION['user_id'];
       $post     = $getFromT->postPopup($post_id);
    
?>
<div class="repost-popup">
  <div class="wrap5">
    <div class="repost-popup-body-wrap">
      <div class="repost-popup-heading">
        <h3>Are you sure you want to delete this Post?</h3>
        <span><button class="close-repost-popup"><i class="fa fa-times" aria-hidden="true"></i></button></span>
      </div>
       <div class="repost-popup-inner-body">
        <div class="repost-popup-inner-body-inner">
          <div class="repost-popup-comment-wrap">
             <div class="repost-popup-comment-head">
              <img src="<?php echo BASE_URL.$post->profileImage;?>"/>
             </div>
             <div class="repost-popup-comment-right-wrap">
               <div class="repost-popup-comment-headline">
                <a><?php echo $post->screenName;?> </a><span>‏@<?php echo $post->username . ' ' . $post->postedOn;?></span>
               </div>
               <div class="repost-popup-comment-body">
                 <?php echo $post->status . ' ' .$post->postImage;?>
               </div>
             </div>
          </div>
         </div>
      </div>
      <div class="repost-popup-footer"> 
        <div class="repost-popup-footer-right">
          <button class="cancel-it f-btn">Cancel</button><button class="delete-it" data-post="<?php echo $post->postID;?>" type="submit">Delete</button>
        </div>
      </div>
    </div>
  </div>
</div>
<?php }?>
