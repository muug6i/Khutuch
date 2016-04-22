//
//  SEDefaults.h
//  SEDefaults
//
//  Created by Developer on 10/17/13.
//  Copyright (c) 2013 SE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEUtils.h"
#import "SECheckConnect.h"
#import "UIImage+SEUtils.h"
#import "NSString+SEUtils.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "NSDateFormatter+SEUtils.h"

#define CHECK_AUTHORIZE_URL                 @""

// Log levels: off, error, warn, info, verbose
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

//COLOR
#define RANDOM_COLOR                        [UIColor colorWithRed:(arc4random()%100) *.01 green:(arc4random()%100) *.01 blue:(arc4random()%100) *.01 alpha:1]
#define CLEAR_COLOR                         [UIColor clearColor]

//FONT
#define NORMALFONT                          @"Helvetica"
#define BOLDFONT                            @"Helvetica-Bold"

//APPLICATION DEFAULT
#define USERDEF                             [NSUserDefaults standardUserDefaults]
#define APPDEL                              ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//CONNECTION DEFAULT
#define NO_CONNECTION_ALERT                 @"Сервертэй холбогдоход алдаа гарлаа. Интернэт холболтоо шалгана уу."


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IOS_VERSION_LOWER_THAN_8 (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)

#define SCREEN_WIDTH (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



static NSString *const ErrorTag = @"ErrorTag";

#define SELogError(frmt, ...) LOG_OBJC_TAG_MACRO(NO, 0, 0, 0, ErrorTag, frmt, ##__VA_ARGS__)

@interface SEDefaults : NSObject

+ (SEDefaults *)sharedManager;

- (void)printTestLog;

@end
