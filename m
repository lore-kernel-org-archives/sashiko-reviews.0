Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664A35FF58;
	Fri, 14 Aug 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690150; cv=fail; b=GR9nd2uj3taLPy1fa/cQxRMaQhc+76skBZ/g7N37E3WwsDYDLEotPK+7dxSPz+tckbcQ8w6ek9bKtx8wR8kmJkwkkqhfZKyt2wWk4uuwQu31Uryoew01D3ikgZjElUG9o566QGGatmAMln8Xr9jwMN6Y61O25RGz/8QVExBor+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690150; c=relaxed/simple;
	bh=Ox7RlZJK2QzBzbiE2zPvp9+yRcV6gr+ar1FUw7pt8vk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RVuWCUbrwZRm8CPiAGdUaXxZ7xSumTH1AbBegwGpSdMXCWA2f8oiO0LZAaN2HTPg4nQYpw2zSvoLRGLMCaVH5I/RLhMg3aft0s/aHhGqmLtROybve3E1nccAZ+ROmtgqfL3JUfn58eGr91hbVS1Y0wKhFjOfF90YtZ8TMklSo1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MqP33DRa; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MqP33DRa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM44x9hlgDDdV/xn9qaUS8ObGozZaa8wYNoA1oOk2FIxH1W/bdE7AyAheiSrmgxGCRMVZ4bdtoILphwt+PfwuwR7N8Z+B99RjmeUA3cq7w7p/jQTCLbNetWmwpXUweoxp3Mz9mbxI3zt5bWcFt6+v19EECEWDPCl3WkZE8x7wo2GXyRGECFSuCJvIPIlMKi+AIJLWT9GbjfY3Rv64oiW/1RGOGYIO6MChHZhT5518GJLDjEPMTjwHc1zkVXGMoSOa2043MRbsD+I4wTe7xFF+b8u9RPQuvWj6bj9eq7RPiFbl7NHuhinxkRi804qDs//9mKKftYtE1lh/G0h74n72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox7RlZJK2QzBzbiE2zPvp9+yRcV6gr+ar1FUw7pt8vk=;
 b=dpuc67AnFOupXEV3R4zt3ovJaG7blmNISSACzSjILCxqSFumL+ma0wI/JIT4DxunhnSbSWZOw8r5daMjDfDk8kId4mIzr62ZKLzhawK0yHVBxk2hL3k520msswQqqOCtV9LhsIsfVIZ1uCpwm9zGHn/KFy8U2v5fkoEsy+lCw64SoR8Zh7x79L3gSeqJFpNJTcqWYz7P5ZmQ1r+wE9xm/GTHuDj8peqoYGi5WSoE/7EFlUXgpKSku7UVbyte1bBFgNJEaGmhLGY/oWtqI+K+iH82+a3g5Ktg3b8ma0t0LjXpFglIC8RIoFTIUMg0rZ1WpAmkrTqicHVSOuWsHQyqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox7RlZJK2QzBzbiE2zPvp9+yRcV6gr+ar1FUw7pt8vk=;
 b=MqP33DRaaGweUjgtMOW+qrkZf81kWkSG7GS0JZCU+hAIlj6WQf/pBH8hOuFG0VkQMkaCAJr4sZwO3cPIn1aLpaClbZvKpzDxUeKRuR2B4qtl6wruUWhbqB5ISb0MdN2fWPkivGFF64EkWY5vvrGTaHbiIo3v0aLrtpYR46ICP0tnj08Jvb8jSTmPeDZrAlwGdHP7YtgcE9n713lvKvGtBuPCGF+60pwaYQIzi48QCJBi48Xcw1hvefqsNbxcxFtzleYerLNuWs/VbwX+y3qEOb3O89t5XQB4ilHIZE0BL6xcrVx5JOrZewK2qmm5/DG8WzlpY4DULFBKohN48AXCJw==
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AMBPR04MB12287.eurprd04.prod.outlook.com (2603:10a6:20b:730::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 06:49:06 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%4]) with mapi id 15.21.0315.012; Fri, 14 Aug 2026
 06:49:06 +0000
