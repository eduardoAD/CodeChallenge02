//
//  WikiViewController.h
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface WikiViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@property (strong, nonatomic) City *city;
@end
