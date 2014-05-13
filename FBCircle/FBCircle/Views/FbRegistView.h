//
//  FbRegistView.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-12.
//  Copyright (c) 2014年 szk. All rights reserved.
//


typedef void(^FbRegistViewBloc)(int tag);

#import <UIKit/UIKit.h>

@interface FbRegistView : UIView

@property(nonatomic,strong)UIImageView *imgLogo0;

@property(nonatomic,strong)UIImageView *imgLogo1;

@property(nonatomic,strong)UIImageView *imgLogo2;

@property(nonatomic,strong)UIImageView *imgLogo3;


@property(nonatomic,strong)UITextField *inputField0;

@property(nonatomic,strong)UITextField *inputField1;

@property(nonatomic,strong)UITextField *inputField2;

@property(nonatomic,strong)UITextField *inputFiel3;



@property(nonatomic,strong)UIButton *sendVerficationButton;


@property(nonatomic,copy)FbRegistViewBloc mybloc;

@end
