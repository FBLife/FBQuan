//
//  QBShowImageDetailViewController.m
//  FBCircle
//
//  Created by soulnear on 14-5-13.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "QBShowImageDetailViewController.h"

@interface QBShowImageDetailViewController ()

@end

@implementation QBShowImageDetailViewController
@synthesize data_array = _data_array;
@synthesize selectedAssets = _selectedAssets;
@synthesize myScrollView = _myScrollView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


-(void)popBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)finishTap:(UIButton *)sender
{
    
}

-(void)PreviewChooseTap:(UIButton *)sender
{
    
}


-(void)setNavgationBar
{
    navgationBar = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,64)];
    
    navgationBar.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    [self.view addSubview:navgationBar];
    
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(29,17,15,30);
    
    backButton.backgroundColor = [UIColor redColor];
    
    [backButton setImage:[UIImage imageNamed:@"barbuttonicon_back.png"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
    
    [navgationBar addSubview:backButton];
    
    
    
    UIButton * chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [chooseButton setImage:[UIImage imageNamed:@"PreviewChooseMarkOk.png"] forState:UIControlStateNormal];
    
    chooseButton.frame = CGRectMake(0,0,21,22);
    
    chooseButton.center = CGPointMake(280,32);
    
    [chooseButton addTarget:self action:@selector(PreviewChooseTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [navgationBar addSubview:chooseButton];
    
    
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0,(iPhone5?568:480)-45,320,45)];
    
    bottomView.backgroundColor = RGBCOLOR(38,45,51);
    
    [self.view addSubview:bottomView];
    
    
    UIButton * finish_button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    finish_button.frame = CGRectMake(262,9,102/2,54/2);
    
    [finish_button setImage:[UIImage imageNamed:@"choosePictureFinishOk.png"] forState:UIControlStateNormal];
    
    [finish_button addTarget:self action:@selector(finishTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [bottomView addSubview:finish_button];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.navigationController.navigationBarHidden = YES;
    

    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(-20,0,340,iPhone5?568:480)];
    
    _myScrollView.delegate = self;
    
    _myScrollView.pagingEnabled = YES;
    
    _myScrollView.showsHorizontalScrollIndicator = NO;
    
    _myScrollView.showsHorizontalScrollIndicator = NO;
    
    _myScrollView.contentSize = CGSizeMake(340*self.selectedAssets.count,_myScrollView.bounds.size.height);

    
    
    [self.view addSubview:_myScrollView];

    
    for (int i = 0;i < self.selectedAssets.count;i++)
    {
        ALAsset *asset = [self.selectedAssets objectAtIndex:i];
        
        UIImage * image = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
        
        QBShowImagesScrollView * myScrollView = [[QBShowImagesScrollView alloc] initWithFrame:CGRectMake(340*i,0,340,_myScrollView.frame.size.height) WithLocation:image];
        
        [_myScrollView addSubview:myScrollView];
    }
    
    
    [self setNavgationBar];
}


- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    // We have to use our paging scroll view's bounds, not frame, to calculate the page placement. When the device is in
    // landscape orientation, the frame will still be in portrait because the pagingScrollView is the root view controller's
    // view, so its frame is in window coordinate space, which is never rotated. Its bounds, however, will be in landscape
    // because it has a rotation transform applied.
    CGRect bounds = _myScrollView.bounds;
    CGRect pageFrame = bounds;
    pageFrame.size.width -= (2 * 10);
    pageFrame.origin.x = (bounds.size.width * index) + 10;
    return pageFrame;
}

 - (BOOL)shouldAutorotate
{
    return NO;
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
