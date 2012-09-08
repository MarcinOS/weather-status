//
//  AppDelegate.m
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import "AppDelegate.h"
#import "WeatherConditions.h"
#import "SettingsWindowController.h"
#import "ConfigService.h"
#import "DataRefreshService.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self configureStatusItem];
	self.dataRefreshService = [[DataRefreshService alloc] initWithWeatherConditionDisplay:self];
	[[ConfigService instance] registerDefaultSettings];
}

- (void)configureStatusItem
{
	self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	self.statusItem.highlightMode = YES;
	self.statusItem.menu = self.menu;
}

- (IBAction)settingsMenuClicked:(id)sender
{
	self.settingsWindowController = [[SettingsWindowController alloc] initWithWindowNibName:@"SettingsWindowController"];
	[self.settingsWindowController showWindow:self];
}

- (void)displayWeatherConditions:(WeatherConditions *)weatherConditions
{
	NSString *temperatureUnit = [[NSUserDefaults standardUserDefaults] stringForKey:TEMPERATURE_UNIT_SETTING_KEY];
	NSString *temperatureUnitSymbol = [temperatureUnit substringToIndex:1];
	NSNumber *temperature = [temperatureUnitSymbol isEqualToString:@"C"] ? weatherConditions.tempC : weatherConditions.tempF;

	self.statusItem.title = [NSString stringWithFormat:@"%@ º%@", temperature, temperatureUnitSymbol];
}

@end
