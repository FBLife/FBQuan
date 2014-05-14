//
//  FbRegistCell.h
//  FBCircle
//
//  Created by 史忠坤 on 14-5-10.
//  Copyright (c) 2014年 szk. All rights reserved.
//




#import <UIKit/UIKit.h>


typedef enum{
    FbRegistCellTypeNormal=0,
    FbRegistCellTypeofButton=1,
}FbRegistCellType;

typedef void(^FbRegistCellBloc)(int tag ,NSInteger  indexpathofrow,NSString *stringtext);


@interface FbRegistCell : UITableViewCell<UITextFieldDelegate>

@property(nonatomic,strong)UIImageView *imgLogo;

@property(nonatomic,strong)UITextField *inputField;

@property(nonatomic,strong)UIButton *sendVerficationButton;

@property(nonatomic,strong)UIImageView *imgLine;

@property(nonatomic,copy)FbRegistCellBloc mybloc;

@property(nonatomic,assign)NSInteger  rowofindexpath;



-(void)setFbRegistCellType:(FbRegistCellType)_type placeHolderText:(NSString *)_plcaeText fbregistbloc:(FbRegistCellBloc)_bloc row:(NSInteger )alarow;

-(void)sendtextfieldtext;

@end
