## Hashicorp Vault setup.

Right now trying to set this up using an EC2 instance. Later a full fledge will setup this.

Installing [Vault](https://developer.hashicorp.com/vault/downloads)

To deploy in production environment follow these [steps](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-deploy)

> the above steps are not full proof ready for production.

Here is official code for the [production ready](https://github.com/hashicorp/vault-guides/tree/master/operations/provision-vault/best-practices/terraform-aws)

1. Create an ec2 instance
2. Login to instance and follow the vault installation steps.
3. Once the installation is done you need to get these variables for the setting up of RDS and application.
4. Grab the vault URL and token to setup the next process.
5. You need to export these in terminal of the next process which will be RDS or application.

`export VAULT_ADDR='http://127.0.0.1:8200'`
`export VAULT_TOKEN='hvs.8oNmKbK0kSgCBOtgq6hOe2zl'`

> Note - This is not a actuals this is created for test purpose. Please make sure you get the actuals.
> In production environment you will get 5 tokens and then using those you need to login out of 3.
