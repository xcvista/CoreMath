//
//  NSObject+CMOverloading.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import "NSObject+CMOverloading.h"
#import <MSBooster/MSBooster.h>
#import <objc/message.h>

@implementation NSObject (CMOverloading)

- (id)callOverloadedMethod:(Class)method withObject:(id)other
{
    Class thisClass = [self class];
    Class nextClass = [other class];
    Class methodClass = object_getClass(method);
    
    // Find the appropriate overload:
    Class thisClass2 = Nil;
    do
    {
        thisClass2 = thisClass;
        
        Class otherClass = nextClass;
        Class otherClass2 = Nil;
        do
        {
            otherClass2 = otherClass;
            SEL selector = NSSelectorFromString(MSSTR(@"%@:%@:", NSStringFromClass(thisClass), NSStringFromClass(otherClass)));
            if (class_respondsToSelector(methodClass, selector))
                return objc_msgSend(method, selector, self, other);
            else
                otherClass = class_getSuperclass(otherClass);
        } while (otherClass != otherClass2 && otherClass && otherClass2);
        thisClass = class_getSuperclass(thisClass);
    } while (thisClass != thisClass2 && thisClass && thisClass2);
    
    [NSException raise:NSInvalidArgumentException format:@"Cannot resolve overloaded method in class %@ for objects typed %@ and %@.", NSStringFromClass(method), NSStringFromClass([self class]), NSStringFromClass([other class])];
    return nil;
}

@end
