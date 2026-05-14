Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D503D1AB0
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797747; cv=fail; b=i+pmg7BMgSUOpokm1BWax6bnnJbyvsajVtZhnpq1fXm4TY4MTpiRe3cZqUyTUxhqa2y6VD/CSz5H8hE5uTJjxwFhakmPGKU6WJHHpsnzgdkKDl1EU2T15Ca2c/5dbKfgRYIESqiUJqQydrAOgruXDrfqtaTXvYzWlgcD5PgtS1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797747; c=relaxed/simple;
	bh=oDHUcpzQftMlP8c49D7FrgWpZAnZr/1h3lC9OIJ5n/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jstqqLKiVDTvUoudaMYOQBUR2UT67bNgqtAMPsoRBFgd2zOisM/FvtpoDVS8uB1Yk6AhQmrQXNquBvXuezNaAEuRaAI9/3Zkp3uHoH4aa0UU7XKnw+CL4iguzwoo7Qc4IBrDCO0hLa2hUjrIGcwx7xRw+5LStkTwF8/3OcYNDjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UmrzFZdD; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UmrzFZdD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+fOWII5sYjhQ+9VIpa1dCqe9r0l4SA/7foql4v7JLnrt9jHLCaPNCc7wbC1LA4SfC6xxCqgYOFgMrt8YpRwWiBK3VqSGCWSY3cZL+W0lZ8dWQa5lLE0+fbl3TsmxC9xVQKR1oHhJszEaxBr5216CcSMQC/r/MFNKhHbjQ1EIAMz4audiRhN1U3Mv+++Tj7xbCvyryRGHDEkPEdoxpftDL47tDQDLlMXsRU50Y9MycMx+91+5YWXmIAaW+oBvXqDy04cEuozqtfhXQh1tfLhvgG7EOuKxmpuFLNgQlQHqjHofWHimP2rrzYa0GqSACyu7azAIija6nf0dM3qnY34Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDHUcpzQftMlP8c49D7FrgWpZAnZr/1h3lC9OIJ5n/U=;
 b=QzK3g1htq1c771EOIerocrIyItv8SRfGFiwuxq4UCos2tE6gP8es9R18A60RlcvosA60VQF/DLt4wMbl3QOWjbEro/9grdB0mg2euNlbTjlVZhmbLftkr9stWDJkRDpCNVTfPTOjwtAfAoUz6jbyGaCk2daMEsDsTdiSyGFe/8J2PFiuHkQIlp6UmJL7ybQ7U3+2CQPVjTjnBUsnmVHbM3tVQezbaS/LUg5bYpZwKL4waWWqFvrFNLYNYguNujiyUp8/f+Wb4YRxqNJFShOXa4F/LmqfNuvH1JoG1kuf4byFfYQLOhl6OKgTTgpMkZ31vldzrdJyxIviMk5tr3Ocjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDHUcpzQftMlP8c49D7FrgWpZAnZr/1h3lC9OIJ5n/U=;
 b=UmrzFZdDMS2trT8+xtsWRfQ89CjfocblnpltLeQGKPfPuxaxK8aCvWHO0dWRpK0V8jyQRmKvJUSPh7ULCCW2MMxGYwWvPJi9RzgAXDW3uUaL8s3boM1UYttvOR+GPk9ooQT1VfjkeR6U7JKwAfb61TBLcrbXWXE5/WzpyMLzKD8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSRPR01MB11393.jpnprd01.prod.outlook.com (2603:1096:604:22c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:28:57 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:28:57 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v6 05/16] ASoC: rsnd: Add RZ/G3E SoC probing and register
 map
Thread-Topic: [PATCH v6 05/16] ASoC: rsnd: Add RZ/G3E SoC probing and register
 map
Thread-Index: AQHc4j0ZvjbWdLpdiECFtlKX1NNoQbYMsvwAgAFohaA=
Date: Thu, 14 May 2026 22:28:57 +0000
Message-ID:
 <TY6PR01MB17377110DA5E619870C587AA7FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-6-john.madieu.xa@bp.renesas.com>
 <20260514005100.B4896C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514005100.B4896C2BCB3@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSRPR01MB11393:EE_
