Changelog
=========


(unreleased)
------------
- PHP82. [Matthew Horwood]

  feat: update OS to 3.19
  feat: update PHP to 8.2
  feat: compose file
  feat: testing script
  chor: fix up for php82


v1.5.1 (2023-02-10)
-------------------
- Merge pull request #12 from mhzawadi/dev. [Matthew Horwood]

  phpipam 1.5.1
- Phpipam 1.5.1. [Matthew Horwood]

  + XSS (reflected) in 'bw-calulator-result.php';
  + XSS (reflected) by invalid email address response;
  + XSS and LDAP injection in ad-search-result.php;
  + Restrict find_full_subnets.php to CLI;
  + Ensure confidentiality of database password;
- Merge pull request #11 from mhzawadi/dev. [Matthew Horwood]

  Update Github Actions
- Update Github Actions. [Matthew Horwood]

  chor: update github actions
- Tidy up. [Matthew Horwood]

  chor: tidy up


v1.5.0 (2022-05-03)
-------------------
- Merge pull request #7 from mhzawadi/dev. [Matthew Horwood]

  Dev 1.5
- Update Dockerfile. [Matthew Horwood]

  bug: more fixing
- Update Dockerfile. [Matthew Horwood]

  bug: file file name
- Update Dockerfile. [Matthew Horwood]

  bug: fix url
- 1.5.0. [Matthew Horwood]

  bug: fix download
- 1.5.0. [Matthew Horwood]

  bug: use tagged version
- Merge branch 'master' into dev. [Matthew Horwood]
- MHO/Formattion. [Matthew Horwood]

  chor: tidy format
