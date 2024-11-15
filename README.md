# alertPolicy_vertexAI
用Terraform 创建 GCP上的监控政策，实现对Gemini或Claude3用量的监控



### 1. 初始化 Terraform环境 

```shell
terraform init
```

### 2. 创建 告警政策

```shell
terraform apply
```

### 3. 输入关键参数

> var.email "用于接受通知的邮箱"
>
> var.project_id "要监控Gemini 和Claude3用量的项目id"
>
> var.token_threshold "Gemini 或者Claude3 输入用量的阈值"
>
> var.request_threshold "Gemini 或者Claude3 输出用量的阈值"

