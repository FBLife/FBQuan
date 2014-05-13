//
//  FbRegistView.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-12.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FbRegistView.h"

@implementation FbRegistView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imgLogo0=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLogo0];
        
 
        
        _inputField0=[[UITextField alloc]init];
        [self addSubview:_inputField0];
        
        _sendVerficationButton=[[UIButton alloc]init];
        _sendVerficationButton.hidden=YES;
        [_sendVerficationButton addTarget:self action:@selector(setSendVerficationButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendVerficationButton];
        _sendVerficationButton.backgroundColor=[UIColor redColor];
        
        
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
