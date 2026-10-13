# Multi-agent and the capstone

**Week 8.** Stay on one agent if week 7's control note is still empty.

When the single agent is solid, the Azure path continues with:

- Build agent-driven workflows using Microsoft Foundry
- Orchestrate a multi-agent solution using the Microsoft Agent Framework
- Discover Azure AI Agents with A2A
- Integrate your agent with Microsoft 365

Copilot Studio follow-on, only if the capstone lives there: [Design and build multi-agent solutions in Microsoft Copilot Studio](https://learn.microsoft.com/en-us/training/paths/design-build-multi-agent-solutions-copilot-studio/) (child agents, connected agents, A2A).

Book: Narayn, chapters 7, 9, and 10. Skim 10 for cost and scale; do not stand up a second environment this week.

## Key concepts

- [ ] A second agent is worth it when two roles need different instructions or different tools. A longer prompt is the alternative
- [ ] Child agents are sub-agents the orchestrator delegates to. Connected agents are existing agents (Copilot Studio, Foundry, Fabric data agents) the orchestrator calls
- [ ] A2A is for an agent on another platform. Use it when you do not own that agent
- [ ] Handoffs need a trace that shows which agent acted. A fluent final answer with no handoff record is unfinished
- [ ] Production means identity, secrets, logs, a cost ceiling, and a delete switch. It does not mean more agents

## Capstone script

1. Ask the question from week 2.
2. Show the tool call and the citation.
3. Ask the refusal question. It must refuse.
4. Show the trace and the control note.
5. Delete the lab resources and mark the lab log.

Optional: turn the demo into the one-page a6 trend note in the [ICT strategy folder](../../business-informatics/01-ict-strategy/README.md).

## My notes

## Open questions

## Links

- [Resources](../resources.md)
