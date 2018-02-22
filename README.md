# rackian-cloud

[![Travis](https://img.shields.io/travis/ivandelabeldad/rackian-cloud.svg?style=flat-square)](https://travis-ci.org/ivandelabeldad/rackian-cloud)
[![Version](https://img.shields.io/badge/version-1.0.2-orange.svg?style=flat-square)](https://github.com/ivandelabeldad/rackian-cloud)
[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg?style=flat-square)](https://github.com/ivandelabeldad/rackian-cloud/blob/master/LICENSE)

Helm configuration to deploy rackian-cloud to kubernetes cluster

## Purpose

The purpose of this application is to put into practice the following techniques and technologies:
* CI & CD
* Kubernetes
* Helm charts and repositories

## Behaviour

* Travis check in each new commit the status of the package using helm lint and helm package to ensure it is valid.
* If the commit is tagged it will deploy automatically a new chart and it will be added to the repository. This is available in the url https://ivandelabeldad.github.io/rackian-cloud/repo/.

## Related projects

* [Rackian API](https://github.com/ivandelabeldad/rackian-api)
* [Rackian Web](https://github.com/ivandelabeldad/rackian-web)
* [Rackian Register](https://github.com/ivandelabeldad/rackian-register)

## License

The Rackian Cloud project is open-sourced software licensed under
the [MIT license](https://github.com/ivandelabeldad/rackian-cloud/blob/master/LICENSE).
