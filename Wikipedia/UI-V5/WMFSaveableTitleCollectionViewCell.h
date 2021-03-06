
#import <SSDataSources/SSDataSources.h>

@class MWKTitle;
@class MWKSavedPageList;
@class MWKImage;

/**
 *  Base class for cells which represent a title and have save button.
 *
 *  Will also be given the "card" style by applying a white background to its
 *  @c contentView as well as a small shadow.
 */
@interface WMFSaveableTitleCollectionViewCell : SSBaseCollectionCell

/**
 *  Title associated with the receiver.
 *
 *  Setting this property updates both the @c titleLabel and @c saveButton states.
 */
@property (copy, nonatomic) MWKTitle* title;

/**
 *  The list to observe for changes to the saved state of the receiver's @c title.
 *
 *  @param savedPageList A saved page list which is mutated on the main thread.
 */
- (void)setSavedPageList:(MWKSavedPageList*)savedPageList;

- (void)setImageURL:(NSURL*)imageURL;

- (void)setImage:(MWKImage*)image;

@end
