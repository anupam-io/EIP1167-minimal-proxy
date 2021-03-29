const Migrations = artifacts.require("Migrations");
const Thing = artifacts.require("Thing");
const ThingFactory = artifacts.require("ThingFactory");

module.exports = async function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Thing);
  deployer.deploy(ThingFactory, (await Thing.deployed()).address);
};
