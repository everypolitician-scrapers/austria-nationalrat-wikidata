#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

mem_query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q17535155 }'
mem_ids = EveryPolitician::Wikidata.sparql(mem_query)

at_query = 'SELECT DISTINCT ?item { ?item wdt:P2280 [] }'
at_ids = EveryPolitician::Wikidata.sparql(at_query)

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Abgeordneten_zum_%C3%96sterreichischen_Nationalrat_(XXV._Gesetzgebungsperiode)',
  xpath: '//h3[span[@id="Abgeordnete"]]/following-sibling::table[1]//tr[td]//td[1]//a[not(@class="new")]/@title',
)
EveryPolitician::Wikidata.scrape_wikidata(ids: mem_ids | at_ids, names: { de: names }, batch_size: 250)
