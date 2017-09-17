# gcloud-docker-login

Generates '.dockercfg' file with a valid GCR access token, given a
service account JSON content.

The use-case is for cases when using a CI/CD tool and you need an
authenticated Docker session to [Google Container Registry](https://cloud.google.com/container-registry/)
without much hassle.

To accomplish this simple task, this image accepts an environment
variable called `GCP_SA_JSON`, which it expects to contain your service
account's JSON content (NOT the path to the file!), and uses `gcloud` to
create an authenticated `.dockercfg` file, using
`gcloud docker --authorize-only`.

The image will print out the `.dockercfg` contents to `stdout` which
allows you to manipulate it in any way you see fit (but usually you'll
just want to redirect it to a file.)

## Examples

Assuming you have a service account JSON key at `my-sa-key.json`, use
this command to create a `.dockercfg` file that will use your service
account file to access GCR:

    docker run -e "GCP_SA_JSON=$(cat my-sa-key.json)" infolinks/gcloud-docker-login > ~/.dockercfg

## Contributions

Any contribution to the project will be appreciated! Whether it's bug reports, feature requests, pull requests - all are welcome, as long as you follow our [contribution guidelines for this project](CONTRIBUTING.md) and our [code of conduct](CODE_OF_CONDUCT.md).
