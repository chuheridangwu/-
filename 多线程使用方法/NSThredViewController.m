//
//  NSThredViewController.m
//  多线程使用方法
//
//  Created by DYM on 16/6/26.
//  Copyright © 2016年 龙少. All rights reserved.
//

#import "NSThredViewController.h"

@interface NSThredViewController ()
{
    NSThread *_thread1;
     NSThread *_thread2;
     NSThread *_thread3;
    NSInteger _count;
}
@end

@implementation NSThredViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _count = 100;
    _thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTick) object:nil];
    _thread1.name = @"1号窗口";
    
    _thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTick) object:nil];
    _thread2.name = @"2号窗口";
    
    _thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTick) object:nil];
    _thread3.name = @"3号窗口";
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    [self performSelectorInBackground:@selector(downImgUrl) withObject:nil];
    
    /*
    // 线程安全--互斥锁
     [_thread1 start];
     [_thread2 start];
     [_thread3 start];
     */
}
#warning  -----------  线程之间的通讯
- (void)downImgUrl{
    NSString *imgUrl = @"";
}



#warning  -----------  线程安全--互斥锁
- (void)saleTick{
    while (1) {
        // 加锁，避免多个线程争夺资源
        @synchronized(self) {
            NSInteger tickCount = _count;
            // 睡眠是为了模仿多个线程争夺资源
            [NSThread sleepForTimeInterval:0.05];
            
            if (tickCount > 0) {
                _count = tickCount - 1;
                NSLog(@"%@卖了一张票，剩余%ld",[NSThread currentThread].name,_count);
            }else{
                return;
            }
        }
    }
}


#warning  -----------  NSThread创建线程的方式


- (void)download:(NSString*)url{
    NSLog(@"正在下载---------%@--------%@",url,[NSThread currentThread]);
    
}

/*
 创建线程的方法3
 */
- (void)createThread3{
    //隐式开启线程
    [self performSelectorInBackground:@selector(download:) withObject:@"https://a.jpg"];
}

/*
 创建线程的方法2
 */
- (void)createThread2{
    [NSThread detachNewThreadSelector:@selector(download:) toTarget:self withObject:@"https://a.jpg"];
}

/*
 创建线程的方法1
 */
- (void)createThread1{
    //创建线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(download:) object:@"https://a.jpg"];
    //启动线程 // 必须调用start方法线程才会调用download方法
    [thread start];
    
}

/*

 
 //获取主线程
 [NSThread mainThread];
 
 //查看当前线程
 [NSThread currentThread];
 
 //判断是否是主线程
  [NSThread isMainThread];
 
 //给当前线程命名
 [thread setName:@"线程名字"];
 
 //睡眠当前线程5秒钟
 [NSThread sleepForTimeInterval:5];
 
 //睡眠当前线程到指定时间
 [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
 
 //销毁当前线程
 [NSThread exit];  或者直接 return
 
 */



@end
