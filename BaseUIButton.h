//
//  BaseUIButton.h
//  CustomTemplate
//
//  Created by zx on 14-12-19.
//  Copyright (c) 2014年 com.leying365. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    UIButtonTypeNomal,         //
    UIButtonTypeLine           //
}BaseUIButtonType;

@interface BaseUIButton : UIControl

@property (nonatomic , assign) BaseUIButtonType         type;
@property (nonatomic , retain) UILabel                  *titleLabel;
@property (nonatomic , retain) NSString                 *titleNomalText;
@property (nonatomic , retain) NSString                 *titleHighlightedText;
@property (nonatomic , retain) UIColor                  *titleNomalColor;
@property (nonatomic , retain) UIColor                  *titleHighlightedColor;
@property (nonatomic , retain) UIColor                  *buttonNomalColor;
@property (nonatomic , retain) UIColor                  *buttonHighlightedColor;
@property (nonatomic , assign) id                       target;
@property (nonatomic , assign) SEL                      targetMethod;

- (instancetype)initWithFrame:(CGRect)frame
              andUIButtonType:(BaseUIButtonType) type;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (void)nomalSetting;
- (void)highlightedSetting;
- (void)addTarget:(id)target action:(SEL)action;
@end
