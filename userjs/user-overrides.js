/*** GIGAS OVERRIDES ***/
user_pref("_user.js.parrot", "gigas overrides");

// GIGAS: Scan downloadings if it's safe
user_pref("browser.safebrowsing.downloads.remote.enabled", true); // 0403
user_pref("browser.safebrowsing.downloads.remote.url", "https://sb-ssl.google.com/safebrowsing/clientreport/download?key=%GOOGLE_SAFEBROWSING_API_KEY%"); // 0403

// GIGAS: enable search engine in address bar
user_pref("keyword.enabled", true); // 0801
user_pref("browser.urlbar.suggest.engines", true); // 0808

// GIGAS: restore session see https://github.com/arkenfox/user.js/issues/1080
// user_pref("browser.startup.page", 3); // 0102
user_pref("browser.sessionstore.privacy_level", 0); // 1003
user_pref("network.cookie.lifetimePolicy", 0); // 2801
// user_pref("privacy.clearOnShutdown.history", true); // 2811
// user_pref("privacy.clearOnShutdown.sessions", true); // 2811
user_pref("browser.privatebrowsing.autostart", false); // 5001
//user_pref("places.history.enabled", true); // 5013
user_pref("privacy.clearOnShutdown.cookies", false); // Cookies
user_pref("privacy.clearOnShutdown.offlineApps", false); // Site Data

// GIGAS: for pixiv
user_pref("network.http.referer.XOriginPolicy", 0); // 1601
user_pref("network.http.referer.XOriginTrimmingPolicy", 0); // 1602

// GIGAS: inner window resolution fix
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504

// GIGAS: Enable custome themes, e.g. https://github.com/EliverLara/firefox-sweet-theme

/* user.js
 * https://github.com/rafaelmardojai/firefox-gnome-theme/
 */

// Enable userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Enable CSD
user_pref("browser.tabs.drawInTitlebar", true);

// Reset homepage, see tabliss's guide: https://tabliss.io/support.html
user_pref("browser.startup.page", 1);
user_pref("browser.startup.homepage", "moz-extension://4d648020-4e4a-4402-8dd2-0a47d9df69e8/index.html");

// KDE file explorer
user_pref("widget.use-xdg-desktop-portal", true);
user_pref("widget.use-xdg-desktop-portal.kde", true);
user_pref("GTK_USE_PORTAL", 0);
user_pref("widget.use-xdg-desktop-portal.file-picker", 1);

// GTK scrollbars
user_pref("widget.gtk.overlay-scrollbars.enabled", true);

// Enable GPU acceleration/Hardware Video Decoding, see: https://www.opennet.ru/opennews/art.shtml?num=57297
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.software", false);
user_pref("gfx.webrender.enabled", true);

// Hardware video decoding: https://linuxreviews.org/HOWTO_Make_Mozilla_Firefox_Blazing_Fast_On_Linux
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.ffmpeg.vaapi-drm-display.enabled", true);
user_pref("media.ffvpx.enabled", false);

// Enable EGL Rendering
user_pref("gfx.x11-egl.force-enabled", true);

// Force 144fps
user_pref("layout.frame_rate", 144);

// Smooth scrolling: https://wiki.archlinux.org/title/Firefox/Tweaks
user_pref("general.smoothScroll.lines.durationMaxMS", 125);
user_pref("general.smoothScroll.lines.durationMinMS", 125);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 200);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 100);
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("general.smoothScroll.other.durationMaxMS", 125);
user_pref("general.smoothScroll.other.durationMinMS", 125);
user_pref("general.smoothScroll.pages.durationMaxMS", 125);
user_pref("general.smoothScroll.pages.durationMinMS", 125);
user_pref("mousewheel.min_line_scroll_amount", 30);
user_pref("mousewheel.system_scroll_override_on_root_content.enabled", true);
user_pref("mousewheel.system_scroll_override_on_root_content.horizontal.factor", 175);
user_pref("mousewheel.system_scroll_override_on_root_content.vertical.factor", 175);
user_pref("toolkit.scrollbox.horizontalScrollDistance", 6);
user_pref("toolkit.scrollbox.verticalScrollDistance", 2);

// Disable restore on crash
user_pref("browser.sessionstore.resume_from_crash", false);

// Use system values for scroll speed
// user_pref("mousewheel.system_scroll_override.enabled", false);

// Make backspace go to the previous page
user_pref("browser.backspace_action", 0);

// Enable ipv6
user_pref("network.dns.disableIPv6", false);

// Enable experimental servo layout
user_pref("layout.css.servo.enabled", true);
