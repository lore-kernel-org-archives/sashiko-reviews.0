Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B133F5A9;
	Thu, 30 Jul 2026 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412228; cv=fail; b=e5MPM2jFV+fRoNvxr6RtuZ3DI6cW3adC/qoXMuaE/S1CMmZkp8PtVUMaECnECOosoUwp6Ewwui010g5oludwgTH5h4eiFesYxiR0YWup0Zt0KuTHKoEq84eB9NvBK0kh3LY1befvLhV2XanQhAj7TaV6vT+6AaOZ/nADVbLeu3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412228; c=relaxed/simple;
	bh=ir1D8x4V8iJVOOQgQKOCVwf9pkg+p51EhFWO+vJJIFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C3Mh+fJhFm/wFznHBEP4pKBceCRDI+FQYqLp+NjoP0yS4K8hdMaW/H4jTd/RDbIL9Crx1Asi6qSPxZFeaahsSq8dSewI4GdHTWGeFtWN53YP5wtFxss0HYxY272kajQ5kBh5kJ7QbEiw/CF0gqkfYjwXTzWYUIm7EcFE59C945Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tqzdlu6A; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tqzdlu6A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuxZDEVgHhq7a+9HUbOx/oDBPbUN+3WAanPOhB/2nJOtSyTuDAidHMKbOdx+FKeLbvmfS50HHBqLMEYC3P30r0W+tRJM5WNFVu8T4VCdmK26v6LFFYZboXtrXZu7AQnqYNQXzfepRDsT/LW4tDnqWoor7iH6L73rjLNgEULraFE2Cq98POLtEHLCGCjDIzc/WaL61PMq1lHrdHLw9xVA+jivpSShSRGk7Yu2wlXNx0lQrRYVbKysk3YE0pvAwrj2+IAF9DLHK9WrVJWgNciEZ7x8cnl6LRi2PcntUbxyv4duj8gKUeC5RPEmBI+Sug9x4+lHP5BJVnuu3SwBmwTpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir1D8x4V8iJVOOQgQKOCVwf9pkg+p51EhFWO+vJJIFM=;
 b=ajET8ga+tVJ/E8QepT5yOZNA+5XLLSsD5AdxQUS7E0XI+B5cEehOoTi9C6OS7wKWCHr9/I/1yV95k21PXzb2LLcLjHacVgcqPDkH3UJHRycnjyE8apRnOiqEpVSyS+1VPWyzZHNrKeNpHFIEMRGmKb24+p6JpMZbgGLjoGYR3E74q03gm4A/sB1FYkdC6tPLcpIgnRwwIaukp8X8yXzL2PR7w4pQROI5H4Cey08eLKrL5d+crqC9ylUrF85Ox3b1WWb91wo2iiUPBbDEe3Cx++tY5an3ufmVd4NIo8byyyc+EegshbzfpLqtbKmTyMxn3o4IdFGVxsmNtGae5n6BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir1D8x4V8iJVOOQgQKOCVwf9pkg+p51EhFWO+vJJIFM=;
 b=Tqzdlu6AHOBnlkacM7SXKGXxRHnoTTljrBzbJuKAwQxTyJIlBYK0DasuKvMcfzkbvssIBui9A/doD522cZCuEze9Y0Y5VQJ1HLrZF1ig3iFyDDv41nQLv1JlirTMfvzWr6E5hqfeU3w6Gkg0ENCgxTXhgs/aI8rq9unKl9AzKNwUjNOafoDrQZf9SMOsfQX8uQcMgDOh7I3yPhNTE/5aXPUwjU04KM+4Oyh1xf1oYGxgDGR4RYL1yJh1aS2MCI6nFZfQw/K9yfETfbWKO6luNSGOiC94op4h8r+xtNWlBVe44Sd7JMTrB03CVnJR+HJeLdfQSfv6laMyWnGZwqbNkQ==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 11:50:23 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 11:50:23 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v32 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v32 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHdH8lnAI/AWjUprU+q9Dn57BJXCLaFVj+AgACQ0CA=
