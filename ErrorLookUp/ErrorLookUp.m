//
//  ErrorLookUp.m
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ErrorLookUp.h"
#import "SmallLoginView.h"
#import "vTerviewAppDelegate.h"

@implementation ErrorLookUp

+(BOOL)isError:(NSDictionary*)dict{

    if ([[dict objectForKey:@"err"] isEqualToString:@"1"]) {
      
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Error" message:[dict objectForKey:@"error"] delegate:[ErrorLookUp class]cancelButtonTitle:@"Ok" otherButtonTitles:@"",nil];
            
            [alertView show];
            [alertView release];
            return TRUE;
        
       
    }
    else
    {
        return FALSE;
    }
    
    return TRUE;
}
// Called when a button is clicked. The view will be automatically dismissed after this call returns
+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        vTerviewAppDelegate *delegate = (vTerviewAppDelegate *)[[UIApplication sharedApplication] delegate];
        [delegate sendEmail];
        
    }
}
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    for (UIView *view in [alertView subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view setHidden:TRUE];
        }
    }
}

@end
