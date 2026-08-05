Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013066.outbound.protection.outlook.com [52.101.83.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992146EC69;
	Wed,  5 Aug 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935405; cv=fail; b=QdjVo3r1OvItfpGRQqXokY+QCCfYQOJUAzjRMSWxXSTOJ8CtFXZoqwZXpoNGANYJxSYOgSVsBNe8Hp2KHK243XJz3MMI1Fbq7kBhOrSVlo3R9gNVBRM+Pg1Z9nwG9puhiO7778CL6LrfVigOJPZdD9kbW6NsR5Npso2qGqm3WgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935405; c=relaxed/simple;
	bh=2AMnOJUlsAmxOah51lv4p4fD4bOLkLHg5rDccMGGtX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XC1gzx5bNwgtqN2D0AQ7IK3IAQNb3e4EWM6PvoDXID4O1HI7rsIGIKg6CO5I0LoSaDOPPrWeYlZ4KviswEdG60nx+GmuOm6zhCJu4plI4tZaD7rViGPKiGAYuhnoLo4jg4SofaCDY9jrAQ8zbjyqmulV4HrVSOnGnQNiV1+iTHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uUUgWA6I; arc=fail smtp.client-ip=52.101.83.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uUUgWA6I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXBfokZg2XSPPyv2h983M/poVN0LfbO3q3YuT42O6VnhWhyxG63kHD1syIO+zswPVXs1ND4/CPLSJ8BVJEtOeFiPlRKRnafxYsIov1YFCbp4plg0A1AlO5R6xojbAd2EVyX0y7ymO4ssi3thmaTkk6d5GDRqD8e7jKqtGFS3A582oYac6qKMCaCeURJdbWcCT9D0o1Ch6XZk093vseJ7Zvx6jkaySPw9huFHBdl1P3xONjbrSZm6dGZQI8V2Xlbf+oSJc++S5/GapUkTHb+KfMOJQGMBLF54pvmxh6Gt/LWQbxo5Vp/Q1ZQv0KbPQsY1p7a8ZigqRShtm/fWKHpS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AMnOJUlsAmxOah51lv4p4fD4bOLkLHg5rDccMGGtX8=;
 b=tOwjz45Op5G6eDxj3r2GHCT7V+qMYolCuVc0oLCHAr9B7TMgyhLn4UG7Yo6z8sZdtoItCOHOh7x0B5hTcuTe293SeWQspt6vjDbZBy008Gz6qAiG6L7sCUCJlRHGSFg1FBhNuIMA04Bi8QMh15wdsII8MpZXB3pcUFrURz3vRlmaaBPqeYrq8vmKtE3SAjgqLcKSyjfvlvdFwRK2e7jIG+CTAseFWT+G6McoQZWc4/ycANKTFCym9kvioKEqFj3FynE4ug+9VvOyPg7Obqc7laQXhHLmnl1Ag4jAPWCnGB2Zqdagm5bIJWcs4UEbHJgHFwIBsQuUtBm8fw8lQABIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AMnOJUlsAmxOah51lv4p4fD4bOLkLHg5rDccMGGtX8=;
 b=uUUgWA6IqzfkCD4T4quS3i9+inolanqq0dw87/ysKDKgRqjorLjsnHpgimRF8gbQ+kitzYcMrdwb+JKb9JjC2C9sHoIhKXAhCVwMSepqRdbo6NkooF5VJMJu8yY8Chat3Px7ECdjzfF4zJ+USlM8KVSpzkGbBX3OSn4ymCPye9S3U8t/e2xkcV0AJ5L1QlL6gxCPfRaGMduEn4F2mZ7WTDcj0S7ATqTWozn5J0sUdUNcrLQg8mD0uyoLyIEt4y06YzSDrQxSSkgwulHZoJmu4SfJhGoSxcTmuw4CJjN1ORCH69aeUmTXbLQH6UIx7LVqVUzRLArru4TJqm9DFvnEdA==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI1PR04MB9835.eurprd04.prod.outlook.com (2603:10a6:800:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 13:10:00 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 13:09:58 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v33 4/7] firmware: imx: device context dedicated to priv
Thread-Topic: [PATCH v33 4/7] firmware: imx: device context dedicated to priv
Thread-Index: AQHdJK+jkjTKVTSbM0il73ReWG0Ot7aPG/WAgABRq4A=
Date: Wed, 5 Aug 2026 13:09:58 +0000
Message-ID:
 <GV2PR04MB122712931FDB5134BED3DB4FE95D32@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-4-212e32ff0295@nxp.com>
 <20260805081608.F38D71F000E9@smtp.kernel.org>
In-Reply-To: <20260805081608.F38D71F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|VI1PR04MB9835:EE_
x-ms-office365-filtering-correlation-id: a554ae9e-14ca-4158-7a83-08def2f2d9f1
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|10070799003|19092799006|1800799024|366016|376014|18002099003|22082099003|20046099003|38070700021|56012099006|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 cbDKj/zQ3b1a0j6bLe3qmzmus6jbfP7hZK/Cd70WJG+lgUQiDoT/9lBZ5yziiKw3yvj7LB+jpN+67tCcP9+UIdmResP8LyOjR7KGcAuE9G5rkk/MdG09XeV2PpOrqbWACFmRvGAwyvlBcnx/iDtNIOJpuAO3Zo8G0wWZY6CYKdH/wf3lEAMxzVWtxrm5GBPSAsWYuatRdkSEF97PoCII2VuRKfMQbBEG0IQFzv1OCg7QuANceLIoD6H7jPumK6yNMrAXJeDzAfaVI+P6YIuhP43/SoPta6+L7HlmWll1IRf7h3gLk6atxK4BrkCTWxEAZcMR4mOumnoAM07Syvgmii0BBA7+85EN4FBpyu3A5SB3TiApuRd2bIA7qYfc0+UowaMAU5J85D13qf7BeFfMV7h4WNyyTTPpjqmfdQsl6TVHp8XlR1qujtbBOtz9OfReMR7VDSf7SGuvaGuXBekplFGkpG8jIGowWu1VQ1qhh3kAsueIVnJt3M8T5i47pkUGmqYTnZGl/h4ZC4kc4KvosxLprGGgZB5oInIrEoqfJuvP0eUd67MB2CqGBOq/JDtCqUHXZGl4QMyJL9jCNqKlQFxfs521squN2x34AyfVkMNAPCNQ5Ejpvoc2RuSSq9Pe3wuSBa/ak7ntog/sJ6aoTnvCP5MLtpFshTmEG8Xe1hsz8su24ZdrV1bQl3RLvPjSuidjJOFDIfDO0L1DRf4qbg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(19092799006)(1800799024)(366016)(376014)(18002099003)(22082099003)(20046099003)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1hZbUoxbUg4Yjc3UlJCcjVTMjd5eVJ5MHRsRStKbVAzTS9kQlNmbFRMemtF?=
 =?utf-8?B?WVRjSG5BcmJaYUFFRlBaUDNxT3MySGFLZ0xjRkRwQVp2UWMzdUJwVVp4U29X?=
 =?utf-8?B?WTNUeTBrcGdjcDQ1Q0wrQmM1SHk3TWlhdW5nV1R2dmhJbi9uVlh6RkRsRUtO?=
 =?utf-8?B?YVE1SkNMNWFDZkpHK2trVjJPeGZwV296eXZaRHRrMUFaWTRuMWdSRmppYkEx?=
 =?utf-8?B?djMydzU0SGNtUFpvaXdFK283amdRZk9ZbENxOWorVXFJNXY1NnZLUmx0N2w0?=
 =?utf-8?B?ZUdrYVR6QjhyaFVVdngvQmtjUXZpS01FWWVDY1JOYkpGamhHY0Q2OUN2UERr?=
 =?utf-8?B?MFRNWW9UVS9rb1JjUy9ZS0ZvdFIvWkQ5WkgzbEFTazVCU21rYW1zSmVIaWZD?=
 =?utf-8?B?dGNlNmxHQ3VtWU94alUrYUhORzNCRWNWNUpuU0dNUFJkL3JVUUhWNEhYZURU?=
 =?utf-8?B?UGxKeWprMUI5RWFZVnMzK2JQSEhwQStjRmtGcHRsYjlBQlIwa0VIM25aR0py?=
 =?utf-8?B?S2M1UnFIdkZOU0xPMDJWUFF1UWxtcHdrTGwxVzVpUmN1d0RWQzE4SWhNanh6?=
 =?utf-8?B?NUFKVFkycS94Qjgzd0pJajV1Ty8xZXNCcUVLQk1sd3ZIK1c5MzhRSXRUbldN?=
 =?utf-8?B?NElHeXU3aVZvYkxOdnV0SVd1amp0MlF2cnAyWkxHMmZBcExCemY1N3JhdHl2?=
 =?utf-8?B?K081VHFnWTMwbzJJT1FTLzh5eE5XQldXcnN2T3h0Ri9XS3hqOENjamlSS1pH?=
 =?utf-8?B?eWsxOUNYbFhWVTVaTHQ3eUxza2hEaHZOTGNtYUFoN1U5N09pVkxSemh6L0ho?=
 =?utf-8?B?VlQrQ1lzc215V1JhOGJQUXVRbklCZGlQQnhDdGYzK3RqZ3lVNVNSMkRPUXp3?=
 =?utf-8?B?NU9Gb1FTQ1dBbTNQRm51bThGS0J5clRxK3ZEeUE2L1Z6bzZQMDdpdWY3b0Nu?=
 =?utf-8?B?YjZvdGoxNVNKNm02SHkzQlYwOWJJeVM4L3NmUk1hTFBOU1NCTHZvMXpiY3FS?=
 =?utf-8?B?UTh4QkZpelNtWkZmcDFlVjYxOWRRVE9FcW9QODY3bWYvcHhWQzNBOS9acGN5?=
 =?utf-8?B?dFN1V3RXYnlHempNUXJGUmRtTm5jWnRmL2x1VjBQeU5NbEVkZDRUZndYaVFr?=
 =?utf-8?B?RkpTM0tOTmR4U0lQaWlQRWx4c2xoNmZUR1p5TGYyTWltTTVkeXRLRmVmSUh5?=
 =?utf-8?B?WVVlS2JKcm5hK3B6ZlJMb2l0ZVZreldNSUk2WFZwSUZmTDRvdWhndENpOVhM?=
 =?utf-8?B?Umpvenl3bm9LSEpiek9VTUQ3K25haVNScFFFQXY2cFFVM1c5Mm05eWgybTIv?=
 =?utf-8?B?MUlpNzBQaEc4N0d4Ui9xVkRvUjdKMVAydlVVa0tDS0Q0empvM3JRYUlRaHZM?=
 =?utf-8?B?NStPSFA2R2ZoVzhsaWs2cDdoSUFFVG1iSm9oUDF4NkFLeENpaDJRMXY2MW1L?=
 =?utf-8?B?aTFMUnZ0T3hvWHNrMnZNcEorTGduQ3BGdWdEdzBwTlBDR0JRSjFpa20ydUJX?=
 =?utf-8?B?OHBxNjZrQ2JlbGhWeWF3Z1NIV3RVUkZCeCtFbFZHNmdMMVdUVkVQSUJpRG9B?=
 =?utf-8?B?alIvS2hEenF4K0pQblZndzRQaGNwTENGMmpZaHQ4ODlmNlRiTlBWSG9rZ05X?=
 =?utf-8?B?YzM4UHlYTTVtMjFJWUJybENuaHFHeUpGQzhYN0NJZm56WE40QThWNVBHV2xz?=
 =?utf-8?B?NmtDVDJ1aHNYZDh5SEdrdTRTL2h3OFcwQS9HNEtDUFJnWmNibjg5TnNWSUlu?=
 =?utf-8?B?bEJqT1JuUFpwUHdQYVdQTEVZbmQzdEpzU2NjQktOdVUzcjg5a09YcHRERXRo?=
 =?utf-8?B?MERTdFhnenVkQTNLL1QyUDVIWUhTdnJXR29jSE9mTUl2WVpLbVFaRjNOWmdT?=
 =?utf-8?B?SURGaFVERjdRK0hyZGM2bEU1RDhwVkh6SVd4YlhhazVMc2VKVUJxaXlJMTZP?=
 =?utf-8?B?SkJObTV0OWY0Q3ZaZnU0Yk9HdE85S0xJZzdsMmo2aUhSMGxMZlY5dGhsaC82?=
 =?utf-8?B?TnJIdnRJMExsVzZvaW9BUFhlM3RBdG1zUnp3UWpZRGpaR253SzJtbjVtd3NV?=
 =?utf-8?B?elZ2TEEvUFdPMVdBQUVKblpwdVB2MFlHbjVlYm53MHQwWjVuR25Zd09oTytZ?=
 =?utf-8?B?Sy9vNEphbkFXQ0lBemxhMDM3eDlGeFVZUmpnSmZCQVkzMzRuNW52SmN3ZDJ0?=
 =?utf-8?B?c3pzZXBqOEpNUGZ1eEZqZFZhclUyMWd0UkJZcjdMbmF6NUpLZXJsQitxR2xv?=
 =?utf-8?B?MVlNYVVNRlIybW1lUUhQa2JZVitFM2lhRFFXRHFNazJFeHhIVmRKMmJ2SnQ1?=
 =?utf-8?B?SEF4OTZOdTlNRUhrN3p0RHdGaWg1T1Jxa1lKVGM3T2RnMDFUWk5uSVVPVVpr?=
 =?utf-8?Q?c4bMMc4JoxARNkmW2K1RTsAq1IXKrxR27OkFSxGtNpoTy?=
x-ms-exchange-antispam-messagedata-1: YqAbs7iwzirikw==
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a554ae9e-14ca-4158-7a83-08def2f2d9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 13:09:58.4928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTKtGiER/TpoYJW9nWPHuYg09/i2G1/rDjtmKaP6q8ifzhP2gKmcdEe87/HBxQCm0RAacHAzkIZdb2qWsEXfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9835

DQo+ID4gYi9kcml2ZXJzL2Zpcm13YXJlL2lteC9lbGVfYmFzZV9tc2cuYw0KPiA+IGluZGV4IDcy
NGY2ZTkxM2NlNzkuLmI3MGUzZWY4OGExNjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9maXJt
d2FyZS9pbXgvZWxlX2Jhc2VfbXNnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL2lteC9l
bGVfYmFzZV9tc2cuYw0KPiA+IEBAIC03MSw4ICs3MSw5IEBAIGludCBlbGVfZ2V0X2luZm8oc3Ry
dWN0IHNlX2lmX3ByaXYgKnByaXYsIHN0cnVjdA0KPiBlbGVfZGV2X2luZm8gKnNfaW5mbykNCj4g
PiAgCXR4X21zZy0+ZGF0YVswXSA9IHVwcGVyXzMyX2JpdHMoZ2V0X2luZm9fYWRkcik7DQo+ID4g
IAl0eF9tc2ctPmRhdGFbMV0gPSBsb3dlcl8zMl9iaXRzKGdldF9pbmZvX2FkZHIpOw0KPiA+ICAJ
dHhfbXNnLT5kYXRhWzJdID0gc2l6ZW9mKCpzX2luZm8pOw0KPiA+IC0JcmV0ID0gZWxlX21zZ19z
ZW5kX3Jjdihwcml2LCB0eF9tc2csIEVMRV9HRVRfSU5GT19SRVFfTVNHX1NaLA0KPiByeF9tc2cs
DQo+ID4gLQkJCSAgICAgICBFTEVfR0VUX0lORk9fUlNQX01TR19TWik7DQo+ID4gKw0KPiA+ICsJ
cmV0ID0gZWxlX21zZ19zZW5kX3Jjdihwcml2LT5wcml2X2Rldl9jdHgsIHR4X21zZywNCj4gRUxF
X0dFVF9JTkZPX1JFUV9NU0dfU1osDQo+ID4gKwkJCSAgICAgICByeF9tc2csIEVMRV9HRVRfSU5G
T19SU1BfTVNHX1NaKTsNCj4gPiAgCWlmIChyZXQgPCAwKSB7DQo+ID4gIAkJZWxlX2dldF9pbmZv
X2NsZWFudXAocHJpdiwgZ2V0X2luZm9fZGF0YSwgZ2V0X2luZm9fYWRkciwNCj4gZ2V0X2luZm9f
bGVuKTsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gW1NldmVyaXR5OiBDcml0aWNhbF0NCj4g
RG9lcyB0aGlzIGNvZGUgcmlzayBhIERNQSB1c2UtYWZ0ZXItZnJlZSBpZiB0aGUgZmlybXdhcmUg
Y29tbWFuZCB0aW1lcyBvdXQ/DQo+IA0KPiBJZiBlbGVfbXNnX3NlbmRfcmN2KCkgdGltZXMgb3V0
IGFuZCByZXR1cm5zIC1FVElNRURPVVQsIHRoZSBlcnJvciBwYXRoIGNhbGxzDQo+IGVsZV9nZXRf
aW5mb19jbGVhbnVwKCksIHdoaWNoIGZyZWVzIHRoZSBETUEgYnVmZmVyIGJhY2sgdG8gdGhlIHN5
c3RlbS4NCj4gDQo+IFNpbmNlIHRoZSBmaXJtd2FyZSBjb21tYW5kIHdhcyBub3QgYWJvcnRlZCwg
aWYgdGhlIGZpcm13YXJlIGlzIGRlbGF5ZWQgYW5kDQo+IHJlc3BvbmRzIGxhdGVyLCBpdCBtYXkg
Y29tcGxldGUgdGhlIG9wZXJhdGlvbiBhbmQgcGVyZm9ybSBhIERNQSB3cml0ZSBvZg0KPiB0aGUg
ZGV2aWNlIGluZm8gZGlyZWN0bHkgaW50byB0aGUgbm93LWZyZWVkIG1lbW9yeS4gVGhpcyBjb3Vs
ZCBjYXVzZSBzaWxlbnQNCj4gbWVtb3J5IGNvcnJ1cHRpb24gb2Ygd2hpY2hldmVyIHN1YnN5c3Rl
bSByZWFsbG9jYXRlZCB0aGUgcGh5c2ljYWwgcGFnZS4NCj4gDQpEdXBsaWNhdGUgY29tbWVudCBh
cyB0aGF0IG9mIDMvNy4NCkFscmVhZHkgdGFrZW4gY2FyZSBpbiA1LzcuIA0KDQpBdCAzLzcgdGhl
IGNsZWFudXAgZnJlZXMgdW5jb25kaXRpb25hbGx5IChnZW5fcG9vbF9mcmVlL2RtYV9mcmVlX2Nv
aGVyZW50KSBhbmQgdGhlIHRpbWVvdXQgbGVnIG9ubHkgZG9lcyBhIGJhcmUgYXRvbWljX3NldChc
JnByaXYtPmZ3X2J1c3ksIDEpLCB3aGljaCBjYW5ub3QgZmVuY2UgYW4gaW4tZmxpZ2h0IGVuY2xh
dmUgRE1BLiBUaGUgc3ltYm9scyB0aGF0IGZpeCBpdCAoc2VfaXNfZndfYnVzeV9jdHgvc2VfbWFy
a19md19idXN5LCBwcml2X2Rldl9jdHgpIGRvIG5vdCBleGlzdCBhdCAzLzcuIEl0IGlzIHJlc29s
dmVkIGJ5IFBBVENIIHYzMyA1LzcgKCJmaXJtd2FyZTogaW14OiBhZGRzIG1pc2NkZXYiKSwgd2hp
Y2ggYWRkcyBwZXItY29udGV4dCBmd19idXN5IG93bmVyc2hpcCBhbmQgcmV3cml0ZXMgZWxlX2dl
dF9pbmZvX2NsZWFudXAoKSB0byBxdWFyYW50aW5lIChyZXR1cm4gd2l0aG91dCBmcmVlaW5nKSB0
aGUgYnVmZmVyIHdoaWxlIHRoZSBvd25pbmcgY29udGV4dCBpcyBzdGlsbCBidXN5Lg0K
