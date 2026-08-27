Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023121.outbound.protection.outlook.com [40.107.44.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FF351C3B
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811765; cv=fail; b=ILmPVJcUWz+XJicH4fkkidsewlmAvrFisEdBr7VXPPW8tY0GB9M41brBC8ZzivLPvLA1fA7zhBe7lToSgL9jv3yOYGzzyX4Lex65nQ0EeKsak1MIWCjJQpwT/g/gVL5w3DFINbR6ml9UweK3xO0Uz6BkajaZMaUciv9OKyK5/zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811765; c=relaxed/simple;
	bh=YFbnxfv0lpKaI2zhV9Jzg3fvUsBKv/wgdlJpnUcopzo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fC+NYXwW5iRT4wQztkItUN/YSkK6mrmSV96U9SlB2aC7cjc6zpdYJKi4hsSK5BSCYF3ceysn1z5/4fgiTyhKx9G6MHajBPpv59m6AncGUMooECzOGuKByY9DQDsrBjfSvi4sWK0DLDKSFdak2t145lwV4R66QenGyOcrM9fYb7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=eu/X6rj3; arc=fail smtp.client-ip=40.107.44.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="eu/X6rj3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpytE3WdgZbbf6bjAGh1qg3bHYYMDNcb8DiyB9hs/80gobzXzd+lhRqEZHkUZwdS6RRps9qCXwMD6lKzdl7j2WGgeGCXonKloCsp6ZPwskjvV73gjkReR7gIN7uL+ssq9tR4OTxo7mgVjZzFECxMVlzKzgIX16HB8Dpgz23tnXGih2jUA0iAteJVkS7/0JxHyBFKiv0y/DcNshPlhCarzDDm56uxdouydmriMiFzwQXDU4B5o29mzDzWeJfXue2ka8mBTId+O3M4Dytz6TA84QCoTVTCz1VtTTnp97j9fTW39XOGZLh1j+N0ptUk7T66lVC4mq1fM5WEepWJvyZIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFbnxfv0lpKaI2zhV9Jzg3fvUsBKv/wgdlJpnUcopzo=;
 b=qgznNoRFg/41BeFN57Ff1WnGiND+q7bfPF5/TlJYSYxZyjbu81NwtrAjCoPjSy8G9Uqk5oCSxrPzmL4ueD54ZXs4mQTx1zo+Qm3YMDD35ZIEYBHqA52pudx7DVYiM0kbVrIEo9ZE3ywqbL6mnfv/CuXASQcpSdIiZW2QK+sZbZ1x2OlMDdqy2TUBcskDxFkgnaoDcta07XzZGKrKMM4Y8j9/AiglzTqwH0Sre2DueXvDJYj4cgvkgcvRhRD/WbHMjE7YQCw9DrGjRQIJCNJFF2tC2LTz0haVgQIq3oTmmWP82FhFCRgCxs8la0OOCfgt19asxfmceJtmAi6aPjqOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFbnxfv0lpKaI2zhV9Jzg3fvUsBKv/wgdlJpnUcopzo=;
 b=eu/X6rj37WEKHfDbtJ1b+yhxeF2XQJ/CBpP9vaXptxalNt6LrsPtWnywvF1UaIWkWtoSdta0PvVoRDc0Zij1z3o6rchzH+MX4JFbW6DvlbEOvlf5CPMWxqXtf6H5ULO2vAgtc5A2sX2aZuAFG6fApFc8nsOPMBfPs+y8A4TO2gN17OU14oS9DHhH4Vj63xaDLqtXxdsUrFjhdDpO9a1cmCZpDzmu2U4km0C4BnWHsZTQKUAK6pGi+4KIIhsf1YXbA9VtJeRmtFE4kSgDBZc3kVWxpmzU9/akCndrc98hPIN3HKszRw86sasyEzNqB1tyHdOLZgHI3oopYQAK9jIkAQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by JH0PR06MB6630.apcprd06.prod.outlook.com (2603:1096:990:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:22:37 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2%4]) with mapi id 15.21.0339.007; Thu, 27 Aug 2026
 06:22:37 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v2 6/8] EDAC/aspeed: Replace regmap with direct register
 access
