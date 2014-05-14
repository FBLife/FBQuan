//
//  FriendListCell.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-13.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FriendListCell.h"

@implementation FriendListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _headImageV=[[UIImageView alloc]init];
        [self addSubview:_headImageV];
        
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.font=[UIFont systemFontOfSize:13];
        _nameLabel.textColor=[UIColor blackColor];
        [self addSubview:_nameLabel];
        
        
        
    }
    return self;
}

-(void)setFriendAttribute:(FriendAttribute *)FriendAttributemodel{
    
    [_headImageV setImageWithURL:[NSURL URLWithString:FriendAttributemodel.headimg] placeholderImage:[UIImage imageNamed:@""]];
    _nameLabel.text=FriendAttributemodel.fbuname;

}

-(void)layoutSubviews{
    _headImageV.frame=CGRectMake(12, 12, 46, 46);

    _nameLabel.frame=CGRectMake(75, 30, 100, 15);

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
