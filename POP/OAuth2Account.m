//
//  OAuth2Account.m
//  POP
//
//  Created by Durian on 2017/1/1.
//  Copyright © 2017年 durian. All rights reserved.
//

#import "OAuth2Account.h"

@implementation OAuth2Account
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        _remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}
@end
