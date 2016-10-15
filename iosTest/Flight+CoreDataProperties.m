//
//  Flight+CoreDataProperties.m
//  
//
//  Created by Aftab on 15/10/2016.
//
//

#import "Flight+CoreDataProperties.h"

@implementation Flight (CoreDataProperties)

+ (NSFetchRequest<Flight *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Flight"];
}

@dynamic arivalTime;
@dynamic departTime;
@dynamic id;
@dynamic logo;
@dynamic priceEuro;
@dynamic stops;


@end
