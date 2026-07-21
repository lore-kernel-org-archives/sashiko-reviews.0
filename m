Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF82FD675;
	Tue, 21 Jul 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630803; cv=fail; b=fj5HA/k8CW/tHJL+PNVcYb4tAnzHLY6TSLfA1x9/1XAKS6cBJ1rj0K74J4L4IBlW8JAenV9lI0tD81pdKUIRF5bIDS7b/c1FKgE6CW3AbHrwZIxQSymYzgJWbgsQf8/5RjLM0rTrQblw53frAhOqoztjnj/b4cJNb8Hac/S9Yy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630803; c=relaxed/simple;
	bh=i4YOteFebDaEs0I9pVxsYnAfgHWsXPiNBg32z0X+f8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ckIKiXB+DGpqo7iHNddKlQnNxZHsxwk3vw4UHspHgYw0M/dijT98x7QQ/BJLpYiqQ06yxZy0p9b2GbdxmoCqYX5V6Bds+orY7TkV9IYfr2RcIUwFtQLZ/IPqD4hu4ABoLPJCKqDyBuS0S/zJOoKRVezZSDLWrMnZ0wlXC/vwfKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EWnWgPBH; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EWnWgPBH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG5E/YIbZUYRmeWK8FD48Yv/HkD5fl90XUXDO2YQaMxrHfjqpG2urncT8F9PdfzocADJOzBMvFU2RePV4ktXDITS0WZQ5oL0UrWG1U2ayKJOFfnu7+iIcAqPmz1GtCGKnNIjMDEkJZbuukOvatw73Zz1n8YTfKBCeHpf/Up6r3jNrwKhGmP6TS0uxBO+gjlKizTeLnhFwKB0M3Mf8w8hklaHoPeNzJUrh3SV6OuqSQiwPD4pdEUb672DSsZRIDTzQ3uwq3JQOLTs/SSnopF/g4OUMRJyrPM2pbRbL/AmbMMyRExr0M8YH6HXGODP5zvLMsRu8Bw4tXB+oymQYAG2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4YOteFebDaEs0I9pVxsYnAfgHWsXPiNBg32z0X+f8U=;
 b=dZpARPSJoZNZTrYrJ6SP6w/6lEcOyiOtpfQCDYIuHNvAAreRuMQiFHr7UmSrBOVkSvFOkE0LNmFQGBT5VUKG3x71po1ufERzHoDCUJ26qv5Www6k7EzuNvr24u4tcCSyp+D8IDLlBx8FuUSiXYeoCs9KTfFJOYCC28u1ugMfi1PsGDw7uLbenIufOa7gL1cwHpno7zhlc8y2pE/GLDXyh7mq9L32ufr6vZ9vUvK2Yc/vqXcVTggOnMYUiXfeMpn5hsVMW/Pbl/vNxcEXLR0bu+DIE5sB5PC+ldwuqBc3NTLJFOS57U2z5rbKoaWD1r81NzsACIVsNeIYW/2wGA/j6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4YOteFebDaEs0I9pVxsYnAfgHWsXPiNBg32z0X+f8U=;
 b=EWnWgPBH5cLu3ARxrUi6/bjB1RJUJ4sUgmfyxx8pEk+lb6UHoXTEYOMSG1Srfi5ASeQduDd6/byD0o6u+GXfhAIoC45zqlxHiWNq3rqQFO+Ont9toF/Ylz8H0EFKHZ4NvYPY6tp4sMWfMjxzq0QpyzAGeAjirahj+Fnpnj8CG8YDLBPH+hF7pDzUX8pSNBQn1suIoLGN+T9tOK1TgtYpAKPwbB/XftNdiMybDVGoBbHR4XdjylQcb6eskaDlFh/ZCilQxwCy7sM/s8JddSgz/nA5Uzrhc9hYilJqyfiFV7sdjqL7cvzqrgOTnGDTPQRQiR7XUFxk3QyrA+OfxgBqqA==
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:46:31 +0000
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1]) by AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1%4]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 10:46:31 +0000
From: "Robby Cai (OSS)" <robby.cai@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Robby Cai (OSS)" <robby.cai@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Thread-Topic: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Thread-Index: AQHdGPc4CQYHDSWvREW3SsE7331JFLZ3v5gAgAAKEdA=
Date: Tue, 21 Jul 2026 10:46:30 +0000
Message-ID:
 <AS8PR04MB8150FEBCB4C4C5D96B81592AF2C22@AS8PR04MB8150.eurprd04.prod.outlook.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
 <20260721095959.1855436-2-robby.cai@oss.nxp.com>
 <20260721100741.F220C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260721100741.F220C1F00A3A@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8150:EE_|AM8PR04MB7219:EE_
