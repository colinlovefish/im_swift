//
//  NSBundle+language.h
//  LanguageChange
//
//  Created by 郑昊鸣 on 2018/3/2.
//  Copyright © 2018年 zhm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (language)
+ (void)setLanguage:(NSString *)language;

+ (instancetype)yh_bundle ;
+ (NSString *)localizedStringForKey:(NSString *)key;
+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value;
+ (void)changeLanguage:(NSString *)language;
@end
