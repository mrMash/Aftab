//
//  Train+CoreDataProperties.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "Train+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Train (CoreDataProperties)

+ (NSFetchRequest<Train *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *arivalTime;
@property (nullable, nonatomic, copy) NSDate *departTime;
@property (nonatomic) int16_t id;
@property (nullable, nonatomic, copy) NSString *logo;
@property (nonatomic) double priceEuro;
@property (nonatomic) int16_t stops;

@end

NS_ASSUME_NONNULL_END
