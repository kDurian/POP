//
//  OAuth2AccountTool.m
//  POP
//
//  Created by Durian on 2017/1/1.
//  Copyright © 2017年 durian. All rights reserved.
//

#import "OAuth2AccountTool.h"

#define kAccountFilePath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject
#define kAccountFileName [kAccountFilePath stringByAppendingString:@"account.data"]

@implementation OAuth2AccountTool
+ (OAuth2Account *)account {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountFileName];
}

+ (BOOL)saveAccount:(OAuth2Account *)account {
    return [NSKeyedArchiver archiveRootObject:account toFile:kAccountFileName];
}
@end
