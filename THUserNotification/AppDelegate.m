//
//  AppDelegate.m
//  THUserNotification
//
//  Created by TanHao on 12-8-17.
//  Copyright (c) 2012年 TanHao. All rights reserved.
//

#import "AppDelegate.h"
#import "THUserNotification.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //设置通知的样式
    [[THUserNotificationCenter defaultUserNotificationCenter] setCenterType:THUserNotificationCenterTypeBanner];
    for (int i=0; i<10; i++)
    {
        THUserNotification *notify = [[THUserNotification alloc] init];
        NSString *title = [NSString stringWithFormat:@"标题%d",i+1];
        notify.title = title;
        notify.subtitle = @"小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题";
        notify.informativeText = @"详细文字说明,详细文字说明,详细文字说明,详细文字说明";
        
        //只有当用户设置为提示模式时，才会显示按钮
        notify.hasActionButton = YES;
        
        notify.deliveryDate = [NSDate dateWithTimeIntervalSinceNow:5*(i+1)];        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setSecond:(i+1)*10];
        notify.deliveryRepeatInterval = comps;
        
        [[THUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:notify];
    }
    
    /*
     //系统10.8的通知中心的示例
    // Insert code here to initialize your application
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = @"title";
    notification.subtitle = @"subtitle";
    notification.informativeText = @"informativeText";
    
    notification.deliveryDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    //     //设置通知提交的时间
    //     notification.deliveryDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //     //设置通知的循环(必须大于1分钟，估计是防止软件刷屏)
    //     NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    //     [dateComponents setSecond:65];
    //     notification.deliveryRepeatInterval = dateComponents;
    
    //只有当用户设置为提示模式时，才会显示按钮
    notification.hasActionButton = YES;
    //notification.actionButtonTitle = @"OK";
    //notification.otherButtonTitle = @"Cancel";
    
    
    
    //删除已经显示过的通知(已经存在用户的通知列表中的)
    [[NSUserNotificationCenter defaultUserNotificationCenter] removeAllDeliveredNotifications];
    //设置通知的代理
    [[THUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
    [[THUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:notification];
    //[[THUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
    
    
    //删除已经在执行的通知(比如那些循环递交的通知)
    //    for (NSUserNotification *notify in [[NSUserNotificationCenter defaultUserNotificationCenter] scheduledNotifications])
    //    {
    //        [[NSUserNotificationCenter defaultUserNotificationCenter] removeScheduledNotification:notify];
    //    }
     */
}

#pragma mark -
#pragma mark THUserNotificationCenterDelegate

- (void)userNotificationCenter:(THUserNotificationCenter *)center didDeliverNotification:(THUserNotification *)notification
{
    NSLog(@"通知已经递交！");
}

- (void)userNotificationCenter:(THUserNotificationCenter *)center didActivateNotification:(THUserNotification *)notification
{
    NSLog(@"用户点击了通知！");
    
    if (notification.activationType == THUserNotificationActivationTypeNone)
    {
        NSLog(@"NSUserNotificationActivationTypeNone");
    }
    if (notification.activationType == THUserNotificationActivationTypeContentsClicked)
    {
        NSLog(@"NSUserNotificationActivationTypeContentsClicked");
    }
    if (notification.activationType == THUserNotificationActivationTypeActionButtonClicked)
    {
        NSLog(@"NSUserNotificationActivationTypeActionButtonClicked");
    }
    
    //NSLog(@"presented:%d",notification.presented);
}

- (BOOL)userNotificationCenter:(THUserNotificationCenter *)center shouldPresentNotification:(THUserNotification *)notification
{
    //用户中心决定不显示该条通知，returen YES;强制显示
    return YES;
}

@end
