FIXME = ../../ENTSOE-SHACL/Inst4CIM-KG/rdf-improved

XML    = $(wildcard */cimxml/*.xml)
TRIG   = $(subst .xml,.trig, $(subst /cimxml,/trig, $(XML)))
JSONLD = $(subst .xml,.jsonld, $(subst /cimxml,/jsonld, $(XML)))

all: $(TRIG) $(JSONLD)

define XML2TRIG
	perl fix-ns.pl $(1) | perl $(FIXME)/cim-urn-uuid.pl > temp.xml
	perl $(FIXME)/cim-trig.pl -r temp.xml > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $(2)
	rm temp.xml temp.trig
endef

define TRIG2JSONLD
	riot.bat -formatted jsonld $(1) | jsonld compact -c https://raw.githack.com/Sveino/Inst4CIM-KG/develop/rdf-improved/cim-context-new.jsonld > $(2)
endef

Enterprise/trig/%.trig: Enterprise/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

Grid/trig/%.trig: Grid/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

NetworkCode/trig/%.trig: NetworkCode/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

Enterprise/jsonld/%.jsonld: Enterprise/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

Grid/jsonld/%.jsonld: Grid/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

NetworkCode/jsonld/%.jsonld: NetworkCode/trig/%.trig
	$(call TRIG2JSONLD,$^,$@)

rm-trig:
	rm $(TRIG)

rm-jsonld:
	rm $(JSONLD)

list-trig:
	@echo $(TRIG)
