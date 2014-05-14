//
//  LoginViewController.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-6.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "LoginViewController.h"
#import "FbLoginView.h"
#import "RegistViewController.h"

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
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:NO];
    self.navigationController.navigationBarHidden=YES;


}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    FbLoginView *loginV=[[FbLoginView alloc]initWithFrame:CGRectMake(0, 0,320 , iPhone5?568:480)];

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
        SzkLoadData *_loadRegist=[[SzkLoadData alloc]init];
    
    __weak typeof(self)_weakself=self;
     [_loadRegist SeturlStr:[NSString stringWithFormat:LOGINAPI,stringUname,passWord,@"token"] block:^(NSArray *arrayinfo, NSString *errorindo, int errcode) {
     
     if (errcode==0) {
     NSLog(@"sxss%@",arrayinfo);
         NSDictionary *dic=(NSDictionary *)arrayinfo;
         NSLog(@"dic===%@",dic);
         NSUserDefaults *standUDef=[NSUserDefaults standardUserDefaults];
         NSString *authkey=[dic objectForKey:AUTHKEY];
         [standUDef setObject:authkey forKey:AUTHKEY];
     
         [_weakself testttt];
     }
         
     
     }];
     
     NSString *str_url=[NSString stringWithFormat:LOGINAPI,stringUname,passWord,_deviceToken];
     
     NSLog(@"登录的接口为==%@",str_url);

    NSLog(@"stringUname=%@\npassWord%@\n_deviceToken=%@",stringUname,passWord,_deviceToken);

}

#pragma mark---更改密码
//功能暂时不做

-(void)testttt{
    NSString *striing_auth=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:AUTHKEY]];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"tishi" message:striing_auth delegate:nil cancelButtonTitle:@"test" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(void)turnToChangWordVC{
    
    

}

#pragma mark---新用户注册

-(void)turnToNewregeistVC{
    

    RegistViewController *_registVC=[[RegistViewController alloc]init];
    
    
    [self.navigationController pushViewController:_registVC animated:YES];

    
    
    NSLog(@"新用户注册");
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
