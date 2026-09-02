Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F730BF69;
	Wed,  2 Sep 2026 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317624; cv=fail; b=q3Bf6GcFlheiD+PRHTwKtmIITcme0+xacqc0rNwEPth8l8OeYYBJoIN5wntk0IobqImAsYNSLFB1ycp9seaFsF5ApcsI+Hf01LxUP4+P9+AINGrZfSciUUKGUsjOBzxb94hdOgRC52vNe2AZuga0NSMB6IuOoKv+WLZYL/lueDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317624; c=relaxed/simple;
	bh=znWNQ5wEEP6ZjBoXUA0JIiPoWw4cBvfFhgCfSBRtdoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FUp5ts110lwTlGOkvTszhVfjb9naRR5gNrib3SpLbc9gVywQwb7GtfOB4/FXu8b87N1l4q02ShccFChUeDkH+ib5CE+Jt65bTA9Jf70r1x6BHle5HzpMkHTlKW0dr5GVzifyzMZ9NtOMoD6eYh/HX5UuVD7wJJcbLKFSgGCtH3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L6EiOCrp; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L6EiOCrp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOKpkiyOdQyBteI3mr3NAFyHK5XdIbidWggQc1tQgPX6kEmPbdfzwX8kks1a/Trvht5tVKYKl2iHb+BHjkjMj2GlChCxtdFiyXdktq7uuZHb8zDkaH0/fMH0Lr+FrexfTRScNzd7dgWQ3dBpm+Wd/HBecHtMfoZqzoEHfx0DH8EJxlq7jXRIu4PF+Twa3zsBKZjQyFuNHacbgE+YV9TTt3dln3h8yV8NcIbMUNAjGJkwogYSwD7B7PnDPHOsdSBpycsnIxZfjs/ik/VZaNNewZyl+0XlEW+psGbLA+til1O/51LPwhXWiUeujHoBzvSpBMtT8C4CKyNNqvK9GqF6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znWNQ5wEEP6ZjBoXUA0JIiPoWw4cBvfFhgCfSBRtdoA=;
 b=Td7ZayqIOFK9JHLIbzuVVfz4UKKIFidX3knQRRvBsmSfwRkOpX108Iz9YDdHifixWKMLat6rzH3d1ppvzqVhaK19l1iEcMQMXbsj0ExFjt4nPNEkuJbZzx3o+59OihmP1t8ytJGCR6kU4YLBPiQA6kX97qmJ/1WCqx4dXFfA/Z/aEETOFh1Eh9TvoBRMq0ROQxai3A6sGaRk1AfppbnFBgaQz7SktaUpO/Z44cOuqTsSkVxtb9mLjpms5cJWfsbhknb0CTEfL2DvI33csCHnDGmZdf8Qv1Fs4ARofP8V5okW6MNRutoTF52poQH5sIRjTiDCaAychaWvwSz8k89s1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znWNQ5wEEP6ZjBoXUA0JIiPoWw4cBvfFhgCfSBRtdoA=;
 b=L6EiOCrprOTqHy73VH0fCkpJGlXteb11gWDe61oRiyDdiXmqwOgq/BT+mcAH8S3q7cnVzb2p8NsMeD81ytVF7rmv2BY/lO/QShcgGOaTh1KxejtE5iWBQJ5GKboNOP7tzSunOzvJNYGaLRSs8bqJCAPI9yDvml3tBbv3TvC3cakoNYVk30ITFgZW87Kpht70AJ/B35qrWjvs8bhs6mtgYaDDYtyZ9cCSKEYFfrf8+FowMQihm9kverpAyJ7thV+2bgmNcn6mARkPAV3BLalqTQXvsO/h2SkxUE/a23cR07StGAjQLExVBq+AiHqd0uYiKAypsuW+Nj0jOIVbsoE+2w==
