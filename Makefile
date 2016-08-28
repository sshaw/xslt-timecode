.PHONY: test libxml saxon xalan

XSLT:=test.xsl
XML:=test.xml

# saxon has an issue, uses scientific notation for to-frames
#test: libxml saxon xalan
test: libxml xalan

libxml: COMMAND := xsltproc $(XSLT) $(XML) 2>&1 > /dev/null
libxml:
	$(run-tests)

# w/o Homebrew: java -jar /usr/share/java/Saxon-HE.jar
saxon: COMMAND := saxon -xsl:$(XSLT) -s:$(XML) 2>&1 > /dev/null
saxon:
	$(run-tests)

xalan: COMMAND := xalan -in $(XML) -xsl $(XSLT) 2>&1 > /dev/null
xalan:
	$(run-tests)

define run-tests
	@$(COMMAND) | perl -pe' \
			BEGIN { $$success = 0 } \
 			$$success = 1 if /\bfail\b/; \
 			s|\bpass\b|\033[32mpass\033[0m|; \
			s|\bfail\b|\033[31mfail\033[0m|; \
 			END { exit $$success }'
endef
