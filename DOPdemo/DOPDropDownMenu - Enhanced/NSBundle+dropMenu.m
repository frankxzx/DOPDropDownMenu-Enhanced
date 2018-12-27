
#import <UIKit/UIKit.h>
#import "NSBundle+dropMenu.h"
#import "DOPDropDownMenu.h"

@implementation NSBundle (dropMenu)

+ (instancetype)dropMenuBundle
{
    static NSBundle *lfMediaEditingBundle = nil;
    if (lfMediaEditingBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        lfMediaEditingBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[DOPDropDownMenu class]] pathForResource:@"DOPDropDownMenu" ofType:@"bundle"]] ?: [NSBundle mainBundle];
    }
    return lfMediaEditingBundle;
}

+ (UIImage *)dropMenu_imageNamed:(NSString *)name inDirectory:(NSString *)subpath
{
    NSString *extension = name.pathExtension.length ? name.pathExtension : @"png";
    NSString *defaultName = [name stringByDeletingPathExtension];
    UIImage *image = [UIImage imageNamed:name inBundle:[self dropMenuBundle] compatibleWithTraitCollection:nil];
    if (image == nil) {
        image = [UIImage imageWithContentsOfFile:[[self dropMenuBundle] pathForResource:defaultName ofType:extension inDirectory:subpath]];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)dropMenu_imageNamed:(NSString *)name
{
    return [self dropMenu_imageNamed:name inDirectory:nil];
}

@end
