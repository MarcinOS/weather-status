//
//  AppDelegate.h
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WeatherConditionDisplay.h"

@class SettingsWindowController;
@class DataRefreshService;

@interface AppDelegate : NSObject <NSApplicationDelegate, WeatherConditionDisplay>

@property(assign) IBOutlet NSMenu *menu;
@property(strong) NSStatusItem *statusItem;
@property(strong) SettingsWindowController *settingsWindowController;
@property(strong) DataRefreshService *dataRefreshService;

@end
