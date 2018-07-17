//
//  rootViewController.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/17.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "rootViewController.h"
#import "ViewController.h"
#import "hudViewController.h"

@interface rootViewController ()
@property(nonatomic,strong) NSArray  *arr;
@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.arr = @[@"熊动画",@"HUD"];
    self.tableView.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:(@"cellID")];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        hudViewController *vc = [[hudViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
