//
//  DateValidator.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "DateValidator.h"

@implementation DateValidator

+(NSDate*)TimestapToDate:(NSString*)timeStamp{

    double time=[DateValidator timeMake:timeStamp];
    double timestampval =  time;
    NSTimeInterval timestamp = (NSTimeInterval)timestampval;
    NSDate *updatetimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSLog(@"time insed this method %@",updatetimestamp);
    return updatetimestamp;
}



+(NSString *)timeStamp:(NSDate *)dateMake{
    return [NSString stringWithFormat:@"%.0f",[dateMake timeIntervalSince1970]];
}

+(double)timeMake:(NSString *)dateMake{
    
    NSArray *components = [dateMake componentsSeparatedByString:@":"];
NSDateComponents *comps = [[NSDateComponents alloc] init];
comps.hour = [[components objectAtIndex:0] integerValue];
comps.minute = [[components objectAtIndex:1] integerValue];
comps.second = 0;
    double number = comps.hour * 60 * 60 + comps.minute * 60 + comps.second;
    return number;
}

+(NSString*)RetunTimeAsString:(NSDate*)time{

    NSDate *periodDate = time;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm"];
    return [dateFormatter stringFromDate:periodDate];

}

@end
