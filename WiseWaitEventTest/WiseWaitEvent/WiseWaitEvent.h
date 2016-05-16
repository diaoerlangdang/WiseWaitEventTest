//
//  WiseWaitEvent.h
//
//  Created by wuruizhi on 10/9/15.
//  Copyright © 2015 wurz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WiseWaitResult)
{
    WiseWaitResultSuccess = 0,  //成功
    WiseWaitResultFailed,       //失败
    WiseWaitResultTimeOut,      //等待超时
    WiseWaitResultWaiting,      //正在等待
};

@interface WiseWaitEvent : NSObject
{
}

//等待结果,直到调用waitOver，或mills（ms）后超时
-(WiseWaitResult)waitSignle:(NSUInteger) mills;

//结束等待，并设置waitSignle返回结果
-(void)waitOver:(WiseWaitResult)result;

@end
