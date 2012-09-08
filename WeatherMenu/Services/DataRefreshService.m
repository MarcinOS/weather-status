//
//  DataRefreshService
//
//  Created by Marcin Swierczynski on 08.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import "DataRefreshService.h"
#import "WeatherConditions.h"
#import "WorldWeatherOnlineService.h"
#import "ConfigService.h"
#import "WeatherConditionDisplay.h"


@implementation DataRefreshService {

}

- (id)initWithWeatherConditionDisplay:(id <WeatherConditionDisplay>)weatherConditionDisplay
{
	self = [super init];
	if (self) {
		_weatherConditionDisplay = weatherConditionDisplay;
		[self registerAsRefreshIntervalObserver];
		[self presentCurrentConditions];
	}

	return self;
}

- (void)registerAsRefreshIntervalObserver
{
	[[NSUserDefaultsController sharedUserDefaultsController] addObserver:self forKeyPath:REFRESH_INTERVAL_KEY_PATH
																 options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
	if ([keyPath isEqual:REFRESH_INTERVAL_KEY_PATH]) {
		[self startRefreshingConditions];
	}
}

- (void)startRefreshingConditions
{
	NSInteger newRefreshIntervalInMinutes = [[NSUserDefaults standardUserDefaults] integerForKey:REFRESH_INTERVAL_SETTING_KEY];
	NSInteger newRefreshIntervalInSeconds = newRefreshIntervalInMinutes * 60;

	[self.refreshTimer invalidate];
	self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:newRefreshIntervalInSeconds target:self
													   selector:@selector(presentCurrentConditions) userInfo:nil repeats:YES];
}

- (void)presentCurrentConditions
{
	NSLog(@"Downloading new weather conditions...");

	[[WorldWeatherOnlineService instance] currentConditions:^(WeatherConditions *conditions) {
		[self.weatherConditionDisplay displayWeatherConditions:conditions];
	}];
}

@end