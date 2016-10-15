//
//  FetchingData.m
//  Food
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "FetchingData.h"
#import "AppDelegate.h"

@implementation FetchingData

//@synthesize fetchedResultsController;

+(NSArray*)fetchDataWithPredicate:(NSString*)entityName sql:(NSString*)sqlPredicate{
    
AppDelegate* appdelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
NSError *error;

NSManagedObjectContext *context = [appdelegate managedObjectContext];


NSFetchRequest *request = [[NSFetchRequest alloc] init];
NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];

NSPredicate *predicate = [NSPredicate predicateWithFormat:sqlPredicate];

[request setEntity:entity];
[request setPredicate:predicate];
    
    
    
    error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    error = nil;
    appdelegate=nil;
    //TimeStampInfo=nil;
    predicate=nil;
    request=nil;
    entity=nil;
    context=nil;
    
   
    return results;
    
}


+(NSArray*)fetchDataWithPredicateDATE:(NSString*)entityName sql:(NSPredicate*)predicate{
    
    AppDelegate* appdelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSError *error;
    
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    //NSManagedObject *TimeStampInfo = [NSEntityDescription
    //                                  insertNewObjectForEntityForName:entityName
    //                                 inManagedObjectContext:context];
    
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
   
    
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    
    
    error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    error = nil;
    appdelegate=nil;
    //TimeStampInfo=nil;
    predicate=nil;
    request=nil;
    entity=nil;
    context=nil;
    
    
    return results;
    
}
+(NSArray*)fetchData:(NSString*)entityName sql:(NSString*)sqlPredicate{
    
    AppDelegate* appdelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSError *error;
    
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
   // NSManagedObject *TimeStampInfo = [NSEntityDescription
   //                                   insertNewObjectForEntityForName:entityName
    //                                  inManagedObjectContext:context];
    
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [request setEntity:entity];
    
    
    
    error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    error = nil;
    appdelegate=nil;
   // TimeStampInfo=nil;
    request=nil;
    entity=nil;
    context=nil;
    
    
    return results;
    
}

+(NSManagedObject*)EntityReturn:(NSString*)entityName{

    
    AppDelegate* appdelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    NSManagedObject *obj=[NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    
    entityName=nil;
    appdelegate=nil;
    context=nil;
    return obj;
}

+(NSManagedObjectContext*)Contextreturn{
    
    
    AppDelegate* appdelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    appdelegate=nil;
    
    return context;
}


+ (void)deleteAllEntities:(NSString *)nameEntity context:(NSManagedObjectContext*)theContext
{
   
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:nameEntity];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *fetchedObjects = [theContext executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *object in fetchedObjects)
    {
        [theContext deleteObject:object];
    }
    
    error = nil;
    [theContext save:&error];
}


@end
