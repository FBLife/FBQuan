//
//  FriendListViewController.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-6.
//  Copyright (c) 2014年 szk. All rights reserved.
//

#import "FriendListViewController.h"
#import "FriendListCell.h"
#import "FriendAttribute.h"//cell的model
@interface FriendListViewController ()

@end

@implementation FriendListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mainTabV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, iPhone5?568:480)];
    [self.view addSubview:_mainTabV];
    _mainTabV.delegate=self;
    _mainTabV.dataSource=self;
    
    arrayOfCharacters=[NSMutableArray array];
    
    for (char c='A'; c<'Z'; c++) {
        [arrayOfCharacters addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
    arrayname=[NSMutableArray array];
    
    [arrayname addObject:@"高猛"];
    [arrayname addObject:@"张少南"];
    [arrayname addObject:@"史忠坤"];
    [arrayname addObject:@"金炳"];
    [arrayname addObject:@"罗华"];
    [arrayname addObject:@"阿拉"];
    [arrayname addObject:@"bigman"];
    [arrayname addObject:@"曹操"];
    [arrayname addObject:@"大辉"];
    [arrayname addObject:@"华为"];
    [arrayname addObject:@"孟加拉"];
    [arrayname addObject:@"扎菲特"];

    
    [self getmyFriendList];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 26;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return arrayOfCharacters.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *stridentifier=@"identifier";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:stridentifier];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stridentifier];
        
    }
    
    cell.textLabel.text=[arrayOfCharacters objectAtIndex:indexPath.row];
    //[cell setFriendAttribute:[[FriendAttribute alloc] init]];
    return cell;

}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{

    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
    for(char c = 'A';c<='Z';c++)
        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    return toBeReturned;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

   

    UILabel *_label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    _label.text=[NSString stringWithFormat:@"%c",'A'+section];
    
    _label.backgroundColor=[UIColor grayColor];
    
    return _label;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    
    
    
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
    NSInteger count = 0;
    for(NSString *character in arrayOfCharacters)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
    
}



//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if([arrayOfCharacters count]==0)
//    {
//        return @"";
//    }
//        return [arrayOfCharacters objectAtIndex:section];
//    
//    
//    
//}





#pragma mark--获取好友列表

-(void)getmyFriendList{

    SzkLoadData *_loadRegist=[[SzkLoadData alloc]init];
    NSString *str_url=[NSString stringWithFormat:GETFRIENDLIST,@"BDBWMVMwUTUFOgNvVi1TPVYkBnsPMVtnCWtZew8+AG9WOQ=="];

    [_loadRegist SeturlStr:str_url block:^(NSArray *arrayinfo, NSString *errorindo, int errcode) {
        
        if (errcode==0) {
            NSLog(@"sxs%@",arrayinfo);
            
        }
        
        
    }];
    
    
    NSLog(@"注册的接口为==%@",str_url);

}
//处理数据

-(NSArray *)changearrayWitharray:(NSArray *)array_name
{

 
    
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];//这个是建立索引的核心
    
  

    
    NSInteger highSection = [[theCollation sectionTitles] count]; //返回的应该是27，是a－z和＃
    NSMutableArray *sectionArrays = [NSMutableArray arrayWithCapacity:highSection]; //tableView 会被分成27个section
    
    
    
    
    
    for (int i=0; i<=highSection; i++)
    {
        
        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
        [sectionArrays addObject:sectionArray];
    }
    
    return sectionArrays;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
