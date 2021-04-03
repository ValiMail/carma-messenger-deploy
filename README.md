# Wrapper for CARMA-Messenger

This repo wraps the CARMA-Messenger software for deployment via Balena.io.

Important paths:

* `modules`: This is where git submodules are organized.
* `dockerfiles`: This is where dockerfiles for services are organized. Many of these are modified copies of originals, which can be found in the original submodule.
* `applications`: This is where we store overrides to the original application code, usually in the form of copied and modified source files. Overrides are organized by version (git release) under this directory.

See submodules for license and copyright information.

Any software contained in or referenced by this repository which is not already distributed under another license, falls under the license for this repository, found in the `LICENSE` file in the root directory of this repository.


## Environment variables:

| Variable name    | Purpose                         |
|------------------|---------------------------------|
| DSRC_ADDRESS     | IP address of DSRC OBU          |
| DSRC_LOCAL_PORT  | DSRC OBU's listening port       |
| DSRC_REMOTE_PORT | DSRC driver's listening port    |

## Notes

You may need to run the config contain and restart containers when you change certain environment variables, like those which define how the DSRC driver works.