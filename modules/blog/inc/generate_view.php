<?php


if( !empty($posts_arr) )
{

	foreach ($posts_arr as $post)
	{

		$description  		= $post['description'];
		$short_description  = $post['short_description'];
		$blog_full_url		= $pg_full_url.$post['full_url'];
		$blog_heading 		= ((!$is_single) ? '<h2 class="article__item__heading"><a href="'.$blog_full_url.'" title="'.$post['title'].'" class="btn--link btn--link-blue">'.$post['heading'].'</a></h2>' : '');
		
		if( $is_single ){
			$posts_view .= <<<HTML
			 <article class="blog__entry">
				<div>{$description}</div>
				
			</article>
HTML;
		
		}
		else{			
			$posts_view .= <<<HTML
				<article class="article__row">
				 	<div class="article__row__img"  title="{$post['title']}">
				 		<a href="{$blog_full_url}" title="{$post['title']}" class="zoom__wrapper">
				 		 	<span style="background-image:url({$post['thumb_photo_path']})" class="zoom"></span>
				 		</a>
				 	</div>
				 	<div class="article__row__content">
				 		{$blog_heading}
				 		<p class="author">
							<i class="fa fa-clock-o"></i> 
							Posted by <a href="{$pg_full_url}/author/{$post['author_url']}" class="article__item__link">{$post['author_name']}</a> on {$post['posted_on']}</p>
						<p>{$short_description}</p>
						<a href="{$pg_full_url}{$post['full_url']}" title="{$post['title']}" class="btn btn__green text-white md">Read More</a>
				 	</div>				
				</article>
HTML;
		}
	}	
}



?>