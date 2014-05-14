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
        

        self.backgroundColor=[UIColor colorWithPatternImage:iPhone5?[UIImage imageNamed:@"loginbackground640_1136.png"]:[UIImage imageNamed:@""]];
        
        _imgLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"FBQuanLogInLogo216_178.png"]];
        [self addSubview:_imgLogo];
        
        
        _centerKuangImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"inputtext532_182.png"]];
        [self addSubview:_centerKuangImgV];
        _centerKuangImgV.userInteractionEnabled=YES;
        
        _passWordLabel=[[UITextField alloc]init];
        _passWordLabel.secureTextEntry=YES;
        _passWordLabel.placeholder=@"请输入密码";
        _passWordLabel.textColor=[UIColor whiteColor];
        _passWordLabel.backgroundColor=[UIColor clearColor];
        _passWordLabel.delegate=self;
        [_centerKuangImgV addSubview:_passWordLabel];
        
        _userLabel=[[UITextField alloc]init];
        _userLabel.backgroundColor=[UIColor clearColor];
        _userLabel.textColor=[UIColor whiteColor];
        _userLabel.placeholder=@"请输入手机号码/E族ID";
        [_centerKuangImgV addSubview:_userLabel];
        _userLabel.delegate=self;
        _userLabel.returnKeyType=UIReturnKeyDone;
        
        _loginButton=[[UIButton alloc]init];
        _loginButton.tag=101;
        
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"logInMark528_88@2x.png"] forState:UIControlStateNormal];
        
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        
        [_loginButton addTarget:self action:@selector(dobutton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginButton];
        
        //        _forgetPassWordButton=[[UIButton alloc]init];
        //        _forgetPassWordButton.tag=102;
        //        [self addSubview:_forgetPassWordButton];
        
        
        
        _regeistbutton=[[UIButton alloc]init];
        [self addSubview:_regeistbutton];
        _regeistbutton.tag=103;
        
        [_regeistbutton setBackgroundImage:[UIImage imageNamed:@"FBQuanRegist640_87.png"] forState:UIControlStateNormal];

        [_regeistbutton addTarget:self action:@selector(dobutton:) forControlEvents:UIControlEventTouchUpInside];

        
        [_regeistbutton setTitle:@"新用户注册" forState:UIControlStateNormal];
        
        [_regeistbutton setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0,170)];//上左下右

        //右边的向右的小箭头
        
        UIImageView *imgrow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buttonAccessType21_32.png"]];
        imgrow.center=CGPointMake(280, 22);
        [_regeistbutton addSubview:imgrow];
        
        //测试
        
        
    }
    return self;
}

-(void)layoutSubviews{

    
    
    _imgLogo.center=CGPointMake(160, 232/2);
    
    _centerKuangImgV.center=CGPointMake(160, 550/2);
    
    _userLabel.frame=CGRectMake(42, (44-14)/2, 200, 18);
    
    _passWordLabel.frame=CGRectMake(42, 60, 200, 18);
    
    _loginButton.frame=CGRectMake((320-528/2)/2-1, 694/2, 528/2, 44);
    
    _regeistbutton.frame=CGRectMake(0,iPhone5? 568-44:480-44, 320, 44);
    
    
    
}


-(void)setBloc:(LoginViewBloc)chuanrubloc{
    
    _bloc=chuanrubloc;
}


-(void)dobutton:(UIButton *)sender{
    
    
    _bloc(sender.tag);
    
    [self setnormal];

    
    
}

#pragma mark-

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [self setnormal];

    
    return YES;
}



-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    [self sethigh];

}

-(void)sethigh{
    [UIView animateWithDuration:0.4 animations:^{
        //动画内容
        
        _imgLogo.center=CGPointMake(160,-40+232/2);
        _centerKuangImgV.center=CGPointMake(160, -80+550/2);
        _loginButton.frame=CGRectMake((320-528/2)/2-1, -80+694/2, 528/2, 44);
        
        

        
    }completion:^(BOOL finished)
     
     {
         
     }];

}

-(void)setnormal{
    
    [UIView animateWithDuration:0.4 animations:^{
        _imgLogo.center=CGPointMake(160, 232/2);
        _centerKuangImgV.center=CGPointMake(160, 550/2);
        _loginButton.frame=CGRectMake((320-528/2)/2-1, 694/2, 528/2, 44);
        
        [_userLabel resignFirstResponder];
        [_passWordLabel resignFirstResponder];

        //动画内容
        
    }completion:^(BOOL finished)
     
     {
         
         
     }];
    



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