x-ms-office365-filtering-correlation-id: 53753c37-287d-4abb-e66d-08dee715533e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 hI8BOWYfMUbyFMpVU782bUbLxqCC0AfOpfL9CPQmZR2pyQ+i5ub4CyBzjIfRSirYBXkk3b9OPOX9jKvxgUeUFlP4QPV3fAUkCE+DQ++6jAk521ZOUQ6nN+sYoJsR0D03ME2DNqEptAgwPHsK+XG1lwF3lfs3ikhRGaY0oxiLDfgNOdrUzFN0zDfyQthkiadIR2hPQ/GcO28KotHGU7I+fGdI9jKF76JD89NBT3G6WUCiuvolvhuaplUeGXLrNPAGOmtlScPYVUOy3smJ7JtNDQgdfKt39x2os3PqpHybVnpJf6mSWPtRRlrFSh154C5m+LByVhdntm2YIM27M/B6D0gmUF6Vr3A5y/wmlwLAlq6hrLB1FmmmcFqHmlb1Qz9jHMCaMtN1SnIqaOMZy/nqleeZ6o6eO+OXq/HJxYGZGNs0DsDE0aI8MWJcsAakZW+Fya2K8t5DeuUasi/4mdwKojdnfB1U2R2lTrRxlPxgyGeKw5wCbRBRESTeuJhtgNpuviCfg48qFN8ftSzvTOF2k+XBziDIzbTNBhna7VpIu8XuQ2RrovJR1kxlHAyhvfwfrabeK9xIus1lq0Skk2hmxAZ4JhXRd4qXdr1BE/s8tLxFSfeEyjPZVSk6UizRHKkDOlMOq4mZ6s7qoHGa+z4hAwdHwhmOfJZkj5GgbxI7NMA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8150.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2owRDFFTkMzK1dQaWRLYW55L2o1b1R3QzlOa2tXeUpXRkRIKzZCaUx2QkI0?=
 =?utf-8?B?NzAwT1lFU1hMbmxGYUgvTlp3Z2dQalN1RjRlVCt3VTdzM3RNSmtwaWF5dUp5?=
 =?utf-8?B?RWwwMTVwNVE4Sk1FMVZoblNqV2xXbU9tRzBiTFB3c29hK2pEQXJlSzRXZllJ?=
 =?utf-8?B?a1pSVlBJQ3dwaldaZzRZUnR2bE5hQlVBd0FFbGhKejFZNWtXejFVUmhBV1py?=
 =?utf-8?B?bWY2SE5mTk9USmpwSllUTWIrbllYZmU0clhCVFRtcFJqY2RXSm9BQWlTd1Qz?=
 =?utf-8?B?TlhKYUVHUmNNUjJkSjRPRmkrZFBqRFA1M0tyTWdCZEVCMFBTMWhwR3A4bjJm?=
 =?utf-8?B?T3BRSlZ3R3g4TmkvTEZIL3F5dEpsVEdqVThoVmtqQ01IYTViTURGa0pXOHM1?=
 =?utf-8?B?dHFIVWRhZmx1K29OcXpZU0hjRytMZ0NaTVBqbWY4UVdYL0k3NlJTdlNiemht?=
 =?utf-8?B?U1ZiQzJxeHo5ajl1bkJDWnJldUpBbTB1RFRqckNXR0VvNFlCeXUxdktkMEdt?=
 =?utf-8?B?MU1RYmJVN0Mxb3gxelkySHRpTkxRL2h6aVRNZEliN2NDbGlkamdEaHBRbmdw?=
 =?utf-8?B?akdPNWd0aW95Ris5YndqanFWSjFkcWF1ZEx0NFNxZ21aWVlHVTg3d3V2YkNX?=
 =?utf-8?B?Tys3blMvYjJsOTRpZm00SVgwNlIrZE9JMVhvcHlhby8vUVMzaGVPWG9Dd2tj?=
 =?utf-8?B?aVprYmNFcVoyUnhGY0F1OXB0NldOazJQQUQwdEthMGZuU1B4UFNTVlVkcEh0?=
 =?utf-8?B?NWpZdE50TmY5T0VqTkNnOTloQWhXVmtLb0tOdlFMTFRQTGpON0tQRmJvQktB?=
 =?utf-8?B?NXJ1S3lXdk9wSEk0Sm9zREVPMEN2a21JbTdYM05JQ2NjVWsvUURvWFh3MHh3?=
 =?utf-8?B?MjRocUlrcWVRbnJkMm9wcjJWcExNdzRQaE1yZG9PcTNGQjBKR2lJaWhvaEZN?=
 =?utf-8?B?N1U3RTJubUxvdVdVdkZ5Vy9zcDVBOVN5eUhIOFpTeTBwclVvT2dsWUxsUHQy?=
 =?utf-8?B?R3dsRE1jTVAzU1Vnbm9aeGh5UnRURW4ranJRTzg5d3Y3T1diMUhxVktCMHBQ?=
 =?utf-8?B?SmdLT2t6eVZERHlyMFl5Q21RNXE1STBGRzlvUkl4MERBdGdVWEhpaXkzK1Ax?=
 =?utf-8?B?aG12c0hISktEQUlhZkNrMjFrMmhOOSttbDZPRXByUXBtSEwzclIydXVKdWE3?=
 =?utf-8?B?NWNGL2EwTzh0c0I0a0ExSStlY0c4Ynhrc0lTWmZoQVFjTE5TS1h3WVA5MnNO?=
 =?utf-8?B?RHpYMEJsTjkrWldwbHV3VitKUXFYSDBHcVN4MHhaM3U5aXI3b1VRTDhDVjJH?=
 =?utf-8?B?VndYanFHY0xYVndxUTc1Y2xZdHJuekNqUEUydGp3THpmWE9ZRkhnT2xWaTd4?=
 =?utf-8?B?a0JLcnFSb0ozQ0dFT3BRYmo3RGpLZC80Yis0ZFVUbHQ0R1NWNGkvSE00dGQx?=
 =?utf-8?B?QjRJcEY4QXlyODVSNXRlVk1kUEpVcTN5UGluNXNrYnNwOWROaXBXMEdFYzUz?=
 =?utf-8?B?KzNhNi9Nb05GTk9pSzBQcWtpN0xUc3hjZVJ0bWtORTFaemRQQjBQQ1FYMk1B?=
 =?utf-8?B?a0pjRDFYTitDQXRCUEkxeE5TM3g2N0l3aVpaQ1pVUW1mOEY1Y0VVaVlva21q?=
 =?utf-8?B?TmgySnRjZmNtVVVCOVpsVENZQ1JkUStCVG82enlWVHdrSmZzMFpCbVdZQ2tU?=
 =?utf-8?B?NWRZS2o3WE9abVAxck4reEp6MS9kUWNFY2NHL0EvZDRHN1c1M0crQUV2WWJx?=
 =?utf-8?B?aTVvSTZWeGYwYlVDMmZJYlhSdzBIcFJ0R1ZCZUZHR2duRWJWc21IZTlvdVF6?=
 =?utf-8?B?KzJ6QW5PTHJPOGU4alNReHVwRitFbDZ2WmNGc3AwWXdWdUhLRnN2SGMwUnE3?=
 =?utf-8?B?cVZLc1NCMVNtdER5eVNDQkduUm02SzlPRzlpaXh5UGVPcHE5eWoxVmlHWWd5?=
 =?utf-8?B?cjYzOU5YdkZ2N1NXeTRzQTZnMEk1dXJuUlFLWUcvV2Y4RkNjVDhDd21FNjcv?=
 =?utf-8?B?VWlmcFhzK0xFMFBIUHlnQkhGMmc4T2VyT0VIeEtzS2JnZkJqL21Zd202d0li?=
 =?utf-8?B?LzAxbE5sb2pXc2dsVlJHd1hZcVJkWWVHNVh6TVJHT2lHeUVkL3FRRDFDMmF6?=
 =?utf-8?B?UStTMFdWMm1GY1ljNWhDMlBoRFhQaFc3d3N3bFFDM1NIUmRQbklmSTJ4d0tL?=
 =?utf-8?B?TVdXanQ2c1ZFbGdWZGJlNFJPa0dmcTFrdGh1UlkxVkJSTCtsZytqVmF0Sk5Q?=
 =?utf-8?B?ZDBPYkVWQlM4RXdMa205eGJZM0VYZ2pDZndhNUFaVmtGR3BiUmNzb3NYWkpm?=
 =?utf-8?Q?UqJ69w3WAOrPhCzC0K?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8150.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53753c37-287d-4abb-e66d-08dee715533e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 10:46:30.8996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cx/wsiLWz8RISgenwjkX4fvlEMeQH4sVd8WRfnyjb9VsMdjsrXGZSMzYfYS94WHuth1oZgyoQ9CgD7/hCSHa8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogVHVlc2RheSwgSnVseSAyMSwg
