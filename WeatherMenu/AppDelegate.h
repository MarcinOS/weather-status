//
//  AppDelegate.h
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSMenu *menu;
@property (strong) NSStatusItem *statusItem;

@end