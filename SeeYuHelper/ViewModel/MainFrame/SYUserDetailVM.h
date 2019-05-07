//
//  SYUserDetailVM.h
//  SeeYuHelper
//
//  Created by 唐荣才 on 2019/5/6.
//  Copyright © 2019 fljj. All rights reserved.
//

#import "SYVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface SYUserDetailVM : SYVM

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) SYUser *user;

@property (nonatomic, strong) RACCommand *requestUserDetailInfoCommand;

@end

NS_ASSUME_NONNULL_END