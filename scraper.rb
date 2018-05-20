#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q17535155 }'
ids = EveryPolitician::Wikidata.sparql(query)

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Abgeordneten_zum_%C3%96sterreichischen_Nationalrat_(XXV._Gesetzgebungsperiode)',
  xpath: '//h3[span[@id="Abgeordnete"]]/following-sibling::table[1]//tr[td]//td[1]//a[not(@class="new")]/@title',
)
EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { de: names })
