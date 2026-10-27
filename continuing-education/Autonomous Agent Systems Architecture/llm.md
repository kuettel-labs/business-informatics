# 🧠 List of Major LLMs (with Links)

## Table of Contents

- [Frontier / Flagship Models](#-frontier--flagship-models)
- [Machine-Native Decision Models](#machine-native-decision-models)
- [Open-Source Models](#-opensource-models)
- [Domain-Specialized Models](#-domainspecialized-models)
  - [Coding](#coding)
  - [Medical](#medical)
  - [Finance](#finance)
- [Lightweight / Mobile Models](#-lightweight--mobile-models)
- [Multimodal Models](#-multimodal-models-text--vision--audio)
- [Embedded / Product-Integrated Models](#-embedded--productintegrated-models)
  - [Standalone AI Assistants](#standalone-ai-assistants)
  - [Productivity & Office](#productivity--office)
  - [Developer Tools](#developer-tools)
  - [Search & Browsers](#search--browsers)
  - [Operating Systems & Devices](#operating-systems--devices)
  - [Creative & Design](#creative--design)
  - [Marketing & Content](#marketing--content)
  - [Social & Consumer](#social--consumer)
  - [Enterprise & CRM](#enterprise--crm)
  - [Developer Platform](#developer-platform)
- [AI Developer Platforms](#ai-developer-platforms)
  - [AI Model Providers & APIs](#1-ai-model-providers--apis)
  - [AI Coding & Application Development](#2-ai-coding--application-development)
  - [AI Agent Frameworks & Orchestration](#3-ai-agent-frameworks--orchestration)
  - [LLM Observability, Evaluation & Testing](#4-llm-observability-evaluation--testing)
  - [Vector Databases & Retrieval](#5-vector-databases--retrieval)
  - [Model Hosting, Inference & Deployment](#6-model-hosting-inference--deployment)
  - [Fine-Tuning, Training & MLOps](#7-fine-tuning-training--mlops)
  - [Low-Code & Visual AI Development](#8-low-code--visual-ai-development)
  - [Agent Protocols & Tool Integration](#9-agent-protocols--tool-integration)
  - [AI Application Backend & Infrastructure](#10-ai-application-backend--infrastructure)
  - [Developer Learning & Discovery](#11-developer-learning--discovery)
- [Events](#12-events)
- [Model Cost](#model-cost)
  - [Major LLM API Cost Comparison](#-major-llm-api-cost-comparison-usd-per-1m-tokens)
  - [Cheapest Models by Input Cost](#-cheapest-models-by-input-cost)
  - [Frontier Model Cost Comparison](#-frontier-model-cost-comparison)
  - [Claude Family Cost Comparison](#-claude-family-cost-comparison)
  - [Cost per 100M Input Tokens](#-cost-per-100m-input-tokens)
  - [Open-Source / Self-Hosted Models](#-open-source--self-hosted-models)
- [Privacy, Data Protection, Compliance, and Security Considerations](#privacy-data-protection-compliance-and-security-considerations)

## 🚀 Frontier / Flagship Models
- [OpenAI](https://openai.com) [Models](https://developers.openai.com/api/docs/models?utm_source=chatgpt.com) (Astra, Sol, Luna, Terra)
- [Anthropic Models](https://www.anthropic.com/news/models) - [Claude Family](https://claude.ai) (Sonnet, Opus, Haiku)
- [Google Gemini Pro / Ultra / Flash](https://gemini.google.com)
- [Meta Llama](https://ai.meta.com/llama)
- [Microsoft Copilot](https://copilot.microsoft.com)
- [xAI Grok](https://x.ai)
- [Mistral Large / Medium](https://mistral.ai)
- [Cohere Command R+ / Command R](https://cohere.com)
- [Alibaba Qwen](https://qwenlm.ai)
- [Tencent Hunyuan](https://hunyuan.tencent.com)
- [Baidu ERNIE Bot](https://yiyan.baidu.com)
- [Huawei Pangu](https://www.huaweicloud.com/intl/en-us/product/pangu)

### 🧠 Frontier Model Comparison Table (2026)

| Frontier Model Family | Key Models | Reasoning | Coding / Tool Use | Multimodality | Safety Alignment | Openness | Best Use Cases |
|----------------------|------------|-----------|--------------------|---------------|------------------|----------|----------------|
| **OpenAI** | Astra, Sol, Luna, Terra | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Closed | Agentic systems, workflow orchestration, multi‑bot coordination |
| **Anthropic** | Claude Opus, Sonnet, Haiku | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Closed | Safety‑critical agents, regulated industries, factual analysis |
| **Google** | Gemini Pro, Ultra, Flash | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | Closed | Multimodal agents, long‑context workflows, video/audio processing |
| **Meta** | Muse, SAM | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | Open‑source | Private cloud agents, self‑hosted multi‑agent systems |
| **Microsoft** | Copilot (frontier model integration) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Closed | Enterprise automation, workflow agents, productivity orchestration |
| **xAI** | Grok | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | Closed | Real‑time conversational agents, consumer systems |
| **Mistral** | Mistral Large, Medium | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | Partly open | High‑speed agents, EU‑centric deployments, low‑latency workflows |
| **Cohere** | Command R+, Command R | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐ | Closed | RAG‑heavy agents, enterprise knowledge systems |
| **Alibaba** | Qwen | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | Open + Closed | Multilingual agents, Asia‑focused deployments |
| **Tencent** | Hunyuan | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | Closed | China‑based enterprise agents, multimodal workflows |
| **Baidu** | ERNIE Bot | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | Closed | Chinese‑language agents, Baidu ecosystem integrations |
| **Huawei** | Pangu | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | Closed | Industry‑specific agents (manufacturing, telecom, scientific) |

## Machine-Native Decision Models

- [TypeSafe AI — Jev](https://typesafe.ai) ([documentation](https://docs.typesafe.ai/)) — A machine-native decision model, not a general-purpose text generator. It answers focused, typed questions with choices, scores, or yes/no values and probabilities; use it for bounded decisions in software, not for generating text or SQL. The current Jev 1.14 listing is \$0.042 per million input tokens, with output tokens free ([model details and pricing](https://docs.typesafe.ai/models)).

### Claude Model Comparison (Opus vs Sonnet vs Haiku)

| Model | Intelligence | Speed | Cost | Strengths | Weaknesses | Best Use Cases |
|-------|-------------|-------|------|-----------|------------|----------------|
| **Claude Opus** | ⭐⭐⭐⭐⭐ | ⭐⭐ | 💰💰💰 | Deep reasoning, complex problem solving, strongest coding, best long‑context reliability | Slowest, most expensive, overkill for simple tasks | Advanced agentic workflows, multi‑step planning, research, safety‑critical decisions |
| **Claude Sonnet** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 💰💰 | Strong reasoning, fast, reliable, low hallucination, excellent writing/analysis | Slightly weaker than Opus on very hard reasoning, limited multimodality | Production agents, enterprise workflows, coding assistance, long‑context analysis |
| **Claude Haiku** | ⭐⭐ | ⭐⭐⭐⭐⭐ | 💰 | Extremely fast, very cheap, good summarization, strong for high‑volume tasks | Weak reasoning, not ideal for coding or complex workflows | Lightweight agents, routing, summaries, customer support, high‑throughput tasks |


## 🧩 Open‑Source Models
- [Llama](https://github.com/meta-llama)
- [Mixtral](https://mistral.ai)
- [Qwen](https://github.com/QwenLM)
- [Phi‑3 (Mini, Small, Medium)](https://github.com/microsoft/phi-3)
- [Gemma](https://ai.google.dev/gemma)
- [Yi](https://github.com/01-ai)
- [Jais](https://www.inceptioniai.org/jais)
- [StarCoder](https://huggingface.co/bigcode)
- [DeepSeek](https://github.com/deepseek-ai)
- [OpenHermes](https://huggingface.co/teknium)
- [Nous Hermes](https://huggingface.co/NousResearch)
- [Falcon](https://huggingface.co/tiiuae)
- [GPT‑NeoX](https://github.com/EleutherAI)

## 🧪 Domain‑Specialized Models

### Coding
- [OpenAI](https://openai.com)
- [DeepSeek‑Coder](https://github.com/deepseek-ai)
- [CodeLlama](https://ai.meta.com/llama)
- [StarCoder](https://huggingface.co/bigcode)

### Medical
- [Med‑PaLM](https://sites.research.google/med-palm)
- [BioGPT](https://github.com/microsoft/BioGPT)
- [MedGemini](https://ai.google.dev)

### Finance
- [BloombergGPT](https://www.bloomberg.com/company/announcements/bloomberggpt)
- [FinGPT](https://github.com/AI4Finance-Foundation/FinGPT)

## 📱 Lightweight / Mobile Models
- [Phi‑3 Mini / Small / Medium](https://github.com/microsoft/phi-3)
- [Gemma](https://ai.google.dev/gemma)
- [Llama](https://github.com/meta-llama)
- [Qwen Tiny / Small](https://github.com/QwenLM)

## 🎨 Multimodal Models (Text + Vision + Audio)
- [GPT‑4o](https://openai.com)
- [Claude Sonnet Vision](https://www.anthropic.com)
- [Gemini Pro](https://gemini.google.com)
- [Llama Vision](https://github.com/meta-llama)
- [Grok‑Vision](https://x.ai)
- [Qwen‑VL](https://github.com/QwenLM/Qwen-VL)

## 🔧 Embedded / Product‑Integrated Models
> Model lineups change often. Verify against each vendor's docs before relying on this list.

## Standalone AI Assistants
- [**ChatGPT**](https://chat.openai.com): OpenAI GPT models
- [**Claude**](https://claude.ai): Anthropic Claude models

## Productivity & Office
### [**Microsoft 365 Copilot**](https://www.microsoft.com/microsoft-365/copilot)
OpenAI GPT models, plus Anthropic Claude in some features
- [Free](https://copilot.com) / [App](https://apps.microsoft.com/detail/xp9cxngppj97xx?hl=de-DE&gl=CH) — General AI chat, web research, writing, image generation
- [Edge](https://explore.microsoft.com/en-us/edge/copilot?ep=2371&es=394&cs=2216049023&form=MA13SQ) — Ask questions about webpages, summarize content, browse with AI assistance
- [365 Copilot Chat — AI chat for work, web research, document assistance](https://m365.cloud.microsoft/?utm_source=chatgpt.com)
- [365 Copilot Personal/Family/Premium — AI assistance within Office documents and personal productivity workflows](https://www.microsoft.com/de-de/copilot/pricing/individuals?market=de)
- [365 Copilot Business — Work-aware AI using organizational content, with enterprise controls](https://www.microsoft.com/en-us/copilot/solutions/business)
### Others
- [**Google Workspace (Gmail, Docs, Sheets)**](https://workspace.google.com/solutions/ai/): Google Gemini
- [**Notion AI**](https://www.notion.so/product/ai): Multiple third-party LLMs (OpenAI, Anthropic)
- [**Slack AI**](https://slack.com/features/ai): Hosted LLMs, plus Claude via integrations
- [**Zoom AI Companion**](https://www.zoom.com/en/ai-assistant/): Mix of proprietary and third-party LLMs
- [**Grammarly**](https://www.grammarly.com): Proprietary models plus third-party LLMs

## Developer Tools
- [**GitHub Copilot Free** — Code completion, coding chat and limited agent usage **Pro** — More AI credits, model choices and advanced coding workflows **Business** — Team coding assistance, governance and enterprise controls](https://github.com/features/copilot/plans) — OpenAI GPT, Anthropic Claude, Google Gemini (selectable)
- [**Cursor**](https://cursor.com): Multi-model (OpenAI, Anthropic, Google, own models)
- [**Claude Code**](https://www.anthropic.com/claude-code): Anthropic Claude
- [**JetBrains AI Assistant**](https://www.jetbrains.com/ai/): Multi-provider LLMs

## Search & Browsers
- [**Google Search (AI Overviews / AI Mode)**](https://search.google/): Gemini
- [**Bing / Edge Copilot**](https://copilot.microsoft.com): OpenAI GPT models
- [**Perplexity**](https://www.perplexity.ai): Own Sonar models plus third-party frontier models
- [**Claude in Chrome**](https://claude.com/chrome): Anthropic Claude

## Operating Systems & Devices
- [**Apple Intelligence (iOS/macOS)**](https://www.apple.com/apple-intelligence/): Apple Foundation Models, optional ChatGPT integration
- [**Samsung Galaxy AI**](https://www.samsung.com/global/galaxy/galaxy-ai/): Google Gemini plus on-device models
- [**Windows Copilot**](https://www.microsoft.com/en-us/windows/copilot-ai-features): OpenAI GPT models, plus on-device small models
- [**Amazon Alexa+**](https://www.amazon.com/alexa-plus): Amazon Nova, Anthropic Claude

## Creative & Design
- [**Adobe Firefly / Creative Cloud**](https://www.adobe.com/products/firefly.html): Adobe Firefly, plus partner models
- [**Canva Magic Studio**](https://www.canva.com/magic/): Proprietary plus third-party models
- [**Figma AI**](https://www.figma.com/ai/): Third-party and proprietary models

## Marketing & Content
- [**Jasper**](https://www.jasper.ai): Multi-model (OpenAI, Anthropic, Google), plus proprietary tuning

## Social & Consumer
- [**Meta AI (WhatsApp, Instagram, Messenger)**](https://www.meta.ai): Meta Llama
- [**Snapchat My AI**](https://www.snapchat.com): OpenAI and Google models
- [**Duolingo Max**](https://blog.duolingo.com/duolingo-max/): OpenAI GPT models
- [**Spotify AI DJ**](https://support.spotify.com/article/dj/): Proprietary plus OpenAI-powered commentary

## Enterprise & CRM
- [**Salesforce Agentforce / Einstein**](https://www.salesforce.com/agentforce/): Multi-model (OpenAI, Anthropic, others)
- [**ServiceNow Now Assist**](https://www.servicenow.com/products/now-assist.html): Proprietary plus third-party LLMs
- [**Intercom Fin**](https://fin.ai): Third-party LLMs (Anthropic, OpenAI)

## Developer Platform

# AI Developer Platforms

## 1. AI Model Providers & APIs
- [OpenAI Platform](https://platform.openai.com/) — GPT models, APIs, tools, and agents
- [TypeSafe AI](https://typesafe.ai/) — Jev machine-native decision model and API
- [Anthropic Console](https://console.anthropic.com/) — Claude models and agentic workflows
- [Google AI Studio](https://aistudio.google.com/) — Gemini models and API prototyping
- [Google Cloud Vertex AI](https://cloud.google.com/vertex-ai) — Managed AI models and deployment
- [Microsoft Foundry](https://ai.azure.com/) — Azure AI models, agents, and enterprise applications
- [AWS Bedrock](https://aws.amazon.com/bedrock/) — Foundation models and managed agents
- [Mistral AI](https://console.mistral.ai/) — Open-weight and commercial language models
- [xAI](https://console.x.ai/) — Grok models and APIs
- [Hugging Face](https://huggingface.co/) — Open models, datasets, and inference
- [Cohere](https://cohere.com/) — Enterprise language models and retrieval

## 2. AI Coding & Application Development
- [GitHub Copilot](https://github.com/features/copilot) — AI coding assistant
- [Cursor](https://cursor.com/) — AI-native code editor
- [Windsurf](https://windsurf.com/) — AI-powered development environment
- [Replit](https://replit.com/) — Browser-based coding and deployment
- [Lovable](https://lovable.dev/) — AI-assisted full-stack application development
- [Bolt.new](https://bolt.new/) — Prompt-driven web application development
- [v0](https://v0.dev/) — AI-generated user interfaces and web applications
- [Google Antigravity](https://antigravity.google/) — Agent-oriented development environment
- [Cline](https://cline.bot/) — Open-source coding agent
- [Roo Code](https://roocode.com/) — Configurable AI coding agent

## 3. AI Agent Frameworks & Orchestration
- [OpenAI Agents SDK](https://openai.github.io/openai-agents-python/) — Agent development framework
- [LangChain](https://www.langchain.com/) — LLM applications and agent development
- [LangGraph](https://www.langchain.com/langgraph) — Stateful agent workflows
- [LlamaIndex](https://www.llamaindex.ai/) — Data-connected AI agents and RAG
- [Microsoft Agent Framework](https://github.com/microsoft/agent-framework) — Agent orchestration and workflows
- [Semantic Kernel](https://github.com/microsoft/semantic-kernel) — AI integration SDK
- [Google ADK](https://google.github.io/adk-docs/) — Agent Development Kit
- [CrewAI](https://www.crewai.com/) — Multi-agent orchestration
- [AutoGen](https://github.com/microsoft/autogen) — Multi-agent applications
- [Pydantic AI](https://ai.pydantic.dev/) — Type-safe AI application development

## 4. LLM Observability, Evaluation & Testing
- [LangSmith](https://www.langchain.com/langsmith) — Tracing, evaluation, and debugging
- [Langfuse](https://langfuse.com/) — Open-source LLM observability
- [Arize Phoenix](https://phoenix.arize.com/) — AI tracing and evaluation
- [Weights & Biases](https://wandb.ai/) — Experiment tracking and evaluation
- [Braintrust](https://www.braintrust.dev/) — AI evaluation and monitoring
- [DeepEval](https://github.com/confident-ai/deepeval) — LLM testing and evaluation
- [Ragas](https://github.com/vibrantlabsai/ragas) — RAG and agent evaluation

## 5. Vector Databases & Retrieval
- [Pinecone](https://www.pinecone.io/) — Managed vector database
- [Weaviate](https://weaviate.io/) — Vector database and semantic search
- [Qdrant](https://qdrant.tech/) — Vector search engine
- [Chroma](https://www.trychroma.com/) — Embedding database
- [Milvus](https://milvus.io/) — Scalable vector database
- [pgvector](https://github.com/pgvector/pgvector) — Vector search for PostgreSQL
- [Elasticsearch](https://www.elastic.co/elasticsearch) — Search and vector retrieval

## 6. Model Hosting, Inference & Deployment
- [Ollama](https://ollama.com/) — Local model execution
- [vLLM](https://github.com/vllm-project/vllm) — High-throughput LLM serving
- [Hugging Face Inference Endpoints](https://huggingface.co/inference-endpoints) — Managed model deployment
- [Replicate](https://replicate.com/) — Model APIs and deployment
- [Modal](https://modal.com/) — Cloud infrastructure for Python and AI
- [RunPod](https://www.runpod.io/) — GPU cloud infrastructure
- [Together AI](https://www.together.ai/) — Inference and fine-tuning
- [Fireworks AI](https://fireworks.ai/) — Optimized model inference
- [GroqCloud](https://console.groq.com/) — Low-latency inference APIs
- [Baseten](https://www.baseten.co/) — Production model serving

## 7. Fine-Tuning, Training & MLOps
- [Axolotl](https://github.com/axolotl-ai-cloud/axolotl) — Fine-tuning language models
- [Unsloth](https://github.com/unslothai/unsloth) — Efficient model fine-tuning
- [Ludwig](https://github.com/ludwig-ai/ludwig) — Declarative machine learning
- [MLflow](https://mlflow.org/) — Experiment tracking and model lifecycle management
- [Kubeflow](https://www.kubeflow.org/) — Kubernetes-based ML workflows
- [ClearML](https://clear.ml/) — Experiment management and MLOps

## 8. Low-Code & Visual AI Development
- [Dify](https://dify.ai/) — Visual LLM applications and workflows
- [Flowise](https://flowiseai.com/) — Visual LLM and agent builder
- [n8n](https://n8n.io/) — Workflow automation with AI integrations
- [Langflow](https://www.langflow.org/) — Visual AI workflow development
- [Make](https://www.make.com/) — Visual automation platform
- [Zapier](https://zapier.com/) — Application automation with AI capabilities

## 9. Agent Protocols & Tool Integration
- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) — Standardized AI tool and data integration
- [MCP Python SDK](https://github.com/modelcontextprotocol/python-sdk) — MCP implementation for Python
- [MCP TypeScript SDK](https://github.com/modelcontextprotocol/typescript-sdk) — MCP implementation for TypeScript
- [Agent2Agent Protocol (A2A)](https://a2a-protocol.org/) — Communication between AI agents

## 10. AI Application Backend & Infrastructure
- [Supabase](https://supabase.com/) — PostgreSQL, authentication, storage, and APIs
- [Firebase](https://firebase.google.com/) — Application backend and AI integrations
- [Convex](https://convex.dev/) — Reactive application backend
- [Vercel](https://vercel.com/) — Web deployment and AI SDK
- [Cloudflare Workers AI](https://developers.cloudflare.com/workers-ai/) — Edge AI inference
- [Docker](https://www.docker.com/) — Containerization
- [Kubernetes](https://kubernetes.io/) — Container orchestration

## 11. Developer Learning & Discovery
- [GitHub Topics: Artificial Intelligence](https://github.com/topics/artificial-intelligence)
- [GitHub Topics: LLM](https://github.com/topics/llm)
- [GitHub Topics: AI Agents](https://github.com/topics/ai-agents)
- [GitHub Topics: Model Context Protocol](https://github.com/topics/model-context-protocol)

## 12. Events
- [OpenAI DevDay](https://openai.com/de-DE/devday/)

---

# Model Cost

## 💰 Major LLM API Cost Comparison (USD per 1M Tokens)

| Provider | Model | Input ($/1M) | Output ($/1M) | Tier |
|-----------|---------|------------:|-------------:|----------|
| OpenAI | GPT-6 Astra | 10.00 | 50.00 | Frontier |
| OpenAI | GPT-6.1 Sol | 2.00 | 10.00 | Production |
| OpenAI | GPT-6 Luna | 0.10 | 0.50 | Budget |
| Anthropic | Claude Opus 5.5 | 4.00 | 20.00 | Frontier |
| Anthropic | Claude Sonnet 5.5 | 2.00 | 10.00 | Production |
| Anthropic | Claude Haiku 5.5 | 0.10 | 0.50 | Budget |
| Google | Gemini 2.5 Pro | 1.25 | 10.00 | Frontier |
| Google | Gemini 2.5 Flash | 0.30 | 2.50 | Production |
| Google | Gemini 2.5 Flash-Lite | 0.10 | 0.40 | Budget |
| xAI | Grok 4.7 | 2.00 | 6.00 | Frontier |
| xAI | Grok 4.3 | 1.25 | 2.50 | Production |
| xAI | Grok Build 0.1 | 1.00 | 2.00 | Coding |
| Mistral | Mistral Medium 3.5 | 1.50 | 7.50 | Frontier |
| Mistral | Mistral Large 4 | 1.36 | 4.18 | Production |
| Mistral | Mistral Small 4 | 0.15 | 0.60 | Budget |
| Cohere | Command R+ | 2.50 | 10.00 | Enterprise |
| Cohere | Command R | 0.50 | 1.50 | Enterprise Budget |
| Alibaba | Qwen 3.8 Max | 2.00 | 6.00 | Frontier |
| Alibaba | Qwen 3.8 Flash | 0.15 | 0.47 | Budget |
| Alibaba | Qwen 3.7 Plus | 0.40 | 1.60 | Production |
| DeepSeek | V4.1 Flash | 0.15-0.30 | 0.60-1.20 | Budget |
| DeepSeek | V4 Pro | 0.66-1.32 | 1.98-3.96 | Frontier |
| DeepSeek | R1 | 0.50 | 2.15 | Reasoning |
| TypeSafe AI | Jev 1.14 | 0.042 | Free | Decision Model |

---

## 🏆 Cheapest Models by Input Cost

| Rank | Model | Input ($/1M) | Output ($/1M) |
|------|--------|------------:|-------------:|
| 🥇 | Jev 1.14 | 0.042 | Free |
| 🥈 | GPT-6 Luna | 0.10 | 0.50 |
| 🥈 | Claude Haiku 5.5 | 0.10 | 0.50 |
| 🥈 | Gemini 2.5 Flash-Lite | 0.10 | 0.40 |
| 🥉 | Mistral Small 4 | 0.15 | 0.60 |
| 🥉 | Qwen 3.8 Flash | 0.15 | 0.47 |
| 🥉 | DeepSeek V4.1 Flash (off-peak) | 0.15 | 0.60 |

---

## 🚀 Frontier Model Cost Comparison

| Vendor | Flagship Model | Input ($/1M) | Output ($/1M) | Relative Cost |
|----------|---------------|------------:|-------------:|---------------|
| OpenAI | GPT-6 Astra | 10.00 | 50.00 | $$$$$ |
| Anthropic | Claude Opus 5.5 | 4.00 | 20.00 | $$$$ |
| Google | Gemini 2.5 Pro | 1.25 | 10.00 | $$$ |
| xAI | Grok 4.7 | 2.00 | 6.00 | $$$ |
| Mistral | Medium 3.5 | 1.50 | 7.50 | $$$ |
| Cohere | Command R+ | 2.50 | 10.00 | $$$ |
| Alibaba | Qwen 3.8 Max | 2.00 | 6.00 | $$$ |
| DeepSeek | V4 Pro | 0.66-1.32 | 1.98-3.96 | $$ |

---

## 🧠 Claude Family Cost Comparison

| Model | Input ($/1M) | Output ($/1M) | Intelligence | Speed | Cost |
|----------|------------:|-------------:|--------------|-------|------|
| Claude Opus 5.5 | 4.00 | 20.00 | ⭐⭐⭐⭐⭐ | ⭐⭐ | 💰💰💰 |
| Claude Sonnet 5.5 | 2.00 | 10.00 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 💰💰 |
| Claude Haiku 5.5 | 0.10 | 0.50 | ⭐⭐ | ⭐⭐⭐⭐⭐ | 💰 |

---

## 🧮 Cost per 100M Input Tokens

| Model | Cost for 100M Input Tokens |
|---------|------------------------:|
| Jev 1.14 | $4.20 |
| GPT-6 Luna | $10 |
| Claude Haiku 5.5 | $10 |
| Gemini 2.5 Flash-Lite | $10 |
| Mistral Small 4 | $15 |
| Qwen 3.8 Flash | $15 |
| Gemini 2.5 Flash | $30 |
| Claude Sonnet 5.5 | $200 |
| GPT-6.1 Sol | $200 |
| Claude Opus 5.5 | $400 |
| GPT-6 Astra | $1,000 |

---

## 🔓 Open-Source / Self-Hosted Models

| Model Family | Licence | API Cost | Self-Hosting |
|--------------|----------|----------|--------------|
| Llama | Open Weights | Varies by provider | ✅ |
| Gemma | Open Weights | Varies | ✅ |
| Mixtral | Open Weights | Varies | ✅ |
| Qwen | Open + Commercial | Varies | ✅ |
| Phi | Open Weights | Varies | ✅ |
| Falcon | Open Weights | Varies | ✅ |
| DeepSeek | Open Weights | Optional API | ✅ |
| StarCoder | Open Weights | Varies | ✅ |
| GPT-NeoX | Open Weights | Varies | ✅ |
| OpenHermes | Open Weights | Varies | ✅ |
| Nous Hermes | Open Weights | Varies | ✅ |

> For open-source models, cost depends on GPU infrastructure rather than token pricing.

# Privacy, data protection, compliance, and security considerations

| Model Family | Provider | Hosting Type | Swedish Gov. Position* | Primary Privacy/Security Concerns | Relative Enterprise Privacy Risk |
|-------------|----------|--------------|------------------------|----------------------------------|---------------------------------|
| ChatGPT / GPT-4o / GPT-6 Family | OpenAI | Cloud (Closed) | Restricted/Blocked | Users may submit confidential data; data residency concerns; risk of sensitive information entering provider systems; requires enterprise agreement and governance controls | Medium |
| Claude (Opus, Sonnet, Haiku) | Anthropic | Cloud (Closed) | Restricted/Blocked | Similar concerns to OpenAI; confidential information leakage through prompts; data retention and auditability concerns if unmanaged | Medium |
| Gemini (Pro, Ultra, Flash) | Google | Cloud (Closed) | Not mentioned | Data processing within Google ecosystem; cross-service integration concerns; residency/compliance requirements for regulated sectors | Medium |
| Microsoft Copilot / M365 Copilot | Microsoft | Cloud Enterprise | Approved Alternative | Access to organisational content requires strict permissions management; risk from over-permissioned users rather than model itself | Low-Medium |
| Grok | xAI | Cloud (Closed) | Not mentioned | Limited enterprise governance maturity compared with hyperscalers; social platform integration concerns | Medium-High |
| Mistral Large / Medium / Mixtral | Mistral | Cloud & Self-Hosted | Not mentioned | Cloud versions have standard SaaS risks; self-hosting significantly reduces third-party exposure | Low-Medium |
| Cohere Command R / R+ | Cohere | Cloud Enterprise | Not mentioned | Enterprise-focused but still requires control of transmitted data and retention policies | Low-Medium |
| Qwen Family | Alibaba | Cloud & Open Models | Not mentioned | Cross-border data transfer concerns; jurisdictional risk depending on deployment location | Medium-High |
| Hunyuan | Tencent | Cloud | Not mentioned | Data sovereignty and regulatory concerns for government workloads | High |
| ERNIE Bot | Baidu | Cloud | Not mentioned | Government and compliance concerns around data jurisdiction and transparency | High |
| Pangu | Huawei | Cloud | Not mentioned | Regulatory and geopolitical concerns in public sector deployments | High |
| DeepSeek | DeepSeek AI | Cloud & Open Models | Restricted/Blocked | Data protection concerns; government scrutiny regarding handling of user information; data sovereignty concerns | High |
| Llama Family | Meta | Open Weight | Not mentioned | Self-hosted deployments offer strong control; public hosted versions inherit provider risks | Low (self-hosted) / Medium (hosted) |
| Phi-3 Family | Microsoft | Open Weight | Not mentioned | Generally low risk when deployed locally; responsibility shifts to operator security practices | Low |
| Gemma | Google | Open Weight | Not mentioned | Self-hosted deployment reduces third-party exposure; model misuse remains organisation responsibility | Low |
| Yi | 01.AI | Open Weight | Not mentioned | Data governance depends entirely on deployment architecture | Low-Medium |
| Falcon | TII | Open Weight | Not mentioned | Security largely determined by hosting environment | Low |
| GPT-NeoX | EleutherAI | Open Source | Not mentioned | Self-hosted control but less enterprise governance tooling | Low |
| OpenHermes | Teknium | Open Source | Not mentioned | Open-source deployment reduces vendor privacy concerns; operational security remains critical | Low |
| Nous Hermes | Nous Research | Open Source | Not mentioned | Same as other self-hosted OSS models | Low |
| StarCoder | BigCode | Open Source | Not mentioned | Source-code exposure becomes primary risk if prompts contain proprietary code | Low-Medium |
| CodeLlama | Meta | Open Weight | Not mentioned | Risk of proprietary code disclosure if used through external services | Low-Medium |
| DeepSeek-Coder | DeepSeek AI | Open/Cloud | Not mentioned | Same concerns as DeepSeek plus possible source-code exposure | Medium-High |
| Med-PaLM | Google | Medical Domain | Not mentioned | Potential processing of protected health information (PHI); healthcare compliance requirements | High |
| MedGemini | Google | Medical Domain | Not mentioned | PHI handling; patient-data governance; HIPAA/GDPR considerations | High |
| BioGPT | Microsoft | Research Model | Not mentioned | Handling of biomedical datasets may introduce regulatory obligations | Medium |
| BloombergGPT | Bloomberg | Finance Domain | Not mentioned | Financial-data confidentiality; market-sensitive information exposure | Medium |
| FinGPT | Open Source | Finance Domain | Not mentioned | Depends on deployment; risk from proprietary financial data ingestion | Medium |
| Jev 1.14 | TypeSafe AI | Decision Model | Not mentioned | Lower risk due to constrained outputs, but privacy depends on API deployment and logging practices | Low-Medium |
| Qwen-VL | Alibaba | Multimodal | Not mentioned | Image uploads may contain sensitive metadata, documents, locations, or identities | Medium-High |
| Llama Vision | Meta | Multimodal | Not mentioned | Visual data leakage; self-hosted deployment mitigates vendor exposure | Low-Medium |
| Claude Vision | Anthropic | Multimodal | Restricted if using Claude service | Uploaded images may contain confidential documents or personally identifiable information | Medium |
| Gemini Vision | Google | Multimodal | Not mentioned | Similar concerns for images, videos, and enterprise documents | Medium |
| GPT-4o | OpenAI | Multimodal | Restricted if using ChatGPT service | Text, image, audio, and document uploads increase sensitive-data exposure surface | Medium |
| Grok Vision | xAI | Multimodal | Not mentioned | Multimedia content may contain sensitive personal information and metadata | Medium-High |

> The Swedish government's decision was not primarily about model quality, but about:
Data Leakage Risk – employees inadvertently entering sensitive government information.
Training Risk – information potentially being retained or used for model improvement.
Lack of Enterprise Agreements – absence of contractual assurances and auditing capabilities.
Shadow IT – staff using unapproved AI tools outside official governance processes.
Data Sovereignty – uncertainty about where data is processed and stored.