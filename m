Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2E248F57
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798997; cv=fail; b=mM0+rvzAH5xQ2qu2i4+XEzQtxMILzEY7TeLEzuFzr8O4Tth1jdbBXifhagdQJlLTpdsdf9GZsyAclxYdaADpOYYj4Y1zc/0/bAOyDi0KzVgTLVYRdj8FDZbapLYgmJnsQD6zemYb9OGuFw3fe2lpUWfylslPiaULYUblP1tWlPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798997; c=relaxed/simple;
	bh=YdIG34kxKtdGErisAQ5/WILhqGqzEIsn2KUDx9bpF1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZvOSZ94uNw6MiHsCTzQb85o3gx8Wl5zclRWoNZ+qDnAWqjcHYbuJedXd3mKaJIdeWH1LbfAKIx23VLehGFLgCPxdnadrlu11eflRTEZfO0VM1zM2nuRnFomTFMum54KoJwFQ+ofK45HcmcY8dhUQoiQN3sxODj25tUC5OzX8RW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nl01/v5v; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nl01/v5v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+DnqEnE0WgN3jLB0/xj5mEYaI6V89a/tsY3nQGD6X5U5Wl8/DJl1lFPKJjjuVhzmTdvIn4MxpY3kXyJvwGRzd79TeAS4cJIPh6crpxm7aB1P2mafogPn+5we/COHqZkNYhEnNNf9Ntqk7K6vW8KxubP6JZmHqBEV2Q5sClyQQMVS28TRI21DGaooF/wGILWuUHW4IWkeYkj2q09nGlidMNqOXXbaU/IPEjhNwe2/11h55CaRMNIbUkQf7Q48c9fvif6j1n1yF9zMB/iWiPhzWN7p15zsEQbFm2rGjLoO57lTXWTeiCxaYSKIEYJ6Krybj+F3o2zbIu5xCms3BTOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdIG34kxKtdGErisAQ5/WILhqGqzEIsn2KUDx9bpF1s=;
 b=laKMeCp63zEplpszMCCZgpEPZd/vOdwbZ9I5cX/pT+Gv4Nz+Pcdg734whtmrIcWRApKatLr5/Yh9GSOrhdNiV0Id2xYsChry8R7bGucTY+3Vi8VEGMFemIHmhfGQuGmocYJ4qEBYN81lVye0u21qD0yUFXXSbvPj1cnehpfsQzwHtuAh1kvDXcXLATz3waK0Qu5LPLu7MXKQJDk8zTgv7YnkOcUcB//Lq4fYHO4w0U9yQnp6t2+ZiwDc3i/a9sxNdFAm4fRq7W9wWey+/7D3DM9AiDvfttKEjvYe02jC9JKtB0SumPm1DJw45UaMeXkjOBeTucynRzjBx9dxUgqMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdIG34kxKtdGErisAQ5/WILhqGqzEIsn2KUDx9bpF1s=;
 b=nl01/v5vQnpHVZyyoKsovIRtwvNxPfbl7zVbRf/4GnLO/8TjXQuu593NEv7ZWdWR8zfgvXgesxcxYOa2oUEYJPUYPNCmAjHjRYCyC+Sg1xpjtTM5dEVPnV0rHmxsTgKgkK56ZLzqbhsATSg/+wwbi9PEQfXsuWfjQ/ihMy66vKk=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17968.jpnprd01.prod.outlook.com (2603:1096:604:473::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:49:53 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:49:52 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v6 11/16] ASoC: rsnd: Add ADG reset support for RZ/G3E
Thread-Topic: [PATCH v6 11/16] ASoC: rsnd: Add ADG reset support for RZ/G3E
Thread-Index: AQHc4j0wg6j9QaqEIUSs2XXOGLHFZrYM5CWAgAE+/tA=
Date: Thu, 14 May 2026 22:49:52 +0000
Message-ID:
 <TY6PR01MB17377D6D7843A2837F927B92FFF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-12-john.madieu.xa@bp.renesas.com>
 <20260514034658.2A599C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514034658.2A599C2BCB7@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB17968:EE_
