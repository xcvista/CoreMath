//
//  CMVector.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import "CMVector.h"
#import "NSObject+CMArithmetic.h"
#import "NSObject+CMOverloading.h"

@implementation CMVector
{
    NSArray *_elements;
}

+ (instancetype)vectorWithElements:(id)element, ...
{
    if (!element)
        return nil;
    
    NSMutableArray *elements = [NSMutableArray arrayWithObject:element];
    va_list args;
    va_start(args, element);
    id next;
    while ((next = va_arg(args, id)))
        [elements addObject:next];
    va_end(args);
    
    return [self vectorWithArrayOfElements:elements];
}

+ (instancetype)vectorWithArrayOfElements:(NSArray *)elements
{
    return [[self alloc] initWithArrayOfElements:elements];
}

- (id)initWithElements:(id)element, ...
{
    if (!element)
        return self = nil;
    
    NSMutableArray *elements = [NSMutableArray arrayWithObject:element];
    va_list args;
    va_start(args, element);
    id next;
    while ((next = va_arg(args, id)))
        [elements addObject:next];
    va_end(args);
    
    return [self initWithArrayOfElements:elements];
}

+ (instancetype)zeroVectorWithRank:(NSUInteger)rank
{
    NSMutableArray *elements = [NSMutableArray arrayWithCapacity:rank];
    for (NSUInteger idx = 0; idx < rank; idx++)
        [elements addObject:@0];
    return [self vectorWithArrayOfElements:elements];
}

- (id)initWithArrayOfElements:(NSArray *)elements
{
    if ([elements count] == 0)
        return self = nil;
    else if ([elements count] == 1)
    {
        self = nil;
        return elements[0];
    }
    else if (self = [super init])
    {
        _elements = elements;
    }
    return self;
}

- (NSArray *)elements
{
    return _elements;
}

- (id)innerProduct:(id)right
{
    CMOverloadedMethod(CMInnerProduct, right);
}

- (NSUInteger)hash
{
    return [_elements hash];
}

- (BOOL)isEqualToVector:(CMVector *)vector
{
    return [_elements isEqualToArray:vector->_elements];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[CMVector class]])
        return [self isEqualToVector:object];
    else
        return NO;
}

@end

@implementation CMVector (CMArithmetic)

- (instancetype)negate
{
    NSMutableArray *elements = [NSMutableArray arrayWithArray:_elements];
    for (NSUInteger idx = 0; idx < [elements count]; idx++)
    {
        elements[idx] = [elements[idx] negate];
    }
    return [CMVector vectorWithArrayOfElements:elements];
}

- (instancetype)magnitude
{
    if (![_elements count])
        return nil;
    
    id result = [_elements[0] raiseTo:@2];
    for (NSUInteger idx = 1; idx < [_elements count]; idx++)
        result = [result add:[_elements[idx] raiseTo:@2]];
    
    return [result raiseTo:@0.5];
}

@end

@implementation CMInnerProduct

CMOverloadingMethod(NSNumber, CMVector, CMVector)
{
    if (![[left elements] count] ||
        ![[right elements] count] ||
        [[left elements] count] != [[right elements] count])
        return nil;
    
    id result = [[left elements][0] multiply:[right elements][0]];
    for (NSUInteger idx = 1; idx < [[left elements] count]; idx++)
    {
        id object = [[left elements][idx] multiply:[right elements][idx]];
        result = [result add:object];
    }
    return result;
}

@end

@implementation CMAdd (CMVector)

CMOverloadingMethod(CMVector, CMVector, CMVector)
{
    if (![[left elements] count] ||
        ![[right elements] count] ||
        [[left elements] count] != [[right elements] count])
        return nil;
    
    NSMutableArray *elements = [NSMutableArray arrayWithArray:[left elements]];
    for (NSUInteger idx = 0; idx < [elements count]; idx++)
        elements[idx] = [elements[idx] add:[right elements][idx]];
    
    return [CMVector vectorWithArrayOfElements:elements];
}

@end

@implementation CMSubtract (CMVector)

CMOverloadingMethod(CMVector, CMVector, CMVector)
{
    if (![[left elements] count] ||
        ![[right elements] count] ||
        [[left elements] count] != [[right elements] count])
        return nil;
    
    NSMutableArray *elements = [NSMutableArray arrayWithArray:[left elements]];
    for (NSUInteger idx = 0; idx < [elements count]; idx++)
        elements[idx] = [elements[idx] subtract:[right elements][idx]];
    
    return [CMVector vectorWithArrayOfElements:elements];
}

@end

@implementation CMMultiply (CMVector)

CMOverloadingMethod(CMVector, CMVector, NSNumber)
{
    if (![[left elements] count])
        return nil;
    
    NSMutableArray *elements = [NSMutableArray arrayWithArray:[left elements]];
    for (NSUInteger idx = 0; idx < [elements count]; idx++)
        elements[idx] = [elements[idx] multiply:right];
    
    return [CMVector vectorWithArrayOfElements:elements];
}

CMOverloadingMethod(CMVector, NSNumber, CMVector)
{
    return [self CMVector:right NSNumber:left];
}

CMOverloadingMethod(CMVector, CMVector, CMVector)
{
    if ([[left elements] count] != 3||
        [[right elements] count] != 3)
        return nil;
    
    NSArray *l = [left elements];
    NSArray *r = [right elements];
    
    return [CMVector vectorWithElements:
            [[l[1] multiply:r[2]] subtract:[l[2] multiply:r[1]]],
            [[l[2] multiply:r[0]] subtract:[l[0] multiply:r[2]]],
            [[l[0] multiply:r[1]] subtract:[l[1] multiply:r[0]]], nil];
}

@end
