# Squid Proxy on Elestio with CI/CD

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/docker-compose-timescaledb"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a Squid Proxy instance to elestio.

# Once deployed ...

Proxy details:

    host: [CI_CD_DOMAIN]
    port: 18028
    login: root
    password: [APP_PASSWORD] (defined in env var)

you can use those details to configure your web browser or app to use this proxy server

Documentation: https://wiki.squid-cache.org/ConfigExamples

You can change squid settings in the configuration file location in './conf/squid.conf'
You can edit it either with the file explorer or vscode, then restart the app stack to apply changes


Curl example to test your new instance

    curl https://www.google.com --proxy http://root:[APP_PASSWORD]@[CI_CD_DOMAIN]:18028




Node.js example usage

    //#Install packages
    //npm install https-proxy-agent
    //npm install axios


    const HttpsProxyAgent = require("https-proxy-agent");
    const httpsAgent = new HttpsProxyAgent({host: "[CI_CD_DOMAIN]", port: "18028", auth: "root:[APP_PASSWORD]"})
    const axios = require("axios");

    //make a GET request with axios using the proxy server
    var res = await axios.get('https://api.ipify.org?format=json', {
        httpsAgent: httpsAgent,
    });
    console.log(res.data); 





To add a new user:
1) Connect over SSH to the pipeline, you can do that from the dashboard > CI/CD pipeline Open terminal
2) Type this command to create a new user with login "alice32" and password "ZEf651-gr_5xz9ETh"

    echo "ZEf651-gr_5xz9ETh" | htpasswd -i ./conf/passwords alice32

To delete a user:
1) Connect over SSH to the service, you can do that from the service dashboard > Open terminal
2) Type this command to delete the user "alice32"

    htpasswd -D ./conf/passwords alice32
