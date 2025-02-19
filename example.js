const RPC = require("discord-rpc");

const clientId = ""; // El cliente ID de tu aplicacion de discord

const rpc = new RPC.Client({ transport: "ipc" });

const startTimestamp = Date.now();

async function setActivity() {
    if (!rpc) return;
    rpc.setActivity({
        details: "Playing example blabla",
        state: "This is a very good game!",
        largeImageKey: "example.png",
        largeImageText: "example",
        startTimestamp: startTimestamp
    });
}

rpc.on("ready", () => {
    console.log("Rich Presence activado!");
    setActivity();
    setInterval(setActivity, 15 * 1000);
});

rpc.login({ clientId }).catch(console.error);
