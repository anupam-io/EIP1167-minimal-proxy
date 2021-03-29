const assert = require("assert");
const Thing = artifacts.require("Thing");
const ThingFactory = artifacts.require("ThingFactory");

contract("Thing", async (addresses) => {
  const n = 3;
  const names = ["mango", "apple", "banana"];
  const values = [1, 2, 5];

  it("can fly.", async () => {
    // Deploying base thing
    const baseThing = await Thing.new();
    // Deploying the ThingFactory
    const f = await ThingFactory.new(baseThing.address);

    // Creating new things
    for (i = 0; i < n; i++) {
      await f.createThing(names[i], values[i]);
    }

    // Reading created things
    const thingList = await f.giveThings();
    assert.strictEqual(thingList.length, n);

    // Checking names & values for created things
    for (i = 0; i < n; i++) {
      const thing = await Thing.at(thingList[i]);
      assert.strictEqual(await thing.name(), names[i]);
      assert.strictEqual(parseInt(await thing.value()), values[i]);
    }
  });

  it("can't be initiated twice.", async () => {
    // Deploying base thing
    const baseThing = await Thing.new();
    // Deploying the ThingFactory
    const f = await ThingFactory.new(baseThing.address);

    // Creating new things
    await f.createThing(names[0], values[0]);
    const thingList = await f.giveThings();
    const thing = await Thing.at(thingList[0]);

    await thing
      .init(names[1], values[1])
      .then(() => assert(false))
      .catch((e) => assert(true));
  });
});