MjAyNiA2OjA4IFBNDQo+VG86IFJvYmJ5IENhaSAoT1NTKSA8cm9iYnkuY2FpQG9zcy5ueHAuY29t
Pg0KPkNjOiBGcmFuay5MaUBrZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2DQo+U3ViamVj
dDogUmU6IFtQQVRDSCAxLzJdIHJlZ3VsYXRvcjogZnA5OTMxOiBGaXggVlBPUy9WTkVHIHZvbHRh
Z2Ugc2VsZWN0b3INCj50YWJsZQ0KPg0KPltZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
c2FzaGlrby1ib3RAa2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMNCj5pbXBvcnRhbnQgYXQg
aHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj5UaGFu
ayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBv
dGVudGlhbCBpc3N1ZShzKQ0KPnRvIGNvbnNpZGVyOg0KPg0KPk5ldyBpc3N1ZXM6DQo+LSBbSGln
aF0gVGhlIFZQT1NORUdfdGFibGUgbGFja3MgcGFkZGluZyBmb3Igc2VsZWN0b3JzIDB4MjktMHgz
RiwgY2F1c2luZw0KPnZhbGlkIGhhcmR3YXJlIHN0YXRlcyB0byBiZSByZWplY3RlZCwgYW5kIHNo
cmlua2luZyB0aGUgYXJyYXkgaW50cm9kdWNlcyBhDQo+cmVncmVzc2lvbiBmb3Igc2VsZWN0b3Ig
MHgyOS4NCj4NCj5QcmUtZXhpc3RpbmcgaXNzdWVzOg0KPi0gW0hpZ2hdIFRoZSB2Y29tIHJlZ3Vs
YXRvciBzcGVjaWZpZXMgYW4gb2ZmLWJ5LW9uZSBuX3ZvbHRhZ2VzIGxpbWl0LA0KPmluY29ycmVj
dGx5IHJlamVjdGluZyB0aGUgaGlnaGVzdCB2YWxpZCBzZWxlY3RvciAoMHhGRikuDQo+LS0NCj4N
Cj4tLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggMS8yXSByZWd1bGF0b3I6IGZwOTkzMTogRml4IFZQT1Mv
Vk5FRyB2b2x0YWdlIHNlbGVjdG9yDQo+dGFibGUgLS0tIGNvbW1pdCA2OTcyMGE5ZDQwZGU0M2U0
MTU1MGExMDhlYTdmZTBkMTUzNzMyMjQwDQo+QXV0aG9yOiBSb2JieSBDYWkgPHJvYmJ5LmNhaUBu
eHAuY29tPg0KPg0KPnJlZ3VsYXRvcjogZnA5OTMxOiBGaXggVlBPUy9WTkVHIHZvbHRhZ2Ugc2Vs
ZWN0b3IgdGFibGUNCj4NCj5UaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBWUE9TL1ZORUcgdm9sdGFn
ZSBzZWxlY3RvciB0YWJsZSB0byBtYXRjaCB0aGUNCj5kYXRhc2hlZXQgbWFwcGluZyBieSByZW1v
dmluZyBhIGR1cGxpY2F0ZSA3LjA0ViBlbnRyeSwgZW5zdXJpbmcgdGhlIHNlbGVjdG9yDQo+MHgw
NSBjb3JyZWN0bHkgYWxpZ25zIHdpdGggNy4yNlYuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZWd1bGF0b3IvZnA5OTMxLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9mcDk5MzEuYw0KPj4gaW5k
ZXggMDAyYjQxZjUzZWZmOC4uNWVlZTIxMDM0ZjZiNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
cmVndWxhdG9yL2ZwOTkzMS5jDQo+PiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9mcDk5MzEuYw0K
Pj4gQEAgLTQyLDcgKzQyLDYgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBWUE9TTkVHX3Rh
YmxlW10gPSB7DQo+PiAgICAgICA3MDQwMDAwLA0KPj4gICAgICAgNzA0MDAwMCwNCj4+ICAgICAg
IDcwNDAwMDAsDQo+PiAtICAgICA3MDQwMDAwLA0KPg0KPltTZXZlcml0eTogSGlnaF0NCj5Eb2Vz
IHNocmlua2luZyBWUE9TTkVHX3RhYmxlW10gaW50cm9kdWNlIGEgcmVncmVzc2lvbiBmb3Igc2Vs
ZWN0b3IgMHgyOT8NCj4NCj5CeSByZW1vdmluZyB0aGlzIGVudHJ5LCB0aGUgYXJyYXkgc2l6ZSBk
ZWNyZWFzZXMgZnJvbSA0MiB0byA0MS4gSG93ZXZlciwgdGhlDQo+ZGF0YXNoZWV0IGFuZCBjb21t
aXQgbWVzc2FnZSBpbmRpY2F0ZSB0aGF0IHNlbGVjdG9ycyAweDI4IHRocm91Z2ggMHgzRiBhcmUN
Cj5hbGwgdmFsaWQgYW5kIG1hcCB0byAxNS4wNlYuDQo+DQo+QmVjYXVzZSB0aGUgdnBvc25lZyBy
ZWd1bGF0b3IgY29uZmlndXJlcyBuX3ZvbHRhZ2VzIGJhc2VkIG9uIHRoZSBhcnJheSBzaXplOg0K
Pg0KPmRyaXZlcnMvcmVndWxhdG9yL2ZwOTkzMS5jOnJlZ3VsYXRvcnNbXSB7DQo+ICAgICAgICAu
Li4NCj4gICAgICAgIC5uYW1lID0gInZwb3NuZWciLA0KPiAgICAgICAgLi4uDQo+ICAgICAgICAu
bl92b2x0YWdlcyA9IEFSUkFZX1NJWkUoVlBPU05FR190YWJsZSksDQo+ICAgICAgICAudnNlbF9y
ZWcgPSBGUDk5MzFfUkVHX1ZQT1NORUdfU0VUVElORywNCj4gICAgICAgIC52c2VsX21hc2sgPSAw
eDNGLA0KPiAgICAgICAgLi4uDQo+fQ0KPg0KPnRoZSBjb3JlIHdpbGwgbm93IHJlamVjdCBzZWxl
Y3RvciAweDI5IHdoaWNoIHdhcyBwcmV2aW91c2x5IGFjY2VwdGVkLg0KPkZ1cnRoZXJtb3JlLCBz
aW5jZSB2c2VsX21hc2sgaXMgMHgzRiwgaWYgdGhlIGhhcmR3YXJlIGJvb3RzIHdpdGggYSBzZWxl
Y3Rvcg0KPmJldHdlZW4gMHgyOSBhbmQgMHgzRiwgaXQgd2lsbCBiZSByZWplY3RlZCBiZWNhdXNl
IGl0IGlzID49IG5fdm9sdGFnZXMsIGNhdXNpbmcNCj5hIGZhaWx1cmUgZHVyaW5nIHByb2JlLg0K
Pg0KPlNob3VsZCB0aGUgYXJyYXkgYmUgZXhwbGljaXRseSBwYWRkZWQgdXAgdG8gaW5kZXggNjMg
dG8gbWF0Y2ggdGhlIHZzZWxfbWFzaz8NCg0KR29vZCBwb2ludC4gVGhlIGRhdGFzaGVldCBkZWZp
bmVzIHNlbGVjdG9ycyAweDI5LTB4M2YgYXMgdmFsaWQgdmFsdWVzDQptYXBwaW5nIHRvIDE1LjA2
ViAoLTE1LjA2ViksIHNvIHRoZSB0YWJsZSBzaG91bGQgY292ZXIgdGhlIGZ1bGwgc2VsZWN0b3IN
CnJhbmdlIGFsbG93ZWQgYnkgdGhlIDYtYml0IGZpZWxkLiBJJ2xsIHBhZCB0aGUgdGFibGUgYWNj
b3JkaW5nbHkgaW4gdjIuDQoNCj4NCj4+ICAgICAgIDcyNjAwMDAsDQo+PiAgICAgICA3NDkwMDAw
LA0KPj4gICAgICAgNzcxMDAwMCwNCj4NCj5bIC4uLiBdDQo+DQo+TG9va2luZyBmdXJ0aGVyIGRv
d24gaW4gdGhlIGZpbGUgYXQgdGhlIHZjb20gcmVndWxhdG9yIGNvbmZpZ3VyYXRpb246DQo+DQo+
ZHJpdmVycy9yZWd1bGF0b3IvZnA5OTMxLmM6cmVndWxhdG9yc1tdIHsNCj4gICAgICAgIC4uLg0K
PiAgICAgICAgew0KPiAgICAgICAgICAgICAgICAubmFtZSA9ICJ2Y29tIiwNCj4gICAgICAgICAg
ICAgICAgLi4uDQo+ICAgICAgICAgICAgICAgIC5uX3ZvbHRhZ2VzID0gMjU1LA0KPiAgICAgICAg
ICAgICAgICAubWluX3VWID0gMCwNCj4gICAgICAgICAgICAgICAgLnVWX3N0ZXAgPSA1MDAwMDAw
IC8gMjU1LA0KPiAgICAgICAgICAgICAgICAudnNlbF9yZWcgPSBGUDk5MzFfUkVHX1ZDT01fU0VU
VElORywNCj4gICAgICAgICAgICAgICAgLnZzZWxfbWFzayA9IDB4RkYsDQo+ICAgICAgICB9LA0K
PiAgICAgICAgLi4uDQo+fQ0KPg0KPltTZXZlcml0eTogSGlnaF0NCj5UaGlzIGlzIGEgcHJlLWV4
aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGUgdmNvbSByZWd1bGF0b3IgaGF2ZSBhbiBvZmYtYnkt
b25lDQo+ZXJyb3IgaW4gaXRzIG5fdm9sdGFnZXMgbGltaXQ/DQo+DQo+U2luY2UgdnNlbF9tYXNr
IGlzIDB4RkYsIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyAyNTYgc3RhdGVzICgwIHRvIDI1NSkuDQo+
SG93ZXZlciwgbl92b2x0YWdlcyBpcyBzZXQgdG8gMjU1LiBJZiB0aGUgY29yZSByZWFkcyBhIGhh
cmR3YXJlIGluaXRpYWxpemF0aW9uDQo+c3RhdGUgb2YgMHhGRiwgb3IgYSBjb25zdW1lciByZXF1
ZXN0cyB0aGUgbWF4aW11bSB2b2x0YWdlLCBpdCB3aWxsIGJlDQo+aW5jb3JyZWN0bHkgcmVqZWN0
ZWQgYmVjYXVzZSB0aGUgbWF4aW11bSBzZWxlY3RvciBpcyBlcXVhbCB0byBuX3ZvbHRhZ2VzDQo+
aW5zdGVhZCBvZiBzdHJpY3RseSBsZXNzIHRoYW4gaXQuDQo+DQo+U2hvdWxkIG5fdm9sdGFnZXMg
YmUgMjU2Pw0KPg0KPi0tDQo+U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwNzIxMDk1OTU5LjE4NTU0MzYtDQo+MS1yb2JieS5jYWlAb3NzLm54
cC5jb20/cGFydD0xDQo=
