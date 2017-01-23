#!/bin/bash
#script de re-index de elastic search de Centauri.co
echo ======================================
echo "iniciando configuración de ES"
echo ======================================
echo "Borrando geo_index1"
curl -XDELETE http://elasticsearch:9200/geo_index_1

echo -e "\nCREANDO geo_index1"
curl -XPUT 'http://elasticsearch:9200/geo_index_1' -d '{"settings": {"number_of_shards": 1,"analysis":{"filter":{"autocomplete_filter":{"type":"edge_ngram","min_gram": 3,"max_gram": 20}},"analyzer":{"autocomplete":{"type":"custom","tokenizer": "standard","filter":["lowercase","autocomplete_filter"]},"autocomplete_en":{"type":"english","tokenizer": "standard","filter": ["lowercase","autocomplete_filter"]},"autocomplete_es":{"type":"spanish","tokenizer": "standard","filter": ["lowercase","autocomplete_filter"]} }}}}'

echo -e "\nCREANDO city"
curl -XPUT 'http://elasticsearch:9200/geo_index_1/city/_mapping' -d '{"city" : {"_boost": {"name": "priority","null_value": 1.0},"properties" : {"id" : {"type" : "long","store" : "yes", "index":"not_analyzed"},"name": {"type": "string","index":"analyzed","analyzer": "autocomplete"},"name_en": {"type": "string","index":"analyzed","analyzer": "autocomplete_en"},"name_es": {"type": "string","index":"analyzed","analyzer": "autocomplete_es"},"type": {"type": "string", "index":"no"}}}}'

echo -e "\nCREANDO place"
curl -XPUT 'http://elasticsearch:9200/geo_index_1/place/_mapping' -d '{"place": {"_parent": {"type": "city"},"_boost": {"name": "priority","null_value": 1.0},"properties": {"id" : {"type" : "long","store" : "yes", "index":"not_analyzed"},"cityId" : {"type" : "long","store" : "yes", "index":"not_analyzed"},"name": {"type": "string","index":"analyzed","analyzer": "autocomplete"},"name_en": {"type": "string","index":"analyzed","analyzer": "autocomplete_en"},"name_es": {"type": "string","index":"analyzed","analyzer": "autocomplete_es"},"type": {"type": "string", "index":"no"}}}}'

echo -e "\nCREANDO hotel"
curl -XPUT 'http://elasticsearch:9200/geo_index_1/hotel/_mapping' -d '{"hotel": {"_boost": {"name": "priority","null_value": 1.0},"properties": {"id" : {"type" : "string","store" : "yes", "index":"not_analyzed"},"city": {"type": "string","index":"no"},"country": {"type": "string","index":"no"},"name": {"type":"string","index":"analyzed","analyzer": "autocomplete"}}}}'

echo -e "\n=================="
echo "Finalizado"
echo ==================
