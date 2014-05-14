//
//  FriendAttribute.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-12.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FriendAttribute.h"

//#import "pinyin.h"

@implementation FriendAttribute

-(void)setFriendAttributeDic:(NSDictionary *)dicinfo{


    _fbuname=[dicinfo objectForKey:@""];
    
    _fbuid=[dicinfo objectForKey:@""];

    _headimg=[dicinfo objectForKey:@""];

    

}

- (NSString *) getFirstName
{
    NSString * firstName;
    if ([[[self.fbuname substringToIndex:1] substringFromIndex:0] canBeConvertedToEncoding: NSASCIIStringEncoding])
    {
        //如果是英语
        firstName = self.fbuname;
    }
    else
    {
//如果是非英语
//firstName = [NSString stringWithFormat:@"%c",pinyinFirstLetter([[[self.fbuname substringToIndex:1] substringFromIndex:0] characterAtIndex:0])];
    }
    
    return firstName;
    
}

@end
