//
//  NSObject+CMArithmetic.h
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CMArithmetic)

- (instancetype)negate;
- (instancetype)reverse;
- (instancetype)magnitude;

@end

@interface CMAdd : NSProxy

@end

@interface CMSubtract : NSProxy

@end

@interface CMMultiply : NSProxy

@end

@interface CMDivide : NSProxy

@end

@interface CMRaiseTo : NSProxy

@end

@interface NSObject (CMOverloadedArithmatic)

- (id)add:(id)right;
- (id)subtract:(id)right;
- (id)multiply:(id)right;
- (id)divide:(id)right;

- (id)raiseTo:(id)power;

@end
