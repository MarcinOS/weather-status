//
//  SettingsWindowController.m
//  WeatherMenu
//
//  Created by Marcin Swierczynski on 06.09.2012.
//  Copyright (c) 2012 Senco Software. All rights reserved.
//

#import "SettingsWindowController.h"
#import "AppDelegate.h"
#import "DataRefreshService.h"

@interface SettingsWindowController ()

@end

@implementation SettingsWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)windowWillClose:(NSNotification *)notification
{
	AppDelegate *delegate = [NSApp delegate];
	[delegate.dataRefreshService presentCurrentConditions];
}

@end
