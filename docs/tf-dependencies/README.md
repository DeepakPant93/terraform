# Terraform Dependencies

Terraform does mark dependencies between resources in its state using its built-in dependency tree logic. It captures both:

* **Implicit dependencies**: When one resource references another (e.g., using `${aws_instance.foo.id}`), Terraform automatically infers that relationship.
* **Explicit dependencies**: For cases where Terraform can’t infer a relationship from code, you can use `depends_on` to declare it.

These dependencies are stored in the state file under each resource’s `"dependencies"` attribute. Terraform uses this dependency graph during planning and apply to determine correct creation and destruction order.