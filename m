Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224C93074B1;
	Thu, 30 Jul 2026 03:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785383468; cv=fail; b=lmHoqRGPb3Vdn/UuH6Z5smtKoT0BFS3EId/8THBs4HXYCXTSBCdugZZZ/yT+wp+nPlQT5ScVrLRQa1XjYVOQLerg+NBaI1XqsHGcnPm+W6sSVEw/WOjX4SW12+D+/BLRpNxPvsxV2myNUp8KJ6fwVWi4P4iKPP129AqPSdZGnUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785383468; c=relaxed/simple;
	bh=5BMlco55GNt3ad+9SdeicVguXsiltByvrhWjBoYJCMM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uDxgs7yYMsrq5bLzEet3RVDaCAuYYckDfPtWTeG3PTrQ72W0z2vzT5NR5y8IlCBrhELDz7ygC4d9/nq3/5ksvuj1rV2PFNb6vbEXAEKO9Lv8m2FkKtzCEA8ba+zT9Yg7RceWFThYJ8IL//2VKH5ScIGEHdOcLjDTN6Ph2AvGXZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d/8nA0Bq; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d/8nA0Bq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usrkZkXcR1brSxh6h4nanuijQh2s2Lc+p9q0cET4NvR7NY+0GN7hUqkJ5YoG5BK+flbY34VLD3+tJvx/3tTdPtsith3fwuHNKcBUDjcPhdViLlDrvvWfO3JZkL9LWBJYqGpVYQJbaWw1gP9nNa0S+PiFjOxYMYkbo33u+cCqw8lMmdIZyAHZyyF0VPL2rHu8MTvSfpEdOjJneQjYxTvMM7oxPXpwSCpdVGx5cI6Ko440wE41p8cGbc8JqgkG8x8mPVMgvcziyUPzJW9lCB4i7G1PO04PRzEpyfzQWQPLcUh+AFKv/0OSK2id7shT/NYw4Y7kH/RUVNnqf6w/Z9ABUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BMlco55GNt3ad+9SdeicVguXsiltByvrhWjBoYJCMM=;
 b=EhSwjY3r0eepyIzl2c1G08A1pbUG8qTbnMh/PkAQhqXr+6+mKyEzBZ7oNL3568o1E4So4l6msHeEX6abruf7oU6MxTHPgjpduufO6GwaxEA/wg1ieL5clTlwtqiRdA91CuseO+THIysq1CvhRAS3OICDXIpHXYyzAPJ/iijhhQqEmPWFOqT2v62T/DyCdIIwrxej4Spmc8o9y5JJhNpt1NttG7KIktWOHxK84Nv5QPfSkLPldbOW8axWSq4iNWu6ZVtEyUE97ar+NXkok0mK52b53jznqqpyZBmDl3kZ+6b85l21prJSmB/ysmJ0aABvcs6FWgnWz/34SsziMaom5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BMlco55GNt3ad+9SdeicVguXsiltByvrhWjBoYJCMM=;
 b=d/8nA0BqZjvikCnwDpk8av4PtxU5VmqOcyp04MpMIpbU2CbEdt4zmgaQ30K5C/R+//hXpdsysISQrMQxvOgLBZL0X2kQCy95d63aZgSzbEX9LI9bm1TfMC4pPEyZzKC44GO48QbcziPLAAsmdmSMul0YOc8bmUTck+ghIl0Ey044DNZygueQJmyNlIYMZXFeulLtmLSsm6gqRNAgjt+AS6gor8DUuU4ow1WiZKXFOD/DE12aRqmDTEfQJpvDw/g27GIDS/jKm26xA3IFInOx7KPsHpi+++doHU2gQj9UYTktn70LPN8Wgtx8rtDZuzfF39b1g+khUQ7FynzJbgMxGg==
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) by VI2PR04MB11051.eurprd04.prod.outlook.com
 (2603:10a6:800:26f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 03:50:59 +0000
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a]) by GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 03:50:59 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
Thread-Topic: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
Thread-Index: AQHdHn3QkpUr6cDt4EqYdfYE1i+p9raEUSKAgAEfIwA=
Date: Thu, 30 Jul 2026 03:50:59 +0000
Message-ID:
 <GV2PR04MB1173979757580FE18FE1652F388C92@GV2PR04MB11739.eurprd04.prod.outlook.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-7-wei.fang@oss.nxp.com>
 <20260729104315.7667E1F00A3E@smtp.kernel.org>
