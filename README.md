# alertPolicy_vertexAI
用Terraform 创建 GCP上的监控政策，实现对Gemini或Claude3用量的监控（**监控一小时的用量**）

### 0. 进入Cloud Shell

![image-20241115150403151](image-20241115150403151.png)

### 1.克隆本项目到本地 并进入工作目录

```shell
git clone https://github.com/CLZRT/alertPolicy_vertexAI.git && cd alertPolicy_vertexAI
```

### 2. 初始化 Terraform环境 

```shell
terraform init
```

### 3. 创建 告警政策

> 参考阈值参数设置
>
> - 输入阈值：1000,0000token,
> - 输出阈值：200,0000token

```shell
terraform apply -var="email=Your_Email" -var="project_id=Your_ProjectId" -var="token_threshold=Your_input_threshold" -var="request_threshold=Your_output_threshold"
```

### 4. 输入关键参数

> var.email "用于接受通知的邮箱"
>
> var.project_id "要监控Gemini 和Claude3用量的项目id"
>
> var.token_threshold "Gemini 或者Claude3 输入用量的阈值，当一小时的模型输入大于阈值时发送告警邮件" 
>
> var.request_threshold "Gemini 或者Claude3 输出用量的阈值，当一小时的模型输出大于阈值时发送告警邮件" 

### 5. 删除相关资源

```shell
terraform destroy -var="email=Your_Email" -var="project_id=Your_ProjectId" -var="token_threshold=Your_input_threshold" -var="request_threshold=Your_output_threshold"
```

