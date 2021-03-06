import QtQuick 2.0
import "database.js" as Database

QtObject {
    property string key
    property string value
    property bool booleanValue: value !== "0"
    property string _previousValue: value

    Component.onCompleted: {
        var deflt = value;
        _previousValue = Database.configGet(key, deflt);
        value = _previousValue;
    }

    onValueChanged: {
        if (value !== _previousValue)
        {
            _previousValue = value;
            Database.configSet(key, value);
        }
    }
}