Date: Thu, 30 Jul 2026 11:50:22 +0000
Message-ID:
 <GV2PR04MB122710C41AACDDE749EB4AF4395C92@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-3-95f56dff4ba9@nxp.com>
 <20260730022706.41AE91F000E9@smtp.kernel.org>
In-Reply-To: <20260730022706.41AE91F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DB8PR04MB7196:EE_
x-ms-office365-filtering-correlation-id: 79b4befb-95ff-428a-ac7f-08deee30bcfb
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|6133799003|22082099003|18002099003|38070700021|3023799007|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info:
 LbnG7xidRK/RS++LL+LbtlJfxq23mLwSafzuileM3Odq0AY4213ODX1UnEqySeIiDW/cLGDKj6TOi6fSQNaxY/N9v902J41L1rpkVPNFWylKiY9MUIvSGi2zXd7J1s+ym82VvDa1fDqN4bgkmm5iPlBcpAPKtoi9jc/dOXACUblAmmGZgcd/3bpd31cR8WRC9Z5oyZoThXtN5UZMo98MS2rQsmRNgp/uRRasRtbqY3NJfRvp3YTSa0JgOxk6XAiPZD53GXumeZpFdyJmDcc5taLYriHlrpW5V0azV8dJ/EFpZiFffCegMVBFZAeRjm6VK8mVPZhPCToG7VXGnSHGE8Vp5w3VkqiQn4WedGyunme1zCx8sVB01229iTYEGSECpG/IGIr9cKn1TDbJd1w2JTty/T5NioecNXr03ni6fIe+2QQtplXXosbJ4b1On6nLjaJhrKR87vfqxX4lI+Zxc0vKX8ym/EvZaXkfZ918uuL3224y6BNuFR0Fl+OpkBEaFhNAiGHYCviEN4dHel06K5A0yEniCTpSbRdxH1SqNVjFS5HAfZLPlNmn6DxP+4H/AKhi0OwiRoNWCXyBP+i5pu8gJHCcMRVO9qHlsyD/gSQxgAgyQqOpsY0QN1YLxNNK620UO0o+losJ1Vln+saUAlhH4+G50ZaCLojyo/WNwu+kanCko5jf+o3tqhZxqVpsbdDS29lEf8Rs4Jm5HDk2ZnvZYBlrSHpLENxm3TNnwuM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajVDdzEyb0pmN3VuQ1d3VFNPaWhLZzBINmRHWXdGYjIzMlhSMzRYVm90M0xW?=
 =?utf-8?B?RVN5WkExT3JBa3RSTXIxeUpBV3VPcityNE5HcXRKY3NVL25IVWkydkZLdERi?=
 =?utf-8?B?VW9wUktnUG5TL1Z2NGZYSitRbzg1VjRSOXpjRXM2ZGVIZXZlQ0doVGdGNk9v?=
 =?utf-8?B?RU14WUdqdlNuenV1RERoZnR3dk9KVGJiRHdBRkNac1hXK21DVXI2RUlYdDUv?=
 =?utf-8?B?WFZHbzI1bnJadTk1dDRyZjdhNktIUU1LdlN2bUVTM08xSW9iY3VmalNYSUIr?=
 =?utf-8?B?TXZTR0R3WWdMaHJ2d2MvOVJuVnVKOG5zcEhIT0YxQ3pKeVpvRm8wZnU5TGNC?=
 =?utf-8?B?SFprcUFSenViTVpQTDlUVzJuSTRrZVlNeFI0eXlHYmozbks5UWkvdkphVm9t?=
 =?utf-8?B?QzdyV3dJK2UxQXBPNnE4blZzU3lvbkRUKzRNbUNpbzhvVVZJY0ozVmlsczdP?=
 =?utf-8?B?OGZoaGc4Y3NjMmVpWWF4SjBzUVFzS202aWxrRW13N1poRDRRY3FrSTJQSDBL?=
 =?utf-8?B?RU1VUk4xbnZPM0w4ZkNXNnZEUXdtbGFvOWRCSUJkbVBpcTVIOVZLSHVtTTNI?=
 =?utf-8?B?cGZIT0U1SDQyMEl6akhkbU1zUWd1WCtjdUhrRWNnRnpYZ0ZuTk42Q0tHMmJE?=
 =?utf-8?B?QXFqVTIrUmNuczU3NVN2NFU4dHU1NjdPUFlwZEtFTUxBZUNwVVBhWEFuZWZt?=
 =?utf-8?B?d1pCYk5rUDNHdzVSMDFja241YkZab1hlYnN2cGdTU2RpdlpFUEdnZHlEc3ZN?=
 =?utf-8?B?d0I4cFRuTHpXMUcwa2V5SlR4cVI4d3BzcFlzdnB4K3JpdHhsME10cVVQZDl1?=
 =?utf-8?B?UElMaTBhTTI5QUtaY1pVRHdmMzRrM0cxQktsOG1lTDdpY0hCTEFIeVJLc1dz?=
 =?utf-8?B?cHlOWXhsSE92S2oyTUEwSk9wcXRCMVQvMEFYMGt1SndtSjQ1QlVoWUdJeWo3?=
 =?utf-8?B?R0VaTHV1N1JlNEQyWXkzVGZrUWdrdUdFaVNnemE1dUNJNjM3MTBEK2UzcGQ1?=
 =?utf-8?B?dDhJbkJhUXh6UU0xVkdQVHRLQU9tWDNNdWJmQ01RejZ5djZhOFNsTkhYMGRz?=
 =?utf-8?B?bnBPYU5ycUZ0YTlCQTlxaHB3cTQvV2h2RmFkREphQmM4Q1lxRHM4V1BHUlZM?=
 =?utf-8?B?V0lrSHJ2OUJxQXBqS2NScHJEUUE4bWZrNm84QWp1bWFSdHFjU2hHSGs0MGQ2?=
 =?utf-8?B?am5GMUN6WnpjUG8wUDI0TldFV1B1clJVZ3lhcE1EN09ma0FFOGVBNVZ3bkh5?=
 =?utf-8?B?S0RlYW04MHAwZElYbWV5UGs0N0FvMHFtem9xckNCVWJhL2FsQ1F1ZDdIeEdE?=
 =?utf-8?B?UVFCbmw4YlhNTVUxRnVsYmZ1RittMll0MDhaWlJIa0g4K1Z6N2JzNkNnWnI5?=
 =?utf-8?B?UnFkRGticnZYZUtiSGRsUG5ObTB2bWQyK2N1VGVsUDBnc1dLSDI3NGJNRkdP?=
 =?utf-8?B?NDNvOGM3WjVGRHl2MHZVTG5vTGFiVnl6ejRQSElKazkvY1B0VE5pY0k1VzRG?=
 =?utf-8?B?QWJnMkdSMWJIMzIwakNNM1ZqOTUvZiswRTRrNEZBREVoNmF4Mzg0MXAvdW1P?=
 =?utf-8?B?Wmh1bUNvV3hJV296bGZORVJnc2RwVkFnSnZLZzN5MFNoOVpsNjlxeFppQlZ2?=
 =?utf-8?B?eVBHQ2l2VC9mK1g1dm5GNGRBQU8xWXZsN3hKR0ttMnh2bjlIUmxKTHVJem1o?=
 =?utf-8?B?VlcxejJGdCtsM0t0MW95WWdLSWFVVnlLUm95d2w1T3lITDVZRUJKS2NXZ2gw?=
 =?utf-8?B?bUs2cU9RdTRXUFAzVERZUllLVE9FbE5ON202T2tOSGRsbld0dE12R3B3QlJD?=
 =?utf-8?B?cFlUVWlMZ2ZZMFczSHZQQkJVRjhnb1Fubm5YVVQ4V2dKYkNaS282SnNkMVpv?=
 =?utf-8?B?bVI4LzJtN0d2K0o1T3pIMm5TUmt3TFRrRjl2SWZVZjB5VFJ0ckhGaFNyK2dC?=
 =?utf-8?B?OUg3OXMxMVpuL2E3cnIwZUNvQWo5SFV0a2hmNFdWQkRoazZjNElFMVE4SFMz?=
 =?utf-8?B?QlYwREhOaXdYYmhzYXB3VGNvOFZXM3BrVXZXOG9GWmdxRUxXQ3haN1JiWFBQ?=
 =?utf-8?B?ZWt5QVYyZFlsSEZTa2NZUFpPQlA0QnVTZ0NtL1F0SjMwR0ZMaWFhV2dFQ1lO?=
 =?utf-8?B?aUZOV3RUV2Z6dXI0dGh5RTVBNG9yNzYxTlc0YVRNS1lZRURCNFhVS1pVY054?=
 =?utf-8?B?WTZCWXVMTXZwWmk0bW4yWE1ONzEvaDVFeXVmN2RMekkrNkR2RStBaTA4Zys2?=
 =?utf-8?B?WElEU2dmaWtCQW5VWW9CamVzamo3b0xsYitraGZVZjRza25BdWx1eGorbEho?=
 =?utf-8?Q?BpoPmjnZvQYUy+25TM?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b4befb-95ff-428a-ac7f-08deee30bcfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 11:50:22.9460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lPtNJ+m5ejlT/ryUvOTm8SPhC6h7bzXp044daaqsO2EZzXJPTvLUIBS9vDL9cSNHIxfkSgAbNFVlhq86t01qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

