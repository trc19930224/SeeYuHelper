//
//  ZYClipViewController.h
//  ZYImagePicker
//
//  Created by 石志愿 on 2017/8/23.
//  Copyright © 2017年 石志愿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYClipViewController : UIViewController

/// 裁剪框大小是否可变 默认: NO
@property (nonatomic, assign) BOOL resizableClipArea;

/// 裁剪框尺寸, resizableClipArea为YES时 此属性无效
@property (nonatomic, assign) CGSize clipSize;

/// 原图
@property (nonatomic, strong) UIImage *originalImage;

/// 裁剪框边框宽度, 默认1
@property (nonatomic, assign) CGFloat borderWidth;

/// 裁剪框边框颜色, 默认白色
@property (nonatomic, strong) UIColor *borderColor;

/// 裁剪框滑块宽度, 默认4, resizableClipArea为NO时 此属性无效
@property (nonatomic, assign) CGFloat slideWidth;

/// 裁剪框滑块长度, 默认40, resizableClipArea为NO时 此属性无效
@property (nonatomic, assign) CGFloat slideLength;

/// 裁剪框滑块颜色, 默认白色, resizableClipArea为NO时 此属性无效
@property (nonatomic, strong) UIColor *slideColor;

/// 取消裁剪
@property (nonatomic, copy) void (^cancelClipBlock)();

/// 裁剪完成的回调
@property (nonatomic, copy) void (^clippedBlock)(UIImage *clippedImage);

@end
