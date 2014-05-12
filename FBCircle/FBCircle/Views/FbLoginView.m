//
//  LoginView.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-9.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FbLoginView.h"

@implementation FbLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        



        
        _imgLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLogo];
        
        
        _centerKuangImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_centerKuangImgV];
        
        _passWordLabel=[[UITextField alloc]init];
        [self addSubview:_passWordLabel];
        
        _userLabel=[[UITextField alloc]init];
        [self addSubview:_userLabel];
        
        _loginButton=[[UIButton alloc]init];
        _loginButton.tag=101;
        _loginButton.backgroundColor=RGBCOLOR(208, 156, 95);
        
        [_loginButton addTarget:self action:@selector(dobutton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginButton];
        
        //        _forgetPassWordButton=[[UIButton alloc]init];
        //        _forgetPassWordButton.tag=102;
        //        [self addSubview:_forgetPassWordButton];
        
        _regeistbutton=[[UIButton alloc]init];
        [self addSubview:_regeistbutton];
        _regeistbutton.tag=103;
        [_regeistbutton addTarget:self action:@selector(dobutton:) forControlEvents:UIControlEventTouchUpInside];

        _regeistbutton.backgroundColor=[UIColor redColor];
        
        
        
        
        
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews{

    
    
    _imgLogo.center=CGPointMake(160, 232/2);
    
    _centerKuangImgV.center=CGPointMake(160, 550/2);
    
    _userLabel.frame=CGRectMake(42, (44-15)/2, 200, 15);
    
    _passWordLabel.frame=CGRectMake(42, 60, 200, 15);
    
    _loginButton.frame=CGRectMake(27, 694/2, 320-27*2, 44);
    
    _regeistbutton.frame=CGRectMake(0,iPhone5? 568-44:480-44, 320, 44);
    
    
    
}


-(void)setBloc:(LoginViewBloc)chuanrubloc{
    
    _bloc=chuanrubloc;
}


-(void)dobutton:(UIButton *)sender{
    
    
    _bloc(sender.tag);
    
    
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
