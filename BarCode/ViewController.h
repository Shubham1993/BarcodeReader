//
//  ViewController.h
//  BarCode
//
//  Created by Shubham on 27/04/17.
//  Copyright © 2017 Shubham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
@property (weak, nonatomic) IBOutlet UIView *scannerView;

- (IBAction)startCapture:(id)sender;
@property NSString *outputData;

@end

