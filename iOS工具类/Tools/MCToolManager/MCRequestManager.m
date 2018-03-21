//
//  MCRequestManager.m
//  iOS工具类
//
//  Created by SGD on 17/1/3.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import "MCRequestManager.h"
#import "URLClass.h"

@implementation MCRequestManager


+ (NSURLSessionDataTask *)loginWithMobleNum:(NSString *)MobelNum andPassWord:(NSString *)PassWord andregistrationId:(NSString *)registrationId reqType:(NSString *)reqType andrequestSuccess:(nullable requestSuccess)requestSuccess requestFailed:(nullable requestFailed)requestFailed {

    
    NSDictionary * dic = @{@"mobelNum": MobelNum,@"passWord":PassWord,@"registrationID":registrationId,@"reqType":reqType};
    NSString *jsonStr = [MCToolManager  dictionaryToJson:dic];
    NSDictionary *paraments = @{@"method":@"login",@"jsonString":jsonStr};
  
    return [MCHTTPRequest GET:IOP_DOMAIN paraments:paraments requestSuccess:^(id  _Nullable result) {
        requestSuccess(result);
        
    } requestFailed:^(NSError * _Nullable error) {
        
        requestFailed(error);
    }];

}
/*
 
 */

@end
