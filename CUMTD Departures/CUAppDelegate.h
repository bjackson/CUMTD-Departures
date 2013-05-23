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

@interface CUAppDelegate : NSObject <NSApplicationDelegate, CLLocationManagerDelegate>
{
    IBOutlet NSMenu *statusMenu;
    NSStatusItem *statusItem;
    NSImage *statusImage;
    CLLocationManager *manager;
    NSURL *baseURL;
    AFHTTPClient *client;
}

- (IBAction)RefreshClicked:(id)sender;


@property (retain) CLLocationManager *manager;

//@property (assign) IBOutlet NSMenu *statusMenu;

@end
