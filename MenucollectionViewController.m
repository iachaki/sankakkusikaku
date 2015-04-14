//
//  MenucollectionViewController.m
//  sankakkusikaku
//
//  Created by ia on 2015/04/11.
//  Copyright (c) 2015年 Life is tech. All rights reserved.
//

#import "MenucollectionViewController.h"

@interface MenucollectionViewController ()

@end

@implementation MenucollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //_collectionView.scrollEnabled=YES;
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    /*
     CGRect cellRect = cell.bounds;
     
     cellRect.size.width = 106;
     cell.bounds = cellRect;
     */
    
    // 選択状態の UI を backgroundView に設定
    UIView *selectedView = [UIView new];
    selectedView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7];
    cell.selectedBackgroundView = selectedView;
    
    [cell bringSubviewToFront:selectedView];
    
    
    
    
//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    @end
