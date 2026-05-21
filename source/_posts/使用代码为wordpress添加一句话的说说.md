---
title: "使用代码为WordPress添加一句话的说说"
date: 2020-06-23
categories: 
  - "技术"
  - "wordpress"
tags: 
  - "tor"
  - "网站"
  - "网站建设"
---

有时候想每天用一句话来总结一下，但又不知道写在哪里好，现在可以直接到WordPress上添加了，效果如下：

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592882462-说说1-1024x395.png)

类似于时间轴一样的，但更加简洁，可以只用一句话，而且是纯代码实现

首先在主题的functions.php里面加入以下代码：

```
function my_custom_shuoshuo_init() { 
    $labels = array( 
        'name' => '说说',
        'singular_name' => '说说', 
        'all_items' => '所有说说',
        'add_new' => '发表说说', 
        'add_new_item' => '撰写新说说',
        'edit_item' => '编辑说说', 
        'new_item' => '新说说', 
        'view_item' => '查看说说', 
        'search_items' => '搜索说说', 
        'not_found' => '暂无说说', 
        'not_found_in_trash' => '没有已遗弃的说说', 
        'parent_item_colon' => '',
        'menu_name' => '说说'
    ); 
    $args = array( 
        'labels' => $labels, 
        'public' => true, 
        'publicly_queryable' => true, 
        'show_ui' => true, 
        'show_in_menu' => true, 
        'query_var' => true, 
        'rewrite' => true, 
        'capability_type' => 'post', 
        'has_archive' => true, 
        'hierarchical' => false, 
        'menu_position' => null, 
        'supports' => array('title','editor','author') 
    ); 
register_post_type('shuoshuo',$args); 
}
add_action('init', 'my_custom_shuoshuo_init'); 
```

然后找到主题的页面文件夹下新建一个shuoshuo.php页面文件

```
<?php 
/* Template Name: 说说/心情 */
get_header(); 
?>
<link rel="stylesheet" type="text/css" href="<?php echo get_template_directory_uri(); ?>/static/css/vertical_timeline.css" />
<section class="container">
<div class="content-wrap">
<div class="content">
    <div style="background: #FFF; padding: 30px; border-radius: 5px;">
        <ul class="cbp_tmtimeline">
        <?php 
        query_posts("post_type=shuoshuo & post_status=publish & posts_per_page=-1");
        if ( have_posts() ) { 
        while ( have_posts() ) { 
        the_post(); ?>
            <li>
                <time class="cbp_tmtime"><i class="fa fa-clock-o"></i> <?php the_time('Y年n月j日G:i'); ?></time>
                <div class="cbp_tmicon">
                <img src="http://www.demon1630.cn/wp-content/uploads/2019/09/BABEE112-64B2-CC97-58A6-C55864CF87A4.jpg" class="avatar avatar-48" width="48" height="48">
                </div>
                <div class="cbp_tmlabel" >
                    <span style="font-size:14px;"><?php the_content(); ?></span>
                    <h2><?php the_title(); ?><span><?php echo get_bloginfo('name'); ?> | <?php echo get_bloginfo('description' ); ?></span></h2>
                </div>
            </li>
        <?php }
        } ?>
        </ul>
    </div>
</div> 
</div>
<?php get_sidebar(); ?>
</section>
<?php get_footer();?>
```

之后，到主题的css文件夹下添加一个 vertical\_timeline.css文件

