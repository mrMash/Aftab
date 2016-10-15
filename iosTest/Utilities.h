//
//  Utilities.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>


@interface NSDictionary (DictExpanded)
- (id)nonNullObjectForKey:(id)aKey;
@end

//========================  NSMutableDictionary Category ====================
@interface NSMutableDictionary (Expanded)
- (id)nonNullObjectForKey:(id)aKey;
@end




@interface Utilities : NSObject<UINavigationControllerDelegate,UIActionSheetDelegate>
{

}



+(void)createMainQueue:(void(^)(void))block;
+ (id)sharedInstance;

+ (void) showOKAlertWithTitle:(NSString*)aTitle message:(NSString*)aMsg;
////----- show a alert massage
+ (void) showAlertView :(NSString*)title message:(NSString*)msg delegate:(id)delegate
      cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles;


+(void)createBackGroundQueue:(void(^)(void))block;

+ (void) startActivityIndicatorInView:(UIView*)aView withMessage:(NSString*)aMessage;
+ (void) stopActivityIndicatorInView:(UIView*)aView;

+ (void) animationMoveInFromRightToLeft:(UIView*)myView;
+ (void) animationMoveInFromLeftToRight:(UIView*)myView;

+(void)animateViewFieldToRect:(UIView *)rectView inView:(UIView *)view up:(BOOL)up;
+(void)animateTextView:(UITextView*)textView up:(BOOL)up inView:(UIView *)view;
+(void)animateTextField:(UITextField*)textField up:(BOOL)up inView:(UIView *)view;
+(void)animateDownTextField:(UITextField *)textField inView:(UIView *)view;
+(void)animateUpTextField:(UITextField *)textField inView:(UIView *)view;
+(void)setScrollFrame:(UIViewController*)viewController;
+ (void) showAlertViewWithTag:(NSInteger)tag title:(NSString*)title message:(NSString*)msg delegate:(id)delegate
            cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles;

+(void)truncateEntityAllDb;
@end
