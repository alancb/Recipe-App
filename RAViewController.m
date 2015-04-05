//
//  RAViewController.m
//  Recipe App
//
//  Created by Alan Barth on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RecipesTableVIewDataSource.h"
#import "RecipeDetailViewController.h"

@interface RAViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableVIewDataSource *dataSource;
@property (nonatomic, strong) RecipeDetailViewController *viewController;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.frame = self.tableView.bounds;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"All-Time Best Recipes";
    self.dataSource = [RecipesTableVIewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.viewController = [RecipeDetailViewController new];
    [self.navigationController pushViewController:self.viewController animated:YES];
    
    self.viewController.indexForRecipe = indexPath.row;
    
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
