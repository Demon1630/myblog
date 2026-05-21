---
title: "WordPress管理员一键登入其余用户账号"
date: 2019-11-24
categories: 
  - "wordpress"
tags: 
  - "网站"
  - "网站建设"
---

有时候我们可能需要登入到其他用户的账号里去，但即使我们是管理员，我们也不知道其他用户的密码，无法登入，所以这里提供一个一键登入其他用户账户的方法，主要是将如下代码添加到主题的functions.php文件中：

```
/** 
* WordPress 后台管理员免密一键切换其他账号登录 
* https://www.dujin.org/fenxiang/wp/10144.html 
*/ 
function wpdx_user_switch_action($actions, $user){
    $capability = (is_multisite())?'manage_site':'manage_options';
    if(current_user_can($capability)){
        $actions['login_as'] = '<a title="以此身份登录" href="'.wp_nonce_url("users.php?action=login_as&users=$user->ID", 'bulk-users').'">以此身份登录</a>';
    }
    return $actions;
}
add_filter('user_row_actions', 'wpdx_user_switch_action', 10, 2);
 
function wpdx_handle_user_switch_action($sendback, $action, $user_ids){
    if($action == 'login_as'){
        wp_set_auth_cookie($user_ids, true);
        wp_set_current_user($user_ids);
    }
    return admin_url();
}
add_filter('handle_bulk_actions-users','wpdx_handle_user_switch_action', 10, 3);
```

即可实现后台管理员一键登入其余用户账号，在后台用户列表里就可以看到：

[![](https://www.demon1630.cf/wp-content/uploads/2019/11/1574597103-管理员登入其他用户账户-300x258.png)](https://www.demon1630.cf/wordpress%e7%ae%a1%e7%90%86%e5%91%98%e4%b8%80%e9%94%ae%e7%99%bb%e5%85%a5%e5%85%b6%e4%bd%99%e7%94%a8%e6%88%b7%e8%b4%a6%e5%8f%b7/1574597103-%e7%ae%a1%e7%90%86%e5%91%98%e7%99%bb%e5%85%a5%e5%85%b6%e4%bb%96%e7%94%a8%e6%88%b7%e8%b4%a6%e6%88%b7/)里面有选项，以此身份登入，点击即可切换到此身份账号