```
/** 垂直时间线CSS样式 */
 
.cbp_tmtimeline {
    margin: 30px 0 0 0;
    padding: 0;
    list-style: none;
    position: relative;
} 
/* The line */
.cbp_tmtimeline:before {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    width: 10px;
    background: #afdcf8;
    left: 20%;
    margin-left: -6px;
}
/* The date/time */
.cbp_tmtimeline > li .cbp_tmtime {
    display: block;
    width: 30%;
    padding-right: 100px;
    position: absolute;
    color: #AAA;
}
.cbp_tmtimeline > li .cbp_tmtime span {
    display: block;
    text-align: right;
}
.cbp_tmtimeline > li .cbp_tmtime span:first-child {
    font-size: 0.9em;
    color: #bdd0db;
}
.cbp_tmtimeline > li .cbp_tmtime span:last-child {
    font-size: 2.9em;
    color: #24a0f0;
}
.cbp_tmtimeline > li:nth-child(odd) .cbp_tmtime span:last-child {
    color: #7878f0;
}
/* Right content */
.cbp_tmtimeline > li .cbp_tmlabel {
    margin: 0 0 15px 25%;
    background: #24a0f0;
    color: #fff;
    padding: 1em;
    font-size: 3em;
    font-weight: 300;
    line-height: 1.4;
    position: relative;
    border-radius: 5px;
}
.cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel {
    background: #7878f0;
}
.cbp_tmtimeline > li .cbp_tmlabel h2 { 
    border-bottom: 0px;
    border-top:1px dashed #FFF; 
    font-size:16px; 
    height: 24px; 
    padding: 5px 3px 12px; 
    margin:0px;
}
.cbp_tmtimeline > li .cbp_tmlabel h2 > span { 
    font-size: 12px; 
    float: right; 
    text-align: center; 
    line-height: 24px; 
    overflow: hidden; 
    text-overflow: ellipsis; 
    white-space: nowrap;
}
/* The triangle */
.cbp_tmtimeline > li .cbp_tmlabel:after {
    right: 100%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-right-color: #24a0f0;
    border-width: 10px;
    top: 10px;
}
.cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel:after {
    border-right-color: #7878f0;
}
/* The icons */
.cbp_tmtimeline > li .cbp_tmicon {
    width: 48px;
    height: 48px;
    font-family: 'ecoico';
    speak: none;
    font-style: normal;
    font-weight: normal;
    font-variant: normal;
    text-transform: none;
    font-size: 48px;
    line-height: 48px;
    -webkit-font-smoothing: antialiased;
    position: relative;
    color: #fff;
    background: #46a4da;
    border-radius: 50%;
    box-shadow: 0 0 0 8px #afdcf8;
    text-align: center;
    left: 20%;
    top: 0;
    margin: 0 0 0 -25px;
}
.cbp_tmtimeline > li .cbp_tmicon >img {
    border-radius: 50%; 
    position: absolute; 
    top: 0px; 
    left: 0px;
}
/* Example Media Queries */
@media screen and (max-width: 65.375em) {
    .cbp_tmtimeline > li .cbp_tmtime span:last-child {
        font-size: 3em;
    }
}
@media screen and (max-width: 47.2em) {
    .cbp_tmtimeline:before {
        display: none;
    }
    .cbp_tmtimeline > li .cbp_tmtime {
        width: 100%;
        position: relative;
        padding: 0 0 20px 0;
    }
    .cbp_tmtimeline > li .cbp_tmtime span {
        text-align: left;
    }
    .cbp_tmtimeline > li .cbp_tmlabel {
        margin: 0 0 30px 0;
        padding: 1em;
        font-weight: 400;
        font-size: 95%;
    }
    .cbp_tmtimeline > li .cbp_tmlabel:after {
        right: auto;
        left: 20px;
        border-right-color: transparent;
        border-bottom-color: #24a0f0;
        top: -20px;
    }
    .cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel:after {
        border-right-color: transparent;
        border-bottom-color: #7878f0;
    }
    .cbp_tmtimeline > li .cbp_tmicon {
        position: relative;
        float: right;
        left: auto;
        margin: -55px 5px 0 0px;
    }
}
```

把前面这些代码部署完成后就可以到word press后台添加一个说说页面

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592883653-说说2-1024x468.png)

然后到后台新建一个说说：

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592883766-说说3.png)

发表完说说后，就可以在之前新建的说说页面看到了
