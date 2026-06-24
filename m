Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19E194A6C;
	Wed, 24 Jun 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296172; cv=fail; b=BDPyaodrB20FkqXHIhQsqabtIf8h5yDsDxoyd91jynI+meBQa7YtfiwhaTUavDj0xp6gsZ45eotf+iPOMmmoOJKRUfPqPcLffh2vIXu4vysVHmQl7kCbqN0GUP8b9cxYHteJrndj8fF60qbD95vcPe6OV6abfIXmrVNIwPEERdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296172; c=relaxed/simple;
	bh=KwpzM4+tE4lF5mPjfj8U/3s8whVCnp21NO0thOeUS18=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZeZ9Z7DFfrnKj3dsE2x2KuJxlfXVzuKXbV37QtpoLD6WUYLOKkTjs5dornXw5onTHCHzYU8kINxHCukC5FLzRn/0VMFG/V5sJjA1KZxt3/mdheohK1Bnh3teMHlhP+3NHa3hXQs60oX7NHemKmdG790Nwdi7V+ZPfWdc5DGYZQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CPTbxquB; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CPTbxquB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWnkl/PR7X484ZmhAOVnqc5AXmGFTFji5iYgUzhulinziLbflUZmMgt+i9XpQA4eg9gKEwCRC74/2s48XMw3K8uMRwvJGnbrmhoi6WcObLI0i3kjMerCpUaPmGfPS0e6lT3ItPIMThhgJUb2O/zupikbnJqcYv4HaylKJ97ULr5H+FQ/8tNy51PLFJLrA2LrjMJa1l6ddtRRdknJ+XOAOxZUEeUkFlve5Pus+6RUSj5OIMywxo9eZRRRTIi8oqb6j5OXaeQVtnWxv0jG/YyP3HeExlfxq6JCDEfUGEskF9jUPmJY1QcACcN4tIGeWzd1Du6gAe7ofzM5fsB6pwIRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwpzM4+tE4lF5mPjfj8U/3s8whVCnp21NO0thOeUS18=;
 b=kK2P7r735go1JR9NFt1wwt79aCNZzOd1BqQnqIi1rpzBJTviuCljsjol/dQke1+n0HCUpIfAvCsao7jhjQ1LYTdGtqyesc16PfeUQeTIsXLUp8S3UUD39AppkKEg6p06/o2ZPsRkdJ2FpY4tc4tHnu7jfBBslWbo/6s8nxSMTLCkR4gZS86oXwdrbWOrgQaSmplwNx9PACXPmtVFZOrCJ51ewAhy6BmeueJKiUvPvXLtKkgs6zl6ssPrCVVI5pHQunVQuyLz7eMxBPsXKILV8eWW9t74/Ks2kC6VNkI0hT95V8eA4q7DBNiRH/AIJnMQZXuUJB+gEoHwgcb6ld/hJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwpzM4+tE4lF5mPjfj8U/3s8whVCnp21NO0thOeUS18=;
 b=CPTbxquBHdblfZ7N3o80NbBJ9imJ+jSzotccjVADQWR4F7AQlGXAsPv8Q4tBklJFemQniItdS+tr9Z1s0+/PCQzYpARJdeiG7fulAUYMpKKl3d9xYYR4a/EMrB/LbX5d4bDmEeLvduQo1KVvrBGi2OSHvZJSdgkB924k/QeMTdV1qhzyUl56sCjmPugpf3i/dSllVONnOPr1v9knM9mkycdhDNh5AfCaVzQEW37T9/G+bk1JDc3e/MCcD9NWVgYbV8R7WyFE7srShW8lsNsjwxu9ixiVZZPQb1BYpQu7Re3CFSSw4G7eu+XcuVFm2igUsy8P6O1aAzk+WZ2z9jfnpg==
