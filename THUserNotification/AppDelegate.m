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
}

@end
