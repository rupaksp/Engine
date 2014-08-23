//
//  ErrorLookUp.h
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "vTerviewAppDelegate.h"


@interface ErrorLookUp : NSObject<UIAlertViewDelegate> {
    
}
+(BOOL)isError:(NSDictionary*)dict;
@end
