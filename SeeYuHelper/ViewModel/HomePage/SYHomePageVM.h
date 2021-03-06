//
//  SYHomePageVM.h
//  WeChat
//
//  Created by senba on 2017/9/11.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//  主界面的视图的视图模型

#import "SYTabBarViewModel.h"
#import "SYMainFrameVM.h"
#import "SYProfileVM.h"

@interface SYHomePageVM : SYTabBarViewModel

/// The view model of `MainFrame` interface.
@property (nonatomic, strong, readonly) SYMainFrameVM *mainFrameViewModel;

/// The view model of `Profile` interface.
@property (nonatomic, strong, readonly) SYProfileVM *profileViewModel;

@end
