//
//  NSBundle+richTextEditor.m
//  RichTextEditor
//
//  Created by Xuzixiang on 2018/6/20.
//  Copyright © 2018年 frankxzx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSBundle+richTextEditor.h"
#import "QSRichTextController.h"

@implementation NSBundle (richTextEditor)

+ (instancetype)richTextBundle
{
    static NSBundle *lfMediaEditingBundle = nil;
    if (lfMediaEditingBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        lfMediaEditingBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[QSRichTextController class]] pathForResource:@"RichTextEditor" ofType:@"bundle"]] ?: [NSBundle mainBundle];
//        lfMediaEditingBundle = [[NSBundle bundleForClass:[self class]].resourcePath stringByAppendingPathComponent:@"/SubModule_Use_Bundle.bundle"]
    }
    return lfMediaEditingBundle;
}

+ (instancetype)cssBundle
{
    static NSBundle *cssBundle = nil;
    if (cssBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        cssBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[QSRichTextController class]] pathForResource:@"RichTextStyle" ofType:@"bundle"]] ?: [NSBundle mainBundle];
    }
    return cssBundle;
}

+ (UIImage *)rixhText_imageNamed:(NSString *)name inDirectory:(NSString *)subpath
{
    //  [UIImage imageNamed:[NSString stringWithFormat:@"%@/%@", kBundlePath, name]]
    NSString *extension = name.pathExtension.length ? name.pathExtension : @"png";
    NSString *defaultName = [name stringByDeletingPathExtension];
    NSString *bundleName = [defaultName stringByAppendingString:@"@2x"];
    //    CGFloat scale = [UIScreen mainScreen].scale;
    //    if (scale == 3) {
    //        bundleName = [name stringByAppendingString:@"@3x"];
    //    } else {
    //        bundleName = [name stringByAppendingString:@"@2x"];
    //    }
    UIImage *image = [UIImage imageNamed:name inBundle:[self richTextBundle] compatibleWithTraitCollection:nil];
    if (image == nil) {
        image = [UIImage imageWithContentsOfFile:[[self richTextBundle] pathForResource:defaultName ofType:extension inDirectory:subpath]];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)rixhText_imageNamed:(NSString *)name
{
    return [self rixhText_imageNamed:name inDirectory:nil];
}

//+ (UIImage *)LFME_stickersImageNamed:(NSString *)name
//{
//    return [self LFME_imageNamed:name inDirectory:@"stickers"];
//}
//
//+ (NSString *)LFME_stickersPath
//{
//    return [[self richTextBundle] pathForResource:@"stickers" ofType:nil];
//}

@end