PiA+IEBAIC02NSwxNSArNjUsMTUgQEAgaW50IGVsZV9nZXRfaW5mbyhzdHJ1Y3Qgc2VfaWZfcHJp
diAqcHJpdiwgc3RydWN0DQo+IGVsZV9kZXZfaW5mbyAqc19pbmZvKQ0KPiA+ICAJc2VfZmlsbF9j
bWRfbXNnX2hkcihwcml2LCAoc3RydWN0IHNlX21zZ19oZHIgKikmdHhfbXNnLT5oZWFkZXIsDQo+
ID4gIAkJCSAgICBFTEVfR0VUX0lORk9fUkVRLCBFTEVfR0VUX0lORk9fUkVRX01TR19TWiwNCj4g
dHJ1ZSk7DQo+ID4NCj4gPiAgCXR4X21zZy0+ZGF0YVswXSA9IHVwcGVyXzMyX2JpdHMoZ2V0X2lu
Zm9fYWRkcik7DQo+ID4gIAl0eF9tc2ctPmRhdGFbMV0gPSBsb3dlcl8zMl9iaXRzKGdldF9pbmZv
X2FkZHIpOw0KPiA+ICAJdHhfbXNnLT5kYXRhWzJdID0gc2l6ZW9mKCpzX2luZm8pOw0KPiA+ICAJ
cmV0ID0gZWxlX21zZ19zZW5kX3Jjdihwcml2LCB0eF9tc2csIEVMRV9HRVRfSU5GT19SRVFfTVNH
X1NaLA0KPiByeF9tc2csDQo+ID4gIAkJCSAgICAgICBFTEVfR0VUX0lORk9fUlNQX01TR19TWik7
DQo+ID4gIAlpZiAocmV0IDwgMCkgew0KPiA+ICAJCWVsZV9nZXRfaW5mb19jbGVhbnVwKHByaXYs
IGdldF9pbmZvX2RhdGEsIGdldF9pbmZvX2FkZHIsDQo+ID4gZ2V0X2luZm9fbGVuKTsNCj4gDQo+
IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eDQo+IF5eXl5eXg0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBJZiB0aGUgdHJh
bnNhY3Rpb24gdGltZXMgb3V0IGFuZCBlbGVfbXNnX3NlbmRfcmN2KCkgcmV0dXJucyAtRVRJTUVE
T1VULA0KPiBkb2VzIGZyZWVpbmcgdGhlIERNQSBidWZmZXIgaGVyZSByaXNrIG1lbW9yeSBjb3Jy
dXB0aW9uPw0KPiANCj4gVGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIHRoYXQgIkRNQSBmcmVl
IG9uIHRpbWVvdXQ6IC1FVElNRURPVVQNCj4gbWVhbnMgRlcgaXMgZmVuY2VkIGJ5IGZ3X2J1c3ks
IHNvIHRoZSBmcmVlIGlzIHNhZmUiLCBidXQgd2hpbGUgZndfYnVzeQ0KPiBwcmV2ZW50cyB0aGUg
aG9zdCBmcm9tIHNlbmRpbmcgbmV3IGNvbW1hbmRzLCBpdCBkb2VzIG5vdCBzdG9wIHRoZSBmaXJt
d2FyZQ0KPiBmcm9tIGZpbmlzaGluZyB0aGUgY3VycmVudCBjb21tYW5kIGxhdGUgYW5kIHdyaXRp
bmcgdG8gdGhlIERNQSBhZGRyZXNzLg0KPiANCj4gSWYgdGhlIGJ1ZmZlciBpcyBmcmVlZCBhbmQg
cmVhbGxvY2F0ZWQgZWxzZXdoZXJlLCBhIGxhdGUgRE1BIHdyaXRlIGNvdWxkIHNpbGVudGx5DQo+
IGNvcnJ1cHQgbWVtb3J5Lg0KDQpGSVhFRCBMQVRFUiBpbiB0aGUgc2FtZSBzZXJpZXM6DQoNCi0g
UGF0Y2ggImZpcm13YXJlOiBpbXg6IGRldmljZSBjb250ZXh0IGRlZGljYXRlZCB0byBwcml2IiBh
ZGRzIHByaXYtPnByaXZfZGV2X2N0eC4NCg0KLSBQYXRjaCAiZmlybXdhcmU6IGlteDogYWRkcyBt
aXNjZGV2IiAoUEFUQ0ggdjMyIDUvNykgYWRkcw0KICBzZV9tYXJrX2Z3X2J1c3koKSAocmVjb3Jk
cyBwcml2LT5md19idXN5X2Rldl9jdHggPSBkZXZfY3R4KSBhbmQNCiAgc2VfaXNfZndfYnVzeV9j
dHgoKSwgYW5kIHJld3JpdGVzIGVsZV9nZXRfaW5mb19jbGVhbnVwKCkgdG8NCiAgcXVhcmFudGlu
ZSAocmV0dXJuIHdpdGhvdXQgZnJlZSkgd2hlbiB0aGUgb3duaW5nIGNvbnRleHQgaXMgYnVzeTsN
Cg0KRGlzcG9zaXRpb246IG5vIGNoYW5nZSBpbiAzLzc7IHJlc29sdmVkIGJ5IDUvNy4NCg0KPiAN
Cj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlyZXQgPSBzZV92YWxfcnNw
X2hkcl9uX3N0YXR1cyhwcml2LCByeF9tc2csIEVMRV9HRVRfSU5GT19SRVEsDQo+ID4gIAkJCQkg
ICAgICBFTEVfR0VUX0lORk9fUlNQX01TR19TWiwgdHJ1ZSk7DQo+IA0KPiBbIC4uLiBdDQo+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2lteC9lbGVfY29tbW9uLmMNCj4gPiBi
L2RyaXZlcnMvZmlybXdhcmUvaW14L2VsZV9jb21tb24uYw0KPiA+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLmY0MGViNGEwNzk4MmQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9pbXgv
ZWxlX2NvbW1vbi5jDQo+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9pbXgvZWxlX2NvbW1vbi5j
DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBAIC02MSwxNiArNjEsMTYgQEAgaW50IGVsZV9tc2df
cmN2KHN0cnVjdCBzZV9pZl9wcml2ICpwcml2LCBzdHJ1Y3QNCj4gPiBzZV9jbGJrX2hhbmRsZSAq
c2VfY2xia19oZGwpDQo+ID4NCj4gPiAgCWRvIHsNCj4gPiAgCQlpZiAoaXNfcnNwX3dhaXRfd2l0
aF90aW1lb3V0KSB7DQo+ID4gIAkJCWlmICh0aW1lX2FmdGVyX2VxKGppZmZpZXMsIGRlYWRsaW5l
X2ppZmZpZXMpKSB7DQo+ID4gIAkJCQkvKiBEZWFkbGluZSBoaXQ6IGZlbmNlIGh1bmcgRlcsIGxp
a2UgdGhlIHJldD09MA0KPiBwYXRoLiAqLw0KPiA+ICAJCQkJc3Bpbl9sb2NrX2lycXNhdmUoJnNl
X2NsYmtfaGRsLT5jbGJrX3J4X2xvY2ssDQo+IGZsYWdzKTsNCj4gPiAgCQkJCXNlX2NsYmtfaGRs
LT5yeF9tc2cgPSBOVUxMOw0KPiA+ICAJCQkJaWYgKCFjb21wbGV0aW9uX2RvbmUoJnNlX2NsYmtf
aGRsLT5kb25lKSkNCj4gPiAgCQkJCQlhdG9taWNfc2V0KCZwcml2LT5md19idXN5LCAxKTsNCj4g
PiAgCQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNlX2NsYmtfaGRsLQ0KPiA+Y2xia19yeF9s
b2NrLCBmbGFncyk7DQo+ID4gIAkJCQlyZXQgPSAtRVRJTUVET1VUOw0KPiA+ICAJCQkJYnJlYWs7
DQo+ID4gIAkJCX0NCj4gPiAgCQkJcmVtYWluaW5nX2ppZmZpZXMgPSBkZWFkbGluZV9qaWZmaWVz
IC0gamlmZmllczsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBT
aW5jZSBqaWZmaWVzIGlzIHZvbGF0aWxlLCB0aGUgY29tcGlsZXIgd2lsbCByZWFkIGl0IGFnYWlu
IGhlcmUgYWZ0ZXIgdGhlDQo+IHRpbWVfYWZ0ZXJfZXEoKSBjaGVjay4gSWYgYSB0aW1lciB0aWNr
IGluY3JlbWVudHMgamlmZmllcyBleGFjdGx5IGJldHdlZW4gdGhlc2UNCj4gdHdvIHJlYWRzLCBj
b3VsZCB0aGlzIHN1YnRyYWN0aW9uIHVuZGVyZmxvdz8NCj4gDQo+IEFuIHVuZGVyZmxvdyB3b3Vs
ZCByZXN1bHQgaW4gYSBtYXNzaXZlIHRpbWVvdXQgdmFsdWUgbmVhciBVTE9OR19NQVgNCj4gYmVp
bmcgcGFzc2VkIHRvIHRoZSBjb21wbGV0aW9uIHdhaXQgZnVuY3Rpb25zIGJlbG93LCBoYW5naW5n
IHRoZSB0aHJlYWQNCj4gaW5kZWZpbml0ZWx5Lg0KDQphLiBlbGVfY29tbW9uLmMgZWxlX21zZ19y
Y3YoKTogQWRkZWQgYSBuZXcgdmFyaWFibGUgbm93Lg0KICAgIFdpdGggdmFyaWFibGUgbm93ID0g
amlmZmllcywgamlmZmllcyBpcyBzYW1wbGVkIG9uY2UgYXQgdGhlIHRvcA0KICAgIG9mIHRoZSBs
b29wIGJvZHk7IHRpbWVfYWZ0ZXJfZXEobm93LCBkZWFkbGluZV9qaWZmaWVzKSBnYXRlcyB0aGUN
CiAgICAtRVRJTUVET1VUIGJyYW5jaDsgcmVtYWluaW5nX2ppZmZpZXMgPSBkZWFkbGluZV9qaWZm
aWVzIC0gbm93IHVzZXMgdGhlDQogICAgc2FtZSBzbmFwc2hvdC4gDQpiLiByZW1haW5pbmdfamlm
ZmllcyBpcyBjb25zdW1lZCBieSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSAvIHdhaXRf
Zm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCkuDQoNClRoaXMgaXMgdGhlIG9u
ZSBjb2RlIGZpeCBpbiB2MzMuDQo=
