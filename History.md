0.0.0.1 / 2015-07-03
==================

  * first commit as enc
  
==================

1.5.0-QUACK / 2013-06-23 
========================

  * added to .gitignore
  * Merge branch 'master' of github.com:gitdurandal/dbd
  * added ppc64 dbd statically compiled with dietlibc
  * Merge pull request #1 from gitbrew/master
  * updated email address
  * added arm binary statically cross compiled with dietlibc
  * ugly Makefile fix for better crossbuild support
  * added 32-bit linux dbd compiled statically with dietlibc
  * added .gitignore
  * whoops...
  * fixed comment... finally
  * Merge pull request #4 from gitdurandal/master
  * added static ppc64 dbd for ps3 test
  * Merge pull request #3 from gitdurandal/master
  * updated arm and arm64 binaries
  * updated linux and win32 binaries
  * Fixed version
  * Merge pull request #2 from gitdurandal/master
  * added linux32 binaries
  * added windows dbd binaries
  * Merge pull request #1 from gitdurandal/master
  * Updated copyright and version info
  * made dbd crossbuild friendly
  * removed old binaries
  * minor changes
1.2.0 / 2012-04-18
==================

  * 1.2.0 release
  * Will try to find nice way to cross build for android without needing full sdk/ndk/wtfk
  * minor edit to mingw*-cross options
  * added win32 cross compile options
  * added arm-cross
  * changed README
  * updated readme
  * fixed Makefile Unix32
  * added 32-bit *nix option to Makefile
  * Merge branch 'master' of github.com:gitdurandal/dbd
  * changed readme
  * added make dist
  * purtied it up
  * fixed
  * made Makefile more verbose
  * fixed preamble
  * added upx-packed win32 exes
  * added win32 stealth (no output) exe
  * edited dbd.h
  * edited preambles
  * edited CHANGES
  * edited readme
  * edited readme
1.0.0 / 2012-04-05
==================

  * first commit as dbd
  
==================
1.36: Sep 17 2004: bug fix + the -w option
    - Made the write descriptor that's part of one of the pipes used for the
      -e execution option non-blocking to prevent sbd from infinitely hanging
      (under Linux at least, seems to work fine under NetBSD though).
    - If stdin is /dev/null (or simply nothing) sbd won't exit when in normal
      mode (without the -e option). This was a really stupid bug - discovered
      while running an sbd process from cron.
    - Added a timeout feature, the -w option. Now it's possible to have sbd
      automatically disconnect if there hasn't been any activity on the wire
      for n seconds. Feature is currently only available in the Unix version
      of sbd (not win32).

1.33: Jul 23 2004: -s option
    - added the -s option to have sbd invoke a shell, nothing else. if sbd is
      setuid 0, it'll invoke a root shell.

1.31: Jun 20 2004: Added setuid(geteuid()) code and command line wiping.
    - if sbd is setuid (chmod 4755 or 6755), sbd will do setuid(geteuid()) on
      Unix-like operating systems. feature added to offer root shells during
      pen-tests.
    - the host, port and command to execute (-e option) specified on the
      command line are wiped with spaces in order to hide them from the
      process list on Unix-like operating systems (e.g. "ps auxww", "ps -Af",
      e.g.). the -k option was wiped with stars (*) before, but now it's all
      wiped with spaces (0x20) instead.

1.27: Jun 13 2004: Bugfixes and features.
    - implemented Christophe Devine's optimized AES-CBC-128 code
    - resolved disconnect-on-large-transfer-bug in doexec_win32.h
    - added the -m option (snooping)
    - added the -n option (numeric-only IP addresses)

1.23: Jun 9 2004: Minor bugfix.
    - resolved const char* segfault bug (read-only memory) if EXECPROG != NULL

1.21: Jun 8 2004: Initial release.
