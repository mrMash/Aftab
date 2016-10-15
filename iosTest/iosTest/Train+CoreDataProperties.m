//
//  Train+CoreDataProperties.m
//  
//
//  Created by Aftab on 15/10/2016.
//
//

#import "Train+CoreDataProperties.h"

@implementation Train (CoreDataProperties)

+ (NSFetchRequest<Train *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Train"];
}

@dynamic arivalTime;
@dynamic departTime;
@dynamic id;
@dynamic logo;
@dynamic priceEuro;
@dynamic stops;
@dynamic timeArived;

@end
