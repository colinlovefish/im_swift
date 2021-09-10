//
//  NTVLocalized.m
//  XHTVPortal
//
//  Created by 郑昊鸣 on 2018/3/1.
//  Copyright © 2018年 XinHuaTV. All rights reserved.
//

#import "NTVLocalized.h"
#import "NSBundle+language.h"

@implementation NTVLocalized
+ (NTVLocalized *)sharedInstance {
    static NTVLocalized *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NTVLocalized alloc] init];
    });
    return instance;
}

- (void)initLanguage{
    NSString *language=[self currentLanguage];
    if (language.length>0) {
        [NSBundle setLanguage:language];
    }else{
        [self systemLanguage];
    }
}

- (void)initLanguage:(NSString *)language{
    if (language.length>0) {
        [NSBundle setLanguage:language];
    }else{
        [self systemLanguage];
    }
}
- (NSString *)currentLanguage{
    NSString *language=[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage];
    return language;
}
- (void)setLanguage:(NSString *)language{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:AppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [NSBundle setLanguage:language];
    
}




- (void)systemLanguage{
    NSString *languageCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
    if([languageCode hasPrefix:@"zh-Hans"]){
        languageCode = @"zh-Hans";//简体中文
    }else if([languageCode hasPrefix:@"en"]){
        languageCode = @"en";//英语
    }else if([languageCode hasPrefix:@"ko"]){
        languageCode = @"ko";//韩语
    }else if([languageCode hasPrefix:@"ja"]){
        languageCode = @"ja";//日语
    }
    [self setLanguage:languageCode];
}

@end
