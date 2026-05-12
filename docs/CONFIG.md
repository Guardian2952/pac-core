# PAC Core Public Config Reference

This repo documents the public compatibility keys that other resources can request from `pac-core`.

## Supported compatibility keys

| Key | Expected value | Description |
| --- | --- | --- |
| `housing` | Resource name string | Housing resource. |
| `framework` | Resource name string | Framework/core resource. |
| `garage` | Resource name string | Garage resource. |
| `mechanic` | Resource name string | Mechanic resource. |
| `vehicle mileage` | Resource name string or list | Mileage resource. Lists allow fallback names. |
| `fuel system` | Resource name string | Fuel resource. |
| `phone` | Resource name string | Phone resource. |
| `dispatch` | Resource name string | Dispatch resource. |
| `character customization` | Resource name string | Appearance/character customization resource. |
| `medical system` | Resource name string | EMS/medical resource. |
| `banking` | Resource name string | Banking resource. |
| `inventory` | Resource name string | Inventory resource. |
| `target` | Resource name string | Targeting resource. |
| `vehicle keys` | Resource name string | Vehicle keys resource. |
| `doorlock` | Resource name string | Door lock resource. |

## Runtime/logging keys

| Key | Expected value | Description |
| --- | --- | --- |
| `print to live console` | `true` / `false` | Enables startup/resource-start compatibility logging. |
| `initial compatibility timeout ms` | Number | How long startup logging waits for pending resources before printing results. |
| `suppress positive logs for scripts` | List of resource names | Suppresses successful compatibility logs for noisy scripts. Negative logs may still print. |

## Example placeholder config

This is intentionally generic and should not be treated as your production config.

```lua
return {
    ['framework'] = 'your-framework-resource',
    ['garage'] = 'your-garage-resource',
    ['inventory'] = 'your-inventory-resource',
    ['fuel system'] = 'your-fuel-resource',
    ['vehicle keys'] = 'your-vehicle-keys-resource',
    ['initial compatibility timeout ms'] = 30000,
    ['print to live console'] = true,
}
```

## Resource state behavior

`CheckCompatibility` treats these resource states as compatible:

```txt
started
starting
```

It treats these states as missing:

```txt
missing
unknown
```

Other states may be treated as pending during startup depending on the private `pac-core` implementation.
