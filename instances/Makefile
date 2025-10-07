FIXME = ../../Inst4CIM-KG/rdf-improved

XML_MF    = $(wildcard */cimxml/manifest.xml)
XML       = $(filter-out $(wildcard */cimxml/*.xml), $(XML_MF))
TTL_MF    = $(subst .xml,.ttl,    $(subst /cimxml,/trig,   $(XML_MF)))
TRIG      = $(subst .xml,.trig,   $(subst /cimxml,/trig,   $(XML)))
JSONLD_MF = $(subst .xml,.jsonld, $(subst /cimxml,/jsonld, $(XML_MF)))
JSONLD    = $(subst .xml,.jsonld, $(subst /cimxml,/jsonld, $(XML)))

all: $(TTL_MF) $(TRIG) $(JSONLD_MF) $(JSONLD)

define XML2TTL
	perl fix-ns.pl $(1) | perl $(FIXME)/cim-urn-uuid.pl > temp.xml
	riot.bat --formatted ttl temp.xml > $(2)
endef

define XML2TRIG
	perl fix-ns.pl $(1) | perl $(FIXME)/cim-urn-uuid.pl > temp.xml
	perl $(FIXME)/cim-trig.pl -r temp.xml > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $(2)
	rm temp.xml temp.trig
endef

define TRIG2JSONLD
	riot.bat -formatted jsonld $(1) | jsonld compact -c https://raw.githack.com/Sveino/Inst4CIM-KG/develop/rdf-improved/cim-context-new.jsonld > $(2)
endef

Enterprise/trig/%.ttl: Enterprise/cimxml/%.xml
	$(call XML2TTL,$^,$@)

Grid/trig/%.ttl: Grid/cimxml/%.xml
	$(call XML2TTL,$^,$@)

NetworkCode/trig/%.ttl: NetworkCode/cimxml/%.xml
	$(call XML2TTL,$^,$@)

Enterprise/trig/%.trig: Enterprise/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

Grid/trig/%.trig: Grid/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

NetworkCode/trig/%.trig: NetworkCode/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

Enterprise/jsonld/%.jsonld: Enterprise/trig/%.ttl
	$(call TRIG2JSONLD,$^,$@)

Grid/jsonld/%.jsonld: Grid/trig/%.ttl
	$(call TRIG2JSONLD,$^,$@)

NetworkCode/jsonld/%.jsonld: NetworkCode/trig/%.ttl
	$(call TRIG2JSONLD,$^,$@)

Enterprise/jsonld/%.jsonld: Enterprise/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

Grid/jsonld/%.jsonld: Grid/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

NetworkCode/jsonld/%.jsonld: NetworkCode/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

rm-trig:
	rm $(TRIG) $(TTL_MF)

rm-jsonld:
	rm $(JSONLD) $(JSONLD_MF)

list-trig:
	@echo $(TRIG) $(TTL_MF)
