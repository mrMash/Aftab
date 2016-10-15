//
//  FetchingData.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FetchingData : NSObject
+(NSArray*)fetchData:(NSString*)entityName sql:(NSString*)sqlPredicate;
+(NSArray*)fetchDataWithPredicate:(NSString*)entityName sql:(NSString*)sqlPredicate;
+(NSString*)PredicateStringsDyanamic:(NSString*)keyword name:(NSString*)name;
+(NSManagedObject*)EntityReturn:(NSString*)entityName;
+(NSManagedObjectContext*)Contextreturn;
+ (void)deleteAllEntities:(NSString *)nameEntity context:(NSManagedObjectContext*)theContext;


@end