In-Reply-To: <20260729104315.7667E1F00A3E@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB11739:EE_|VI2PR04MB11051:EE_
x-ms-office365-filtering-correlation-id: 43d15fa3-7b68-4995-e2ce-08deededc4b4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|38070700021|6133799003|56012099006|4143699003|11063799006|5023799004|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 VrNGdCdjje5WmGmIWJeINmsDLXs68F2IGb59/2YgF6dzKFI8J3I6zNIY3+f/ELu32DYyNnOFZ70L0YSIXUGd7xlCQERBy2SEnZKVB0iVmjX6nxKUHLWUsfu3Ph41uttaUMCYG6hHaq9woMrKg43qSD95XKwN3F/KUQ/2jO4Q9RppA/BSQ709Rs33SwhOEKl7izsEtenidCSEWRTEyR5iXWRQqFF/wRthMp5NBKTzig/T53837Z4F3otByWmAZVvGp07Vd/Ti5VOxasPMLia5Cpfi3rsVwi2TcMwg/rSYmKmhKggldunvimSqfYJ1sX2CKa5thgk2rP0Av3BckRvGkTBMUACNMnhu7tdqmCVb7adtI+SPJGmAAxHFeXlqbOWAFNN6GAwJS113EIyAjM31Q3bC7/bTx7KfMY9Su0BaFGQWH5m9shEBD/IvP7f/tXqynVx0UJn1BKAoExUTtUUkBhhZ3ShV6QzNpZwhoX95Q8dSgwm/3Ce0tOpKDzbPxkYDzjjX8GpqV/rNU7hODjtzMw+QaCtv9KoCv7MCWWdnvBiE9V5F9bBRsTlpqKVqwLqVXJQR0YbRI+A3Vp8fN+e10kmt3mbxWgxxoSbLyU0jyYPdw1Z4nilc2ADBwFHFSOcG6Q0wFsU/DAwCwxWkVMgjxhH+3Qb8RnJIR6cPYW4VjoHSdBf4xGmoSRCHcih4o939QPrh7JjJBW8C73Edcn9MVbYLJm3V07VUfX3i7kdvkiA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11739.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlZrRmowSjdaMGdNSmpOdS9LamdCOTc3d01xWk5rNXIxV1V5bnB0SDNhbzJl?=
 =?utf-8?B?eTJUM2VNa2pucG5nOUFLNHBrM2RRdUlLekRORmdsc2JkaFFtTXRiMUhXVDBn?=
 =?utf-8?B?MFNNc25Fb1hYK3ZwQy9JM0ZuaEJzUS9Cckp5azhOMTFlcXlld2ZBTUlNd1Js?=
 =?utf-8?B?NEtVU0I4azFuekpSM0xDK3pzTzk0Z1RjZGxxL0N4dkI4ckFMRXcwYUFLWVdC?=
 =?utf-8?B?SHBGSG9UdjlEaHV0cjUwbDFEYkwxb21NSGNQVWdiVk00OGl3OUxrc05CSnVI?=
 =?utf-8?B?RWo5VWExQllWKzJvUXRWM1JGMDZRNTZsYkRKaW5IaFVDeVFWRkdrdDZ3VXJ2?=
 =?utf-8?B?ZWNXVzdsNWJYVE5PRjVFOWNRQU5tYXdqbUZUN1JOSkZhL0g0OHEzR2JBS1FF?=
 =?utf-8?B?MzhEV0prSTliSkhkakhRY05SajU4UW9SWmkySC9kbVF5V0puclQxakVsUHpD?=
 =?utf-8?B?WGpLQUg2Q1dVVGFCcnpDbEdiZEpRWXRHbGFWS3h5VkRRUXZLekQxQ21PeHY4?=
 =?utf-8?B?OUpzU0VBVnNUR2x1dzQ1WTlxY1VpelJqUVpwTTMrZytOcFFadEhnTGIyYXA4?=
 =?utf-8?B?cnFIZzMyL1FzUTJvMTIwblhUL0dtYnVxanlqRGJlK20wRE1qeVFQRmRvenBu?=
 =?utf-8?B?dlVSYk1kanBDQkF4VEtFS3UzcnJZOFpBbUh5bytJYjVBdjdlVmN0aDh3VVdG?=
 =?utf-8?B?ODdJSHZvNmhRWmk5UXptV0hNYWtYcStuZ1pUb2cxTVNIMTZ2VlhwSDdTY2w4?=
 =?utf-8?B?dTBKMkxxZ2dHVTVMcEpiVU9wRlNGcm5VV1JBY2dUOHR5K0FkbnA0OGdkRFFx?=
 =?utf-8?B?a3AvemJqWW91MzgyVFFrRml1QVN5VE5yRk9FaFZHclkwRDJ3L1dRMHVIQjc4?=
 =?utf-8?B?M05CNnhTV2ljeWN3SUtZVVUvYW1KWW5RL0xta1JPSE5zRjYvd3lMWW1XQ1A4?=
 =?utf-8?B?N1dJREZoak5lZGx4RUtsRllpT3pJSlViVzBRSzBKam5ZbEpWZWRIL3RmYmFp?=
 =?utf-8?B?RjUwbUhmcVdTRTJnMDNLeDYvRW8zeXVxWnVhOThYd3p2ejVqNWdPKzM4ZVlp?=
 =?utf-8?B?SHl1Sm4rNkcrclVvTmkvdWo4RG5ETWt3VEI1c05nM1RrTlY5TjQ2Rm15amlY?=
 =?utf-8?B?eUdFOUpwVkZ3RmliNGhaSzVZTzFSbUNkZjZvL2QxTDgzSHRYMU9CSm5JUEFy?=
 =?utf-8?B?TXhMa29QR0tkTENjNk5hTXpWV004S2t5Y3NvOUxVQWR2ZEk0enl6cldsR2Mv?=
 =?utf-8?B?V0IzNHQ5VDJxbVJRc2FsMlI2SmtrUmczSWNTVXNRUUhBSzY0bGhxRi9wKzBq?=
 =?utf-8?B?eEJSYVRBOUhiYUI1TzBjVG4ySzVGNEJ0Yjd5V00rMUk2clBPcUs4NDVub3B4?=
 =?utf-8?B?aGhrbG5KTGtiZEJvUGt0alJvU1hLR3d3dDdjN2wrZ05oRHlZYTkxNlJEQWRk?=
 =?utf-8?B?amtJMXd5aTRLNlBSeko3d2VjVlBQVXY2UEdFejRyYUxxS0xnM01LWHE5TDhh?=
 =?utf-8?B?a2xZQkNFeEF5YjU3cTZNamdlNlBIMGRxbkFTOFpYWkZBdXkwbGFNU1NadFZ3?=
 =?utf-8?B?ak9SVVBCV1R5VjlLQWcvYk5UUEJsRytLNE5kdVZBQ3VLZFc5Q25sU3JUcGhM?=
 =?utf-8?B?WTBtbldrMEFVdlpEbWNIMXlhbWdoMytLak1QTzdZWWx2eWtLczg3OTE1RzFG?=
 =?utf-8?B?MzlrSEtnRWlyakJjakJmeXIrTi9sZGlONE9IczVCM1M1UTAxQ0haR3BMT2NW?=
 =?utf-8?B?eGcwSE4yaGdxVEszQVhSeE9FVzJFYXFWYjUzYUVhNElwQ3laVFlKSEhTUEZo?=
 =?utf-8?B?SGo5L204Nmg3UHB2UzNYdXRPLzQxaEIxS1RjWGJYc3piL1IraDVWWTNTMCtY?=
 =?utf-8?B?ZnpoMmFuVEtYWTB2QjZlT1BSTjhHTW9mcGhIQWZad0UvSGptY0xleXlycC9o?=
 =?utf-8?B?U1NLK2cySlZtVmkwYUIxa1laanUvc2hOZ0pyallYaWNlbXVLUXRIbDQrdSsr?=
 =?utf-8?B?elU3aGVZd1I4QnNXdndXeXVPam5OaGgxUjArT1ZqcVpQRjRDaTBQcWtMYlg0?=
 =?utf-8?B?SW9lbWhhNXdYa3JxMWt4c0ZXSjIvcm16RkNpclJ3K1JCeFRiSVpTV09GL2Vw?=
 =?utf-8?B?OUIrN2E0b200ZjdaaC9lUmZ4UUdXTUtPVTRGUnhvNVFRY2gvbW55Yk5paWVP?=
 =?utf-8?B?WmYwa1U0aWRDWEtDV3p0Z2E1ZGljZzVIc1BJREFRbWYzTnRGS0ZyeUNTczBk?=
 =?utf-8?B?QXVPTi9sZTdkSHREcEhmWmpKeW9OSnhJL2JlRUxvV3hMTzZ2OUx2bkFOQ2pH?=
 =?utf-8?Q?VNUSUfWleIEIGxFfwL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11739.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d15fa3-7b68-4995-e2ce-08deededc4b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 03:50:59.5891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prmoTK1C0DHOmsrJLTuQVuCtm3UljMFjP43qQOXJDCBbwYSRgXDkBGup6uXfu7liMAfnJ2Iu4ZK+yeBlGGrJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11051

