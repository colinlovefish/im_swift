//
//  NSBundle+language.m
//  LanguageChange
//
//  Created by 郑昊鸣 on 2018/3/2.
//  Copyright © 2018年 zhm. All rights reserved.
//

#import "NSBundle+language.h"
#import <objc/runtime.h>

static const char _bundle = 0;

@interface BundleEx : NSBundle

@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle *bundle = objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (Language)

+ (instancetype)yh_bundle {
    static NSBundle * bundle = nil;
    if (bundle == nil) {
        bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"delocalizable" ofType:@"bundle"]];
    }
    return bundle;
}

+ (NSString *)localizedStringForKey:(NSString *)key {
    return [self localizedStringForKey:key value:nil];
}


+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value {
    static NSBundle *bundle = nil;
    
    NSString *language=[[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"];
    
    if (language == nil) {language = @"en";}
    if ([language hasPrefix:@"en"]) {
        language = @"en";
    } else if ([language hasPrefix:@"zh"]) {
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            language = @"zh-Hans";
        } else {
            language = @"zh-Hant";
        }
    } else if([language hasPrefix:@"ko"]){
        language = @"ko";//韩语
    } else if([language hasPrefix:@"ja"]){
        language = @"ja";//日语
    } else {
        language = @"en";
    }
    bundle = [NSBundle bundleWithPath:[[NSBundle yh_bundle] pathForResource:language ofType:@"lproj"]];
    
    return [bundle localizedStringForKey:(key) value:nil table:nil];
    
    
    
}


+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle yh_bundle], [BundleEx class]);
    });
    
    objc_setAssociatedObject([NSBundle yh_bundle], &_bundle, language ? [[NSBundle yh_bundle] pathForResource:language ofType:@"lproj"] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}





@end
