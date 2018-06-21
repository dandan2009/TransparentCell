//
//  ViewController.m
//  TransparentCell
//
//  Created by shan on 2018/6/20.
//  Copyright © 2018年 shan. All rights reserved.
//

#import "ViewController.h"
#import "TransparentCell.h"
#define TransparentCellIdentifier @"TransparentCell"
#define UITableViewCellIdentifier @"UITableViewCell"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) TransparentCell *transparentCell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect tableViewFrame = self.view.frame; //CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //首页table
    self.myTableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.myTableView.scrollsToTop = YES;
//    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
//    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.multipleTouchEnabled = NO;
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.clipsToBounds = NO;
    self.myTableView.estimatedRowHeight = 0;
    self.myTableView.estimatedSectionHeaderHeight = 0;
    self.myTableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.myTableView];
    
    [self.myTableView registerClass:[TransparentCell class] forCellReuseIdentifier:TransparentCellIdentifier];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellIdentifier];
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell ;
    if (indexPath.row == 5) {
        cell = [tableView dequeueReusableCellWithIdentifier:TransparentCellIdentifier];
        self.transparentCell = (TransparentCell *)cell;
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
        cell.textLabel.text = @"ddd";
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.transparentCell scrollViewDidScroll:scrollView];
}


@end
