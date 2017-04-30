//
//  ViewController.m
//  BarCode
//
//  Created by Shubham on 27/04/17.
//  Copyright © 2017 Shubham. All rights reserved.
//

#import "ViewController.h"
#import "barcodeDataViewController.h"

@interface ViewController ()

@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSError *error;
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:captureDevice error:&error];
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    AVCaptureMetadataOutput *metaOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:metaOutput];
    [metaOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    metaOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeITF14Code,AVMetadataObjectTypeInterleaved2of5Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeDataMatrixCode,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeCode39Mod43Code,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeAztecCode];
    
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _videoPreviewLayer.frame = self.scannerView.frame;
    [self.scannerView.layer addSublayer:_videoPreviewLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recr,eated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    
}


- (IBAction)startCapture:(id)sender {

    [_captureSession startRunning];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    if(metadataObjects.count == 0 || metadataObjects == nil){
        _outputData = @"No BarCode is detected";
        [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
    }
    else{
        AVMetadataMachineReadableCodeObject *metaObject = metadataObjects[0];
        if(metaObject.type == AVMetadataObjectTypeQRCode){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
            
        }
        else if (metaObject.type == AVMetadataObjectTypeUPCECode){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypePDF417Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeITF14Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeInterleaved2of5Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeEAN8Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeEAN13Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeDataMatrixCode){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeCode93Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeCode39Mod43Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeCode39Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeCode128Code){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
        else if (metaObject.type == AVMetadataObjectTypeAztecCode){
            if (metaObject.stringValue != nil) {
                _outputData = metaObject.stringValue;
                [self performSegueWithIdentifier:@"barcodeDataSegue" sender:self];
            }
        }
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"barcodeDataSegue"]) {
        barcodeDataViewController* DVC = (barcodeDataViewController*)segue.destinationViewController;
        DVC.barcodeLabel.text = _outputData;
    }
}
@end
