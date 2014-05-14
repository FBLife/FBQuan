//
//  Header.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//
#pragma mark--公共类

#import "AsyncImageView.h"

#import "ASIHTTPRequest.h"




#ifndef FBCircle_Header_h
#define FBCircle_Header_h
//颜色

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]



#define TITLEFONT [UIFont fontWithName:@"Helvetica" size:20]
//判断屏幕
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//判断系统
#define MY_MACRO_NAME ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//推送的token
#define DEVICETOKEN @"token"

//登录相关的接口
#define LOGINAPI @"http://quan.fblife.com/index.php?c=interface&a=dologin&uname=%@&upass=%@&token=%@"
#define AUTHKEY @"authkey"
//注册相关的接口

#define REGISTAPI @"http://quan.fblife.com/index.php?c=interface&a=register&uname=%@&upass=%@&phone=%@&pcode=%@&email=%@&token=%@&fbtype=json"

/**
 *  http://quan.fblife.com/index.php?c=interface&a=register&uname=newlyhere&upass=11212&phone=18601901680&pcode=123&email=ivyandrich@gmail.com&token=sfsfsfsfsfsfs&fbtype=json
 
 接口参数：
 c ：固定的，不用管
 a ：固定的，不用管
 uname ：用户名
 upass ：密码
 phone ：电话
 pcode ：验证码
 email ：邮箱
 token ：token，你懂的
 fbtype ：返回值类型，默认为json，可设置为xml
 */


//




#endif
