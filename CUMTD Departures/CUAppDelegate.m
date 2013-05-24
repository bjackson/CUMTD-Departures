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
#import "CUDeparture.h"
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
    client = [[BJHTTPClient alloc] initWithBaseURL:baseURL];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];

    
}

- (IBAction)RefreshClicked:(id)sender
{
    NSLog(@"Doing something");
    NSDictionary *departures = [client requestDeparturesByStop:@"PLAZA"];
    
   
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
