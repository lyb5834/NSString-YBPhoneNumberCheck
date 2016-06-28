//
//  NSString+YBPhoneNumberCheck.m
//  category
//
//  Created by LYB on 16/6/28.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import "NSString+YBPhoneNumberCheck.h"

@implementation NSString (YBPhoneNumberCheck)

- (NSArray *)yb_phoneNumberContained
{
    NSError *error;
    
    NSString *TY = @"1([0-9][0-9])\\d{8}";
    
    NSString *PHS = @"((0\\d{2,3}-?\\d{7,8})|(1[3584]\\d{9}))";
    
    NSRegularExpression *regexTY = [NSRegularExpression
                                    regularExpressionWithPattern:TY
                                    options:NSRegularExpressionCaseInsensitive
                                    error:&error];
    
    NSArray *arrayOfAllMatchesTY = [regexTY matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSRegularExpression *regexPHS = [NSRegularExpression
                                     regularExpressionWithPattern:PHS
                                     options:NSRegularExpressionCaseInsensitive
                                     error:&error];
    
    NSArray *arrayOfAllMatchesPHS = [regexPHS matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in arrayOfAllMatchesTY) {
        NSString *str = [self substringWithRange:match.range];
        [resultArray addObject:str];
    }
    
    for (NSTextCheckingResult *match in arrayOfAllMatchesPHS) {
        NSString *str = [self substringWithRange:match.range];
        [resultArray addObject:str];
    }
    
    NSMutableArray *strArray = [NSMutableArray array];
    for (int i = 0; i < resultArray.count; i++) {
        if (![strArray containsObject:resultArray[i]]) {
            [strArray addObject:resultArray[i]];
        }
    }
    
    return strArray;
}


- (BOOL)yb_isPhoneNumber
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09]|7[0-9])[0-9]|349)\\d{7}$";
    
    NSString *PHS = @"^((0\\d{2,3}-?\\d{7,8})|(1[3584]\\d{9}))$";
    
    NSString *DH = @"^(\\d{3})$";

    NSString *TY = @"^1([0-9][0-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    NSPredicate *regextestdh = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",DH];
    NSPredicate *regextestty = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TY];
    
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
    BOOL res5 = [regextestdh evaluateWithObject:self];
    BOOL res6 = [regextestphs evaluateWithObject:self];
    BOOL res7 = [regextestty evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 || res5 || res6 || res7){
        return YES;
    }
    else {
        return NO;
    }
}

@end
