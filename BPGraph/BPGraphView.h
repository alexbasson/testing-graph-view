#import <UIKit/UIKit.h>

@interface BPGraphView : UIView

@property (nonatomic, strong, readonly) UIBezierPath *path;

- (instancetype)initWithFrame:(CGRect)frame bezierPath:(UIBezierPath *)path;

@end
