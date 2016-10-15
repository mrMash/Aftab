//
//  cellTypeButton.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface cellTypeButton : UIButton
@property (nonatomic, retain) NSIndexPath *cellIndexPath;
@property (nonatomic, retain) NSDate *cellDate;
@property (nonatomic, retain) NSString *BtnId;
@property(nonatomic,retain) NSString*BtnName;

@end
