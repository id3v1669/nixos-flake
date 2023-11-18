{ config, lib, pkgs, ... }: {
  home.file.".config/telegram/colors.tdesktop-theme" = {
    executable = false;
    text = ''
 windowBg: #${config.colorScheme.colors.base00}; // white: fallback for background
windowFg: #${config.colorScheme.colors.base06}; // black: fallback for text
windowBgOver: #${config.colorScheme.colors.base04}; // light gray: fallback for background with mouse over
windowBgRipple: #${config.colorScheme.colors.base05}; // darker gray: fallback for ripple effect
windowFgOver: #${config.colorScheme.colors.base01}; // black: fallback for text with mouse over
windowSubTextFg: #${config.colorScheme.colors.base06}; // gray: fallback for additional text
windowSubTextFgOver: #ff0000; // darker gray: fallback for additional text with mouse over
windowBoldFg: #${config.colorScheme.colors.base05}; // dark gray: fallback for bold text
windowBoldFgOver: #${config.colorScheme.colors.base06}; // dark gray: fallback for bold text with mouse over
windowBgActive: #${config.colorScheme.colors.base05}; // bright blue: fallback for blue filled active areas
windowFgActive: #${config.colorScheme.colors.base06}; // white: fallback for text on active areas
windowActiveTextFg: #${config.colorScheme.colors.base05}; // online blue: fallback for active text like online status
windowShadowFg: #${config.colorScheme.colors.base0C}; // black: fallback for shadow
windowShadowFgFallback: #ff0000; // gray: fallback for shadow without opacity
shadowFg: #04080e56; // most shadows (including opacity)
slideFadeOutBg: #0000003c; // slide animation (chat to profile) fade out filling
slideFadeOutShadowFg: windowShadowFg; // slide animation (chat to profile) fade out right section shadow
imageBg: #ff0000; // image background fallback (when photo size is less than minimum allowed)
imageBgTransparent: #ff0000; // image background when displaying an image with opacity where no opacity is needed
activeButtonBg: #${config.colorScheme.colors.base0D}; // default active button background
activeButtonBgOver: #${config.colorScheme.colors.base04}; // default active button background with mouse over
activeButtonBgRipple: #${config.colorScheme.colors.base04}; // default active button ripple effect
activeButtonFg: #${config.colorScheme.colors.base01}; // default active button text
activeButtonFgOver: #${config.colorScheme.colors.base01}; // default active button text with mouse over
activeButtonSecondaryFg: #9abfe7; // default active button additional text (selected messages counter in forward / delete buttons)
activeButtonSecondaryFgOver: activeButtonSecondaryFg; // default active button additional text with mouse over
activeLineFg: #6396cb; // default active line (like code input field bottom border when you log in and field is focused)
activeLineFgError: #ef5959; // default active line for error state (like code input field bottom border when you log in and you've entered incorrect code)
lightButtonBg: #${config.colorScheme.colors.base02}; // default light button background (like buttons in boxes)
lightButtonBgOver: #${config.colorScheme.colors.base03}; // default light button background with mouse over
lightButtonBgRipple: #223143; // default light button ripple effect
lightButtonFg: #${config.colorScheme.colors.base05}; // default light button text
lightButtonFgOver: lightButtonFg; // default light button text with mouse over
attentionButtonFg: #ec3942; // default attention button text (like confirm button on log out)
attentionButtonFgOver: #ec3942; // default attention button text with mouse over
attentionButtonBgOver: #592a2a64; // default attention button background with mouse over
attentionButtonBgRipple: #68323264; // default attention button ripple effect
outlineButtonBg: windowBg; // default left outlined button background (like shared media links in profiles)
outlineButtonBgOver: #202b37; // default left outlined button background with mouse over
outlineButtonOutlineFg: #3983c3; // default left outlined button left outline border
outlineButtonBgRipple: #27323f; // default left outlined button ripple effect
menuBg: #${config.colorScheme.colors.base02}; // default popup menu background
menuBgOver: #${config.colorScheme.colors.base06}; // default popup menu item background with mouse over
menuBgRipple: #1f2934; // default popup menu item ripple effect
menuIconFg: #6c7883; // default popup menu item icon (like main menu)
menuIconFgOver: #${config.colorScheme.colors.base01}; // default popup menu item icon with mouse over
menuSubmenuArrowFg: #637c95; // default popup menu submenu arrow icon (like in message field context menu in case of RTL system language)
menuFgDisabled: #3d4e5c; // default popup menu item disabled text (like unavailable items in message field context menu)
menuSeparatorFg: #232f39; // default popup menu separator (like in message field context menu)
scrollBarBg: #${config.colorScheme.colors.base06}53; // default scroll bar current rectangle, the bar itself (like in chats list)
scrollBarBgOver: #${config.colorScheme.colors.base06}7a; // default scroll bar current rectangle with mouse over it
scrollBg: #${config.colorScheme.colors.base05}5a; // default scroll bar background
scrollBgOver: #${config.colorScheme.colors.base06}2c; // default scroll bar background with mouse over the scroll bar
smallCloseIconFg: #55616c; // small X icon (like in Show all sessions box to the right for sessions termination)
smallCloseIconFgOver: #a3a3a3; // small X icon with mouse over
radialFg: windowFgActive; // default radial loader line (like in Media Viewer when loading a photo)
radialBg: #00000056; // default radial loader background (like in Media Viewer when loading a photo)
placeholderFg: #${config.colorScheme.colors.base05}; // default input field placeholder when field is not focused (like in phone input field when you log in)
placeholderFgActive: #4f5b67; // default input field placeholder when field is focused
inputBorderFg: #313c49; // default input field bottom border (like in code input field when you log in and field is not focused)
filterInputBorderFg: #${config.colorScheme.colors.base01}; // default rounded input field border (like in chats list search field when field is focused)
filterInputInactiveBg: #${config.colorScheme.colors.base01}; // default rounded input field background (like in chats list search field when field is inactive)
checkboxFg: #4f6276; // default unchecked checkbox rounded rectangle (and also emoji category icons)
sliderBgInactive: #364554; // default slider not active bar (like in Settings when you choose interface scale or custom notifications count)
sliderBgActive: #4a81bc; // default slider active bar (like in Settings when you choose interface scale or custom notifications count)
tooltipBg: #${config.colorScheme.colors.base01}; // tooltip background (like when you put mouse over the message timestamp and wait)
tooltipFg: #d4e0ea; // tooltip text
tooltipBorderFg: #${config.colorScheme.colors.base01}; // tooltip border
titleShadow: #00000000; // one pixel line shadow at the bottom of custom window title
titleBg: #${config.colorScheme.colors.base01}; // custom window title background when window is inactive
titleBgActive: #${config.colorScheme.colors.base01}; // custom window title background when window is active
titleButtonBg: titleBg; // custom window title minimize/maximize/restore button background when window is inactive (Windows only)
titleButtonFg: #576673; // custom window title minimize/maximize/restore button icon when window is inactive (Windows only)
titleButtonBgOver: #25303e; // custom window title minimize/maximize/restore button background with mouse over when window is inactive (Windows only)
titleButtonFgOver: #e0e0e0; // custom window title minimize/maximize/restore button icon with mouse over when window is inactive (Windows only)
titleButtonBgActive: #${config.colorScheme.colors.base01}; // custom window title minimize/maximize/restore button background when window is active (Windows only)
titleButtonFgActive: titleButtonFg; // custom window title minimize/maximize/restore button icon when window is active (Windows only)
titleButtonBgActiveOver: #2c3847; // custom window title minimize/maximize/restore button background with mouse over when window is active (Windows only)
titleButtonFgActiveOver: titleButtonFgOver; // custom window title minimize/maximize/restore button icon with mouse over when window is active (Windows only)
titleButtonCloseBg: titleButtonBg; // custom window title close button background when window is inactive (Windows only)
titleButtonCloseFg: titleButtonFg; // custom window title close button icon when window is inactive (Windows only)
titleButtonCloseBgOver: #e92539; // custom window title close button background with mouse over when window is inactive (Windows only)
titleButtonCloseFgOver: windowFgActive; // custom window title close button icon with mouse over when window is inactive (Windows only)
titleButtonCloseBgActive: #${config.colorScheme.colors.base01}; // custom window title close button background when window is active (Windows only)
titleButtonCloseFgActive: titleButtonCloseFg; // custom window title close button icon when window is active (Windows only)
titleButtonCloseBgActiveOver: #${config.colorScheme.colors.base08}; // custom window title close button background with mouse over when window is active (Windows only)
titleButtonCloseFgActiveOver: titleButtonCloseFgOver; // custom window title close button icon with mouse over when window is active (Windows only)
titleFg: #6a7680; // custom window title text when window is inactive (macOS only)
titleFgActive: #91a3b3; // custom window title text when window is active (macOS only)
trayCounterBg: #${config.colorScheme.colors.base08}; // tray icon counter background
trayCounterBgMute: #888888; // tray icon counter background if all unread messages are muted
trayCounterFg: #${config.colorScheme.colors.base06}; // tray icon counter text
trayCounterBgMacInvert: #${config.colorScheme.colors.base06}; // tray icon counter background when tray icon is pressed or when dark theme of macOS is used (macOS only)
trayCounterFgMacInvert: #${config.colorScheme.colors.base06}01; // tray icon counter text when tray icon is pressed or when dark theme of macOS is used (macOS only)
layerBg: #0000007f; // box and main menu background layer fade
cancelIconFg: #737e87; // default for settings close icon and box search cancel icon
cancelIconFgOver: #dcdcdc; // default for settings close icon and box search cancel icon with mouse over
boxBg: #${config.colorScheme.colors.base02}; // box background
boxTextFg: windowFg; // box text
boxTextFgGood: #5598db; // accepted box text (like when choosing username that is not occupied)
boxTextFgError: #${config.colorScheme.colors.base08}; // rejecting box text (like when choosing username that is occupied)
boxTitleFg: #ebebeb; // box title text
boxSearchBg: #${config.colorScheme.colors.base01}; // box search field background (like in contacts box)
boxTitleAdditionalFg: #6d7f8f; // box title additional text (like in create group box when you see chosen members count)
boxTitleCloseFg: cancelIconFg; // settings close icon and box search cancel icon (like in contacts box)
boxTitleCloseFgOver: cancelIconFgOver; // settings close icon and box search cancel icon (like in contacts box) with mouse over
membersAboutLimitFg: #677a8b; // text in channel members box about the limit (max 200 last members are shown)
contactsBg: #${config.colorScheme.colors.base00}; // contacts (and some other) box row background
contactsBgOver: #${config.colorScheme.colors.base01}; // contacts (and some other) box row background with mouse over
contactsNameFg: boxTextFg; // contacts (and some other) box row name text
contactsStatusFg: #677a8b; // contacts (and some other) box row additional text (like last seen stamp)
contactsStatusFgOver: #677a8b; // contacts (and some other) box row additional text (like last seen stamp) with mouse over
contactsStatusFgOnline: #559be0; // contacts (and some other) box row active additional text (like online status)
photoCropFadeBg: layerBg; // avatar crop box fade background (when choosing a new photo in Settings or for a group)
photoCropPointFg: #${config.colorScheme.colors.base06}7f; // avatar crop box corner rectangles (when choosing a new photo in Settings or for a group)
callArrowFg: #49a2f0; // received phone call arrow (in calls list box)
callArrowMissedFg: #${config.colorScheme.colors.base08}; // missed phone call arrow (in calls list box)
introBg: windowBg; // login background
introTitleFg: #eeeeee; // login title text
introDescriptionFg: #72879b; // login description text
introErrorFg: #${config.colorScheme.colors.base08}; // login error text (like when providing a wrong log in code)
introCoverTopBg: #124a82; // intro gradient top (from)
introCoverBottomBg: #23659f; // intro gradient bottom (to)
introCoverIconsFg: #3b7cbd; // intro cloud graphics
introCoverPlaneTrace: #3870a8; // intro plane traces
introCoverPlaneInner: #ced9e2; // intro plane part
introCoverPlaneOuter: #97a9b5; // intro plane part
introCoverPlaneTop: #${config.colorScheme.colors.base06}; // intro plane part
dialogsMenuIconFg: menuIconFg; // main menu and lock telegram icon
dialogsMenuIconFgOver: menuIconFgOver; // main menu and lock telegram icon with mouse over
dialogsBg: windowBg; // chat list background
dialogsNameFg: #f5f5f5; // chat list name text
dialogsChatIconFg: dialogsNameFg; // chat list group or channel icon
dialogsDateFg: #8696a8; // chat list date text
dialogsTextFg: #7f91a4; // chat list message text
dialogsTextFgService: #73b9f5; // chat list group sender name text (or media message type text)
dialogsDraftFg: #${config.colorScheme.colors.base08}; // chat list draft label
dialogsVerifiedIconBg: #6ab3f3; // chat list verified icon background
dialogsVerifiedIconFg: #${config.colorScheme.colors.base02}; // chat list verified icon check
dialogsSendingIconFg: #647d96; // chat list sending message icon (clock)
dialogsSentIconFg: #72bcfd; // chat list sent message tick / double tick icon
dialogsUnreadBg: #4082bc; // chat list unread badge background for not muted chat
dialogsUnreadBgMuted: #3e546a; // chat list unread badge background for muted chat
dialogsUnreadFg: #${config.colorScheme.colors.base06}; // chat list unread badge text
dialogsBgOver: #${config.colorScheme.colors.base04}; // chat list background with mouse over
dialogsOnlineBadgeFg: #63b6ff; // chat list online status
dialogsNameFgOver: windowBoldFgOver; // chat list name text with mouse over
dialogsChatIconFgOver: dialogsNameFgOver; // chat list group or channel icon with mouse over
dialogsDateFgOver: #8495a9; // chat list date text with mouse over
dialogsTextFgOver: #91a3b5; // chat list message text with mouse over
dialogsTextFgServiceOver: #73b9f5; // chat list group sender name text with mouse over
dialogsDraftFgOver: dialogsDraftFg; // chat list draft label with mouse over
dialogsVerifiedIconBgOver: #6ab3f3; // chat list verified icon background with mouse over
dialogsVerifiedIconFgOver: dialogsVerifiedIconFg; // chat list verified icon check with mouse over
dialogsSendingIconFgOver: dialogsSendingIconFg; // chat list sending message icon (clock) with mouse over
dialogsSentIconFgOver: #72bcfd; // chat list sent message tick / double tick icon with mouse over
dialogsUnreadBgOver: #4082bc; // chat list unread badge background for not muted chat with mouse over
dialogsUnreadBgMutedOver: #4d5762; // chat list unread badge background for muted chat with mouse over
dialogsUnreadFgOver: dialogsUnreadFg; // chat list unread badge text with mouse over
dialogsBgActive: #${config.colorScheme.colors.base04}; // chat list background for current (active) chat
dialogsNameFgActive: windowFgActive; // chat list name text for current (active) chat
dialogsChatIconFgActive: dialogsNameFgActive; // chat list group or channel icon for current (active) chat
dialogsDateFgActive: windowFgActive; // chat list date text for current (active) chat
dialogsTextFgActive: windowFgActive; // chat list message text for current (active) chat
dialogsTextFgServiceActive: dialogsTextFgActive; // chat list group sender name text for current (active) chat
dialogsDraftFgActive: #a9caf0; // chat list draft label for current (active) chat
dialogsVerifiedIconBgActive: dialogsTextFgActive; // chat list verified icon background for current (active) chat
dialogsVerifiedIconFgActive: dialogsBgActive; // chat list verified icon check for current (active) chat
dialogsSendingIconFgActive: #${config.colorScheme.colors.base06}99; // chat list sending message icon (clock) for current (active) chat
dialogsSentIconFgActive: dialogsTextFgActive; // chat list sent message tick / double tick icon for current (active) chat
dialogsUnreadBgActive: dialogsTextFgActive; // chat list unread badge background for not muted chat for current (active) chat
dialogsUnreadBgMutedActive: #7aa3ca; // chat list unread badge background for muted chat for current (active) chat
dialogsUnreadFgActive: #2a5378; // chat list unread badge text for current (active) chat
dialogsOnlineBadgeFgActive: #${config.colorScheme.colors.base06}; // chat list online status for current (active) chat
dialogsRippleBg: #25313d; // 
dialogsRippleBgActive: #315a80; // 
dialogsForwardBg: dialogsBgActive; // forwarding panel background (when forwarding messages in the smallest window size)
dialogsForwardFg: dialogsNameFgActive; // forwarding panel text (when forwarding messages in the smallest window size)
searchedBarBg: #${config.colorScheme.colors.base04}; // search results bar background (in chats list, contacts box..)
searchedBarFg: #8c98a4; // search results bar text (in chats list, contacts box..)
topBarBg: #${config.colorScheme.colors.base02}; // top bar background (in chat view, media overview..)
emojiPanBg: windowBg; // emoji panel background
emojiPanCategories: #${config.colorScheme.colors.base02}; // emoji panel categories background
emojiPanHeaderFg: #7c8d9e; // emoji panel section header text
emojiPanHeaderBg: #${config.colorScheme.colors.base06}f2; // emoji panel section header background
stickerPanDeleteBg: #000000cc; // delete X button background for custom sent stickers in stickers panel (legacy)
stickerPanDeleteFg: windowFgActive; // delete X button icon for custom sent stickers in stickers panel (legacy)
stickerPreviewBg: #000000b0; // sticker and GIF preview background (when you press and hold on a sticker)
historyTextInFg: windowFg; // inbox message text
historyTextInFgSelected: #${config.colorScheme.colors.base06}; // inbox message selected text or text in a selected message
historyTextOutFg: #e4ecf2; // outbox message text
historyTextOutFgSelected: #${config.colorScheme.colors.base06}; // outbox message selected text or text in a selected message
historyLinkInFg: #70baf5; // inbox message link
historyLinkInFgSelected: #aadcff; // inbox message link in a selected text or message
historyLinkOutFg: #83caff; // outbox message link
historyLinkOutFgSelected: #aadcff; // outbox message link in a selected text or message
historyFileNameInFg: historyTextInFg; // inbox media filename text
historyFileNameInFgSelected: #${config.colorScheme.colors.base06}; // inbox media filename text in a selected message
historyFileNameOutFg: historyTextOutFg; // outbox media filename text
historyFileNameOutFgSelected: #${config.colorScheme.colors.base06}; // outbox media filename text in a selected message
historyOutIconFg: #6bbfff; // outbox message tick / double tick icon
historyOutIconFgSelected: #${config.colorScheme.colors.base06}; // outbox message tick / double tick icon in a selected message
historyIconFgInverted: #${config.colorScheme.colors.base06}e5; // media message tick / double tick icon (like in sent photo)
historySendingOutIconFg: #70a4d2; // outbox sending message icon (clock)
historySendingInIconFg: #76838b; // inbox sending message icon (clock) (like in sent messages to yourself or in sent messages to a channel)
historySendingInvertedIconFg: #${config.colorScheme.colors.base06}c8; // media sending message icon (clock) (like in sent photo)
historyCallArrowInFg: #5093d6; // received phone call arrow
historyCallArrowInFgSelected: #${config.colorScheme.colors.base06}; // received phone call arrow in a selected message
historyCallArrowMissedInFg: callArrowMissedFg; // missed phone call arrow
historyCallArrowMissedInFgSelected: #${config.colorScheme.colors.base06}; // missed phone call arrow in a selected message
historyCallArrowOutFg: #${config.colorScheme.colors.base06}; // outgoing phone call arrow
historyCallArrowOutFgSelected: #${config.colorScheme.colors.base06}; // outgoing phone call arrow
historyUnreadBarBg: #182433; // new unread messages bar background
historyUnreadBarBorder: #03080d00; // new unread messages bar shadow
historyUnreadBarFg: #${config.colorScheme.colors.base06}; // new unread messages bar text
historyForwardChooseBg: #0000004c; // forwarding messages in a large window size "choose recipient" background
historyForwardChooseFg: windowFgActive; // forwarding messages in a large window size "choose recipient" text
historyPeer1NameFg: #${config.colorScheme.colors.base08}; // red group member name
historyPeer1NameFgSelected: #${config.colorScheme.colors.base06}; // red group member name in a selected message
historyPeer1UserpicBg: #ff845e; // red userpic background
historyPeer2NameFg: #85de85; // green group member name
historyPeer2NameFgSelected: #${config.colorScheme.colors.base06}; // green group member name in a selected message
historyPeer2UserpicBg: #9ad164; // green userpic background
historyPeer3NameFg: #f3bc5c; // yellow group member name
historyPeer3NameFgSelected: #${config.colorScheme.colors.base06}; // yellow group member name in a selected message
historyPeer3UserpicBg: #e5ca77; // yellow userpic background (actually unused)
historyPeer4NameFg: #65bdf3; // blue group member name
historyPeer4NameFgSelected: #${config.colorScheme.colors.base06}; // blue group member name in a selected message
historyPeer4UserpicBg: #5caffa; // blue userpic background
historyPeer5NameFg: #b48bf2; // purple group member name
historyPeer5NameFgSelected: #${config.colorScheme.colors.base06}; // purple group member name in a selected message
historyPeer5UserpicBg: #b694f9; // purple userpic background
historyPeer6NameFg: #ff5694; // pink group member name
historyPeer6NameFgSelected: #${config.colorScheme.colors.base06}; // pink group member name in a selected message
historyPeer6UserpicBg: #ff8aac; // pink userpic background
historyPeer7NameFg: #62d4e3; // sea group member name
historyPeer7NameFgSelected: #${config.colorScheme.colors.base06}; // sea group member name in a selected message
historyPeer7UserpicBg: #5bcbe3; // sea userpic background
historyPeer8NameFg: #faa357; // orange group member name
historyPeer8NameFgSelected: #${config.colorScheme.colors.base06}; // orange group member name in a selected message
historyPeer8UserpicBg: #febb5b; // orange userpic background
historyPeerUserpicFg: windowFgActive; // default userpic initials
historyPeer1UserpicBg2: #${config.colorScheme.colors.base08}; // the second red userpic background
historyPeer2UserpicBg2: #46ba43; // the second green userpic background
historyPeer3UserpicBg2: #e5ca77; // the second yellow userpic background (actually unused)
historyPeer4UserpicBg2: #408acf; // the second blue userpic background
historyPeer5UserpicBg2: #6c61df; // the second purple userpic background
historyPeer6UserpicBg2: #d95574; // the second pink userpic background
historyPeer7UserpicBg2: #359ad4; // the second sea userpic background
historyPeer8UserpicBg2: #f68136; // the second orange userpic background
historyPeerSavedMessagesBg2: historyPeer4UserpicBg2; // the second saved messages userpic background
historyScrollBarBg: #7f84897a; // scroll bar current rectangle, the bar itself in the chat view (adjusted)
historyScrollBarBgOver: #64686cbc; // scroll bar current rectangle with mouse over it in the chat view (adjusted)
historyScrollBg: #565a5e4c; // scroll bar background (adjusted)
historyScrollBgOver: #5a5d616b; // scroll bar background with mouse over the scroll bar (adjusted)
msgInBg: #${config.colorScheme.colors.base02}; // inbox message background
msgInBgSelected: #2e70a5; // inbox selected message background (and background of selected text in those messages)
msgOutBg: #${config.colorScheme.colors.base04}; // outbox message background
msgOutBgSelected: #2e70a5; // outbox selected message background (and background of selected text in those messages)
msgSelectOverlay: #3585d44c; // overlay which is filling the media parts of selected messages (like in selected photo message)
msgStickerOverlay: #3585d47f; // overlay which is filling the selected sticker message
msgInServiceFg: #71bafa; // inbox message information text (like information about a forwarded message original sender)
msgInServiceFgSelected: #${config.colorScheme.colors.base06}; // inbox selected message information text (like information about a forwarded message original sender)
msgOutServiceFg: #90caff; // outbox message information text (like information about a forwarded message original sender)
msgOutServiceFgSelected: #${config.colorScheme.colors.base06}; // outbox message information text (like information about a forwarded message original sender)
msgInShadow: #748ea200; // inbox message shadow (below the bubble)
msgInShadowSelected: #538ebb00; // inbox selected message shadow (below the bubble)
msgOutShadow: #00000000; // outbox message shadow (below the bubble)
msgOutShadowSelected: #366ea600; // outbox selected message shadow (below the bubble)
msgInDateFg: #6d7f8f; // inbox message time text
msgInDateFgSelected: #${config.colorScheme.colors.base06}; // inbox selected message time text
msgOutDateFg: #7da8d3; // outbox message time text
msgOutDateFgSelected: #${config.colorScheme.colors.base06}; // outbox selected message time text
msgServiceFg: windowFgActive; // service message text (like date dividers or service message about the group title being changed)
msgServiceBg: #${config.colorScheme.colors.base00}; // service message background (like in a service message about group title being changed) (adjusted)
msgServiceBgSelected: #2e7ab4; // service message selected text background (like in a service message about group title being changed) (adjusted)
msgInReplyBarColor: #429bdb; // inbox message reply outline
msgInReplyBarSelColor: #${config.colorScheme.colors.base06}; // inbox selected message reply outline
msgOutReplyBarColor: #65b9f4; // outbox message reply outline
msgOutReplyBarSelColor: #${config.colorScheme.colors.base06}; // outbox selected message reply outline
msgImgReplyBarColor: msgServiceFg; // sticker message reply outline
msgInMonoFg: #5a8cb7; // inbox message monospace text (like a message sent with `test` text)
msgOutMonoFg: #aed1f3; // outbox message monospace text
msgInMonoFgSelected: #a3cdf7; // inbox message monospace text in a selected text or message
msgOutMonoFgSelected: #a3cdf7; // outbox message monospace text in a selected text or message
msgDateImgFg: #${config.colorScheme.colors.base06}f2; // media message time text (like time text in a sent photo)
msgDateImgBg: #00000054; // media message time bubble background (like time bubble in a sent photo) or file with thumbnail download icon circle background
msgDateImgBgOver: #00000074; // media message download icon circle background with mouse over (like file with thumbnail download icon)
msgDateImgBgSelected: #204f7887; // selected media message time bubble background
msgFileThumbLinkInFg: lightButtonFg; // inbox media file message with thumbnail download / open with button text
msgFileThumbLinkInFgSelected: #${config.colorScheme.colors.base06}; // inbox selected media file message with thumbnail download / open with button text
msgFileThumbLinkOutFg: #6c9ecf; // outbox media file message with thumbnail download / open with button text
msgFileThumbLinkOutFgSelected: #${config.colorScheme.colors.base06}; // outbox selected media file message with thumbnail download / open with button text
msgFileInBg: #3f96d0; // inbox audio file download circle background
msgFileInBgOver: #489ed7; // inbox audio file download circle background with mouse over
msgFileInBgSelected: #6ab4f4; // inbox selected audio file download circle background
msgFileOutBg: #4c9ce2; // outbox audio file download circle background
msgFileOutBgOver: #54a4e9; // outbox audio file download circle background with mouse over
msgFileOutBgSelected: #58abf3; // outbox selected audio file download circle background
msgFile1Bg: #3e7eba; // blue shared links / files without image square thumbnail
msgFile1BgDark: #24679e; // blue shared files without image download circle background
msgFile1BgOver: #1d5e93; // blue shared files without image download circle background with mouse over
msgFile1BgSelected: #${config.colorScheme.colors.base06}; // blue shared files without image download circle background if file is selected
msgFile2Bg: #3ea34a; // green shared links / shared files without image square thumbnail
msgFile2BgDark: #298835; // green shared files without image download circle background
msgFile2BgOver: #1b7725; // green shared files without image download circle background with mouse over
msgFile2BgSelected: #1b7725; // green shared files without image download circle background if file is selected
msgFile3Bg: #d6454c; // red shared links / shared files without image square thumbnail
msgFile3BgDark: #bf333a; // red shared files without image download circle background
msgFile3BgOver: #b2282f; // red shared files without image download circle background with mouse over
msgFile3BgSelected: #b2282f; // red shared files without image download circle background if file is selected
msgFile4Bg: #d99546; // yellow shared links / shared files without image square thumbnail
msgFile4BgDark: #c17d39; // yellow shared files without image download circle background
msgFile4BgOver: #ac6b29; // yellow shared files without image download circle background with mouse over
msgFile4BgSelected: #ac6b29; // yellow shared files without image download circle background if file is selected
historyFileInIconFg: #${config.colorScheme.colors.base06}; // inbox file without thumbnail (like audio file) download arrow icon
historyFileInIconFgSelected: #${config.colorScheme.colors.base06}; // inbox selected file without thumbnail (like audio file) download arrow icon
historyFileInRadialFg: #${config.colorScheme.colors.base06}; // inbox file without thumbnail (like audio file) radial download animation line
historyFileInRadialFgSelected: historyFileInIconFgSelected; // inbox selected file without thumbnail (like audio file) radial download animation line
historyFileOutIconFg: #${config.colorScheme.colors.base06}; // outbox file without thumbnail (like audio file) download arrow icon
historyFileOutIconFgSelected: #${config.colorScheme.colors.base06}; // outbox selected file without thumbnail (like audio file) download arrow icon
historyFileOutRadialFg: #${config.colorScheme.colors.base06}; // outbox file without thumbnail (like audio file) radial download animation line
historyFileOutRadialFgSelected: #${config.colorScheme.colors.base06}; // outbox selected file without thumbnail (like audio file) radial download animation line
historyFileThumbIconFg: #efefef; // file with thumbnail (or photo / video) download arrow icon
historyFileThumbIconFgSelected: #${config.colorScheme.colors.base06}; // selected file with thumbnail (or photo / video) download arrow icon
historyFileThumbRadialFg: historyFileThumbIconFg; // file with thumbnail (or photo / video) radial download animation line
historyFileThumbRadialFgSelected: #${config.colorScheme.colors.base06}; // selected file with thumbnail (or photo / video) radial download animation line
historyVideoMessageProgressFg: historyFileThumbIconFg; // radial playback progress in round video messages
msgWaveformInActive: #549cd7; // inbox voice message active waveform lines (like played part of currently playing voice message)
msgWaveformInActiveSelected: #${config.colorScheme.colors.base06}; // inbox selected voice message active waveform lines (like played part of currently playing voice message)
msgWaveformInInactive: #3a4d61; // inbox voice message inactive waveform lines (like upcoming part of currently playing voice message)
msgWaveformInInactiveSelected: #6fa5d4; // inbox selected voice message inactive waveform lines (like upcoming part of currently playing voice message)
msgWaveformOutActive: #62b2fd; // outbox voice message active waveform lines (like played part of currently playing voice message)
msgWaveformOutActiveSelected: #${config.colorScheme.colors.base06}; // outbox selected voice message active waveform lines (like played part of currently playing voice message)
msgWaveformOutInactive: #4b7fb3; // outbox voice message inactive waveform lines (like upcoming part of currently playing voice message)
msgWaveformOutInactiveSelected: #6fa5d4; // outbox selected voice message inactive waveform lines (like upcoming part of currently playing voice message)
msgBotKbOverBgAdd: #80b1db0f; // this is painted over a bot inline keyboard button (which has msgServiceBg background) when mouse is over that button
msgBotKbIconFg: msgServiceFg; // bot inline keyboard button icon in the top-right corner (like in @vote bot when a poll is ready to be shared)
msgBotKbRippleBg: #92c0e50b; // bot inline keyboard button ripple effect
mediaInFg: msgInDateFg; // inbox media message status text (like in file that is being downloaded)
mediaInFgSelected: msgInDateFgSelected; // inbox selected media message status text (like in file that is being downloaded)
mediaOutFg: msgOutDateFg; // outbox media message status text (like in file that is being downloaded)
mediaOutFgSelected: msgOutDateFgSelected; // outbox selected media message status text (like in file that is being downloaded)
youtubePlayIconBg: #e83131c8; // youtube play icon background (when a link to a youtube video with a webpage preview is sent)
youtubePlayIconFg: windowFgActive; // youtube play icon arrow (when a link to a youtube video with a webpage preview is sent)
videoPlayIconBg: #0000007f; // other video play icon background (like when a link to a vimeo video with a webpage preview is sent)
videoPlayIconFg: #${config.colorScheme.colors.base06}; // other video play icon arrow (like when a link to a vimeo video with a webpage preview is sent)
toastBg: #000000b2; // toast notification background (like when you click on your t.me link when editing your username)
toastFg: windowFgActive; // toast notification text (like when you click on your t.me link when editing your username)
reportSpamBg: #363c42; // report spam panel background (like a non contact user writes your for the first time)
reportSpamFg: windowFg; // report spam panel text (when you send a report from that panel)
historyToDownBg: #1d2b3a; // arrow button background (to scroll to the end of the viewed chat)
historyToDownBgOver: #243446; // arrow button background with mouse over
historyToDownBgRipple: #2b3c4f; // arrow button ripple effect
historyToDownFg: #adb4ba; // arrow button icon
historyToDownFgOver: menuIconFgOver; // arrow button icon with mouse over
historyToDownShadow: #00000040; // arrow button shadow
historyComposeAreaBg: #${config.colorScheme.colors.base02}; // history compose area background (message write area / reply information / forwarding information)
historyComposeAreaFg: historyTextInFg; // history compose area text
historyComposeAreaFgService: msgInDateFg; // history compose area text when replying to a media message
historyComposeIconFg: menuIconFg; // history compose area icon (like emoji, attach, bot command..)
historyComposeIconFgOver: menuIconFgOver; // history compose area icon with mouse over
historySendIconFg: windowBgActive; // send message icon
historySendIconFgOver: windowBgActive; // send message icon with mouse over
historyPinnedBg: #${config.colorScheme.colors.base04}; // pinned message area background
historyReplyBg: historyComposeAreaBg; // reply / forward / edit message area background
historyReplyIconFg: windowBgActive; // reply / forward / edit message left icon
historyReplyCancelFg: cancelIconFg; // reply / forward / edit message cancel button
historyReplyCancelFgOver: cancelIconFgOver; // reply / forward / edit message cancel button with mouse over
historyComposeButtonBg: historyComposeAreaBg; // unblock / join channel / mute channel button background
historyComposeButtonBgOver: #1c2835; // unblock / join channel / mute channel button background with mouse over
historyComposeButtonBgRipple: #222f3e; // unblock / join channel / mute channel button ripple effect
overviewCheckBg: #00000040; // shared files / links checkbox background for not selected rows when some rows are selected
overviewCheckFg: #${config.colorScheme.colors.base06}; // shared files / links checkbox icon for not selected rows when some rows are selected
overviewCheckFgActive: #${config.colorScheme.colors.base06}; // shared files / links checkbox icon for selected rows
overviewPhotoSelectOverlay: #3fa2e333; // shared photos / videos / links fill for selected rows
profileStatusFgOver: #677a8b; // group members list in group profile user last seen text with mouse over
profileVerifiedCheckBg: windowBgActive; // profile verified check icon background
profileVerifiedCheckFg: #${config.colorScheme.colors.base06}; // profile verified check icon tick
profileAdminStartFg: #62a9e6; // group members list admin star icon
notificationsBoxMonitorFg: windowFg; // custom notifications settings box monitor color
notificationsBoxScreenBg: dialogsBgActive; // #6389a8; // custom notifications settings box monitor screen background
notificationSampleUserpicFg: windowBgActive; // custom notifications settings box small sample userpic placeholder
notificationSampleCloseFg: #d7d7d7; // custom notifications settings box small sample close button placeholder
notificationSampleTextFg: #d7d7d7; // custom notifications settings box small sample text placeholder
notificationSampleNameFg: #939393; // custom notifications settings box small sample name placeholder
changePhoneSimcardFrom: notificationSampleTextFg; // change phone number box left simcard icon
changePhoneSimcardTo: notificationSampleNameFg; // change phone number box right simcard and plane icons
mainMenuBg: windowBg; // main menu background
mainMenuCoverBg: #276899; // main menu top cover background
mainMenuCoverFg: windowFgActive; // main menu top cover text
mainMenuCloudFg: activeButtonFg; // 
mainMenuCloudBg: #185680; // 
mediaPlayerBg: windowBg; // audio file player background
mediaPlayerActiveFg: windowBgActive; // audio file player playback progress already played part
mediaPlayerInactiveFg: sliderBgInactive; // audio file player playback progress upcoming (not played yet) part with mouse over
mediaPlayerDisabledFg: #9dd1ef; // audio file player loading progress (when you're playing an audio file and switch to the previous one which is not loaded yet)
mediaviewFileBg: windowBg; // file rectangle background (when you view a png file in Media Viewer and go to a previous, not loaded yet, file)
mediaviewFileNameFg: windowFg; // file name in file rectangle
mediaviewFileSizeFg: windowSubTextFg; // file size text in file rectangle
mediaviewFileRedCornerFg: #${config.colorScheme.colors.base08}; // red file thumbnail placeholder corner in file rectangle (for a file without thumbnail, like .pdf)
mediaviewFileYellowCornerFg: #${config.colorScheme.colors.base0A}; // yellow file thumbnail placeholder corner in file rectangle (for a file without thumbnail, like .zip)
mediaviewFileGreenCornerFg: #${config.colorScheme.colors.base0B}; // green file thumbnail placeholder corner in file rectangle (for a file without thumbnail, like .exe)
mediaviewFileBlueCornerFg: #${config.colorScheme.colors.base0D}; // blue file thumbnail placeholder corner in file rectangle (for a file without thumbnail, like .dmg)
mediaviewFileExtFg: activeButtonFg; // file extension text in file thumbnail placeholder in file rectangle
mediaviewMenuBg: #383838; // context menu in Media Viewer background
mediaviewMenuBgOver: #505050; // context menu item background with mouse over
mediaviewMenuBgRipple: #676767; // context menu item ripple effect
mediaviewMenuFg: windowFgActive; // context menu item text
mediaviewBg: #222222eb; // Media Viewer background
mediaviewVideoBg: imageBg; // Media Viewer background when viewing a video in full screen
mediaviewControlBg: #0000003c; // controls background (like next photo / previous photo)
mediaviewControlFg: windowFgActive; // controls icon (like next photo / previous photo)
mediaviewCaptionBg: #11111180; // caption text background (when viewing photo with caption)
mediaviewCaptionFg: mediaviewControlFg; // caption text
mediaviewTextLinkFg: #70baf5; // caption text link
mediaviewSaveMsgBg: toastBg; // save to file toast message background in Media Viewer
mediaviewSaveMsgFg: toastFg; // save to file toast message text
mediaviewPlaybackActive: #c7c7c7; // video playback progress already played part
mediaviewPlaybackInactive: #252525; // video playback progress upcoming (not played yet) part
mediaviewPlaybackActiveOver: #${config.colorScheme.colors.base06}; // video playback progress already played part with mouse over
mediaviewPlaybackInactiveOver: #474747; // video playback progress upcoming (not played yet) part with mouse over
mediaviewPlaybackProgressFg: #${config.colorScheme.colors.base06}c7; // video playback progress text
mediaviewPlaybackIconFg: mediaviewPlaybackActive; // video playback controls icon
mediaviewPlaybackIconFgOver: mediaviewPlaybackActiveOver; // video playback controls icon with mouse over
mediaviewTransparentBg: #${config.colorScheme.colors.base06}; // transparent filling part (when viewing a transparent .png file in Media Viewer)
mediaviewTransparentFg: #cccccc; // another transparent filling part
notificationBg: windowBg; // custom notification window background
callBg: #14191ff5; // phone call popup background
callNameFg: #${config.colorScheme.colors.base06}; // phone call popup name text
callFingerprintBg: #00000066; // phone call popup emoji fingerprint background
callStatusFg: #aaabac; // phone call popup status text
callIconFg: #${config.colorScheme.colors.base06}; // phone call popup answer, hangup and mute mic icon
callAnswerBg: #488fc9; // phone call popup answer button background
callAnswerRipple: #4286c2; // phone call popup answer button ripple effect
callAnswerBgOuter: #3f95eb26; // phone call popup answer button outer ripple effect
callHangupBg: #cc4646; // phone call popup hangup button background
callHangupRipple: #ca4141; // phone call popup hangup button ripple effect
callCancelBg: #${config.colorScheme.colors.base06}; // phone call popup line busy cancel button background
callCancelFg: #536271; // phone call popup line busy cancel button icon
callCancelRipple: #435363; // phone call popup line busy cancel button ripple effect
callMuteRipple: #${config.colorScheme.colors.base06}12; // phone call popup mute mic ripple effect
callBarBg: #366693; // active phone call bar background
callBarMuteRipple: #4b7dab; // active phone call bar mute and hangup button ripple effect
callBarBgMuted: #35495d; // phone call bar with muted mic background
callBarUnmuteRipple: #435b73; // phone call bar with muted mic mute and hangup button ripple effect
callBarFg: dialogsNameFgActive; // phone call bar text and icons
importantTooltipBg: toastBg; //
importantTooltipFg: toastFg; //
importantTooltipFgLink: #65b6fc; //
filterInputActiveBg: #${config.colorScheme.colors.base04}; // default rounded input field active background (like in chats list search field when field is focused)
botKbBg: #${config.colorScheme.colors.base01}; // bot keyboard button background
botKbDownBg: #2d3a49; // bot keyboard button ripple effect
emojiIconFg: #6c7883; // emoji category icon
emojiIconFgActive: #51a0e5; // active emoji category icon
overviewCheckBorder: #e4eaef; // shared media round checkbox border
sideBarBg: #${config.colorScheme.colors.base01}; // filters side bar background
sideBarBgActive: #25303e; // filters side bar active background
sideBarBgRipple: #1e2733; // filters side bar ripple effect
sideBarTextFg: #768c9e; // filters side bar text
sideBarTextFgActive: #64b9fa; // filters side bar active item text
sideBarIconFg: #768c9e; // filters side bar icon
sideBarIconFgActive: #5eb5f7; // filters side bar active item icon
sideBarBadgeBg: #5eb5f7; // filters side bar badge background
sideBarBadgeBgMuted: #768c9e; // filters side bar unimportant badge background
statisticsChartInactive: #313d4cc8; // inactive area in footer of statistic charts
statisticsChartActive: #526679d8; // sides in footer of statistic charts
  
    '';
  };
}