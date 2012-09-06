//
//  AppDelegate.h
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SettingsWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSMenu *menu;
@property (strong) NSStatusItem *statusItem;
@property(strong) SettingsWindowController *settingsWindowController;

- (void)showCurrentConditions;


@end
