import 'dart:ffi';

class Tickets {
  final int id;
  final String issueName;
  final String stationLocation;
  final String issueCreationTime;
  final double slaPeriod;
  final String assigned;
  final String status;
  final String issueType;
  final String asset;
  final String description;
  final String priority;
  final String technician;
  final String dateContractorAssigned;
  final String dateArrivedOnSite;

  Tickets(
      {this.id,
      this.issueName,
      this.stationLocation,
      this.issueCreationTime,
      this.slaPeriod,
      this.assigned,
      this.status,
      this.issueType,
      this.asset,
      this.description,
      this.priority,
      this.technician,
      this.dateContractorAssigned,
      this.dateArrivedOnSite});

  Tickets.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        issueName = json['IssueName'] ?? '',
        stationLocation = json['StationLocation'] ?? '',
        issueCreationTime = json['DateCreated'] ?? '',
        dateContractorAssigned = json['DateContractorAssigned'] ?? '',
        slaPeriod = json['SLAResolveTime'] ?? 0.0,
        assigned = json['ContractorAssigned'] ?? '',
        status = json['Status'] ?? '',
        issueType = json['IssueType'] ?? '',
        asset = json['Asset'] ?? '',
        technician = json['TechnicianAssigned'] ?? '',
        priority = json['Priority'] ?? '',
        description = json['Description'] ?? '',
        dateArrivedOnSite = json['DateArrivedOnSite'] ?? '';
}

class IssuesCreate {
  final String dealerId;
  final String stationLocation;
  final String priority;
  final String asset;
  final String issueType;
  final String issueName;
  final String issueDescription;

  IssuesCreate(
      {this.dealerId,
      this.stationLocation,
      this.priority,
      this.asset,
      this.issueType,
      this.issueName,
      this.issueDescription});

  IssuesCreate.fromJson(Map<String, dynamic> json)
      : dealerId = json['dealerId'],
        stationLocation = json['stationLocation'],
        priority = json['priority'],
        asset = json['asset'],
        issueType = json['issueType'],
        issueName = json['issueName'],
        issueDescription = json['issueDescription'];
}

class Stations {
  final int stationId;
  final String stationName;

  Stations({this.stationId, this.stationName});

  Stations.fromJson(Map<String, dynamic> json)
      : stationId = json['Id'],
        stationName = json['Name'];
}

class IssueTypes {
  final int Id;
  final String Name;

  IssueTypes({this.Id, this.Name});

  IssueTypes.fromJson(Map<String, dynamic> json)
      : Id = json['Id'],
        Name = json['Name'];
}

class Assets {
  final int Id;
  final String Name;

  Assets({this.Id, this.Name});

  Assets.fromJson(Map<String, dynamic> json)
      : Id = json['Id'],
        Name = json['Name'];
}