x-ms-office365-filtering-correlation-id: 2c30654c-776e-4541-67d1-08deb2083035
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|4143699003|22082099003|18002099003|56012099003|11063799003;
x-microsoft-antispam-message-info:
 0Hn+LUlKSmItje5F7vkGNPHXLU57n0Vytra47asSCs8pDNsckwVZrXVJhj1ERiWYTWhF+ACDnyn+I7cCbfsGpGTC+dctfGVXoueSZJ3pU3tdFrsZTWzr27L00nj6OIae0/evb+UJwNgAlWxrv7Awcev50HtuZlXyIRHsSMiz8WH09rEKbb+D5W1zh+F+CeM/FGlFFQYnahnALIWYkb4SOejH7xMNw3u5zkygFRDOhUD7NQgjPL55DzaU3ndbz9m+z2dAJgVA4u6swy6BEnRbeJx8zwx+i3EfRUTvIa/Z6vukJr4s/+m23bx3+UwGAJkyUk7f9CSJXKN51OMKMBZYzs1NYDNh9LobRXQlqvOgtqrm7sLYSsO5q39kEbEXmGfSzwKZl840orUy8S6MiEcK9PYpJn5THuGzXmlMz0iXcunTb1c00WOv4UejXaVO5MtZVbm867S6ezhjCnPrZ5yRi7JUjLminr7LUNaBWTkSuis8xKqwM1ROd88fFZp3ZGEoJjBFPvOKIMxIwinbU6dOy6zw57FAQo+KjzvmEdB35D9uDHsbRm65hjNMKPxlRPfJo0SIU/YNNDHRxYvy0+Yst3gvFkv9bt1ki7yrPYOPqEhvA/x/OQwWXLjM++aFCsWwWQwJ3ODVN+yuv2UxtPB3H44sdW0c3UeYQdD0oTfLaDbAcHWclIoMYzSHIcLoZ9tl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGZkbHRqYmJzalZEak8vUEdEWFpoVzRHSXJEdXRDbDJSTGxUUnRxcWhOaHNk?=
 =?utf-8?B?V0t6aGhUVUUwQVB6QzdkZHFPVDY3RXdEakI1U3VwZUw2aURyVExvRDkrVUM1?=
 =?utf-8?B?ODJ6VmVua2preFA3dUtSQTdzdXdnbWxUZXFzSVdldlRxTm9BOFhwYW1wbXdT?=
 =?utf-8?B?blJvUHo1Sk91ZktINCs2MmoxS3ZieGsrMFVPY2JWM2tLbFhIQkZQNTA4Z1VP?=
 =?utf-8?B?STl1TWhKT25Va0tNTW9ZTmFVS2xlSWJrWFlWT1gzWjNuWmVvSWYzb2UrUURa?=
 =?utf-8?B?V1pERkdPVkpETklyZnVxNzBzenVWc0F1NnNWdTdaYWJBSkNaMlhIVytkKytP?=
 =?utf-8?B?L3dOdzJLTnQ0emZGdVNMRDVpajVaL1VkYkU5WGk4WFgwd1E0SU5GM2hjNXJs?=
 =?utf-8?B?cm5wRk9MTVNRTEVNRitwckU0cVM0eDQySWlMNWoweGI0bzR2b1hHeDdjQUxm?=
 =?utf-8?B?QWJ5TUNRbzNKcEJHV1RIbi9RdWdwV2w3YlVha1Q1NjdIL0Q2VEt0Ym1EdU9k?=
 =?utf-8?B?NFhHWVlzNEJIdVBhNkdyd1RLL21yTTVWZDVQbDV2MjdXbnpsT003OUs5Q2or?=
 =?utf-8?B?MDRWWTZSeDFLaDRzdTJramM0VVlNYldSbjVhMnJVdXR6dzRFcnE2RE5aTCti?=
 =?utf-8?B?eTVvcGZsK002UVk0TnJtQnNtQjhQZi96ZytUSS9NTHlKWmMvUDNkZWdHdnZ5?=
 =?utf-8?B?ckNrRDB6bHJTQjMrR0ptZ3loZi9NWGxvb25VYThIQWJpUUlmY3RPeVBqYnRh?=
 =?utf-8?B?M1h4azBmYWhUQkNZS2trcTllaEdCVHNDWjRKc2xuM292aHF5UnZRTlBidnA5?=
 =?utf-8?B?eWY5QjNWeVk0eXJaZWV0ZlNYZ0FCUitVWUVaWlN0OEg0VmVTRkxibjY1aFRI?=
 =?utf-8?B?dGRCTUhPeFV0T0ZZK1Z4QzdIUUlRcUJZZmhjRjlNNXkzbWZZbGVhWFdYWGVm?=
 =?utf-8?B?NXFIOHRmZjZsMU02OE5IY0g2MldWWFAvOEdXRDJXTlQ2SmxaenhsSUo1M3cx?=
 =?utf-8?B?L2I2cGx6UXVWbHFjdzBCQmd1U0JGSE8yNnpVOWUvN1E4TTlGL0FacXA4dmd6?=
 =?utf-8?B?L0xxS0p5WVdJcklvbWJjNEFyNXRpV2lVaTJnWVBEdlBmcHBPZ0o3RGdHR0Nq?=
 =?utf-8?B?eXR1bS82VmZiSWJHa2EzVHh4bHlzRld6VFFpL0tLSjhmZWdrKzZQTzZkN3N4?=
 =?utf-8?B?ZjJiZmdvdWorMVpOT3MwU2UyY002WmNiM2ZyNGc0dCtwa2QxZ1VJaHFhbGxx?=
 =?utf-8?B?MmxJQTEwa2RXY3RlT3NRbU04YUQzd2lSQ2JmcGhxcTBpWWorSmN5cGkyZ2xn?=
 =?utf-8?B?blNZbi9DWjlUa2IvenRuQmZCSFZLb2RiN3lNbCtyb2s3SXZUSnhDZSttcEx5?=
 =?utf-8?B?KzE1TlQ0cm85Y2VhYW5GWFh1T2FJOS9oRmlPTldkd2d5Z1UwSVFMRysrMU1h?=
 =?utf-8?B?bFh2eTUyZ3FjQWRwdmFZNVV3TjFBaWFiS1VqL3ZVbDFnL2hpbm1JMEl1dmo3?=
 =?utf-8?B?UHg1NUo2KzVJdi9KeHh0bzYvVkVmZWdhd3VNL3U0aWl2bUJDNmdZUjErZ3JC?=
 =?utf-8?B?Wm9BUGowdDR4NUZTR3ZYN0tMZEhJMURndXdSdFg5V2dZVTBuL1RBMGwwdWFu?=
 =?utf-8?B?ODdLUnhJVkg3Zmh3TDJ6KzJDd05BUUhqV28xSGlRQVdVRlMyTjdxWjNJQVJB?=
 =?utf-8?B?Skw2czJQeHJCb1YxZVVaNFg3RzJMMEp4R2FuZ3ptd1hiUHp5a0VxWDVHY1E3?=
 =?utf-8?B?NnE0VmJvcU04dnIrcVF3QmMyTUdwQlMxQ0lKOVU5UXUzQWIxcUUxaXlEMWo2?=
 =?utf-8?B?RnhKUndKM0lYRW95NTV0TXFtSmRXbnRVQkNORE9NdTR4eW1QSmZjRjIrekV5?=
 =?utf-8?B?QTRNMVl4bmJCZXhhYThNMmpFUmV6RFR0UGNWdytuVHdLMUEvbEJIeTNSUHQy?=
 =?utf-8?B?blgzVVlCZm9tMHVvMmkrL3FiWkdMQy9OTFRkajJMVmJ2K3lNNGpoaUhVMS9l?=
 =?utf-8?B?TW82UkZ6WEFJbzdCbWtBMGhaRFRRV0Z2dzFCUXBUUDBYTENxekxFWTcxekxE?=
 =?utf-8?B?RWwzZkw4bXdwcUFTZjlHQ0RjRGVLMkRKSnZUVVlRVkd4VWEwK3lhVVdJTkVE?=
 =?utf-8?B?empraVQwODRFT3Q4M0JXbXBQcFkwYTVLSDNVRWtBMGlydTRJZFRVK0lJdGsx?=
 =?utf-8?B?RFNYMlFkZk5qZ3h0RE5KdEUwOU4zTkh2R1hnQUh2MFNlMEtSK09ZM2UwcENa?=
 =?utf-8?B?Q0RjTU1zZTFLc1VpZ2hkMGNEWDNxVkZOM1pMMWl5cnN3YjRDSmZDaUpydzVx?=
 =?utf-8?B?MTAvK3pRR1c0NHc4NmRQeVdzeUk0UzY2Q0lGNWEzQmVkdDloN1VENWlSZEJW?=
 =?utf-8?Q?b6QFdMWhjSGtBMBk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c30654c-776e-4541-67d1-08deb2083035
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:28:57.1340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjrMVg6/il2LQWSyevtLq7Mn9snWyu2fXvINM/nte7S8TSEClcYFbxPKmf03dD2fUI20etlOnv6mCB88HSZWCfmPO4I1Q87fXYlW2Fwg8ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11393

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDAyOjUxDQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTZdIEFTb0M6IHJzbmQ6
IEFkZCBSWi9HM0UgU29DIHByb2JpbmcgYW5kDQo+IHJlZ2lzdGVyIG1hcA0KPiANCj4gW1lvdSBk
b24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnLiBMZWFybiB3
aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRl
cklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24h
IFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsDQo+IGlzc3VlKHMpIHRvIGNvbnNp
ZGVyOg0KPiAtIFtIaWdoXSBVbm1hcHBlZCBQSU8gZGF0YSByZWdpc3RlcnMgY2F1c2UgYW4gSVJR
IHN0b3JtIGFuZCBsb2cgc3BhbSBpZg0KPiBQSU8gZmFsbGJhY2sgb2NjdXJzIG9uIFJaL0czRS4N
Cj4gLS0NCj4gDQo+IGNvbW1pdCBjMDI0NTA5ZjkzYTQ2MDg3Y2NiZWE4NjlmYmJjZWY5MjNiYTE0
NjQ0DQo+IEF1dGhvcjogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gQVNvQzogcnNuZDogQWRkIFJaL0czRSBTb0MgcHJvYmluZyBhbmQgcmVnaXN0ZXIg
bWFwDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBSWi9HM0UgYXVkaW8g
c3Vic3lzdGVtLCB3aGljaCBoYXMgYQ0KPiBkaWZmZXJlbnQgcmVnaXN0ZXIgbGF5b3V0IGNvbXBh
cmVkIHRvIFItQ2FyIGdlbmVyYXRpb25zLiBJdCBpbnRyb2R1Y2VzIHRoZQ0KPiBuZXcgU29DJ3Mg
cmVnaXN0ZXIgbGF5b3V0cyBhbmQgcHJvYmUgc3VwcG9ydC4NCj4gDQo+ID4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvZ2VuLmMNCj4gPiBiL3NvdW5kL3NvYy9yZW5lc2FzL3Jj
YXIvZ2VuLmMgaW5kZXggZDFmMjBjZGU2NmJlMS4uMDVkNWY2NTZmYjAxYw0KPiA+IDEwMDY0NA0K
PiA+IC0tLSBhL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvZ2VuLmMNCj4gPiArKysgYi9zb3VuZC9z
b2MvcmVuZXNhcy9yY2FyL2dlbi5jDQo+IFsgLi4uIF0NCj4gPiArc3RhdGljIGludCByc25kX3J6
ZzNlX3Byb2JlKHN0cnVjdCByc25kX3ByaXYgKnByaXYpIHsNCj4gWyAuLi4gXQ0KPiA+ICsgICAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnNuZF9yZWdtYXBfZmllbGRfY29uZiBjb25mX3NzaVtdID0g
ew0KPiA+ICsgICAgICAgICAgICAgUlNORF9HRU5fTV9SRUcoU1NJQ1IsICAgICAgICAgICAgICAg
ICAgIDB4MDAsICAgMHg0MCksDQo+ID4gKyAgICAgICAgICAgICBSU05EX0dFTl9NX1JFRyhTU0lT
UiwgICAgICAgICAgICAgICAgICAgMHgwNCwgICAweDQwKSwNCj4gPiArICAgICAgICAgICAgIFJT
TkRfR0VOX01fUkVHKFNTSVdTUiwgICAgICAgICAgICAgICAgICAweDIwLCAgIDB4NDApLA0KPiA+
ICsgICAgIH07DQo+IA0KPiBJZiB0aGUgUlovRzNFIGF1ZGlvIHN1YnN5c3RlbSBmYWxscyBiYWNr
IHRvIFBJTyBtb2RlIChlLmcuLCBpZiBETUEgY2hhbm5lbA0KPiBhbGxvY2F0aW9uIGZhaWxzIG9y
IHRoZSBwaW8tdHJhbnNmZXIgZGV2aWNlIHRyZWUgcHJvcGVydHkgaXMgc2V0KSwgd2lsbA0KPiB0
aGlzIGNhdXNlIGFuIGludGVycnVwdCBzdG9ybT8NCj4gDQo+IFRoZSBjb25mX3NzaSByZWdtYXAg
Zm9yIFJaL0czRSBpbnRlbnRpb25hbGx5IG9taXRzIHRoZSBTU0lURFIgYW5kIFNTSVJEUg0KPiBk
YXRhIHJlZ2lzdGVycy4NCj4gDQo+IElmIFBJTyBtb2RlIGlzIGVuZ2FnZWQsIHJzbmRfc3NpX3N0
YXJ0KCkgZW5hYmxlcyB0aGUgRGF0YSBJbnRlcnJ1cHQNCj4gKERJRU4pLg0KPiBXaGVuIHRoZSBp
bnRlcnJ1cHQgZmlyZXMsIHJzbmRfc3NpX3Bpb19pbnRlcnJ1cHQoKSB3aWxsIGF0dGVtcHQgdG8g
YWNjZXNzDQo+IFNTSVJEUiBvciBTU0lURFIuIEJlY2F1c2UgdGhleSBhcmUgbWlzc2luZyBmcm9t
IHRoaXMgcmVnbWFwLCB0aGUgYWNjZXNzDQo+IHdpbGwgYmUgaW50ZXJjZXB0ZWQgYW5kIHNraXBw
ZWQsIHJldHVybmluZyBhbiB1bnN1cHBvcnRlZCByZWdpc3RlciBhY2Nlc3MNCj4gZXJyb3IuDQo+
IA0KPiBCZWNhdXNlIHRoZSBoYXJkd2FyZSBGSUZPIGlzIG5ldmVyIHNlcnZpY2VkLCB0aGUgbGV2
ZWwtdHJpZ2dlcmVkIERJUlENCj4gY29uZGl0aW9uIGlzIG5ldmVyIGNsZWFyZWQsIHJlc3VsdGlu
ZyBpbiBhbiBJUlEgc3Rvcm0gdGhhdCBoYW5ncyB0aGUgQ1BVDQo+IGFuZCBmbG9vZHMgdGhlIGtl
cm5lbCBsb2cuDQo+IA0KPiBBIGxhdGVyIGNvbW1pdCBpbiB0aGUgc2VyaWVzIGNsYWltcyAiU1NJ
IGFsd2F5cyBvcGVyYXRlcyBpbiBCVVNJRiBtb2RlDQo+IHdpdGggbm8gUElPIGZhbGxiYWNrIiwg
YnV0IHNob3VsZCB0aGlzIGNvbnN0cmFpbnQgYmUgZXhwbGljaXRseSBlbmZvcmNlZA0KPiBpbiB0
aGUgY29kZSB0byBwcmV2ZW50IHRoaXMgSVJRIHN0b3JtIGZyb20gb2NjdXJyaW5nPw0KDQpIYXph
cmQgaXMgcmVhbCBpZiBQSU8gbW9kZSB3ZXJlIHJlYWNoYWJsZSwgYnV0IG9uIFJaL0czRSBpdCBp
cyBub3QuDQpBIHZhbGlkIFJaL0czRSBEVCBjYW5ub3QgcmVhY2ggdGhlIFBJTyBwYXRoLCBzbyBu
byBydW50aW1lIGd1YXJkIGlzDQphZGRlZC4NCg0KUmVnYXJkcywNCkpvaG4NCg0KPiANCj4gPiAr
ICAgICBpbnQgcmV0Ow0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTEyMTgyNjMxLjM4NDIwNjUtDQo+IDEtam9obi5t
YWRpZXUueGFAYnAucmVuZXNhcy5jb20/cGFydD01DQo=
