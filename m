Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889E48097D;
	Mon, 14 Sep 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407301; cv=fail; b=SrfTQ1MMwTIjFQUAO0yop2rJ2CKljXjqBKGqmsWJTjX/kMLJvxmGF+TQVc/pVIFeck8P7nZw+E+I2YMFAK8J6UIjITcXcP+XOU1G0Dsmn72cfLXM4Topxh7g5b0fjBGseFMEQ8soOCF8yuyF65yPhzk/LPEH24BKIMxgtXTGz7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407301; c=relaxed/simple;
	bh=xOsp0fQfAbge6dvApZS9vdQNi+DYrDH8ziQzMhRw1a0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuVCxOT7XR5nqpaBOegV92Ou2czh17S/iMgqBCwq7nG2pwgIuH68gWcH46SnPmimvypbVvlZkuiJlTz81jK1k1Xpx9hbljDjXSGEmcWFa5lchIjjoEHjuj5UlLN1B0MLQ/AdeZGTYssGniXYrsi0nkgcXf8v6eIFdongYlUsgBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bW+ibNVG; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bW+ibNVG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVznRtduzKcNQs5AIPclYdLviro0EenIsKCcaPqDxO7nWR3qAO4ZAju5ChwcBFnChQWdDZX8JIxUvZhux949XS18tNHjSNsKLm4V4cqGWjOJeZJfFw51j25dsKJsaiGHjwRPjwDcp4IR2Hh+1sttjucDjMjLgcoPuJHUJP4O4ygO6fGfAmfurkgEpZaNmzjx7g8eiNDtS54CWcBBMLygupX+BztjGBNN5zr6C/xAlGyMmEw8I30vRQc8WkEpHbC4RAeNdFYqKA1K8xQjJ4ElYoEHuUGTlA+nDnMg7jT6wl2p4XeahkqrSEShb9VvPb0z1cPUqrXdZyzDSKqoVHsw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOsp0fQfAbge6dvApZS9vdQNi+DYrDH8ziQzMhRw1a0=;
 b=K9GgzvEviGJsIOzjTeGx9cZDqkgdBx3kBKWvjOX/VZJVec70sbnLgldh4Ol4eALzlaIY+j1fAfxB6UuBu2f2hfeWKeqKTlt+7Uw647JN768GsQzZ+S74EJKzA/vB1yrFS+9PY3CTcOje5gexavcjk5ggBqUWooclw0JKw0CjxLnsbrEYmWgjjzYeW1buCwceHObroJ+I+BbUNTe8DmtzF0M2S07DughodI5UMH0wKqwoo3VjV1NOrOKO8DFiRusSIRREp54wagFDvS8XSycuBXmuWzISeHjjaE7X/u2lQevSzGi8ZRuPYGNWx37omiaNErSHH08Q9JHoWyzA2V29Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOsp0fQfAbge6dvApZS9vdQNi+DYrDH8ziQzMhRw1a0=;
 b=bW+ibNVG9FUtvhVTRijhfum8InxwMC2c0OhtlKakBNBo+t/UC8NRW5Y8akkXTCvjEiPLVwDBJ0sD0EAlbLnT4kcJNFPEYRaU8bstCjcEEmndwdtitCRsyKX1cdoYv2QpN10cOzvZPdSRZYw9vVU7Y0L3JiwUc+VwVN6fDp/0GDR6eSlYeSjSb9lqoVn+S2bpUYUTCOGoPnJ+59sqfPMYY80AivU4b7wMrBaDnezQC/w7Sih0dQBS+lNao2ySxLqfRsRFWlV9OMl24Ty2Ue0h2ScsbtF55gOLedauikbntTZQSIVzRG/Jqn/nOo4eLb5KV8nepKWGvIyXBvOHdYfqxA==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 17:34:55 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:34:55 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdRFLl6qj9FWHmWUa7nq3I0AMEwrbOLYcAgAAH5gA=
Date: Mon, 14 Sep 2026 17:34:54 +0000
Message-ID:
 <GV2PR04MB12271AFEC9A27290293B034F895BB2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <20260914150950.CADB01F000FF@smtp.kernel.org>
