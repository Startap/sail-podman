# ⛵ Podman Sail

This is just a simple fork from Laravel Sail project, aimed to provide compatibility with Podman and Podman Composer. 
All we did was tweak some binaries to be able to recognize Podman instead of Docker when running Sail. All the rest of source code was left untouched for now.

<br>


## 🛡️ Can I rely on this package? Why not Sail?

Well, Sail it's very good. But they do not have plans to support Podman (see [#83](https://github.com/laravel/sail/issues/83) and [this comment](https://github.com/laravel/sail/pull/198#issuecomment-881747365) from [#198](https://github.com/laravel/sail/pull/198)). 
We already use Podman and made a change locally on Sail binary, inside **vendor** folder. 

That change got away with every new Sail update. So, to keep in track with Sail upstream changes and provide a compatibility layer with Podman, we create this package and change a few things in [bin/sail](https://github.com/Startap/sail-podman/blob/main/bin/sail) file to be able to recnognize Podman/Podman Compose as executable. 

_For now, these changes are hardcoded, but we can improve it later._

<br>

## 🤔 What's Laravel Sail?

Sail provides a Docker powered local development experience for Laravel that is compatible with macOS, Windows (WSL2), and Linux. Other than Docker, no software or libraries are required to be installed on your local computer before using Sail. Sail's simple CLI means you can start building your Laravel application without any previous Docker experience.

📜 You can read more about it on [laravel.com/docs/sail](https://laravel.com/docs/sail) or [Laravel Sail GitHub](https://github.com/laravel/sail) repository.

<br>


## 📦 How to install?

You can use this package right from Packagist repository with Composer.

```bash
composer require startap/sail-podman
```

### ⚠️ Compatibility note
**Don't forget:** if you already have Laravel Sail installed, it's required that you remove it first. You can do it with Composer too:

```bash
composer remove laravel/sail
```

<br>


## 🎯 Roadmap

We want to make this project active and maintaned. So a few future improvements are planned, and you can follow it's implementation here:

- [ ] Change binary name from Sail to SailPod, to fix compatiblity issues with Laravel/Sail installations
- [ ] Think a way to encapsulate Sail package to avoid conflicts with upstream Sail


_If you want to contribute, suggest a feature to our roadmap or report a bug, be welcome. It's all in this repository: issues, discussions and pull requests._
