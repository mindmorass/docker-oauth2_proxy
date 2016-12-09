# docker oauth2_proxy 

oauth2_proxy in a container

# Usage

Running is similar to running the command directly.
The entrypoint is the actual script and arguments can be passed to them just as you would if it were outside of the container.

From this point down, `oauth2_proxy` will refer to the name of the container so replace as necessary.

Example running from a config file (note about configs: it does not seem like all options are respected [or I'm doing something wrong], running from command line however always gets the results I expect).
```bash
docker run -d oauth2_proxy -config="oauth2_proxy.cfg"
```

This repository is geared to authenticate against our GitHub Enterprise server but can easily be used to auth against other services such as Google.

Example usage running docker directly tied to our GitHub Enterprise server.

Important note: It is expected that you will use DNS or cookies will not work, for dev set up a [hosts file](https://en.wikipedia.org/wiki/Hosts_(file)).

```bash
docker run oauth2_proxy -http-address="yoursite.com" -provider="github" -github-org="Your-Organization-Name" -github-team="team_to_manage_users" -login-url="https://github.com/login/oauth/authorize" -redeem-url="https://github.com/login/oauth/access_token" -validate-url="https://api.github.com/v3" -redirect-url="http://yoursite.com/oauth2/callback" 
```

## compose

Update the `.env` file with some better values and confirm they look okay

```bash
docker-compose config
```

Once you're happy bring it up and test it out

```bash
docker-compose up
```

# Official Documentation

- [https://github.com/bitly/oauth2_proxy/blob/master/README.md](https://github.com/bitly/oauth2_proxy/blob/master/README.md)
