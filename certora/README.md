# Running the certora verification tool

These instructions detail the process for running Certora Verification Tool on V2-Core Contracts.

## Prerequisites

Follow the [Certora installation guide](https://docs.certora.com/en/latest/docs/user-guide/getting-started/install.html) in order to get the Certora Prover Package and the `solc` executable folder in your path.

> **Note**
> An API Key is required for local testing. Although the prover will run on a Github Actions' CI environment on selected Pull Requests.

## Running the verification

The Certora Verification Tool proves specs for contracts, which are defined by the `./specs.json` file along with their pre-configured options.

The verification script `./run.js` is used to submit verification jobs to the Certora Verification service.

You can run it from the root of the repository with the following command:

```bash
node certora/run.js [[CONTRACT_NAME:]SPEC_NAME] [OPTIONS...]
```

Where:

- `CONTRACT_NAME` matches the `contract` key in the `./spec.json` file and may be empty.
- `SPEC_NAME` refers to a `spec` key from the `./specs.json` file. It will run every spec if not provided.
- `OPTIONS` extend the [Certora Prover CLI options](https://docs.certora.com/en/latest/docs/prover/cli/options.html#certora-prover-cli-options) and will respect the preconfigured options in the `specs.json` file.


Example usage:

```bash
node certora/run.mjs V2Pair # Run the V2Pair spec
```
> **Note**
> The script now uses `fs/promises` for async file reading. Make sure that the Node.js environment is compatible with ES modules (.mjs) and async file operations.
>

## Tests Done

- `V2Factory`: [The Prover report of the run](https://prover.certora.com/output/604718/0fbc94ff3006402181588546ae5a86e8?anonymousKey=3fc18c911234192e77e3a39b1d32a979400abb01)

    You can also run a [mutation test](https://docs.certora.com/en/latest/docs/gambit/index.html) using:
    ```bash 
    node run.mjs V2Factory --gambit
    ```

    [Mutation report for this run](https://mutation-testing.certora.com/?id=e8731e88-73b4-4e6a-a029-170872a96971&anonymousKey=74e25399-c8a9-4027-9a56-ea5c361e4a44)


---

- `V2Pair`: [The Prover report of the run](https://prover.certora.com/output/15800/2987524d197447f4944e13ed519390f9?anonymousKey=d09bc4f46c5bab5a51296938fbffeb9fcac03252)

    You can also run a mutation test using:
    ```bash 
    node run.mjs V2Pair --gambit
    ```

    [Mutation report for this run](https://mutation-testing.certora.com/?id=e8731e88-73b4-4e6a-a029-170872a96971&anonymousKey=74e25399-c8a9-4027-9a56-ea5c361e4a44)




See https://docs.certora.com for a complete guide.