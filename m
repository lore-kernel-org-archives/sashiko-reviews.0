Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022126.outbound.protection.outlook.com [40.107.75.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F873A254B
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039581; cv=fail; b=uaP3KFFLJchufpDhQBQLUIBN5sxMHjrruIdSN0olFkHAM1pCYFNBY9dgiH8L+NGYLmhXll2l5zKzNZKncedJqLN4LqpxXB+n5D500iI0pnM2UQn1AWDbpdOcOn2gvcxuzS5lHNPh4IPCvfng/D/kBNVG/CtD9i/BbDXfQAV8+YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039581; c=relaxed/simple;
	bh=mMCpIZ8Gr+kXjnTGhlO0M/T/Fi9laltqIAVVzg086SI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DtLLGfo1D1pkcStx2zg6E3aWWsf4zDvIKSeEdqRlY5J3dEb1FT5q9BHMLkW18mMtAcT1K8pokyd/dHQurWHEfNAwE5QGm5aA9sz/GO2AdFCB+OfUc3htJsjySj5dnNgT41sjwQSjkq7kHkH8A0cy4ybGgaTgrVbci/5dzFaF/X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=da8aD3w+; arc=fail smtp.client-ip=40.107.75.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="da8aD3w+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoE1ogEDcd8ZPwzQYtLX+tqBP4eaZUKoJkUW1M6j+FnDC57ign/vvpxHx+n9BDldwuGMdReff9TkK6ttO3A8oUCkMK8Z8eCAaMvqk8Vbtg+P2BASMFmP8H4HpX2IMSu1gZHDYmQxWc9i2Ouv0au82PvKSGiWbhCZdd9HG5xuVDwgeo+ANc9Wfod500THEIlaopT6B79MdfT8lJMZkm9DOAVz/wUTzj6HmE4w9v/4ckVvGWTms4oagA9tPdmmqF3BAjGzk/gtbfdrqEdwHAS7jeDYTgqgmsI7juJQbMzbR9rYvbBEbGLiYpk3+iq9HL+zdyZpel7YgrfQD/QbnIGIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMCpIZ8Gr+kXjnTGhlO0M/T/Fi9laltqIAVVzg086SI=;
 b=NMH6oa7wXRu9SB1y0W9se9f4h5HrwcAx/7shAw8bsQBPUHTyjWpVnK8LrENIENCAxujHtkpLQoSEBc//UtLoRupkLl/3sCLZg9UGl90stP16rtXgMPsmeGK8Bx5AQWD/axvphnrLLWYxK2lMXHynFbY/CYNMQ9K9w/x8lZ17EnUSDeJrJrEd9TSimctt0Vx71govKr2I0tKaKuBl5CL+EXLnGlm4krUpNsbJJyXpctcCA2ajbz89j7E7jksfzoxAaNUGwUB4fqOwz/q0WRtZYFPTF44LZTDxBXrzYy7vZGaV4fqpsaWVHi5PPfokv2tY4Xt8F9YcsON9YI2cpMRVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMCpIZ8Gr+kXjnTGhlO0M/T/Fi9laltqIAVVzg086SI=;
 b=da8aD3w+ORv6ZfLypvbsAEHmG8nMrZ+iZVHaXju+JELMBAek6i7IfEdaN4Z1n3N0sSi0Ac7du3ibdoQ9WHbYyTajDbg0hQJPZNjpyHPNZ/DeiCdInPgB1tO/3b2mSsbK0Mh9qsdPmBcwbhl4In3l32v0aH+7vLu2057fv7Z11HSvQrmaP/YMtKL81hpKzeB4J6A0egqRbdryuCAyD5d8PaJcb4Y5bVjZg/9NbPpDSO/9vgpUtNjR1/emQixGyKu/e6/mdltOAv2on+mwGNQcuhH7xMIuRpjZiRrwo1oYDOSjdfEGwVlKSyzHPCcXYm2IotA/fxZA4vTuQeSXBfbXOA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR0601MB5510.apcprd06.prod.outlook.com (2603:1096:820:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 07:26:11 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838%7]) with mapi id 15.21.0048.019; Fri, 29 May 2026
 07:26:11 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v30 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Thread-Topic: [PATCH v30 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Thread-Index: AQHc7nVvzyEIEOA98Umc3acpO/y9FbYjF3EAgAGEJmA=
Date: Fri, 29 May 2026 07:26:10 +0000
Message-ID:
 <TY2PPF5CB9A1BE6D08025992C339025D1B3F2162@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260528-upstream_i2c-v30-2-5d4f9adc3530@aspeedtech.com>
 <20260528081545.51ABC1F000E9@smtp.kernel.org>
In-Reply-To: <20260528081545.51ABC1F000E9@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR0601MB5510:EE_
x-ms-office365-filtering-correlation-id: d9a885bc-61d9-4570-a316-08debd538ee9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099006|6133799003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 L/Ze2cWrNq/kLhfWgPAml+kR7QtDt96ilivQUz3i1k/tFKxj1yyR9Ak2J7QKDBaKIIfWqyr5DRs+M8IfvQni4tpX3BiKLQTt7SnSbmrROn9hGIcN0J0psUWGf9hGOAqn14sdRlwW0TR5bcjeY+Y+dDgB+M2+YfqgmdMIdrIxvXNGtkv4SAauoFAtNpvJZ1mwb64kd+mZbV+l/jtcTIoRJVnRMPjZ6Qfy3gqIqGGm4KYnN7tRTT1wHiGwIxjexxwow4AfDCUfIMq+gqL5vdc6ELmTjXMN2iccFtMWkQESnGU3go2y1XLhZ2nXO3z0QNkbYivav0CPOpXQ+aDnvlrB+BJCaGCfmjMYoIoDrprLKnYwZjqBnPc1FtsG3uG7I2/za2HghcUNyVmAb9mGYaUwtGDRpypZwJUrio/DLNBTT800MNM75QHZ0q2A+7l4VYn9q8Iz8J1WeSEQp+S2E3HlW+DfyRvTFruHpDJAUJUbvA9ZaiWfV8n3j4jYf06Vo4YwWBJLMrfvTFa9cptYcTMHVaKBI6/gh+SXHCmBdAqZAV1efS7NxCyWoP5XZhTrOL5jAOBBrAD1pqcqTzuByQ7CUkxmAolsSsQzbY6yKP+dCmNM4+dHaVl19wvB812ozxQzIyQvXY/m0TmUudbhg+Yx8KSpL2KbR8q8qnJtxbpWGopM+w7KlHhuB7MBx/xA7WWQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2NnQlY5Qno4VTRSMVFMajZyUjROZ0FPUUZjNFVrZ003T3NSTktQSkluK00x?=
 =?utf-8?B?V2I1L2EwMGwvMlZGZk5rdFZ1WWIwN0FtakgydStmTkVnbFlnUVFqZzFCYVFx?=
 =?utf-8?B?MFRnZWVXREptdEZsZlJQeWFHYnozSFNwamFvaGRpRnVGUXFROVA3WEdjZ3Zv?=
 =?utf-8?B?eTBDRHJzNnU3ZFA2dlowRVpYb21xNmRFUTlSUEpnRE9jUEZWMDJRM2UvTkRX?=
 =?utf-8?B?bWZSZ3BCZlBicE8yUUFZdVNCWmpLZDg4aG1NSDF0WTExbVFUMzJhQXVIMU5E?=
 =?utf-8?B?bC96N0Zadjg3bEpUNzhxcGhYcVVjZmh2bHBhSUhYcjk2RHRVd3pHUm50UjFZ?=
 =?utf-8?B?S3FvZXZIQkVYSzRYOThHU05vNVljOGZ5dGJxelRnNVZjbEtsVnRXRnN2dEFn?=
 =?utf-8?B?cUZJWU1TQ3pZeWw3OUZCUzcxcHhMOVgzT3RMTVdpNFhldHJMc1U2b2RtNnpa?=
 =?utf-8?B?blovdUpwVFZ2eXlxQStwQWdDd1RxRTQ0aEwwOGtMcnBzMWpjR0dFWVI1N2pX?=
 =?utf-8?B?MUJSc1kvZHJsNjBmalF4eHZPSENsMXRLalhIYmhoUjJPa09QVDg3bUF4V1hR?=
 =?utf-8?B?bVVUdHJhd2J3UE1NcW9SL2pVNTlMQ2huNVAzY01MZERhUXkxclZ0R1RSbVZp?=
 =?utf-8?B?OXVQaTF6OWhlTHUwKzFxTXE4TkRhbEo4czB5NFBJZmpEd0s5c0ROZThQeEtK?=
 =?utf-8?B?NElsQXpQYzNUeEcrR2R2RWlUVzJBVEZ1VjlTTDFUS1p4dXNIVVFRS3JJOWJE?=
 =?utf-8?B?VVYxR0FQSEZYVDh2Z3Jxd1ZkZ21SMmFmbHBJQjhicWo3cHVyS3dXcWJvMGQy?=
 =?utf-8?B?TzdQNmN5ZjYvRlNpbmZITjMwU1c4cVlkNm1oQ3hNMHRRV1pBNndOZTNFeHJP?=
 =?utf-8?B?UkxkT1BqYkduUFU1dzZpL1VNeHZQbXBwOEMwWUw2OHpWWDF2NHRZSDl1SGds?=
 =?utf-8?B?WmpjN29WcnhQMXlOWDdXRGU0ejViai96cTVxczFxSXZ4SGprcFFiNnVPRU5K?=
 =?utf-8?B?MXlRcjVxcTFWY1U2Y2J3Yy81dmNMRThWSDBLK0JFLzAvMXp4MEtmbmdDUjJw?=
 =?utf-8?B?dHU4ZXNIdmVuTHQxaHh5SjUzOHhNTTUzNnJYYjFuQk5PM1VaR25YdmRPRVBj?=
 =?utf-8?B?eHBmRkROcGZhaFJYU2NSTTdMVkloSzN1cEE5amR6SFRhbVFKUExVcHh1UHQ4?=
 =?utf-8?B?THJXRFdBOXlLSkR2VVlLcnA0clEvV3I5eGFmSCtUSzIxNVBkQno5VW80UTJz?=
 =?utf-8?B?bXZGa0JybnA2K1VxYnB3YWJIdE1wc255NFh2YTlESzBHcjlxanV2cjlnNW44?=
 =?utf-8?B?Nmp1OUgwK2JTS0hRYXpwTTYzdzBob1YyYVNzOGI4cm0zTThQNGxJK2tNZXlO?=
 =?utf-8?B?MTFMOTZncW1IdFZzaVluWlZTc0g4M3R5aDRCYjFQd2RrQXNIc0tQekdqRE9V?=
 =?utf-8?B?TVBvYlFQZ01lUGVVUXhUM0xqMFEvQWpkdy9wSUNZTU1iMk03WCt5S1ZIRjdm?=
 =?utf-8?B?ck1tbWFqclovb0JvTmNGbXhKbjJVakdlK2UyQnNoc3grNVdieFE5VldJY3Na?=
 =?utf-8?B?WUFBWDlSQnFIN0IvUkJSUCtPZ0NEVjdjL252VkdhLzhpYWVidHNHZHJkV1ZV?=
 =?utf-8?B?R2FaTzR3aHVGMlZ3c1pJdkcvZnQzVEVSTDNMbnV6Um5FaVQzSUMwb1BJdFhy?=
 =?utf-8?B?RjRvRHIwdVhHa3Roay9DTWlFVWpyTnhSOUtLOHF5V1VCYUFxVjltT2JJNVBu?=
 =?utf-8?B?SElDcnVSd0hDc1YvWG83Rk9GNTcxWXQ0dkQrb1FDa200UkNsRGhVQnRMU3ZR?=
 =?utf-8?B?NDNRcUkvZVdRVW1CNUNGaTcxVlBtdnRycHgzS1ZFK2dRdXVvTHdFNllsenh5?=
 =?utf-8?B?QnFBa0tSeHRFNVVqOVpZdVNxMHJaZTJNaGp6STQrcVhPK01Qdm16VjBrcEVJ?=
 =?utf-8?B?d2o4b2FIeUQzNThMOUhRY1JIZHNMcDBPRm4yMFJRU2FkMkptL0M1S0dtcmpN?=
 =?utf-8?B?YzBLWFYxNTBBZE9Jbi9uTU02M00xNFV6Q2MvWjZBanptakpvYlhzSUVTQkVJ?=
 =?utf-8?B?TUM5ZTJ3ckcraXdJOHNqblRWU0ZReC9sRDc4Y0Exc2pyMzZaUm5hcnNHZWdi?=
 =?utf-8?B?ZlRiaXZrTGh3bUxaWUhSUXl3Zi9yNzVXT3RZZGdNeFp3RlpOZHZ4RTZRWkRn?=
 =?utf-8?B?SS9obXUxRVhnYWtNWUMxekJFRDNoUE11U3FMcjkrNlo2dHRUZDlFVHhjQTBt?=
 =?utf-8?B?K2lyVnB5RnFmR01zQStjWFFsOUs1OFJZMUhaT2g3K1Vac0lIMHE1MHRsZ0dY?=
 =?utf-8?B?b3ZmWFJvQm1hcU9DaVNxb0hpSzJ2dFJObHZ1eWlHd3Nsem02eGt4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a885bc-61d9-4570-a316-08debd538ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 07:26:11.0298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxw694DonnLLO+EyhVgIbT4FzUbE7pPmrmUuTNM/SGDuTu34fA1nt0f+rprVXPSlH/Jl/dbAUnvsk5p9g2iUULKMt4zjiubw13qdNsyhbDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5510

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzMCAyLzVdIGkyYzogYXNwZWVkOiBSZWFkIGNsb2NrLWZy
ZXF1ZW5jeSB2aWENCj4gaTJjX3BhcnNlX2Z3X3RpbWluZ3MoKQ0KPiANCj4gVGhhbmsgeW91IGZv
ciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwg
aXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IA0KPiBOZXcgaXNzdWVzOg0KPiAtIFtIaWdoXSBU
aGUgYHN0cnVjdCBpMmNfdGltaW5ncyB0aW1pbmdzYCB2YXJpYWJsZSBpcyBkZWNsYXJlZCBvbiB0
aGUgc3RhY2sNCj4gd2l0aG91dCBpbml0aWFsaXphdGlvbi4gSWYgdGhlIGBjbG9jay1mcmVxdWVu
Y3lgIGRldmljZSB0cmVlIHByb3BlcnR5IGlzIG1pc3NpbmcsDQo+IGB0aW1pbmdzLmJ1c19mcmVx
X2h6YCByZW1haW5zIHVuaW5pdGlhbGl6ZWQsIGxlYWRpbmcgdG8gdW5kZWZpbmVkIGJlaGF2aW9y
IGFuZA0KPiBpbmNvcnJlY3RseSBieXBhc3NpbmcgdGhlIGZhbGxiYWNrIGxvZ2ljLg0KPiANCj4g
UHJlLWV4aXN0aW5nIGlzc3VlczoNCj4gLSBbSGlnaF0gVGhlIGRyaXZlciBkaXNhYmxlcyB0aGUg
STJDIGNvbnRyb2xsZXIgYW5kIGFzc2VydHMgaGFyZHdhcmUgcmVzZXQNCj4gYmVmb3JlIHVucmVn
aXN0ZXJpbmcgdGhlIEkyQyBhZGFwdGVyLCBsZWFkaW5nIHRvIGhhbmdpbmcgSTJDIHRyYW5zZmVy
cyBkdXJpbmcNCj4gdGVhcmRvd24uDQo+IC0tDQo+IA0KPiBjb21taXQgMjk1MDM0YjBkMjhlNTNh
YzhiOGVhNDdjOTA2ZmYyNThhZDJjODNmNg0KPiBBdXRob3I6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVu
QGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBpMmM6IGFzcGVlZDogUmVhZCBjbG9jay1mcmVx
dWVuY3kgdmlhIGkyY19wYXJzZV9md190aW1pbmdzKCkNCj4gDQo+IFRoaXMgY29tbWl0IHVwZGF0
ZXMgdGhlIEFzcGVlZCBJMkMgZHJpdmVyIHRvIHJlYWQgdGhlIHN0YW5kYXJkDQo+IGNsb2NrLWZy
ZXF1ZW5jeSBwcm9wZXJ0eSB1c2luZyBpMmNfcGFyc2VfZndfdGltaW5ncygpLiBJdCBmYWxscyBi
YWNrIHRvIHRoZQ0KPiBsZWdhY3kgYnVzLWZyZXF1ZW5jeSBwcm9wZXJ0eSBvbmx5IGlmIHRoZSBz
dGFuZGFyZCBwcm9wZXJ0eSBpcyBhYnNlbnQuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
cGVlZC5jIGluZGV4IGEyNmI3NGM3MTIwNjEuLjEzNzg4OWU1N2RkYzYNCj4gPiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPiA+IEBAIC0xMDAwLDYgKzEwMDAsNyBAQCBzdGF0
aWMgaW50IGFzcGVlZF9pMmNfcHJvYmVfYnVzKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ID4gIAljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsNCj4gPiAgCXN0cnVj
dCBhc3BlZWRfaTJjX2J1cyAqYnVzOw0KPiA+ICAJc3RydWN0IGNsayAqcGFyZW50X2NsazsNCj4g
PiArCXN0cnVjdCBpMmNfdGltaW5ncyB0aW1pbmdzOw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0K
PiBEb2VzIHRoZSB0aW1pbmdzIHN0cnVjdHVyZSBuZWVkIHRvIGJlIHplcm8taW5pdGlhbGl6ZWQg
aGVyZT8NCkkgd2lsbCB1cGRhdGUgd2l0aCBmb2xsb3dpbmcNCglzdHJ1Y3QgaTJjX3RpbWluZ3Mg
dGltaW5ncyA9IHt9Ow0KPiANCj4gPiAgCWludCBpcnEsIHJldDsNCj4gPg0KPiA+ICAJYnVzID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqYnVzKSwgR0ZQX0tFUk5FTCk7DQo+IA0K
PiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0xMDI1LDEyICsxMDI2LDE4IEBAIHN0YXRpYyBpbnQgYXNw
ZWVkX2kyY19wcm9iZV9idXMoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAg
CX0NCj4gPiAgCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoYnVzLT5yc3QpOw0KPiA+DQo+ID4gLQly
ZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwNCj4gPiAtCQkJCSAg
ICJidXMtZnJlcXVlbmN5IiwgJmJ1cy0+YnVzX2ZyZXF1ZW5jeSk7DQo+ID4gLQlpZiAocmV0IDwg
MCkgew0KPiA+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwNCj4gPiAtCQkJIkNvdWxkIG5vdCByZWFk
IGJ1cy1mcmVxdWVuY3kgcHJvcGVydHlcbiIpOw0KPiA+IC0JCWJ1cy0+YnVzX2ZyZXF1ZW5jeSA9
IEkyQ19NQVhfU1RBTkRBUkRfTU9ERV9GUkVROw0KPiA+ICsJaTJjX3BhcnNlX2Z3X3RpbWluZ3Mo
JnBkZXYtPmRldiwgJnRpbWluZ3MsIGZhbHNlKTsNCj4gPiArCWlmICh0aW1pbmdzLmJ1c19mcmVx
X2h6KSB7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFNpbmNlIHVzZV9kZWZhdWx0cyBpcyBw
YXNzZWQgYXMgZmFsc2UgdG8gaTJjX3BhcnNlX2Z3X3RpbWluZ3MoKSwgaWYgdGhlDQo+IGNsb2Nr
LWZyZXF1ZW5jeSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBpcyBtaXNzaW5nLCBpMmNfcGFyc2VfdGlt
aW5nKCkgd2lsbCBub3QNCj4gbW9kaWZ5IHRpbWluZ3MuYnVzX2ZyZXFfaHouDQo+IA0KPiBDb3Vs
ZCB0aGlzIGxlYXZlIHRpbWluZ3MuYnVzX2ZyZXFfaHogd2l0aCB1bmluaXRpYWxpemVkIHN0YWNr
IG1lbW9yeSwgd2hpY2gNCj4gbWlnaHQgZXZhbHVhdGUgdG8gdHJ1ZSBhbmQgYnlwYXNzIHRoZSBm
YWxsYmFjayB0byB0aGUgYnVzLWZyZXF1ZW5jeSBwcm9wZXJ0eT8NCj4gDQo+ID4gKwkJYnVzLT5i
dXNfZnJlcXVlbmN5ID0gdGltaW5ncy5idXNfZnJlcV9oejsNCj4gPiArCX0gZWxzZSB7DQo+ID4g
KwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gKwkJ
CQkJICAgImJ1cy1mcmVxdWVuY3kiLA0KPiA+ICsJCQkJCSAgICZidXMtPmJ1c19mcmVxdWVuY3kp
Ow0KPiA+ICsJCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwNCj4g
PiArCQkJCSJDb3VsZCBub3QgcmVhZCBjbG9jay1mcmVxdWVuY3kgb3IgYnVzLWZyZXF1ZW5jeQ0K
PiBwcm9wZXJ0eVxuIik7DQo+ID4gKwkJCWJ1cy0+YnVzX2ZyZXF1ZW5jeSA9IEkyQ19NQVhfU1RB
TkRBUkRfTU9ERV9GUkVROw0KPiA+ICsJCX0NCj4gPiAgCX0NCj4gDQo+IFsgLi4uIF0NCj4gDQo+
ID4gIHN0YXRpYyB2b2lkIGFzcGVlZF9pMmNfcmVtb3ZlX2J1cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KSAgew0KPiA+ICAJc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4NCj4g
PiAgCXNwaW5fbG9ja19pcnFzYXZlKCZidXMtPmxvY2ssIGZsYWdzKTsNCj4gPg0KPiA+ICAJLyog
RGlzYWJsZSBldmVyeXRoaW5nLiAqLw0KPiA+ICAJd3JpdGVsKDAsIGJ1cy0+YmFzZSArIEFTUEVF
RF9JMkNfRlVOX0NUUkxfUkVHKTsNCj4gPiAgCXdyaXRlbCgwLCBidXMtPmJhc2UgKyBBU1BFRURf
STJDX0lOVFJfQ1RSTF9SRUcpOw0KPiA+DQo+ID4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZi
dXMtPmxvY2ssIGZsYWdzKTsNCj4gPg0KPiA+ICAJcmVzZXRfY29udHJvbF9hc3NlcnQoYnVzLT5y
c3QpOw0KPiA+DQo+ID4gIAlpMmNfZGVsX2FkYXB0ZXIoJmJ1cy0+YWRhcCk7DQo+IA0KPiBbU2V2
ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHRo
ZSBJMkMgY29udHJvbGxlciBnZXQgZGlzYWJsZWQgYmVmb3JlIGNoaWxkDQo+IGRldmljZXMgYXJl
IHVucmVnaXN0ZXJlZD8NCj4gDQo+IEluIGFzcGVlZF9pMmNfcmVtb3ZlX2J1cygpLCB0aGUgZHJp
dmVyIGRpc2FibGVzIHRoZSBJMkMgY29udHJvbGxlciBhbmQgYXNzZXJ0cw0KPiB0aGUgaGFyZHdh
cmUgcmVzZXQgYmVmb3JlIGNhbGxpbmcgaTJjX2RlbF9hZGFwdGVyKCkuDQo+IA0KPiBTaW5jZSBp
MmNfZGVsX2FkYXB0ZXIoKSBjb29yZGluYXRlcyB0aGUgcmVtb3ZhbCBvZiByZWdpc3RlcmVkIEky
QyBjaGlsZCBkZXZpY2VzLA0KPiB0aGVpciByZW1vdmUoKSBjYWxsYmFja3MgbWlnaHQgaXNzdWUg
ZmluYWwgSTJDIHRyYW5zZmVycyB0byBncmFjZWZ1bGx5IHNodXQgZG93bi4NCj4gQmVjYXVzZSB0
aGUgY29udHJvbGxlciBpcyBhbHJlYWR5IGRpc2FibGVkIGFuZCBoZWxkIGluIHJlc2V0LCBjb3Vs
ZCB0aGVzZQ0KPiB0cmFuc2ZlcnMgaGFuZyBhbmQgZXhwaXJlIHRoZSB0aW1lb3V0LCBsZWFkaW5n
IHRvIHRlYXJkb3duIGRlbGF5cyBhbmQNCj4gaW5jb25zaXN0ZW50IGhhcmR3YXJlIHN0YXRlPw0K
PiANCj4gPiAgfQ0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTI4LXVwc3RyZWFtX2kyYy12MzAtMC01ZDRmOWFk
YzM1MzBADQo+IGFzcGVlZHRlY2guY29tP3BhcnQ9Mg0K
