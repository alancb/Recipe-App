//
//  RAViewController.m
//  Recipe App
//
//  Created by Alan Barth on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"

#import "RecipesTableVIewDataSource.h"

@interface RAViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableVIewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//    [self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewCellStyleDefault];
    self.tableView.frame = self.tableView.bounds;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"All-Time Best Recipes";
    self.dataSource = [RecipesTableVIewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
