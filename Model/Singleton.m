//
//  Singleton.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "Singleton.h"
//单例类

@implementation Singleton

//重写init函数，只能创建一个对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static id instance=nil;
    if(instance==nil){
        instance=[super allocWithZone:zone];
    }
    
    return instance;
}




@end
