//
//  NSObject+CMArithmetic.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import "NSObject+CMArithmetic.h"
#import "NSObject+CMOverloading.h"

@implementation CMAdd

@end

@implementation CMSubtract

@end

@implementation CMMultiply

@end

@implementation CMDivide

@end

@implementation CMRaiseTo

@end

@implementation NSObject (CMOverloadedArithmatic)

- (id)add:(id)right
{
    CMOverloadedMethod(CMAdd, right);
}

- (id)subtract:(id)right
{
    CMOverloadedMethod(CMSubtract, right);
}

- (id)multiply:(id)right
{
    CMOverloadedMethod(CMMultiply, right);
}

- (id)divide:(id)right
{
    CMOverloadedMethod(CMDivide, right);
}

- (id)raiseTo:(id)power
{
    CMOverloadedMethod(CMRaiseTo, power);
}

@end
