//
//  City.h
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property NSString *name;
@property NSString *state;
@property NSString *url;

- (id) initWithName: (NSString *)c_name state:(NSString *)c_state url:(NSString *)c_url;
@end