- MHO/Fix versions. [Matthew Horwood]

  bug: fix version checkout
  bug: [CVE-2022-0778](https://security.alpinelinux.org/vuln/CVE-2022-0778)
- MHO/Alpine 3.15. [Matthew Horwood]
- Build a dev image. [Matthew Horwood]
- Fix up for alpine 3.14. [Matthew Horwood]


v1.4.7.0 (2022-04-25)
---------------------
- Merge pull request #6 from mhzawadi/dev-1.4. [Matthew Horwood]

  Update Dockerfile
- Update Dockerfile. [Matthew Horwood]

  Bugfixes:
  ----------------------------
  + Fix for SAML/2FA/login redirections (#3492, #3435, #3517)

  Security Fixes:
  ----------------------------
  + XXS (reflected) in ripe-arin-query;
  + XSS (reflected) in import previews;
- MHO/Schedule cron. [Matthew Horwood]

  chor: add a rebuild cron, every monday


v1.4.6.0 (2022-03-29)
---------------------
- Merge pull request #5 from mhzawadi/dev-1.4. [Matthew Horwood]

  Dev 1.4
- MHO/Updates. [Matthew Horwood]

  bug: rename action
  chor: add workflow_dispatch
  chor: update gitignore
  chor: fix ports passed to PHP
- V1.4.6. [Matthew Horwood]

  Bugfixes:
  ----------------------------
  + Require unique subnets not working as intended (#3529);

  Security Fixes:
  ----------------------------
  + Incorrect privilege assignments (#3506);
- Merge pull request #3 from mhzawadi/snyk-
  fix-9744c1be037518f78bb77521fac5b2f0. [Matthew Horwood]

  [Snyk] Security upgrade alpine from 3.14 to 3.15
- Fix: Dockerfile to reduce vulnerabilities. [snyk-bot]


v1.4.5.0 (2022-01-22)
---------------------

Fix
~~~
-  add in the saml PHP lib chor: tidy nginx config. [Matthew Horwood]

Other
~~~~~
- Merge pull request #2 from mhzawadi/dev-1.4. [Matthew Horwood]

  Update Dockerfile
- Update Dockerfile. [Matthew Horwood]

  version bump
- Merge pull request #1 from mhzawadi/dev-1.4. [Matthew Horwood]

  Dev 1.4
- Update Dockerfile. [Matthew Horwood]

  refix this
- Merge branch 'master' into dev-1.4. [Matthew Horwood]
- Update readme. [Matthew Horwood]
- Update readme. [Matthew Horwood]
- Mho/saml2 feat: update to 1.5. [Matthew Horwood]
- Update Dockerfile. [Matthew Horwood]
- Update Dockerfile. [Matthew Horwood]
- Update Dockerfile. [Matthew Horwood]
- Update nginx_site.conf. [Matthew Horwood]

  bug: if format
- Update nginx_site.conf. [Matthew Horwood]

  bug: line ending
- Merge branch 'master' of git.horwood.biz:matt/phpipam. [Matthew
  Horwood]


v1.4.4.0 (2021-09-01)
---------------------

New
~~~
-  build dev images bug: fix build process. [Matthew Horwood]
-  phpipam 1.4.4. [Matthew Horwood]

Fix
~~~
-  job name. [Matthew Horwood]
-  build dev-1.4. [Matthew Horwood]


v1.4.2.2 (2021-02-10)
---------------------

Fix
~~~
-  wrong config in nginx. [Matthew Horwood]
-  try and fix proxy requests. [Matthew Horwood]


v1.4.2.1 (2021-02-09)
---------------------

Fix
~~~
-  add missing dom module. [Matthew Horwood]


v1.4.2.0 (2021-02-09)
---------------------

Changes
~~~~~~~
-  bump to IPAM v1.4.2. [Matthew Horwood]


v1.4.1.5 (2020-12-15)
---------------------
- Mho/fix for Mayden bug: set the forwarded for from down stream.
  [Matthew Horwood]


v1.4.1.4 (2020-10-14)
---------------------
- Mho/fraefik with ssl offload chor: try this change. [Matthew Horwood]


v1.4.1.3 (2020-10-14)
---------------------
- Mho/SSL off load bug: pass the x-forwarded-proto. [Matthew Horwood]
- Mho/fix build arch bug: only build for amd64 and arm64. [Matthew
  Horwood]


v1.4.1.2 (2020-10-13)
---------------------
- Mho/add mcrypt chor: add mcrypt for SAML auth. [Matthew Horwood]


v1.4.1.1 (2020-08-07)
---------------------

Fix
~~~
-  change in version tag. [Matthew Horwood]


v1.4.1.0 (2020-08-07)
---------------------

New
~~~
-  add github action to build versions. [Matthew Horwood]

Fix
~~~
-  update git link. [Matthew Horwood]

Changes
~~~~~~~
-  version bump chor: remove host_url env. [Matthew Horwood]


v1.4.0.4 (2020-04-17)
---------------------

New
~~~
-  buildx tooling. [Matthew Horwood]
-  container health check chor: drop old build files. [Matthew Horwood]

Other
~~~~~
- Update for build. [Matthew Horwood]
- Add missing simplexml. [Matthew Horwood]
- Update readme. [Matthew Horwood]
- Fix logging to stdout. [Matthew Horwood]
- Make it all work. [Matthew Horwood]
- Rework for alpine with nginx and php-fpm. [Matthew Horwood]
- Make telegram token a secret. [Matt Horwood]
- Fix amd64 build. [Matthew Horwood]
- Build multi-arch tags. [Matthew Horwood]
- Build on amd/arm. [Matthew Horwood]
- Tryn this? [Matthew Horwood]
- Full testing. [Matthew Horwood]
- Test it? [Matthew Horwood]
- Test telegram. [Matthew Horwood]
- Move version back. [Matthew Horwood]
- Move vsrion to ARG of build. [Matthew Horwood]
- Fix drone build. [Matt Horwood]
- Fix tag. [Matt Horwood]
- Maybe this will work. [Matt Horwood]


v1.4.0 (2019-12-20)
-------------------
- Add drone. [Matt Horwood]
- Version bump. [Matthew Horwood]
- Add badges. [Matthew Horwood]
- Add custom build. [Matthew Horwood]
- Add docker pulls. [Matthew Horwood]
- Add docker build. [Matthew Horwood]
- Fix repo name. [Matthew Horwood]
- Import custom build tools. [Matthew Horwood]


v1.3.2 (2018-11-01)
-------------------
- Upgrade to 1.3.2 and php7. [Clint Armstrong]


v1.3.1 (2017-12-13)
-------------------
- Cleanup docker file. [Clint Armstrong]
- Add ldap stuff. [Clint Armstrong]
- 1.3.1 working. [Clint Armstrong]
- PHPIpam 1.3.1. [Clint Armstrong]
- Merge pull request #1 from setiseta/master. [Clint Armstrong]

  Update to PHPIpam Version 1.3
- Update to PHPIpam Version 1.3 Added pcntl for scnnain in webinterface
  Fixed 'sed' command for configuration. [kse]
- V1.3. [Clint Armstrong]
- Name. [Clint Armstrong]
- Quotes on false. [Clint Armstrong]
- All variables. [Clint Armstrong]
- Port. [Clint Armstrong]
- Fix dockerfile syntax. [Clint Armstrong]
- Upgrade and add more variables. [Clint Armstrong]
- Add libmcrypt to make REST API work. Thanks to @willonit. [pierrecdn]
- Change image name in README from local to docker hub. [pierrecdn]
- Correct Typos in README. [pierrecdn]
- Initial commit. [pierrecdn]
- Initial commit. [Pierre C]


