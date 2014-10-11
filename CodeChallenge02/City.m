//
//  City.m
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "City.h"

@implementation City

- (id) initWithName: (NSString *)c_name state:(NSString *)c_state url:(NSString *)c_url{
    if (self = [super init]) {
        [self setName:c_name];
        [self setState:c_state];
        [self setUrl:c_url];
    }
    return self;
}
@end
