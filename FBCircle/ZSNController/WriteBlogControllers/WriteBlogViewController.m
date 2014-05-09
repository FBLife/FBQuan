//
//  WriteBlogViewController.m
//  FBCircle
//
//  Created by soulnear on 14-5-9.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "WriteBlogViewController.h"


@interface WriteBlogViewController ()
{
    QBImagePickerController * imagePickerController;
}

@end

@implementation WriteBlogViewController

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
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100,100,100,100);
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTitle:@"相册" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    
}

-(void)doButton:(UIButton *)sender
{
    if (!imagePickerController)
    {
        imagePickerController = nil;
    }
    
    imagePickerController = [[QBImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsMultipleSelection = YES;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
    
    
    navigationController.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    //    if([navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    //    {
    //        //iOS 5 new UINavigationBar custom background
    //        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:IOS_VERSION>=7.0?IOS7DAOHANGLANBEIJING:IOS6DAOHANGLANBEIJING] forBarMetrics: UIBarMetricsDefault];
    //    }
    
    [self presentViewController:navigationController animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
