Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFAF40FD92
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835265; cv=fail; b=OLtBHzMAgTmhJXzzmrxPdmoNH01TReejB8BQvNEcta6Qq44xyrLTJSZNQgr4P+5WVP7qpJXs6geGdFFEABPKID4ikMK+P0wpWe1Tt+HufXd7Z+0lLmDajKIj3nLB7vRd1I5hrrzi8mPBDcjAX9YMs4vy7+Hh2h8t2DaIYdeOwmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835265; c=relaxed/simple;
	bh=3rpjY6wVoKM+cSax+qWTlGyMoyRrhEx1U1IV89oppV0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hPfJmSL7GSscQ+utLDuAOn0b0szNYx7QZii9/kwG5Ets3fRLyQKea7cmPKQoVsOXqoBL59bJPVb90wYn3sHSEuhi1Tp9gX0iILefWBY5xae3FlEx9oFgmRgWFIJydBoIi+I4ORqqAbEKj5mPLQ4xvqrcmoxVRNHg0Ld1Wn6MDQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ExPkFxAd; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ExPkFxAd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPrps6/jQI/husrW7pEc8yRuFKOwBUM88TX/M04X86bTDXlfWFy533NbD5OI5mvSd7aoQWt9JK5Y3q/DVTTvE7UrKuf+N/ogSEmKgEWqB9UTsNYEUuvfB3LVRWsiZYmrzaySnyXmDfjZTJhB9s7oPQz6ydfPfqXZNqa2HfKiOBJUITVw8vEDwet1ajxWVoAKP4nyAXyAbE7WLUB+Yg30FttyeHDPk95tsJGZzVnpXZhO7TFepyje9aIsK4o4kfRBSigVqfxtnLgN2Sq6DjHYdRnYV0fmEys6Ml3GApE17yNwsjZfd+AGI7ab8PzZgmU/XRdbMGNurVknWhufdjwtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rpjY6wVoKM+cSax+qWTlGyMoyRrhEx1U1IV89oppV0=;
 b=g0iVo0zfHQP60iIkc68CpLahmnRzctjzYodh4v72A0LAtym4KyViZ9Xf3DBR4qEOem5u8MI/6zstRPpAiSpvuOBRW1Qa39n1+fBmdq06uwXTkomlV8/UQNrImci25Me+1EX4NIPDoiTLHE8hn/B4JO+phLQqoZrpgjzQZu5CnnhhPH4+t8ZIUYg3Xi2YfrUDtnGITs0qoKcO3EpUFTD3A33L1jIAs2dwaEDXGKDKcRxedPy9gCGF9dn/G5C/sYwB8AkJlDfNxuGTBFmTjeMmdAcBu+LnUCzAmvDtik78OdVb+kl1Y/z1f8yENXqKlUe8JhAoWuUGKlLQoZe83L5v9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rpjY6wVoKM+cSax+qWTlGyMoyRrhEx1U1IV89oppV0=;
 b=ExPkFxAdwGzUbxgj0v8yGUSAHJ74mEd9B8mcRU7JzTO+sAAA3Szww7jw6dOxW6DHDBPlNh//R4Gzfaj8XLC5EtAOqaWDBiO4gJMNIe/XPmjRCkGrB9uMBao6CldfJJmFZvpoiuX6QB0SI5rZCtX+6aniH0QRx1yqrdSd2uladWk=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSZPR01MB7700.jpnprd01.prod.outlook.com (2603:1096:604:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 15 May
 2026 08:54:19 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:54:11 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Thread-Topic: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Thread-Index: AQHc4+T6PYo9V+SM4EiVqK6sBkQi9LYODVQAgAC4YvA=
Date: Fri, 15 May 2026 08:54:11 +0000
Message-ID:
 <TYCPR01MB120937E7AC5A8A8648579E47CC2042@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
 <20260514214228.9A08DC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514214228.9A08DC2BCB3@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSZPR01MB7700:EE_
