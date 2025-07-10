# cleanup command for Terraform AWS Docker Nginx setup
.PHONY: cleanup
cleanup:
	@echo "Cleaning up Terraform state files and directories..."
	find . -maxdepth 1 -type d ! -name '.' | while read dir; do \
		echo "Cleaning up directory: $$dir"; \
		rm -rf "$$dir/.terraform" \
		       "$$dir/terraform.tfstate" \
		       "$$dir/terraform.tfstate.backup" \
		       "$$dir/.terraform.lock.hcl" \
		       "$$dir/.terraform.tfstate.lock.info"; \
	done