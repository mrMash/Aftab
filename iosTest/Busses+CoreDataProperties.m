//
//  Busses+CoreDataProperties.m
//  
//
//  Created by Aftab on 15/10/2016.
//
//

#import "Busses+CoreDataProperties.h"

@implementation Busses (CoreDataProperties)

+ (NSFetchRequest<Busses *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Busses"];
}

@dynamic arivalTime;
@dynamic departTime;
@dynamic id;
@dynamic logo;
@dynamic priceEuro;
@dynamic stops;

@end
