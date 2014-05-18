#import "BPGraphView.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BPGraphViewSpec)

describe(@"BPGraphView", ^{
    __block BPGraphView *view;
    __block UIBezierPath *path;

    beforeEach(^{
        path = [[UIBezierPath alloc] init];
        spy_on(path);
        view = [[BPGraphView alloc] initWithFrame:CGRectMake(0, 0, 99.0f, 99.0f) bezierPath:path];
    });

    context(@"-drawRect:", ^{
        beforeEach(^{
            CGFloat scaleFactor = [[UIScreen mainScreen] scale];
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGRect bounds = view.bounds;
            CGContextRef context = CGBitmapContextCreate(NULL,
                                                         bounds.size.width * scaleFactor,
                                                         bounds.size.height * scaleFactor,
                                                         8,
                                                         bounds.size.width * scaleFactor * 4,
                                                         colorSpace,
                                                         (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
            UIGraphicsPushContext(context);
            [view drawRect:bounds];
            UIGraphicsPopContext();
            CFRelease(colorSpace);
            CFRelease(context);
        });

        it(@"should add the points to the bezier path", ^{
            for (CGFloat i = 0.f; i < 10.f; ++i) {
                CGPoint point = CGPointMake(i * 20.f + 10.f, i * 20.f + 10.f);
                [path containsPoint:point] should be_truthy;
            }
            [path containsPoint:CGPointMake(250.f, 250.f)] should_not be_truthy;
        });

        it(@"should draw the bezier path", ^{
            path should have_received(@selector(stroke));
            path should have_received(@selector(fill));
        });
    });
});

SPEC_END
