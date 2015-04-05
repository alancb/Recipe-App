//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Alan Barth on 4/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"
#import "RecipesTableVIewDataSource.h"

static CGFloat margin = 20;

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = [RARecipes titleAtIndex:self.indexForRecipe];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    //CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.index]];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin, self.view.frame.size.width - 2 * margin, 50)];
    //Need to fix height to adjust to how long the actual description is.
    description.text = [RARecipes descriptionAtIndex:self.indexForRecipe];
    description.numberOfLines = 0;
    [scrollView addSubview:description];
    
    UILabel *ingredientsTitle  = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin + 100, self.view.frame.size.width - 2 * margin, 20)];
    // Need to adjust height to fit for description
    ingredientsTitle.text = @"Ingredients";
    [scrollView addSubview:ingredientsTitle];
    
    CGFloat myNewY = margin + 20;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.indexForRecipe]; i++) {
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, myNewY + 200, self.view.frame.size.width - 2 * margin, 40)];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.indexForRecipe];
        [scrollView addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin, myNewY, self.view.frame.size.width - 2 * margin, 40)]; // Fix that! Boooo
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.indexForRecipe];
        [scrollView addSubview:type];
        myNewY += (20 + margin);
    }
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, 20, 20, 20)]; // Fix this
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:directionsTitle];
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.indexForRecipe] count] ; i++) {
        UILabel * count = [[UILabel alloc] initWithFrame:CGRectMake(11, 1, 1, 1)];
        count.text = [NSString stringWithFormat:@"%d", i + 1 ];
        [scrollView addSubview:count];
        
        
        UILabel * directions = [[UILabel alloc] initWithFrame:CGRectMake(1, 900, 1, 1)]; //fix it
        directions.text = [RARecipes directionsAtIndex:self.indexForRecipe][i];
        [scrollView addSubview:directions];
    }
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 600); //change height to be equal to something better
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
