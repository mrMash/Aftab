//
//  vehicalTableViewCell.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vehicalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *imagePriceView;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UILabel *ariveTime;
@property (weak, nonatomic) IBOutlet UILabel *departTime;
@property (weak, nonatomic) IBOutlet UILabel *destinationStop;

@end
