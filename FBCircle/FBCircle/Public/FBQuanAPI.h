//
//  Header.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//
#pragma mark--公共类
//#import "pinyin.h"
#import "UIImageView+WebCache.h"
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
//获取用户列表

#define GETFRIENDLIST @"http://quan.fblife.com/index.php?c=interface&a=getbuddy&authkey=%@"





#endif
