<?php 
	include '../init.php';
	$getFromU->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));

?>
 <!-- POPUP TWEET-FORM WRAP -->
<div class="popup-post-wrap">
		<div class="wrap">
		
		<div class="popwrap-inner">
			<div class="popwrap-header">
				<div class="popwrap-h-left">
					<h4></h4>
				</div>
				<span class="popwrap-h-right">
					<label class="closePostPopup" for="pop-up-post" ><i class="fa fa-times" aria-hidden="true" style="outline:none;"></i></label>
				</span>
			</div>
			<div class="popwrap-full post_body">
<!--
			<div class='left-post'>
                             PROFILE-IMAGE 
                            <img class="ml-3" src="<?php echo $user->profileImage; ?>" style="width: 53px;height:53px;border-radius:50%;" />
                        </div>
-->
			 <form id="popupForm" method='post' enctype='multipart/form-data'>
                                <textarea class='status' maxlength='141' name='status' placeholder="What's happening?" rows='3' cols='100%'style="font-size:17px;"></textarea>
                                <div class='hash-box'>
                                    <ul>
                                    </ul>
                                </div>

                                <div class='post_icons-wrapper'>
                                    <div class='t-fo-left post_icons-add'>
                                        <ul>
                                            <input type='file' name='file' id='file' />
                                            <li><label for='file'><i class='fa fa-image' aria-hidden='true'></i></label>
                                                <i class="fa fa-bar-chart"></i>
                                                <i class="fa fa-smile-o"></i>
                                                <i class="fa fa-calendar-o"></i>
                                            </li>
                                            <span class='post-error'><?php if ( isset( $error ) ) {
                                                echo $error;
                                            } else if ( isset( $imgError ) ) {
                                                echo '<br>' . $imgError;
                                            }
                                            ?></span>
                                            <!--<i class="fa fa-image"></i>-->

                                        </ul>
                                    </div>
                                    <div class='t-fo-right'>
                                        <!--<span id='count'>140</span>-->
                                        <!--<input type='submit' name='post' value='post' />-->

                                        <button class="button_post" type="submit" name="post" style="outline:none;">Post</button>

                                    </div>
                            </form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- POPUP TWEET-FORM END -->
