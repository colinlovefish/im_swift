//
//  RewardSuccess.m
//  GameMall
//
//  Created by zyc on 16/8/2.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "RewardSuccess.h"
#import "RewardSuccessWindow.h"

#define EmitterColor_Red      [UIColor colorWithRed:255/255.0 green:0 blue:139/255.0 alpha:1]
#define EmitterColor_Yellow   [UIColor colorWithRed:251/255.0 green:197/255.0 blue:13/255.0 alpha:1]
#define EmitterColor_Blue     [UIColor colorWithRed:50/255.0 green:170/255.0 blue:207/255.0 alpha:1]

@implementation RewardSuccess

+ (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    UIView *backgroundView = [[UIView alloc] initWithFrame:window.bounds];
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [window addSubview:backgroundView];
    
    //3s 消失
    double delayInSeconds = 2;
    dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^(void){

        [UIView animateWithDuration:0.5 animations:^{

        }completion:^(BOOL finished) {

            [backgroundView removeFromSuperview];
        }];
    });
    
    //开始粒子效果
    CAEmitterLayer *emitterLayer = addEmitterLayer(backgroundView);
    startAnimate(emitterLayer);
    CAEmitterLayer *emitterLayer2 = addRightEmitterLayer(backgroundView);
    startAnimate(emitterLayer2);
    
    
    [UIView animateWithDuration:2 animations:^{
        
    } completion:^(BOOL finished) {
    
        
    }];
    
}

CAEmitterLayer *addEmitterLayer(UIView *view)
{

    //色块粒子
    CAEmitterCell *subCell1 = subCell(imageWithColor(EmitterColor_Red));
    subCell1.name = @"red";
    CAEmitterCell *subCell2 = subCell(imageWithColor(EmitterColor_Yellow));
    subCell2.name = @"yellow";
    CAEmitterCell *subCell3 = subCell(imageWithColor(EmitterColor_Blue));
    subCell3.name = @"blue";
    CAEmitterCell *subCell4 = subCell([UIImage imageNamed:@"success_star"]);
    subCell4.name = @"star";

    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(0, view.bounds.size.height * (1 - 0.618) - 50);
    emitterLayer.emitterSize	= CGSizeMake(view.bounds.size.width / 3, 20);
    emitterLayer.emitterMode	= kCAEmitterLayerPoints;
    emitterLayer.emitterShape	= kCAEmitterLayerPoint;
    emitterLayer.renderMode		= kCAEmitterLayerOldestFirst;
    
    emitterLayer.emitterCells = @[subCell1,subCell2,subCell3,subCell4];
    [view.layer addSublayer:emitterLayer];
    
    return emitterLayer;
    
}

CAEmitterLayer *addRightEmitterLayer(UIView *view) {

    //色块粒子
    CAEmitterCell *subCell1 = subRightCell(imageWithColor(EmitterColor_Red));
    subCell1.name = @"red";
    CAEmitterCell *subCell2 = subRightCell(imageWithColor(EmitterColor_Yellow));
    subCell2.name = @"yellow";
    CAEmitterCell *subCell3 = subRightCell(imageWithColor(EmitterColor_Blue));
    subCell3.name = @"blue";
    CAEmitterCell *subCell4 = subRightCell([UIImage imageNamed:@"success_star"]);
    subCell4.name = @"star";
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(view.bounds.size.width, view.bounds.size.height * (1- 0.618) - 50);

    emitterLayer.emitterSize    = CGSizeMake(view.bounds.size.width / 2, 20);
    emitterLayer.emitterMode    = kCAEmitterLayerPoints;
    emitterLayer.emitterShape    = kCAEmitterLayerPoint;
    emitterLayer.renderMode        = kCAEmitterLayerOldestFirst;
    
    emitterLayer.emitterCells = @[subCell1,subCell2,subCell3,subCell4];
    [view.layer addSublayer:emitterLayer];
    
    return emitterLayer;
    
}

void startAnimate(CAEmitterLayer *emitterLayer)
{
    CABasicAnimation *redBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.red.birthRate"];
    redBurst.fromValue		= [NSNumber numberWithFloat:30];
    redBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    redBurst.duration		= 0.5;
    redBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CABasicAnimation *yellowBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.yellow.birthRate"];
    yellowBurst.fromValue		= [NSNumber numberWithFloat:30];
    yellowBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    yellowBurst.duration		= 0.5;
    yellowBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CABasicAnimation *blueBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.blue.birthRate"];
    blueBurst.fromValue		= [NSNumber numberWithFloat:30];
    blueBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    blueBurst.duration		= 0.5;
    blueBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CABasicAnimation *starBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.star.birthRate"];
    starBurst.fromValue		= [NSNumber numberWithFloat:30];
    starBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    starBurst.duration		= 0.5;
    starBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.repeatDuration = 1;
    group.repeatCount = 1;
     group.animations = @[redBurst,yellowBurst,blueBurst,starBurst];
    
    [emitterLayer addAnimation:group forKey:@"heartsBurst"];
}

CAEmitterCell *subCell(UIImage *image)
{
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    
    cell.name = @"heart";
    cell.contents = (__bridge id _Nullable)image.CGImage;
    
    // 缩放比例
    cell.scale      = 0.6;
    cell.scaleRange = 0.6;
    // 每秒产生的数量
    cell.birthRate  = 10;
    cell.lifetime   = 1.4;
    // 秒速
    cell.velocity      = 200;   //发射速度
    cell.velocityRange = 20;
    cell.yAcceleration = 100.f; //模拟重力
    cell.emissionLongitude = 0; // 指定经度,经度角代表了在x-y轴平面坐标系中与x轴之间的夹角，默认0
    cell.xAcceleration = 40.f;
    //掉落的角度范围
    cell.emissionRange  =  2 ;
    
    
    cell.scaleSpeed		= -0.05;
    cell.spin			=  2 * M_PI;
    cell.spinRange		=  2 * M_PI;
    
    
    return cell;
}


CAEmitterCell *subRightCell(UIImage *image)
{
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    
    cell.name = @"heart";
    cell.contents = (__bridge id _Nullable)image.CGImage;
    
    // 缩放比例
    cell.scale      = 0.6;
    cell.scaleRange = 0.6;
    // 每秒产生的数量
    cell.birthRate  = 10;
    cell.lifetime   = 1.4;
    // 秒速
    cell.velocity      = 200;   //发射速度
    cell.velocityRange = 1;
    cell.yAcceleration = 100.f; //模拟重力
    cell.emissionLongitude = -M_PI; // 指定经度,经度角代表了在x-y轴平面坐标系中与x轴之间的夹角，默认0
    cell.xAcceleration = -40.f;
    //掉落的角度范围
    cell.emissionRange  =  2;

    cell.scaleSpeed       = -0.05;
    cell.spin            =  2 * M_PI;
    cell.spinRange        =  2 * M_PI;
    
    return cell;
}



UIImage *imageWithColor(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 13, 17);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}




@end
