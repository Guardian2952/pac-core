# pac-core exports

Public export reference for `pac-core`, the PAC Products dependency/core bridge for FiveM resources.

> This public repository is documentation-only. It does **not** contain the private `pac-core` source code, assets, server logic, or configuration files.

## Resource name

Dependent resources should call the resource as:

```lua
exports['pac-core']:ExportName(...)
```

The actual server resource should still be named:

```txt
pac-core
```

## Available exports

| Export | Purpose |
| --- | --- |
| `GetCompatibility(key)` | Returns the configured compatibility resource/value for a key. |
| `CheckCompatibility(scriptName, key)` | Checks whether the configured compatibility resource is started/starting. |
| `Asset(path)` | Builds a `nui://pac-core/<path>` URL. |
| `AssetImg(path)` | Builds a `nui://pac-core/assets/images/<path>` URL. |
| `AssetVehImg(file)` | Builds a `nui://pac-core/assets/images/vehicles/<file>` URL. |
| `AssetSound(path)` | Builds a `nui://pac-core/assets/sounds/<path>` URL. |

Full details are in [`docs/EXPORTS.md`](docs/EXPORTS.md).

## Quick example

```lua
CreateThread(function()
    while GetResourceState('pac-core') ~= 'started' do
        Wait(250)
    end

    local hasGarage, garageResource = exports['pac-core']:CheckCompatibility(GetCurrentResourceName(), 'garage')

    if hasGarage then
        print(('Garage system detected: %s'):format(garageResource))
    else
        print('Garage system is not configured or not started.')
    end
end)
```

## Examples

- [`examples/client_usage.lua`](examples/client_usage.lua)
- [`examples/server_usage.lua`](examples/server_usage.lua)

## Public compatibility keys

The public key reference is in [`docs/CONFIG.md`](docs/CONFIG.md). This repo lists key names and expected behavior only; private server-specific values should stay in the private resource repo.
