//
//  Utilities.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "Utilities.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <QuartzCore/QuartzCore.h>



//========================  NSDictionary Category ====================
@implementation NSDictionary (DictExpanded)



- (id)nonNullObjectForKey:(id)aKey
{
    id obj = [self objectForKey:aKey];
    if (obj == [NSNull null]  || obj == nil)
        return @"";
    return obj;
}

@end

//========================  NSMutableDictionary Category ====================
@implementation NSMutableDictionary (Expanded)

- (id)nonNullObjectForKey:(id)aKey
{
    id obj = [self objectForKey:aKey];
    if (obj == [NSNull null]  || obj == nil)
        return @"";
    return obj;
}
@end

@implementation Utilities
+ (id)sharedInstance
{
    static dispatch_once_t once=0;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}









+(void)setScrollFrame:(UIViewController*)viewController
{
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        viewController.automaticallyAdjustsScrollViewInsets = NO;
        
    }
}
#pragma mark Animate TextField
+(void)animateUpTextField:(UITextField *)textField inView:(UIView *)view
{
    [UIView animateWithDuration:0.2 animations:^{
        if ((textField.frame.origin.y+textField.frame.size.height)>(view.frame.size.height-216)) {
            if([view isKindOfClass:[UIScrollView class]])
            {
                CGPoint point=view.center;
                point.x=0;
                point.y-=100;
                [(UIScrollView *)view setContentOffset:point];
            }
            else
            {
                [view setTransform:CGAffineTransformMakeTranslation(0, -130)];
            }
        }
        
    } completion:nil];

}
+(void)animateDownTextField:(UITextField *)textField inView:(UIView *)view
{
    [UIView animateWithDuration:0.2 animations:^{
        [view setTransform:CGAffineTransformMakeTranslation(0, 0)];
    } completion:nil];
    
}
+(void)animateTextField:(UITextField*)textField up:(BOOL)up inView:(UIView *)view
{
    if(!up&&view.frame.origin.y==0)
        return;
    int movementDistance = -130; // tweak as needed
    if(textField.tag==356)
        movementDistance=-250;
    const float movementDuration = 0.3f; // tweak as needed
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}
+(void)animateTextView:(UITextView*)textView up:(BOOL)up inView:(UIView *)view
{
    if(!up&&view.frame.origin.y==0)
        return;
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}

+(void)animateViewFieldToRect:(UIView *)rectView inView:(UIView *)view up:(BOOL)up
{
    if(!up&&view.frame.origin.y==0)
        return;
    
    CGRect rect=[rectView convertRect:rectView.bounds toView:view];
    const int movementDistance = -200; // tweak as needed
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat distance=-200;
        int movement = (up ? distance : -distance);
        if(up)
        {
            if(rect.origin.y>(view.frame.size.height-216)) // under keyboard
            {
                distance=rect.origin.y-(view.frame.size.height-216); //distance to move
                view.frame = CGRectOffset(view.frame, 0, -distance);
                
            }
            else
            {
                //view.frame=view.window.frame;
                view.frame = CGRectOffset(view.frame, 0, movement);
            }
            
            
        }
        
        else
        {
            //view.frame=view.window.frame;
            view.frame = CGRectOffset(view.frame, 0, movement);
        }
        
    } completion:nil];
}






#pragma mark truncateEntity with Block

////----- show a alert massage
+ (void) showAlertView :(NSString*)title message:(NSString*)msg delegate:(id)delegate
      cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate
                                          cancelButtonTitle:CbtnTitle otherButtonTitles:otherBtnTitles, nil];
    [alert show];
    
}


+ (void) showAlertViewWithTag:(NSInteger)tag title:(NSString*)title message:(NSString*)msg delegate:(id)delegate
            cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate
                                          cancelButtonTitle:CbtnTitle otherButtonTitles:otherBtnTitles, nil];
    alert.tag = tag;
    [alert show];
    
}

#pragma mark -
+ (void) showOKAlertWithTitle:(NSString*)aTitle message:(NSString*)aMsg
{
    UIAlertView	*aAlert = [[UIAlertView alloc] initWithTitle:aTitle message:aMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [aAlert show];
}


//createBackGroundQueue
+(void)createBackGroundQueue:(void(^)(void))block
{
    dispatch_queue_t backGroundQueue=dispatch_queue_create("backGroundQueue", NULL);
    dispatch_async(backGroundQueue, ^{
        block();
    });
}

+(void)createMainQueue:(void(^)(void))block
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        block();
    });
}




#pragma mark - Animation Block

+ (void) animationMoveInFromRightToLeft:(UIView*)myView
{
    CATransition *transition2 = [CATransition animation];
    transition2.duration = 1.0;
    transition2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition2.type    = kCATransitionPush;
    transition2.subtype = kCATransitionFromRight;
    //BOOL transitioning = NO;
    [myView.layer addAnimation:transition2 forKey:nil];
}

+ (void) animationMoveInFromLeftToRight:(UIView*)myView
{
    CATransition *transition2 = [CATransition animation];
    transition2.duration = 1.0;
    transition2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition2.type    = kCATransitionPush;
    transition2.subtype = kCATransitionFromLeft;
    //BOOL transitioning = NO;
    [myView.layer addAnimation:transition2 forKey:nil];
}

#pragma mark - Activity Indicator
+ (void) startActivityIndicatorInView:(UIView*)aView withMessage:(NSString*)aMessage
{
    MBProgressHUD *_hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    _hud.dimBackground = YES;
    _hud.labelText = aMessage;
}

+(void) stopActivityIndicatorInView:(UIView*)aView
{
    [MBProgressHUD hideHUDForView:aView animated:YES];
}










@end
