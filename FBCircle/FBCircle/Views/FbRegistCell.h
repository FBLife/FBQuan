//
//  FbRegistCell.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//

enum FbRegistCellStyle {
    NORMALSTYLE = 0,
    SECONDSTYLE = 1
    
    };


#import <UIKit/UIKit.h>

@interface FbRegistCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imgLogo;

@property(nonatomic,strong)UITextField *inputField;

@property(nonatomic,strong)UIButton *sendVerficationButton;

@property(nonatomic,strong)UIImageView *imgLine;

@end
