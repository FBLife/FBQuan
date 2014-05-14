//
//  FriendAttribute.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-12.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendAttribute : NSObject

@property(nonatomic,strong)NSString *fbuname;

@property(nonatomic,strong)NSString *fbuid;

@property(nonatomic,strong)NSString *headimg;


-(void)setFriendAttributeDic:(NSDictionary *)dicinfo;
- (NSString *) getFirstName;

@end
