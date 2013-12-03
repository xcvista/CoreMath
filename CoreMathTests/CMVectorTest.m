//
//  CMVectorTest.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <CoreMath/CoreMath.h>

@interface CMVectorTest : SenTestCase

@end

@implementation CMVectorTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class. 
    [super tearDown];
}

- (void)testVectorNegate
{
    CMVector *v1 = [CMVector vectorWithElements:@1, @2, @3, nil];
    CMVector *v2 = [CMVector vectorWithElements:@-1, @-2, @-3, nil];
    
    STAssertEqualObjects([v1 negate], v2, nil);
}

- (void)testVectorMagnitude
{
    CMVector *v = [CMVector vectorWithElements:@3, @4, nil];
    
    STAssertEqualObjects([v magnitude], @5, nil);
}

- (void)testVectorAdd
{
    CMVector *v1 = [CMVector vectorWithElements:@1, @2, @3, nil];
    CMVector *v2 = [CMVector vectorWithElements:@3, @4, @5, nil];
    CMVector *v3 = [CMVector vectorWithElements:@4, @6, @8, nil];
    
    STAssertEqualObjects([v1 add:v2], v3, nil);
}

- (void)testVectorSubtract
{
    CMVector *v1 = [CMVector vectorWithElements:@1, @2, @3, nil];
    CMVector *v2 = [CMVector vectorWithElements:@3, @4, @5, nil];
    CMVector *v3 = [CMVector vectorWithElements:@4, @6, @8, nil];
    
    STAssertEqualObjects([v3 subtract:v1], v2, nil);
}

- (void)testScalarMultiplicating
{
    CMVector *v1 = [CMVector vectorWithElements:@1, @2, @3, nil];
    CMVector *v2 = [CMVector vectorWithElements:@2, @4, @6, nil];
    
    STAssertEqualObjects([@2 multiply:v1], v2, nil);
    STAssertEqualObjects([v1 multiply:@2], v2, nil);
}

- (void)testVectorMultiplicating
{
    CMVector *i = [CMVector vectorWithElements:@1, @0, @0, nil];
    CMVector *j = [CMVector vectorWithElements:@0, @1, @0, nil];
    CMVector *k = [CMVector vectorWithElements:@0, @0, @1, nil];
    CMVector *z = [CMVector zeroVectorWithRank:3];
    
    STAssertEqualObjects([i multiply:j], k, nil);
    STAssertEqualObjects([j multiply:k], i, nil);
    STAssertEqualObjects([k multiply:i], j, nil);
    STAssertEqualObjects([i multiply:i], z, nil);
    STAssertEqualObjects([j multiply:j], z, nil);
    STAssertEqualObjects([k multiply:k], z, nil);
}

- (void)testInnerProduct
{
    CMVector *v1 = [CMVector vectorWithElements:@1, @2, @3, nil];
    CMVector *v2 = [CMVector vectorWithElements:@3, @4, @5, nil];
    
    STAssertEqualObjects([v1 innerProduct:v2], @26, nil);
}

- (void)testDegradation
{
    CMVector *v = [CMVector vectorWithElements:@1, nil];
    
    STAssertEqualObjects(v, @1, nil);
    STAssertFalse([v isKindOfClass:[CMVector class]], nil);
}

@end
