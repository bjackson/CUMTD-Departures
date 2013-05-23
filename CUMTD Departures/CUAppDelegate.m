//
//  CUAppDelegate.m
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/7/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import "CUAppDelegate.h"
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
static NSString *const BaseURLString = @"http://developer.cumtd.com/api/v2.2/json/";


@implementation CUAppDelegate

@synthesize manager;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.manager = [[CLLocationManager alloc] init];
    [self.manager setDelegate:self];
    [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.manager setDistanceFilter:kCLDistanceFilterNone];
    [self.manager startUpdatingLocation];
    baseURL = [NSURL URLWithString:[NSString stringWithFormat:BaseURLString]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
}

- (IBAction)RefreshClicked:(id)sender
{
    NSLog(@"Doing something");
    NSURL *url = [NSURL URLWithString:@"http://developer.cumtd.com/api/v2.2/json/GetDeparturesByStop?key=b7e39526445d48318fcff9d2a041e73b&stop_id=IU"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"IP Address: %@", [response description]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"%@", [error localizedDescription]);
    }];
    
    [operation start];


}

- (void)awakeFromNib
{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    NSBundle *bundle = [NSBundle mainBundle];
    
    statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"stopico" ofType:@"png"]];

    [statusItem setImage:statusImage];
    [statusItem setMenu:statusMenu];

    
}

@end
