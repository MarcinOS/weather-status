//
//  AppDelegate.m
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import "AppDelegate.h"
#import "WorldWeatherOnlineService.h"
#import "WeatherConditions.h"
#import "SettingsWindowController.h"
#import "ConfigService.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[[ConfigService instance] registerDefaultSettings];
	[self configureStatusItem];
	[self showCurrentConditions];
}

- (void)configureStatusItem
{
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.highlightMode = YES;
    self.statusItem.menu = self.menu;
}

- (void)showCurrentConditions
{
	self.statusItem.title = @"...";

	[[WorldWeatherOnlineService instance] currentConditions:^(WeatherConditions *conditions) {
		self.statusItem.title = [NSString stringWithFormat:@"%@ ºC", conditions.tempC];
	}];
}

- (IBAction)settingsMenuClicked:(id)sender {
	self.settingsWindowController = [[SettingsWindowController alloc] initWithWindowNibName:@"SettingsWindowController"];
	[self.settingsWindowController showWindow:self];
}

@end
