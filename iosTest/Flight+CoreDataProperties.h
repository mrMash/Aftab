//
//  Flight+CoreDataProperties.h
//  
//
//  Created by Aftab on 15/10/2016.
//
//

#import "Flight+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Flight (CoreDataProperties)

+ (NSFetchRequest<Flight *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *arivalTime;
@property (nullable, nonatomic, copy) NSDate *departTime;
@property (nonatomic) int16_t id;
@property (nullable, nonatomic, copy) NSString *logo;
@property (nonatomic) double priceEuro;
@property (nonatomic) int16_t stops;

@end

NS_ASSUME_NONNULL_END
