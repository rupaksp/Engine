//
//  DictionaryContainer.m
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DictionaryContainer.h"

@implementation DictionaryContainer

@synthesize key, dictionary;


-(void) dealloc
{
      [key release];
      [dictionary release];
      [super dealloc];
}
- (id)init
{
      self = [super init];      
      if (self)
      {
            dictionary = [[NSMutableDictionary alloc]init];
      }
      return self;
}

@end
