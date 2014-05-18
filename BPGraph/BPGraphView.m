#import "BPGraphView.h"

@interface BPGraphView ()
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, strong, readwrite) UIBezierPath *path;
@end

@implementation BPGraphView

- (instancetype)initWithFrame:(CGRect)frame bezierPath:(UIBezierPath *)path {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.path = path;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint point = [self.points[0] CGPointValue];
    [self.path moveToPoint:point];
    for (NSValue *value in _points) {
        point = [value CGPointValue];
        [self drawCircleInPath:self.path atPoint:point];
    }

    [self.path setLineWidth:2.0f];
    [[UIColor redColor] setStroke];
    [[UIColor grayColor] setFill];
    [self.path stroke];
    [self.path fill];
}

- (void)drawCircleInPath:(UIBezierPath *)path atPoint:(CGPoint)point {
    [path moveToPoint:point];

    CGFloat radius = 5.f;
    [path addArcWithCenter:point radius:radius startAngle:0.f endAngle:M_PI * 2.f clockwise:YES];
}

#pragma mark - Accessors

- (NSArray *)points {
    if (!_points) {
        NSMutableArray *points = [NSMutableArray array];
        for (CGFloat i = 0.f; i < 10.f; ++i) {
            [points addObject:[NSValue valueWithCGPoint:CGPointMake(i * 20.f + 10.f, i * 20.f + 10.f)]];
        }
        _points = [points copy];
    }
    return _points;
}

@end
