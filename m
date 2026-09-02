Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904539936E;
	Wed,  2 Sep 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337194; cv=fail; b=XaxXlK+widFcvGNtJAOAE7P+qMFDbCljqTMcdAvHKiQQoo4ECD4QJdv9CpeF/D6Ixiit5TcfgTfQnzorBKkARoMyBBo/FlVnGWRLHtNRvyEVPm5YctHtzdW51qUBNvu06KO5mxo8u1f2aiDplwNcMkrFV9SDXUlsa5w6gEkTxoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337194; c=relaxed/simple;
	bh=GPkiRB+EbOWzRhsgA4V/F6c/rNygPh6+2din9rImv3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HPS590xS5BlWnrUDbc0Spe4L8CT9dDWthTXN/oqBrk2u3Q3nI0hmmmIEi2F24/mqP1ZwCE04WJ1on7Otml29KOoSw8s4+x4XJSNyhXD3ULOPf2gA34FnI98DEu+iUYbiGPArPgRX4VdJpVTesDl/UJ27LdQrqNkcUs2NkWXJvas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=HoC0+5Sp; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="HoC0+5Sp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGSmyV6082WiUuhxlqS+SlN6yP7CRhoQB/hb+LmSRGE1sYU8JkkHFKIksEER8msC8lJ8WHVbpf2CB2+WECdk/lE43EgqGimMQSHcXjUhIoYheOGLbAnE6v0s4g33lafkiLWy/xKZvdO5MLQGdjYuEfiZn9cZJyyEE6G/lXBGreyBx/LTYAzhJdkpS6AclyFF1ySX6VMyw3SZm9LPCCKy/kQ1VC/Hvl+Tgu+q5UbiZv2LUjt0CHmpr3/lemWiKOpWa20flUnDWWiakoxtspcRu+U6VKSm3c5SbId5KvULw2LWwJBNmRYtOxEeJdo8Frxb0fYrfrFpkrja2NGOYh3qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPkiRB+EbOWzRhsgA4V/F6c/rNygPh6+2din9rImv3s=;
 b=tGpM0K45LrJVBVDZVH072/3Yt2t8zirMeLgbBW53bWSU1vWMXTalX1vaQY0X6jsz9R+FnYRkv9L13y9vg7zaJqG2ea172tZ9PxME+YqWV3SHJaQOczZ7aGdWhu/Liwz7roI76K6lp9Iv/1eqNL5Aj84idP82okehbEkM11n4YBD1tz+vV3G8o5wHrIJiQwVH/TRY+Gp2jUURiBOyIMQPPjyfOTNy9dIlK+6xayO8fpOcrEyREIHxCaQV5SAOrxXAWCyqr2/rnINozmqGEkSSEtBAXwVc8zXCJBu7sIrtFx4bhqdJ7B3sxSt+wHFe1IM+npLU/txJK9sUM/hvySPujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkiRB+EbOWzRhsgA4V/F6c/rNygPh6+2din9rImv3s=;
 b=HoC0+5SpqWOkDDnCilQz0HNUGU4RxaIXQpnEWK4cSViQdlf+ZCZnC2sYVjHD1mxW6hByUK7pXx0RvBX19zMvz73lD9PatYfqo0ZehsSh1BLzAAs89tZemrwXN27TPUZ65BCWfy5/LCDYJENU1FJ9V+iS2AH7j9lrYnBpx427thsZQm3rWxmZt6/uJ38yQ0M0HTYpaP6dxkV2DQupvsCe3xQzHbbtW67wKHV4FdJ9qWh/v25UvPQKt3BbmnT2AIPkYN7l9h9QOraRg7xmf/9ZtSlxh+H6NJ7trVq8FCbsvYuQxVDzuPbWAlNtn4l9rtu7Z5GmSJ7FaCuA7l6L/AWd2Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB8496.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 08:19:48 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:19:48 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: Re: [PATCH net-next v2] net: fec: support RX flushing via an ethtool
 private flag
Thread-Topic: [PATCH net-next v2] net: fec: support RX flushing via an ethtool
 private flag
Thread-Index: AQHdOeYqnRmLamjoCkyBNo2G2rNE1ba66u6AgAAI54A=
Date: Wed, 2 Sep 2026 08:19:48 +0000
Message-ID: <af37e5b2ecf2010bd063f3ccbe2d17b9bba13060.camel@siemens.com>
References: <20260901074732.113791-1-alexander.sverdlin@siemens.com>
	 <20260902074756.1AFC01F000E9@smtp.kernel.org>