From: Joseph Guo <qijian.guo@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase
 properties
Thread-Topic: [EXT] Re: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase
 properties
Thread-Index: AQHdK7a+HRwhtgOPwka2uSNYUkXws7adGXyAgAAATyA=
Date: Fri, 14 Aug 2026 06:49:05 +0000
Message-ID:
 <MRWPR04MB1211777A1972FF0553AB1803394DA2@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
 <20260814064514.ABD781F000E9@smtp.kernel.org>
In-Reply-To: <20260814064514.ABD781F000E9@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-14T06:46:19.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12117:EE_|AMBPR04MB12287:EE_
x-ms-office365-filtering-correlation-id: 34f174d3-a201-4321-5a7d-08def9d02271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|4133799003;
x-microsoft-antispam-message-info:
 XJfIXuszrA2jBbaYRltT4FxlMtxoYj4D5KW7Pyl6W0lswNVJTuurcS7n5l4YQ8P+TAricDk91IC+Yk1slwfmipqRmz0jWxx7WxHawJc0UJLt77nyHiA9799XhBBPY5hCY0mGLwuja7gjugiULhr70E+KchmO+dPsK/RaA/NLibFPeqBEnd0zpWYNyh1WIit5I/d7s42gATjLRNzD7+eTQq5GczrjIyhxygRt7l1kumKKE0LYff3+34oiJ6SAluuVt1vXcbTvi4ydtoIV+D/QeV80w6XDbMef9U9fcRtmgLr82QFgJqyRst7teizS+LXFwaIH5jdYcMA4Kj3oUpf4VfQgCnboALuGiAtqS+YWEBZK1C+SwGpOgiAWHDzSnxZfDtU+4t2gdR+uaTCUutWiCOwEwsB18dqhDVwg8Un9pQznLkID4g6u7qMAyjbEGVgLpxmdqD0kPlg+ZQWiEZOvmL7p8k2lC7gdw3UG6o8a2YtJTr12SPMCBY1VgV04aHTe2b9BgeQODfg7hZty6/RPNiigCK3ecBRWwSdfIZ6YJBsb8q7MpdQJ0TsM5pZiUpnKln4AR496Xv3JRin1I22LQmwP4HfULSux/7kSmtwfASnG+OzFSe5q603ch7259qa29HkbAi3DVgBWIpSW2Os2l13QVZyjhXD2gDCYOnn2uGY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zm9kaG9yK25uWFpQaEdLWmU4YVNzN1o4aERLNmxLaDRlTFIyQURBRUNTd084?=
 =?utf-8?B?QzFNZU9ub2FxYXJZb09GQ0N6Ti9IRlcrREhVbnNBWjFYNnlydWpkaTN6R1FP?=
 =?utf-8?B?UThxQjNoUlEzeXNZcGVZTklLS001clp4V2l2czNob3pFbFBNZmpuR0d3OUU0?=
 =?utf-8?B?UEJ5S090QVdSa2Q2U3ZWYVh0WU1ORjY5Q2pGZ3lORndrY2RzODgyNkxNOEVn?=
 =?utf-8?B?dHI3ejIxZ0laSUptWVN0Zkx1bDdqOVNUOUQvNElFV3hjcit4L3d3UXVxQTVz?=
 =?utf-8?B?azZ3YnhIRXAzQWFpNEZZbUVoRThrc1dkeUNKVUFTL3hiZmRYZ1ZjR3RvT2Jm?=
 =?utf-8?B?cVpEMFVQQWdRSCtvbm50eHZSZGpNb0FWcHFRd3dubVdtQjlHM0lTYUJzVjhx?=
 =?utf-8?B?d09wTE1heGtYdnd1WVo2TlNTclkvS3RKSUpjLzZQdFF4MXlqcDVNLzZ1enRD?=
 =?utf-8?B?ZTZ2dC8wSXppVkNxMW9PeWlaTjN4WlEwUDU2ZjFYbUUzZi81cXZkNlE3YzJP?=
 =?utf-8?B?a2JqenZ0QkNPVER0SUtGWkZzd3o4YjJJMDcxVTZTS3pMaDBWVHpFWnJNbHZH?=
 =?utf-8?B?TENIWGlveTQ0NzJicm4vRjhuNlNxa3BwWUd4WVY4WXV4dzZ1TnZhdGcxaHpr?=
 =?utf-8?B?L1FjdG9xRmxRU0FnVFpLYmVaSXBMYmRpb3dCQWx0b1dQS25lS3Y2a0hMcFcz?=
 =?utf-8?B?MGdnZktBYUFOd0xtT05QNUo1aTlndWZKNzl4WnFQNjFNeFZUR2swajFzVjli?=
 =?utf-8?B?ZFkyOW16dW9XbCtYUW0wd3FnUElJU1czS25pSUFHTlRUMlNSbGVDU1VyZUl5?=
 =?utf-8?B?eGhsYmhNZUxaNUxrV092eXNLdmZXNSt3T2kzVldBZFVvRkF5b0FIZ3VrbzUx?=
 =?utf-8?B?cmlsdi9ScGdvQlpFZ2grZ0JhdDVxL281R2JuSUlUSUx4Nm1DVisxeS9WanRB?=
 =?utf-8?B?UXp2UjRqdXZzbDJHWUttNHNHUnNoTTYvdUdXNlRXeWxHVitMd2FYOUdCZWRH?=
 =?utf-8?B?VEdwR3NoM1ZCVmVHNlRObDExbS9OTEdRc2dwdDVoQmljUTRjSytnbUZhYTBP?=
 =?utf-8?B?bkVwaG1oa2xuSjFRR1V5S01LZGFUMDI3UnkzVHNVVlhNSzA0THFTVktHKzB5?=
 =?utf-8?B?SjZwVHJSY1hpaXFqQ1J5ajVNYjZ0MlRoQlRoN1hXM1RPYUtndXhoZjZUT3Fr?=
 =?utf-8?B?b1oxMkkwWVZrd09MeE1rRzM3QUhFTHFlUXc2OVRnRjZKakFLMVFrRWJFYUZz?=
 =?utf-8?B?Vlg2cEdMdlBxRTRYZ205Rnh5Q25jaE56b3ZJeDNlZkJXckJQT1gzT1hMNlA2?=
 =?utf-8?B?RG14eFV6NEhvMjBCYXRDWjlwVk9vRWlwWHRmdFJPWW1PZGxKNS9jdmVrQWtz?=
 =?utf-8?B?Vm9OdEVDVlpkbFZyYytGb2pZVmwvays0dDU0dENiWFpCNlUwTFRLSmRLeGQz?=
 =?utf-8?B?SGxJelB0ZXJsNUFuaDU1eTJXWXcxZEkwNlhSK0M5cGduR0cxNVJWWFBGMXBZ?=
 =?utf-8?B?YW1tZVBnVndTejk1RjVrZmhYU09CYVdNZ0xuRUMwNktPM0pOQjNob09Cbmgr?=
 =?utf-8?B?OGdyaGtlSHJZeUxibnFnVk52UmpaQmQ3ODZ1Mmd3MkNydHV5MWpDcjU5MDJp?=
 =?utf-8?B?L0hDVzhtZDZKVFdnaG9YUVVoZFNoMDlqTFVhY1h1SjUyK0hqaUNWR0RCd1VX?=
 =?utf-8?B?azZVekYxbmhCR1dBaFlKZS9rMjlTQ1N6UkhucTZBTDF1U1hVcWpma3VDL3VJ?=
 =?utf-8?B?NS9DWldrZWVRNlVjb3NVcy9wM2dQNHZ5MzRKMi9yOS8rS2VrbnZlbjJJUGhh?=
 =?utf-8?B?bzI0VEZwWXNOUnVHYjBXQ0FpWHNQa2FkRW1TNTU1RS9vYW9OYVFMMVA4K01L?=
 =?utf-8?B?eUc1M0RjanhGQXlSMWlrenYwSmxJZ2JnRm9mV245eW1vY0tJTkQ3bmFYcSts?=
 =?utf-8?B?QUlBdllFQmFDZ2Q2WDdNaWRVelBXdldqTjZpWFBvRG4rdWpNdWJWZHAwZWt0?=
 =?utf-8?B?UkVqRW56TXlUTkVtTTBJVW5lZ1QxdFBFTmxoUXh4TS9HNWpnbVlkdkt2ME10?=
 =?utf-8?B?ckFQdTl1cmF0a0J3STZPRDZvT3pEdTZXZXA3VUU1S0Q2MzRncWtTRlk0T0p0?=
 =?utf-8?B?QXNPYjFZd1d5dVRWUTBUajF4YUpqZnJKWm84UXJTNVNCQXZDdjFFT21ROFly?=
 =?utf-8?B?OHJUL2lDQVZHYUVoVjVINkVlbUxqbmVSZ0IvQ1p3cDc4MEQ2OUwrZllnWWdn?=
 =?utf-8?B?cTQvUXNUYjZRRG5YOGxheS96VE5lK1JWQytoVjVUNFBPMnBJSzdyRE8rbDRh?=
 =?utf-8?Q?i7ahaT+hP9ukbGa/If?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f174d3-a201-4321-5a7d-08def9d02271
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 06:49:05.9536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoXmiVMkyjLHy9pRClAjnMW7q9JqMHA/93zPlCgvJmnCAQCnH1+ctWA9qNctIZDnKD7hfC2yBB0poglyqH6diA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12287

