//
//  MCCScanView.m
//  iOS工具类
//
//  Created by SGD on 2017/8/28.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import "MCCScanView.h"

/** 二维码冲击波动画时间 */
static CGFloat const SGQRCodeScanningLineAnimation = 0.05;

@interface MCCScanView ()
@property (nonatomic, assign) CGRect scanRect;
@property (nonatomic, strong) UIImageView *scanImageline;
/** 扫描框*/
@property (nonatomic, strong)  UIImageView  *scanImageView;
/** 定时器*/
@property (nonatomic, strong) NSTimer *timer;
/** 闪光灯按钮*/
@property (nonatomic, strong)  UIButton *light_btn;
/** 闪光灯*/
@property (nonatomic, strong) AVCaptureDevice *device;
/** 提示语*/
@property (nonatomic, strong)  UILabel *title_label;
@end

@implementation MCCScanView

- (instancetype)initWithScanRect:(CGRect)rect {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _scanRect = rect;
        [self addSubview:self.scanImageView];
        [self addSubview:self.title_label];
        [self addSubview:self.light_btn];
        
        [self addTimer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[[UIColor blackColor] colorWithAlphaComponent:0.5] setFill];
    CGMutablePathRef screenPath = CGPathCreateMutable();
    CGPathAddRect(screenPath, NULL, self.bounds);
    
    CGMutablePathRef scanPath = CGPathCreateMutable();
    CGPathAddRect(scanPath, NULL, self.scanRect);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddPath(path, NULL, screenPath);
    CGPathAddPath(path, NULL, scanPath);
    
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathEOFill);
    
    CGPathRelease(screenPath);
    CGPathRelease(scanPath);
    CGPathRelease(path);
}

#pragma mark -----  动画

#pragma mark - - - 添加定时器
- (void)addTimer {
    
    [self addSubview:self.scanImgline];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:SGQRCodeScanningLineAnimation target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

#pragma mark - - - 移除定时器
- (void)removeTimer {
    
    [self.timer invalidate];
    self.timer = nil;
    [self.scanImageline removeFromSuperview];
    self.scanImageline = nil;
}

#pragma mark - - - 执行定时器方法
- (void)timeAction {
    
    __block CGRect frame = _scanImageline.frame;
    
    static BOOL flag = YES;
    
    if (flag) {
        frame.origin.y = self.scanImageView.y;
        flag = NO;
        [UIView animateWithDuration:SGQRCodeScanningLineAnimation animations:^{
            frame.origin.y += 5;
            _scanImageline.frame = frame;
        } completion:nil];
    } else {
        if (_scanImageline.frame.origin.y >= self.scanImageView.y) {
            CGFloat scanContent_MaxY = self.scanImageView.y + self.frame.size.width - 2 * self.scanImageView.x;
            if (_scanImageline.frame.origin.y >= scanContent_MaxY - 10) {
                frame.origin.y = self.scanImageView.y;
                _scanImageline.frame = frame;
                flag = YES;
            } else {
                [UIView animateWithDuration:SGQRCodeScanningLineAnimation animations:^{
                    frame.origin.y += 5;
                    _scanImageline.frame = frame;
                } completion:nil];
            }
        } else {
            flag = !flag;
        }
    }
}


#pragma mark -----  视图
- (UIImageView *)scanImgline {
    
    if (!_scanImageline) {
        _scanImageline = [[UIImageView alloc] init];
        _scanImageline.image = [UIImage imageNamed:@"cdwy_line"];
        _scanImageline.frame = CGRectMake(self.scanImageView.x, self.scanImageView.y, self.scanImageView.width, 2);
    }
    return _scanImageline;
}
- (UIImageView *)scanImageView{
    
    if (_scanImageView == nil) {
        
        _scanImageView= [[UIImageView alloc]initWithFrame:self.scanRect];
        _scanImageView.image = [UIImage imageNamed:@"cdwy_scan_blackline"];
        
    }
    
    return _scanImageView;
}
- (UILabel *)title_label{
    
    if (_title_label ==nil) {
        
        CGFloat title_labelX = 0;
        CGFloat title_labelY = CGRectGetMaxY(self.scanImageView.frame) + self.scanImageView.x * 0.5;
        CGFloat title_labelW = self.frame.size.width;
        CGFloat title_labelH = 25;
        _title_label  = [[UILabel alloc]initWithFrame:CGRectMake(title_labelX, title_labelY, title_labelW, title_labelH)];
        _title_label.text = @"请将二维码放入框内即可自动扫描";
        _title_label.textAlignment = NSTextAlignmentCenter;
        _title_label.textColor = [UIColor whiteColor];
        
    }
    return _title_label;
}
- (UIButton *)light_btn{
    
    if (_light_btn == nil) {
        
        _light_btn = [[UIButton alloc] init];
        CGFloat light_btnX = 0;
        CGFloat light_btnY = CGRectGetMaxY(self.title_label.frame) + 20;
        CGFloat light_btnW = self.frame.size.width;
        CGFloat light_btnH = 25;
        _light_btn.frame = CGRectMake(light_btnX, light_btnY, light_btnW, light_btnH);
        [_light_btn setTitle:@"打开照明灯" forState:UIControlStateNormal];
        [_light_btn setTitle:@"关闭照明灯" forState:UIControlStateSelected];
        [_light_btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _light_btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_light_btn addTarget:self action:@selector(light_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _light_btn;
}

// 添加闪光灯按钮
- (void)light_buttonAction:(UIButton *)button {
    if (button.selected == NO) { // 点击打开照明灯
        [self turnOnLight:YES];
        button.selected = YES;
    } else { // 点击关闭照明灯
        [self turnOnLight:NO];
        button.selected = NO;
    }
}
- (void)turnOnLight:(BOOL)on {
    
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([_device hasTorch]) {
        [_device lockForConfiguration:nil];
        if (on) {
            [_device setTorchMode:AVCaptureTorchModeOn];
        } else {
            [_device setTorchMode: AVCaptureTorchModeOff];
        }
        [_device unlockForConfiguration];
    }
}

#pragma mark -----  下面的文件都是调用二维码扫描前奏  ----- 别的文件要用   ----
/**   .h 还有2个属性声明需要带走 */
- (void)setup {
     
     // 1、 获取摄像设备
     AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
     if (device) {
         AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
         if (status == AVAuthorizationStatusNotDetermined) {
             [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                 if (granted) {
                     dispatch_async(dispatch_get_main_queue(), ^{
                         
                         [self setupCapture];
                     });
                     
                     NSLog(@"当前线程 - - %@", [NSThread currentThread]);
                     // 用户第一次同意了访问相机权限
                     NSLog(@"用户第一次同意了访问相机权限");
                     
                 } else {
                     // 用户第一次拒绝了访问相机权限
                     NSLog(@"用户第一次拒绝了访问相机权限");
                 }
             }];
         } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
             
             [self setupCapture];
             NSLog(@"------第二次------");
         } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
             
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - xxxx] 打开访问开关" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定" , nil];
             [alert show];
         } else if (status == AVAuthorizationStatusRestricted) {
             
             NSLog(@"因为系统原因, 无法访问相册");
         }
         
     } else {
         
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"未检测到您的摄像头" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
         
         [alert show];
         NSLog(@"------------");
         
     }
     self.scanRect = CGRectMake(self.bounds.size.width * 0.5 - 100, 100.0f, 200.0f, 200.0f);
     
 }
