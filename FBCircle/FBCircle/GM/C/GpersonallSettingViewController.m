//
//  GpersonallSettingViewController.m
//  FBCircle
//
//  Created by gaomeng on 14-5-13.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "GpersonallSettingViewController.h"
#import "FriendListViewController.h"


@interface GpersonallSettingViewController ()

@end

@implementation GpersonallSettingViewController

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
    // Do any additional setup after loading the view.
    
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //头像
    UIImageView *userFaceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 107, 107)];
    userFaceImageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:userFaceImageView];
    
    //用户名
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userFaceImageView.frame)+23, 20, 100, 25)];
    nameLable.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:nameLable];
    
    //个性签名
    UILabel *qianmingLable = [[UILabel alloc]initWithFrame:CGRectMake(nameLable.frame.origin.x, CGRectGetMaxY(nameLable.frame)+10, 160, 30)];
    qianmingLable.backgroundColor = [UIColor greenColor];
    [self.view addSubview:qianmingLable];
    
    
    
    //按钮
    NSArray *btnNameArray = @[@"我的相册",@"我的好友",@"我的消息",@"清除缓存",@"意见反馈",@"关于FB"];
    for (int i=0; i<6; i++) {
        NSString *str = btnNameArray[i];
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(110*(i%3), (330/3)*(i/3)+110, 107, 107)];
        [btn setTitle:[NSString stringWithFormat:@"%@",str] forState:UIControlStateNormal];
        btn.tag = i+10;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor=[UIColor grayColor];
        [self.view addSubview:btn];
    }
    
    
}



-(void)btnClicked:(UIButton*)sender{
    
    switch (sender.tag) {
        case 10:
        {
        }
            break;
        case 11:
        {
            FriendListViewController *_friendListV=[[FriendListViewController alloc]init];
            [self.navigationController pushViewController:_friendListV animated:YES];
            
            
        }
            break;
        case 12:
        {
        }
            break;
        case 13:
        {
        }
            break;
        case 14:
        {
        }
            break;
            
        case 15:
        {
        }
            break;
            
        default:
            break;
    }
    
    
    //我的相册  10
    //我的好友  11
    //我的消息  12
    //清除缓存  13
    //意见反馈  14
    //关于FB   15
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
