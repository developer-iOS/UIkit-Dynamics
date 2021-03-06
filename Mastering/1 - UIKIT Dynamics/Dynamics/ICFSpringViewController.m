//
//  ICFAttachmentsViewController.m
//  Dynamics
//
//  Created by Kyle Richter on 7/14/13.
//  Copyright (c) 2013 Kyle Richter. All rights reserved.
//

#import "ICFSpringViewController.h"

@interface ICFSpringViewController ()

@end

@implementation ICFSpringViewController

@synthesize attachmentBehavior;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[dragonImageView, frogImageView]];
//    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[dragonImageView]];

    CGPoint frogCenter = CGPointMake(frogImageView.center.x, frogImageView.center.y);

    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:dragonImageView attachedToAnchor:frogCenter];
    [self.attachmentBehavior setFrequency:1.0f];
    [self.attachmentBehavior setDamping:0.0f];
    [self.attachmentBehavior setLength: 200.0f];
    
//    [collisionBehavior setCollisionMode: UICollisionBehaviorModeBoundaries];
//    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    
//    [animator addBehavior:gravityBeahvior];
//    [animator addBehavior:collisionBehavior];
    [animator addBehavior:self.attachmentBehavior];

}

-(IBAction)handleAttachmentGesture:(UIPanGestureRecognizer*)gesture
{
    CGPoint gesturePoint = [gesture locationInView:self.view];
    
    [self.attachmentBehavior setAnchorPoint:gesturePoint];
    frogImageView.center = gesturePoint;
}



@end
