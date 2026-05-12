# PAC Core Export Reference

This document lists the public integration surface for `pac-core`.

## Calling pattern

Use FiveM resource export syntax:

```lua
local result = exports['pac-core']:ExportName(...)
```

For safer integrations, check that `pac-core` is started before calling:

```lua
if GetResourceState('pac-core') == 'started' then
    local garage = exports['pac-core']:GetCompatibility('garage')
end
```

## Export summary

| Export | Arguments | Returns | Notes |
| --- | --- | --- | --- |
| `GetCompatibility` | `key: string` | `any` | Reads a normalized compatibility key from the private `pac-core` config. |
| `CheckCompatibility` | `scriptName: string`, `key: string` | `boolean`, `string?` | Checks the configured resource state. Returns whether it is compatible and the detected/configured resource name. |
| `Asset` | `path: string` | `string` | Builds `nui://pac-core/<path>`. |
| `AssetImg` | `path: string` | `string` | Builds `nui://pac-core/assets/images/<path>`. |
| `AssetVehImg` | `file: string` | `string` | Builds `nui://pac-core/assets/images/vehicles/<file>`. |
| `AssetSound` | `path: string` | `string` | Builds `nui://pac-core/assets/sounds/<path>`. |

## `GetCompatibility(key)`

Returns the configured value for a compatibility key.

### Example

```lua
local framework = exports['pac-core']:GetCompatibility('framework')
print(framework)
```

### Supported public keys

| Key | Purpose |
| --- | --- |
| `housing` | Housing resource compatibility. |
| `framework` | Framework/core resource compatibility. |
| `garage` | Garage resource compatibility. |
| `mechanic` | Mechanic resource compatibility. |
| `vehicle mileage` | Mileage resource compatibility. |
| `fuel system` | Fuel resource compatibility. |
| `phone` | Phone resource compatibility. |
| `dispatch` | Dispatch resource compatibility. |
| `character customization` | Appearance/character customization compatibility. |
| `medical system` | EMS/medical resource compatibility. |
| `banking` | Banking resource compatibility. |
| `inventory` | Inventory resource compatibility. |
| `target` | Targeting resource compatibility. |
| `vehicle keys` | Vehicle keys resource compatibility. |
| `doorlock` | Door lock resource compatibility. |
| `print to live console` | Logging toggle. |
| `initial compatibility timeout ms` | Startup compatibility timeout value. |
| `suppress positive logs for scripts` | List of scripts with suppressed positive compatibility logs. |

### Supported aliases

Some aliases are normalized internally. Public aliases include:

| Alias | Normalized key |
| --- | --- |
| `housing framework` | `housing` |
| `housing` | `housing` |
| `framework` | `framework` |
| `garage` | `garage` |
| `mechanic` | `mechanic` |
| `vehicle mileage` | `vehicle mileage` |
| `vehicle mileage system` | `vehicle mileage` |
| `mileage` | `vehicle mileage` |
| `fuel system` | `fuel system` |
| `phone` | `phone` |
| `dispatch` | `dispatch` |
| `character customization` | `character customization` |
| `medical system` | `medical system` |
| `banking` | `banking` |
| `inventory` | `inventory` |
| `target` | `target` |
| `vehicle keys` | `vehicle keys` |
| `doorlock` | `doorlock` |
| `print to live console` | `print to live console` |
| `initial compatibility timeout ms` | `initial compatibility timeout ms` |
| `suppress positive logs for scripts` | `suppress positive logs for scripts` |

## `CheckCompatibility(scriptName, key)`

Checks whether the configured resource for `key` is currently available.

### Return values

```lua
local isCompatible, resourceName = exports['pac-core']:CheckCompatibility(scriptName, key)
```

| Return | Type | Meaning |
| --- | --- | --- |
| `isCompatible` | `boolean` | `true` when the configured resource is `started` or `starting`. |
| `resourceName` | `string` or `nil` | Detected/configured resource name. Can be `nil` if the key is unconfigured. |

### Example

```lua
local ok, fuelResource = exports['pac-core']:CheckCompatibility(GetCurrentResourceName(), 'fuel system')

if ok then
    print(('Fuel system ready: %s'):format(fuelResource))
else
    print(('Fuel system missing or not started: %s'):format(fuelResource or 'not configured'))
end
```

## `Asset(path)`

Builds a raw NUI URL under the `pac-core` resource.

```lua
local url = exports['pac-core']:Asset('assets/other/img/home-logo.png')
-- nui://pac-core/assets/other/img/home-logo.png
```

## `AssetImg(path)`

Builds a NUI URL under `assets/images`.

```lua
local url = exports['pac-core']:AssetImg('vehicles/adder.png')
-- nui://pac-core/assets/images/vehicles/adder.png
```

## `AssetVehImg(file)`

Builds a NUI URL for a vehicle image under `assets/images/vehicles`.

```lua
local url = exports['pac-core']:AssetVehImg('adder.png')
-- nui://pac-core/assets/images/vehicles/adder.png
```

## `AssetSound(path)`

Builds a NUI URL for a sound file under `assets/sounds`.

```lua
local url = exports['pac-core']:AssetSound('click.mp3')
-- nui://pac-core/assets/sounds/click.mp3
```

## Events and commands

`pac-core` does not currently document a public event or command API here. Integrations should use the exports above unless a future release adds documented events.
