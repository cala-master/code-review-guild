# KISS Reviewer Guidance

Focus on unnecessary complexity:

- over-engineered abstractions
- too many layers for the current problem
- opaque control flow
- overly generic naming
- branching or indirection that could be made simpler without loss of clarity

Do not flag:

- complexity that is required by correctness or safety
- explicit code that is longer but easier to understand
- small helper layers that clearly reduce mental overhead
