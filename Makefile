truffle: truffle-migrate truffle-console
	@

truffle-migrate:
	truffle migrate --network development

truffle-console:
	truffle console --network development
