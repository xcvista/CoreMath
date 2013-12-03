//
//  NSObject+CMOverloading.h
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CMOverloadingMethod(_return, _left, _right) \
+ (_return *)_left:(_left *)left _right:(_right *)right

#define CMOverloadedMethod(_type, _object) \
return [self callOverloadedMethod:[_type class] withObject:(_object)]

@interface NSObject (CMOverloading)

- (id)callOverloadedMethod:(Class)method withObject:(id)other;

@end
