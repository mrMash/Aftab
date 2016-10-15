//
//  Connection.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//
//

#import <Foundation/Foundation.h>
@class SBJSON;
@interface Connection : NSObject<NSURLConnectionDelegate>{

    //Callback blocks
    void (^successCallback)(id response);
    void (^failCallback)(NSError *error);
     SBJSON* HandleJson;

}
+(NSString*)Timedate:(NSDate*)dates;
+(Connection*)sharedInstance;
+(BOOL)isInternetAvailable;
+(NSInteger)TimeStamped:(NSDate*)date;

+(BOOL)CallServiceGet:(NSString*)serviceName postData:(NSString*)params qString:(NSString*)QueryStr callBackBlock:(void (^)(id response))responeBlock;

@property(nonatomic,retain) SBJSON* HandleJson;
+(NSString *)getJsonStringForDictionary:(NSDictionary *)dictionary;
+(NSString *)getJsonStringForDictionaryArray:(NSMutableArray *)dictionary;

@end


