## Iteration 3 - Items sold at the Event

Use TDD to update the `Event` class so that it adds the following functionality:


1. An `Event` can return a list of *names* of all items the `FoodTrucks` have in stock, sorted alphabetically. This list should not include any duplicate items.
1. An `Event` can return a hash of total inventory that reports the available inventory of all items sold at the event. Specifically, it should include:
    - All items available for sale, and each item should identify the total inventory/quantity for that item, as well as a list of `FoodTruck`s that sell that item.
1. Return a list of overstocked Items for an `Event`. An item is overstocked if it is sold by more than 1 food truck AND the total quantity is greater than 50.

| Method Name               |      Return Value (type)
| ------------------------- | ---------------------------
| `sorted_item_list`        | Alphabetically sorted `Array` of all `FoodTruck` item <u>names</u> (no duplicates!). Array of Strings.
| `total_inventory`         | `Hash` with `Item`s as keys and a sub-hash as the value. The sub-hash should have `quantity` and `food_trucks` keys.(See example below)
| `overstock_items`         | `Array` of `Item` objects
