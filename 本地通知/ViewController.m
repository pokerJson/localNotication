//
//  ViewController.m
//  本地通知
//
//  Created by dzc on 2021/2/4.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"嘻嘻嘻嘻嘻" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.frame = CGRectMake(100, 100, 100,40);
    [btn addTarget:self action:@selector(xxxx) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"每天10点提醒" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    btn2.frame = CGRectMake(100, 300, 200,40);
    [btn2 addTarget:self action:@selector(xxxx2222222) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    [self addNotification22222222222];
}
- (void)xxxx{
    [self addNotification];
}
- (void)addNotification {
    // 创建一个通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @1;
    content.title = @"我是大标题";
    content.subtitle = @"我是小标题";
    content.body = @"我是内容体，呵呵呵呵呵呵呵呵呵呵好或或或或或或😁2😃哈哈哈";
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = @"customUI";
    
    // 设置多长时间之后发送
    NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:1] timeIntervalSinceNow];
    
    // 通知触发器
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:false];
    // 通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"customUI" content:content trigger:trigger];
    //添加通知
    [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        NSLog(@"error:%@",error);
    }];
    
    
//    // 添加通知的一些操作
//    UNNotificationAction *openAction = [UNNotificationAction actionWithIdentifier:@"open" title:@"打开" options:UNNotificationActionOptionForeground];
//    UNNotificationAction *closeAction = [UNNotificationAction actionWithIdentifier:@"close" title:@"关闭" options:UNNotificationActionOptionDestructive];
//    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"category" actions:@[openAction, closeAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
//        
//    NSSet *sets = [NSSet setWithObject:category];
//    [UNUserNotificationCenter.currentNotificationCenter setNotificationCategories:sets];
}


- (void)xxxx2222222{
    [self addNotification22222222222];
}
- (void)addNotification22222222222{
    // 创建一个通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @1;
    content.title = @"每天10点提醒";
    content.subtitle = @"每天10点提醒哦~~~~~~";
    content.body = @"快来打卡签到了啊";
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = @"customUI";
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate * date = [formatter dateFromString:@"10:00:00"];
    
    NSDateComponents * components = [[NSCalendar currentCalendar]
                                         components:NSCalendarUnitHour |
                                                     NSCalendarUnitMinute |
                                                     NSCalendarUnitSecond
                                         fromDate:date];

    //repeats: 设置是否重复
    UNCalendarNotificationTrigger * trigger = [UNCalendarNotificationTrigger
                                                triggerWithDateMatchingComponents:components
                                                repeats:YES];
    // 通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"loacal" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"通知添加失败:%@",error);
        } else {
            NSLog(@"通知添加成功");
        }
    }];
    
//    //找到要取消的通知名字
//    NSMutableArray * names = [[NSMutableArray alloc]initWithObjects:@"loacal", nil];
//    //批量取消这些通知
//    [[UNUserNotificationCenter currentNotificationCenter] removePendingNotificationRequestsWithIdentifiers:names];
  
  
}
@end
