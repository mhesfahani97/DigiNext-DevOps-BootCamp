# Tasks Designer
- [RoohAllah-Godazgar](https://www.linkedin.com/in/roohallah-godazgar/)

## Task-1:

## Task-2:

## Task-3:

## Task-4:

## Task-5: Deploy WordPress on Kubernetes

### Helpful Resources
- [Kubernetescreate-cluster-with-kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
- [disable-swap](https://tecadmin.net/disable-swapfile-on-ubuntu/)
- [anton-putra](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnHmccp2xlBENZ1xr4FpjXF)
- [containers-from-the-coach](https://www.youtube.com/watch?v=iC-WxZGhFqs)


## Task-6: Build an Image and Push It to Container Registry
We need to have 2 new tools to go further with our laboratory puzzle (The 1st piece was a healthy K8S cluster):
1. a private git service
2. a private docker registry service
Both of the above services can be deployed with GitLab.  
For the second one, you can also use other tools like Nexus, but we MUST have authentication for these services to simulate a production environment.  
After running these services, you need to import the repository in the 2nd part of the Docker tutorial (Get started - Part 2: Containerize an application) into a repository on your own GitLab.  
Now, create a 1.0.0 tag from the master branch and build the project with the same tag and push the created image to your own Docker registry.  
NOTE: It's a good idea to set up all of your services with some sort of domain (Valid like .com or .ir OR Invalid like .local or .lab).  
In the case of a valid domain, you can use services like Arvancloud or Cloudflare for DNS (It's free to use. This is on you to learn how to work with them).  
Using an invalid domain requires setting the required record on all of your infrastructure in `/etc/hosts` file and beware that you will face a lot of issues related to TLS (SSL).  
We didn't cover reverse proxy yet, which you may need for this to have a clean setup; don't worry, we have a good task for this when we do cover it.

### Helpful Resources
- [Installing self-managed GitLab](https://about.gitlab.com/install/)
- [GitLab CI/CD learning](https://www.youtube.com/playlist?list=PLYrn63eEqAzannVocQrddqsBK-C17e-Sm)
- [Containerization](https://docs.docker.com/language/)
- [Clone to GitLab](https://docs.gitlab.com/ee/administration/settings/import_and_export_settings.html#configure-allowed-import-sources)
- [Add swap](https://www.digitalocean.com/community/tutorial-collections/how-to-add-swap-space)

## Task-7:
