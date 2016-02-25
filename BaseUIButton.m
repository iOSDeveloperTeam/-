//
//  BaseUIButton.m
//  CustomTemplate
//
//  Created by zx on 14-12-19.
//  Copyright (c) 2014年 com.leying365. All rights reserved.
//

#import "BaseUIButton.h"

@implementation BaseUIButton
@synthesize type = _type;
@synthesize titleLabel = _titleLabel;
@synthesize titleNomalText = _titleNomalText;
@synthesize titleHighlightedText = _titleHighlightedText;
@synthesize titleNomalColor = _titleNomalColor;
@synthesize titleHighlightedColor = _titleHighlightedColor;
@synthesize buttonNomalColor = _buttonNomalColor;
@synthesize buttonHighlightedColor = _buttonHighlightedColor;
@synthesize target = _target;
@synthesize targetMethod = _targetMethod;

- (instancetype)initWithFrame:(CGRect)frame
              andUIButtonType:(BaseUIButtonType) type
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _type = type;
        [self findView];
        
    }
    return self;
}

- (void)findView
{
    
    [self.layer setBorderWidth:1.0f];
    self.layer.cornerRadius = 3.0f;
    self.layer.masksToBounds = YES;
    
    _titleLabel = [[UILabel alloc]initWithFrame:[self frame]];
    [_titleLabel setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:_titleLabel];
}

/**
 *  默认配置文字、文字颜色、按钮颜色
 */
- (void)nomalSetting
{
    [_titleLabel setText:_titleNomalText];
    [_titleLabel setTextColor:_titleNomalColor];
    
}

/**
 *  高亮配置文字、文字颜色、按钮颜色
 */
- (void)highlightedSetting
{
    [_titleLabel setText:_titleHighlightedText];
    [_titleLabel setTextColor:_titleHighlightedColor];
}

/**
 *  设置按钮文字
 *
 *  @param title 按钮文字
 *  @param state 按钮所属状态
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
        {
            _titleNomalText = title;
            _titleHighlightedText = title;
            [self nomalSetting];
            
        }
            break;
            
        case UIControlStateHighlighted:
        {
            _titleHighlightedText = title;
        }
            break;
        default:
            break;
    }
}

/**
 *  设置按钮文字颜色
 *
 *  @param color 按钮文字颜色
 *  @param state 按钮所属状态
 */
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
        {
            _titleNomalColor = color;
            _titleHighlightedColor = color;
            [self nomalSetting];
        }
            break;
            
        case UIControlStateHighlighted:
        {
            _titleHighlightedColor = color;
        }
            break;
        default:
            break;
    }

}

/**
 *  设置按钮背景颜色
 *
 *  @param color 按钮背景颜色
 *  @param state 按钮所属状态
 */
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
{
    switch (state) {
        case UIControlStateNormal:
        {
            _buttonNomalColor = color;
            _buttonHighlightedColor = color;
            [self nomalSetting];
        }
            break;
            
        case UIControlStateHighlighted:
        {
            _buttonHighlightedColor = color;
        }
            break;
        default:
            break;
    }
}

/**
 *  用于自定义事件
 *
 *  @param target 事件所有者
 *  @param action 事件方法
 */
- (void)addTarget:(id)target action:(SEL)action
{
 
    _target = target;
    _targetMethod = action;
}

/**
 *  用于监听按钮按住没有抬起时的事件
 *
 *  @param touches touches
 *  @param event   event
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self highlightedSetting];
}

/**
 *  用于监听按钮抬起时的事件
 *
 *  @param touches touches
 *  @param event   event
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self nomalSetting];
    
    APP_LOG_DEBUG(@"sdsdsd");
    
    /**
     *  触发按钮事件
     */
    if(_target != nil && _targetMethod != nil){
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_target performSelector:_targetMethod withObject:self];
        #pragma clang diagnostic pop
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
