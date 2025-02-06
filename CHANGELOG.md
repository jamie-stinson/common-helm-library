# Changelog

## [1.24.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.24.0...v1.24.1) (2025-02-06)


### Bug Fixes

* add missing pod ip env variable ([#160](https://github.com/jamie-stinson/common-helm-library/issues/160)) ([2f9db0a](https://github.com/jamie-stinson/common-helm-library/commit/2f9db0aabca100d5d57709e7ce7cfcfaecb33887))

## [1.24.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.23.0...v1.24.0) (2025-02-05)


### Features

* **grafana:** add folders ([#159](https://github.com/jamie-stinson/common-helm-library/issues/159)) ([d54df3e](https://github.com/jamie-stinson/common-helm-library/commit/d54df3ed9b02f5a8db4570348b0b87985c954345))
* **grafana:** allow url dashboards ([#157](https://github.com/jamie-stinson/common-helm-library/issues/157)) ([3633d0b](https://github.com/jamie-stinson/common-helm-library/commit/3633d0b99327d69584be379205ffbee6d2283823))

## [1.23.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.22.1...v1.23.0) (2025-02-05)


### Features

* **service:** allow selector override ([#156](https://github.com/jamie-stinson/common-helm-library/issues/156)) ([6bce66c](https://github.com/jamie-stinson/common-helm-library/commit/6bce66c52c8a8ff5a5ec2225a5a2333bb67f0aa2))


### Bug Fixes

* **ingress:** correctly apply labels and annotations ([#154](https://github.com/jamie-stinson/common-helm-library/issues/154)) ([575e928](https://github.com/jamie-stinson/common-helm-library/commit/575e9280b5b8973a4c8ddeb4306971bb4213fcf4))

## [1.22.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.22.0...v1.22.1) (2025-02-03)


### Bug Fixes

* allow multiple dashboards in single chart ([#152](https://github.com/jamie-stinson/common-helm-library/issues/152)) ([dd35097](https://github.com/jamie-stinson/common-helm-library/commit/dd350971f170f3bfad73b10b58b96d9a9783c3ce))

## [1.22.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.21.1...v1.22.0) (2025-02-03)


### Features

* add grafana support ([#150](https://github.com/jamie-stinson/common-helm-library/issues/150)) ([41a20f8](https://github.com/jamie-stinson/common-helm-library/commit/41a20f866e690e64290054ebbb610bc69ef1196a))

## [1.21.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.21.0...v1.21.1) (2025-02-02)


### Bug Fixes

* include port protocol if provided in exposed ports of workload. ([#147](https://github.com/jamie-stinson/common-helm-library/issues/147)) ([293b536](https://github.com/jamie-stinson/common-helm-library/commit/293b53651287df5a1a6bc47ba08a560ad1c14cad))

## [1.21.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.20.1...v1.21.0) (2025-02-01)


### Features

* add extra objects ([#145](https://github.com/jamie-stinson/common-helm-library/issues/145)) ([9e14f36](https://github.com/jamie-stinson/common-helm-library/commit/9e14f3624bfd8e258ff8ac6279807440f0dd5c3e))

## [1.20.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.20.0...v1.20.1) (2025-01-30)


### Bug Fixes

* **statefulset:** service name ([#143](https://github.com/jamie-stinson/common-helm-library/issues/143)) ([7689775](https://github.com/jamie-stinson/common-helm-library/commit/768977575a5f8be0b5a86f9eaac802ac5fcc69de))

## [1.20.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.19.2...v1.20.0) (2025-01-29)


### Features

* add persistentvolumes and persistentvolumesclaim resources ([#139](https://github.com/jamie-stinson/common-helm-library/issues/139)) ([701dd61](https://github.com/jamie-stinson/common-helm-library/commit/701dd611e109062b583c1d1ba90e8bc346c58aa9))

## [1.19.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.19.1...v1.19.2) (2025-01-28)


### Bug Fixes

* **secret:** allow optional namespace ([#136](https://github.com/jamie-stinson/common-helm-library/issues/136)) ([0961272](https://github.com/jamie-stinson/common-helm-library/commit/0961272edc92af64ed7be8cd28ab56e15c3cb484))

## [1.19.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.19.0...v1.19.1) (2025-01-28)


### Bug Fixes

* **secret:** line break ([#134](https://github.com/jamie-stinson/common-helm-library/issues/134)) ([9d3718f](https://github.com/jamie-stinson/common-helm-library/commit/9d3718f185ca64908597ddda3e2e13d9906f60d7))

## [1.19.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.18.3...v1.19.0) (2025-01-28)


### Features

* add secret resource support ([#132](https://github.com/jamie-stinson/common-helm-library/issues/132)) ([961df8f](https://github.com/jamie-stinson/common-helm-library/commit/961df8fdcddfee75513e20702c700fa89cf8b4a2))
* add storageclass ([#130](https://github.com/jamie-stinson/common-helm-library/issues/130)) ([5ac4748](https://github.com/jamie-stinson/common-helm-library/commit/5ac47480a90441491047b9ab40d66138094f2b25))
* **ingress:** refactor ([#129](https://github.com/jamie-stinson/common-helm-library/issues/129)) ([3970470](https://github.com/jamie-stinson/common-helm-library/commit/39704700c6d7f6a1d2df0245d19c9a46b81b61c2))
* move postgres to cnpg ([#125](https://github.com/jamie-stinson/common-helm-library/issues/125)) ([e36beb8](https://github.com/jamie-stinson/common-helm-library/commit/e36beb8772a3a141b21b00269996e803c35b3202))
* **prometheus:** add extension ([#127](https://github.com/jamie-stinson/common-helm-library/issues/127)) ([1fd9cbf](https://github.com/jamie-stinson/common-helm-library/commit/1fd9cbf00f34fb3f10c6a4f08095b50365e79fe7))
* refactor cert-manager resources ([#133](https://github.com/jamie-stinson/common-helm-library/issues/133)) ([e8f390b](https://github.com/jamie-stinson/common-helm-library/commit/e8f390baa6f4b954f7b9a57541b7cb56985407f8))

## [1.18.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.18.2...v1.18.3) (2025-01-24)


### Bug Fixes

* **postgres:** remove role-access ([#122](https://github.com/jamie-stinson/common-helm-library/issues/122)) ([51fa244](https://github.com/jamie-stinson/common-helm-library/commit/51fa24448bb6cd95dd7d0df9267c997330524a60))

## [1.18.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.18.1...v1.18.2) (2025-01-24)


### Bug Fixes

* **postgres:** role grant ([#120](https://github.com/jamie-stinson/common-helm-library/issues/120)) ([2464ebb](https://github.com/jamie-stinson/common-helm-library/commit/2464ebb7be6a4cbdcc790411458fa2907fc90c87))

## [1.18.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.18.0...v1.18.1) (2025-01-24)


### Bug Fixes

* **postgres:** app role setup ([#118](https://github.com/jamie-stinson/common-helm-library/issues/118)) ([aa4cd1a](https://github.com/jamie-stinson/common-helm-library/commit/aa4cd1ab852a0be9a3673ff7378dcd81dbe171e4))

## [1.18.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.17.0...v1.18.0) (2025-01-24)


### Features

* **postgres:** create app user ([#115](https://github.com/jamie-stinson/common-helm-library/issues/115)) ([4066007](https://github.com/jamie-stinson/common-helm-library/commit/406600784ea7ff61185000659e6856007d5ef86c))
* **postgres:** create app user ([#117](https://github.com/jamie-stinson/common-helm-library/issues/117)) ([267b262](https://github.com/jamie-stinson/common-helm-library/commit/267b26295d614e8488c02eabea9ca27030ce6a92))

## [1.17.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.16.4...v1.17.0) (2025-01-23)


### Features

* add ingress class ([#114](https://github.com/jamie-stinson/common-helm-library/issues/114)) ([b155769](https://github.com/jamie-stinson/common-helm-library/commit/b15576941ab1a3e6e6cef1b7087ba82c2cee0bc7))
* **traefik:** convert from ingressroute to ingress ([#112](https://github.com/jamie-stinson/common-helm-library/issues/112)) ([a29a08a](https://github.com/jamie-stinson/common-helm-library/commit/a29a08a76859c96ced31d92f4f442c1538b43aab))

## [1.16.4](https://github.com/jamie-stinson/common-helm-library/compare/v1.16.3...v1.16.4) (2025-01-23)


### Bug Fixes

* **postgres:** statefulset labels ([#110](https://github.com/jamie-stinson/common-helm-library/issues/110)) ([e0e3785](https://github.com/jamie-stinson/common-helm-library/commit/e0e37857d19a146c007f6ec6b903a054f68812fd))

## [1.16.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.16.2...v1.16.3) (2025-01-23)


### Bug Fixes

* **postgres:** replica resolution ([#108](https://github.com/jamie-stinson/common-helm-library/issues/108)) ([bd857f8](https://github.com/jamie-stinson/common-helm-library/commit/bd857f88a7cd8251597cb5e4105d480a16966978))

## [1.16.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.16.1...v1.16.2) (2025-01-23)


### Bug Fixes

* **postgres:** replica resolution ([#106](https://github.com/jamie-stinson/common-helm-library/issues/106)) ([a9c9542](https://github.com/jamie-stinson/common-helm-library/commit/a9c9542e6025783a0d917fa97050deaf474075c7))

## [1.16.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.16.0...v1.16.1) (2025-01-23)


### Bug Fixes

* temp probe ([#104](https://github.com/jamie-stinson/common-helm-library/issues/104)) ([7f1e047](https://github.com/jamie-stinson/common-helm-library/commit/7f1e0473f7195bb2b3633d66d393c45157fb095e))

## [1.16.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.15.3...v1.16.0) (2025-01-23)


### Features

* add postgres alpha extension ([#102](https://github.com/jamie-stinson/common-helm-library/issues/102)) ([204609f](https://github.com/jamie-stinson/common-helm-library/commit/204609f043611579b1bc7edb418611fe37c640ad))

## [1.15.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.15.2...v1.15.3) (2025-01-23)


### Bug Fixes

* **redis:** peer lookup ([#100](https://github.com/jamie-stinson/common-helm-library/issues/100)) ([3aacbd9](https://github.com/jamie-stinson/common-helm-library/commit/3aacbd9e9d6fd9e37a685ccf99b4c61184f23c27))

## [1.15.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.15.1...v1.15.2) (2025-01-23)


### Bug Fixes

* redis labels ([#98](https://github.com/jamie-stinson/common-helm-library/issues/98)) ([a3c9147](https://github.com/jamie-stinson/common-helm-library/commit/a3c91477167485db9e28c7eedac5682f7b0f75a6))

## [1.15.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.15.0...v1.15.1) (2025-01-23)


### Bug Fixes

* **redis:** remove fs-group ([#96](https://github.com/jamie-stinson/common-helm-library/issues/96)) ([fcda418](https://github.com/jamie-stinson/common-helm-library/commit/fcda418391cc72a456ef314463add8e5e45436c9))

## [1.15.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.14.0...v1.15.0) (2025-01-23)


### Features

* add redis cluster alpha ([#94](https://github.com/jamie-stinson/common-helm-library/issues/94)) ([263b3e6](https://github.com/jamie-stinson/common-helm-library/commit/263b3e6cb57acc607a15cf694a3d99430cd565ad))

## [1.14.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.13.0...v1.14.0) (2025-01-22)


### Features

* **env:** add hostname ([#92](https://github.com/jamie-stinson/common-helm-library/issues/92)) ([45e04cd](https://github.com/jamie-stinson/common-helm-library/commit/45e04cd96f8ac2b4a69552aabf0f53f40db9c4f0))

## [1.13.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.12.0...v1.13.0) (2025-01-21)


### Features

* add extra containers ([#90](https://github.com/jamie-stinson/common-helm-library/issues/90)) ([35461df](https://github.com/jamie-stinson/common-helm-library/commit/35461df30d5cd9c3a4536df517b0c76baf482f70))

## [1.12.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.11.0...v1.12.0) (2025-01-20)


### Features

* use servicemonitor port to attach to service and container ([#88](https://github.com/jamie-stinson/common-helm-library/issues/88)) ([19fafa1](https://github.com/jamie-stinson/common-helm-library/commit/19fafa1ea2a4964253e22047f3b579c471dad289))

## [1.11.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.10.0...v1.11.0) (2025-01-19)


### Features

* ingress refactor ([#87](https://github.com/jamie-stinson/common-helm-library/issues/87)) ([941076f](https://github.com/jamie-stinson/common-helm-library/commit/941076fe18decd62dddecf7aa1c74bade98922ed))
* **resources:** add presets ([#86](https://github.com/jamie-stinson/common-helm-library/issues/86)) ([143de36](https://github.com/jamie-stinson/common-helm-library/commit/143de36ecaa0f56959f9aa992491dfc3c107c54a))
* **workload:** code refactor ([#84](https://github.com/jamie-stinson/common-helm-library/issues/84)) ([eef18ea](https://github.com/jamie-stinson/common-helm-library/commit/eef18ea1e6eb97a255107595cabe7c662cbadc00))

## [1.10.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.9.0...v1.10.0) (2025-01-06)


### Features

* allow service name to be modified ([#82](https://github.com/jamie-stinson/common-helm-library/issues/82)) ([c6ff882](https://github.com/jamie-stinson/common-helm-library/commit/c6ff882839cea5e8faad64e5ff7749310d37b18f))

## [1.9.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.8.0...v1.9.0) (2025-01-05)


### Features

* optional secret ([#80](https://github.com/jamie-stinson/common-helm-library/issues/80)) ([713aa87](https://github.com/jamie-stinson/common-helm-library/commit/713aa87b6b41eb236585e81744430a5ed8c1e5c8))

## [1.8.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.7.1...v1.8.0) (2025-01-05)


### Features

* operator env variable ([#78](https://github.com/jamie-stinson/common-helm-library/issues/78)) ([efe0f7c](https://github.com/jamie-stinson/common-helm-library/commit/efe0f7c2786669bb21f1dfa99ccb109f9224ef74))

## [1.7.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.7.0...v1.7.1) (2025-01-05)


### Bug Fixes

* cloudflare secret namespace ([#76](https://github.com/jamie-stinson/common-helm-library/issues/76)) ([0ae8c1e](https://github.com/jamie-stinson/common-helm-library/commit/0ae8c1e7c28b8ec9f040ab8cb02f05c286722d69))

## [1.7.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.6.3...v1.7.0) (2025-01-05)


### Features

* revert securitycontext ([#74](https://github.com/jamie-stinson/common-helm-library/issues/74)) ([7d2bd72](https://github.com/jamie-stinson/common-helm-library/commit/7d2bd72d711cb48ccd7bd5956255431342125103))

## [1.6.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.6.2...v1.6.3) (2025-01-05)


### Bug Fixes

* workload port eof ([#72](https://github.com/jamie-stinson/common-helm-library/issues/72)) ([365fc97](https://github.com/jamie-stinson/common-helm-library/commit/365fc97bd44466fe1f9d1db9f6c46bf2a2204b82))

## [1.6.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.6.1...v1.6.2) (2025-01-05)


### Bug Fixes

* workload ports ([#70](https://github.com/jamie-stinson/common-helm-library/issues/70)) ([30d076c](https://github.com/jamie-stinson/common-helm-library/commit/30d076ccdb8c207857522b34219308727a4b49dd))

## [1.6.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.6.0...v1.6.1) (2025-01-05)


### Bug Fixes

* priority class default empty ([#68](https://github.com/jamie-stinson/common-helm-library/issues/68)) ([46a3d0f](https://github.com/jamie-stinson/common-helm-library/commit/46a3d0fdd9b4f609fa2650430eb6fe7cb5310ea1))

## [1.6.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.5.4...v1.6.0) (2025-01-05)


### Features

* add default security context ([#64](https://github.com/jamie-stinson/common-helm-library/issues/64)) ([f4d96a5](https://github.com/jamie-stinson/common-helm-library/commit/f4d96a5952940fb509625e6c3261a1bf01a638c6))
* code refactor ([#67](https://github.com/jamie-stinson/common-helm-library/issues/67)) ([5af760d](https://github.com/jamie-stinson/common-helm-library/commit/5af760d5e9300042b2928e672ee42f2fd89f5d91))
* move to single configmap ([#66](https://github.com/jamie-stinson/common-helm-library/issues/66)) ([a5632db](https://github.com/jamie-stinson/common-helm-library/commit/a5632dbfb864621a7bc70ca7f40756c0d6d698a5))

## [1.5.4](https://github.com/jamie-stinson/common-helm-library/compare/v1.5.3...v1.5.4) (2025-01-03)


### Bug Fixes

* ingressroute for service refactor ([#62](https://github.com/jamie-stinson/common-helm-library/issues/62)) ([812ea36](https://github.com/jamie-stinson/common-helm-library/commit/812ea36de2ec9b7711e6d17f13eb2d6d84fa46b3))

## [1.5.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.5.2...v1.5.3) (2025-01-03)


### Bug Fixes

* workload ports for service refactor ([#60](https://github.com/jamie-stinson/common-helm-library/issues/60)) ([a33e1a2](https://github.com/jamie-stinson/common-helm-library/commit/a33e1a27d879459f573fc6424b1f9fe2ebf5ec88))

## [1.5.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.5.1...v1.5.2) (2025-01-03)


### Bug Fixes

* service annotations module call ([#58](https://github.com/jamie-stinson/common-helm-library/issues/58)) ([012873b](https://github.com/jamie-stinson/common-helm-library/commit/012873bd19910b64d787826d1c2bbe4555471414))

## [1.5.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.5.0...v1.5.1) (2025-01-03)


### Bug Fixes

* service eof ([#57](https://github.com/jamie-stinson/common-helm-library/issues/57)) ([164ab80](https://github.com/jamie-stinson/common-helm-library/commit/164ab805b645c3bccf536970699f20493a014b3a))
* workload service ports ([#55](https://github.com/jamie-stinson/common-helm-library/issues/55)) ([5029524](https://github.com/jamie-stinson/common-helm-library/commit/50295247680af8bce262083b907f4afc7a8015cb))

## [1.5.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.4.1...v1.5.0) (2025-01-03)


### Features

* service refactor ([#54](https://github.com/jamie-stinson/common-helm-library/issues/54)) ([7b362d6](https://github.com/jamie-stinson/common-helm-library/commit/7b362d6f17baf5f46b4526b96921e321bbda7a8d))


### Bug Fixes

* service labels and annotations ([#52](https://github.com/jamie-stinson/common-helm-library/issues/52)) ([461bc7e](https://github.com/jamie-stinson/common-helm-library/commit/461bc7eabe8a090a840f8864a3d158cee3cd8be4))

## [1.4.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.4.0...v1.4.1) (2025-01-03)


### Bug Fixes

* nodeport ([#50](https://github.com/jamie-stinson/common-helm-library/issues/50)) ([7b0adae](https://github.com/jamie-stinson/common-helm-library/commit/7b0adae11cf07d6a8cfe42d949b549ae2a27f586))

## [1.4.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.2...v1.4.0) (2025-01-03)


### Features

* certificate namespace ([#44](https://github.com/jamie-stinson/common-helm-library/issues/44)) ([f20b944](https://github.com/jamie-stinson/common-helm-library/commit/f20b944d32b88cbe68a536ef609357ad3c074e5b))


### Bug Fixes

* auto reflection ([#42](https://github.com/jamie-stinson/common-helm-library/issues/42)) ([0e328dc](https://github.com/jamie-stinson/common-helm-library/commit/0e328dcafa4814a4d2700ef215405eec029875e3))
* disable security context defaults ([#48](https://github.com/jamie-stinson/common-helm-library/issues/48)) ([fbcf93c](https://github.com/jamie-stinson/common-helm-library/commit/fbcf93cb53be0a4714a485e7fd847be77a1b9c26))

## [1.4.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.2...v1.4.0) (2025-01-02)


### Features

* certificate namespace ([#44](https://github.com/jamie-stinson/common-helm-library/issues/44)) ([f20b944](https://github.com/jamie-stinson/common-helm-library/commit/f20b944d32b88cbe68a536ef609357ad3c074e5b))


### Bug Fixes

* auto reflection ([#42](https://github.com/jamie-stinson/common-helm-library/issues/42)) ([0e328dc](https://github.com/jamie-stinson/common-helm-library/commit/0e328dcafa4814a4d2700ef215405eec029875e3))

## [1.4.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.2...v1.4.0) (2025-01-02)


### Features

* certificate namespace ([#44](https://github.com/jamie-stinson/common-helm-library/issues/44)) ([f20b944](https://github.com/jamie-stinson/common-helm-library/commit/f20b944d32b88cbe68a536ef609357ad3c074e5b))


### Bug Fixes

* auto reflection ([#42](https://github.com/jamie-stinson/common-helm-library/issues/42)) ([0e328dc](https://github.com/jamie-stinson/common-helm-library/commit/0e328dcafa4814a4d2700ef215405eec029875e3))

## [1.4.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.2...v1.4.0) (2025-01-02)


### Features

* certificate namespace ([#44](https://github.com/jamie-stinson/common-helm-library/issues/44)) ([f20b944](https://github.com/jamie-stinson/common-helm-library/commit/f20b944d32b88cbe68a536ef609357ad3c074e5b))


### Bug Fixes

* auto reflection ([#42](https://github.com/jamie-stinson/common-helm-library/issues/42)) ([0e328dc](https://github.com/jamie-stinson/common-helm-library/commit/0e328dcafa4814a4d2700ef215405eec029875e3))

## [1.3.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.2...v1.3.3) (2025-01-02)


### Bug Fixes

* auto reflection ([#42](https://github.com/jamie-stinson/common-helm-library/issues/42)) ([0e328dc](https://github.com/jamie-stinson/common-helm-library/commit/0e328dcafa4814a4d2700ef215405eec029875e3))

## [1.3.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.1...v1.3.2) (2025-01-02)


### Bug Fixes

* reflector support ([#40](https://github.com/jamie-stinson/common-helm-library/issues/40)) ([63950db](https://github.com/jamie-stinson/common-helm-library/commit/63950dbeec7ac683222cd0158b0d813cc4e693a8))

## [1.3.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.3.0...v1.3.1) (2025-01-02)


### Bug Fixes

* use ingress prefix ([#38](https://github.com/jamie-stinson/common-helm-library/issues/38)) ([27ebcb9](https://github.com/jamie-stinson/common-helm-library/commit/27ebcb9840f3c5fce59147e321bb927afe2882c7))

## [1.3.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.2.1...v1.3.0) (2025-01-02)


### Features

* add ingressroute ([#35](https://github.com/jamie-stinson/common-helm-library/issues/35)) ([c06092b](https://github.com/jamie-stinson/common-helm-library/commit/c06092b8155d53e0072d498bbcdec2506ded8a23))


### Bug Fixes

* use empty defaults for ingressroute ([#37](https://github.com/jamie-stinson/common-helm-library/issues/37)) ([b72fccf](https://github.com/jamie-stinson/common-helm-library/commit/b72fccfcf6270cde55c47a30214a8e9c32ef6e04))

## [1.2.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.2.0...v1.2.1) (2025-01-02)


### Bug Fixes

* certificate name ([#33](https://github.com/jamie-stinson/common-helm-library/issues/33)) ([68ac7dc](https://github.com/jamie-stinson/common-helm-library/commit/68ac7dc6590fdadeb4a0b8b234833651ec4b9a8c))

## [1.2.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.9...v1.2.0) (2025-01-02)


### Features

* cert-manager support ([#31](https://github.com/jamie-stinson/common-helm-library/issues/31)) ([47884a6](https://github.com/jamie-stinson/common-helm-library/commit/47884a6b8b910ee02113f108d078da95ddcf9504))

## [1.1.9](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.8...v1.1.9) (2024-12-31)


### Bug Fixes

* volume mount indentation ([#29](https://github.com/jamie-stinson/common-helm-library/issues/29)) ([450907a](https://github.com/jamie-stinson/common-helm-library/commit/450907ae8f5076e40a30f439c17eadc3b1f14372))

## [1.1.8](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.7...v1.1.8) (2024-12-31)


### Bug Fixes

* pdb template ([#27](https://github.com/jamie-stinson/common-helm-library/issues/27)) ([50e78da](https://github.com/jamie-stinson/common-helm-library/commit/50e78da576ab5cd2a098b6f7baeddde8eeb482a2))

## [1.1.7](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.6...v1.1.7) (2024-12-31)


### Bug Fixes

* add missing node name env variable ([#25](https://github.com/jamie-stinson/common-helm-library/issues/25)) ([1825441](https://github.com/jamie-stinson/common-helm-library/commit/182544158e04aba9ee7390181413967b089ec03e))

## [1.1.6](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.5...v1.1.6) (2024-12-31)


### Bug Fixes

* disable default resources ([#23](https://github.com/jamie-stinson/common-helm-library/issues/23)) ([3e164ac](https://github.com/jamie-stinson/common-helm-library/commit/3e164acf97fa1832e20f9a588e9c6949e70312c9))

## [1.1.5](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.4...v1.1.5) (2024-12-31)


### Bug Fixes

* configmap annotation and label references ([#21](https://github.com/jamie-stinson/common-helm-library/issues/21)) ([aa48a18](https://github.com/jamie-stinson/common-helm-library/commit/aa48a186d0b459582e370cf803ef30aa286b0111))

## [1.1.4](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.3...v1.1.4) (2024-12-31)


### Bug Fixes

* allow configmap to call common labels/annotations ([#19](https://github.com/jamie-stinson/common-helm-library/issues/19)) ([d4b97a8](https://github.com/jamie-stinson/common-helm-library/commit/d4b97a83d21682e5aa71b2a34c5fe4faecfa171e))

## [1.1.3](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.2...v1.1.3) (2024-12-31)


### Bug Fixes

* add podnamespace env variable ([#17](https://github.com/jamie-stinson/common-helm-library/issues/17)) ([9e60eed](https://github.com/jamie-stinson/common-helm-library/commit/9e60eed27f56232a9b7d649102e28f7a22bc26ea))

## [1.1.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.1...v1.1.2) (2024-12-31)


### Bug Fixes

* disable service monitor by default ([#15](https://github.com/jamie-stinson/common-helm-library/issues/15)) ([12c6fa5](https://github.com/jamie-stinson/common-helm-library/commit/12c6fa515bf7804bdcc1ffe6273062066fbbae2c))

## [1.1.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.1.0...v1.1.1) (2024-12-31)


### Bug Fixes

* affinity indent ([#13](https://github.com/jamie-stinson/common-helm-library/issues/13)) ([2365bc5](https://github.com/jamie-stinson/common-helm-library/commit/2365bc5dd50e85e8a396b64ece880a9917716b1c))

## [1.1.0](https://github.com/jamie-stinson/common-helm-library/compare/v1.0.2...v1.1.0) (2024-12-31)


### Features

* add prometheus servicemonitor support ([#11](https://github.com/jamie-stinson/common-helm-library/issues/11)) ([797e605](https://github.com/jamie-stinson/common-helm-library/commit/797e605cc9b4e1d192f1275c5957d7d0dd08775c))
* add strategy support for statefulset ([#9](https://github.com/jamie-stinson/common-helm-library/issues/9)) ([07260d8](https://github.com/jamie-stinson/common-helm-library/commit/07260d8d17538b289aff27d91becbe527e99d273))


### Bug Fixes

* crb subject namespace ([#12](https://github.com/jamie-stinson/common-helm-library/issues/12)) ([ba5a7c9](https://github.com/jamie-stinson/common-helm-library/commit/ba5a7c971f6989672be4ea495689b0c689f76d5b))

## [1.0.2](https://github.com/jamie-stinson/common-helm-library/compare/v1.0.1...v1.0.2) (2024-11-24)


### Bug Fixes

* correct common annotations ([#7](https://github.com/jamie-stinson/common-helm-library/issues/7)) ([84b233b](https://github.com/jamie-stinson/common-helm-library/commit/84b233bd7fd0ba33be75651a07171e7df38525e7))

## [1.0.1](https://github.com/jamie-stinson/common-helm-library/compare/v1.0.0...v1.0.1) (2024-11-24)


### Bug Fixes

* remove chart type ([#4](https://github.com/jamie-stinson/common-helm-library/issues/4)) ([9bac164](https://github.com/jamie-stinson/common-helm-library/commit/9bac164bd628506f4152ae05268a33df1e272f9c))

## 1.0.0 (2024-11-24)


### Features

* initial release ([#1](https://github.com/jamie-stinson/common-helm-library/issues/1)) ([e398630](https://github.com/jamie-stinson/common-helm-library/commit/e398630dde575584bc914a194edc46487e3d82b0))
