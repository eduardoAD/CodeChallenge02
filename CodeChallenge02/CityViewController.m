//
//  CityViewController.m
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "CityViewController.h"
#import "WikiViewController.h"

@interface CityViewController ()

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityNameLabel.text = self.city.name;
    self.cityNameText.text = self.city.name;
    self.cityNameText.hidden = YES;

    self.cityStateLabel.text = self.city.state;
    self.cityStateText.text = self.city.state;
    self.cityStateText.hidden = YES;

    self.cityImage.image = self.city.image;

    self.editButtonToggled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onEditButtonPressed:(UIButton *)sender {
    if (!self.editButtonToggled) {
        [sender setTitle:@"Save" forState:UIControlStateNormal];
        self.editButtonToggled = YES;

        self.cityNameLabel.hidden = YES;
        self.cityNameText.hidden = NO;

        self.cityStateLabel.hidden = YES;
        self.cityStateText.hidden = NO;
    }else{
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editButtonToggled = NO;

        self.cityNameLabel.hidden = NO;
        self.cityNameLabel.text = self.cityNameText.text;
        self.city.name = self.cityNameText.text;

        self.cityStateLabel.hidden = NO;
        self.cityStateLabel.text = self.cityStateText.text;
        self.city.state = self.cityStateText.text;

        self.cityNameText.hidden = YES;
        self.cityStateText.hidden = YES;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        WikiViewController *wikiViewController = segue.destinationViewController;
        wikiViewController.city = self.city;
}

@end
