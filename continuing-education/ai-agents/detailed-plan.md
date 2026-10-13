# Always-On Agent Consultant: Detailed 6-Month Plan (W1-W26)

Status: active detailed plan (26 weeks, W1-W26).

## Goal and ground rules

- Goal: become a consultant for always-on / long-running AI agents (multi-step, tool- and app-operating, running unattended, surfacing only for human judgment). Microsoft-first, use before build.
- The learner: beginner in agents; ERP Solution Architect (Dynamics 365 F&SCM, Odoo, Joomla, .NET); currently on a TypeScript track.
- Rhythm: 7 sessions of 50 min per week (about 5.8 h per week); each week runs Thu to Wed.
- Month 1 (W1-W4): all 7 sessions are use/learn; Wednesday is a short review.
- From month 2 (W5-W26): 2 build sessions (Sat, Sun) + 5 use/consulting/review sessions. Wednesday is always weekly review and spaced repetition (flashcards on pillars, exam topics and the previous weeks' key ideas).
- Exam days: exam sessions (AB-730 in W3, AI-103 in W22) replace that day's session; actual exam slot and length to verify at booking.
- Holiday buffer: in W11 and W12, sessions marked (optional) can be skipped; missed core work rolls into W13.
- Parallel tracks (not scheduled here) may run alongside, e.g. TypeScript or DP-700 (Fabric).
- Builds: TypeScript/Node wherever possible. Python only where a course or Microsoft exam requires it.
- Items marked "to verify" could not be confirmed at writing time.

## Pillars

| ID | Pillar |
| --- | --- |
| P1 | Computer use (screenshot-reason-act, accessibility tree, DOM) |
| P2 | Harness / runtime (state, retries, context compaction, context rot) |
| P3 | Sandbox (microVMs, containers, shared vs isolated computers) |
| P4 | Tools / MCP (least privilege) |
| P5 | Memory / skills (learning from demonstration) |
| P6 | Multi-agent coordination |
| P7 | Safety / governance (approval gates, action recording, audit) |
| P8 | Evaluation / cost (trajectory evals, benchmarks, token economics) |

## Certification facts (verified at writing time)

- AB-730 "Microsoft Certified: AI Business Professional": no-code, business-user level. The English version moved from 3 to 4 skill areas in October 2026; the new area is "Drive business outcomes by using agents" (prebuilt agents, Copilot Cowork). Check the study guide for the version that applies at booking. Pass score 700. Price and duration: to verify on the booking page.
  - Cert: https://learn.microsoft.com/en-us/credentials/certifications/ai-business-professional/
  - Study guide: https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ab-730
- AI-102 (Azure AI Engineer Associate) retired on 30 Jun 2026 (https://learn.microsoft.com/en-us/credentials/support/retired-certification-exams). Current successor: Exam AI-103 "Developing AI Apps and Agents on Azure", certification "Microsoft Certified: Azure AI Apps and Agents Developer Associate". Skills as of 16 Apr 2026; largest area "Implement generative AI and agentic solutions" (30-35%); expects Python.
  - Cert: https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-apps-and-agents-developer-associate/
  - Study guide: https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-103
- DP-700 (parallel track): https://learn.microsoft.com/en-us/credentials/certifications/fabric-data-engineer-associate/

## Core resources (all checked reachable at writing time)

| Resource | URL |
| --- | --- |
| Microsoft 365 Copilot overview | https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-overview |
| Copilot Studio docs | https://learn.microsoft.com/en-us/microsoft-copilot-studio/ |
| Copilot Studio learning path (create and extend custom copilots) | https://learn.microsoft.com/en-us/training/paths/create-extend-custom-copilots-microsoft-copilot-studio/ |
| Copilot Studio training catalogue | https://learn.microsoft.com/en-us/training/browse/?terms=copilot%20studio |
| Azure AI Foundry Agent Service | https://learn.microsoft.com/en-us/azure/ai-foundry/agents/overview |
| Microsoft Agent Framework | https://learn.microsoft.com/en-us/agent-framework/overview/agent-framework-overview |
| Semantic Kernel | https://learn.microsoft.com/en-us/semantic-kernel/overview/ |
| AutoGen | https://microsoft.github.io/autogen/stable/ |
| Hugging Face Agents Course | https://huggingface.co/learn/agents-course/unit0/introduction |
| DeepLearning.AI Agentic AI | https://www.deeplearning.ai/courses/agentic-ai/ |
| DeepLearning.AI AI Agentic Design Patterns with AutoGen | https://www.deeplearning.ai/short-courses/ai-agentic-design-patterns-with-autogen/ |
| LangChain Academy Intro to LangGraph | https://academy.langchain.com/courses/intro-to-langgraph |
| OpenAI Agents SDK (JS/TS) | https://openai.github.io/openai-agents-js/ |
| Anthropic: Building effective agents | https://www.anthropic.com/research/building-effective-agents |
| Anthropic: Effective harnesses for long-running agents | https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents |
| Anthropic: Effective context engineering for AI agents | https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents |
| Anthropic computer use tool docs | https://docs.anthropic.com/en/docs/agents-and-tools/tool-use/computer-use-tool |
| MCP specification (2025-06-18) | https://modelcontextprotocol.io/specification/2025-06-18 |
| MCP TypeScript SDK | https://github.com/modelcontextprotocol/typescript-sdk |
| Playwright | https://playwright.dev/docs/intro |
| WebArena | https://webarena.dev/ |
| OSWorld | https://os-world.github.io/ (redirect seen; to verify final URL) |
| Swiss revDSG (FADP) | https://www.fedlex.admin.ch/eli/cc/2022/491/en |
| EU AI Act explorer | https://artificialintelligenceact.eu/ |
| Power BI overview | https://learn.microsoft.com/en-us/power-bi/fundamentals/power-bi-overview |

To verify: official Microsoft Copilot Cowork and Copilot Autopilot documentation URLs; Claude Cowork, OpenAI agent product and Gemini agent product pages (use vendor sites, links not pinned here).

---

## Month 1: Use and learn (W1-W4)

### W1: Landscape and the ReAct loop
- Goal: Map the always-on agent landscape and understand the basic agent loop.
- Pillars: P2, P6, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Landscape overview; read "Building effective agents"; one line each on Grok Bot, Claude Cowork, OpenAI agents, Microsoft Copilot Cowork/Autopilot, Gemini. |
| Fri | ReAct loop (reason, act, observe): HF Agents Course Unit 0 and loop sketch. |
| Sat | Read "Effective harnesses for long-running agents"; note state, retries, compaction. |
| Sun | Landscape table v0: what each product runs unattended, approvals, pricing model (to verify). |
| Mon | Portfolio case study, part 1: structure of a multi-agent setup (published only after approval). |
| Tue | Portfolio case study, part 2: approval gates, unattended routines, what goes wrong. |
| Wed | Review: explain the ReAct loop and 8 pillars aloud in 5 min; flashcards v1. |

- Resources: Anthropic "Building effective agents"; Anthropic harness post; HF Agents Course Unit 0.
- Deliverable: Landscape table v0 + case study v1 (2 pages, sanitized).
- Done when: The learner explains the ReAct loop and the 8 pillars in 5 minutes without notes.

### W2: M365 Copilot agents, Copilot Cowork, AB-730 prep
- Goal: Hands-on with M365 Copilot and prebuilt agents; cover AB-730 skill areas.
- Pillars: P5, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | AB-730 study guide walkthrough (October 2026 skills); gap list. |
| Fri | Domain 1: generative AI fundamentals (Learn modules from the study guide). |
| Sat | Domain 2: prompts and chats in Copilot (model selection, memory, instructions). |
| Sun | Domain 3: business content and collaboration (Word, Excel, Teams, Pages). |
| Mon | Domain 4: prebuilt agents (Researcher, Analyst) and delegating a multi-step task to Copilot Cowork (licence/availability to verify). |
| Tue | Free practice assessment; book exam for W3. |
| Wed | Review: redo wrong practice questions; flashcards. |

- Resources: AB-730 cert page and study guide; M365 Copilot overview.
- Deliverable: AB-730 gap list and exam booking for W3.
- Done when: Practice assessment at or above 75 %.

### W3: AB-730 exam, HF Agents Course Unit 1
- Goal: Pass AB-730 (new English version with agents/Cowork domain); learn agent fundamentals.
- Pillars: P2, P4
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Final review: agents/Cowork domain. |
| Fri | Second practice assessment, fix weak areas. |
| Sat | AB-730 exam (replaces session; slot and duration to verify). |
| Sun | HF Unit 1: what is an agent, LLMs, tools. |
| Mon | HF Unit 1: thought-action-observation cycle. |
| Tue | HF Unit 1: first agent exercise and quiz. |
| Wed | Review: exam debrief, Unit 1 flashcards. |

- Resources: AB-730 study guide; https://huggingface.co/learn/agents-course/unit1/introduction
- Deliverable: AB-730 result + Unit 1 notes.
- Done when: Exam passed (or retake booked) and Unit 1 quiz done.

### W4: Copilot Studio basics, agentic patterns, ops case write-ups
- Goal: First no-code agent; 4 agentic patterns; document 2 real unattended ops cases.
- Pillars: P4, P7, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Copilot Studio learning path: concepts, first agent. |
| Fri | Copilot Studio: knowledge source and one action. |
| Sat | DeepLearning.AI Agentic AI: reflection and tool use. |
| Sun | DeepLearning.AI Agentic AI: planning and multi-agent. |
| Mon | Write-up: portfolio ops case study 1 (trigger, tools, approvals, failures, cost; published only after approval). |
| Tue | Write-up: portfolio ops case study 2 (same template). |
| Wed | Review: month 1 recap; flashcards; check both cases use one template. |

- Resources: Copilot Studio path and docs; DeepLearning.AI Agentic AI.
- Deliverable: Copilot Studio demo agent + 2 ops case write-ups.
- Done when: Both cases follow one template (problem, design, governance, results, lessons).

## Month 2: Consulting core + build (W5-W8)

### W5: Use-case discovery | Build: ReAct loop
- Goal: Repeatable discovery method for unattended-agent use cases.
- Pillars: P2, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Discovery canvas: frequency, rule clarity, risk, data access, human judgment points. |
| Fri | List 10 candidate use cases from ERP/Odoo/Joomla practice. |
| Sat | Build: TypeScript project setup with OpenAI Agents SDK (JS/TS); first agent call. |
| Sun | Build: ReAct loop with 2 tools and step logging. |
| Mon | Score the 10 use cases on the canvas. |
| Tue | Pick top 3; write a one-page brief each. |
| Wed | Review: ReAct and discovery flashcards; test the loop end to end. |

- Resources: OpenAI Agents SDK JS; HF Agents Course.
- Deliverable: Discovery canvas v1 + `react-loop` folder.
- Done when: The loop completes a 3-step task and logs every step.

### W6: Governance and approval design | Build: least-privilege MCP tool
- Goal: Design approval gates and audit for agents under Swiss/EU rules.
- Pillars: P4, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | revDSG basics for agents. |
| Fri | EU AI Act risk classes and obligations. |
| Sat | Build: MCP TS SDK: server with one read-only tool. |
| Sun | Build: Add a write tool behind an approval token. |
| Mon | Approval matrix: money, deletions, outgoing messages. |
| Tue | Action log and least-privilege design; template v1. |
| Wed | Review: Governance flashcards; check the MCP approval flag. |

- Resources: revDSG on fedlex; EU AI Act explorer; MCP spec; MCP TS SDK.
- Deliverable: Approval and Governance Design template v1 + MCP tool.
- Done when: The write tool refuses to run without an explicit approval token.

### W7: Cost, ROI, pricing | Build: cost logging
- Goal: Price agent services and estimate run costs.
- Pillars: P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Token economics: cost per task and per multi-hour run. |
| Fri | ROI model: hours saved, error rate, approval overhead. |
| Sat | Build: Token and cost logging (JSON lines) in the W5 loop. |
| Sun | Build: Per-run cost summary; model prices from vendor pages (to verify at build time). |
| Mon | Pricing models: fixed assessment, retainer, per outcome (market rates to verify). |
| Tue | ROI/pricing spreadsheet v1. |
| Wed | Review: Cost flashcards; sanity-check the spreadsheet with W5 logs. |

- Resources: OpenAI Agents SDK docs (tracing); model price pages (to verify).
- Deliverable: ROI/pricing spreadsheet v1 + cost log.
- Done when: Every run prints total tokens and estimated cost.

### W8: D365 F&SCM unattended agent case | Build: persistent research agent
- Goal: An ERP case the learner can pitch; first long-running agent.
- Pillars: P2, P5, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | D365 case design: Copilot Studio + Dataverse. |
| Fri | Approval before posting: who approves, what is logged. |
| Sat | Build: Research agent with state saved to disk. |
| Sun | Build: Resume after restart; approval before finalising; 30-min run. |
| Mon | Write the case: process, data, risks, KPIs. |
| Tue | Case polish and one-page client summary. |
| Wed | Review: Review month 2; flashcards; resume test of the research agent. |

- Resources: Copilot Studio docs; Anthropic harness and context engineering posts.
- Deliverable: D365 case study + `research-agent` v1.
- Done when: The agent survives a kill and resume and runs at least 30 min.

## Month 3: Positioning and computer use (W9-W13)

### W9: Platform comparison v1 | Build: sandbox basics
- Goal: Compare always-on platforms on architecture, approvals, pricing, limits.
- Pillars: P3, P7, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Comparison grid: Grok Bot, Claude Cowork, Copilot Cowork/Autopilot, OpenAI agents, Gemini. |
| Fri | Fill grid with sourced facts (vendor docs, to verify per product). |
| Sat | Build: Run the research agent in Docker, no host mounts. |
| Sun | Build: Network allowlist and resource limits. |
| Mon | Write-up draft "Grok Bot vs Claude Cowork vs Copilot vs OpenAI". |
| Tue | Source check of every claim. |
| Wed | Review: Sandbox flashcards (microVM vs container vs shared computer). |

- Resources: Vendor docs (to verify per product).
- Deliverable: Platform comparison v1 + sandboxed run.
- Done when: Every claim in the comparison has a source link.

### W10: Evals | Build: mini eval suite
- Goal: Measure agent reliability.
- Pillars: P2, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Trajectory evals: what to score. |
| Fri | Failure taxonomy v1. |
| Sat | Build: 10 test tasks for the research agent. |
| Sun | Build: Pass/fail and cost per task, one command. |
| Mon | Context rot: causes and mitigations. |
| Tue | OSWorld and WebArena: what they measure, why scores matter to clients. |
| Wed | Review: Eval flashcards; run the suite once. |

- Resources: OSWorld; WebArena; Anthropic context engineering post.
- Deliverable: Failure taxonomy + eval suite.
- Done when: Suite runs with one command and reports pass rate and cost.

### W11: LIGHT (holiday) Service catalogue v1 | Build: computer use 1
- Goal: Define the 5 services; first browser automation.
- Pillars: P1, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | (optional) Holiday: skip or light reading. |
| Fri | Service catalogue v1: Agent Readiness Assessment, Approval and Governance Design, Pilot-to-Production Roadmap, Cost and Reliability Review, Team Enablement. |
| Sat | Build: Playwright in TypeScript, first script. |
| Sun | Build: DOM selectors vs accessibility tree (`getByRole`), form fill. |
| Mon | (optional) Pitch deck outline. |
| Tue | (optional) LinkedIn post draft (nothing posted without the learner's approval). |
| Wed | (optional) Review: flashcards. |

- Resources: Playwright docs.
- Deliverable: Catalogue v1, deck outline, post draft, Playwright script.
- Done when: Script completes a form fill using role-based locators.

### W12: LIGHT (holiday) Mock client workshop | Build: computer use 2
- Goal: Rehearse a discovery workshop; screenshot-reason-act loop.
- Pillars: P1, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | (optional) Holiday: skip. |
| Fri | (optional) Holiday: skip. |
| Sat | Build: screenshot-reason-act loop with a vision model driving Playwright. |
| Sun | Build: human confirm before each click; 5-step task. |
| Mon | Workshop kit: 90-min client agenda using the discovery canvas. |
| Tue | (optional) Mock workshop run (peer or recorded self-run). |
| Wed | Review: flashcards; list work rolled into W13. |

- Resources: Anthropic computer use tool docs; Playwright.
- Deliverable: Workshop kit + computer-use prototype.
- Done when: Prototype completes a 5-step web task with approvals logged.

### W13: Review and project topic options
- Goal: Consolidate the 90-day core.
- Pillars: All
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Catch up rolled-over work from W11/W12. |
| Fri | Catch up continued; mock workshop if skipped. |
| Sat | Build: Clean up repos, READMEs for all build folders. |
| Sun | Build: Re-run eval suite; fix one failure. |
| Mon | Portfolio review: update case studies and comparison. |
| Tue | 3 project topic options in agent consulting. |
| Wed | Review: 90-day review: flashcards over all pillars; retrospective. |

- Resources: All previous.
- Deliverable: 90-day review + 3 topic options.
- Done when: 3 topic options written, each with scope and a portfolio link.

## Months 4-6: Build depth, certification, first pilot (W14-W26)

### W14: Azure AI Foundry Agent Service 1
- Goal: Deploy a first Foundry agent with tools.
- Pillars: P2, P4
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Foundry Agent Service overview. |
| Fri | Quickstart: create an agent. |
| Sat | Build: Call the Foundry agent from TypeScript. |
| Sun | Build: Enable tracing; log cost. |
| Mon | Connect a tool and file search. |
| Tue | Map Foundry to the 8 pillars. |
| Wed | Review: Foundry flashcards. |

- Resources: Foundry Agent Service; AI-103 study guide.
- Deliverable: Foundry demo agent.
- Done when: Agent answers via TS client with tracing on.

### W15: Semantic Kernel / Agent Framework / AutoGen
- Goal: Understand Microsoft code frameworks for multi-agent.
- Pillars: P6
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Semantic Kernel overview. |
| Fri | Microsoft Agent Framework overview. |
| Sat | Build: Small example in one Microsoft framework. |
| Sun | Build: Comparison note: recommendation per client scenario. |
| Mon | AutoGen concepts + DeepLearning.AI AutoGen course. |
| Tue | LangChain Academy Intro to LangGraph (comparison only). |
| Wed | Review: Framework flashcards. |

- Resources: Semantic Kernel; Agent Framework; AutoGen; LangChain Academy.
- Deliverable: Framework comparison page.
- Done when: Recommendation per client scenario written.

### W16: Multi-agent system with handoffs
- Goal: Manager + 2 workers (research, writer) with handoffs.
- Pillars: P6, P2
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Handoff patterns. |
| Fri | Shared memory design. |
| Sat | Build: OpenAI Agents SDK JS: manager and 2 workers. |
| Sun | Build: Handoff trace logging; end-to-end run. |
| Mon | Failure modes of multi-agent teams. |
| Tue | Map to the W1 portfolio case study. |
| Wed | Review: Multi-agent flashcards. |

- Resources: OpenAI Agents SDK JS.
- Deliverable: `multi-agent` v1.
- Done when: End-to-end run with a logged handoff trace.

### W17: Teach-once skill system
- Goal: Turn one demonstration into a reusable skill.
- Pillars: P5
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Memory types (short, long, procedural). |
| Fri | Skill file format design. |
| Sat | Build: Agent replays the skill. |
| Sun | Build: Test on 2 unseen variants. |
| Mon | Record a demonstration (Playwright trace). |
| Tue | Write the skill from the trace. |
| Wed | Review: Memory/skills flashcards. |

- Resources: Playwright docs; HF Agents Course.
- Deliverable: Skill system v1.
- Done when: Skill succeeds on 2 unseen variants.

### W18: Inbox/folder ops agent
- Goal: Unattended ops agent that watches a folder or inbox and updates a tracker.
- Pillars: P2, P4, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Design from the W4 ops cases. |
| Fri | Approvals and audit log design. |
| Sat | Build: TS agent with MCP tools. |
| Sun | Build: Scheduling and audit log. |
| Mon | Failure and retry policy. |
| Tue | Start 24-h unattended run. |
| Wed | Review: Review the 24-h audit log; flashcards. |

- Resources: MCP TS SDK; OpenAI Agents SDK JS.
- Deliverable: Ops agent v1.
- Done when: Runs unattended for 24 h with a clean audit log.

### W19: Cost and reliability dashboard
- Goal: Dashboard over cost logs and eval results (Power BI/Fabric; links to DP-700).
- Pillars: P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Data model for cost and eval logs. |
| Fri | Power BI report page 1: cost per task. |
| Sat | Build: Automated log ingestion. |
| Sun | Build: Refresh test with new runs. |
| Mon | Report page 2: pass rate and failures by category. |
| Tue | Narrative for clients. |
| Wed | Review: Dashboard flashcards. |

- Resources: Power BI overview; DP-700 cert page.
- Deliverable: Dashboard v1.
- Done when: Shows cost per task, pass rate, failures by category.

### W20: Documented multi-hour runs
- Goal: Evidence of reliability over hours.
- Pillars: P2, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Plan 2 runs: tasks, budgets, stop rules. |
| Fri | Monitor run 1 (3+ h, started in build session). |
| Sat | Build: Start run 1. |
| Sun | Build: Start run 2 with fixes from run 1. |
| Mon | Run 1 report. |
| Tue | Run 2 report. |
| Wed | Review: Lessons learned; flashcards. |

- Resources: Own logs and dashboard.
- Deliverable: 2 run reports.
- Done when: Each report states duration, cost, failures and fixes.

### W21: AI-103 prep 1
- Goal: Cover AI-103 skill areas (Python needed here).
- Pillars: P2, P4, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Study guide walkthrough; gap list. |
| Fri | Plan and manage an Azure AI solution. |
| Sat | Build: Python lab: Foundry agent. |
| Sun | Build: Python lab: vision, text, extraction. |
| Mon | Generative AI and agentic solutions 1. |
| Tue | Generative AI and agentic solutions 2. |
| Wed | Review: AI-103 flashcards. |

- Resources: AI-103 study guide and linked Learn paths.
- Deliverable: Gap list.
- Done when: All 5 skill areas started.

### W22: AI-103 prep 2 and exam
- Goal: Pass AI-103.
- Pillars: P2, P4, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Computer vision and text analysis. |
| Fri | Information extraction. |
| Sat | Build: Lab on weakest area. |
| Sun | Build: Lab on second weakest area. |
| Mon | Practice assessment (availability to verify). |
| Tue | AI-103 exam (replaces session; slot, duration and price to verify). |
| Wed | Review: Exam debrief; flashcards. |

- Resources: AI-103 study guide.
- Deliverable: AI-103 result.
- Done when: Passed or retake booked.

### W23: Platform comparison v2
- Goal: Updated comparison with own measured runs.
- Pillars: P1, P3, P7, P8
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Update vendor facts (to verify per product). |
| Fri | Add own eval and cost data. |
| Sat | Build: Run eval suite on 2 platforms where possible. |
| Sun | Build: Chart results for the write-up. |
| Mon | Rewrite conclusions. |
| Tue | Publish draft (only after the learner's approval). |
| Wed | Review: Flashcards. |

- Resources: Vendor docs; own data.
- Deliverable: Comparison v2.
- Done when: Includes own eval/cost data.

### W24: Enterprise concerns checklist
- Goal: Security, data residency (Switzerland/EU), audit, change management.
- Pillars: P3, P7
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Security concerns. |
| Fri | Data residency. |
| Sat | Build: Automated checklist report from agent config. |
| Sun | Build: Apply to ops agent. |
| Mon | Audit requirements. |
| Tue | Change management; peer review. |
| Wed | Review: Flashcards; apply checklist to D365 case. |

- Resources: revDSG; EU AI Act explorer; Foundry docs.
- Deliverable: Checklist v1.
- Done when: Applied to the D365 case.

### W25: Service catalogue v2
- Goal: Priced, evidence-backed offer.
- Pillars: All
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Update services: scope and deliverables. |
| Fri | Pricing v2 from the W7 model. |
| Sat | Build: Demo script for the pitch. |
| Sun | Build: Polish demo agent. |
| Mon | Pitch deck v2. |
| Tue | Link each service to a portfolio proof. |
| Wed | Review: Flashcards; rehearse pitch. |

- Resources: Own portfolio.
- Deliverable: Catalogue v2 + deck v2.
- Done when: Each service links to a portfolio proof.

### W26: First pilot client
- Goal: Agent Readiness Assessment with a first (friendly) pilot client.
- Pillars: All
- Sessions (50 min each):

| Day | Session |
| --- | --- |
| Thu | Pilot proposal. |
| Fri | Workshop prep. |
| Sat | Build: Prototype for the client use case. |
| Sun | Build: Prototype demo prep. |
| Mon | Client workshop (Agent Readiness Assessment). |
| Tue | Assessment report (sanitized). |
| Wed | Review: 6-month retrospective; plan next 6 months. |

- Resources: Own service catalogue and templates.
- Deliverable: Pilot proposal and assessment report.
- Done when: Client receives report; next 6 months planned.

---

## Portfolio

| # | Item | Week | Pillars | Public? |
| --- | --- | --- | --- | --- |
| 1 | Portfolio case study: multi-agent setup | W1 | P2, P6, P7 | after approval |
| 2 | Portfolio ops case study 1 | W4 | P2, P4, P7 | after approval |
| 3 | Portfolio ops case study 2 | W4 | P2, P7 | after approval |
| 4 | Discovery canvas + governance template | W5-W6 | P7 | yes |
| 5 | ROI and pricing model | W7 | P8 | partial |
| 6 | D365 F&SCM unattended agent case | W8 | P5, P7 | yes |
| 7 | Platform comparison v1 / v2 | W9 / W23 | P1, P3, P7, P8 | yes |
| 8 | Eval suite + failure taxonomy | W10 | P8 | yes |
| 9 | Service catalogue v1 / v2 + pitch deck | W11 / W25 | all | yes |
| 10 | Computer-use prototype | W12 | P1 | yes |
| 11 | Multi-agent system with handoffs | W16 | P6 | yes |
| 12 | Teach-once skill system | W17 | P5 | yes |
| 13 | Inbox/folder ops agent | W18 | P2, P4, P7 | yes |
| 14 | Cost and reliability dashboard | W19 | P8 | yes |
| 15 | Multi-hour run reports | W20 | P2, P8 | yes |
| 16 | Enterprise concerns checklist | W24 | P3, P7 | yes |
| 17 | Pilot assessment report | W26 | all | sanitized |

## Approvals

Publishing, merges and bookings happen only after the learner's approval.