In-Reply-To: <20260914150950.CADB01F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-14T15:38:06.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|PR3PR04MB7289:EE_
x-ms-office365-filtering-correlation-id: ff6b4c04-c455-4cc4-c295-08df12867d83
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|38070700021|4143699003|10067099003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info:
 U3RlIy5+sHlCrvQpnqPE2xfaMGvB74ZQ+b/JKV0wS0EVJysvQ+Ij3WRQFu3E50TUoB3vXoYYqM7zzmwRZD/hANc2EqthGsC5IhwZA/1WFYQdeX9mERqJph0zE6inGTdKWYJKz8flNW1DozBgMw3wJr8oLgkQuv9WABEuy8JQ/VmrEvHnB84J9bOSzmoUQquvd3PBknjXNrJI9qUuVn/Q29ceUqFQVYowVbwuBDiRX9zXGwEEBHwz3eic3MCfnOPbHplUz0vFkBx8OrhwQ7uZBEoV4oosDWQRXBgEuL4sT6kDYaepatlHh3eli3McQWMriKePOpjyYKpA0dEZ5uxKxcObSqfjV2FTMZk8Xx7Zh8jDuyxiXuodwWZmBeHJzlg3zp3avUn/rgq61RS69kG6xjeSKyc4DE6FiQp4/UcHeYgKecq07G9YWoTzAQNnSoRL4f3d/iPivyP05zJf7VtXG8EDEbgq9OstVth4Kk+gbrBUXHjJtjyVkqDzpKMBmBAKh1f4AQ03YBUJnKk5Ql1e2EEX/7r/KsbXbKD/tW3bb1JWke+YGzFvmCdGWfMc8TS952p6TsiA4ZPQV92c4lGGDLgQDgsf+FEopuwA2H9cl3s1cmIK5kPCsrZO9P225D+ecU0u093OMXgL/liPfXUUsaoiuBaTRRYwy+hipZLA8lM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFRjeGZkWkhGRmQvbkQ3U25TcDdyZGh3VHhQcE4xdGViZTI3a040Ym85b3BG?=
 =?utf-8?B?aVdxa0pBQ1hhY1g1bE1nbWJhVEFIclNSc3RFamxhbTUybVhTNlNlQ0FjalMv?=
 =?utf-8?B?QkhJdXpVZGg3RXlZL3lRNXg4U2ZSb2V3WmdHVjFWYUhPNUlwbG9uMWZlTVBX?=
 =?utf-8?B?WU1DOVNCcHA3UFFQbWtIRkVaVVZDR0dlL1FSOGxzcDBVVjY5UkhoUENGeEN4?=
 =?utf-8?B?T0czQ0hqSU1Sa0dtWldKUHBYQWttanZvWnZXMDBJSFRpUGNEUzFtQXRJcXNp?=
 =?utf-8?B?VjM1aFlKNFoxbUdsREhRL3NLSnQ5RDBQOGlWNVlMdTkxaFd3SXNyeFd5Z0lJ?=
 =?utf-8?B?NVVHOEt3V3NkOEhVRzJ6aWV4aFZ2OVRBcExCcE02aGU2Mjd5cHc1OG1sSlZX?=
 =?utf-8?B?L253L1QycWFvOXNpNSs4d1RnTWdZM2lzZkNKNlpUYjVuK1JvdjFyNnRHY1dX?=
 =?utf-8?B?S2UrVlpqdjRFUEk2bDFqTlpOTWMyZ0RhOG44REFoTEtpQy9pVVpLU0JCL1I0?=
 =?utf-8?B?aEVsSHYvM2FVN09lZHprOXNtODJhVTd5V1FIYzB4SS84ak5LbDR2RDBseTJO?=
 =?utf-8?B?WmtGalRvVkI0WVVlSGw5KzRXeEk4TmFNMzg2bktZMGNkczhmNythT2pHNHRY?=
 =?utf-8?B?UGxtRENZbzBuTDNoV21US0o2WU1ud0d1cGxmYjZvaCtpcEp5b2dGTFQxaURv?=
 =?utf-8?B?VE8xSXB2SHRRRzd1dzhwZ0ZPdlBQZml2SVkrOHFBak91WXZYUkdjVGRaU3Fx?=
 =?utf-8?B?L1FuQXRmTC9yZVZwUmM3SjNFeER2c3Bkak1tSnZzOWdLVjVBY2lyK29obWR6?=
 =?utf-8?B?Vm1lZmErMVdFTGNTU3NFZzZmblJBcm1BUmNlZGRXVUZHWEdkQnpCcDg5d1JM?=
 =?utf-8?B?SGxsd0lzR2xQRU9GM1JEdGo1RVM0a0pwa2p2bk4yR2lsbDVLWlRSWGZHUlNB?=
 =?utf-8?B?OXFsNXhNSXVCVm91aitVeHRrNmp5cTdIT0NNWGlwbHpYTFAvRjhlckc0WVI0?=
 =?utf-8?B?NjMxWXI2NUJvUWpnOHk5SDVsaExySy92WWtUMktnMVBiL0Z3WGhGOUxvNW5p?=
 =?utf-8?B?Z0E5MVA2SGVRUExPNVpyTXlsVW1nVDNUY3hoMFFtTWE2VVRaQVhaM0ZEOWUx?=
 =?utf-8?B?Znpza3dpMG4zMXVmM3dWazQzTDRoSWptZXFhTmx6dUNEdEIxUE1EVy9uVGlI?=
 =?utf-8?B?SUp6Nkx6bEpTOTRGUXgzRWJrQ3hnNVIrVnM5NmRsUTZCampRRm1vL0ZadEt0?=
 =?utf-8?B?KzUza29JZWVBVHpKQTkyTzRyeTFBWVZ0TE9meW1iaWUvMStvNEFWZklYdC8y?=
 =?utf-8?B?U01STUM1VEhiNnliak5LMDZGZmptOVBmSVFSYlA3ZDNMWkhLUnBualJRZTBI?=
 =?utf-8?B?MHAwc05UVzJxVHJWcmhJODlsempTaXBHeW83aWlRcmF1b3NQRFdwUGg3djVD?=
 =?utf-8?B?akk0ZlFBVzBMRS9lVmh2V1o0d3haWVFKWlNESTB4eStOazJxK1QxVTRONjJq?=
 =?utf-8?B?ZHZxR3o1ZVZvdmNIcFl0am1zQXlFZTUrODc0aFdlb3ZhUTV5WFgyYVo4WHVk?=
 =?utf-8?B?VWVoeWYzUFhROGZ6UG51UThoamxrRnVvVGVTRGFGS0lrZVVNQzRWekpOeGlH?=
 =?utf-8?B?N3c2VTQxck9RRk10Wmg3bWhtbHJiSjE1MndMQUNWMHlWMGNqSHBMK1p2YXRn?=
 =?utf-8?B?MFFrbS9BRElqV1ZnbzloelZjTXEzRWY1Sm16aHRyd24xaFBtaGNmcHdqa0RM?=
 =?utf-8?B?b0VIMlQ5clM5emV1TVl4Wmo1WEhDWXkzZG0vRE9VTUJmYkJEdG5QaVpPc21H?=
 =?utf-8?B?OFQ5VWdDYWJMMkxjOTN3VTZ2bEdOWk1sU1FSWkxwcDJPNld3eVlmUFZROENR?=
 =?utf-8?B?TFA4Zm9EcklURUxjQ1pjZ3dmMCtFNEk5YXBPeXp2alN1TlhwM0E3OWh2bks0?=
 =?utf-8?B?QUovVjcvT081ODNneVBJWUt0TWVLTzBlSVZvWU1PVkVrbEVZV2g2Z2FKK1pv?=
 =?utf-8?B?T2d6b0lkRG9IbTVRcjNrYWZCNWRqNmxMOHJ4QmFyemxFc1gxQ2hNcGp3T2Y5?=
 =?utf-8?B?K2lvYlZCTGlLdGsxYi9UajNuUFVQYzlKZFpvOFpqc0RSaWVHay9uN1ZnVnN2?=
 =?utf-8?B?TFo3KzFyTmFPeEtjMjIzTElpSXhEVkMxWDBlU2hUZnVjd2FYRUZHbEJhQVpq?=
 =?utf-8?B?RVplZUhsdEN1RWN2ZlgxWGVkKy9RdFpPV2ZsNXpmOVhuQkY2NmdJMXBwajVY?=
 =?utf-8?B?SE5UVWZac3dhZERYRjdDRXpaZlF6b2RVaEdod29GS3NEY0s1aFJVSEVlYmVy?=
 =?utf-8?B?QkpZRFRMdmNEMGY3eGJTc2YxSGp6TmpkSHl0bGIxVWFZMUx5UWt6QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6b4c04-c455-4cc4-c295-08df12867d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 17:34:55.0476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFyRhFAarCCJg6sgg6Z4zCnE/j1w3a3/1UMTucI5ezcQ7LD9OdCVCqR2gchFGlqpmwIen+YraO0moukMwRfNjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289

