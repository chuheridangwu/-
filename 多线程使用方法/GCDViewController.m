//
//  GCDViewController.m
//  多线程使用方法
//
//  Created by DYM on 16/6/26.
//  Copyright © 2016年 龙少. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self asynvMainQueue];
}

//异步 -- 主队列中执行（主队列是串行）
- (void)asynvMainQueue{
    //获取主队列 （添加到主队列的任务，都会放在主线程中执行）
    dispatch_queue_t queue = dispatch_get_main_queue();
    //将任务添加到队列中,异步 执行
    dispatch_async(queue, ^{
        NSLog(@"------下载图片1------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片2------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片3------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片4------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片5------%@", [NSThread currentThread]);
    });

}

//同步 -- 并发队列
- (void)syncGlobalQueue{
    //获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //将任务添加到队列中,同步执行
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片1------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片2------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片3------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片4------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片5------%@", [NSThread currentThread]);
    });
}

//同步 -- 串行队列
- (void)syncSerialQueue{
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("队列名称", NULL);
    //将任务添加到队列中,同步执行
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片1------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片2------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片3------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片4------%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"------下载图片5------%@", [NSThread currentThread]);
    });
}

// 异步-并发队列
- (void)asyncGlobalQueue{
    //获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //将任务添加到队列中,异步执行
    dispatch_async(queue, ^{
        NSLog(@"------下载图片1------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片2------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片3------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片4------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片5------%@", [NSThread currentThread]);
    });
}

//异步 -- 串行队列
- (void)asyncSerialQueue{
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("队列名称", NULL);
    //将任务添加到队列中,异步执行
    dispatch_async(queue, ^{
        NSLog(@"------下载图片1------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片2------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片3------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片4------%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"------下载图片5------%@", [NSThread currentThread]);
    });
}


/*
dispatch_async :异步，具有开辟线程的能力
dispatch_sync  :同步，不具有开辟线程的能力
 
并发队列：多个任务同时执行
串行队列：一个任务执行完之后，再执行下一个任务
 
是否开辟新的线程只取决于是 同步函数 还是 异步函数
 
//获取全局并发队列
   dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 
*/

@end
