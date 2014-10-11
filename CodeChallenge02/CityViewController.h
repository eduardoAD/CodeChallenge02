//
//  CityViewController.h
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityNameText;
@property (strong, nonatomic) IBOutlet UITextField *cityStateText;
@property (strong, nonatomic) IBOutlet UILabel *cityWikiLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cityImage;

@property (strong, nonatomic) City *city;
@property BOOL editButtonToggled;
@end
