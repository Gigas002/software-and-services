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
user_pref("privacy.clearOnShutdown.offlineApps", false); // 2811
user_pref("privacy.clearOnShutdown.cookies", false); // 2811
user_pref("browser.privatebrowsing.autostart", false); // 5001
//user_pref("places.history.enabled", true); // 5013

// GIGAS: for pixiv
user_pref("network.http.referer.XOriginPolicy", 0); // 1601
user_pref("network.http.referer.XOriginTrimmingPolicy", 0); // 1602

// GIGAS: inner window resolution fix
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504
