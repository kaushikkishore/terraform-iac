const Vault = require("node-vault");

const vault = Vault({ endpoint: process.env.VAULT_ADDR, token: process.env.VAULT_TOKEN }); 

async function getRDSCredentials() {
  try {

    const response = await vault.read("astuto/rds");
    console.log(response)
    const { username, password } = response.data;
    // Use the retrieved credentials in your Node.js application
    console.log("RDS Username:", username);
    console.log("RDS Password:", password);
  } catch (err) {
    console.error("Error retrieving RDS credentials from Vault:", err);
  }
}

// Call the function during application startup
getRDSCredentials();
