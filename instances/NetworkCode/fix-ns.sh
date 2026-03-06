#!bin/sh
perl -i -pe 's{dcat-cim="https://cim4.eu/ns/dcat-cim#"}{dcat-cim="https://cim4.eu/ns/dcat-cim#"}; s{cim="http://iec.ch/TC57/CIM100#"}{cim="http://iec.ch/TC57/CIM100#"}' *
