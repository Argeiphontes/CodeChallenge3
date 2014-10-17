//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "DivvyStation.h"

@interface StationsListViewController () <UITabBarDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSMutableArray *divvysArray;

@end

@implementation StationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.divvysArray = [NSMutableArray array];
    NSURL *url = [NSURL URLWithString:@"http://www.divvybikes.com/stations/json/"];
    [self loadJSON:url];

}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.divvysArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    DivvyStation *station = [self.divvysArray objectAtIndex:indexPath.row];
    cell.textLabel.text = station.stationAddress;
    cell.detailTextLabel.text = station.availableBikes;
    cell.textLabel.text = @"I work";
    return cell;
}



#pragma mark - helper methods

- (void) loadJSON: (NSURL *) jsonURL
{
    NSURLRequest *request = [NSURLRequest requestWithURL:jsonURL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

//        NSLog(@"%@", connectionError);
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        NSError *jsonError = nil;


        NSDictionary *divvyJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *arrayOfDivvyStations =  [divvyJSON objectForKey: @"stationBeanList"];

        for (NSDictionary *stationDictionary in arrayOfDivvyStations)
        {
            DivvyStation *station = [[DivvyStation alloc] initWithDictionary:stationDictionary];
            [self.divvysArray addObject:station];
//            NSLog(@"Station %@", station);
        }

        NSLog(@"%lu", (unsigned long)self.divvysArray.count);
        NSLog(@"%@", self.divvysArray);
        [self.tableView reloadData];


//        NSLog(@"Connection error: %@", connectionError);
//        NSLog(@"JSON error: %@", jsonError);
        
    }];

}

@end
