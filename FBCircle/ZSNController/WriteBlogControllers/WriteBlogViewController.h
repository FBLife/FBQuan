//
//  WriteBlogViewController.h
//  FBCircle
//
//  Created by soulnear on 14-5-9.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBImagePickerController.h"
#import "ChooseCountryViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>






@interface WriteBlogViewController : UIViewController<QBImagePickerControllerDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    UILabel * placeHolderLable;
}


@property(nonatomic,strong)NSString * titleName;

@property(nonatomic,strong)UITableView * myTableView;

@property(nonatomic,strong)NSMutableArray * selectedImageArray;

@property(nonatomic,strong)UITextView * myTextView;

@property(nonatomic,assign)BOOL isShowLocation;






@end
