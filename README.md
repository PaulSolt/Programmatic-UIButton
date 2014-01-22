Programmatic UIButton
===============

Learn how to create UIButton in code on iOS 7 with Default and Custom Behaviors.

If you're working on a game or want to still add a little embellishment (like me) then you're going to need to learn how to wrangle buttons on iOS 7.0. Adding buttons to the Interface Builder is easy, but when you first try to create a UIButton in code it's challenging. There's some hidden steps, or steps you might forget after you get accustomed to Auto Layout.

There's really three options for creating the UIButton. You can create the standard iOS 7 button, a modified iOS 7 button, or a custom button (more work). Apple recommends that you don't add subviews to the UIButton, but it is possible, and it's something we're doing in Bomb Dodge.

Animation Preview
---------------

The animation illustrates the standard button and it's size on the left. On the top right a custom button is created that behaves like an iOS 7 button with the fade, and on the bottom right you can see the progression through totally custom buttons.

![Programmatic UIButton](https://raw2.github.com/PaulSolt/Programmatic-UIButton/master/CustomUIButton/ProgrammaticUIButton.gif)

iOS 7 Programmatic Button
---------------

This code will create a custom button that will fade out like iOS 7 buttons, but has a background image.

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
