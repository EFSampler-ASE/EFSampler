# *EFSampler*: Towards Effective Sampling of SMT Solutions

*EFSampler* is a novel and effective algorithm for SMT Sampling that achieves high target coverage with fewer solutions.
This repository includes the implementation of *EFSampler*, the benchmarks adopted in the experiments and the experimental results.

## How to Obtain *EFSampler*

*HSCA* is [publicly available on Github](https://github.com/EFSampler/EFSampler). To obtain *HSCA*, a user may use `git clone` to get a local copy of the Github repository:

```sh
git clone https://github.com/EFSampler-ASE/EFSampler.git
```

## Instructions for Building *EFSampler*

*EFSampler* is built on top of the SMT solver [Bitwuzla](https://github.com/bitwuzla) and utilizes the libraries [dbg-macro](https://github.com/sharkdp/dbg-macro) and [clipp](https://github.com/muellan/clipp).
To build this project, users must have [Meson](https://github.com/mesonbuild/meson) installed. Then users may use following commands to build this project:

```sh
sh download_deps.sh
sh build_bitwuzla.sh
make
```

Note that *EFSampler* should be built on a 64-bit GNU/Linux operating system.

## Instructions for Running *EFSampler*

After building *EFSampler*, users may run it with the following command:

```sh
./EFSampler -i [SMT_FORMULA_PATH] -o [OUTPUT_PATH] <optional_parameters>
```

For the required parameters, we list them as follows.

| Parameter | Allowed Values | Description |
| --- | --- | --- |
| -i / -input_file_path | string | path of the input SMT formula |
| -o / -output_file_path | string | path to where the sampled assignment set is saved |

For the optional parameters, we list them as follows.

| Parameter | Allowed Values | Default Value | Description | 
| --- | --- | --- | --- |
| `-seed` | integer | `1` | random seed |
| `-r` | integer | `800` | `r / 1000` represents the target AST-coverage |
| `-samples` | integer | `100` | maximum number of assignments to generate |
| `-lambda` | integer | `50` | size of the candidate set |
| `-score_mode` | integer | `1` | `1` for AST-guided scoring function, `0` for Manhattan distance |

For the optional flags, we list them as follows.

| Flag | Description |
| --- | --- |
| `-not_use_diversitysmt` | Disables DiversitySMT |
| `-not_use_post_opt` | Disables post-sampling optimization technology |

## Example Command for Running *EFSampler*

```sh
./EFSampler -i example.smt2 -o example.samples -samples 10
```

The command above runs *EFSampler* on `example.smt2`, generating up to 10 assignments. The resulting assignment set will be saved in `example.samples`.

## Implementation of *EFSampler*

*EFSampler* is built on top of the SMT solver [Bitwuzla](https://github.com/bitwuzla). The `bitwuzla-patch` directory contains our modifications to Bitwuzla, including the implementation of DiversitySMT. The main implementation of EFSampler is in `EFSampler.cpp`.

## Benchmarks

The `benchmarks/` directory contains two subdirectories with testing benchmarks:

- Large-Scale Benchmarks:

    The `benchmarks/large-scale/` directory contains 550 large-scale benchmarks that can be used as input for testing. Detailed information about these benchmarks is provided in the file [benchmark_information_large_scale.csv](benchmark_information_large_scale.csv).

- Medium-Scale Benchmarks:
    
    The `benchmarks/medium-scale/` directory contains 213 medium-scale benchmarks. Detailed information about these benchmarks is provided in the file [benchmark_information_medium_scale.csv](benchmark_information_medium_scale.csv).

## Experimental Results

The `experimental_results/` directory contains 4 subdirectories, each with `.csv` files presenting the experimental results:

`experimental_results/Results_of_EFSampler_and_its_SOTA_competitors/`: Contains results of *EFSampler* and its state-of-the-art competitors on all large-scale testing benchmarks.

`experimental_results/Results_of_EFSampler_and_its_alternative_versions/`: Contains results of *EFSampler* and its alternative versions on all large-scale testing benchmarks.

`experimental_results/Results_of_EFSampler_with_different_lambda_settings/`: Contains results of *EFSampler* with different $\lambda$ settings on all large-scale testing benchmarks.

`experimental_results/Results_of_medium_scale_benchmarks/`: Contains results of *EFSampler* and its state-of-the-art competitors on all medium-scale testing benchmarks.
