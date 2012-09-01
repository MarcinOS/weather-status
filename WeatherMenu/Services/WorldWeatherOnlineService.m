//
//  WorldWeatherOnlineService
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import "WorldWeatherOnlineService.h"
#import "WeatherConditions.h"
#import "WWOApiClient.h"


@implementation WorldWeatherOnlineService {

}

+ (WorldWeatherOnlineService<WeatherService> *)instance
{
	static WorldWeatherOnlineService *_instance = nil;

	@synchronized (self) {
		if (_instance == nil) {
			_instance = [[self alloc] init];
		}
	}

	return _instance;
}

- (void)currentConditions:(void (^)(WeatherConditions *))conditionsBlock
{
	// TODO get city and days number from config

	[[WWOApiClient instance] currentConditionsIn:@"Zawiercie" forDays:2 responseHandler:^(NSDictionary *conditionsDict) {
		NSDictionary *currentConditionsDict = [[[conditionsDict objectForKey:@"data"] objectForKey:@"current_condition"] lastObject];
		NSNumber *tempC = [currentConditionsDict objectForKey:@"temp_C"];
		NSNumber *tempF = [currentConditionsDict objectForKey:@"temp_F"];

		WeatherConditions *conditions = [[WeatherConditions alloc] init];
		conditions.tempC = tempC;
		conditions.tempF = tempF;

		conditionsBlock(conditions);
	}];
}


@end