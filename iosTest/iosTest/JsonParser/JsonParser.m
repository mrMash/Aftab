//
//  JsonParser.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "JsonParser.h"
#import "Train+CoreDataClass.h"
#import "Busses+CoreDataClass.h"
#import "Flight+CoreDataClass.h"


@implementation JsonParser





+(void)ParseWebJsonData:(NSArray*)JsonArray Entity:(NSString*)entityName{

    NSLog(@"%lu",(unsigned long)[JsonArray count]);
    if ([entityName isEqualToString:EntityTrain]) {
     
    
        for (int i=0; i<[JsonArray count]; i++) {
        
            NSMutableDictionary*temdic=[[NSMutableDictionary alloc] init];
            [temdic  setObject:[JsonArray objectAtIndex:i] forKey:@"dataObjTrain"];
            [JsonParser setDataTrain:temdic];
            temdic=nil;
        }
        
    }
    else if ([entityName isEqualToString:EntityBuss]) {
        
        
        for (int i=0; i<[JsonArray count]; i++) {
            
            NSMutableDictionary*temdic=[[NSMutableDictionary alloc] init];
            [temdic  setObject:[JsonArray objectAtIndex:i] forKey:@"dataObjBuss"];
            [JsonParser setDataBuss:temdic];
            temdic=nil;
        }
        
    }
    else if ([entityName isEqualToString:EntityFlight]) {
        
        
        for (int i=0; i<[JsonArray count]; i++) {
            
            NSMutableDictionary*temdic=[[NSMutableDictionary alloc] init];
            [temdic  setObject:[JsonArray objectAtIndex:i] forKey:@"dataObjFlight"];
            [JsonParser setDataFlight:temdic];
            temdic=nil;
        }
        
    }



}

+(void)setDataTrain:(NSMutableDictionary*)data{

    NSError *error;
    
    Train* transportInstans = (Train*)[FetchingData EntityReturn:EntityTrain];
    NSString *imgurl=NULLVALUEOut([[[data objectForKey:@"dataObjTrain"] objectForKey:@"provider_logo"] stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]);
    
    transportInstans.logo=imgurl;
    
    transportInstans.arivalTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjTrain"]  objectForKey:@"arrival_time"]];
    
    transportInstans.departTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjTrain"]  objectForKey:@"departure_time"]];
    transportInstans.priceEuro=[[[data objectForKey:@"dataObjTrain"]  objectForKey:@"price_in_euros"] floatValue];
    transportInstans.stops=[[[data objectForKey:@"dataObjTrain"]  objectForKey:@"number_of_stops"] integerValue];
    transportInstans.id=[[[data objectForKey:@"dataObjTrain"]  objectForKey:@"id"] integerValue];
    
    
    imgurl=nil;
    transportInstans=nil;
    data=nil;
    
    if (![[FetchingData Contextreturn] save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

}
+(void)setDataBuss:(NSMutableDictionary*)data{
    
    NSError *error;
    
    Busses* transportInstans = (Busses*)[FetchingData EntityReturn:EntityBuss];
    NSString *imgurl=NULLVALUEOut([[[data objectForKey:@"dataObjBuss"] objectForKey:@"provider_logo"] stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]);
    
    transportInstans.logo=imgurl;
    
    transportInstans.arivalTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjBuss"]  objectForKey:@"arrival_time"]];
    
    transportInstans.departTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjBuss"]  objectForKey:@"departure_time"]];
    transportInstans.priceEuro=[[[data objectForKey:@"dataObjBuss"]  objectForKey:@"price_in_euros"] floatValue];
    transportInstans.stops=[[[data objectForKey:@"dataObjBuss"]  objectForKey:@"number_of_stops"] integerValue];
    transportInstans.id=[[[data objectForKey:@"dataObjBuss"]  objectForKey:@"id"] integerValue];
    
    
    imgurl=nil;
    transportInstans=nil;
    data=nil;
    
    if (![[FetchingData Contextreturn] save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}
+(void)setDataFlight:(NSMutableDictionary*)data{
    
    NSError *error;
    
    Flight* transportInstans = (Flight*)[FetchingData EntityReturn:EntityFlight];
    NSString *imgurl=NULLVALUEOut([[[data objectForKey:@"dataObjFlight"] objectForKey:@"provider_logo"] stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]);
    
    transportInstans.logo=imgurl;
    
    transportInstans.arivalTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjFlight"]  objectForKey:@"arrival_time"]];
    
    transportInstans.departTime=[DateValidator TimestapToDate:[[data objectForKey:@"dataObjFlight"]  objectForKey:@"departure_time"]];
    transportInstans.priceEuro=[[[data objectForKey:@"dataObjFlight"]  objectForKey:@"price_in_euros"] floatValue];
    transportInstans.stops=[[[data objectForKey:@"dataObjFlight"]  objectForKey:@"number_of_stops"] integerValue];
    transportInstans.id=[[[data objectForKey:@"dataObjFlight"]  objectForKey:@"id"] integerValue];
    
    
    imgurl=nil;
    transportInstans=nil;
    data=nil;
    
    if (![[FetchingData Contextreturn] save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

@end
