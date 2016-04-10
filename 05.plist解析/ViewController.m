//
//  ViewController.m
//  05.plist解析
//
//  Created by 浅爱 on 16/3/2.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)getPlist {

    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.plist"];
    
    // 默认超时时间60s
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        // 连接错误判断
        if (connectionError) {
            
            NSLog(@"connect error");
            
            return ;
            
        }
        
        // 判断服务器内部错误 状态码
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
           
            
            /**
             *  plist反序列化
             *
             *  @param NSData 二进制数
             *  @param options 选项  指定容器
             *  @param format plist特殊格式  一般填0
             *  @param error  错误
             *
             */
            id result = [NSPropertyListSerialization propertyListWithData:data options:0 format:0 error:NULL];
            
            NSLog(@"%@", result);
            
            
        } else {
            
            NSLog(@"internal error");
            
        }
        
    }];

}

@end






