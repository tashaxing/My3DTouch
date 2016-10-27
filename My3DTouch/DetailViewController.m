//
//  DetailViewController.m
//  My3DTouch
//
//  Created by yxhe on 16/10/27.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"子页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    label.text = @"压力值测试页面";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
}

// 根据压力值改变颜色
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;

    // maximumPossibleForce 最大 6.67
    CGFloat radio = touch.force / touch.maximumPossibleForce;
    NSLog(@"%.2f,%2f",touch.force,touch.maximumPossibleForce);
    
    self.view.backgroundColor = [UIColor colorWithRed:1 - radio green:1 - radio blue:radio alpha:1];
}

// 3D touch上滑菜单
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"action1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action1");
        // 进入分支函数
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"action2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action2");
        // 进入分支函数
    }];
    
    NSArray *actions = @[action1,action2];
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"group" style:UIPreviewActionStyleDefault actions:actions];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"action3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action3");
        // 进入分支函数
    }];
    
    NSArray *actionArray = @[group, action3];
    
    return actionArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