PiA+ICtzdGF0aWMgdm9pZCBuZXRjX2ZyZWVfcG9ydHNfcmVzb3VyY2VzKHN0cnVjdCBuZXRjX3N3
aXRjaCAqcHJpdikNCj4gPiArew0KPiA+ICsJc3RydWN0IGRzYV9wb3J0ICpkcDsNCj4gPiArDQo+
ID4gKwlkc2Ffc3dpdGNoX2Zvcl9lYWNoX2F2YWlsYWJsZV9wb3J0KGRwLCBwcml2LT5kcykgew0K
PiA+ICsJCXN0cnVjdCBuZXRjX3BvcnQgKm5wID0gcHJpdi0+cG9ydHNbZHAtPmluZGV4XTsNCj4g
PiArDQo+ID4gKwkJaWYgKCFkc2FfcG9ydF9pc191c2VyKGRwKSkNCj4gPiArCQkJY29udGludWU7
DQo+ID4gKw0KPiA+ICsJCS8qIE5vIG5ldyBTS0JzIGNhbiBiZSBlbnF1ZXVlZCBkdXJpbmcgdGVh
cmRvd24uIFB1cmdlIHdpdGhvdXQNCj4gPiArCQkgKiB0aGUgc3BpbmxvY2sgdG8gYXZvaWQgY2Fs
bGluZyBrZnJlZV9za2IoKSB3aXRoIGEgZGVzdHJ1Y3Rvcg0KPiA+ICsJCSAqIChzb2NrX2VmcmVl
KSB3aGlsZSBob2xkaW5nIGEgc3BpbmxvY2suDQo+ID4gKwkJICovDQo+ID4gKwkJX19za2JfcXVl
dWVfcHVyZ2UoJm5wLT5za2JfdHh0c3RhbXBfcXVldWUpOw0KPiANCj4gW1NldmVyaXR5OiBIaWdo
XQ0KPiBEdXJpbmcgc3dpdGNoIHRlYXJkb3duIChlLmcuLCBkcml2ZXIgdW5iaW5kKSwgdGhlIERT
QSB0ZWFyZG93biBzZXF1ZW5jZQ0KPiBkZXN0cm95cyB0aGUgc3dpdGNoIGJlZm9yZSB0aGUgbWFz
dGVyL2NvbmR1aXQgaW50ZXJmYWNlJ3MgUlggaGFuZGxlciBpcw0KPiB1bnJlZ2lzdGVyZWQuIElz
IGl0IHBvc3NpYmxlIGZvciBsYXRlIHRpbWVzdGFtcCByZXNwb25zZXMgdG8gc3RpbGwgYXJyaXZl
Pw0KPiANCj4gSWYgdGhleSBkbyBhcnJpdmUsIG5ldGNfdHdvc3RlcF90c3RhbXBfaGFuZGxlcigp
IHdpbGwgaXRlcmF0ZSBvdmVyDQo+IHNrYl90eHRzdGFtcF9xdWV1ZSB1bmRlciBwdHBfbG9jay4N
Cj4gDQo+IERvZXMgY2FsbGluZyBfX3NrYl9xdWV1ZV9wdXJnZSgpIGhlcmUgd2l0aG91dCB0aGUg
bG9jayByaXNrIGNvcnJ1cHRpbmcgdGhlDQo+IGxpc3QgcG9pbnRlcnMgd2hpbGUgdGhlIFJYIHNv
ZnRpcnEgaXMgY29uY3VycmVudGx5IHRyYXZlcnNpbmcgdGhlbT8NCg0KdGhpcyBpcyBhIGZhbHNl
IHBvc2l0aXZlOiBkc2FfY29uZHVpdF90ZWFyZG93bigpIGNsZWFycyBjb25kdWl0LT5kc2FfcHRy
DQood2l0aCBhIGJhcnJpZXIpIGJlZm9yZSBkcy0+b3BzLT50ZWFyZG93biBydW5zLCBzbyB0aGUg
aGFuZGxlciBjYW5ub3QgYmUNCmludm9rZWQgY29uY3VycmVudGx5IHdpdGggdGhlIHB1cmdlLCBh
bmQgdGhlcmUgaXMgbm8gbGlzdC1jb3JydXB0aW9uIHJpc2suDQoNCg==
