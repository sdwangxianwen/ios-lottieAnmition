//
//  hudViewController.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/17.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "hudViewController.h"
#import <Lottie/Lottie.h>


@interface hudViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray  *dataArr;
@property(nonatomic,strong) UITableView  *mainTableView;

@end

@implementation hudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = @[@"加载",@"失败",@"成功"];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    self.mainTableView.tableFooterView = [UIView new];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:(@"cellID")];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }
    if (indexPath.row == 1) {
        
    }
    if (indexPath.row == 2) {
        
    }
}



@end
