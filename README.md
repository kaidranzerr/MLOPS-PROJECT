


# 🚗 Vehicle Data ML Project

An end-to-end **ML pipeline project** integrating **MongoDB, AWS, Docker, GitHub Actions, and CI/CD**.
This repo demonstrates **data ingestion, validation, transformation, training, evaluation, and deployment** with a scalable architecture.

---

## 📂 Project Structure

```
project/
│-- .github/workflows/        # GitHub Actions (CI/CD)
│-- notebook/                 # Jupyter notebooks (EDA, MongoDB demo, Feature Engg.)
│-- src/                      # Source code
│   ├── components/           # Data ingestion, validation, transformation, training
│   ├── configuration/        # DB & AWS connections
│   ├── data_access/          # MongoDB data fetch logic
│   ├── entity/               # Configs, artifacts, estimators
│   └── utils/                # Utility scripts
│-- requirements.txt
│-- setup.py
│-- pyproject.toml
│-- app.py                    # Flask app for prediction pipeline
```

---

## ⚡ Getting Started

### 1️⃣ Project Initialization

```bash
# Create project template
python template.py
```

### 2️⃣ Local Package Setup

* Add code to **setup.py** and **pyproject.toml** to import local packages
  (see details in `crashcourse.txt`)

---

## 🐍 Virtual Environment & Requirements

```bash
conda create -n vehicle python=3.10 -y
conda activate vehicle

# Add dependencies to requirements.txt, then:
pip install -r requirements.txt

# Verify installations
pip list
```

---

## 🍃 MongoDB Setup

1. Sign up at [MongoDB Atlas](https://www.mongodb.com/atlas).
2. Create project → Create cluster (M0 free tier).
3. Add DB user (username/password).
4. Network access → Add IP `0.0.0.0/0`.
5. Get **Python connection string** → replace password.
6. Create `notebook/mongoDB_demo.ipynb` → load dataset → push to MongoDB.
7. Verify in **Atlas Dashboard → Collections**.

---

## 📝 Logging, Exceptions & EDA

* Create `logger.py` & `exception.py`, test via `demo.py`.
* Add **EDA & Feature Engineering** notebooks.

---

## 📥 Data Ingestion

* Define constants in `constants/__init__.py`.
* Implement MongoDB connection in `configuration/mongo_db_connections.py`.
* Build ingestion logic in `data_access/` + `entity/` classes.
* Run pipeline via `demo.py` after setting MongoDB URL:

```bash
# Bash
export MONGODB_URL="mongodb+srv://<username>:<password>@cluster0.mongodb.net/..."
echo $MONGODB_URL

# PowerShell
$env:MONGODB_URL="mongodb+srv://<username>:<password>@cluster0.mongodb.net/..."
echo $env:MONGODB_URL
```

> Add `artifact/` to `.gitignore`.

---

## 🔍 Data Validation, Transformation & Training

* Define schema in `config/schema.yaml`.
* Implement:

  * **Data Validation**
  * **Data Transformation** (add `estimator.py`)
  * **Model Trainer** (extend `estimator.py`)

---

## ☁️ AWS Setup

1. Create IAM user (`firstproj`) with **AdministratorAccess**.
2. Generate access keys → save CSV.
3. Set env variables:

```bash
# Bash
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
echo $AWS_ACCESS_KEY_ID

# PowerShell
$env:AWS_ACCESS_KEY_ID="..."
$env:AWS_SECRET_ACCESS_KEY="..."
echo $env:AWS_ACCESS_KEY_ID
```

4. Create **S3 bucket** (`my-model-mlopsproj`).
5. Add AWS config code in `src/configuration/aws_connection.py` & `entity/s3_estimator.py`.

---

## 📊 Model Evaluation & Pusher

* Implement evaluation & model registry (S3).
* Build prediction pipeline via `app.py`.
* Add `static/` & `templates/` dirs for Flask app.

---

## 🐳 Docker & CI/CD

### Docker Setup

```bash
# Dockerfile + .dockerignore
docker build -t vehicleproj .
docker run -p 5080:5080 vehicleproj
```

### GitHub Actions

* Workflow file in `.github/workflows/aws.yaml`.
* Create IAM user (`usvisa-user`) → generate access keys.
* Setup **ECR repo** (`vehicleproj`).
* Setup **EC2 Ubuntu server** (t2.medium).
* Install Docker on EC2.
* Configure **GitHub self-hosted runner** on EC2.
* Add GitHub secrets:

  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`
  * `AWS_DEFAULT_REGION`
  * `ECR_REPO`

Pipeline auto-triggers on `git push`.

---

## 🚀 Deployment

* Open EC2 → Security Groups → inbound rule:

  * TCP | Port: `5080` | Source: `0.0.0.0/0`.
* Launch app at:

```
http://<EC2_PUBLIC_IP>:5080
```

* Model training available at:

```
/training
```

---

## ✅ Summary

This project demonstrates:

* Modular ML pipeline design
* MongoDB Atlas integration
* AWS S3, ECR, EC2 setup
* CI/CD with GitHub Actions
* Dockerized deployment

---

✨ With this pipeline, you can go from **raw data → training → deployment** fully automated with CI/CD.

