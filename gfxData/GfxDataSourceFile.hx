package gfxData;

import sys.FileSystem;
import Xml;

class GfxDataSourceFile extends GfxDataSource
{
    private var filename : String;
    private var xmlData : Xml;

    public function new(filename : String) : Void
    {
        super(filename);

        if(sys.FileSystem.exists(filename)) {
            trace('file exists');
            this.xmlData = this.getXmlFromFile(filename);
        } else {
            trace('File not found');
        }
    }

    private function getFile(filename : String) : String
    {
        var xmlString : String = sys.io.File.getContent(filename);
        return(xmlString);
    }

    private function getXmlFromFile(filename : String) : Xml
    {
        var xmlString : String = getFile(filename);
        var xmlData : Xml = Xml.parse(xmlString);
        return(xmlData);
    }

    public override function toString() : String
    {
        var root : Iterator<Xml> = this.xmlData.firstChild().elements();
        trace('\n-------------------------------------------------\n');
        for(elem in root) {
            trace('[  ' + elem + '  ]\n');
        }
        trace('\n-------------------------------------------------\n');
        return(this.xmlData.toString());
    }

    public function getDefs()
    {
        return(this.xmlData.elementsNamed('defs'));
    }

    public function getGraphic()
    {
        return(this.xmlData.elementsNamed('g'));
    }

}
