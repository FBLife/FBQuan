//
//  QBShowImagesScrollView.h
//  FBCircle
//
//  Created by soulnear on 14-5-13.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


typedef enum
{
    QBShowImagesScrollViewTypeLocation=0,
    QBShowImagesScrollViewTypeWeb
    
}QBShowImagesScrollViewType;


@interface QBShowImagesScrollView : UIScrollView<AsyncImageDelegate,UIScrollViewDelegate>
{
    BOOL _isZoomed;
    
    NSTimer * _tapTimer;
}


@property(nonatomic,strong)AsyncImageView * asyImageView;

@property(nonatomic,strong)AsyncImageView * locationImageView;

@property(nonatomic,assign)QBShowImagesScrollViewType ImageType;




-(QBShowImagesScrollView *)initWithFrame:(CGRect)frame WithLocation:(UIImage *)theImage;


-(QBShowImagesScrollView *)initWithFrame:(CGRect)frame WithUrl:(NSString *)theUrl;



@end
