# DrupalX Decoupled Starter

[![CI](https://github.com/drupalninja/drupalx-decoupled/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/drupalninja/drupalx-decoupled/actions/workflows/ci.yml)
[![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

This project template leverages the DrupalX Decoupled distribution, featuring enhanced editorial capabilities, integrated GraphQL support and a Next.js frontend starter.

## What does the template do?

* Extends the [drupal-composer/drupal-project](https://github.com/drupal-composer/drupal-project) template (visit the README for basic instructions).
* Adds additional contributed modules to the project via Composer.
* Sets up [DDEV](https://ddev.com/) as the default development environment.rapid style customization.
* Installs the DrupalX recipe which adds all of the configuration and demo content for this starter.

## Installing

Create your project:

```bash
composer create-project drupalninja/drupalx-decoupled:10.x-dev drupalx-decoupled-starter --no-interaction
```

Make sure that the files directory is writable.

```bash
chmod -R 755 web/sites/default/files/
```

Configure DDEV (follow prompts).

```bash
ddev config
```

Start DDEV, download Composer dependencies and install DrupalX CMS.

```bash
ddev install
```

Open another console tab to set up and run the Next.js frontend:

```bash
cd nextjs
nvm install
npm install
npm run dev
```

This will navigate to the Next.js directory, install the required Node.js version using nvm, install the necessary npm packages, and start the development server for the Next.js frontend.

You can now open the drush login link to log into Drupal with preview that should be
fully functional.
