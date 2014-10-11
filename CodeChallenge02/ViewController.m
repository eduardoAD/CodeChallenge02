//
//  ViewController.m
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.statesArray = [[NSMutableArray alloc] init];

    City *morelia = [[City alloc]initWithName:@"Morelia"
                                        state:@"Michoacan"
                                          url:@"http://es.wikipedia.org/wiki/Morelia"
                                        image:[UIImage imageNamed:@"morelia"]];

    City *monterrey = [[City alloc]initWithName:@"Monterrey"
                                          state:@"Nuevo Leon"
                                            url:@"http://es.wikipedia.org/wiki/Monterrey"
                                          image:[UIImage imageNamed:@"monterrey"]];

    City *guadalajara = [[City alloc]initWithName:@"Guadalajara"
                                            state:@"Jalisco"
                                              url:@"http://es.wikipedia.org/wiki/Guadalajara_(Mexico)"
                                            image:[UIImage imageNamed:@"guadalajara"]];

    City *cancun = [[City alloc]initWithName:@"Cancun"
                                       state:@"Quintana Roo"
                                         url:@"http://es.wikipedia.org/wiki/Cancun"
                                       image:[UIImage imageNamed:@"cancun"]];

    self.statesArray = [NSMutableArray arrayWithObjects:monterrey, guadalajara, cancun, morelia, nil];

    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [recognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.myTableView addGestureRecognizer:recognizerLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stateCell" forIndexPath:indexPath];

    City *city  = [self.statesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = city.image;
    
    return cell;
}

- (void) handleSwipe: (UISwipeGestureRecognizer *)gestureRecognizer {
    CGPoint location = [gestureRecognizer locationInView:self.myTableView];
    NSIndexPath *indexPath = [self.myTableView indexPathForRowAtPoint:location];
    if(indexPath){
        City *citySelected = [self.statesArray objectAtIndex:indexPath.row];
        if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft){
            [self.statesArray removeObject:citySelected];
        }

        [self.myTableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetailCity"]) {
        CityViewController *destinationViewController = segue.destinationViewController;

        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        City *citySelected = [self.statesArray objectAtIndex:indexPath.row];

        destinationViewController.city = citySelected;
    }
}

- (void) didMoveToParentViewController:(UIViewController *)parent{
    [self.myTableView reloadData];
}

@end
