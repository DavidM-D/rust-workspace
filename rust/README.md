This is a simple development environment for rust with wasm and native targets

To install this scoped to a project using direnv, create the following file `.envrc` at the root of your project

```
use flake github:DavidM-D/workspaces?dir=rust

```
and when prompted run:
```bash
direnv allow
```

Alternatively run
```
nix develop github:DavidM-D/workspaces?dir=rust
```

to start a shell with a rust dev env in scope

This includes
- Cargo
- Rust with a wasm and native toolchain
- Rust Analyzer
- Clippy
