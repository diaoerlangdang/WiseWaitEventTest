//
//  ViewController.m
//  WiseWaitEventTest
//
//  Created by wuruizhi on 5/16/16.
//  Copyright © 2016 wuruizhi. All rights reserved.
//

#import "ViewController.h"
#import "WiseWaitEvent.h"

@interface ViewController () {
    
    WiseWaitEvent *_waitEvent;
    int _count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _waitEvent = [[WiseWaitEvent alloc] init];
    _count = 0;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)test:(id)sender {
    
    
    dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            for (int i=0; i<10; i++) {
                sleep(1);
                _count++;
                NSLog(@"loop1 %d", _count);
            }
            
            [_waitEvent waitOver:WiseWaitResultSuccess];
            
        });
        
        //阻塞等待，等待 _waitEvent 的信号
        WiseWaitResult result =  [_waitEvent waitSignle:20000];
        if (result != WiseWaitResultSuccess) {
            NSLog(@"等待超时或失败");
            return ;
        }
        
        for (int i=0; i<10; i++) {
            sleep(1);
            _count += 2;
            NSLog(@"loop2 %d", _count);
        }
        
        
    });
    
    
    
}

@end
