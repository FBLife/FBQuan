//
//  FbRegistCell.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FbRegistCell.h"

@implementation FbRegistCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imgLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLogo];
        
        _imgLine=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLine];

        
        _inputField=[[UITextField alloc]init];
        [self addSubview:_inputField];
        
        _sendVerficationButton=[[UIButton alloc]init];
        [self addSubview:_sendVerficationButton];
        
    }
    return self;
}


-(void)layoutSubviews{
    
    _imgLogo.center=CGPointMake(160, 44.5);
    _imgLine.center=CGPointMake(25, 28);
    _inputField.frame=CGRectMake(50, 20, 200, 15);
    _sendVerficationButton.frame=CGRectMake(238, 27, 56, 22);
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
