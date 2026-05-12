-- Example server-side integration with pac-core.

CreateThread(function()
    while GetResourceState('pac-core') ~= 'started' do
        Wait(250)
    end

    local hasInventory, inventoryResource = exports['pac-core']:CheckCompatibility(GetCurrentResourceName(), 'inventory')
    local hasFuel, fuelResource = exports['pac-core']:CheckCompatibility(GetCurrentResourceName(), 'fuel system')

    if hasInventory then
        print(('[server] Inventory resource detected: %s'):format(inventoryResource))
    else
        print('[server] Inventory resource is not configured or not started.')
    end

    if hasFuel then
        print(('[server] Fuel resource detected: %s'):format(fuelResource))
    else
        print('[server] Fuel resource is not configured or not started.')
    end
end)