Received: from AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 by GV1PR04MB10749.eurprd04.prod.outlook.com (2603:10a6:150:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:16:03 +0000
Received: from AM7PR04MB6870.eurprd04.prod.outlook.com
 ([fe80::f080:2b31:578e:716f]) by AM7PR04MB6870.eurprd04.prod.outlook.com
 ([fe80::f080:2b31:578e:716f%5]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 10:16:03 +0000
From: "Luke Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Luke
 Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 3/4] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Thread-Topic: [PATCH 3/4] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Thread-Index: AQHdA8J28DijTttY4k6F7mdqFYtJPg==
Date: Wed, 24 Jun 2026 10:16:03 +0000
Message-ID:
 <AM7PR04MB6870A7DC0C98AD8B1E768ADCEDED2@AM7PR04MB6870.eurprd04.prod.outlook.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
 <20260623073515.2658205-4-ziniu.wang_1@oss.nxp.com>
 <20260623074742.C3E691F000E9@smtp.kernel.org>
In-Reply-To: <20260623074742.C3E691F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB6870:EE_|GV1PR04MB10749:EE_
x-ms-office365-filtering-correlation-id: 7350c1d1-f7ca-4796-82c1-08ded1d998e8
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|3023799007|11063799006|56012099006|6133799003|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 /yfYg1fluAI1R5+aZETb7ubkaIowpWqXVksSsTeMMvJ2sYfOh8L+5mtMHhDgSIZlP41A9qdP5oSuQm8iiMv8lPdg8wbFdJRvFGKLhh0eBomxkPFNBDmbGeeF+7l3u0a18rWVPJAX0rjKvk9741MM9LktBjCirfTr+zONgMu+ZyxK5E8xaNDCWMjojFT/fDrCyUOGuFj6gOBOUezoo1i77LSW5KLH5fQhtpAuGK4Zn0bhKin4vW0zhp+2pKkDMVeeW7fHtqXSw5OCU/2Kje1G1xtl3F6avOzjqgssqKxPsxcc10SD/bqi+FDgxK687xR3eUU+0JXPRUmZ07DEQg5iBOn+169XQ/f/6zPn/Tihh9DDt8xi0Cu02Nk81kGzNR1D5hehGMgbRfKgRkvYlm4lk7en22GryLhYVKdavFD2/gKTdAnirwujw2DO4wfAHnEBnteIjN/w7eScvX/RYAF/UI7ZKY7xmby9GmjMvHbXqyCIsKeMp1PbihR7R21PhwGka45hkDwik4MF1MKNuBxXfc/t5DcPWmMLyFDpkI/Mlf5EbX7qkLXlfeFqzbmYA98IFc/vl00d5zDZgy6K6hC3bP8jd176zLdvXRu0vvvJuoDTX8Bfg0QW9KQBqhdICc1uKpHsfQfkddZZ8epSKmwwxQSnIHXxrU2XkL7ydmAVN1c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB6870.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(3023799007)(11063799006)(56012099006)(6133799003)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEFQSjMxQzlsL1kvZTVpTjNldVlBMXFUTDFMektBSXRZa1JVNU9xTFpzRTNz?=
 =?utf-8?B?eTA3aDRNb2o1bndUS3oyMzdITjBvTW1TSS84REI4QkkrSDhNQ24xNHd4Wngr?=
 =?utf-8?B?RnFnbE1INUVYT1JBMCtveFVNSUFTOWRiL1BrMS9RUTRXZ0VDYTRPdzVSNXdn?=
 =?utf-8?B?ak9BRWJ6NW50LzJXK1FsRi9sR01RVWhoZGljQXRyc3gwZkhLbllNYW5IVHdk?=
 =?utf-8?B?bk1IN3NkV1cxV0Nac29MWTZmVVRVVVZRU1cwbG02WmpUM3JibkFRWVQrVGlF?=
 =?utf-8?B?M1Jsd1BnSklzL0IyOXJRUldVVFF6Tmk3Wk45N2YvbkVLanA4V3dzNmN5TnR4?=
 =?utf-8?B?Zlpzb1lYcEZwK003NEFmU2RwVm0zYUVWVks0L25FR0dKNXRJa1g2cmk5SmQ3?=
 =?utf-8?B?K1U2SHpaVEt5QXB5ZkVTbHowM3orc1lyN1N0Z2VzWWNaaVVPRnVBZVpRN0tG?=
 =?utf-8?B?VWR1STBvQ1VVQkRCcnVEUVQ4ejVZcWk1WlFiZVUwWDlzZUFneE1XandCRGFi?=
 =?utf-8?B?WWZCMDhPTlpadlBzWjkzU01aRFIrYmUveHp6ckNSY0ZVMjFQNGNlQzk5ZUVy?=
 =?utf-8?B?UjQwQlAzczR1cEpSck02ZlVsd3FXMGJnNTR6eHZqUHpxNk5DR0xZeVUrRi9F?=
 =?utf-8?B?NjB6N0lEaldXZ0hrcU8yemxIMFNiMWNSbWxPSURZUU5qTzc1a2ttZ01BWHJP?=
 =?utf-8?B?Qk5WUm5aMGxHWmxRaG4yL3VQdGJoOW5tWUZaUFVGdmJhMEc3TTlvR3duZUE0?=
 =?utf-8?B?STUzdVZ0OWl2dUZFKy80MkpSNlZXb1o5aG9VeEllMXFMRm83VElGWVN5RlE3?=
 =?utf-8?B?Q2h1b0dnMFRzRldMbFplZmFMVnZrS1BnUUpQUXdOTHBRMUhzWU5yUGZOS1pl?=
 =?utf-8?B?Uk05SGJHZ3lYc3lxYVVWMzk4Z0piZktka2RKdmVnVlZ4Mi9yOEJxUDVMTzZR?=
 =?utf-8?B?ZzJPWDNtZWFibElTYXozK0VtUTlnU0dWU3I5c25QcHVCcjlnV080YVNqYm1S?=
 =?utf-8?B?VkJzbmY5YWd6dU0wZm40aGdPSllCbjc2RE5OL2pUTDhXRCs4ZTNPVlM4ZlM3?=
 =?utf-8?B?SWVKODEzWWdFdE1zZWp1MGorY2FDUFE2bnhzTTAxWnI5SE9wMDNQb2kwV3FD?=
 =?utf-8?B?MHRkZ21CZC9FNy9VSFM5V0kwbUQzYWFhMVdzRlZqM2pJRXBQRjdsSWVEQVJj?=
 =?utf-8?B?VHk0WnA5RkRBQWVneGJhVXRDTnpvVktzeGk4YXh4eEMvM3ovL1hzZWZyWlZJ?=
 =?utf-8?B?VzROS21wT0pTekhhQUk3ZDlLK0RBdHY4cUVpYVNlbkdYQzJLUGo1NzEzSVJv?=
 =?utf-8?B?QlA2VENySHpDejBmQVdQWkswOXRWUVgzOFNOaWRTQkd3K1JISUVBS0Zjb3lT?=
 =?utf-8?B?TSt6cmFucVh4YVB5dyttK0pHUVh0SDVnckpoV1lMclJ1dlVvNE1XMDFIcjR4?=
 =?utf-8?B?b3lVUXpwWGhHc3pRb3FjenZHbWZpSUpaKzlUNUJha0RLenFKcGFOZTBDZWo5?=
 =?utf-8?B?Ky9uaHdneUxHaG5RU2V5Z3hVMVNNUk9NMlk2Rm5oQWNLV0xmZVp4U1NSZDhs?=
 =?utf-8?B?bjUvY2ZXald2TnlrSkpJM3BUYklVU3Z0QytESTdLbEtDUW0zdXdOeVg5dWdp?=
 =?utf-8?B?a281TlVBTmVJZDdJeXNCKzJVUlUxM2pBV29xb2NXWHl1TkJOM1U5cjR5aFo2?=
 =?utf-8?B?RVFNVnc5Tld1VUh2RjArYXc4R1BOUmJ6T0FlMEQ0am9OV2FISlY3SHdENzYy?=
 =?utf-8?B?bzRxT3IvS1YxZGtXRnV1ajk5NDg5azZ6YmUxbDVIandwcjRPODYvZGhOUE51?=
 =?utf-8?B?NE9EWDc5UjBRVm9yZ3BtdTJhK052UjBRUGxlYWpLQS92b084bzMyUjlNdmJT?=
 =?utf-8?B?S3JjMFE0ZTA0WG9KTTBZNlVZTk41a0dDaTZqM1VKaUZEMEF0YU1pUUJEbjg4?=
 =?utf-8?B?dHlRSGcvMU1EVEZsbHFmbUFFeXpRNXJJNEZqVXVRK1FtREc2MUY2M0RCV2JG?=
 =?utf-8?B?aUxYcDZkTy9QMDdDWGRhcnVGOFI5a2Z5WXdjUzZzZGdvMG9xUHRqSUNMd0s4?=
 =?utf-8?B?WVdRbkI4RTVXSkdtM05HNm5VWGQ5U3NuOCtaakhSLzRiVHgzY0NtMkpTN3pS?=
 =?utf-8?B?TmJxZUtRUEIycDhsOVBFaUZqQTdnWVZDZG9yalRBNEhwODliZzVRd0pWaCtO?=
 =?utf-8?B?UGJYakxNVDZFYVZwVm9pNjYxWWRTR0o4cnYrcFNBQ3pORUVUejArUEVUUk4v?=
 =?utf-8?B?bzRRbnJneDlNQU5WMnIzZUVMWUl5WWdJM3FwMk9OS3R0dEVmOTZlMGh6U2Js?=
 =?utf-8?B?b1dmL0t4VEd1SFU1WDVJcUVmMVh5bTJMNmNaTU9zOUlCTUpmMUpPQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6870.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7350c1d1-f7ca-4796-82c1-08ded1d998e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 10:16:03.6518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZP5t6x8RU9HHGtzMcMeTKIAXASJuH/mazda9FqJfCPGnSLJkPeW8KUHd+V5S2tDPTQkykbTN+ZRJ7V2p7/tP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10749

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAy
MywgMjAyNiAzOjQ4IFBNDQo+IFRvOiBMdWtlIFdhbmcgKE9TUykgPHppbml1LndhbmdfMUBvc3Mu
bnhwLmNvbT4NCj4gQ2M6IEZyYW5rLkxpQGtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXYN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRdIG1tYzogc2RoY2ktZXNkaGMtaW14OiByZXN0b3Jl
IHBpbmN0cmwgYmVmb3JlDQo+IHJlc3RvcmluZyBpb3MgdGltaW5nIG9uIHJlc3VtZQ0KPiANCj4g
W1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnLiBM
ZWFybiB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91
dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmli
dXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRv
IGNvbnNpZGVyOg0KPiANCj4gTmV3IGlzc3VlczoNCj4gLSBbSGlnaF0gVGhlIG5ld2x5IGFkZGVk
IGVhcmx5IHJldHVybiBvbiBgcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZSgpYA0KPiBm
YWlsdXJlIHNraXBzIGNyaXRpY2FsIFBNIHN0YXRlIHJlc3RvcmF0aW9uLCBJUlEgcmUtZW5hYmxl
bWVudCwgYW5kIGxlYWtzIHRoZQ0KPiBydW50aW1lIFBNIHVzYWdlIGNvdW50ZXIuDQo+IC0gW01l
ZGl1bV0gVW5jb25kaXRpb25hbCB0cmFuc2l0aW9uIHRvIGRlZmF1bHQgcGluY3RybCBzdGF0ZSBv
biByZXN1bWUNCj4gb3ZlcnJpZGVzIHRoZSBhY3RpdmUgcGluIHN0YXRlIHJldGFpbmVkIGZvciB3
YWtldXAtZW5hYmxlZCBTRElPIGRldmljZXMuDQo+IA0KPiBQcmUtZXhpc3RpbmcgaXNzdWVzOg0K
PiAtIFtIaWdoXSBQcmVleGlzdGluZyBlYXJseSByZXR1cm5zIGluIGJvdGggdGhlIHN1c3BlbmQg
YW5kIHJlc3VtZSBwYXRocyBsZWFrDQo+IHRoZSBydW50aW1lIFBNIHVzYWdlIGNvdW50ZXIgYW5k
IGxlYXZlIHRoZSBkZXZpY2UncyBJUlEgcGVybWFuZW50bHkNCj4gZGlzYWJsZWQuDQo+IC0tDQoN
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4gSSBoYXZlIGNoZWNrZWQgdGhlIHJlcG9ydHMgYW5kIGNv
bmZpcm0gYWxsIHRocmVlIGlzc3VlcyAoYm90aCBuZXcgYW5kIHByZS1leGlzdGluZykgYXJlIHZh
bGlkLiANCg0KSSB3aWxsIGZpeCB0aGUgZXJyb3IgcGF0aHMgdG8gcHJldmVudCBQTS9JUlEgbGVh
a3MgYW5kIGFkZHJlc3MgdGhlIHBpbmN0cmwgc3RhdGUgaGFuZGxpbmcgZm9yIHdha2V1cC1lbmFi
bGVkIGRldmljZXMgaW4gdGhlIHYyIHBhdGNoc2V0Lg0KDQpUaGFua3MsDQpMdWtlIFdhbmcNCg0K
PiANCj4gY29tbWl0IDM2YWZkMWMwZTI0YzJhYTgyY2U3OTk3MTFjYzE2MjlhMzQ5NThlZjQNCj4g
QXV0aG9yOiBMdWtlIFdhbmcgPHppbml1LndhbmdfMUBueHAuY29tPg0KPiANCj4gbW1jOiBzZGhj
aS1lc2RoYy1pbXg6IHJlc3RvcmUgcGluY3RybCBiZWZvcmUgcmVzdG9yaW5nIGlvcyB0aW1pbmcg
b24gcmVzdW1lDQo+IA0KPiBTRElPIGRldmljZXMgc3VjaCBhcyBXaUZpIG1heSBrZWVwIHBvd2Vy
IGR1cmluZyBzdXNwZW5kLCBzbyB0aGUgTU1DIGNvcmUNCj4gc2tpcHMNCj4gZnVsbCBjYXJkIHJl
LWluaXRpYWxpemF0aW9uIG9uIHJlc3VtZS4gV2hlbiBERFJfRU4gaXMgc2V0IGR1cmluZw0KPiBw
bV9ydW50aW1lX2ZvcmNlX3Jlc3VtZSgpIHdpdGhvdXQgdGhlIGRlZmF1bHQgcGluY3RybCBzdGF0
ZSwgdGhlIGxvb3BiYWNrDQo+IGNsb2NrIGlzIGludmFsaWQgYW5kIGNhdXNlcyByZWFkIENSQyBl
cnJvcnMuIFRoaXMgcGF0Y2ggcmVzdG9yZXMgdGhlIGRlZmF1bHQNCj4gcGluY3RybCBzdGF0ZSBi
ZWZvcmUgcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoKSB0byBmaXggdGhpcyBpc3N1ZS4NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktZXNkaGMtaW14LmMgYi9kcml2
ZXJzL21tYy9ob3N0L3NkaGNpLQ0KPiBlc2RoYy1pbXguYw0KPiA+IGluZGV4IGE5NDQzNTFkYmNk
ZmYuLmEzNjg4Yzk0Y2Y1ODAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhj
aS1lc2RoYy1pbXguYw0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktZXNkaGMtaW14
LmMNCj4gPiBAQCAtMjExNCw2ICsyMTE0LDEwIEBAIHN0YXRpYyBpbnQgc2RoY2lfZXNkaGNfcmVz
dW1lKHN0cnVjdCBkZXZpY2UNCj4gKmRldikNCj4gPiAgICAgICBzdHJ1Y3QgcGx0Zm1faW14X2Rh
dGEgKmlteF9kYXRhID0gc2RoY2lfcGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsNCj4gPiAgICAgICBp
bnQgcmV0Ow0KPiA+DQo+ID4gKyAgICAgcmV0ID0gcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9z
dGF0ZShkZXYpOw0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyB1bmNvbmRp
dGlvbmFsIHRyYW5zaXRpb24gdG8gdGhlIGRlZmF1bHQgcGluY3RybCBzdGF0ZSBvdmVycmlkZSB0
aGUNCj4gYWN0aXZlIHBpbiBzdGF0ZSByZXRhaW5lZCBmb3Igd2FrZXVwLWVuYWJsZWQgU0RJTyBk
ZXZpY2VzPw0KPiANCj4gRHVyaW5nIHN1c3BlbmQsIGlmIGEgZGV2aWNlIGlzIGEgd2FrZXVwIHNv
dXJjZSwgaXQgaW50ZW50aW9uYWxseSBhdm9pZHMNCj4gY2hhbmdpbmcNCj4gdGhlIHBpbmN0cmwg
c3RhdGUgdG8gc2xlZXAsIHJldGFpbmluZyBpdHMgYWN0aXZlIGhpZ2gtc3BlZWQgc3RhdGUuDQo+
IA0KPiBJZiB3ZSB1bmNvbmRpdGlvbmFsbHkgc2VsZWN0IHRoZSBkZWZhdWx0IHN0YXRlIGhlcmUs
IGNvdWxkIGl0IGdsaXRjaCB0aGUgU0QNCj4gYnVzIHBpbnMgZm9yIHBvd2VyZWQgU0RJTyBjYXJk
cyBieSBmb3JjaW5nIHRoZW0gb3V0IG9mIHRoZSByZXRhaW5lZCBzdGF0ZQ0KPiBiZWZvcmUgc3dp
dGNoaW5nIGJhY2sgdG8gaGlnaC1zcGVlZCBsYXRlcj8NCj4gDQo+ID4gKyAgICAgaWYgKHJldCkN
Cj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+
IElmIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoKSBmYWlscyBhbmQgd2UgcmV0dXJu
IGVhcmx5LCBkb2VzIHRoaXMgc2tpcA0KPiBpbXBvcnRhbnQgUE0gc3RhdGUgcmVzdG9yYXRpb24/
DQo+IA0KPiBJdCBsb29rcyBsaWtlIHJldHVybmluZyBoZXJlIGJ5cGFzc2VzIHBtX3J1bnRpbWVf
Zm9yY2VfcmVzdW1lKCksDQo+IGVuYWJsZV9pcnEoKSwNCj4gYW5kIHRoZSBmaW5hbCBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBDb3VsZCB0aGlzIHBlcm1hbmVudGx5IGxlYXZlDQo+IHRo
ZQ0KPiBkZXZpY2Ugd2l0aCBpdHMgaGFyZHdhcmUgdW5yZXN1bWVkLCBpdHMgcnVudGltZSBQTSB1
c2FnZSBjb3VudCBlbGV2YXRlZCwNCj4gYW5kDQo+IGl0cyBpbnRlcnJ1cHQgZGlzYWJsZWQ/DQo+
IA0KPiA+ICsNCj4gPiAgICAgICBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOw0KPiA+DQo+
ID4gICAgICAgcmV0ID0gbW1jX2dwaW9fc2V0X2NkX3dha2UoaG9zdC0+bW1jLCBmYWxzZSk7DQo+
ID4gICAgICAgaWYgKHJldCkNCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiBb
U2V2ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2Vz
IHRoaXMgZWFybHkgcmV0dXJuIGxlYWsgdGhlIFBNIHVzYWdlDQo+IGNvdW50ZXIgYW5kIGxlYXZl
IHRoZSBJUlEgZGlzYWJsZWQ/DQo+IA0KPiBJZiBtbWNfZ3Bpb19zZXRfY2Rfd2FrZSgpIGZhaWxz
LCB3ZSByZXR1cm4gZWFybHkgd2l0aG91dCBjYWxsaW5nIGVuYWJsZV9pcnEoKQ0KPiBvciBwbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLCBwb3RlbnRpYWxseSByZW5kZXJpbmcgdGhlIGRldmlj
ZQ0KPiB1bnVzYWJsZS4NCj4gDQo+IFRoZXJlIGFwcGVhcnMgdG8gYmUgYSBzaW1pbGFyIHByZS1l
eGlzdGluZyBlYXJseSByZXR1cm4gb24gcGluY3RybCBmYWlsdXJlIGluDQo+IHNkaGNpX2VzZGhj
X3N1c3BlbmQoKSB0aGF0IHNraXBzIGJhbGFuY2luZyBwbV9ydW50aW1lX2dldF9zeW5jKCkgYW5k
DQo+IGRpc2FibGVfaXJxKCkuDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJDQo+IHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjMwNzM1MTUuMjY1ODIwNS0xLQ0K
PiB6aW5pdS53YW5nXzFAb3NzLm54cC5jb20/cGFydD0zDQo=
