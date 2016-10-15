//
//  DateValidator.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateValidator : NSDate

+(NSDate*)TimestapToDate:(NSString*)timeStamp;
+(NSString *)timeStamp:(NSDate *)dateMake;
+(double)timeMake:(NSString *)dateMake;
+(NSString*)RetunTimeAsString:(NSDate*)time;
@end
