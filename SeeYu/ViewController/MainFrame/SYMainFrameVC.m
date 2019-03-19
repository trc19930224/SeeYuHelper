//
//  SYMainFrameVC.m
//  WeChat
//
//  Created by senba on 2017/9/11.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "SYMainFrameVC.h"
#import "SYMainFrameTableViewCell.h"
#import "SYCameraViewController.h"
#import "SYAnchorsOrderVC.h"
#import "SYNearbyVC.h"
#import "SYRankingVC.h"

@interface SYMainFrameVC ()

/// viewModel
@property (nonatomic, readwrite, strong) SYMainFrameVM *viewModel;

@property (nonatomic, strong) FSSegmentTitleView *titleView;

@property (nonatomic, strong) FSPageContentView *contentView;

@end

@implementation SYMainFrameVC

@dynamic viewModel;

/// 子类代码逻辑
- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置导航栏
    [self _setupNavigation];
    
}

#pragma mark - 设置导航栏
- (void)_setupNavigation{
    self.titleView = [[FSSegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 80, 44) titles:@[@"语聊",@"附近",@"榜单"] delegate:self indicatorType:FSIndicatorTypeEqualTitle];
    self.titleView.titleNormalColor = [UIColor whiteColor];
    self.titleView.titleSelectColor = [UIColor whiteColor];
    self.titleView.backgroundColor = [UIColor clearColor];
    self.titleView.indicatorColor = [UIColor whiteColor];
    self.titleView.titleFont = SYRegularFont(18);
    self.titleView.titleSelectFont = SYRegularFont(20);
    self.navigationItem.titleView = self.titleView;
    
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    SYAnchorsOrderVC *anchorsOrderVC = [[SYAnchorsOrderVC alloc] initWithViewModel:self.viewModel.anchorsOrderVM];
    [childVCs addObject:anchorsOrderVC];
    SYNearbyVC *nearVC = [[SYNearbyVC alloc]initWithViewModel:self.viewModel.nearbyVM];
    [childVCs addObject:nearVC];
//    UIViewController *vc3 = [[UIViewController alloc]init];
//    vc3.view.backgroundColor = [UIColor whiteColor];
//    [childVCs addObject:vc3];
    SYRankingVC *rankingVC = [[SYRankingVC alloc]initWithViewModel:self.viewModel.rankingVM];
    [childVCs addObject:rankingVC];
    
    self.contentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, SY_APPLICATION_TOP_BAR_HEIGHT, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - SY_APPLICATION_TOP_BAR_HEIGHT) childVCs:childVCs parentVC:self delegate:self];
    [self.view addSubview:_contentView];
}

- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.contentView.contentViewCurrentIndex = endIndex;
    self.title = @[@"语聊",@"附近",@"榜单"][endIndex];
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.titleView.selectIndex = endIndex;
    self.title = @[@"语聊",@"附近",@"榜单"][endIndex];
}

@end
