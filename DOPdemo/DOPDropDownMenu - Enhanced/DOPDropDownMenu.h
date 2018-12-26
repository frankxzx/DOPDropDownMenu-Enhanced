//
//  DOPDropDownMenu.h
//  DOPDropDownMenuDemo
//
//  Created by weizhou on 9/26/14.
//  Modify by tanyang on 20/3/15.
//  Copyright (c) 2014 fengweizhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOPIndexPath.h"
#import "DOPBackgroundCellView.h"
#import "DOPDropDownMenuProtocol.h"

#pragma mark - interface

typedef NS_ENUM(NSInteger, DOPIndicatorAlignType) {
    DOPIndicatorAlignTypeRight = 0,     //指示图标居右
    DOPIndicatorAlignTypeCloseToTitle,  //指示图标挨着文字，有一个默认间距设置为3
};

@interface DOPDropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id <DOPDropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <DOPDropDownMenuDelegate> delegate;

@property (nonatomic, assign) UITableViewCellStyle cellStyle; // default value1

@property(nonatomic, strong) UIColor *cellSelectedColor;
@property(nonatomic, strong) UIColor *cellUnSelectedColor;

@property (nonatomic, strong) UIColor *indicatorColor;      // 三角指示器颜色
@property (nonatomic, strong) UIColor *textColor;           // 文字title颜色
@property (nonatomic, strong) UIColor *textSelectedColor;   // 文字title选中颜色
@property (nonatomic, strong) UIColor *detailTextColor;     // detailText文字颜色
@property (nonatomic, strong) UIFont *detailTextFont;       // font
@property (nonatomic, strong) UIColor *separatorColor;      // 分割线颜色
@property (nonatomic, assign) NSInteger fontSize;           // 字体大小
@property (nonatomic, assign) CGFloat separatorHeighPercent; // 分割线高度占比，默认 50%，值范围为 0-1 (在设置dataSource之前调用才会生效)

//add by xiyang
@property (nonatomic, copy) void(^finishedBlock)(DOPIndexPath *indexPath);//回收回调

// 当有二级列表item时，点击row 是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveItemValid;

@property (nonatomic, getter=isRemainMenuTitle) BOOL remainMenuTitle; // 切换条件时是否更改menu title
@property (nonatomic, strong) NSMutableArray  *currentSelectRowArray; // 恢复默认选项用
@property (nonatomic, strong) NSArray<NSString *> *indicatorImageNames;// 自定义指示器图片(在设置dataSource之前调用才会生效)
@property (nonatomic, strong) NSArray<NSNumber *> *indicatorAnimates;  // 指示器图片是否可以transform(在设置dataSource之前调用才会生效)
@property (nonatomic, assign) DOPIndicatorAlignType indicatorAlignType;
@property (nonatomic, assign) BOOL showBottomImage;                    // table底部的图是否展示 default YES
/**
 *  the width of menu will be set to screen width defaultly
 *
 *  @param origin the origin of this view's frame
 *  @param height menu's height
 *
 *  @return menu
 */
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;

- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width andHeight:(CGFloat)height;
// 获取title
- (NSString *)titleForRowAtIndexPath:(DOPIndexPath *)indexPath;

// 重新加载数据
- (void)reloadData;

// 收回菜单
- (void)hideMenu;

// 创建menu 第一次显示 不会调用点击代理，这个手动调用
- (void)selectDefalutIndexPath;

- (void)selectIndexPath:(DOPIndexPath *)indexPath; // 默认trigger delegate

- (void)selectIndexPath:(DOPIndexPath *)indexPath triggerDelegate:(BOOL)trigger; // 调用代理
@end

