//
//  ArrayContainer.h
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


// This class helps managing the stack of Generic Parser. One should never initialize this class as it is created and used for internal purpose only.
// When Parser identifies an array Tag, it creates this class. If the array needs to be put as a member of a dictionary (i.e. parent is a dictionary), the value of key
// will be assigned with current element name. If parent is non-dictionary class, the value of key will remain nil.

@interface ArrayContainer : NSObject
{      
      NSString *key;
      NSMutableArray *array;    
}

@property (retain, nonatomic) NSString *key;
@property (retain, nonatomic) NSMutableArray *array;

@end
