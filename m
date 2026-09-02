Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603F463B97;
	Wed,  2 Sep 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351325; cv=fail; b=HKSmtzzRThxPGYSTRvQH+N6PNrM7YpMCtATYzert1Zk5ZKl8/0qFq/CXCW8dj9eMpC1HSKeJ9Dz/1sMZCu/3snQIfZ0f85fUMoVX1k/mJ6DdneUYORyTda56ziNKpSpBouOrEKE7URDlEDV/kOYQTsW2kTQGl5SQWfDAp75VOpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351325; c=relaxed/simple;
	bh=8TeXDasfdx1yhgdmZ7cv8K79g8JZ8hkv30Q4kDnNKr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cKrrKjsxpt0AOpZymPYhdBTFVLdjAY2aC2CtMY+LKV7AbaHYgSPnssldX/cd+qYsgR1bhbK9cTGfazKIALCoDgDt3thHwWNg8Enw/+gdDGswzAczs/kPBHFchbVeEmdoiKUkRqm0hz/B3MZ6/eThqQBb1jAWQChOHDDzGZbs0+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=deq6+rIe; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="deq6+rIe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiPQEU02O14vTz44EK2NNAYGi6RnCtjX0xoxgUGoyJ2811loK58CBeQRsZMj+yuIA9KGNYzlkAsZ7rIZo6ehfJ7BeTK6uyUg8cBsgy0q3h8XM8NnLZ1D/L24hM32ofNNSNt/sBpn3DD9VzbQZFnZNbpxtzJu+UP2acoWiIkFw9jiF8ACvg8VyO2wZfMduS0luYhLwd30/cFObaUi6U6tL0zTVzIq0BhQyPUBlwl3sSsVeZL0wGPYn4YWGYR2fP2a8x3hpD1Of/KRUE802r8LpzQA0Txx6plu1psnG792Yn67FrHXUTl+K0pTwS6eY4H53m4HTjyzMveVdD60PITaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TeXDasfdx1yhgdmZ7cv8K79g8JZ8hkv30Q4kDnNKr8=;
 b=auaoVIGbQ4m2a0COKC/guG0YhU3XMri281jJmeeaZ3+whobqaJmdnNI0QwCu81KdD/GIDcCSqqi2ZHLD+9xSJSw7j6KnlbRYpMgIOaASBIDpuLBS1vsTQAU6PijuTuhmcep5WUwHtH1k3eFvIC35Kp8uptfPZvEkKljxW3yN6Lx4i/vUWmsbnwB27RduWGoupO7ITIZNsn+ingXcFqITJ2+lYudOsqBVJSmp3AgI/CZdL2KJJg3tcWQAoT+l8pGPd9cMeSJoDWaqHr7zxojpHMRnZy5PTQIl0tH6xohr2GvgkO71eHoZVKJAXo7jrBiNB+h04IGDA6T4qy+X0x/SXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TeXDasfdx1yhgdmZ7cv8K79g8JZ8hkv30Q4kDnNKr8=;
 b=deq6+rIeObtutIKAOf+IHd9vNCVwiGvj26VU/S5w8HdeLvDStYW1Tqcm1ExhQlNDZuhkFtk8ADOK30yjr/xmdLqg1/+n9oaoBeEWwM7M/zpn4kBszzAxs0W/WbQRrJKSU9ve1F4Azc/2QADAr6fKvql4qpIYhh2GxTeBLjfolp4E3JEZi+L3DNIRsRIwe2BL4ZvHfVGdH2Alc9qG4cQd319egDREYd851eh8XryGkcfWYM2sKkpMAl+1FaDvamYDqZRSZvON+/8X/4Fa8KmSWRYgXTt43nbhKLo3AtdonlBOgopL6u5Eo1GXoo6skl6ANtiOf+IFGMgH2c8MKdp7kg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU0PR04MB9696.eurprd04.prod.outlook.com (2603:10a6:10:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:15:14 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:15:14 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v45 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v45 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHdOsr5a0hZ3dFv3E2UtTpJQ8LI/La7I94AgAAPtUA=
Date: Wed, 2 Sep 2026 12:15:14 +0000
Message-ID:
 <GV2PR04MB1227104C1918F0B42BDD642FA95B72@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
 <20260902-imx-se-if-v45-3-6e400879d8ec@nxp.com>
 <20260902111807.2E7AA1F000E9@smtp.kernel.org>
In-Reply-To: <20260902111807.2E7AA1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-02T12:14:19.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DU0PR04MB9696:EE_
x-ms-office365-filtering-correlation-id: 68609676-d3e7-4afe-bbe8-08df08ebd80f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|18002099003|22082099003|38070700021|10067099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 b/rELXeRKz3eX7FcRqxkGEMXh52wqVVcq+mx+PfnJYDilK55FL28tm9mZ/bItR/jjyi43Efwky0pOjBzanVJREpvmWMYCkEKjS0Ld8ghcNxrye9ijDoCwr1jn+QVUqqmmLbZyracueQNlpZ+7DLFNuQmtGfvV8C/rRSh+dLvplRcbtGk6ptdUwn7wkU8F3X7CYmtkeP/5X2QkdlU4CwSVGYm6rfDLkQs8oUgt2CU79CiVf9+tQx7qKpGYlYCgqmsJqdo5cYykeqIPpvIR8FqYuZMuxfJieEORwv/H3ZpMnE496bsp6ceN/+Eqt3YuoQnh8Eo+uTE0fzdEOORCVf1lopuMuS3nE/l758NOJ5HZC3UzdjUW2EFs9/2opIOCKf0hFsK+lRv036TJ/CuCyHZu9Sj/MzlV7t7ZsQlBNH8/pa36uSoz0PidkSSLFkPe4FpK2lygBpmupwWqhcywi/oNkBUwYgLZhzZf/yxyQjwdjxtj5Gf+1QT/duws/E9j2yFtWscdUPFmNHirDA6h0VGjD0Bi2NQeM2j3TJPGukzdX29zy6E8nrd4qxcwPEWaVAADEo1Xmx58T2qM/iA9wSkpt1sgbHy+Te5VNDZ20lD0G35HPcQq7eSYmABcbuEN5xVHVquRNFIzPfouErbgX6tyGDoBTkwyfcJfPgXFtkM5GQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sm5UZmVpWkxOR1lHUFo5VGJURzdxRVdtR1IvNG9iQlI3b2JteHc0Kzg5dURJ?=
 =?utf-8?B?SUNVdmdOcEhLbFEzMGpWQXJVM3paY2hZZE1YWlFCMGlacTgwb0NlSHI5MXAz?=
 =?utf-8?B?WmZSdTBPOHNZY1BReXRkODA5dUI2K2ZKZHg3YjVPWWxvMGF2ZDd1UHdKQys0?=
 =?utf-8?B?NzBqWEN4VTVlVjc4Qk5vU1pwSFBvZG9wemhmNHNlN2ZGU0NxbzlMSWZGejdN?=
 =?utf-8?B?K2RyWTJmUlVnaFBjbnZFbExBdHRlaldKRGxMS3l2RVRScmlueEtkeGZMTy9W?=
 =?utf-8?B?TkhTSDRSelNraVlGQnRmb2pRUVNXd1dWcEN3Z0hMSDZTZzZCWFNrcTdYdW9Y?=
 =?utf-8?B?WWxTdnBKNmxxT2dSbXZYRTBFRXQxVDl3Qk1LaXdnUkovYW90MGpTQ2hsZmc4?=
 =?utf-8?B?V0ZhMGhIZ2x4YXNZaUhUTjlVeDlXRmdBRmR5Q3R0UEU3WFp5clNXMWtzQXZX?=
 =?utf-8?B?MVg4QVcrVEl4L3JjM2JkZlRvOU5RcnBCV2l0bjZaVVc5ajRHdVAyYUxMeG1o?=
 =?utf-8?B?dGFoK25zRkxiTEx0UTJYV1BvdDU3ekV3azRydXlWTTVaejRtRGY2dmMwUWRn?=
 =?utf-8?B?YXRvbXRBV2JobW1na2MrOGttNkdJSXFLY0xjUmo3dWZIb1Y0Q1JrWnJLc01h?=
 =?utf-8?B?c0ZrQkRLNm9TOXJqWkFlU2hiN3ptRDN2TERYb21qbnhHN2JZK1N6dmErUGY4?=
 =?utf-8?B?enJLc0J1ZTZJV1BkSVJHdFFhR0htWTh5Mzg4N3o2SXQ3WkZkWVBMb2ROYzJk?=
 =?utf-8?B?RTU3L3E1MmsxQnJ0NGtvNTh3ZDFtNWFYRExLaXkvbUo1MmphL0xFQ1BqVUg5?=
 =?utf-8?B?V0ovbXY0ZlljWGVZYTVhczYxbkxDTHN4czhtZG0zWkVvMEZpWE9JclpQamJJ?=
 =?utf-8?B?aHFUZ0dONnlZYnFtUC9ZWUZhQW1JSWRKS2t4RGhTS1dvb1plV1pVbUttZ24y?=
 =?utf-8?B?MlhMT2hSQnRzY210cWw3bDEwV2E3MzRZOHc2SENyZXd2aDc4UkpVckhkYUNj?=
 =?utf-8?B?THFtT3ZBZS9GUkh4WE1DcWpUNHR5dDdyU3BzS3FraE9JUVRxaHg5Tnl6SHlP?=
 =?utf-8?B?SVp0L1Y5R3dkR2FRaHVoWkM2Ri9LTkc0K3orMGRJMFI2Y2M3QXpWbDE2OVdi?=
 =?utf-8?B?dnNmMCtuLzVOSFBYMkJpcFg5MmU5d2JPVVJLbnZuOWZWZFRTTEthRGw5VHRs?=
 =?utf-8?B?ZW5iZkVnQjlhVlBpYllWTk5Vblc4Ni8xV1g0L1BuRDZtWWlSeGdLY3NXaEl0?=
 =?utf-8?B?Q3A4OHRLWGg0bmZaRzlMZnN0T1VjYnRWNG4rMXZncTVmMi9pMVo1TVl0UFdY?=
 =?utf-8?B?amY4MjZFUjEycDlsOE1QUm02TGhtWHl1Unk5ZUtsOWlLNm1qV3Bqc1Y0NUxz?=
 =?utf-8?B?elZRSDhaeXk2VlNvdGtwZUZsSHF6OExIVDFJcGIxaDhKRVdCbnpzaWswdFpn?=
 =?utf-8?B?ckx0eGEvQ0ZOcC9PWlhKdUJZRDFEaE9Ec3prRkJMNEtTR2dHNThRd3J0RC9G?=
 =?utf-8?B?QmhFQVFIdXBlQ01oZHVzQ0pyU24xd2hiNkJZdWhrU3FLMTFtUERTd1pUc0NV?=
 =?utf-8?B?QVlteCtWaFgydGdvQnpTWEpuS2FZMFRVUUNBRkNBQlZBdmVtcXZGdmRPT1lC?=
 =?utf-8?B?MmJBYXczemI2d2hEMlQyS0hQS1lPbjdKOC9WMmVMUUszbXR1RFlVQ1g0Z1Fl?=
 =?utf-8?B?Wmk0dnRGTGpJZUI1M2V5ZDRzMFJvVWxyVXQ2TDdFQzQ5OWIrR1VSQ0pDT1dZ?=
 =?utf-8?B?UVZEM1R6VExoUFYrQ2FjaFNrcmVEbWY0K2Y1TXl2a1R3YVpjY0MxSVZPeEVE?=
 =?utf-8?B?dTFUSXFZZVN0VXBJRGFLK0c4c0VSZndseFNjVUpzTGdmeHpVc1VkRnVSWUJX?=
 =?utf-8?B?aE8vNi9Gd2NDMXd4ZlVqOTladmxwL0l6L3hCQWUvb3pCOEh4ZGVLWENnVXl4?=
 =?utf-8?B?cGhQZXhIOEVmdkF4VzBuTmhuOEphNVc4YTJjeHY3VlNoVkxaSlpXbnFwSjRa?=
 =?utf-8?B?VTQ0MGp4ZHhRbkpkVXR3bTdaUGZGZjN1WWdkN3VoaC9xYS96aGhYeGhHT3Fm?=
 =?utf-8?B?UnE1ekxsRmtPa0ZoTnBNZGZPanpUUVdvbUp5UFZoNXJzZHhmdUFmSHpUV0JK?=
 =?utf-8?B?UnRqWTFidUZ5aFFaSEFQcGZKK0lGOTMyekhvWU03U1h6YmtDZXNqWVA4QkZo?=
 =?utf-8?B?eU9vbnllS2hJbzZUSHE0dlV3KzBMbGY4c2R1K3FPL1RLY3drNTRsbmpJbFlH?=
 =?utf-8?B?Q1M2eGY5cmRGOUE1b1dpYnh6elNlS1IzVUNKMmpNZkUvREJHMHViN1lDOUlw?=
 =?utf-8?Q?drro618t8SfLcUejK5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68609676-d3e7-4afe-bbe8-08df08ebd80f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 12:15:14.4538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73N3LXxZdY7Kw5u5FRJ8n/i2j03PjE72GNB3PTWWSbVU2lh1uyWzxGM4ZWA06WScU/9hSx6GIoKjbJryu49ceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9696

PiA+ICsgICB1MzIgZ2V0X2luZm9fbGVuOw0KPiA+ICsgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiAr
ICAgaWYgKCFwcml2KQ0KPiA+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4g
PiArICAgbWVtc2V0KHNfaW5mbywgMHgwLCBzaXplb2YoKnNfaW5mbykpOw0KPiA+ICsNCj4gPiAr
ICAgc3RydWN0IHNlX2FwaV9tc2cgKnR4X21zZyBfX2ZyZWUoa2ZyZWUpID0NCj4gPiArICAgICAg
ICAgICBremFsbG9jKEVMRV9HRVRfSU5GT19SRVFfTVNHX1NaLCBHRlBfS0VSTkVMKTsNCj4NCj4g
W1NldmVyaXR5OiBIaWdoXQ0KPiBDYW4gdGhpcyBhbGxvY2F0aW9uIGNhdXNlIGEgc3lzdGVtIGRl
YWRsb2NrIGR1cmluZyBzdXNwZW5kPw0KPg0KPiBTaW5jZSBlbGVfZ2V0X2luZm8oKSBpcyBjYWxs
ZWQgZnJvbSB0aGUgc3VzcGVuZCBwYXRoOg0KPiBzZV9zdXNwZW5kKCkgLT4gc2Vfc2F2ZV9pbWVt
X3N0YXRlKCkgLT4gZWxlX2dldF9pbmZvKCkNCj4NCj4gVXNpbmcgR0ZQX0tFUk5FTCBoZXJlIGFs
bG93cyBkaXJlY3QgbWVtb3J5IHJlY2xhaW0sIHdoaWNoIG1pZ2h0IGF0dGVtcHQgdG8NCj4gZmx1
c2ggZGlydHkgcGFnZXMgdG8gc3RvcmFnZS4gSWYgdGhlIHN0b3JhZ2UgZGV2aWNlIChsaWtlIGRt
LWNyeXB0KSBpcyBhIGNvbnN1bWVyIG9mDQo+IHRoaXMgY3J5cHRvIGhhcmR3YXJlIGFuZCBoYXMg
YWxyZWFkeSBiZWVuIHN1c3BlbmRlZCwgdGhlIHN5c3RlbSBjb3VsZA0KPiBwZXJtYW5lbnRseSBk
ZWFkbG9jay4NCj4NCj4gU2hvdWxkIHRoaXMgdXNlIEdGUF9OT0lPIG9yIHByZS1hbGxvY2F0ZSB0
aGUgYnVmZmVyIGluc3RlYWQ/DQoNCkFjY2VwdGVkIHdpbGwgZml4IGluIHY0Ni4NCj4NCj4gWyAu
Li4gXQ0KPiA+ICtpbnQgZWxlX3NlcnZpY2Vfc3dhcChzdHJ1Y3Qgc2VfaWZfcHJpdiAqcHJpdiwN
Cj4gPiArICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgYWRkciwNCj4gPiArICAgICAgICAgICAg
ICAgIHUzMiBhZGRyX3NpemUsIHUxNiBmbGFnKQ0KPiA+ICt7DQo+ID4gKyAgIGludCByZXQ7DQo+
ID4gKw0KPiA+ICsgICBpZiAoIXByaXYpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKw0KPiA+ICsgICBpZiAodXBwZXJfMzJfYml0cyhhZGRyKSkgew0KPiA+ICsgICAgICAg
ICAgIGRldl9lcnIocHJpdi0+ZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIkVMRSBzZXJ2
aWNlLXN3YXAgYWRkcmVzcyBleGNlZWRzIDMyLWJpdA0KPiByYW5nZTogJXBhZFxuIiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICZhZGRyKTsNCj4gPiArICAgICAgICAgICByZXR1cm4gLUVSQU5H
RTsNCj4gPiArICAgfQ0KPiA+ICsNCj4gPiArICAgc3RydWN0IHNlX2FwaV9tc2cgKnR4X21zZyBf
X2ZyZWUoa2ZyZWUpID0NCj4gPiArICAgICAgICAgICBremFsbG9jKEVMRV9TRVJWSUNFX1NXQVBf
UkVRX01TR19TWiwgR0ZQX0tFUk5FTCk7DQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gU2ltaWxh
ciB0byB0aGUgZWxlX2dldF9pbmZvKCkgYWxsb2NhdGlvbiBhYm92ZSwgdGhpcyBpcyBhbHNvIGNh
bGxlZCBmcm9tIHRoZQ0KPiBzdXNwZW5kIHBhdGggdmlhIHNlX3NhdmVfaW1lbV9zdGF0ZSgpLiBD
b3VsZCB0aGlzIEdGUF9LRVJORUwgYWxsb2NhdGlvbiBhbHNvDQo+IGRlYWRsb2NrIGlmIHRoZSBz
eXN0ZW0gaXMgdW5kZXIgbWVtb3J5IHByZXNzdXJlIGR1cmluZyBzdXNwZW5kPw0KPg0KPiBbIC4u
LiBdDQo+ID4gK2ludCBlbGVfZndfYXV0aGVudGljYXRlKHN0cnVjdCBzZV9pZl9wcml2ICpwcml2
LCBkbWFfYWRkcl90IGNvbnRucl9hZGRyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgZG1hX2Fk
ZHJfdCBpbWdfYWRkcikNCj4gPiArew0KPiA+ICsgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAg
aWYgKCFwcml2KQ0KPiA+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAr
ICAgaWYgKHVwcGVyXzMyX2JpdHMoY29udG5yX2FkZHIpIHx8IHVwcGVyXzMyX2JpdHMoaW1nX2Fk
ZHIpKSB7DQo+ID4gKyAgICAgICAgICAgZGV2X2Vycihwcml2LT5kZXYsICJXcm9uZyBhZGRyZXNz
OiAlcGFwICVwYXBcbiIsDQo+ICZjb250bnJfYWRkciwNCj4gPiArJmltZ19hZGRyKTsNCj4NCj4g
W1NldmVyaXR5OiBMb3ddDQo+IERvZXMgdGhpcyBsZWFrIHN0YWNrIG1lbW9yeSBpbnRvIHRoZSBr
ZXJuZWwgbG9nIG9uIDY0LWJpdCBwbGF0Zm9ybXM/DQo+DQo+IFRoZSB2YXJpYWJsZXMgY29udG5y
X2FkZHIgYW5kIGltZ19hZGRyIGFyZSBvZiB0eXBlIGRtYV9hZGRyX3QuIFRoZSAlcGFwDQo+IGZv
cm1hdCBzcGVjaWZpZXIgZXhwZWN0cyBhIHBvaW50ZXIgdG8gcGh5c19hZGRyX3QuIElmIHNpemVv
ZihkbWFfYWRkcl90KSBpcw0KPiA0IGJ5dGVzIGFuZCBzaXplb2YocGh5c19hZGRyX3QpIGlzIDgg
Ynl0ZXMgb24gdGhlIGFyY2hpdGVjdHVyZSwgcHJpbnRrIHdpbGwgcmVhZA0KPiBwYXN0IHRoZSBw
b2ludGVycyBhbmQgcHJpbnQgdW5yZWxhdGVkIHN0YWNrIG1lbW9yeSBpbnRvIGRtZXNnLg0KPg0K
PiBXb3VsZCBpdCBiZSBzYWZlciB0byB1c2UgJXBhZCBmb3IgZG1hX2FkZHJfdCBwb2ludGVycz8N
Cj4NCkFjY2VwdGVkIHdpbGwgZml4IGluIHY0Ni4NCg0KPiA+ICsgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiA+ICsgICB9DQo+IFsgLi4uIF0NCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAyLWlteC1zZS1pZi12NDUt
MC0NCj4gNmU0MDA4NzlkOGVjQG54cC5jb20/cGFydD0zDQoNCk5YUCBDb25maWRlbnRpYWwNCg==