PiA+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvaW14L3NlX2N0cmwuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZmlybXdhcmUvaW14L3NlX2N0cmwuYw0KPg0KPiBbIC4uLiBdDQo+DQo+ID4gK3N0YXRpYyB2
b2lkIHNlX2NsZWFyX2Z3X2J1c3koc3RydWN0IHNlX2lmX3ByaXYgKnByaXYpIHsNCj4gPiArICAg
c3RydWN0IGZ3X2J1c3lfaW5mbyAqZmJ1c3lfaW5mbyA9ICZwcml2LT5md19idXN5X2luZm87DQo+
ID4gKyAgIHN0cnVjdCBzZV9pZl9kZXZpY2VfY3R4ICpkZXZfY3R4ID0gTlVMTDsNCj4gPiArICAg
dW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArDQo+ID4gKyAgIHNjb3BlZF9ndWFyZChzcGlubG9j
a19pcnFzYXZlLCAmZmJ1c3lfaW5mby0+ZndfYnVzeV9sb2NrKSB7DQo+ID4gKyAgICAgICAgICAg
ZGV2X2N0eCA9IGZidXN5X2luZm8tPmZ3X2J1c3lfZGV2X2N0eDsNCj4gPiArICAgICAgICAgICBm
YnVzeV9pbmZvLT5md19idXN5X2Rldl9jdHggPSBOVUxMOw0KPiA+ICsNCj4gPiArICAgICAgICAg
ICBpZiAoIWRldl9jdHgpIHsNCj4gWyAuLi4gXQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgYXRv
bWljX3NldCgmZmJ1c3lfaW5mby0+ZndfYnVzeSwgMCk7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICByZXR1cm47DQo+ID4gKyAgICAgICAgICAgfQ0KPiA+ICsgICB9DQo+IFsgLi4uIF0NCj4gPiAr
ICAgc2NvcGVkX2d1YXJkKG11dGV4LCAmZGV2X2N0eC0+Zm9wc19sb2NrKSB7DQo+IFsgLi4uIF0N
Cj4gPiArICAgICAgICAgICBpZiAoaGF2ZV9zbmFwKSB7DQo+IFsgLi4uIF0NCj4gPiArICAgICAg
ICAgICAgICAgICAgIGZ3X2FwaV9zcGVjaWZpY19vcHMocHJpdi0+cHJpdl9kZXZfY3R4LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IHNlX2FwaV9t
c2cgKilsYXRlX3J4X3NuYXAsDQo+IHRydWUpOw0KPiBbIC4uLiBdDQo+ID4gKyAgIHNlX3JlbGVh
c2VfbXNnX2lmKHByaXYpOw0KPiA+ICsNCj4gPiArICAgc3Bpbl9sb2NrX2lycXNhdmUoJmZidXN5
X2luZm8tPmZ3X2J1c3lfbG9jaywgZmxhZ3MpOw0KPiA+ICsgICBhdG9taWNfc2V0KCZmYnVzeV9p
bmZvLT5md19idXN5LCAwKTsNCj4gPiArICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZmJ1c3lf
aW5mby0+ZndfYnVzeV9sb2NrLCBmbGFncyk7DQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gQ2Fu
IHRoZSBjaXJjdWl0IGJyZWFrZXIgYmUgcGVybWFuZW50bHkgYnlwYXNzZWQgaWYgYSByZWNvdmVy
eSBjb21tYW5kDQo+IHRpbWVzIG91dD8NCj4NCj4gSWYgZndfYXBpX3NwZWNpZmljX29wcygpIHRy
aWdnZXJzIGEgY2xlYW51cCBjb21tYW5kIGxpa2Ugc2VfY2xvc2Vfc2Vzc2lvbigpDQo+IGFuZCB0
aGUgZmlybXdhcmUgaXMgc3RpbGwgaHVuZywgdGhhdCBjb21tYW5kIHdpbGwgdGltZSBvdXQgYW5k
IGNhbGwNCj4gc2VfbWFya19md19idXN5KCkuIFNpbmNlIGZidXN5X2luZm8tPmZ3X2J1c3lfZGV2
X2N0eCB3YXMgc2V0IHRvIE5VTEwgYXQNCj4gdGhlIHN0YXJ0IG9mIHRoaXMgZnVuY3Rpb24sIHNl
X21hcmtfZndfYnVzeSgpIHdpbGwgY2xhaW0gdGhlIHNsb3QgYWdhaW4gYW5kDQo+IHNldCBmd19i
dXN5ID0gMS4NCj4NCj4gV2hlbiBzZV9jbGVhcl9md19idXN5KCkgZmluaXNoZXMsIGl0IHVuY29u
ZGl0aW9uYWxseSBzZXRzIGZ3X2J1c3kgdG8gMCBoZXJlLA0KPiBidXQgbGVhdmVzIHRoZSBuZXds
eSBhcm1lZCBmd19idXN5X2Rldl9jdHggcG9wdWxhdGVkLiBUaGlzIGxlYXZlcyB0aGUNCj4gc3lz
dGVtIGluIGEgc3RhdGUgd2hlcmUgZndfYnVzeSA9IDAgYnV0IGZ3X2J1c3lfZGV2X2N0eCAhPSBO
VUxMLg0KPg0KPiBJZiB0aGlzIGhhcHBlbnMsIGNvdWxkIHN1YnNlcXVlbnQgdGltZW91dHMgZnJv
bSB1c2VyLXNwYWNlIGlvY3RscyBmYWlsIHRvIHJlLQ0KPiBhcm0gdGhlIGNpcmN1aXQgYnJlYWtl
ciBiZWNhdXNlIHNlX21hcmtfZndfYnVzeSgpIHNlZXMgYSBub24tTlVMTA0KPiBmd19idXN5X2Rl
dl9jdHggYW5kIHNpbGVudGx5IHJldHVybnM/IFRoaXMgd291bGQgcGVybWFuZW50bHkgYnlwYXNz
IHRoZQ0KPiBmYXN0IHJlamVjdCBtZWNoYW5pc20uDQo+DQpUaGUgcmVjb3ZlcnkgY2xvc2VzIG9u
bHkgZmlyZSBvbiB0aGUgaGF2ZV9zbmFwIHBhdGgsDQppLmUuIGFmdGVyIGZpcm13YXJlIGhhcyBq
dXN0IGFuc3dlcmVkLCBzbyB0aGUgZm9sbG93LXVwIGNsb3NlIGlzIHRhbGtpbmcgdG8NCmEgcHJv
dmVuLXJlc3BvbnNpdmUgZmlybXdhcmUgYW5kIHRoZSAicmUtYXJtIGR1cmluZyByZWNvdmVyeSIg
d2luZG93DQpkb2Vzbid0IGFyaXNlIGluIHByYWN0aWNlLg0KDQpObyBjb2RlIGNoYW5nZSB3YXMg
cmVxdWlyZWQuDQoNCj4gPiArICAga3JlZl9wdXQoJmRldl9jdHgtPnJlZmNvdW50LCBzZV9pZl9k
ZXZfY3R4X3JlbGVhc2UpOyB9DQo+DQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNS1pbXgtc2UtaWYtdjUxLTAtDQo+IDRh
N2RhYzYxMmNiNUBueHAuY29tP3BhcnQ9NQ0KDQpOWFAgQ29uZmlkZW50aWFsDQo=