Thread-Topic: [PATCH v2 6/8] EDAC/aspeed: Replace regmap with direct register
 access
Thread-Index: AQHdM3I7pNUidcIJgkqPf7l7IKD/9LasgcIAgATv7WA=
Date: Thu, 27 Aug 2026 06:22:37 +0000
Message-ID:
 <TY2PPF5CB9A1BE61E82EEE55F3F725362CCF2AD2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
 <20260824-edac-v2-6-c8d8bb693586@aspeedtech.com>
 <20260824025741.344181F000E9@smtp.kernel.org>
In-Reply-To: <20260824025741.344181F000E9@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|JH0PR06MB6630:EE_
x-ms-office365-filtering-correlation-id: 3e965cc3-bcda-495b-d154-08df040396d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|56012099006|5023799004|22082099003|38070700021|4143699003|6133799003|10067099003;
x-microsoft-antispam-message-info:
 FoD2aHz04XxEU/nTYFVzha7mZORU1lwuhzv3TEYTYB8leXnGpgrDy0Y5EaO9auM/jqtCiFaIJ8sijxPJPO0Z8hwrrCR3YWVRzrlBslDefXqa14SvixGSTGB7D2MQbRw2ffDeM5I5SFyGrTqGBTsgj7RuP7Svfu3JQ0pObAOQ1ZO76rpSfJOaXBlykBl0Zb3+ZuHuRTxf+MyDSDzQcatoe0Q328qli7N1G16v7Sc7p2YZAEJlbMhwOzvhyF4wnRJ9gGBVgOUwclDaJI/QOs8isx4SWEErs9P0K0uYxBGxgu4TWgrIBQnfy9PGtVwrtI+LsUGlrYdYFUgczxxj7gOVLs4c1qIpzYO//3C+aTSI6NAB9OBDW2mFgosQEA6+6PlQV4ZzfBupUQp70g7qWLubAjw9huRSUDQ9zyj+JatoIXGifO8+jSOC14fjyFCzQ3+YmV30gee84HMQWXaYvcWN9Oy+5PWLNiy1M3Vpz/qssVy0+y2rfVSCjGNBaa3XRujKMhjxHZC6EDZKIoehissa/x/iO5C7BHh4sfYAdX7kRwijbFIez4HRuiFvnXi5Axe1SXy9khcLeaaD7gD1B4hR59dyoVzmBi7S8DZDdeyrp1NYaaVJ41fvVVf3J72OYm0lm1qzof5QR49KARv7/rXsIV+FwX7yidaeVHqvv2oy+Ys=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(56012099006)(5023799004)(22082099003)(38070700021)(4143699003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmRvSXFzbDlYNnRidWg4YzliUm5BNDdGN0w0eFRlS0ExQWZ2Vk1ETWJuaEs1?=
 =?utf-8?B?b3QxWHhua2t3R3d5WEVzRU9jUWp6bkg3ZUpseVJJc0dRbjJIcUhXT1g2SXo1?=
 =?utf-8?B?b2RWZHlPcURaMlJmcDdCWHhpWTZKbk5MSWFKYTRaMGJ4VjkvUW9xaUJHODhY?=
 =?utf-8?B?c0YxcmxwcHA0MVBVWFdHZVZqcGl4QmJYM05Oa2ZvUzdSamp2RVNOUkF5ckFS?=
 =?utf-8?B?RVlrZzJUT2hGUU43OXdNUlF0MENVbk00ZFhjakFhTjZqVGlvVy9Gb2lBejA4?=
 =?utf-8?B?T1F6dElITFNodTVIQm93ZHVEZWhmdG8yeVRzV0h6WG8yYXZ1QkJVTlFBajJK?=
 =?utf-8?B?SEpicTkvWWo5NzRlekJpSVlVdjZxaHg2OE1QY29xVzBERXJOL0doQS84bjVE?=
 =?utf-8?B?Z3NKcXFNVENraE9QYzVSL0N3VTZlMVhUVEk0OXNHVEhtckRQNTgxVERnK3l6?=
 =?utf-8?B?dXp0VHpJSURvV3dIdVVQY0JGaHlKdExGajFjMkhCSlNTV1RVbDBIMnJPaHpr?=
 =?utf-8?B?aXdwbmZwZjRERHlnQm9LZitUL2ZXQWsyTzRxM1dZdloxNFBkeHljRTZOUmtt?=
 =?utf-8?B?NWJDUHNjOXJ0VitTWWF4OW5nbEtuTnpYUHZYeDlYd3RWM05LQm5RVGZ6Nlo3?=
 =?utf-8?B?TmdwUHhrZEE5MGpNMFJZS2tlYU44dGZWUzZYQkRValN2NnEwcElSTjhjTFZ1?=
 =?utf-8?B?cUxpMzR5ZXJ4SGFDRDAyZ1pHMlBqaytLS21Ja1lWWmNXRDUxSER5ODF4aTZt?=
 =?utf-8?B?YjdXZ00zZFI1OFUrWHhiWFFUSEY5eHhvUTJobFZkS3NYYTV3dmZHQTV3SmpF?=
 =?utf-8?B?MGpvT1d1MHprZUk5WmJPZmpmWitmNUlJS2tEcDZLd3VJZmRhUTJIVGo1V1Ba?=
 =?utf-8?B?RXd4SUZkd3JSRk5wWlVoWmx6UG14dS9Cc1JHZ29oVmEvdmdQdnlUamxvcmhs?=
 =?utf-8?B?YnI3c2lGVVhlYWtYcEpjRGxKTUJJTmQ3M2RENTV1dWFHT09LR3NVeVNKdWVN?=
 =?utf-8?B?a05Ha01JeWVaUTRUc1RhdHJ3NmxaYUVEWEdIMTd4ejdJeU5mYVNSZmE5aEVn?=
 =?utf-8?B?TVBudFoyNTVGRXhET25aSVVhTU43azdHQ2Z1bDdRbmg1TXZ1OCtkZmtvR2lQ?=
 =?utf-8?B?ZWJUbnhMZ0hkMEQyRTJCdUE0MDBOQi84d29ZdmJaeWdHajVKcXI1a2FvQ0cy?=
 =?utf-8?B?VWNYMnMxaXdlaEN3U2hqc1M5ZDJzRXdZbzgzamVKYytQMWh3VjNwcDB6U25x?=
 =?utf-8?B?ZFA2U0xEK0E2ZnJlQS9CZTEwcXAvZGVQQmk2VzVSOS9zRnR1NWdhWG1OQ1Jy?=
 =?utf-8?B?WmtNaG1lenlGNi9XMjFtWDFrZUJRZW9Ub0luUTA4OVdScmlzOEE4azBGNVZR?=
 =?utf-8?B?TGZodU5rSUVYOWlFOGJrYitoamMyT0pYcno2aHltamorTVlUZ2RCQlNiVmlu?=
 =?utf-8?B?UFl2M1g0dUtMTEpPN1FrK1VHbW1zQkNPc0VJZ0k2blRWVmtIV1VUTGJ4YUZm?=
 =?utf-8?B?bWMvTkhkT2pUamZkdU5qK21YeFd1UWV2aGNTZ3ZnNXBqaEtYZUZqbk0xeGRn?=
 =?utf-8?B?VEdtZXIwWkJYYnVYN1l3VDNlVyt3NWxXb2NHMWhBRjRwa1Z3TGRFSnpHbTNu?=
 =?utf-8?B?eEVTMURxMktuUmZHOXNoUzVPWW1wS1FkL3RINGxYU2FpQW1PYjc2TEpvcm1G?=
 =?utf-8?B?cFdmUE01SDZiNlE5bGt1TkZuOVBIVUxPRkJOcGp6QTgzSFJCWU9NWHFOb0tz?=
 =?utf-8?B?d0ZDWDBCZmpSRFltY1pWMnRZaWJlc2lkdmFhd0h5M0FxKzdReVlWTytVYWJs?=
 =?utf-8?B?ZWxqUU1tUnBwN1Q2OFNNRTRqRTR5VXdTMkhpekVwNDVadWlybkQzMmZkRFph?=
 =?utf-8?B?UGNLWS9DSWUvU3JMbld2MXRkMzIrcFk4aDF1L0hJbXNvQjNPMWpTU0psNXhE?=
 =?utf-8?B?cElTVlZyOXp2UGxRS1RucUY3WUdZREVyV1h5MkxHdmxVcksxMHloQ3hzVWgz?=
 =?utf-8?B?RjAvTnducnBWYm4zb05DUC9jdTgwb3J3THFueE1aT3laWVcxMmV1aEJMSUhz?=
 =?utf-8?B?RWNtOHkvbUpOVHR4b0puTmdHNjlDdHErRWF5Q1dsYWlwWDd0NmtBZkZMVFJJ?=
 =?utf-8?B?cWVBNXJtZnZaMTdMUDNHdlVaeDJjWkpWZmlRVVYvUVQrbjAzbG1vNDZweTJC?=
 =?utf-8?B?ZXZGajB5dG5Wd2xvY0ZQTHFYRmJZcU8rTnVHU0NmeTFHV05VYVV0Q2g2TzNr?=
 =?utf-8?B?enhEZDRLSU9iOURtU2NRMGZ2a1NiM3NXL2VjVFFrQ0xTR3p4ckdyUHlkQkxH?=
 =?utf-8?B?dXhjRXpkMkpFL0hIWENsNEduRzZOWTZKNlpMVHpRMjlXUjByQjR4dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e965cc3-bcda-495b-d154-08df040396d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:22:37.1490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSAitJpXoUiiCVflt2WE16pmKGDEEOVheQ5jXbv4CH9fyvpZAbzwnecC0i29sRBvpazJmqzNMa68vyan1YgyQJHk9LKJ5C8XRMfl6EtYLiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6630

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvOF0gRURBQy9hc3BlZWQ6IFJlcGxhY2UgcmVnbWFw
IHdpdGggZGlyZWN0IHJlZ2lzdGVyDQo+IGFjY2Vzcw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUo
cykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0xvd10gTWl4aW5nIHNjb3BlLWJhc2VkIGNsZWFudXAg
aGVscGVycyB3aXRoIHRyYWRpdGlvbmFsIGdvdG8tYmFzZWQgZXJyb3INCj4gaGFuZGxpbmcgd2l0
aGluIHRoZSBzYW1lIGZ1bmN0aW9uLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFs2XTogW1BBVENI
IHYyIDYvOF0gRURBQy9hc3BlZWQ6IFJlcGxhY2UgcmVnbWFwIHdpdGggZGlyZWN0IHJlZ2lzdGVy
DQo+IGFjY2VzcyAtLS0gY29tbWl0IDcwN2FiZjkxNGNlYWNjYzJlNzM1MDNhYmYxN2E2MzgwYjBm
Yzk0OWINCj4gQXV0aG9yOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4g
DQo+IEVEQUMvYXNwZWVkOiBSZXBsYWNlIHJlZ21hcCB3aXRoIGRpcmVjdCByZWdpc3RlciBhY2Nl
c3MNCj4gDQo+IFRoZSBkcml2ZXIgaW5zdGFudGlhdGVzIGl0cyBvd24gcmVnbWFwIHB1cmVseSBh
cyBhbiBNTUlPIHdyYXBwZXI6IGl0IGhhcyBubw0KPiByZWdpc3RlciBjYWNoZSwgdXNlcyBjdXN0
b20gLnJlZ19yZWFkKCkvLnJlZ193cml0ZSgpIGNhbGxiYWNrcywgYW5kIGlzIG5vdA0KPiBzaGFy
ZWQgYXMgYSBzeXNjb24gd2l0aCBvdGhlciBkcml2ZXJzLiBTbyBpdCBicmluZ3Mgbm90aGluZyBo
ZXJlIGJleW9uZCB0aGUNCj4gc3BpbmxvY2sgdGhhdCByZWdtYXAgdGFrZXMgYXJvdW5kIGVhY2gg
YWNjZXNzIHdoZW4gZmFzdF9pbyBpcyBzZXQuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2VkYWMvYXNwZWVkX2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRhYy5jDQo+ID4gaW5k
ZXggMzUyOTEwZTFkZWZjNS4uMjZkMmM0NTZjYzBkNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2VkYWMvYXNwZWVkX2VkYWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRhYy5j
DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0yNzQsMTMgKzI0NiwxMSBAQCBzdGF0aWMgaW50
IGFzcGVlZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAJaWYg
KElTX0VSUihyZWdzKSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihyZWdzKTsNCj4gPg0KPiA+IC0J
YXNwZWVkX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXQoZGV2LCBOVUxMLCAoX19mb3JjZSB2b2lk
ICopcmVncywNCj4gPiAtCQkJCQkgJmFzcGVlZF9yZWdtYXBfY29uZmlnKTsNCj4gPiAtCWlmIChJ
U19FUlIoYXNwZWVkX3JlZ21hcCkpDQo+ID4gLQkJcmV0dXJuIFBUUl9FUlIoYXNwZWVkX3JlZ21h
cCk7DQo+ID4gKwlzY29wZWRfZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUsICZhc3BlZWRfbG9j
aykNCj4gPiArCQlhc3BlZWRfcmVncyA9IHJlZ3M7DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4g
SXMgaXQgb2theSB0byBtaXggc2NvcGVkX2d1YXJkKCkgd2l0aCBnb3RvLWJhc2VkIGVycm9yIGhh
bmRsaW5nIGluIHRoaXMgZnVuY3Rpb24/DQo+IA0KPiBBY2NvcmRpbmcgdG8gaW5jbHVkZS9saW51
eC9jbGVhbnVwLmgsIHRoZSBleHBlY3RhdGlvbiBpcyB0aGF0IHVzYWdlIG9mIGdvdG8gYW5kDQo+
IGNsZWFudXAgaGVscGVycyBzaG91bGQgbm90IGJlIG1peGVkIGluIHRoZSBzYW1lIGZ1bmN0aW9u
Lg0KPiANCj4gSW4gYXNwZWVkX3Byb2JlKCksIHdlIGludHJvZHVjZSBzY29wZWRfZ3VhcmQoKSBo
ZXJlLCBidXQgdGhlIGZ1bmN0aW9uIHN0aWxsIGhhcw0KPiBnb3RvIHByb2JlX2V4aXQwMSBhbmQg
Z290byBwcm9iZV9leGl0MDIgbGF0ZXIgb246DQo+IA0KPiBhc3BlZWRfcHJvYmUoKSB7DQo+ICAg
ICAuLi4NCj4gICAgIHNjb3BlZF9ndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSwgJmFzcGVlZF9s
b2NrKQ0KPiAgICAgICAgIGFzcGVlZF9yZWdzID0gcmVnczsNCj4gICAgIC4uLg0KPiAgICAgcmMg
PSBpbml0X2Nzcm93cyhtY2kpOw0KPiAgICAgaWYgKHJjKSB7DQo+ICAgICAgICAgZGV2X2Vycigm
cGRldi0+ZGV2LCAiZmFpbGVkIHRvIGluaXQgY3Nyb3dzXG4iKTsNCj4gICAgICAgICBnb3RvIHBy
b2JlX2V4aXQwMjsNCj4gICAgIH0NCj4gICAgIC4uLg0KPiBwcm9iZV9leGl0MDE6DQo+ICAgICBl
ZGFjX21jX2RlbF9tYygmcGRldi0+ZGV2KTsNCj4gcHJvYmVfZXhpdDAyOg0KPiAgICAgZWRhY19t
Y19mcmVlKG1jaSk7DQo+ICAgICAuLi4NCj4gfQ0KPiANCj4gU2hvdWxkIHRoZSByZW1haW5pbmcg
ZXJyb3IgcGF0aHMgYmUgY29udmVydGVkIHRvIHNjb3BlLWJhc2VkIGNsZWFudXBzLCBvcg0KPiB3
b3VsZCBpdCBiZSBiZXR0ZXIgdG8gYXZvaWQgdXNpbmcgc2NvcGUtYmFzZWQgY2xlYW51cCBoZWxw
ZXJzIGhlcmU/DQoNCk5vIGdvdG8gY3Jvc3NlcyB0aGUgZ3VhcmQ6IHRoZSBzY29wZWRfZ3VhcmQo
KSBjb3ZlcnMgYSBzaW5nbGUNCmFzc2lnbm1lbnQgYW5kIGl0cyBzY29wZSBlbmRzIGFib3V0IHRo
aXJ0eSBsaW5lcyBiZWZvcmUgdGhlIGZpcnN0IGdvdG8NCmJlY29tZXMgcmVhY2hhYmxlLCBzbyBh
IGdvdG8gY2Fubm90IHNraXAgYSBjbGVhbnVwIGhlcmUuIFRoZSBsYWJlbHMNCnVud2luZCBtY2ks
IHdoaWNoIG5vIGNsZWFudXAgaGVscGVyIGhvbGRzLg0KDQpDb252ZXJ0aW5nIHRoZW0gaXNuJ3Qg
YXR0cmFjdGl2ZSBlaXRoZXIgLSB0aGV5IGltcGxlbWVudCBhIHR3by1zdGFnZQ0KdGVhcmRvd24s
IGVkYWNfbWNfZGVsX21jKCkgdGhlbiBlZGFjX21jX2ZyZWUoKSwgZW50ZXJlZCBhdCB0d28NCmRp
ZmZlcmVudCBzdGFnZXMsIHdoaWNoIGRvZXNuJ3QgbWFwIG9udG8gYSBzaW5nbGUgX19mcmVlKCku
IEFuZA0KZHJvcHBpbmcgdGhlIGd1YXJkIHdvdWxkIG1lYW4gb3Blbi1jb2RpbmcgbG9jay91bmxv
Y2sgYXJvdW5kIG9uZSBzdG9yZQ0KanVzdCB0byBzYXRpc2Z5IHRoZSBfX2d1YXJkZWRfYnkoJmFz
cGVlZF9sb2NrKSBjaGVjaywgaW4gYSBwYXRoIHdoZXJlDQpub3RoaW5nIGNhbiByYWNlIHlldC4N
Cg0KPiANCj4gPg0KPiA+ICAJLyogYmFpbCBvdXQgaWYgRUNDIG1vZGUgaXMgbm90IGNvbmZpZ3Vy
ZWQgKi8NCj4gPiAtCXJlZ21hcF9yZWFkKGFzcGVlZF9yZWdtYXAsIEFTUEVFRF9NQ1JfQ09ORiwg
JnJlZzA0KTsNCj4gPiArCXJlZzA0ID0gcmVhZGwocmVncyArIEFTUEVFRF9NQ1JfQ09ORik7DQo+
ID4gIAlpZiAoIShyZWcwNCAmIEFTUEVFRF9NQ1JfQ09ORl9FQ0MpKSB7DQo+IA0KPiAtLQ0KPiBT
YXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA4MjQtZWRhYy12Mi0wLWM4ZDhiYjY5MzU4NkBhc3BlZWR0ZQ0KPiBjaC5jb20/cGFydD02DQo=