- (void)setupCapture {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.session = [[AVCaptureSession alloc] init];
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error;
        AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
        if (deviceInput) {
            [self.session addInput:deviceInput];
            
            AVCaptureMetadataOutput *metadataOutput = [[AVCaptureMetadataOutput alloc] init];
            [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
            [self.session addOutput:metadataOutput]; // 这行代码要在设置 metadataObjectTypes 前
            
            metadataOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
            
            AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
            previewLayer.frame = self.frame;
            [self.layer insertSublayer:previewLayer atIndex:0];
            
            __weak typeof(self) weakSelf = self;
            [[NSNotificationCenter defaultCenter] addObserverForName:AVCaptureInputPortFormatDescriptionDidChangeNotification
                                                              object:nil
                                                               queue:[NSOperationQueue currentQueue]
                                                          usingBlock: ^(NSNotification *_Nonnull note) {
                                                              metadataOutput.rectOfInterest = [previewLayer metadataOutputRectOfInterestForRect:weakSelf.scanRect]; // 如果不设置，整个屏幕都可以扫
                                                          }];
            
            MCCScanView *scanView = [[MCCScanView alloc] initWithScanRect:self.scanRect];
            [self addSubview:scanView];
            
            [self.session startRunning];
        } else {
            
            NSLog(@"%@", error);
        }
    });
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    [self.session stopRunning];
    
    AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects.firstObject;
    
    if ([metadataObject.type isEqualToString:AVMetadataObjectTypeQRCode] && !self.isQRCodeCaptured) {
        self.isQRCodeCaptured = YES;
        
        [self showAlertViewWithMessage:metadataObject.stringValue];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.isQRCodeCaptured = NO;
    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        
        [self.session startRunning];
        
    }
}

#pragma mark - Private Methods

- (void)showAlertViewWithMessage:(NSString *)message {
    NSLog(@"%@", message);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    alertView.delegate = self;
    [alertView show];
}


@end
