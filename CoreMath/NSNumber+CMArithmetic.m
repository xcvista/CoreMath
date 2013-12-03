//
//  NSNumber+CMArithmatic.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import "NSObject+CMArithmetic.h"
#import "NSObject+CMOverloading.h"

@implementation NSNumber (CMArithmetic)

- (instancetype)negate
{
    return @(-[self doubleValue]);
}

- (instancetype)reverse
{
    return @(1/[self doubleValue]);
}

- (instancetype)magnitude
{
    return @(fabs([self doubleValue]));
}

@end

@implementation CMAdd (NSNumber)

CMOverloadingMethod(NSNumber, NSNumber, NSNumber)
{
    return @([left doubleValue] + [right doubleValue]);
}

@end

@implementation CMSubtract (NSNumber)

CMOverloadingMethod(NSNumber, NSNumber, NSNumber)
{
    return @([left doubleValue] - [right doubleValue]);
}

@end

@implementation CMMultiply (NSNumber)

CMOverloadingMethod(NSNumber, NSNumber, NSNumber)
{
    return @([left doubleValue] * [right doubleValue]);
}

@end

@implementation CMDivide (NSNumber)

CMOverloadingMethod(NSNumber, NSNumber, NSNumber)
{
    if (fabs([right doubleValue]) < DBL_EPSILON)
        return nil;
    else
        return @([left doubleValue] / [right doubleValue]);
}

@end

@implementation CMRaiseTo (NSNumber)

CMOverloadingMethod(NSNumber, NSNumber, NSNumber)
{
    return @(pow([left doubleValue], [right doubleValue]));
}

@end