-- Example client-side integration with pac-core.

CreateThread(function()
    while GetResourceState('pac-core') ~= 'started' do
        Wait(250)
    end

    local hasGarage, garageResource = exports['pac-core']:CheckCompatibility(GetCurrentResourceName(), 'garage')
    local framework = exports['pac-core']:GetCompatibility('framework')

    print(('[client] Framework configured as: %s'):format(framework or 'none'))

    if hasGarage then
        print(('[client] Garage resource detected: %s'):format(garageResource))
    end

    local assets = {
        logo = exports['pac-core']:Asset('assets/other/img/home-logo.png'),
        adder = exports['pac-core']:AssetVehImg('adder.png'),
        click = exports['pac-core']:AssetSound('click.mp3')
    }

    SendNUIMessage({
        action = 'pacCoreAssetsReady',
        assets = assets
    })
end)
