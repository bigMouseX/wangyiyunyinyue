//
//  WangYiYunAppUITestsLaunchTests.m
//  WangYiYunAppUITests
//
//  Created by 夏楠 on 2023/6/6.
//

#import <XCTest/XCTest.h>

@interface WangYiYunAppUITestsLaunchTests : XCTestCase

@end

@implementation WangYiYunAppUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
