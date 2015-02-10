# firefox-gpo
A Netscape.cfg/Autoconfig file which loads settings from Group policy

This project is mostly based on GPOFirefox by Marco Di Feo
(http://marco-difeo.de/gpofirefox/)
His project also includes a GP ADM file available at http://sourceforge.net/projects/gpofirefox/files/

The main difference between this project and GPOFirefox is that some settings while can be changed by an
extension, aren't used that late in the Firefox start-up process (for example, browser.useragent.locale)
that's where Autoconfig  files come in which are executed earlier.

# How to use

Simply place mozilla-gp.cfg in the install directory of Mozilla Firefox, and copy local-settings.js in the
defaults/pref folder. After restaring Firefox, your group policy settings should be automatically picked up.