Received: from VI0PR04MB11616.eurprd04.prod.outlook.com
 (2603:10a6:800:302::16) by GV1PR04MB10488.eurprd04.prod.outlook.com
 (2603:10a6:150:1d1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:53:33 +0000
Received: from VI0PR04MB11616.eurprd04.prod.outlook.com
 ([fe80::5fc1:63d5:2b48:5c77]) by VI0PR04MB11616.eurprd04.prod.outlook.com
 ([fe80::5fc1:63d5:2b48:5c77%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:53:33 +0000
From: "S.J. Wang (OSS)" <shengjiu.wang@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "S.J. Wang (OSS)" <shengjiu.wang@oss.nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Thread-Topic: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Thread-Index: AQHdKvCXd7XV1eax3ECtgbVHbR/w1rabj40AgACjXQCAHoKq0A==
Date: Wed, 2 Sep 2026 02:53:32 +0000
Message-ID:
 <VI0PR04MB11616100CFE869E014BA4F712E3B72@VI0PR04MB11616.eurprd04.prod.outlook.com>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-4-shengjiu.wang@oss.nxp.com>
 <20260813070944.C22CF1F000E9@smtp.kernel.org> <an32wu6oTkCAwoe1@SMW015318>
In-Reply-To: <an32wu6oTkCAwoe1@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-02T02:49:52.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB11616:EE_|GV1PR04MB10488:EE_
x-ms-office365-filtering-correlation-id: 594b0a80-222e-403c-e67c-08df089d606c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|18002099003|22082099003|56012099006|3023799007|38070700021|4143699003|11063799006|10067099003|6133799003;
x-microsoft-antispam-message-info:
 keszwhN+gdIDdD8+1DRxG+TrUCtn0+tcyOY/8T/BonyPK7O1B3kkGPreh56dQ7qeAhAs1iSFgNRa0Crw8KS1j4EGun1ErgSzzD+lrXd6Uk4xXctOd4MEcRabYUEM2Bkk/+GuB+Iv2SpnFX4Kdh0WDyggN+x71qPTbQX+mqeWsA1MwhrHmacxVIP4D1rouMhdjh1xmmLyrpwMP52pI3Spu3j1tgA/zUzxcp8ffzg/NA2yvc2nKmqZasUv3mYr2r7fm3k2vLOlfWx4I2A3r5gl4069V/JCjYaVyNJU36+jYE+P30hqriI1KVufv25gxZ+O+4VMmkJ03rnoHLJUL+aDzyYQx9rktO7fPVqOB7PStOwOS/EcCR2X5+CWKNhsLzbfU4E8xgwdYtIoy9Z2w+RRdvLJZ2fvaFqxGgFnwQEEpZypb7tzuRSq3lNqrVOQuv95V2kEgbgi2vn+TV2CFuegPLM8wLSfp0tynGC+LzY6+Ijr8jIj8PVOWAxNm12t4xos8qeYNzdKC/wJoIUrg4tEuUc0UqeGR9z7ROBX1WxjghWL5S5TLciKHh8qrqW3heyqP8F0gUt1K09qSQsdbNuYNfEaYbayS3SLtkIxSm275iBalRc5cseZVyVdHta6fr+UrZsqDA0BLJr1cBsWgx2tU7BmUhfwIcXqQIwW9RRsKjehdNm35/Ndx4soRZm7iv+CZXP3tt2kyWyAGWI3lqIX/hsgVhZDr/wY1YfVnafxHUE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjM1MllNVW1uSzZ1bWx6bSs5cUc0V1RUNEZWOFVLdUVuRTd2SEcyUlBGbXJo?=
 =?utf-8?B?Q3N2MXdIcXRCZVhMUkFteldjLzdKT1p3Z0M4ZjY4Y1pIcEVOd1YxMjhrTWdU?=
 =?utf-8?B?OW1UL1JYaFFRYnRpTVJkbnNtaDl3MjhnQS9FSTBpYWdMOWx1bW9ZRWhlWnFv?=
 =?utf-8?B?MnNMLytRdmtiZmlNb24zQzd4ekZRS2RGNzRkdE5sN0xIcnlVbGY5eWpQc0dw?=
 =?utf-8?B?NUR1Y3pRTUsyR29IcTl4amo3cGZDM0FTdXJMTTE5OVRhZlJSaEU1dHBtY245?=
 =?utf-8?B?b1gvcHpwQUpyK2tmVkdvbFVWVUt2UGxIQlVkWjVwaFBFL3FKaWtyblJpUk1T?=
 =?utf-8?B?b0RWWVkrUWRFNDVPMFpaM1BQTnJSMkVFM2RvMGxQbGhGNkNtK3V0cDI5aXA2?=
 =?utf-8?B?Ly9ueGp6R2VRa0JMOURHQWoyVHVnb2VOMFU2OExDSWIvZ2UvUFdTcWQzcGdE?=
 =?utf-8?B?TGRDNnBkb1VtNTEzVzB2aTJHVHdBT2ZVSndZUEZwamQzeW15TjZkYStPTm53?=
 =?utf-8?B?eklSczkvejEzUExVbjBmVFVFYmdYOGRWNkNmN01PNktSSkxxSVBXRG12OUZJ?=
 =?utf-8?B?eElETkxFaHM3ZEZUNTJ2MmdFczJyREVYMUZRQXdGSjA4QjhvYVU4STVVYUps?=
 =?utf-8?B?bHBKVWFPUnpGR2lNWGJuaU9JQVNIMUtHYWtjalovd3F4SW9PK3p3UEZWSldB?=
 =?utf-8?B?OC8vRmtsbk1WTWd3WE9kSDNRWHdvRkpHRDBuZEFVYWFEcTNaaTY1Q3ZMbE52?=
 =?utf-8?B?d1ZCYnRnbCtRbHdpazQwTDF2dXBMdU9FR082Nm1ZQnAvbEJxVGxYQVVKSFVN?=
 =?utf-8?B?eHB5aWZuMXNZZ00zUTZhVHRwS3pHVjhpSEx0RGY5NFdod29vR21XRnRCdS92?=
 =?utf-8?B?cUR5cExicHlrdERwL09NbkEvYzJoMmdNbDRvNHN1bmNKc3RsMklFaWNVZEl2?=
 =?utf-8?B?Y3lKVVRIRlNEQm1UWEpERitkNW40Slo3cytlL08vektVS2JkU25sNHVqekx4?=
 =?utf-8?B?NjlsS2R6T0Q5MHBPenp5RXcvb0tLemt4Z1R1b2orNEhwZ1FBUHpMc3djaDBF?=
 =?utf-8?B?Rm1XbHZadjJGWU41aFJlS1lJMDNpN1JzL2JDQmh4NFNXTnJiMURPekt5em41?=
 =?utf-8?B?WWs1QkhVUUFBYzdLdGhCcms3ZWpRWDY5dGh3R2hzWDFuYmRXaEtqViszVkJR?=
 =?utf-8?B?dS9lR1czTTlneUt4aHpIZzVnVE9WWkNVQk9ZMGhndjA0NHpvQi9acUxQVDgw?=
 =?utf-8?B?R1FvVHNRaG5SSXc0OTYremR0UEp2RnlLU0NrN1c3a014REhuUzZZTzRPRUNZ?=
 =?utf-8?B?R1Q4bnliRzBBcFVtT1IwQm9tMTgxRXR3dGZKM2RQMnRuaXJ6eE1USkU5QXlp?=
 =?utf-8?B?TXdWM2JkMnlsWGJHdERqcTJPNVBROVQxZDAxRlEzTFFBeFJLRjUwM1VORFFy?=
 =?utf-8?B?cmx6VWFQNnI4eDdpZC9Qc2RPSlBJeHkrdUkzNm9HZzd1N0hRc0J3YXFuSXgv?=
 =?utf-8?B?czI0YzlkQ2ViV1ZmT0c3K2FSaUZtaG9hN242OS9qbzk0OFFqOW5jYWo0cmhh?=
 =?utf-8?B?M0lYSWxMNzRLWi9TRGFIL0VSeTB5emcyRmpZVCtsek9oOWd0TGtqTURrWEZw?=
 =?utf-8?B?YkV1RVRUZkoyTHJyVFFHUUsxcjFBbHY0eFRnSDBydlJWYi9TNlV6aEttbDRk?=
 =?utf-8?B?NlZGVmJERzUvV0VycWJUMUJEcll0RDVLN29veU9XSEdpTFVPWEM0cHlBRTkz?=
 =?utf-8?B?Tm82akUyTUM2bzJoZ01BZmw4Mko1MEVBdjA5Z2FWMUtwSjVCeGU4bDZCeWVo?=
 =?utf-8?B?RFhlaGgxblhRbFZlcXo1ajNNN3g1WmVFYkluaXJocUVjVDNDZXg0bEltSjRE?=
 =?utf-8?B?VWhvTmljcVVkMXZqVC9MVmFyOEZsUGt6NTE5dDlZS3VyUm01Q0d5MWxOU2Zy?=
 =?utf-8?B?em9SUGMzY1pROWc5eHhTSzZZREdIdnJNVXlwMjlLRDVkNXVudERtaFVEVDF1?=
 =?utf-8?B?THI5bUxWMVd6cGc0WTNva1FkbHRIU2FvOFdTK1R1QVNYZHE0cjJLVkpLTnRJ?=
 =?utf-8?B?YmNobExlTStETjlYa21NSERUS2pOSnpzU3E0L0k1TVdOZ2hkRTlFcVk5M0o4?=
 =?utf-8?B?bHA4RnVzVDVRRG1RMk05SjkvaWNVcjQramFKMGU2YllOUXNkeEphemtCc1RC?=
 =?utf-8?B?SkRUaVhESTNwVnRpcEN5RjNZcU9kUjNIWk4yend2cUpWem1kWVNaeURkSXFE?=
 =?utf-8?B?T0p0NnBObi9KVjdvSXYyT1dham1MZnhJTmE5L25DYjlUbzZCTW54NkpVNjVI?=
 =?utf-8?B?cW16eXdpcFVFQ3Q3Rm9rUHI4enNRdkFObDJ6VjJ1TnJocUpOZm1hZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594b0a80-222e-403c-e67c-08df089d606c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 02:53:32.9978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNZupllzLHlRT9snv4ts2P8ufM+RhxVxFKE/VzfdUlIeTHWOe6HskWIoOyg+PMmMd8tMe6zKfH8L675R7PllnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10488

DQoNCg0KTlhQIENvbmZpZGVudGlhbA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBGcmFuayBMaSAoT1NTKSA8ZnJhbmsubGlAb3NzLm54cC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgQXVndXN0IDE0LCAyMDI2IDEyOjU0IEFNDQo+IFRvOiBzYXNoaWtvLXJldmlld3NAbGlzdHMu
bGludXguZGV2DQo+IENjOiBTLkouIFdhbmcgKE9TUykgPHNoZW5naml1LndhbmdAb3NzLm54cC5j
b20+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgRnJhbmsuTGlAa2VybmVsLm9yZzsg
aW14QGxpc3RzLmxpbnV4LmRldjsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy81XSBBU29DOiBmc2xfYXNyYy9mc2xfZWFz
cmM6IG1vdmUgRE1BIHBhcmFtcyBpbnRvDQo+IHBhaXIvY29udGV4dCBzdHJ1Y3QNCj4NCj4gT24g
VGh1LCBBdWcgMTMsIDIwMjYgYXQgMDc6MDk6NDRBTSArMDAwMCwgc2FzaGlrby1ib3RAa2VybmVs
Lm9yZyB3cm90ZToNCj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtv
IEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4g
PiAtIFtDcml0aWNhbF0gVGhlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBgcGFpcmAgaXMgZnJlZWQg
b24gc3RyZWFtIHNodXRkb3duDQo+IHdpdGhvdXQgY2xlYXJpbmcgdGhlIHNoYXJlZCBDUFUgREFJ
J3MgYGRtYV9kYXRhYCBwb2ludGVyLCBsZWF2aW5nIGEgZGFuZ2xpbmcNCj4gcG9pbnRlciB0aGF0
IGxlYWRzIHRvIGEgVXNlLUFmdGVyLUZyZWUgb24gY29uY3VycmVudCBzdHJlYW1zLg0KPiA+IC0g
W0hpZ2hdIFRoZSBwYXRjaCBmYWlscyB0byByZXNvbHZlIGNvbmN1cnJlbnQgc3RyZWFtIGNvcnJ1
cHRpb24gYmVjYXVzZSBpdA0KPiBhc3NpZ25zIHRoZSBwZXItcGFpciBgZG1hX3BhcmFtc2AgdG8g
YSBzaGFyZWQgQ1BVIERBSSwgbWVhbmluZyBjb25jdXJyZW50DQo+IHN0cmVhbXMgb3ZlcndyaXRl
IGVhY2ggb3RoZXIncyBETUEgcGFyYW1ldGVycyBwb2ludGVyLg0KPiA+IC0tDQo+ID4NCj4gPiAt
LS0gUGF0Y2ggWzNdOiBbUEFUQ0ggdjQgMy81XSBBU29DOiBmc2xfYXNyYy9mc2xfZWFzcmM6IG1v
dmUgRE1BDQo+ID4gcGFyYW1zIGludG8gcGFpci9jb250ZXh0IHN0cnVjdCAtLS0gY29tbWl0DQo+
ID4gNmY5ZDI0MGJkNmU5MzkzMjlkZWQwNzM2MGU4ZWYzNjgzNWU2MjkyOQ0KPiA+IEF1dGhvcjog
U2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29tPg0KPiA+DQo+ID4gQVNvQzogZnNs
X2FzcmMvZnNsX2Vhc3JjOiBtb3ZlIERNQSBwYXJhbXMgaW50byBwYWlyL2NvbnRleHQgc3RydWN0
DQo+ID4NCj4gPiBUaGUgc2hhcmVkIGRtYV9wYXJhbXNfdHgvcnggZmllbGRzIGluIHN0cnVjdCBm
c2xfYXNyYyB3ZXJlIGEgc2luZ2xlDQo+ID4gaW5zdGFuY2Ugd3JpdHRlbiBieSBldmVyeSBjb25j
dXJyZW50IGZzbF9hc3JjX2RtYV9od19wYXJhbXMoKSBjYWxsLg0KPiA+IFdpdGggbXVsdGlwbGUg
REFJcyByZWdpc3RlcmVkIChvbmUgcGVyIHBhaXIvY29udGV4dCksIHBhcmFsbGVsIHN0cmVhbQ0K
PiA+IG9wZW4raHdfcGFyYW1zIHJhY2VzIHdvdWxkIGNvcnJ1cHQgYWRkciBhbmQgbWF4YnVyc3Qg
Zm9yIGFsbCBhY3RpdmUNCj4gPiBzdHJlYW1zLg0KPiA+DQo+ID4gRml4IGJ5IG1vdmluZyBkbWFf
cGFyYW1zIGludG8gc3RydWN0IGZzbF9hc3JjX3BhaXIgc28gZWFjaCBwYWlyIG93bnMNCj4gPiBp
dHMgb3duIGNvcHkuIEluaXRpYWxpc2UgdGhlbSBpbiBmc2xfYXNyY19kbWFfc3RhcnR1cCgpIHdo
ZXJlIHRoZSBwYWlyDQo+ID4gaXMgYWxsb2NhdGVkLCB3aGljaCBtYWtlcyB0aGUgcGVyLURBSSBw
cm9iZSBjYWxsYmFja3MgaW4gZnNsX2FzcmMuYw0KPiA+IGFuZCBmc2xfZWFzcmMuYyByZWR1bmRh
bnQ7IHJlbW92ZSB0aG9zZSBhcyB3ZWxsLg0KPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ZzbC9mc2xfYXNyY19kbWEuYw0KPiA+ID4gYi9zb3VuZC9zb2MvZnNsL2ZzbF9hc3JjX2Rt
YS5jIGluZGV4IDJmNjYyYmRmMTRkMDcuLjE1ZjJkY2NjMzU4NDANCj4gPiA+IDEwMDY0NA0KPiA+
ID4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfYXNyY19kbWEuYw0KPiA+ID4gKysrIGIvc291bmQv
c29jL2ZzbC9mc2xfYXNyY19kbWEuYw0KPiA+ID4gQEAgLTM5Miw2ICszOTIsMjAgQEAgc3RhdGlj
IGludCBmc2xfYXNyY19kbWFfc3RhcnR1cChzdHJ1Y3QNCj4gPiA+IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQsDQo+ID4gPg0KPiA+ID4gICBydW50aW1lLT5wcml2YXRlX2RhdGEgPSBwYWly
Ow0KPiA+ID4NCj4gPiA+ICsgLyoNCj4gPiA+ICsgICogUG9pbnQgdGhlIGNwdSBEQUkgZG1hX2Rh
dGEgYXQgdGhlIHBlci1wYWlyIHBhcmFtcyBzbyB0aGF0DQo+ID4gPiArICAqIGNvbmN1cnJlbnQg
aHdfcGFyYW1zIGNhbGxzIG9uIGRpZmZlcmVudCBwYWlycyBlYWNoIHdyaXRlIHRvDQo+ID4gPiAr
ICAqIHRoZWlyIG93biBzdHJ1Y3QgYW5kIGRvIG5vdCByYWNlIG9uIGFkZHIvbWF4YnVyc3QuICBV
c2UgdGhlDQo+ID4gPiArICAqIHBlci1kaXJlY3Rpb24gc2V0dGVycyBzbyB0aGF0IGEgY29uY3Vy
cmVudCBvcGVuIG9mIHRoZSBvdGhlcg0KPiA+ID4gKyAgKiBkaXJlY3Rpb24gb24gdGhlIHNhbWUg
REFJIGRvZXMgbm90IE5VTEwgb3V0IGl0cyBwb2ludGVyLg0KPiA+ID4gKyAgKi8NCj4gPiA+ICsg
aWYgKHR4KQ0KPiA+ID4gKw0KPiAgICAgICBzbmRfc29jX2RhaV9kbWFfZGF0YV9zZXRfcGxheWJh
Y2soc25kX3NvY19ydGRfdG9fY3B1KHJ0ZCwgMCksDQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZwYWlyLT5kbWFfcGFyYW1zKTsNCj4gPiA+ICsgZWxz
ZQ0KPiA+ID4gKw0KPiAgICAgICBzbmRfc29jX2RhaV9kbWFfZGF0YV9zZXRfY2FwdHVyZShzbmRf
c29jX3J0ZF90b19jcHUocnRkLCAwKSwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmcGFpci0+ZG1hX3BhcmFtcyk7DQo+ID4gPiArDQo+ID4NCj4gPiBb
U2V2ZXJpdHk6IEhpZ2hdDQo+ID4gRG9lcyB0aGlzIGFjdHVhbGx5IHJlc29sdmUgdGhlIGNvbmN1
cnJlbnQgc3RyZWFtIGNvcnJ1cHRpb24/DQo+ID4NCj4gPiBJZiB0aGUgZHJpdmVyIHJlZ2lzdGVy
cyBvbmx5IGEgc2luZ2xlIENQVSBEQUksIHdvbid0IG11bHRpcGxlIHN0cmVhbXMNCj4gPiBvcGVu
aW5nIGluIHRoZSBzYW1lIGRpcmVjdGlvbiBhbGwgYXNzaWduIHRoZWlyIHBlci1wYWlyIGBkbWFf
cGFyYW1zYA0KPiA+IHRvIHRoZSBzYW1lIHNoYXJlZCBDUFUgREFJIHBvaW50ZXI/DQo+ID4NCj4g
PiBUaGUgbGFzdCBzdHJlYW0gdG8gb3BlbiB3b3VsZCBvdmVyd3JpdGUgdGhlIHBvaW50ZXIuIFdo
ZW4gY29uY3VycmVudA0KPiA+IHN0cmVhbXMgdGhlbiBjYWxsIGZzbF9hc3JjX2RtYV9od19wYXJh
bXMoKSwgd291bGRuJ3QgdGhleSBhbGwgZmV0Y2gNCj4gPiB0aGlzIHNhbWUgb3ZlcndyaXR0ZW4g
cG9pbnRlciBhbmQgd3JpdGUgdGhlaXIgRE1BIGNvbmZpZ3VyYXRpb25zIGludG8NCj4gPiBhIHNp
bmdsZSBzaGFyZWQgc3RydWN0LCBjb250aW51aW5nIHRvIGNvcnJ1cHQgdGhlIGRhdGE/DQo+ID4N
Cj4gPiBbU2V2ZXJpdHk6IENyaXRpY2FsXQ0KPiA+IENhbiB0aGlzIGFsc28gbGVhZCB0byBhIFVz
ZS1BZnRlci1GcmVlIHdoZW4gc3RyZWFtcyBhcmUgY2xvc2VkPw0KPiA+DQo+ID4gSWYgU3RyZWFt
IEEgb3BlbnMgYW5kIHNldHMgdGhlIHNoYXJlZCBDUFUgREFJIHBvaW50ZXIgdG8gaXRzDQo+ID4g
ZHluYW1pY2FsbHkgYWxsb2NhdGVkIGBwYWlyLT5kbWFfcGFyYW1zYCwgYW5kIHRoZW4gU3RyZWFt
IEIgb3BlbnMNCj4gPiBjb25jdXJyZW50bHkgYW5kIG92ZXJ3cml0ZXMgdGhlIHNoYXJlZCBwb2lu
dGVyIHdpdGggaXRzIG93biBgcGFpci0NCj4gPmRtYV9wYXJhbXNgOg0KPiA+DQo+ID4gSWYgU3Ry
ZWFtIEIgdGhlbiBjbG9zZXMgYW5kIGZyZWVzIGl0cyBgcGFpcmAgc3RydWN0IHZpYSBrZnJlZSgp
IGluDQo+ID4gZnNsX2FzcmNfZG1hX3NodXRkb3duKCksIHRoZSBwb2ludGVyIGluIHRoZSBzaGFy
ZWQgQ1BVIERBSSBpcyBsZWZ0DQo+IGRhbmdsaW5nLg0KPiA+DQo+ID4gSWYgU3RyZWFtIEEgdGhl
biBwcm9jZWVkcyB0byBmc2xfYXNyY19kbWFfaHdfcGFyYW1zKCkgYW5kIGNhbGxzDQo+ID4gc25k
X3NvY19kYWlfZ2V0X2RtYV9kYXRhKCksIHdvbid0IGl0IGZldGNoIHRoZSBkYW5nbGluZyBwb2lu
dGVyIGFuZA0KPiA+IHdyaXRlIGBhZGRyYCBhbmQgYG1heGJ1cnN0YCBpbnRvIGZyZWVkIG1lbW9y
eT8NCj4NCj4NCj4gUGxlYXNlIGRvdWJsZSBjaGVjayB0aGlzLg0KDQpVc2UgdmVybyBjb2RlciBm
b3IgaGVscCB0byBhbmFseXplIHRoZSBjb21tZW50czoNCg0KVGhlIHR3byBTYXNoaWtvIGZpbmRp
bmdzIGFyZSBub3QgdmFsaWQgYnVncyB3aXRoIHRoaXMgcGF0Y2ggYXMgYXBwbGllZCB0bw0KdGhl
IGN1cnJlbnQgZHJpdmVyLiBCb3RoIGFuYWx5c2VzIGFyZSBiYXNlZCBvbiB0aGUgaW5jb3JyZWN0
IGFzc3VtcHRpb24NCnRoYXQgYWxsIGNvbmN1cnJlbnQgc3RyZWFtcyBzaGFyZSBhIHNpbmdsZSBD
UFUgREFJLiBUaGUgZHJpdmVyIHJlZ2lzdGVycw0Kb25lIERBSSBwZXIgQVNSQyBwYWlyOyBgc25k
X3NvY19ydGRfdG9fY3B1KHJ0ZCwgMClgIGluIHN0YXJ0dXAvaHdfcGFyYW1zDQpyZXNvbHZlcyB0
byB0aGUgcGFpci1zcGVjaWZpYyBEQUksIHNvIHRoZXJlIGlzIG5vIGNyb3NzLXN0cmVhbSBwb2lu
dGVyIGFsaWFzaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClNoZW5naml1IFdhbmcNCg==
