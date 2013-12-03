//
//  CMVector.h
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVector : NSObject

+ (instancetype)vectorWithElements:(id)element, ... NS_REQUIRES_NIL_TERMINATION;
+ (instancetype)vectorWithArrayOfElements:(NSArray *)elements;
+ (instancetype)zeroVectorWithRank:(NSUInteger)rank;

- (id)initWithElements:(id)element, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithArrayOfElements:(NSArray *)elements;

- (NSArray *)elements;

- (id)innerProduct:(id)right;

@end

@interface CMInnerProduct : NSProxy

@end
