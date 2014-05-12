//
//  LoginViewController.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-6.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "LoginViewController.h"
#import "FbLoginView.h"

#import "FriendAttribute.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FriendAttribute *_model=[[FriendAttribute alloc]init];
    
    
    
    FbLoginView *loginV=[[FbLoginView alloc]initWithFrame:CGRectMake(0, 0,320 , iPhone5?568:480)];

    loginV.backgroundColor=RGBCOLOR(92, 137, 63);
    [self.view addSubview:loginV];

    __weak  typeof(self) _weakself=self;
    __weak  typeof(loginV) _weakloginV=loginV;

    [loginV setBloc:^(long flag) {
        
        switch (flag) {
            case 101:
            {
                [_weakself loginwithUserName:_weakloginV.userLabel.text passWord:_weakloginV.passWordLabel.text deviceToken:@""];
            }
                break;
            case 102:
            {
                [_weakself turnToChangWordVC];
            }
                break;
            case 103:
            {
                [_weakself turnToNewregeistVC];
            }
                break;
            default:
                break;
        }
        
        
        
    }];
    
	// Do any additional setup after loading the view.
}

#pragma mark---登录
-(void)loginwithUserName:(NSString*)stringUname passWord:(NSString *)passWord deviceToken:(NSString *)_deviceToken{

    NSLog(@"%@\n%@\n%@",stringUname,passWord,_deviceToken);

}

#pragma mark---更改密码
//功能暂时不做
-(void)turnToChangWordVC{

}

#pragma mark---新用户注册

-(void)turnToNewregeistVC{
    
    NSLog(@"新用户注册");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
