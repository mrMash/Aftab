//
//  JsonParser.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject
+(void)ParseWebJsonData:(NSArray*)JsonArray Entity:(NSString*)entityName;
+(void)setDataBuss:(NSMutableDictionary*)data;
+(void)setDataTrain:(NSMutableDictionary*)data;
+(void)setDataFlight:(NSMutableDictionary*)data;

@end
