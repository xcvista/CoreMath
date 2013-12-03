//
//  CMNumberArithmeticTest.m
//  CoreMath
//
//  Created by Maxthon Chan on 12/3/13.
//  Copyright (c) 2013 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <CoreMath/CoreMath.h>

@interface CMNumberArithmeticTest : SenTestCase

@end

@implementation CMNumberArithmeticTest

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

- (void)testAdding
{
    double value1 = 25;
    double value2 = 40;
    
    double result = value1 + value2;
    NSNumber *testResult = [@(value1) add:@(value2)];
    
    STAssertEqualObjects(testResult, @(result), nil);
}

- (void)testSubtracting
{
    double value1 = 25;
    double value2 = 40;
    
    double result = value1 - value2;
    NSNumber *testResult = [@(value1) subtract:@(value2)];
    
    STAssertEqualObjects(testResult, @(result), nil);
}

- (void)testMultiplying
{
    double value1 = 25;
    double value2 = 40;
    
    double result = value1 * value2;
    NSNumber *testResult = [@(value1) multiply:@(value2)];
    
    STAssertEqualObjects(testResult, @(result), nil);
}

- (void)testDividing
{
    double value1 = 25;
    double value2 = 40;
    
    double result = value1 / value2;
    NSNumber *testResult = [@(value1) divide:@(value2)];
    
    STAssertEqualObjects(testResult, @(result), nil);
}

- (void)testRaising
{
    double value1 = 25;
    double value2 = 40;
    
    double result = pow(value1, value2);
    NSNumber *testResult = [@(value1) raiseTo:@(value2)];
    
    STAssertEqualObjects(testResult, @(result), nil);
}

- (void)testDivideByZero
{
    double val = 25;
    double zero = 0;
    
    NSNumber *testResult = [@(val) divide:@(zero)];
    
    STAssertNil(testResult, nil);
}

@end
