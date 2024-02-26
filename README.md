# Enhancing Robustness in LTR with Limited Data

## About

Building on the foundation of allRank, our extension integrates findings from our research paper, "Exploring the Impact of Objective Function Selection on Robustness for Ranking Tasks with Limited Training Data". We analysed allRank's capabilities to better handle scenarios with limited training data, focusing on the robustness of various objective functions, including Pointwise, RankNet, ApproxNDCG, and NeuralNDCG. Our experiments, conducted on the MQ2008 and MSLR-WEB10K datasets, showcase the importance of selecting the right objective function to improve model performance in data-constrained environments.

## Highlights

- **Objective Functions Analysis**: In-depth examination of Pointwise, RankNet, ApproxNDCG, and NeuralNDCG under limited training data scenarios.
- **Dataset Utilization**: Utilized MQ2008 and MSLR-WEB10K datasets to benchmark the performance of different objective functions.
- **Experimental Insights**: Found ApproxNDCG and NeuralNDCG to be particularly effective in different settings, influencing future LTR model training strategies.

## Getting Started

To replicate our research findings or experiment with your own data under similar constraints, follow the original allRank setup instructions. Use our enhanced configuration options to select the appropriate objective function based on your dataset's size and complexity.

## Customization

Leverage our added functionalities to allRank for experimenting with limited training data:
- **Configurable Objective Functions**: Easily switch between different objective functions to find the most suitable for your dataset.
- **Detailed Experimentation Guide**: Follow our comprehensive guide to conduct experiments that mimic our research setup, allowing for direct comparison and replication of results.

## Research Impact

Our work contributes to the understanding of LTR model robustness in scenarios with restricted data availability. We aim to support both the research community and industry practitioners in developing more resilient LTR models.

## Citation

Please cite our paper if you use our extension in your research:
```
@article{Hellinga2023ObjectiveFunctionLTR,
  title={Exploring the Impact of Objective Function Selection on Robustness for Ranking Tasks with Limited Training Data},
  author={Rixt Hellinga, Joost Jansen, and Yuan Tian},
  journal={ArXiv},
  year={2023},
}
```

Also, continue to cite the allRank framework as per their documentation:
```
@article{Pobrotyn2020ContextAwareLT,
  title={Context-Aware Learning to Rank with Self-Attention},
  author={Przemyslaw Pobrotyn and Tomasz Bartczak and Mikolaj Synowiec and Radoslaw Bialobrzeski and Jaroslaw Bojar},
  journal={ArXiv},
  year={2020},
  volume={abs/2005.10084}
}
```
Additionally, if you use the NeuralNDCG loss function, please cite the corresponding work, [NeuralNDCG: Direct Optimisation of a Ranking Metric via Differentiable Relaxation of Sorting](https://arxiv.org/abs/2102.07831):
```
@article{Pobrotyn2021NeuralNDCG,
  title={NeuralNDCG: Direct Optimisation of a Ranking Metric via Differentiable Relaxation of Sorting},
  author={Przemyslaw Pobrotyn and Radoslaw Bialobrzeski},
  journal={ArXiv},
  year={2021},
  volume={abs/2102.07831}
}
```

## License

Apache 2 License
