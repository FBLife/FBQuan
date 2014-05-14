//
//  QBShowImageDetailViewController.h
//  FBCircle
//
//  Created by soulnear on 14-5-13.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBShowImagesScrollView.h"

@interface QBShowImageDetailViewController : MyViewController<UIScrollViewDelegate>
{
    UIView * navgationBar;
    
    UIView * bottomView;
}

@property(nonatomic,strong)NSMutableArray * data_array;

@property (nonatomic, retain) NSMutableOrderedSet * selectedAssets;

@property(nonatomic,strong)UIScrollView * myScrollView;

@end
