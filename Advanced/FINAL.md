# Cloud Technologies Advanced - Grid Dynamics
Cloud Technologies Advanced - Grid Dynamics

1. Create a network.
* Create a single network with public and private subnets. Network setup should achieve high availability for resources deployed further.
* Create required resources to archive private networking to cloud services from the network. Services: container registry, objects storage, queue service.

2. Create a cloud managed container registry.
* Configure lifecycle policies to remove stale images to optimize costs for storing images.
* The configuration of the CR should provide increased high-availability.
* Restrict public access.

3. Create a cloud managed objects storage.
* Apply lifecycle policies to automatically move objects between tiers for cost optimization.
* Configure it with high-availability in mind.
* Restrict public access.

4. Create cloud managed queue service.
* Restrict public access.

5. Create cloud managed relational databases.  
* Restrict public access and allow access only from the created network.
* Create a dedicated user for the application. Use a bastion host to access the DB. User credentials should be placed in cloud managed secrets store.

6. Deploy cloud managed kubernetes cluster.
* The configuration should allow workloads to be deployed in a private network with an option to be exposed to the public with load balancer solutions.
* The configuration should achieve increased high-availability.
* Access to the kubernetes API should be public.
* Grant kubernetes nodes permissions to pull images from managed container registry.

7. Use cloud cloud proposed solutions for metrics & logs.
* Select appropriate solution for monitoring of kubernetes. Optimize it to be cost effective.
* Enable if needed and configure monitoring for services used.
* Build a dashboard with key metrics for kubernetes cluster and other services.

8. Install and integrate kubernetes addons with cloud.
* In case access to the cloud for the addon is required then it should be fine-grained, scoped, and credential-free.
* Addons should be running on separate nodes isolated from the other workloads.
* [EKS & AKS] Install and configure Karpenter to achieve node autoscaling. Configuration should involve spot interruption handling.
* Install Horizontal Pod Autoscaler controller and Metrics server in case it is not installed.
* Install External Secrets or CSI Secrets Driver addon to securely access secrets in cloud managed secrets stores.
* Install KEDA addon.

9. Deploy the applications.
* Credentials to the relational database should be provided to the backend using External Secrets or CSI Secrets Driver addon. This way secrets provided to the app should be synced with secrets stored in cloud managed secrets store.
* Access for the backend to the object's cloud storage should be credential-free.
* Backend and Frontend should be exposed to the public with the L7 Load Balancer solution.
img-processor should have access to the cloud managed queue and object’s storage.
* Create KEDA ScaledObject targeting cloud queue and kubernetes Deployment of img-processor application to archive scaling based on number of messages in the queue.

10. [optional] Build hub-spoke network topology.
* Create another network that will serve as a hub network.
* Configure cloud managed Point-To-Site VPN connection. It should be configured in such a way that allows access to both hub and spoke network.
* Expose img-processor service with internal load balancer.
* Test access to img-processor
