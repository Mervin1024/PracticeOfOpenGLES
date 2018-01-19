//
//  MEROpenGLView.h
//  001-OpenGL实践01图片绘制
//
//  Created by 马遥 on 2018/1/19.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <GLKit/GLKit.h>

typedef NS_ENUM(NSUInteger, MEROpenGLViewType) {
    MEROpenGLViewTypePortrait,
    MEROpenGLViewTypeLandscape
};

@interface MEROpenGLView : GLKView
@property (nonatomic, assign) MEROpenGLViewType type;

- (instancetype)initWithType:(MEROpenGLViewType)type;

@end
