# ⛵ Podman Sail

This is just a simple fork from Laravel Sail project, aimed to provide compatibility with Podman and Podman Composer.
All we did was tweak some binaries to be able to recognize Podman instead of Docker when running Sail. All the rest of source code was left untouched for now.

<br>

## 🛡️ Can I rely on this package? Why not Sail?

Well, Sail it's very good. But they do not have plans to support Podman (see [#83](https://github.com/laravel/sail/issues/83) and [this comment](https://github.com/laravel/sail/pull/198#issuecomment-881747365) from [#198](https://github.com/laravel/sail/pull/198)).
We already use Podman and made a change locally on Sail binary, inside **vendor** folder.

That change got away with every new Sail update. So, to keep in track with Sail upstream changes and provide a compatibility layer with Podman, we create this package and change a few things in [bin/sail](https://github.com/Startap/sail-podman/blob/main/bin/sail) file to be able to recognize Podman/Podman Compose as executable.

_For now, these changes are hardcoded, but we can improve it later._

<br>

## 🤔 What's Laravel Sail?

Sail provides a Docker powered local development experience for Laravel that is compatible with macOS, Windows (WSL2), and Linux. Other than Docker, no software or libraries are required to be installed on your local computer before using Sail. Sail's simple CLI means you can start building your Laravel application without any previous Docker experience.

📜 You can read more about it on [laravel.com/docs/sail](https://laravel.com/docs/sail) or [Laravel Sail GitHub](https://github.com/laravel/sail) repository.

<br>

## 📦 How to install?

You can use this package right from Packagist repository with Composer.

```bash
composer require --dev startap/sail-podman
```

### About users and permissions

If you are facing an issue regarding user permissions and access file denied, try [this workaround](https://github.com/Startap/sail-podman/issues/9#issuecomment-4114829108). After try it, please answer with a 👍 or 👎 so I can take action into this.

### ⚠️ Compatibility note

This package is based on [laravel/sail](https://github.com/laravel/sail) package. Inside our `composer.json` we declare that our package replaces `laravel/sail` as a dev dependency.

So, if you already have Laravel Sail installed, Composer will automatically remove it when installing this package. If you uninstall it, it is possible to install `laravel/sail` again
per their own rules and procedures.

## How to contribute

_If you want to contribute, suggest a feature or report a bug, be welcome. It's all in this repository: issues, discussions and pull requests._

## Sponsor us

You can sponsor us via GitHub Sponsors. It is right on the sidebar.

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
