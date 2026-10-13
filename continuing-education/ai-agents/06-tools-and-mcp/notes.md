# Tools and MCP

**Week 6.** Modules on the Azure path:

1. Integrate custom tools into your agent
2. Integrate MCP tools with Azure AI agents

Book: Narayn, chapter 5, *Thain Builds Its Toolkit*. Protocol intro: [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro).

## Key concepts

- [ ] A tool has a name, a description the model uses to decide when to call it, and a schema for the arguments
- [ ] Validate arguments before the tool performs the action
- [ ] Timeouts, idempotency, and an error string the model can read belong in the tool, not in a later prompt
- [ ] Built-in tools cover common cases. A custom tool is for a system you own
- [ ] MCP exposes tools from a server the agent can connect to, so the tool list can change without rewriting the agent
- [ ] A tool that writes data needs a human check or a dry-run until week 7's control note allows the write

## Exercise

Wrap one read-only action you already understand (a query, a file lookup, a status call). Send one valid call and one invalid call. The invalid call must fail in the tool and show up in the trace.

## My notes

## Open questions

## Links

- [Resources](../resources.md)
