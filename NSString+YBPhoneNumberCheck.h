//
//  NSString+YBPhoneNumberCheck.h
//  category
//
//  Created by LYB on 16/6/28.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YBPhoneNumberCheck)

/**
 *  检测字符串中是否包含电话号码
 *
 *  @return 电话号码数组
 */
- (NSArray *)yb_phoneNumberContained;

/**
 *  检测字符串是不是电话号码
 *
 *  @return yes OR no
 */
- (BOOL)yb_isPhoneNumber;

@end