In-Reply-To: <20260902074756.1AFC01F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB8496:EE_
x-ms-office365-filtering-correlation-id: 8b517bc7-bf93-4fe9-6410-08df08caf46b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|4143699003|10067099003|56012099006|6133799003|18002099003|55112099003|22082099003;
x-microsoft-antispam-message-info:
 WNlb8sEiYYNlV3v41v2MGUdXa1d+DvA+Q1gwV9rutMRUl9XOBQrB3MC7+f/vFsnkitEdy6d689Gm9Zmp0SbX0MjuPOGloJZ4fYo3q7tMKsJz4oyteOdqvq9voh81dcjIJHz25MWaKOpVGNGqGUWNXNg5l0I5CiNHj2x+VlXggDgXCp5KH2luD0oqQwfDFeh9LiXsFPxEK0OZvn4Z+T5L4mljMTPFBs1svxNIp4B7CE0xnSvsWxETiuXfRpxnP0VfwGDETrvSIypFpclIHO6YncmHBgovF7dSBymI4PKlwcbg1FAw0A7j/ubf5bpVN3nt74Nb0JhmLjHn/KXaNaRBTrLvSyrfXxbAQFTekg5UUj3np1iPmfOvMQqZ6V3Vg4715UlFIE5T3YKdi2ZDOdNJgdlVGhf9rLGnW+nkmEEM07rjoeTL709TA6lI/utpqaXFGZTMak+ozH4raJWmO2ZILJTdN+isxrqv+AtDfQHv2T0A862r5HXi3Ofcsb9maiK48UlA0Q+MGvdkNcrGaaq7F5Sk/tXth25ddKIGWsVYOqiKYmgZmuufjEeGMINCum4ErGk+WAXl/xLkpAyykwXH+znWmAuYEnapIsKFaHIivkc4b5QnN/yCHRXXnrLavZOsa5/1nLOa8kHZcSQFJzfiJ59/CmpiRTrwk/7sb7nqktw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkF5R3duRHdLalYvM21PMWpwWThFanVvSUZtUThtUXZxbjFxQytmcHJRNnFs?=
 =?utf-8?B?RFZ0c09nZ2JVVGJaWFdab2xZblRUYVNCUzR3ZUZtR2pPbU1FeEZuUFhhM1dE?=
 =?utf-8?B?TnJ6aVlWcGwybFFLWUFyT0JKY1RKNEhkeExRSmozRWFOVVFCdGcxdWlBeEs1?=
 =?utf-8?B?QUFuSmVNZ0czN2wvOU84ZEpuRFc0b2wzbHVOOGlIblpPSG50bUJBMEQyWXI0?=
 =?utf-8?B?RVFybE05Z1lKR1RCM3l3WUxMakhYaEl2c1EyMHlNNi9nZWFwbm0xLzg2Z3pX?=
 =?utf-8?B?N1k1VGN2bVhOSndSK0pHajF0V1NxeTlVRnNuNEtacm1EUjkzWU85RWVMenVi?=
 =?utf-8?B?R0ZvZWJhWkpNNCtPYklVQjVJS3ZVY3AvUHFUbmNydnRUMVduQjVHTXA5aHB3?=
 =?utf-8?B?Y0kzS3FLTUhTMUxTdmhkNHBONEZnamc2ekpVWmdJSktxZHd5eEdNRDZXTzFj?=
 =?utf-8?B?d0gyODZZZ05GUit1OEcrOE1RQXNnUC9tamJta3hISkErWVdDeE1DRThRMEN0?=
 =?utf-8?B?Zk8vcko3dlNNamNKNW8wcmNpcExkRE5iSlNCcFlXZGg4MUIzQVMvR0Y4UW96?=
 =?utf-8?B?VVBSTEk5anZBU0dFU2xNNFBGWld5NEgzYTlZeUFKWHVWOFJCblBnYy9Oc3No?=
 =?utf-8?B?Qm1EbmJWejZDNXR3bC9sRmtSTGoxYi9Bd2NKMTJTU25acWR2MEk2MG5GY0xj?=
 =?utf-8?B?L0FJMnJvd2tOVm5VNGRSL1haYy9sQk55SWVEd2lzclRhVGJQUWxjaWpodXNR?=
 =?utf-8?B?bzFtOGtCYkl1Y2FPZTd0MHhucC84eFdQeFk4R3IvbTV1RmMzc2swNEc1bDRW?=
 =?utf-8?B?UVhFU2xsTDFtR3BvSUlUK08zNGRxR0NBVkhsTVBtY0FQY3Ntb092UkNBYWJ1?=
 =?utf-8?B?RzA3UG9GSkJ1MjRuYXdpMXdzaTlmeTRZQXMwY0xJa0VvdWJNcW5PUDBjSTRB?=
 =?utf-8?B?azJ2cFZVbGxVZWsrR3NyckFOTTlXUmh4WjQrcm81RWpMOUIxQ1N6WnlybGcw?=
 =?utf-8?B?NkRlTlNjVTJ2ZjFmbHVQMkpIMEZMZWM3bjd6UG9OcDVkaWl2cGFLV1hkYmIy?=
 =?utf-8?B?cTJyQjY0aWE0QTcrZnRlY2x0UGorQXpUVmZCVThuallMU29oUlVPeVNMVUg1?=
 =?utf-8?B?czl0a2NZY0pIUGluVjVDTERHVzV5Vm4xTFRoNXNMODhrbW1SUFVhaG9EanNC?=
 =?utf-8?B?MW1kaHRRMmFSN25rZVBYb3A2b0tka2tYU0REWVMzcDBaYkhDYTNiRnhBRWRm?=
 =?utf-8?B?UUFMdjdQM2FJWjFuTStCd292Q0ZGRzFVdHZrWXA0dnYweGxENWcySG5qV2hW?=
 =?utf-8?B?bVRuTTg2UDBlaGZoMndtZkhpUEs3ejBTbU5mb0RoZ0dOZjJyVkhVQ2F1YU40?=
 =?utf-8?B?NG1hQ1R1c21UOGVtSXh2dVZ1UTVSZjNXQnhjSUFvUlkxVTNrWUVCV2pTZzFJ?=
 =?utf-8?B?UUduc01TaXh5bWV5ZFZVU1d1aUV0WFJqS2hCY3lSUzMrOVBJam5ZZVJXeElI?=
 =?utf-8?B?R2hCOTNGU1dGNFRablJWQjFvbUhndWZNUTZsY2FUcVE5dFlmSjM3aXRoT3lp?=
 =?utf-8?B?cGh2WnlsSHRqcnFlTlBwWkhVb2dvbmNIbW4wNTFJak56SW55Zlh5dGlzbjhD?=
 =?utf-8?B?Y0RVRmtkbzlBaU1XWGVXVTJpZ1ZGdlRmTGJjMjVOeUp0a045SVFpZk90cUJm?=
 =?utf-8?B?WFliZm8wWVQzVHBBZDBtWmJTZHFDRUtEZmZ3M0JMZjlWbkdza0dLRE5LdXlN?=
 =?utf-8?B?YVprKzJYVjhXdFE1VTl5RUg3VDV6YmtCT0FxQ0VkNFZDNFBicEU2SnVoeXNB?=
 =?utf-8?B?eW53ZkkyNXltNTRQZVJaOUlxeHp4Z3RRMHdFRjZKb3RIclJtRjF6NlhEeEZU?=
 =?utf-8?B?ZU1sZk9IWWhMRDdRZHgyMkIrU2RsVWw2dFV6Z1N4RmZxOTgyV0wyNFd2YVlw?=
 =?utf-8?B?b0RGQnBWZUlrUXpJaUd6WExYMFJsdFU4U0REU3VsR1A4alMrell4Y3ZHcHln?=
 =?utf-8?B?ZmNKQkRtQ0Nlbk5BZkNEWW4xam1IbzNxL3hJNTN5V1Z4US84RVN2Q2U4OVZv?=
 =?utf-8?B?NDRKNnFmbUZKSUNBdmk3azNqUENkcE10d1BqLzk1QklxeVdZaTM4Y3FNN3d4?=
 =?utf-8?B?TG93NUV5RGFkbFJKTkg4K3JDV282RHo3K2dpVjNMek8yYU9lZzF1K0dRZG5R?=
 =?utf-8?B?QTdZWU5SR1RrUkkrbVRrd0NhTXZleEsyQjlmY2NKdldJQXdVQ2xTbTJuQkNG?=
 =?utf-8?B?RENUQ3JBTnA2QlRmRklpdXRCMzk5UU1ja0pHKzN1QUg5UzZPZUFyNXduWXR1?=
 =?utf-8?B?ZUM3NkpvS2pJazZDMDU4RzN4dXVsWXJacG1vNVBOcWdOQzFCRDRhb0lnNU51?=
 =?utf-8?Q?qPd9QUxWgyJmnOto=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE7075980B04A34189D5A0B2123D7A46@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b517bc7-bf93-4fe9-6410-08df08caf46b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:19:48.6511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZxIbhD39vvVhsjaD4QJkA37z8UFEtxKs/H1L4xBv6pWpMcz/+LJJ6+ldIcP7+1of99T2bAphMoovQBZErHwKnJ37D7R15YvfFB0yQeQxbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8496

