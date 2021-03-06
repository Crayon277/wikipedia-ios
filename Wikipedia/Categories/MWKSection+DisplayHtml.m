//  Created by Monte Hurd on 5/31/14.
//  Copyright (c) 2013 Wikimedia Foundation. Provided under MIT-style license; please copy and modify!

#import "MWKSection+DisplayHtml.h"
#import "SessionSingleton.h"
#import "Defines.h"

static NSString* const MWKSectionDisambigAndPageIssuesPlaceholderDiv = @"<div class='issues_container' id='issues_container'><a href='#issues_container_close_button' id='issues_container_close_button' style='float:right;'>X</a></div>";

@implementation MWKSection (DisplayHtml)

- (NSString*)displayHTML:(NSString*)html {
    BOOL isMainPage = [SessionSingleton sharedInstance].currentArticle.isMain;

    return [NSString stringWithFormat:
            @"<div id='section_heading_and_content_block_%d'>%@<div id='content_block_%d' class='content_block'>%@%@</div></div>",
            self.sectionId,
            (isMainPage ? @"" : [self getHeaderTag]),
            self.sectionId,
            (([self isLeadSection]) && !isMainPage) ? [self getEditPencilAnchor] : @"",
            html
    ];
}

- (NSString*)getHeaderTag {
    NSString* pencilAnchor = [self getEditPencilAnchor];
    if ([self isLeadSection]) {
        return [NSString stringWithFormat:
                @"<h1 class='section_heading' id='%@' sectionId='%d'>%@</h1>%@",
                self.anchor,
                self.sectionId,
                self.title.text,
                MWKSectionDisambigAndPageIssuesPlaceholderDiv];
    } else {
        short headingTagSize = [self getHeadingTagSize];
        return [NSString stringWithFormat:
                @"<h%d class='section_heading' data-id='%d' id='%@'>%@%@</h%d>",
                headingTagSize,
                self.sectionId,
                self.anchor,
                self.line,
                pencilAnchor,
                headingTagSize];
    }
}

- (short)getHeadingTagSize {
    return WMFStrictClamp(1, self.level.integerValue, 6);
}

- (NSString*)getEditPencilAnchor {
    return [NSString stringWithFormat:
            @"<a class='edit_section_button' data-action='edit_section' data-id='%d' id='edit_section_button_%d'></a>",
            self.sectionId,
            self.sectionId];
}

@end