x-ms-office365-filtering-correlation-id: b5a82f2d-e7c9-4eab-6b86-08deb25f8889
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|11063799003|4143699003|18002099003|4133799003|38070700021|3023799003;
x-microsoft-antispam-message-info:
 KUUyBZUQo3KPkFE2bBdwcOSspnel9xAV6z2hWKFyZt5QbsQQF8ayIKFFWqdcY/ZYuSR/Yfka/nkJ5MulkImuBsVOyWbAB5QWmC0WN4+MkLhE0JYxZrCxdN4ZvdradWBuORhVNtaPYvJrvJHiQasbK9X0lKxb7gzFl0xDf8NUbSkwPeEe8rlgqmLv4H2kcNrpTitR5/5zi/v2117AA35E9xX7KLx3DrBVuFO25mBhmkaGXTxoMT0ZDmTFF/Ym7VjpMfp769MaN9x2lcMT/WiBgTKKWvdMNyRi17TeAasNNlPwerwCjt84rsVrpdo2fQ8YrZEZtZyHCtp8h73TPtq/2v1XUDVh+Fynqu2zETVfWBL7vGxMpFL9PBfkfexeOyC0bbASWgUfbcvqt5EK6HtM5kUXU6JZUcJk94OHroyuxD2aM8uhfVstItjY04S/W1h8DSAR+GQmc0q/XAdVuKP+Wr8/IkL0t2V5vOmMR147lHdZ39hCbDGdkYrSGyl6zVQiuWpKo3L2QEAS739lbomdjlX76f3AZTP1JjvCYGcFY/6wuEeGKLi5o3tcr15k8x1+Lp5162WkYiiitGGGnw0RgWFzhbnUrAvJxVsTvfvgWuI6jISRKTmsKjdCuIpkSVduT5Gi9FgGIHd28hZak/pHNcrmJpsZEJUF0ycBWmuoL5EigUkJQTDOYsgTG+uqbIS2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(11063799003)(4143699003)(18002099003)(4133799003)(38070700021)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjBQRStGaTZJMGpIV0RseStkVkg3aDhtcVRhbW95ZlpPbDNjTUY2RXBWR3Bs?=
 =?utf-8?B?TTVhUWVJUHBHT0M2Rk1CVy80bXB5QUczYVdtRDR3cy9aa1p0bFFscVpNbFhu?=
 =?utf-8?B?S1FFWEVLYWE4UEFlQlBheDJRRjI3Sk5QZ1RhUlpEdDhBWnZsSnlXUFMyaDFP?=
 =?utf-8?B?U1BkTFBqR254alpORTJnL2tSclFoaEFKQzhwTEh3WUYzZ0RSb3NyekZIb1RR?=
 =?utf-8?B?anUyelBlelNjZW9GRmYxUlEwVHlRTzRiZGlYSjl0NDVjL3VjakgrRExWVVJn?=
 =?utf-8?B?L1prR3U2MEtZN0dJbGZtenpLcFVKM0E2dmhpNWhidTlFaEduNlpYK2JGbmtJ?=
 =?utf-8?B?U01naUJOZDlQU1RRTnFMYVhEYmM5cUNZZ2doQUJNcmY5TVg5SkR2QUs3aGFZ?=
 =?utf-8?B?K1ZsUnVxaFluVEh3dlhFcVhTaTM1SnB5UWJOME5uTWl3cUdiQUxQcC9TZ2E5?=
 =?utf-8?B?WWpJaFNZZG9VVkw5QTRqNkQ5Rjh1eWR4b2tLREZHSGt2b0dKRlluSm5vUDEz?=
 =?utf-8?B?Vm9IMUtQSWdiSXNBNlRGQ3VKL3Z1YUdsVUM5NmRybXRLODNENW81K1VuQVE4?=
 =?utf-8?B?QUwxWVJyRkYydDQ1R25iR3hrajRrb0VJcUdocGRIaDFyZVJKQXdlYlhLUjE4?=
 =?utf-8?B?c3lCYWUxTFZxWHJJZzdHQzJ4ZXBMZk9WdjJPYVNLV1htdVA0SDRwNlJ6RFlZ?=
 =?utf-8?B?cU1DK2JhN1pMdEd6UitXNmExb2ZVcVV4OWF1UW5BUkhQdVMxMlRKdG9MN2Q2?=
 =?utf-8?B?ME95UlNvZGx3d2JSelpYdEsvamVFdHJUbVRreTJwbHY5REVUUTZuSVBLNmxx?=
 =?utf-8?B?KzFXeWh2dWdNMGlpTG1maC9pTW5KKzg4bjBFV1lRdURoM1ZiRWkvRTZyMWNk?=
 =?utf-8?B?Z1ROYzhMWkp5N2t4TzVFS1dHUkZBaStFaFRWZm9hamkwZk1tT01GQzRKWm1B?=
 =?utf-8?B?RVJUcDgyY09acTdMejhvMlZndms4WjZhbWJ1Y252dk04VnFJMzNJckVsaitT?=
 =?utf-8?B?VmhYd2xEM3hveVNoa3l3cHBhcW9DdFhuWTBjemVpTnVmYXp2ZkZETjlnMzZL?=
 =?utf-8?B?ZVp2RHUzVTlVN2FJZ1Q1cUZjYkhLbVZFYXZVeXZXelNWbW5NTjlzZUFBSjli?=
 =?utf-8?B?L3FacWlXUFpscU4xVFY1MDhTZkRxUXY0V091TjVvUjNjRXM0UkJROGJ5QkVG?=
 =?utf-8?B?S3gvWURsaVBpS2lEWVBvYksxcUxqcVovRTBDQ2JYT015azRNdGQvalExeDQ4?=
 =?utf-8?B?Mk1MWEVNNVNTNytsN0xBWU9za09OL25ybyt1R2hRRUFFNVhRRlBiQ2diTEZu?=
 =?utf-8?B?VFhEKy9FWVdkcndFMGlxcEg5enkvME1SZUpVKzFZVFdXRTBHMkFGZFJCY2JJ?=
 =?utf-8?B?ZkRmcXcyRjBaNHoyNGFURm9FdUV3SVAzSWcxeUMvMXdORXFLOEQzY0o0SmNp?=
 =?utf-8?B?LzVGakNVd2V0VFRFMlpPTlA1WjV1K3JibWZ6TWN2V09ISDBGcHNmNGI2aS9G?=
 =?utf-8?B?Y2tCc3B2YWhXSDhYbUVOdXl5QW5WZTJqTkIzN2crSlpNUFh2N1hkMVhLMllG?=
 =?utf-8?B?YkR1cVBBZXlRUi9OWDV0NllnSnhyRlAyZnlqZDFxUzVCbXpXekdFZ2x0dlhK?=
 =?utf-8?B?dEp6Ym1xVEE0aldHSEZmVWVtZ2t4Y3FtcENXQkZJRzFQMjdERDIxdTVobGp0?=
 =?utf-8?B?ODNMYi9HNTNESXRteDhFOExoUDdKQWFUd2NPd1hEMFF2SGV1c0lhKzNJRjFL?=
 =?utf-8?B?ZWFaM1RIejBVeit1S3lKVmxJWVJxUTJMdm9qS1RuL1UxVDBCOFR5YkUvY3lU?=
 =?utf-8?B?Y2htc1RmaFAzdjA3aWxLbWNudktHOXB1dzc4MjhtbmJ0SndCWk8yLzdxZkVT?=
 =?utf-8?B?b25VMHdqbHQxMUhkSTFvcmVxdnd5NVplNXVSOVVhdTg3ajI0SDZjL3BLV2Vk?=
 =?utf-8?B?THIvTDVTcWxNbE9jWExKWVlzTThrV0ZES3d3SmhEaFNvdzM5Tnc0UzlRYnVn?=
 =?utf-8?B?MmFCVmhwQXVpKzYrazJTT1FaaXorWGhOeWZsRnpjOFhJS0hJb3pDZGE0WUs0?=
 =?utf-8?B?MXd1WVR6WXU3UVZTbmp0SWdRd3NJendkVEliS2I1MlBsc2lSajlDN0FrWHhT?=
 =?utf-8?B?OEMvbjV1aG5wcytvbUhzRnBjSERISE0wUjVwSTFHYm84UHFISFExWWRyUS9q?=
 =?utf-8?B?ZmFLeVR1WEFaendnNFNWbnJxdjMyNVNMS1VxWFM1OHlCbzhMY0pnSzMvbjJs?=
 =?utf-8?B?MTZPcUYrVXpzUm9jMDhDVnZ4aCtnd0VKL0VWWVNXSDBPd3p2VSttcjVCS2Zt?=
 =?utf-8?B?UWhEdDcrMXhrOElMRWcza2JndXlUQWhlYlc5VndwWUpOMnhLQ0hRMmlPSDBU?=
 =?utf-8?Q?p/LQYt5M045UGN2c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a82f2d-e7c9-4eab-6b86-08deb25f8889
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:54:11.5030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxrD9o/12YqeIrQ7ZxBQGdEehA+tqkgGm5Qcb4EVmhIIHvDJBshDBEJ2Dfl6dLUJ7i8bfnDb1INj4CUtNLtiOCt6MgaOG9vkEw9WY4eO7bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7700

PiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0K
PiBTZW50OiAxNCBNYXkgMjAyNiAyMjo0Mg0KPiBUbzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXpp
by5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+IENjOiB3c2ErcmVuZXNhcyA8d3NhK3JlbmVzYXNA
c2FuZy1lbmdpbmVlcmluZy5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsga3J6aytk
dEBrZXJuZWwub3JnOw0KPiByb2JoQGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGR0czogcmVuZXNhczogcnp0MmgtbjJoLWV2
azogQ29uZmlndXJlIGVNTUMvU0RISSBwaW5zDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29u
dHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0
byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gQWRkaW5nIHBpbiBjb25maWd1cmF0aW9uIHByb3BlcnRp
ZXMgY2F1c2VzIHRoZSBNTUMgZHJpdmVyIHByb2JlIHRvIGZhaWwgYmVjYXVzZSB0aGUgcGluY3Ry
bC0NCj4gcnp0MmggZHJpdmVyIGxhY2tzIHBpbmNvbmYgc3VwcG9ydC4NCj4gLSBbTWVkaXVtXSBD
YXJkIERldGVjdCAoQ0QpIHBpbnMgYXJlIGluY29ycmVjdGx5IGdyb3VwZWQgd2l0aCBDTUQgcGlu
cywgaW5hcHByb3ByaWF0ZWx5IGFwcGx5aW5nIGhpZ2gtDQo+IHNwZWVkIHNldHRpbmdzIGxpa2Ug
J2lucHV0LXNjaG1pdHQtZGlzYWJsZScgdG8gYSBtZWNoYW5pY2FsIHN3aXRjaCBpbnB1dC4NCj4g
LS0NCj4gDQo+IGNvbW1pdCA5MGE2NDQ2ZGU3NmFmOTViOTE1ZWY1OWQwMDM1NDgxMzk0MDI5ODQ4
DQo+IEF1dGhvcjogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5j
b20+DQo+IA0KPiBhcm02NDogZHRzOiByZW5lc2FzOiByenQyaC1uMmgtZXZrOiBDb25maWd1cmUg
ZU1NQy9TREhJIHBpbnMNCj4gDQo+IFRoaXMgY29tbWl0IGNvbmZpZ3VyZXMgdGhlIGVNTUMgYW5k
IFNESEkgaW50ZXJmYWNlIHBpbnMgZm9yIHRoZSBSZW5lc2FzDQo+IFJaL1QySCBhbmQgUlovTjJI
IEVWSy4gSXQgYWRkcyBkcml2ZSBzdHJlbmd0aCwgc2xldyByYXRlLCBhbmQgU2NobWl0dA0KPiB0
cmlnZ2VyIHNldHRpbmdzIGZvciB2YXJpb3VzIGJ1cyBtb2Rlcy4NCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yenQyaC1uMmgtZXZrLWNvbW1vbi5kdHNp
DQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6dDJoLW4yaC1ldmstY29tbW9uLmR0
c2kNCj4gPiBpbmRleCA1MTAzOTlmZWJmMjk1Li4yYjQzODUyMjU3OTc0IDEwMDY0NA0KPiA+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yenQyaC1uMmgtZXZrLWNvbW1vbi5kdHNp
DQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6dDJoLW4yaC1ldmstY29t
bW9uLmR0c2kNCj4gPiBAQCAtMjc0LDEyICsyNzQsNjMgQEAgZGF0YS1waW5zIHsNCj4gPiAgCQkJ
CSA8UlpUMkhfUE9SVF9QSU5NVVgoMTIsIDcsIDB4MjkpPiwgLyogU0QwX0RBVEE1ICovDQo+ID4g
IAkJCQkgPFJaVDJIX1BPUlRfUElOTVVYKDEzLCAwLCAweDI5KT4sIC8qIFNEMF9EQVRBNiAqLw0K
PiA+ICAJCQkJIDxSWlQySF9QT1JUX1BJTk1VWCgxMywgMSwgMHgyOSk+OyAvKiBTRDBfREFUQTcg
Ki8NCj4gPiArCQkJZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NTAwMD47DQo+IA0KPiBEb2Vz
IGFkZGluZyB0aGVzZSBwaW4gY29uZmlndXJhdGlvbiBwcm9wZXJ0aWVzIGNhdXNlIHRoZSBNTUMg
ZHJpdmVyIHByb2JlIHRvDQo+IGZhaWw/DQo+IA0KPiBJdCBhcHBlYXJzIHRoZSBwaW5jdHJsLXJ6
dDJoIGRyaXZlciBsYWNrcyBwaW5jb25mIHN1cHBvcnQsIGFzIGl0cw0KPiBkZXNjLT5jb25mb3Bz
IGlzIE5VTEwuDQoNClN1cHBvcnQgZm9yIGl0IGhhcyBiZWVuIHZpYSB0aGUgYmVsb3cgc2VyaWVz
LCBhbmQgaXQgd2lsbCBhcHBlYXIgaW4NCnY3LjENCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJlbmVzYXMtc29jL0NBK1YtYThzUmdPZVBmckVHMkhmTXAzWG5DWVhSYXk1OHM5Zldqamc4
eUxqcVlGdmRuQUBtYWlsLmdtYWlsLmNvbS9ULyN1DQoNCg0KPiANCj4gV2hlbiB0aGUgTU1DIGRy
aXZlciBwcm9iZXMgYW5kIGF0dGVtcHRzIHRvIHNlbGVjdCB0aGUgZGVmYXVsdCBwaW4gc3RhdGUs
DQo+IHBpbmN0cmxfY29tbWl0X3N0YXRlKCkgd2lsbCBjYWxsIHBpbmNvbmZfYXBwbHlfc2V0dGlu
ZygpLiBCZWNhdXNlIG9wcyBpcyBOVUxMLA0KPiBwaW5jb25mX2FwcGx5X3NldHRpbmcoKSBsb2dz
ICJtaXNzaW5nIGNvbmZvcHMiIGFuZCByZXR1cm5zIC1FSU5WQUwuDQo+IA0KPiBUaGlzIHN0cnVj
dHVyYWxseSBhYm9ydHMgdGhlIHN0YXRlIHRyYW5zaXRpb24sIHdoaWNoIHdvdWxkIGNhdXNlIHRo
ZSBlTU1DDQo+IGFuZCBTREhJIGludGVyZmFjZXMgdG8gYmVjb21lIGNvbXBsZXRlbHkgdW51c2Fi
bGUuDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0yOTgsMTIgKzM0OSw0OSBAQCBkYXRhLXBp
bnMgew0KPiA+ICAJCQkJIDxSWlQySF9QT1JUX1BJTk1VWCgxMiwgMywgMHgyOSk+LCAvKiBTRDBf
REFUQTEgKi8NCj4gPiAgCQkJCSA8UlpUMkhfUE9SVF9QSU5NVVgoMTIsIDQsIDB4MjkpPiwgLyog
U0QwX0RBVEEyICovDQo+ID4gIAkJCQkgPFJaVDJIX1BPUlRfUElOTVVYKDEyLCA1LCAweDI5KT47
IC8qIFNEMF9EQVRBMyAqLw0KPiA+ICsJCQlkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw1MDAw
PjsNCj4gPiArCQkJc2xldy1yYXRlID0gPDE+Ow0KPiA+ICsJCQlpbnB1dC1zY2htaXR0LWRpc2Fi
bGU7DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJY2xrLXBpbnMgew0KPiA+ICsJCQlwaW5tdXgg
PSA8UlpUMkhfUE9SVF9QSU5NVVgoMTIsIDAsIDB4MjkpPjsgLyogU0QwX0NMSyAqLw0KPiA+ICsJ
CQlkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw5MDAwPjsNCj4gPiArCQkJc2xldy1yYXRlID0g
PDE+Ow0KPiA+ICAJCX07DQo+ID4NCj4gPiAgCQljdHJsLXBpbnMgew0KPiA+IC0JCQlwaW5tdXgg
PSA8UlpUMkhfUE9SVF9QSU5NVVgoMTIsIDAsIDB4MjkpPiwgLyogU0QwX0NMSyAqLw0KPiA+IC0J
CQkJIDxSWlQySF9QT1JUX1BJTk1VWCgxMiwgMSwgMHgyOSk+LCAvKiBTRDBfQ01EICovDQo+ID4g
KwkJCXBpbm11eCA9IDxSWlQySF9QT1JUX1BJTk1VWCgxMiwgMSwgMHgyOSk+LCAvKiBTRDBfQ01E
ICovDQo+ID4gIAkJCQkgPFJaVDJIX1BPUlRfUElOTVVYKDIyLCA1LCAweDI5KT47IC8qIFNEMF9D
RCAqLw0KPiA+ICsJCQlkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw1MDAwPjsNCj4gPiArCQkJ
c2xldy1yYXRlID0gPDE+Ow0KPiA+ICsJCQlpbnB1dC1zY2htaXR0LWRpc2FibGU7DQo+ID4gKwkJ
fTsNCj4gPiArCX07DQo+IA0KPiBJcyBpdCBzYWZlIHRvIGFwcGx5IGlucHV0LXNjaG1pdHQtZGlz
YWJsZSB0byB0aGUgQ2FyZCBEZXRlY3QgKFNEMF9DRCkgcGluPw0KDQpUaGlzIGlzIGFzIHBlciBI
VyBtYW51YWwsIGFuZCBubyBpc3N1ZSB3YXMgb2JzZXJ2ZWQgZHVyaW5nIHRlc3Rpbmcgc28gZmFy
Lg0KDQpDaGVlcnMsDQpGYWINCg0KPiANCj4gVGhlIENhcmQgRGV0ZWN0IHBpbiBjb25uZWN0cyB0
byBhIG1lY2hhbmljYWwgc2xvdCBzd2l0Y2gsIHdoaWNoIHR5cGljYWxseQ0KPiBleHBlcmllbmNl
cyBjb250YWN0IGJvdW5jZSBkdXJpbmcgY2FyZCBpbnNlcnRpb24gYW5kIHJlbW92YWwuIFNjaG1p
dHQgdHJpZ2dlcnMNCj4gYXJlIHJlcXVpcmVkIHRvIHByb3ZpZGUgaHlzdGVyZXNpcyBhbmQgZGVi
b3VuY2Ugc3VjaCBzaWduYWxzLg0KPiANCj4gRGlzYWJsaW5nIHRoZSBTY2htaXR0IHRyaWdnZXIg
b24gdGhlIENEIHBpbiByZW1vdmVzIHRoaXMgZXNzZW50aWFsIHByb3RlY3Rpb24sDQo+IG1ha2lu
ZyB0aGUgc3lzdGVtIHN1c2NlcHRpYmxlIHRvIG5vaXNlIGFuZCBmYWxzZSBjYXJkIGRldGVjdGlv
biBpbnRlcnJ1cHRzLg0KPiANCj4gRnVydGhlcm1vcmUsIGNvbmZpZ3VyaW5nIG91dHB1dCBwcm9w
ZXJ0aWVzIGxpa2UgZHJpdmUgc3RyZW5ndGggYW5kIHNsZXcgcmF0ZQ0KPiBvbiBhIHB1cmUgaW5w
dXQgcGluIHNlZW1zIHNlbWFudGljYWxseSBpbmNvcnJlY3QuDQo+IA0KPiBTaG91bGQgdGhlIENE
IHBpbiBiZSBpc29sYXRlZCBpbnRvIGl0cyBvd24gY2QtcGlucyBzdWJub2RlIHdpdGhvdXQgdGhl
c2UNCj4gaGlnaC1zcGVlZCBwcm9wZXJ0aWVzLCBhbmFsb2dvdXMgdG8gaG93IFNEMF9SU1QjIHdh
cyBjb3JyZWN0bHkgc2VwYXJhdGVkIGluDQo+IHRoZSBlTU1DIGNvbmZpZ3VyYXRpb24/DQo+IA0K
PiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA1MTQyMTAyMjAuNzYxNi0xLQ0KPiBmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5j
b20/cGFydD0xDQo=