x-ms-office365-filtering-correlation-id: 67593d8f-de2d-4831-5f41-08deb20b1cba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|11063799003|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 9MrCszcLe2LjSet31/7iqpJPrWb+Azk4OCvis2yBkaVo8HrVCEalV/VWJ1dIxnP2L/ZX898bOnjk5YSyqYfoShaUkpNVrqmkdUzZSx1wvEHLecMI90+sTfiOFlSbRYjxmNL395ksCLGLlm9Q1kmtYeP5m89rf8diXbsaETIiKl35kfQbqXq1+1rooM9mxPJYAXFEDz6O+aonFcvlrPyVNzF+ySaf1UDE3yuE7a7ZBfHfgfpHQDSGpu0ye8CX2hNfIuMmx5OMXdnkUt8CUzMUZXqLbU4DQjnINWrnHIG4B4FTOClhs7YlfkVkVtcqtbYhij+gHRhqhMhZeLsCwU7jCnzBzqxu698eMne0xnvyBAboIooda9lEN/Os62qviDcmPFq8+zV93QBk54Ym2jCenIIoWwFoshR2H7Njr2asC6CZZvKzknObCk52GY3mZfxtYgDJJUDXtbnm1CtWMUrgZJcihLkKIn6G99kKefPyq0n06dmJwF15MqI0on2FK91nyjKeg2xZDAFtFvppIvA/URLPpX8KmSxfQcp0WOSF0i8TjaB8hWibX/TsRK+kwhajJliO5AOwmMm1HwbdQpjVr1xBTZugSYPs+IkbSB8JoaqiLFoYJK3ZrfrBc4wvhwyzou+jRzQX1tIA5/SiNIifmZG2nVXU+Mf7tWzmoSkyu0mhd32gXo1NjFVseecV3sKwj4POT4OrDUIgv607QB0goTwfpwvYUOWQM9em1/xM3f6cabAiY09fblUVlFla5Guc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799003)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnhBUTkwWitscWVZZFovM0NmbEZvMFQzUis4TU05bzJRUUxaekFhbmtnZlRX?=
 =?utf-8?B?NjgvRHhtcWlGMS83UVJLNVRaL2k1bzN0VGh6VlRJU3lWOUtMRk5rbmx0Sncw?=
 =?utf-8?B?bHNPM0Nmd2tZWENDalg0ZHhEbS9WZU5TelJDbkJ0N21PVFpKbVJ4bXY5R0Vs?=
 =?utf-8?B?RXFKK2Y3UmdtTW43Mk4wcGRRb2VPcnZHNnJDNVZ5VERPc08vcXNDeEwybVpQ?=
 =?utf-8?B?RUpkWkNSaHlTV3VodFdtNzQwMHk5RXVrZUhrUTg5djM4VDRzZ2xGQ1Rja3lR?=
 =?utf-8?B?eU5OTlAvQTNEbVNTWHpVQ0RVcUhJNWsvQ1ZtQ1Q4VW5CVVVtK0VnTG9CNE9x?=
 =?utf-8?B?S2MwZHN4WkVoQTByNmsyRW9KRlBJaEhGa2l0T1ZWdWpTQVZqT2RVMXFON2Nq?=
 =?utf-8?B?dmNpVDNuMm9jOFhHYkd3QkhUU2JNNjJqZ0lwYU94dFY5UFpXb25SR3UvVUpn?=
 =?utf-8?B?bFVZMkRuQ1J6VGxBZGhWbHp6Q1F0Mkk4UGpuMjY0U0t5eWkxTFpQVjRIK3Ru?=
 =?utf-8?B?Nk9kSzJMVUNweVJtSEoxMGdqUEtaaEJtVHBiaWQ4dUhRb3h0RWFaNUpab2Yy?=
 =?utf-8?B?aWhmSldGanYrNWhpT21YaUFrTjE4UFFENUJzbkp3cWMzeVlSdXR4VnpKZnRs?=
 =?utf-8?B?enJGdUdXYUU4czFoY2s3YkJxbVVRdWhvNitXT092ZEF2MXJQU243cERUWU5t?=
 =?utf-8?B?TjNuYWdlUlA3N2o4azlNS0pONDkwK2RYRmdpMVlJRnFMOGRrNjlrVVo3eEx0?=
 =?utf-8?B?S2Vvend3SGREazlUVnFlL0doSmMyQ1pwamFkT1hJaHBvakU3eUNWeVRTN2My?=
 =?utf-8?B?RXM0QTBHTEpQQlVnS3J5QzFLK01wV25jTTI2UEtNazFtSGpqTUJaMmg0V0NN?=
 =?utf-8?B?MDZ0SjhDb1B5WkZVRG4xbks1L2srT2VQa05XQXNYVVdxRmQ3NXdwZTM2d3VM?=
 =?utf-8?B?M0JLM3prSDFzYzFoTTgzaHRqRnFTOE1ndGV1S3AwblVad0lCVnVuQlRLRE5t?=
 =?utf-8?B?MjJiREZjYURuRUxUeFIxWEdYVG5SYnhRTzNteTVWWXFUZW96eU5GcnJPL1Rv?=
 =?utf-8?B?TDdJTWsxbTdqYytXdkJ4VUxpSnh3VnBVOU1OZTh1UERCeEdaUmNuUUhYNTMz?=
 =?utf-8?B?bW5pdGplN0VOdy82bU1iQVpEMXJackdWVmdUVzd6cmFuT081a0NqY250VVFk?=
 =?utf-8?B?L3pkNkcrNFgvQlJ2OFdFMFBSbGdpTHR3bXVidUxWSFN1REdyOFlJU3ltVHN6?=
 =?utf-8?B?NllaYjJoSEg1bDFlcWVoaWRxdThiQjFDRFkvcGtSRjdKczFzNzBoaVYrVEVR?=
 =?utf-8?B?ZG8wOWo4WitkU2F1dzNWUStlNUVkaGZDY1pHZWRKamZvUERtTGJPbDhFUUIv?=
 =?utf-8?B?Q0p0dGc4ZVdQcmZEMUtaT3VmYlp1K0pSUzBCMEc2RHBnVUZ0NGJMWlJ4T1RZ?=
 =?utf-8?B?dHFRZS9TQWJEVVdlTERXVXQrU0c2dlVoY2JLL1pVVi9GRlNET3Qya01VZEtL?=
 =?utf-8?B?cHA2RFFDMTFhQWhabW1PVDYvZXRHaWtiSkxMcHJoOU1KVUlyMGxNRXd3RWFx?=
 =?utf-8?B?V2xkTjVBRW9pRU5sMUdKYmNOdzVwak1YbGRhSUxQT21HWG1FR0JmNU95RXlO?=
 =?utf-8?B?Qi9zSFpTWkpRNy80bnAyUkR4WmdaejU0M3pNdy9hcEhmZlRHTXRTNnBqcmNZ?=
 =?utf-8?B?UzVSQ1ROLzJZSmsraHNobU0zQkk2NEpzQ05BSzB6Vkk5RERISTlZVEMvSGtB?=
 =?utf-8?B?MWU1ZS9QZ0haWEdvdWEvWnYrSXMzTnBSdEVPMFRwK01SSG9pc2JxRjNnZmsz?=
 =?utf-8?B?aHRUbENuOC9XaXI5OHhTdzl2ZnJBc1VXRU9rYVhHSjR5c3FmbDFkSjdKRkMw?=
 =?utf-8?B?NTVqL3ROOWpGTzhZSjBMNDRDWlRPTHhSMDRhdkFkZytCSGhDek5PVkJNa3pn?=
 =?utf-8?B?WGtKWjk2Mmo0ejNiVnJHWkFFVHV6MEQ1NzJNK2hnbEJQdmlKWmp1SStTQjNZ?=
 =?utf-8?B?UVEyWk16RTZVOGVUejJUQ3l1d3ZiZzFtVVhKMjFHY0gxQXVlcVRoZ3FpZ3R6?=
 =?utf-8?B?UjJINlpZRTJ3emxaeHlqWXhzNDhLK1R0bXZ4S2VjUVVLaW01WHF6dkJkTi9S?=
 =?utf-8?B?QTgyYXFNTXErSTFvQ1VhQm5mQ0RwNWw3c1V6QlBPZkJFMDUzVW4weFF6TUZR?=
 =?utf-8?B?QWFqK1M2MktGaFFCSFU5QnRsWVVJaFJVL3NNRXpyNTF2OXVPL3c1VWpBTE5l?=
 =?utf-8?B?d3BFTXdEMGVVZjhDejVBa2JTQlZETHp0THhPU2k1aHVBVWUrVWpNQmF2ZFhO?=
 =?utf-8?B?WEtSaWZmdVNqRENYTU50cHBHUUs3WjJyaFlmZTVwQkx3ejNzckdhUmRYTUpp?=
 =?utf-8?Q?YUVnuOgkgQ/0qOs4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67593d8f-de2d-4831-5f41-08deb20b1cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:49:52.9343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+9CHti7pNyXnQ1PPLM4t2YrD8mzpckksWUbhwStLBrc5/D8FVXIef48S3z/G5xehAb1Kb+GjZOY2KLakpIyy8lOvWP9qfegLW1o6b/83JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17968

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDA1OjQ3DQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTEvMTZdIEFTb0M6IHJzbmQ6
IEFkZCBBREcgcmVzZXQgc3VwcG9ydCBmb3IgUlovRzNFDQo+IA0KPiBbWW91IGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlz
DQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBB
SSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwNCj4gaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0g
W0hpZ2hdIFRoZSBBREcgcmVzZXQgbGluZSBpcyBkZWFzc2VydGVkIGR1cmluZyBwcm9iZSBidXQg
bmV2ZXIgYXNzZXJ0ZWQNCj4gb24gbW9kdWxlIHJlbW92YWwgb3IgZXJyb3IgcGF0aHMsIGNhdXNp
bmcgYSBzdGF0ZS9yZXNvdXJjZSBsZWFrLg0KPiAtIFtIaWdoXSBUaGUgQURHIG1vZHVsZSByZXNl
dCBpcyBkZWFzc2VydGVkIGJlZm9yZSBpdHMgY2xvY2sgaXMgZW5hYmxlZCwNCj4gdmlvbGF0aW5n
IHRoZSBoYXJkd2FyZSByZXNldCBzZXF1ZW5jZS4NCj4gLS0NCj4gDQo+IGNvbW1pdCA2YzZkODk0
ZWE2NWFlMTA5ZTVmYThkODUyMzljMGJmY2MwN2ZjMWFhDQo+IEF1dGhvcjogSm9obiBNYWRpZXUg
PGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gQVNvQzogcnNuZDogQWRkIEFE
RyByZXNldCBzdXBwb3J0IGZvciBSWi9HM0UNCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgb3B0aW9u
YWwgcmVzZXQgY29udHJvbCBzdXBwb3J0IGZvciB0aGUgQURHIG1vZHVsZSBvbg0KPiBSZW5lc2Fz
IFJaL0czRSBTb0NzLiBJdCByZXRyaWV2ZXMgdGhlIGFkZyByZXNldCBsaW5lIGFuZCBwYXNzZXMg
aXQgdG8NCj4gcnNuZF9tb2RfaW5pdCgpIGR1cmluZyBwcm9iZS4NCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvYWRnLmMNCj4gPiBiL3NvdW5kL3NvYy9yZW5lc2Fz
L3JjYXIvYWRnLmMNCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL2FkZy5jDQo+ID4g
KysrIGIvc291bmQvc29jL3JlbmVzYXMvcmNhci9hZGcuYw0KPiA+IEBAIC03NzksOCArNzgwLDEx
IEBAIGludCByc25kX2FkZ19wcm9iZShzdHJ1Y3QgcnNuZF9wcml2ICpwcml2KQ0KPiA+ICAgICAg
IGlmICghYWRnKQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAt
ICAgICByZXQgPSByc25kX21vZF9pbml0KHByaXYsICZhZGctPm1vZCwgJmFkZ19vcHMsDQo+ID4g
LSAgICAgICAgICAgICAgICAgICBOVUxMLCBOVUxMLCAwLCAwKTsNCj4gPiArICAgICByc3RjID0g
ZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUoZGV2LCAiYWRnIik7DQo+
ID4gKyAgICAgaWYgKElTX0VSUihyc3RjKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyc3RjKSwgImZhaWxlZCB0byBnZXQNCj4gPiArIGFkZyBy
ZXNldFxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IHJzbmRfbW9kX2luaXQocHJpdiwgJmFk
Zy0+bW9kLCAmYWRnX29wcywgTlVMTCwgcnN0YywgMCwNCj4gPiArIDApOw0KPiANCj4gRG9lcyB0
aGlzIHNlcXVlbmNlIGRlYXNzZXJ0IHRoZSByZXNldCBiZWZvcmUgdGhlIG1vZHVsZSBjbG9jayBp
cyBlbmFibGVkPw0KPiANCj4gTG9va2luZyBhdCByc25kX21vZF9pbml0KCksIHRoZSByZXNldCBp
cyBkZWFzc2VydGVkIGltbWVkaWF0ZWx5Og0KPiANCj4gc291bmQvc29jL3JlbmVzYXMvcmNhci9j
b3JlLmM6cnNuZF9tb2RfaW5pdCgpIHsNCj4gICAgICAgICAuLi4NCj4gICAgICAgICByZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUoY2xrKTsNCj4gICAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gDQo+ICAgICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9kZWFz
c2VydChyc3RjKTsNCj4gICAgICAgICAuLi4NCj4gfQ0KPiANCj4gU2luY2UgTlVMTCBpcyBwYXNz
ZWQgZm9yIHRoZSBjbGsgYXJndW1lbnQgaW4gcnNuZF9hZGdfcHJvYmUoKSwgdGhlIEFERw0KPiBj
bG9jayBpc24ndCBlbmFibGVkIGR1cmluZyB0aGlzIGRlYXNzZXJ0aW9uLiBUaGUgYWN0dWFsIEFE
RyBjbG9jayBpcw0KPiBmZXRjaGVkIGFuZCBlbmFibGVkIGxhdGVyIGluIHJzbmRfYWRnX3Byb2Jl
KCkgdmlhIHJzbmRfYWRnX2dldF9jbGtpbigpIGFuZA0KPiByc25kX2FkZ19jbGtfZW5hYmxlKCku
DQo+IA0KPiBPbiBSZW5lc2FzIGhhcmR3YXJlLCBzeW5jaHJvbm91cyByZXNldHMgdHlwaWNhbGx5
IHJlcXVpcmUgdGhlIG1vZHVsZSBjbG9jaw0KPiB0byBiZSBhY3RpdmVseSBydW5uaW5nIHdoZW4g
dGhlIHJlc2V0IGlzIGRlYXNzZXJ0ZWQuIENvdWxkIHRoaXMgY2F1c2UgdGhlDQo+IGhhcmR3YXJl
IHRvIG1pc3MgdGhlIHJlc2V0IHJlbGVhc2Ugb3IgbGVhZCB0byB1bmluaXRpYWxpemVkIG1vZHVs
ZSBzdGF0ZT8NCj4gDQo+ID4gICAgICAgaWYgKHJldCkNCj4gPiAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+IA0KPiBBcmUgdGhlcmUgbWlzc2luZyBjbGVhbnVwIHBhdGhzIGZvciB0aGUgZGVh
c3NlcnRlZCByZXNldD8NCg0KUHJlLWV4aXN0aW5nIHBhdHRlcm4gYWNyb3NzIHRoZSBkcml2ZXI6
IHBlci1tb2R1bGUgcHJvYmVzIGRvIG5vdA0KY2FsbCByc25kX21vZF9xdWl0KCkgb24gbGF0ZXIg
ZmFpbHVyZXMsIGFuZCAqX3JlbW92ZSgpIHBhdGhzIGRvIG5vdA0KZWl0aGVyLg0KDQpSZWdhcmRz
LA0KSm9obg0K
