//
//  ViewController.m
//  Custom UIButton
//
//  Created by Paul Solt on 1/22/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIColor *_defaultTintColor;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _defaultTintColor = self.view.tintColor;
    
    // *** Standard UIButton in Code for iOS 7 ***
    
    // Create 2 programmatic buttons with background colors
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        // You'll need to set the title for a state, if you just try to adjust
        //  the title property, you won't see any text
        [button setTitle:@"Press Me" forState:UIControlStateNormal];

        if(i == 1) {
            // Show the bounds of the button using a background color
            button.backgroundColor = [UIColor lightGrayColor];
        }
        [self.view addSubview:button];
        
        // Resize the button to see something, it'll be zero width/height
        //  if we don't resize it, and you won't see anything
        [button sizeToFit];
        button.center = CGPointMake(100, 50 + i*50);
    }
    
    // *** Create programmatic iOS 7 button with image backgrounds ***
    
    // Using UIButtonTypeRoundedRect we get iOS 7 button behavior on top of
    //  our background image. (You won't need a pressed image, since iOS 7
    //  uses fading/transparency to show presses)
    //  The tint color will propogate if we use this type of button
    
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.view addSubview:button];
        [button setTitle:@"Hello" forState:UIControlStateNormal];
        [button setContentEdgeInsets:UIEdgeInsetsMake(4, 8, 4, 8)];
        [button sizeToFit];
        button.center = CGPointMake(200, 50);

    // We'll create a resizable image so it can stretch!
    //  Button@2x.png is 40x40, for a non-retina it's scaled by the iPhone to 20x20 (1/2 resolution)
    //  The edge insets are not in retina pixels, instead they use the point system (i.e. non-retina size)
    // Based on the provided image, we use the width and height of 20 points and divide by 2. i.e. 20/2 = 10
    [button setBackgroundImage:[[UIImage imageNamed:@"Button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
    
    // *** Create programmatic Custom Buttons with background images ***
    
    for (int i = 0; i < 3; i++) {
        // Using UIButtonTypeCustom the entire behavior needs to be customized
        UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:customButton];
        [customButton setTitle:@"Press Me" forState:UIControlStateNormal];
        [customButton setContentEdgeInsets:UIEdgeInsetsMake(4, 8, 4, 8)];
        [customButton sizeToFit];
        customButton.center = CGPointMake(200, 100 + 50 * i);
        

        // Button@2x.png is 40x40, for a non-retina it's 20x20 (1/2 resolution)
        // We'll create a resizeable image, and use the insets to get the center of the image. Divide width and height in 2. 20/2 = 10
        if(i > 0) {
            // only set for 2nd and 3rd buttons
            [customButton setBackgroundImage:[[UIImage imageNamed:@"Button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
        }

        //You'll want to use an image for the UIControlStateHighlighted to customize the entire press experience
        if(i > 1) {
            // only set for 3rd button
            [customButton setBackgroundImage:[[UIImage imageNamed:@"ButtonHighlighted.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateHighlighted];
        }
        
        // Set title color, otherwise we have white on white text
        [customButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }

}
- (IBAction)segmentChanged:(id)sender {
//    self.segment.
    NSInteger index = self.segment.selectedSegmentIndex;
    if(index == 1) {
        // Adjusting the tint color, we'll see the changes propogate
        self.view.tintColor = [UIColor redColor];
    } else {
        self.view.tintColor = _defaultTintColor;
    }
}

@end
