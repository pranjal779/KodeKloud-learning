<img width="638" height="855" alt="image" src="https://github.com/user-attachments/assets/be128934-a53f-4b84-869d-fcde266b0a6b" />  
<img width="1923" height="1040" alt="image" src="https://github.com/user-attachments/assets/2f4ba8e8-3cd7-45b6-a22a-07947adcf22e" />
<img width="1520" height="640" alt="image" src="https://github.com/user-attachments/assets/41c3adf1-e170-4bdd-9e13-6354d2f5b457" />
<img width="2057" height="1083" alt="image" src="https://github.com/user-attachments/assets/74d7df91-339c-4c4b-adca-9af8f5e0f68f" />
<img width="1897" height="1082" alt="image" src="https://github.com/user-attachments/assets/9cf4cb50-0131-4152-acb2-eef9ad1c290d" />
<img width="1870" height="1017" alt="image" src="https://github.com/user-attachments/assets/9f2a36f3-7104-4569-a285-ef3bb236690e" />
<img width="1887" height="1045" alt="image" src="https://github.com/user-attachments/assets/d26b5ec7-b6b6-49f6-9ea5-b4990fbd87cb" />
<img width="1967" height="887" alt="image" src="https://github.com/user-attachments/assets/812d7bf2-78df-4ab1-bb1d-5a4c16103fdb" />
<img width="1941" height="992" alt="image" src="https://github.com/user-attachments/assets/7db7456c-68d7-4409-8385-1a2116e51988" />

# Basics of CI/CD

- Code residing on th main or master branch is deployed to production server or evironment.
- Feature branch functions as a clone of the main codebase, enabling developers to work on a new feature until it's fully developed
- Before merging, a review process is carried out, and the changes require approval from relevant team members or individuals

# CI - Continuous Integration 
- Continuous Integration (CI) is a DevOps practice where developers frequently merge code changes into a central repository, after which automated builds and tests are run. This approach helps to find and fix bugs faster, improve software quality, and reduce the time it takes to release new updates. The core components are frequent code integration and an automated system for building and testing the software with each integration. 
<img width="1991" height="966" alt="image" src="https://github.com/user-attachments/assets/44c71bc5-c98a-4670-a558-e8f002a9c2ef" />
<img width="2006" height="967" alt="image" src="https://github.com/user-attachments/assets/5ad728fa-1a22-429e-8030-80eceb6b1564" />
<img width="1957" height="973" alt="image" src="https://github.com/user-attachments/assets/1ffe9d77-c5dd-4dd2-9eb8-9cf56d96400b" />
<img width="1967" height="881" alt="image" src="https://github.com/user-attachments/assets/01084700-60be-4020-8066-fefb1659367f" />
**Runs Tests agains in the CI stage again when the Merge happens**

# Continuous Delivery/Deployment
Continuous delivery and continuous deployment are both DevOps practices that automate software release pipelines, but the key difference is manual approval. Continuous delivery automates the release process so that code is always ready to be deployed, but a manual approval is required before it goes to production. Continuous deployment takes it a step further, automatically releasing every change that passes automated tests directly to production without any manual intervention. 

## Continuous Delivery 

• Definition: An extension of continuous integration where every change is automatically built, tested, and prepared for a release to a production environment. 
• Key characteristic: The final deployment to production is a manual "push of a button" decision. 
• Best for: Organizations that need to maintain a higher degree of control over when releases happen, or for situations requiring manual acceptance testing before each release. 
• Process: 

	1. Code is committed to a repository. 
	2. An automated pipeline builds and tests the code. 
	3. If all tests pass, the artifact is ready for production. 
	4. A human makes a manual decision and clicks a button to deploy to production. 

## Continuous Deployment 

• Definition: An extension of continuous delivery that automatically deploys every change that passes the automated testing pipeline to the production environment. 
• Key characteristic: Once automated tests are passed, the deployment to production happens without any manual approval. 
• Best for: Companies that want to achieve the fastest possible release cycles, such as many web-based applications, and have high confidence in their automated test suite. 
• Process: 

	1. Code is committed to a repository. 
	2. An automated pipeline builds and tests the code. 
	3. If all tests pass, the code is automatically deployed to production. 

**How they relate to each other:** 

• Both rely on a high degree of automation for building and testing code. 
• Continuous delivery is a prerequisite for continuous deployment. You must have the capability to ready a release manually (continuous delivery) before you can fully automate it (continuous deployment). 
• While continuous deployment sends every passing change to production, continuous delivery allows for more traditional release cycles, such as scheduled releases or batching multiple changes together, as shown in this [YouTube video](https://www.youtube.com/watch?v=AGvQTbTskqk). 

<img width="1973" height="1068" alt="image" src="https://github.com/user-attachments/assets/0ae20e0e-bfac-44de-8bad-0e941ea1e1cc" />
<img width="1992" height="1105" alt="image" src="https://github.com/user-attachments/assets/41dd379e-037f-44c2-a12d-3b480dac2ecb" />
<img width="1977" height="1063" alt="image" src="https://github.com/user-attachments/assets/1a814ff9-3d96-48f3-8ae2-98b31fccc3ab" />
<img width="1957" height="1142" alt="image" src="https://github.com/user-attachments/assets/42d9830e-d4a6-46a1-93a9-cc9e437bdf8c" />


# GitHub Repositories for the course:

- https://github.com/sidd-harth/jenkins-hello-world.git

- https://github.com/jenkins-kk-demo/parameterized-pipeline-job-init

- https://github.com/sidd-harth/solar-system-gitea
