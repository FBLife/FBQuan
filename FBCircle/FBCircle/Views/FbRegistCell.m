//
//  FbRegistCell.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//
//101代表button传过去的，102代表数值改变
#import "FbRegistCell.h"

@implementation FbRegistCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        _imgLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLogo];
        
        _imgLine=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:_imgLine];
        
        
        _inputField=[[UITextField alloc]init];
        _inputField.delegate=self;
        [self addSubview:_inputField];
        
        _sendVerficationButton=[[UIButton alloc]init];
        _sendVerficationButton.hidden=YES;
        [_sendVerficationButton addTarget:self action:@selector(setSendVerficationwith:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendVerficationButton];
        _sendVerficationButton.backgroundColor=[UIColor redColor];
        
    }
    return self;
}


-(void)layoutSubviews{
    
    _imgLogo.center=CGPointMake(20, 44.5);
//    _imgLine.center=CGPointMake(25, 28);
    _inputField.frame=CGRectMake(50, (44-18)/2, 200, 18);
    _sendVerficationButton.frame=CGRectMake(238, 0, 56, 44);
    
    
}

-(void)setFbRegistCellType:(FbRegistCellType)_type placeHolderText:(NSString *)_plcaeText fbregistbloc:(FbRegistCellBloc)_bloc row:(NSInteger)alarow{
    
    _rowofindexpath=alarow;
    switch (_type) {
        case 0:
        {
            _sendVerficationButton.hidden=YES;
        }
            break;
        case 1:
        {
            _sendVerficationButton.hidden=NO;
            
        }
            break;
            
        default:
            break;
    }
    
    _inputField.placeholder=_plcaeText;
    _mybloc=_bloc;
    
    
}

#pragma mark--发送验证码

-(void)setSendVerficationwith:(UIButton *)sender{


    _mybloc(101,_rowofindexpath,_inputField.text);

}

-(void)sendtextfieldtext{
    
 

}


#pragma mark--uitextfield的代理

-(void)textFieldDidEndEditing:(UITextField *)textField{

    //编辑完传过值去

    
}


-(BOOL)textField:(UITextField *)field shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    _mybloc(102,_rowofindexpath,[NSString stringWithFormat:@"%@%@",field.text,string]);

    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
 //   _mybloc(102,_rowofindexpath,textField.text);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
