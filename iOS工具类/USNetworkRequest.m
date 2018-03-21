//
//  USNetworkRequest.m
//  USApp2.0
//
//  Created by  门皓 on 16/7/28.
//  Copyright © 2016年  门皓. All rights reserved.
//

#import "USNetworkRequest.h"
#import "AFNetworking.h"
//#import "GlobalDataSource.h"
@implementation USNetworkRequest

- (void)Reachability
{
    
}


+ (void)getRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    //网络不可用
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    //拼接URLStr
    NSString *urlStr = [NSString stringWithFormat:@"%@",url];
    
    //    AFHTTPRequestOperationManager *manager = [self getRequstManager];
    AFHTTPSessionManager *manager = [self getRequstManagerForUS];
//        manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    //    [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        successHandler(responseObject);
    //    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    //        XLLog(@"------请求失败-------%@",error);
    //        failureHandler(error);
    //    }];
    
    [manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XLLog(@"------请求失败-------%@",[error description]);
        failureHandler(error);
    }];
    
    
}


+ (void)postRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    //拼接URLStr
    NSString *urlStr = [NSString stringWithFormat:@"%@",url];
    
    AFHTTPSessionManager *manager = [self getRequstManagerForUS];
    
    //    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        successHandler(responseObject);
    //    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    //        XLLog(@"------请求失败-------%@",error);
    //        failureHandler(error);
    //    }];
    
    
    [manager POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XLLog(@"------请求失败-------%@",[error description]);
        failureHandler(error);
    }];
}

+ (void)putRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    //拼接URLStr
    NSString *urlStr = [NSString stringWithFormat:@"%@",url];
    
    AFHTTPSessionManager *manager = [self getRequstManagerForUS];
    
    //    [manager PUT:urlStr parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        successHandler(responseObject);
    //    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    //        XLLog(@"------请求失败-------%@",error);
    //        failureHandler(error);
    //    }];
    
    [manager PUT:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XLLog(@"------请求失败-------%@",[error description]);
        failureHandler(error);
    }];
    
}

+ (void)deleteRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    //拼接URLStr
    NSString *urlStr = [NSString stringWithFormat:@"%@",url];
    
    AFHTTPSessionManager *manager = [self getRequstManagerForUS];
    
    //    [manager DELETE:urlStr parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        successHandler(responseObject);
    //    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    //        XLLog(@"------请求失败-------%@",error);
    //        failureHandler(error);
    //    }];
    
    [manager DELETE:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XLLog(@"------请求失败-------%@",[error description]);
        failureHandler(error);
    }];
    
}

/**
 下载文件，监听下载进度
 */
+ (void)downloadRequest:(NSString *)url successAndProgress:(progressBlock)progressHandler complete:(responseBlock)completionHandler {
    /*
     if (![self checkNetworkStatus]) {
     progressHandler(0, 0, 0);
     completionHandler(nil, nil);
     return;
     }
     
     NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
     AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
     
     NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
     NSProgress *kProgress = nil;
     
     NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&kProgress destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
     
     NSURL *documentUrl = [[NSFileManager defaultManager] URLForDirectory :NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
     
     return [documentUrl URLByAppendingPathComponent:[response suggestedFilename]];
     
     } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath, NSError * _Nonnull error){
     if (error) {
     XLLog(@"------下载失败-------%@",error);
     }
     completionHandler(response, error);
     }];
     
     [manager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
     
     progressHandler(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
     
     }];
     [downloadTask resume];
     */
}



/**
 *  发送一个POST请求
 *  @param fileConfig 文件相关参数模型
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 *  无上传进度监听
 */
+ (void)updateRequest:(NSString *)url params:(NSDictionary *)params fileConfig:(CYJFileConfig *)fileConfig success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    AFHTTPSessionManager *manager = [self getRequstManagerForUS];
    
    //    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //
    //        [formData appendPartWithFileData:fileConfig.fileData name:fileConfig.name fileName:fileConfig.fileName mimeType:fileConfig.mimeType];
    //
    //    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        successHandler(responseObject);
    //
    //    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    //        XLLog(@"------上传失败-------%@",error);
    //        failureHandler(error);
    //    }];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XLLog(@"------上传失败-------%@",error);
        failureHandler(error);
    }];
    
}


/**
 上传文件，监听上传进度
 */
+ (void)updateRequest:(NSString *)url params:(NSDictionary *)params fileConfig:(CYJFileConfig *)fileConfig successAndProgress:(progressBlock)progressHandler complete:(responseBlock)completionHandler {
    /*
     if (![self checkNetworkStatus]) {
     progressHandler(0, 0, 0);
     completionHandler(nil, nil);
     return;
     }
     
     NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
     
     [formData appendPartWithFileData:fileConfig.fileData name:fileConfig.name fileName:fileConfig.fileName mimeType:fileConfig.mimeType];
     
     } error:nil];
     
     //获取上传进度
     AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
     
     [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
     
     progressHandler(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
     
     }];
     
     [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
     completionHandler(responseObject, nil);
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
     
     completionHandler(nil, error);
     if (error) {
     XLLog(@"------上传失败-------%@",error);
     }
     }];
     
     [operation start];
     */
}

//+ (AFHTTPRequestOperationManager *)getRequstManager {
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    // 请求超时设定
//    manager.requestSerializer.timeoutInterval = 10;
////    manager.securityPolicy.allowInvalidCertificates = YES;
//
//    return manager;
//}

//+ (AFHTTPSessionManager *)getRequstManagerForUS {
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    // 请求超时设定
//    manager.requestSerializer.timeoutInterval = 10;
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    
//    
////    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/javascript", @"text/plain",nil];
//    //增加http请求头
////    [manager.requestSerializer setValue:Token forHTTPHeaderField:@"Authorization"];
//    
//    return manager;
//}

+ (AFHTTPSessionManager *)getRequstManagerForUS {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 请求超时设定
    manager.requestSerializer.timeoutInterval = 60;
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    //增加http请求头
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/javascript", @"text/plain",nil];
    
    //[manager.requestSerializer setValue:[[GlobalDataSource sharedInstance].cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forHTTPHeaderField:@"cityName"];
    //    NSLog(@"Token====%@",Token);
    return manager;
}

/**
 监控网络状态
 */
+ (BOOL)checkNetworkStatus {
    
    __block BOOL isNetworkUse = YES;
    
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusUnknown) {
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusNotReachable){
            // 网络异常操作
            isNetworkUse = NO;
            XLLog(@"网络异常,请检查网络是否可用！");
        }
    }];
    [reachabilityManager startMonitoring];
    return isNetworkUse;
}

@end





/**
 *  用来封装上传文件数据的模型类
 */
@implementation USFileConfig

+ (instancetype)fileConfigWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType {
    return [[self alloc] initWithfileData:fileData name:name fileName:fileName mimeType:mimeType];
}

- (instancetype)initWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType {
    if (self = [super init]) {
        
        _fileData = fileData;
        _name = name;
        _fileName = fileName;
        _mimeType = mimeType;
    }
    return self;
}


@end
