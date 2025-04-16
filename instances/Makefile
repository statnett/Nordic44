FIXME = ../../ENTSOE-SHACL/Inst4CIM-KG/rdf-improved

XML = $(wildcard */cimxml/*.xml)
TRIG = $(subst .xml,.trig, $(subst /cimxml,/trig, $(XML)))

all: $(TRIG)

clean:
	rm $(TRIG)

define XML2TRIG
	perl fix-ns.pl $(1) > temp.xml
	perl $(FIXME)/cim-trig.pl -r temp.xml > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $(2)
	rm temp.xml temp.trig
endef

Enterprise/trig/%.trig: Enterprise/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

Grid/trig/%.trig: Grid/cimxml/%.xml
	$(call XML2TRIG,$^,$@)

NetworkCode/trig/%.trig: NetworkCode/cimxml/%.xml
	$(call XML2TRIG,$^,$@)


list-trig:
	@echo $(TRIG)
