# ERPNext with Docker (Ubuntu Server)

For a home lab, learning environment, or proof of concept, the easiest and recommended way to install ERPNext on Ubuntu Server is with Docker. The official [Frappe Docker](https://github.com/frappe/frappe_docker) project provides containerized ERPNext deployments.

## 1. Install Docker

```bash
sudo apt update
sudo apt install -y docker.io docker-compose-v2 git
sudo systemctl enable --now docker
```

Add your user to the Docker group:

```bash
sudo usermod -aG docker $USER
```

Log out and back in (or reboot):

```bash
sudo reboot
```

## 2. Clone the official Frappe Docker repository

```bash
git clone https://github.com/frappe/frappe_docker.git
cd frappe_docker
```

The repository contains both quick-start and production deployment configurations. ([frappe_docker](https://github.com/frappe/frappe_docker), [erpnext_docker](https://github.com/epistemophoros/erpnext_docker))

## 3. Start a quick ERPNext instance

```bash
docker compose -f pwd.yml up -d
```

The quick-start setup automatically creates the ERPNext site and installs the required services. ([infintrixtech.com](https://infintrixtech.com/blog/how-to-install-erpnext-on-docker-step-by-step-guide))

## 4. Monitor startup

```bash
docker ps
docker compose -f pwd.yml logs -f
```

Wait until site creation is complete.

## 5. Open ERPNext

In your browser, open:

```
http://SERVER-IP:8080
```

The initial setup wizard should appear. ([s-edv.com](https://s-edv.com/anleitungen/erpnext-docker-erp-system), [infintrixtech.com](https://infintrixtech.com/blog/how-to-install-erpnext-on-docker-step-by-step-guide))

## Production deployment

If your goal is to:

- access ERPNext from the Internet,
- use a custom domain,
- enable HTTPS/SSL,
- keep business data permanently,

then use the production `compose.yaml` deployment rather than `pwd.yml`. The quick-start deployment is intended for evaluation and testing only. ([infintrixtech.com](https://infintrixtech.com/blog/how-to-install-erpnext-on-docker-step-by-step-guide), [erpnext_docker](https://github.com/epistemophoros/erpnext_docker))

## Recommended server size

| Use | vCPU | RAM | Disk |
|---|---|---|---|
| Learning | 2 | 4 GB | 40 GB SSD |
| Production | 4 | 8 GB | 160 GB SSD or more |

Sources: [s-edv.com](https://s-edv.com/anleitungen/erpnext-docker-erp-system), [discuss.frappe.io](https://discuss.frappe.io/t/tutorial-docker-installing-erpnext-16-on-docker-a-step-by-step-guide-production/160885)

## Why start with Docker

For studying ERP systems and business processes, start with the Docker deployment. It lets you focus on learning the ERPNext modules (CRM, Sales, Purchasing, Inventory, Manufacturing, Accounting) without spending hours on manual dependency installation. ([frappe_docker](https://github.com/frappe/frappe_docker), [infintrixtech.com](https://infintrixtech.com/blog/how-to-install-erpnext-on-docker-step-by-step-guide))
