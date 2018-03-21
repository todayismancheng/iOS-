//
//  MCToolManager.h
//  iOS工具类
//
//  Created by luoyang_ on 2016/11/3.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCToolManager : NSObject
#define MCToolShareManeger   [MCToolManager sharedInstance]

+ (MCToolManager *)sharedInstance;
//只含有汉字、数字、字母、下划线不能以下划线开头和结尾
- (BOOL)validateTextField:(NSString *)textField;

//判断金钱
- (BOOL)validateMoney:(NSString *)money;

//判断密码
- (BOOL)validatePassword:(NSString *)passWord;

//判断输入是否为数字
- (BOOL)validateNumber:(NSString*)number;

//判断邮箱
- (BOOL)validateEmail:(NSString*)email;

//判断QQ
- (BOOL)validateQQ:(NSString*)QQ;

//判断身份证号码-- 大概判断
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

//身份证判断  -- 详细判断
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

//判断范围
//-(void)textFieldEditChangedWithTextFiled:(UITextField *)textFiled andMaxCount:(NSInteger)maxCount;
// 字典转换成字符串
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

// json串转换成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

// 其他类型转换字符串
-(NSString*)stringWithData:(NSObject*)data;
@end
