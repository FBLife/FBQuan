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
@synthesize locationLabel = _locationLabel;
@synthesize allImageArray = _allImageArray;
@synthesize allAssesters = _allAssesters;




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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"FBCircleNavagationImage.png"] forBarMetrics: UIBarMetricsDefault];
    
    self.view.backgroundColor = RGBCOLOR(229,229,229);
    
    _allImageArray = [NSMutableArray array];
    
    _allAssesters = [NSMutableArray array];
    
    
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
            [self loadChoosePictures];
            theHeight = picturesView.frame.size.height;
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.row) {
        case 0:
        {
            if (!_myTextView) {
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
        }
            
            break;
        case 1:
        {
            [cell.contentView addSubview:picturesView];
        }
            
            break;
        case 2:
        {
            
            if (!_locationLabel) {
                UIImageView * locaionMarkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
                
                locaionMarkImageView.center = CGPointMake(24,43/2);
                
                locaionMarkImageView.backgroundColor = [UIColor clearColor];
                
                [cell.contentView addSubview:locaionMarkImageView];
                
                
                _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(45,0,200,43)];
                
                _locationLabel.text = @"所在位置";
                
                _locationLabel.textAlignment = NSTextAlignmentLeft;
                
                _locationLabel.textColor = [UIColor blackColor];
                
                _locationLabel.backgroundColor = [UIColor clearColor];
                
                [cell.contentView addSubview:_locationLabel];
                
                
                UISwitch * locationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0,0,38,19)];
                
                locationSwitch.center = CGPointMake(280,43/2);
                
                locationSwitch.on = YES;
                
                locationSwitch.onImage = [UIImage imageNamed:@"WriteSwitchOutImage.png"];
                
                locationSwitch.offImage = [UIImage imageNamed:@"WriteSwitchBackImage.png"];
                
                [cell.contentView addSubview:locationSwitch];
            }
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
    [imagePickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)imagePickerController1:(QBImagePickerController *)imagePickerController didFinishPickingMediaWithInfo:(id)info
{
    NSLog(@"shenme ya -----%@",info);
    NSArray *mediaInfoArray = (NSArray *)info;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    for (int i = 0;i < mediaInfoArray.count;i++)
    {
        [_allImageArray addObject:[[mediaInfoArray objectAtIndex:i] objectForKey:@"UIImagePickerControllerOriginalImage"]];
        
        [_allAssesters addObject:[[mediaInfoArray objectAtIndex:i] objectForKey:@"UIImagePickerControllerReferenceURL"]];
    }
    
    [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)imagePickerControllerWillFinishPickingMedia:(QBImagePickerController *)imagePickerController
{
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [_allImageArray addObject:image];
    
    [_allAssesters addObject:[info objectForKey:@"UIImagePickerControllerReferenceURL"]];
    
    [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
}



#pragma mark-多图选择

-(void)loadChoosePictures
{
    picturesView = [[UIView alloc] init];
    
    float theHeight = 28;
    
    if (self.allImageArray.count == 0)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(16,14,65,65);
        
        [button setImage:[UIImage imageNamed:@"WriteChoosePictures.png"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(ChooseMorePictures:) forControlEvents:UIControlEventTouchUpInside];
        
        [picturesView addSubview:button];
        
        theHeight += 65;
        
    }else
    {
        
        int row = self.allImageArray.count%4?1:0 + self.allImageArray.count/4;
        
        for (int i = 0;i < 3;i++)
        {
            for (int j = 0;j < 4;j++) {
                
                if (j+4*i < self.allImageArray.count) {
                    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                    
                    button.frame = CGRectMake(16 + 74*j,14 + 74*i,65,65);
                    
                    [button setImage:[self.allImageArray objectAtIndex:i] forState:UIControlStateNormal];
                    
                    [button addTarget:self action:@selector(RemoveSelfTap:) forControlEvents:UIControlEventTouchUpInside];
                    
                    [picturesView addSubview:button];
                }else
                {
                    if (j + 4*i == self.allImageArray.count) {
                        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                        
                        button.frame = CGRectMake(16 + 74*j,14 + 74*i,65,65);
                        
                        [button setImage:[UIImage imageNamed:@"WriteChoosePictures.png"] forState:UIControlStateNormal];
                        
                        [button addTarget:self action:@selector(ChooseMorePictures:) forControlEvents:UIControlEventTouchUpInside];
                        
                        [picturesView addSubview:button];
                    }
                }
            }
            
            if (i <= row) {
                theHeight += (65 + (i?9:0));
            }
        }
    }
    
    picturesView.frame = CGRectMake(0,0,320,theHeight);
}


-(void)RemoveSelfTap:(UIButton *)sender
{
    
}

-(void)ChooseMorePictures:(UIButton *)sender
{
    
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    
    [actionSheet showInView:self.view];
    
    
    
}


#pragma mark-UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController * pickerC = [[UIImagePickerController alloc] init];
                pickerC.delegate = self;
                pickerC.allowsEditing = NO;
                pickerC.sourceType = sourceType;
                [self presentViewController:pickerC animated:YES completion:nil];
            }
            else
            {
                NSLog(@"模拟其中无法打开照相机,请在真机中使用");
            }

        }
            break;
        case 1:
        {
            if (!imagePickerController)
            {
                imagePickerController = nil;
            }
            
            imagePickerController = [[QBImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsMultipleSelection = YES;
            NSLog(@"allassesters-------%@",self.allAssesters);
            imagePickerController.assters = self.allAssesters;
            
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
            
            [self presentViewController:navigationController animated:YES completion:NULL];
        }
            break;
        case 2:
            NSLog(@"取消");
            break;
            
        default:
            break;
    }
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
