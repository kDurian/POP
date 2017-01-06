//
//  OAuth2Account.h
//  POP
//
//  Created by Durian on 2017/1/1.
//  Copyright © 2017年 durian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuth2Account : NSObject <NSCoding>
@property(nonatomic, copy) NSString *access_token;
@property(nonatomic, copy) NSString *expires_in;
@property(nonatomic, copy) NSString *remind_in;
@property(nonatomic, copy) NSString *uid;
@end
