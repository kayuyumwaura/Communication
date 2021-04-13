import 'dart:convert';
import 'dart:ffi';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetTickets {
  Future<List<Tickets>> getIssues() async {
    final res = await http
        .get(Uri.http('fmsadmintest.azurewebsites.net', 'api/dealertickets/1'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      return data.map((tickets) => new Tickets.fromJson(tickets)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetTicketsNew {
  Future<List<Tickets>> getIssues() async {
    //pass dealer id here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.get(
        //To be changed to concanate dealer id, based on logged in user; store id somewhere
        Uri.http('fmsadmintest.azurewebsites.net',
            'api/techniciantickets/' + userid + '/InProgress'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      /*Comparator<Tickets> dateComparator =
          (b, a) => a.issueCreationTime.compareTo(b.issueCreationTime);*/
      //List data = json['data'];
      List data = json;
      List<Tickets> tkts =
          data.map((tickets) => new Tickets.fromJson(tickets)).toList();
      tkts.sort((b, a) => a.issueCreationTime.compareTo(b.issueCreationTime));
      return tkts;
      //return data.map((tickets) => new Tickets.fromJson(tickets)).toList();
      /*return data
          .map((tickets) => new Tickets.fromJson(tickets))
          .toList()
          .sort((b, a) {
        a.issueCreationTime.compareTo(b.issueCreationTime);
      });*/
      //return tckt.sort((a,b) => a.issueCreationTime.compareTo(b.issueCreationTime));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetTicketsPendingInProgress {
  Future<List<Tickets>> getIssues() async {
    //pass dealer id here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.get(Uri.http('fmsadmintest.azurewebsites.net',
        'api/techniciantickets/' + userid + '/Pending-InProgress'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      List<Tickets> tkts =
          data.map((tickets) => new Tickets.fromJson(tickets)).toList();
      tkts.sort((b, a) => a.issueCreationTime.compareTo(b.issueCreationTime));
      return tkts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetTicketsOnhold {
  Future<List<Tickets>> getIssues() async {
    //pass dealer id here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.get(Uri.http('fmsadmintest.azurewebsites.net',
        'api/techniciantickets/' + userid + '/Onhold'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      List<Tickets> tkts =
          data.map((tickets) => new Tickets.fromJson(tickets)).toList();
      tkts.sort((b, a) => a.issueCreationTime.compareTo(b.issueCreationTime));
      return tkts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetTicketsClosed {
  Future<List<Tickets>> getIssues() async {
    //pass dealer id here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.get(Uri.http('fmsadmintest.azurewebsites.net',
        'api/techniciantickets/' + userid + '/Closed'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      List<Tickets> tkts =
          data.map((tickets) => new Tickets.fromJson(tickets)).toList();
      tkts.sort((b, a) => a.issueCreationTime.compareTo(b.issueCreationTime));
      return tkts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetDealerStations {
  Future<List<Stations>> getDealerStations() async {
    //pass dealer id here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.get(Uri.http(
        'fmsadmintest.azurewebsites.net', 'api/dealerstations/' + userid));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      return data.map((stations) => new Stations.fromJson(stations)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetIssueTypes {
  Future<List<IssueTypes>> getIssueTypes() async {
    final res = await http
        .get(Uri.http('fmsadmintest.azurewebsites.net', 'api/issuetypes'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      return data
          .map((issuetypes) => new IssueTypes.fromJson(issuetypes))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetStationAssets {
  Future<List<Assets>> getStationAssets(String stationId) async {
    final res = await http.get(Uri.http(
        'fmsadmintest.azurewebsites.net', 'api/stationassets/' + stationId));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      //List data = json['data'];
      List data = json;
      return data
          .map((stationassets) => new Assets.fromJson(stationassets))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class PostIssues {
  Future<IssuesCreate> createIssue(
      String dealerId,
    //  String station,
     // String issueType,
      //String priority,
    //  String asset,
      String issue,
      String issueDescription) async {
    final res = await http.post(
      Uri.http('fmsadmintest.azurewebsites.net', 'api/createticket'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Dealer': dealerId,
       // 'StationId': station,
       // 'IsseType': issueType,
        //'Priority': priority,
      //  'Asset': asset,
        'TicketName': issue,
        'Description': issueDescription,
        //'Notes': issueDescription,
        //'Date': DateTime.now().toString(),
      }),
    );
    if (res.statusCode == 200) {
      print("posted");
      return IssuesCreate.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class CloseIssue {
  Future closeIssue(int ticketId) async {
    final res = await http.post(
      Uri.http('fmsadmintest.azurewebsites.net', 'api/closeticket'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'TicketId': ticketId.toString(),
      }),
    );
    if (res.statusCode == 200) {
      print("posted");
      //return IssuesCreate.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class OnSite{
  Future TechnicianOnSite(int technicianId) async {
    final res = await http.post(
      Uri.http('fmsadmintest.azurewebsites.net', 'api/technicianonsite'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'TicketId': technicianId.toString(),
      }),
    );
    if (res.statusCode == 200) {
      print('okay'+ res.body);
      //return IssuesCreate.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class RequestCompleteTicket{
  Future requestCompleteIssue(int ticketId, String comments) async {
    final res = await http.post(
      Uri.http('fmsadmintest.azurewebsites.net', 'api/requestcompleteticket'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'TicketId': ticketId.toString(),
        'Comments': comments,
      }),
    );
    if (res.statusCode == 200) {
      //print('comment posted'+ res.body);
      //return IssuesCreate.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class TechnicianLogin{
  //Future<int> the data type that will be returned
  Future<int> technicianLogin(String Username, String Password) async {
    //userid
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid');
    final res = await http.post(
      Uri.http('fmsadmintest.azurewebsites.net', 'api/technicianlogin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': Username,
        'password': Password,
      }),
    );
    if (res.statusCode == 200) {
      print('login successful'+ res.body);
      var json = jsonDecode(res.body);
      var userid = json['UserId'];
      print( json['UserId']);
      return userid;
     // return data(userid);
      //return IssuesCreate.fromJson(jsonDecode(res.body));
      //return UserId;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
