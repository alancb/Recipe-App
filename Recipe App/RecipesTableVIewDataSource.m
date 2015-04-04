//
//  RecipesTableVIewDataSource.m
//  Recipe App
//
//  Created by Alan Barth on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableVIewDataSource.h"
#import "RARecipes.h"

@implementation RecipesTableVIewDataSource

//- (void) registerTableView (UITableView *) tableView   {
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];

    return cell;
}



@end
