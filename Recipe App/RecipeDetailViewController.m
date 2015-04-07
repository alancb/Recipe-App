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
    
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.indexForRecipe]];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin, self.view.frame.size.width - 2 * margin, heightForDescription)];
    description.text = [RARecipes descriptionAtIndex:self.indexForRecipe];
    description.numberOfLines = 0;
    [scrollView addSubview:description];
    
    CGFloat myNewY = heightForDescription + margin * 2;
    
    UILabel *ingredientsTitle  = [[UILabel alloc] initWithFrame:CGRectMake(margin, myNewY - 10, self.view.frame.size.width - 2 * margin, 24)];
    ingredientsTitle.text = @"Ingredients";
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:20];
    [scrollView addSubview:ingredientsTitle];
    
    myNewY += margin + 20;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.indexForRecipe]; i++) {
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, myNewY, self.view.frame.size.width - 2 * margin, 40)];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.indexForRecipe];
        [scrollView addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 2 * margin) / 3, myNewY, self.view.frame.size.width - 2 * margin, 40)];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.indexForRecipe];
        [scrollView addSubview:type];
        myNewY += (20 + margin);
    }
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, myNewY + 10, self.view.frame.size.width - 2 * margin, 20)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:20];
    [scrollView addSubview:directionsTitle];
    myNewY += (20 + margin);
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.indexForRecipe] count] ; i++) {
        
        UILabel * count = [[UILabel alloc] initWithFrame:CGRectMake(margin , myNewY, 35, 20)];
        count.text = [NSString stringWithFormat:@"%d", i + 1 ];
        [scrollView addSubview:count];
        
        CGFloat heightInDirections = [self heightForDirections: [RARecipes directionsAtIndex:self.indexForRecipe][i]];
        
        UILabel * directions = [[UILabel alloc] initWithFrame:CGRectMake(margin + 35, myNewY, (self.view.frame.size.width - 2 * margin - 40), heightInDirections)];
        directions.text = [RARecipes directionsAtIndex:self.indexForRecipe][i];
        directions.numberOfLines = 0;
        [scrollView addSubview:directions];
        
        myNewY += (heightInDirections + margin);
    }
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, myNewY + margin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) heightForDescription: (NSString *) description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 20]}
                                                context:nil];
    return bounding.size.height;
}
- (CGFloat) heightForDirections: (NSString *) directions {
    CGRect bounding = [directions boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 20]}
                                               context:nil];
    return bounding.size.height;
}

@end
