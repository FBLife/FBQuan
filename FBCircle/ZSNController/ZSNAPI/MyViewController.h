//
//  MyViewController.h
//  FBCircle
//
//  Created by soulnear on 14-5-12.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    MyViewControllerLeftbuttonTypeBack=0,
    MyViewControllerLeftbuttonTypelogo=1,
    MyViewControllerLeftbuttonTypeOther=2,
    MyViewControllerLeftbuttonTypeNull=3
}MyViewControllerLeftbuttonType;


typedef enum
{
    MyViewControllerRightbuttonTypeRefresh=0,
    MyViewControllerRightbuttonTypeSearch=1,
    MyViewControllerRightbuttonTypeText=2,
    MyViewControllerRightbuttonTypePerson=3,
    MyViewControllerRightbuttonTypeDelete=4,
    MyViewControllerRightbuttonTypeNull=5
}MyViewControllerRightbuttonType;


@interface MyViewController : UIViewController
{
    UIBarButtonItem * spaceButton;
}

@property(nonatomic,assign)MyViewControllerLeftbuttonType * leftButtonType;

@property(nonatomic,strong)NSString * rightString;

@property(nonatomic,strong)NSString * leftImageName;



-(void)setMyViewControllerLeftButtonType:(MyViewControllerLeftbuttonType)theType WithRightButtonType:(MyViewControllerRightbuttonType)rightType;


@end
