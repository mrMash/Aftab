//
//  Connection.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "Connection.h"
#import "SBJSON.h"
@implementation Connection



+(NSString*)Timedate:(NSDate*)dates{
    
    //------- todays date for comparision
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *datetodayFormate = [[NSDateFormatter alloc]init];
    datetodayFormate.dateFormat = @"MM/dd/yy";
    
    NSString *todaydateString = [datetodayFormate stringFromDate: todayDate];
    
    
    
    NSDate *localDate =dates;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    
    NSString *dateString = [dateFormatter stringFromDate: localDate];
    
    
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    timeFormatter.dateFormat = @"hh:mm a";
    
    
    NSString *timeString = [timeFormatter stringFromDate: localDate];
    
    NSString * returnTime;
    
    if([dateString isEqualToString:todaydateString]){
        
        returnTime=[NSString stringWithFormat:@"Most recent %@",timeString];
        
    }else{
        
        returnTime=[NSString stringWithFormat:@"Last message on ...%@",dateString];
        
    }
    
    return returnTime;
}

+(NSInteger)TimeStamped:(NSDate*)date{
    
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSInteger time = round(interval);
    interval=NSNotFound;
    return time;
}

+(Connection*)sharedInstance
{
    static Connection* sharedObj = nil;
    if (sharedObj == nil) {
        sharedObj = [[Connection alloc] init];
    }
    return sharedObj;
}

#pragma check internet connection
+(BOOL)isInternetAvailable
{
    BOOL isInternetAvailable = false;
    Reachability *internetReach = [Reachability reachabilityForInternetConnection];
    [internetReach startNotifier];
    NetworkStatus netStatus = [internetReach currentReachabilityStatus];
    switch (netStatus)
    {
        case NotReachable:
            
            isInternetAvailable = FALSE;
            break;
        case ReachableViaWWAN:
            isInternetAvailable = TRUE;
            break;
        case ReachableViaWiFi:
            isInternetAvailable = TRUE;
            break;
    }
    [internetReach stopNotifier];
    return isInternetAvailable;
}

#pragma mark - call a service


@synthesize HandleJson;

+(BOOL)CallServiceGet:(NSString*)serviceName postData:(NSString*)params qString:(NSString*)QueryStr callBackBlock:(void (^)(id response))responeBlock{
    
    
    NSString *jsonString =params;
    NSString *post = [NSString stringWithFormat:@"json=%@", jsonString];
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO];
    
    
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{
                                                   @"api-key"       : @"API_KEY"
                                                   };
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseUrl,serviceName]];
    
    NSLog(@"url %@",[url absoluteString]);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //request.HTTPBody = [noteDataString dataUsingEncoding:NSUTF8StringEncoding];
     request.HTTPMethod = @"GET";
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:&error];
        
        
        responeBlock(jsonObject);
    }];
    [postDataTask resume];
    
    return TRUE;
    
    
}
#pragma Post Method Calling service



#pragma mark Get Json String for Dictionary
+(NSString *)getJsonStringForDictionary:(NSDictionary *)dictionary
{
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString *jsonStr=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}


#pragma mark Get Json String for Dictionary
+(NSString *)getJsonStringForDictionaryArray:(NSMutableArray *)dictionary
{
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];

    NSString *jsonStr=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}








@end
