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
@synthesize myTableView = _myTableView;
@synthesize titleName = _titleName;
@synthesize selectedImageArray = _selectedImageArray;
@synthesize myTextView = _myTextView;
@synthesize isShowLocation = _isShowLocation;






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
    
    self.title = _titleName;
    
    self.view.backgroundColor = RGBCOLOR(242,242,242);
    
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,6,320,(iPhone5?568:480)-20-44-6) style:UITableViewStylePlain];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource = self;
    
    self.myTableView.separatorInset = UIEdgeInsetsZero;
    
    [self.view addSubview:self.myTableView];
}

-(void)doButton:(UIButton *)sender
{
    
    
    ChooseCountryViewController * chooseCountry = [[ChooseCountryViewController alloc] init];
    
    [self.navigationController pushViewController:chooseCountry animated:YES];
    
    /*
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
    
    [self presentViewController:navigationController animated:YES completion:NULL];
     */
}



#pragma mark-UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    float theHeight = 0;
    
    switch (indexPath.row) {
        case 0:
            theHeight = 80;
            break;
        case 1:
            
            break;
        case 2:
            theHeight = 43;
            break;
            
        default:
            break;
    }
    
    
    return theHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (indexPath.row) {
        case 0:
        {
            _myTextView = [[UITextView alloc] initWithFrame:CGRectMake(10,5,300,70)];
            
            _myTextView.font = [UIFont systemFontOfSize:15];
            
            _myTextView.delegate = self;
            
            _myTextView.showsHorizontalScrollIndicator = NO;
            
            _myTextView.showsVerticalScrollIndicator = NO;
            
            _myTextView.backgroundColor = [UIColor clearColor];
            
            [cell.contentView addSubview:_myTextView];
            
            
            placeHolderLable = [[UILabel alloc] initWithFrame:CGRectMake(7,7,200,15)];
            
            placeHolderLable.text = @"心情记录...";
            
            placeHolderLable.backgroundColor = [UIColor clearColor];
            
            placeHolderLable.textColor = RGBCOLOR(153,153,153);
            
            placeHolderLable.textAlignment = NSTextAlignmentLeft;
            
            placeHolderLable.font = [UIFont systemFontOfSize:15];
            
            placeHolderLable.userInteractionEnabled = NO;
            
            [_myTextView addSubview:placeHolderLable];
            
        }
            
            break;
        case 1:
        {
            
        }
            
            break;
        case 2:
        {
            UIImageView * locaionMarkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
            
            locaionMarkImageView.center = CGPointMake(24,43/2);
            
            locaionMarkImageView.backgroundColor = [UIColor clearColor];
            
            [cell.contentView addSubview:locaionMarkImageView];
        }
            
            break;
            
        default:
            break;
    }
    
    
    return cell;
}


#pragma mark-UIScrollViewDelegate



#pragma mark-UITextViewDelegate

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        placeHolderLable.text = @"心情记录...";
    }else
    {
        placeHolderLable.text = @"";
    }
}



#pragma mark-QBImagePickerControllerDelegate

-(void)imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
    
}


-(void)imagePickerController1:(QBImagePickerController *)imagePickerController didFinishPickingMediaWithInfo:(id)info
{
    
}

-(void)imagePickerControllerWillFinishPickingMedia:(QBImagePickerController *)imagePickerController
{
    
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