DQoNCk5YUCBDb25maWRlbnRpYWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogc2FzaGlrby1ib3RAa2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2Vu
dDogRnJpZGF5LCBBdWd1c3QgMTQsIDIwMjYgMjo0NSBQTQ0KPiBUbzogSm9zZXBoIEd1byA8cWlq
aWFuLmd1b0BueHAuY29tPg0KPiBDYzogaW14QGxpc3RzLmxpbnV4LmRldjsgRnJhbmsuTGlAa2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5v
cmc7IHJvYmhAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSBhcm02NDog
ZHRzOiBpbXg5NS0xNXgxNS1mcmRtOiBhZGQgYm9vdCBwaGFzZQ0KPiBwcm9wZXJ0aWVzDQo+DQo+
IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hl
biBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0
LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0
dG9uDQo+DQo+DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiAtIFtI
aWdoXSBNaXNzaW5nIGRldmljZSB0cmVlIGJvb3QgcGhhc2UgcHJvcGVydGllcyBvbiBwcm92aWRl
ciBkZXBlbmRlbmNpZXMNCj4gKGAmZ3BpbzNgLCBgJnNjbWlfY2xrYCkgY2F1c2VzIGVhcmx5IGJv
b3QgKFNQTCkgZmFpbHVyZSBmb3IgVUFSVCBhbmQgU0QvZU1NQy4NCj4gLS0NCj4NCj4gLS0tIFBh
dGNoIFsxXTogW1BBVENIXSBhcm02NDogZHRzOiBpbXg5NS0xNXgxNS1mcmRtOiBhZGQgYm9vdCBw
aGFzZQ0KPiBwcm9wZXJ0aWVzIC0tLSBjb21taXQgOWI5MDU2ZWIyMDc1MWIzNTQ5MzRkZmFlOGJl
Y2VlOTA1ZGE3ZDdiMA0KPiBBdXRob3I6IEpvc2VwaCBHdW8gPHFpamlhbi5ndW9AbnhwLmNvbT4N
Cj4NCj4gYXJtNjQ6IGR0czogaW14OTUtMTV4MTUtZnJkbTogYWRkIGJvb3QgcGhhc2UgcHJvcGVy
dGllcw0KPg0KPiBBZGQgYm9vdCBwaGFzZSBwcm9wZXJ0aWVzIHRvIGVzc2VudGlhbCByZXNvdXJj
ZXMgZHVyaW5nIGJvb3QgcGhhc2UuDQo+IEZSRE0tSU1YOTUgbmVlZCBVQVJULCBTRC1DYXJkLCBl
TU1DIGFjY2VzcyBkdXJpbmcgYm9vdCBwcm9jZXNzLg0KPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NS0xNXgxNS1mcmRtLmR0cw0KPiA+IGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTUtMTV4MTUtZnJkbS5kdHMNCj4gPiBpbmRl
eCAwZjQzZTNiZTcwNTg5Li5iYTE3ZDg3ZjE5N2EzIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk1LTE1eDE1LWZyZG0uZHRzDQo+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTUtMTV4MTUtZnJkbS5kdHMNCj4gPiBAQCAt
MTQwLDYgKzE0MCw3IEBAIHJlZ191c2RoYzJfdm1tYzogcmVndWxhdG9yLXVzZGhjMiB7DQo+ID4g
ICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJWRERfU0QyXzNWMyI7DQo+ID4gICAgICAg
ICAgICAgICBncGlvID0gPCZncGlvMyA3IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICAgICAgICAg
ICAgICAgZW5hYmxlLWFjdGl2ZS1oaWdoOw0KPiA+ICsgICAgICAgICAgICAgYm9vdHBoLXByZS1y
YW07DQo+ID4gICAgICAgfTsNCj4NCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBXaWxsIHRoaXMgcmVn
dWxhdG9yIGZhaWwgdG8gcHJvYmUgZHVyaW5nIGVhcmx5IGJvb3QgKFNQTCk/DQo+DQo+IEl0IGFw
cGVhcnMgdGhhdCB3aGlsZSB0aGlzIHJlZ3VsYXRvciBpcyBtYXJrZWQgZm9yIFNQTCwgaXRzIHBy
b3ZpZGVyICZncGlvMyBsYWNrcw0KPiBib290IHBoYXNlIHRhZ3MuIFUtQm9vdCdzIFNQTCBkZXZp
Y2UgdHJlZSBtaW5pZmljYXRpb24gdG9vbCAoZmR0Z3JlcCkgZHJvcHMgYW55DQo+IG5vZGUgbGFj
a2luZyBib290cGgtKiB0YWdzIHVubGVzcyBpdCBpcyBhbiBhbmNlc3RvciBvZiBhIHRhZ2dlZCBu
b2RlLCBhbmQNCj4gcGhhbmRsZSBkZXBlbmRlbmNpZXMgYXJlIG5vdCBhdXRvbWF0aWNhbGx5IGtl
cHQuDQo+DQo+IElmICZncGlvMyBpcyBleGNsdWRlZCBmcm9tIHRoZSBTUEwgRFRCLCBjb3VsZCB0
aGlzIGZhaWwgdG8gYWNxdWlyZSB0aGUgZW5hYmxlDQo+IEdQSU8gYW5kIGJyZWFrIE1NQyBwb3dl
cj8NCj4NCj4gWyAuLi4gXQ0KPg0KPiA+IEBAIC00NDUsNiArNDQ2LDcgQEAgbGVkX2JhY2tsaWdo
dDE6IGxlZEAxIHsNCj4gPiAgJmxwdWFydDEgew0KPiA+ICAgICAgIHBpbmN0cmwtMCA9IDwmcGlu
Y3RybF91YXJ0MT47DQo+ID4gICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiAr
ICAgICBib290cGgtcHJlLXJhbTsNCj4gPiAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gIH07
DQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gSXMgYSBib290IHBoYXNlIHRhZyBhbHNvIG5lZWRl
ZCBvbiB0aGUgY2xvY2sgcHJvdmlkZXIgJnNjbWlfY2xrIGZvciB0aGlzIFVBUlQ/DQo+DQo+IFNp
bmNlIHBoYW5kbGUgZGVwZW5kZW5jaWVzIGFyZSBzdHJpcHBlZCBpZiBub3QgZXhwbGljaXRseSB0
YWdnZWQsIHRoaXMgY291bGQNCj4gY2F1c2UgY2xvY2sgYWNxdWlzaXRpb24gdG8gZmFpbCBkdXJp
bmcgU1BMIHdoZW4gJnNjbWlfY2xrIGlzIG1pc3NpbmcgZnJvbSB0aGUNCj4gbWluaWZpZWQgZGV2
aWNlIHRyZWUuDQo+DQo+IFsgLi4uIF0NCj4NCj4gPiBAQCAtMTAxNCw2ICsxMDI2LDcgQEAgJnVz
ZGhjMiB7DQo+ID4gICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInN0YXRlXzEwMG1o
eiIsICJzdGF0ZV8yMDBtaHoiLCAic2xlZXAiOw0KPiA+ICAgICAgIHZtbWMtc3VwcGx5ID0gPCZy
ZWdfdXNkaGMyX3ZtbWM+Ow0KPiA+ICAgICAgIGZzbCx0dW5pbmctc3RlcCA9IDwxPjsNCj4gPiAr
ICAgICBib290cGgtcHJlLXJhbTsNCj4gPiAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gIH07
DQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gQ291bGQgdGhlIG1pc3NpbmcgcHJvdmlkZXIgdGFn
IG9uICZncGlvMyBhbHNvIGNhdXNlIGEgcmVncmVzc2lvbiBoZXJlIGZvciB0aGUNCj4gY2FyZCBk
ZXRlY3QgR1BJTz8NCj4NCj4gU2luY2UgdGhpcyBub2RlIGlzIG1hcmtlZCBmb3IgZWFybHkgYm9v
dCBidXQgcmVsaWVzIG9uICZncGlvMyB2aWEgY2QtZ3Bpb3MsIFNQTA0KPiBtaWdodCBmYWlsIHRv
IGFjcXVpcmUgdGhlIEdQSU8gaWYgJmdwaW8zIGlzIGV4Y2x1ZGVkIGZyb20gdGhlIFNQTCBEVEIu
DQo+DQoNCiZzY21pX2NsaywgICZncGlvMyBib3RoIGhhdmUgdGhlIGJvb3RoLWFsbCBwcm9wZXJ0
eSBpbiBTb0MgdS1ib290IGR0c2kgYWxyZWFkeS4NClRoaXMgd29uJ3QgYmUgYW4gaXNzdWUgaWYg
bm90IGFkZGluZyB0aGUgYm9vdGgtIHByb3BlcnR5IGluIGJvYXJkIGR0cy4NCg0KDQo+IC0tDQo+
IFNhc2hpa28gQUkNCj4gcmV2aWV3IMK3IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUNCj4gMkZzYXNoaWtvLmRldiUyRiUyMyUy
RnBhdGNoc2V0JTJGMjAyNjA4MTQtYm9vdHBoLWZyZG0taW14OTUtdjEtDQo+IDEtDQo+IGMwZTNm
MWI5ZDJlZCU0MG54cC5jb20lM0ZwYXJ0JTNEMSZkYXRhPTA1JTdDMDIlN0NxaWppYW4uZ3VvJTQN
Cj4gMG54cC5jb20lN0MwZGU5MWM4NWFmZTU0N2U0ZTc1NDA4ZGVmOWNmOWM5NSU3QzY4NmVhMWQz
YmMyYjRjNmYNCj4gYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM5MjIyODY3MjU3NjE5OTg4
JTdDVW5rbm93biU3DQo+IENUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlp
T2lJd0xqQXVNREF3TUNJc0lsQWlPaQ0KPiBKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJ
am95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPQ0KPiBlbGhic25yNkhxUHo4S2xYTVpYbkt4
OTBvcWQ1aUxGOENVQlZEejZYZk9vJTNEJnJlc2VydmVkPTANCg==
