//
//  ArrayContainer.m
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ArrayContainer.h"

@implementation ArrayContainer

@synthesize key, array;

-(void) dealloc
{
      [key release];
      [array release];
      [super dealloc];
}

- (id)init
{
      self = [super init];
      if (self)
      {
            array = [[NSMutableArray alloc]init];
      }
      return self;
}

@end
