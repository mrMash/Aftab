//
//  Train+CoreDataProperties.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
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


@end
