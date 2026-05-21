---
title: "WordPress如何登入后控制重定向到其他页面"
date: 2019-10-31
categories: 
  - "wordpress"
---

WordPress因为用户登入后会直接进入用户后台，但有时候我们并不想订阅用户进入后台，这时候就可以用下面的代码将我们登入后重定向到其他页面：

```
function soi_login_redirect($redirect_to, $request, $user)   
{   
    return (is_array($user->roles) && in_array('administrator', $user->roles)) ? admin_url() : site_url();   
}    
add_filter('login_redirect', 'soi_login_redirect', 10, 3); 
```

代码如上所示，将上面代码复制到function.php中，就可以把普通用户登入后重定向到首页，而管理员登入后重定向到后台，就可以实现目的。
