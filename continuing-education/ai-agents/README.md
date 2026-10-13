# AI agents learning plan

**Goal:** build one small Microsoft agent that answers a narrow question from your own work, calls one tool, cites one knowledge source, and has a written note on identity, data, and what it must refuse.

**Pace:** 5–7 hours a week, eight weeks. The dates below assume a start on 13 October 2026. Shift the dates if you start later; keep the order.

**Prerequisite:** the [AZ-900 notes](../azure-fundamentals-az-900/) cover enough Azure to start. If generative AI itself is new, do [Get started with AI applications and agents on Azure](https://learn.microsoft.com/en-us/training/paths/get-started-ai-apps-agents/) before week 4.

This folder is a personal study workspace. Module names were read from Microsoft Learn on 13 October 2026. Product names move; if a module title on the live page differs, follow the live page and note the change in that week's file.

## Week-by-week plan

| Week | Dates | Focus | Done when | Notes |
| --- | --- | --- | --- | --- |
| 1 | 13–19 Oct 2026 | What an agent is, and when a workflow or a single Copilot prompt is enough | You can explain model, instructions, tools, and knowledge on one page, and you have rejected one agent idea | [01-what-is-an-agent](01-what-is-an-agent/notes.md) |
| 2 | 20–26 Oct 2026 | Pick a Microsoft surface: Copilot Studio, Microsoft Foundry, or the Microsoft 365 Agents Toolkit | A one-page decision for the capstone, with the surface you will not use and why | [02-platform-choice](02-platform-choice/notes.md) |
| 3 | 27 Oct–2 Nov 2026 | A first agent in Copilot Studio | An agent in a test environment that answers three scripted questions and fails closed on one out-of-scope question | [03-copilot-studio](03-copilot-studio/notes.md) |
| 4 | 3–9 Nov 2026 | Microsoft Foundry Agent Service and the Microsoft Agent Framework | A local or portal agent that runs a short tool-calling loop | [04-foundry-and-agent-framework](04-foundry-and-agent-framework/notes.md) |
| 5 | 10–16 Nov 2026 | Memory and knowledge (RAG, Foundry IQ, Azure AI Search) | The agent answers from your notes and cites the passage it used | [05-memory-and-knowledge](05-memory-and-knowledge/notes.md) |
| 6 | 17–23 Nov 2026 | Tools and MCP | One custom tool with input checks, timeouts, and an error the agent can see | [06-tools-and-mcp](06-tools-and-mcp/notes.md) |
| 7 | 24–30 Nov 2026 | Trust, identity, responsible AI, and a Swiss data-protection reading | A one-page control note: who can call the agent, what data it may see, what it must refuse | [07-trust-and-governance](07-trust-and-governance/notes.md) |
| 8 | 1–7 Dec 2026 | Multi-agent only if week 7 is solid; otherwise harden the single agent | Capstone demo: question, tool call, citation, refusal, and deleted lab resources | [08-multi-agent-and-production](08-multi-agent-and-production/notes.md) |

## Capstone

Pick a question you already answer from an ERP or an operations process. Examples that fit this repo: a release checklist, a batch-trace question, or an invoice exception. Keep the scope to one question, one tool, and one knowledge source.

Write the outcome, the success check, and the refusal cases before you build. Week 2's platform note is the design record.

## Book

Reading spine: Hari Narayn, *Architecting Intelligent Agents in Azure* (Apress / Springer, ISBN 979-8-8688-2432-6). The Calibre copy is folder id 1843. Chapter titles below match that copy, checked on 13 October 2026.

| Weeks | Chapters |
| --- | --- |
| 1–2 | 1 Thain: The Beginning; 2 Thain Meets the Agent Framework |
| 4 | 2 Thain Meets the Agent Framework (re-read while you build) |
| 5 | 3 Thain Learns to Remember; 4 Thain Connects the Dots Azure AI Search |
| 6 | 5 Thain Builds Its Toolkit |
| 7 | 6 Thain Earns Trust; 8 Thain Goes Live |
| 8 | 7 Thain Learns to Collaborate; 9 Thain Learns from Us; 10 Thain at Scale |

Read the chapter, then write three sentences in that week's notes: what you built, what failed, what you would change. Do not paste the book.

## Link to the Berufsprüfung

Handlungskompetenz **a6** asks you to research a trend and turn it into a decision. The week-8 capstone can feed the one-page mini-case in [01-ict-strategy](../business-informatics/01-ict-strategy/README.md). This plan does not replace the qualification profile.

## Progress checklist

- [ ] Week 1 — agent, chatbot, and workflow distinguished on a real idea
- [ ] Week 2 — platform decision written
- [ ] Week 3 — Copilot Studio agent tested, including one refusal
- [ ] Week 4 — Foundry or Agent Framework loop runs
- [ ] Week 5 — answer cites a source you control
- [ ] Week 6 — one tool with validation and a visible error
- [ ] Week 7 — identity, data, and refusal note written
- [ ] Week 8 — capstone demo logged and lab resources deleted
- [ ] a6 mini-case drafted from the capstone (optional, exam track)

## Also in this folder

- [Resources](resources.md)
- [Labs](labs/README.md)
- [Practice questions](practice-questions/README.md)