T24gV2VkLCAyMDI2LTA5LTAyIGF0IDA3OjQ3ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0g
ZmVjX2VuZXRfZ2V0X3NzZXRfY291bnQoKSB0cmlnZ2VycyBXQVJOX09OX09OQ0UgYnkgcmV0dXJu
aW5nIDAgaW5zdGVhZCBvZiAtRU9QTk9UU1VQUCBmb3IgRVRIX1NTX1BSSVZfRkxBR1Mgb24gdW5z
dXBwb3J0ZWQgaGFyZHdhcmUuDQo+IC0gW01lZGl1bV0gRGF0YSByYWNlIG9uIGZlcC0+cnhfZmx1
c2hfbWFzayBkdWUgdG8gbG9ja2xlc3Mgd3JpdGUgaW4gZmVjX2VuZXRfc2V0X3ByaXZfZmxhZ3Mo
KS4NCg0KQUNLOiBib3RoIHdpbGwgYmUgZml4ZWQgaW4gdjMNCg0KPiBjb21taXQgMDc3OWNhZWIz
NmYwM2I3MDEwOGVmZmVlYzA3YjdjZDYwNTVmNTNmNA0KPiBBdXRob3I6IEFsZXhhbmRlciBTdmVy
ZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiANCj4gbmV0OiBmZWM6IHN1
cHBvcnQgUlggZmx1c2hpbmcgdmlhIGFuIGV0aHRvb2wgcHJpdmF0ZSBmbGFnDQo+IA0KPiBUaGlz
IGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIGZsdXNoaW5nIHRoZSBSWCBGSUZPIG9mIGFuIGluZGl2
aWR1YWwgcmVjZWl2ZQ0KPiBxdWV1ZSB2aWEgYW4gZXRodG9vbCBwcml2YXRlIGZsYWcuIEl0IGV4
cG9zZXMgYSBwZXItcXVldWUgcngtZmx1c2gtcU4gY2FwYWJpbGl0eQ0KPiBmb3IgY29udHJvbGxl
cnMgd2l0aCB0aGUgRkVDX1FVSVJLX0hBU19NVUxUSV9RVUVVRVMgcXVpcmsuDQo+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfbWFpbi5jDQo+ID4gaW5kZXggNzk0ZWM0
MjdiMGVlNi4uZTVjMWQwNGE2NjVjNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2ZyZWVzY2FsZS9mZWNfbWFpbi5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtMzU3NiwxMSArMzYwMyw2
NyBAQCBzdGF0aWMgaW50IGZlY19lbmV0X2dldF9zc2V0X2NvdW50KHN0cnVjdCBuZXRfZGV2aWNl
ICpkZXYsIGludCBzc2V0KQ0KPiA+IMKgIA0KPiA+IMKgwqAJY2FzZSBFVEhfU1NfVEVTVDoNCj4g
PiDCoMKgCQlyZXR1cm4gbmV0X3NlbGZ0ZXN0X2dldF9jb3VudCgpOw0KPiA+ICsJY2FzZSBFVEhf
U1NfUFJJVl9GTEFHUzoNCj4gPiArCQlpZiAoZmVwLT5xdWlya3MgJiBGRUNfUVVJUktfSEFTX01V
TFRJX1FVRVVFUykNCj4gPiArCQkJcmV0dXJuIG1pbihmZXAtPm51bV9yeF9xdWV1ZXMsIGZlcC0+
bnVtX3R4X3F1ZXVlcyk7DQo+ID4gKwkJcmV0dXJuIDA7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IFNob3VsZCB0aGlzIHJldHVybiAtRU9QTk9UU1VQUCBpbnN0ZWFkIG9mIDAgd2hlbiB0aGUg
aGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0DQo+IG11bHRpLXF1ZXVlcz8gUmV0dXJuaW5nIDAgZm9y
IHVuc3VwcG9ydGVkIHByaXZhdGUgZmxhZ3MgdmlvbGF0ZXMgdGhlIGV0aHRvb2wgQVBJDQo+IGNv
bnRyYWN0IGFuZCBjYW4gdHJpZ2dlciBhIFdBUk5fT05fT05DRSghcmV0KSBpbiBldGh0b29sX2dl
dF9zdHJpbmdzKCkuDQo+IA0KPiA+IMKgwqAJZGVmYXVsdDoNCj4gPiDCoMKgCQlyZXR1cm4gLUVP
UE5PVFNVUFA7DQo+ID4gwqDCoAl9DQo+ID4gwqAgfQ0KPiBbIC4uLiBdDQo+ID4gK3N0YXRpYyBp
bnQgZmVjX2VuZXRfc2V0X3ByaXZfZmxhZ3Moc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsIHUzMiBm
bGFncykNCj4gPiArew0KPiA+ICsJc3RydWN0IGZlY19lbmV0X3ByaXZhdGUgKmZlcCA9IG5ldGRl
dl9wcml2KG5kZXYpOw0KPiA+ICsJdTMyIG1hc2sgPSAwOw0KPiA+ICsJaW50IGk7DQo+IFsgLi4u
IF0NCj4gPiArCWZvciAoaSA9IDA7IGkgPCBmZXAtPm51bV9yeF9xdWV1ZXM7IGkrKykNCj4gPiAr
CQlpZiAoZmxhZ3MgJiBCSVQoaSkpDQo+ID4gKwkJCW1hc2sgfD0gUU9TX1JYX0ZMVVNIKGkpOw0K
PiA+ICsNCj4gPiArCWlmIChtYXNrID09IGZlcC0+cnhfZmx1c2hfbWFzaykNCj4gPiArCQlyZXR1
cm4gMDsNCj4gPiArDQo+ID4gKwlmZXAtPnJ4X2ZsdXNoX21hc2sgPSBtYXNrOw0KPiANCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyBhc3NpZ25tZW50IG5lZWQgdG8gYmUgcHJvdGVj
dGVkIGJ5IGZlcC0+cW9zX2xvY2s/DQo+IA0KPiBJdCBhcHBlYXJzIGZlcC0+cnhfZmx1c2hfbWFz
ayBpcyByZWFkIGNvbmN1cnJlbnRseSB1bmRlciBmZXAtPnFvc19sb2NrIGluDQo+IGZlY19lbmV0
X3NldF9yeF9mbHVzaCgpOg0KPiANCj4gCWd1YXJkKHNwaW5sb2NrKSgmZmVwLT5xb3NfbG9jayk7
DQo+IAl2YWwgPSByZWFkbChmZXAtPmh3cCArIEZFQ19RT1NfU0NIRU1FKTsNCj4gCXZhbCAmPSB+
UU9TX1JYX0ZMVVNIX01BU0s7DQo+IAl3cml0ZWwodmFsIHwgZmVwLT5yeF9mbHVzaF9tYXNrLCBm
ZXAtPmh3cCArIEZFQ19RT1NfU0NIRU1FKTsNCj4gDQo+IENvdWxkIHRoaXMgbG9ja2xlc3Mgd3Jp
dGUgbGVhZCB0byBhIGRhdGEgcmFjZSBpZiB1c2Vyc3BhY2UgbW9kaWZpZXMgdGhlIGZsYWdzDQo+
IHdoaWxlIHRoZSBQSFkgc3RhdGUgbWFjaGluZSBhZGp1c3RzIHRoZSBsaW5rIGluIHRoZSBiYWNr
Z3JvdW5kPw0KPiANCj4gPiArDQo+ID4gKwlpZiAoIW5ldGlmX3J1bm5pbmcobmRldikpDQo+ID4g
KwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJZmVjX2VuZXRfc2V0X3J4X2ZsdXNoKGZlcCk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4N
ClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
