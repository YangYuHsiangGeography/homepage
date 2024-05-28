var wms_layers = [];


        var lyr_OpenStreetMap_0 = new ol.layer.Tile({
            'title': 'OpenStreetMap',
            //'type': 'base',
            'opacity': 1.000000,
            
            
            source: new ol.source.XYZ({
    attributions: ' ',
                url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
            })
        });
var format_kansaimunicipality_1 = new ol.format.GeoJSON();
var features_kansaimunicipality_1 = format_kansaimunicipality_1.readFeatures(json_kansaimunicipality_1, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_kansaimunicipality_1 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_kansaimunicipality_1.addFeatures(features_kansaimunicipality_1);
var lyr_kansaimunicipality_1 = new ol.layer.Vector({
                declutter: false,
                source:jsonSource_kansaimunicipality_1, 
                style: style_kansaimunicipality_1,
                popuplayertitle: "kansai municipality",
                interactive: true,
    title: 'kansai municipality<br />\
    <img src="styles/legend/kansaimunicipality_1_0.png" /> 2474 - 3000<br />\
    <img src="styles/legend/kansaimunicipality_1_1.png" /> 3000 - 4000<br />\
    <img src="styles/legend/kansaimunicipality_1_2.png" /> 4000 - 5000<br />\
    <img src="styles/legend/kansaimunicipality_1_3.png" /> 5000 - 6000<br />\
    <img src="styles/legend/kansaimunicipality_1_4.png" /> 6000 - 7000<br />\
    <img src="styles/legend/kansaimunicipality_1_5.png" /> 7000 - 7014<br />'
        });
var format_kansai_pref_2 = new ol.format.GeoJSON();
var features_kansai_pref_2 = format_kansai_pref_2.readFeatures(json_kansai_pref_2, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_kansai_pref_2 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_kansai_pref_2.addFeatures(features_kansai_pref_2);
var lyr_kansai_pref_2 = new ol.layer.Vector({
                declutter: false,
                source:jsonSource_kansai_pref_2, 
                style: style_kansai_pref_2,
                popuplayertitle: "kansai_pref",
                interactive: false,
                title: '<img src="styles/legend/kansai_pref_2.png" /> kansai_pref'
            });

lyr_OpenStreetMap_0.setVisible(true);lyr_kansaimunicipality_1.setVisible(true);lyr_kansai_pref_2.setVisible(true);
var layersList = [lyr_OpenStreetMap_0,lyr_kansaimunicipality_1,lyr_kansai_pref_2];
lyr_kansaimunicipality_1.set('fieldAliases', {'mncpl__': 'mncpl__', 'income ppl': 'income ppl', 'region': 'region', });
lyr_kansai_pref_2.set('fieldAliases', {'FID': 'FID', 'JCODE': 'JCODE', 'KEN': 'KEN', 'KEN_ENG': 'KEN_ENG', 'P_NUM': 'P_NUM', 'H_NUM': 'H_NUM', 'Shape_Leng': 'Shape_Leng', 'Shape_Area': 'Shape_Area', 'Shape__Are': 'Shape__Are', 'Shape__Len': 'Shape__Len', });
lyr_kansaimunicipality_1.set('fieldImages', {'mncpl__': 'TextEdit', 'income ppl': 'TextEdit', 'region': 'TextEdit', });
lyr_kansai_pref_2.set('fieldImages', {'FID': 'Range', 'JCODE': 'TextEdit', 'KEN': 'TextEdit', 'KEN_ENG': 'TextEdit', 'P_NUM': 'Range', 'H_NUM': 'Range', 'Shape_Leng': 'TextEdit', 'Shape_Area': 'TextEdit', 'Shape__Are': 'TextEdit', 'Shape__Len': 'TextEdit', });
lyr_kansaimunicipality_1.set('fieldLabels', {'mncpl__': 'no label', 'income ppl': 'inline label - visible with data', 'region': 'inline label - visible with data', });
lyr_kansai_pref_2.set('fieldLabels', {'FID': 'no label', 'JCODE': 'no label', 'KEN': 'no label', 'KEN_ENG': 'no label', 'P_NUM': 'no label', 'H_NUM': 'no label', 'Shape_Leng': 'no label', 'Shape_Area': 'no label', 'Shape__Are': 'no label', 'Shape__Len': 'no label', });
lyr_kansai_pref_2.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});