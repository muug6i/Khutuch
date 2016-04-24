//
//  Language.m
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 3/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "Language.h"

@interface Language()

@end

@implementation Language

+ (Language *)sharedInstance {
    static dispatch_once_t once;
    static Language *sharedObject;
    dispatch_once(&once, ^{
        sharedObject = [[Language alloc] init];
    });
    return sharedObject;
}

- (NSString *) localizedString:(NSString *)key
{
    if ([USERDEF valueForKey:kLanguageENG] == nil) {
        [USERDEF setBool:NO forKey:kLanguageENG];
    }
    
    NSString *currentLanguage = nil;
    if ([USERDEF boolForKey:kLanguageENG]) {
        currentLanguage = @"en";
    } else {
        currentLanguage = @"mn-MN";
    }
    
    NSString* path = [[NSBundle mainBundle] pathForResource:currentLanguage ofType:@"lproj"];
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
    NSString *resultString = [languageBundle localizedStringForKey:key value:@"" table:nil];
    if (resultString.length > 0)
        return resultString;
    return key;
}

@end
