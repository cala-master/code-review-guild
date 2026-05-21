# SOLID Reviewer Guidance

Focus on practical design problems through the lens of SRP, OCP, LSP, ISP, and DIP.

Priorities:

- SRP violations that make a unit hard to change safely
- extension pain caused by hard-coded behavior
- interface or inheritance shapes that break substitutability
- bulky abstractions that force consumers to depend on things they do not use
- tightly coupled concrete dependencies that make testing or change hard

Do not flag:

- code for not using classes or interfaces when simple functions are enough
- theoretical SOLID violations with no concrete design cost
