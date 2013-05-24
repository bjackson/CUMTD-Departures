//
//  CUAppDelegate.h
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/7/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking/AFNetworking.h"
#import "BJHTTPClient.h"

@interface CUAppDelegate : NSObject <NSApplicationDelegate, CLLocationManagerDelegate>
{
    IBOutlet NSMenu *statusMenu;
    IBOutlet NSView *departureView;
    NSStatusItem *statusItem;
    NSImage *statusImage;
    CLLocationManager *manager;
    NSURL *baseURL;
    BJHTTPClient *client;
}

- (IBAction)RefreshClicked:(id)sender;
+ (void)updateDepartures:(NSMutableArray *)departures;
- (IBAction)showPopover:(id)sender;


@property (assign) IBOutlet NSPopover *popover;
@property (retain) CLLocationManager *manager;

//@property (assign) IBOutlet NSMenu *statusMenu;

@end
