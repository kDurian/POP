//
//  OAuth2AccountTool.h
//  POP
//
//  Created by Durian on 2017/1/1.
//  Copyright © 2017年 durian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OAuth2Account;

@interface OAuth2AccountTool : NSObject

+ (OAuth2Account *)account;

+ (BOOL)saveAccount:(OAuth2Account *)account;

@end
