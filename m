Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1787914A8B;
	Wed,  1 Jul 2026 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873953; cv=fail; b=eUpJmKGfhb/CRwNmf2r62fK2xzit39qceO0H5+wfaoOATaIuziG49UTYQgkzMbrdPAM5yOBF/QmX1Ef8H2cFZVEAf1qzoRZRSyBjr03qlfh/QeT7A10UxzL1ZJUOZcY7t9W+fl0lTuvJmh6C3h7BxXw0MdnEr+3RIMmNQttjX+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873953; c=relaxed/simple;
	bh=IEoBe0XstrIG2ubk2sAYPJyHtMzDgqlzXlZmeqIiUO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rJpb/UzD0XiDkFhDxC+VmPB+e6p4hCNQ8b772xY1x5d0z+DUyV88mRDwOG9V2DKKQVvNgNBBHByxzwgBvEsZV8rvkKOqVHSrur+7Rsmierg8Wv+dK3ctyrmD2nRchvKMlg8R3A1mP7NZZUHkLzHhRpU3YFWy9rtwCTEAPl+qAmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=nTWSpEoM; arc=fail smtp.client-ip=52.101.48.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="nTWSpEoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUveD3ln4ktqSwd6gcBwstvay8qkgHEYPa4+X/xg8K/Tl14kljCanFxWqhbpYm+3N07ahyUlIrw9Adj7/ZKHGtTEYCrvAgZxT2sqpMRT+0v1o2P2RINeUq4A5tFuGL/qlnzxiIhJZCxRGXryJPxtuZapmC9yEPo3rFq7Ses1l1JRr/VSDaMXu49UhzJScMuGCygqVubMajHaRc9FtsGrOGHlius/rrhwbUArMIN/3SfPuFKXuMJL7PaPq5RNG1x40NLiq12k37bk49ddZ9i34ykGmWpYtdhJqF9/7InfYep56e1Q+MMvgg5Y6MKuwVV4eImq7pOiQiP8NrEJMv4zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEoBe0XstrIG2ubk2sAYPJyHtMzDgqlzXlZmeqIiUO8=;
 b=VVvVT033zIzy4+6PemVOVcR+bfd3dHoTOSCq8bqisTp3TmaVtKpTyxL0UFhesttYMn31pmUnK/X2jo+qHuvhaa26I1/5aOvMRZCHxxuqdADzQQl/M/GPi/NDMR67LvDRbjEKGJvhhXWj55LL31y//lmSttjB1RhcjuxymribKeD6yLafUO6RrUFx3HM7963/4E0tfrVdT9VI0kHXFiI7gvOAq+Tab/+Ip/d9DzB/PJkOJ9CJDArc1ZQf3/K3/RbmrM8otE3LSpz0hXM3kCaUn5ijqCEw32bRYgQ7pOVsUfStcSvqx98inp4wdCtfnKk8dakioktwNbtHdpYCiTnnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEoBe0XstrIG2ubk2sAYPJyHtMzDgqlzXlZmeqIiUO8=;
 b=nTWSpEoMAdig7sR6neH9RcZNw0uc5EqIjtt66xH7S5v5zRp1IBcekenGJs6roOcUGrOerN3o3F/Ven65yHpNFl3OZmQUu8BsRTApi6QVVvnsQCzf5wG+q6rM9YsEZo2OgIT0Yjf+bCNMvX67y9kr4t40kwJmrP9fXf2J0muYgVZn+rosSJMbMsAUX+rnP7tyWD/dDMr3oSVjwLbvG0Y5hRLGlNAHcNnS4dzGBg+WdE7YyPUaCU1qgs9mvyxGt0y4gKKQfTkIcJ9R2odpRU152Jrgnx4MtI8XfFwYo/o5iRBIlR453QoY7lKlYz3Z/UYtZVTUPL/gZ4NtSpf37mIPAQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:45:48 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 02:45:48 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Topic: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Index: AQHdCJM6sfBqrYmbREOLLMW29cxArLZXGK8AgAA7wwCAAKHXgA==
Date: Wed, 1 Jul 2026 02:45:48 +0000
Message-ID: <3df7989e-cfdf-499c-a8fc-f8826659bcb7@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
 <20260630133239.42C2F1F000E9@smtp.kernel.org>
 <akP3mEJMkWHycvZr@lizhi-Precision-Tower-5810>
In-Reply-To: <akP3mEJMkWHycvZr@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5306:EE_
x-ms-office365-filtering-correlation-id: b82e1c86-c30c-41eb-9f76-08ded71adb74
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4133799003|55112099003|18002099003|22082099003|56012099006|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info:
 1XNYmsAimLCTnY2jc+cSpw57hIhpMcv/GbNwAwiF4/dq+iQ7zrgphhWzJes+EAs8BhYkSXJjLsnuMeahtc2uVfJ/lCRU+CM1j14beVD8yW7012d8Lviv+nKxwCCMiqN14DwwgbDedKjPs8L+1qC8T5T3slgxjcnVyabtvPOUSowwOm+qWc3pcAbaHCiwmsKBdyN4c4++BZgOq0unopULWqptopWsFDuRYNUBtESyEELpxS1/D2se7oREcR2O/NIXsF40sXLJQl5tuit27kJhN8PjpBENovjxf0UhBsE+k3GtEeHxvCfO7jJDYFfO+AITiVvcdswXqPROntqLz4WC249AC6Ylo59uS3Q6iAMMLH2m23xau/dXqNWmlTPxkNIVGTQsLc6GKqw43f8dG0d/+U6qeX10GTTwi9gaU6RNUex+b+OqXGpbepAkCAvd5R/RAvz5H2Pxf+qBCNUNu4FlWL4BJzU9F05GCXM6vCCJbBlLR0UTR+NCMLEMTwOJ7+6MjzmyETpkQ2cQJZy3LKGWf91rgnEPnyMjIJcV6nXzB2N8pC+wKuAwfA8r47KXJGVvIpK6Qh4w9wiU4K/FAaXbK51JRZAU/QKZPgQ40uuDRbWXf2lP6aouPjWfDlslazg9JdDnTfn/6flblQomicXwvVX1TCAsv8k0xkRBwyQ2658=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4133799003)(55112099003)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3loOENQVnk2Q0JZVjFLOWJYRFJNcCtLQ1BIV2Fnbk5ORXV3WFQvOGdhRXIy?=
 =?utf-8?B?bzVHemF6S2F2eEtGVWRKanM3czVNN2JUOXY1TnN5WEJFOE1yR0dYbVNQZjZW?=
 =?utf-8?B?cFcvZmM4NXFqSXVlRXd4Zk9QYkIwTU15Z1RVdEtWd3B0dHhoa2svYkxYaUhO?=
 =?utf-8?B?aDdPdXh1U0piUGFCSGp2dk1hRWQ0ZzBxUVQvNWIyVGpCNjNqa2k2M3VGaGpB?=
 =?utf-8?B?VWhSMmprMFdkOU12cU8wTDVRYjk0SFdjZ0pXZ3h1Zk5nT2JDbEljU05FSW5R?=
 =?utf-8?B?N2YwZksrTUlSaUpOemhDZHVTeENPL2NjLzNNUXJJUDhZcjAzaytRUkFMUlNh?=
 =?utf-8?B?VG5RdUlxSGF0S0NSRzB5VW44ZzJHV3NUUVNxVSsvZWRVQnBtZldxWmVRcVlP?=
 =?utf-8?B?SjBSSWd5Yktpd1NkeDI1b1dNNmR4QUxVUmF5OE12M1lxUWNCUXRHaUhhUFJa?=
 =?utf-8?B?d09xMkdSNklNdERWcmtETGgvQzA0WU52d00zcTcwdjN1Vi9zUXFZZVVoRXov?=
 =?utf-8?B?WldtSjAxZG00enc1VHdqYzdDbGZUV2VHOC95d3JlVnY3TDFJYnZIWTd1d08v?=
 =?utf-8?B?YUp6d1ZENjFFQlNnUVFtTm1TTkl2NEFSMEN2Smo0amFscVprZVRmcXdOeEdw?=
 =?utf-8?B?Zm94SUloRVQxSEVmVE1MaGZ5SURGL3U3VUViU1lYbHFKK3NDOGFQaCs1dU5r?=
 =?utf-8?B?TTVjOUkrZnpNbEw2YVlqUEkramRycnFLcWVPcTdBMmp0YlQ0bmFVcFNwTDEv?=
 =?utf-8?B?WVJ3VHIrYXhFb2NUbFdTSERabFFRUHpPamx1ZytiNXptaWZUbnRVN0UyN0ls?=
 =?utf-8?B?SEovUDhzakZraVlaREpLRGpFVjZPMXF1My9FOWoxSlg2aDhacFZ1MDRoS24z?=
 =?utf-8?B?bi9pTHJsOGE2eGlHOUZlMU1QWXNtejhscU1kN0NrZVo2VjdjV1dGZVVOSTFK?=
 =?utf-8?B?dnRHdUVZZHF2M2sycWg2K1JqdlUxZUNpQkF4TDlGbmlNcjZnSkk2NXdrQ05E?=
 =?utf-8?B?ek0wY1BoT1ZBMHVJajRROXpRd1JWZW9XSkVhb24vN0hUREh5VXNNaEpkWFlI?=
 =?utf-8?B?VmZNZzRSNUJFVGtIcmZUelFoZnhNSXNIZ0QvTk5ISU9XUVBnRHRxZmRTZmdZ?=
 =?utf-8?B?UXNFVUhHYVNUWmhIQVRBUTl3UVZ1OVM2OUlpd2FGZFRsUHlLd1pHenkxbmdr?=
 =?utf-8?B?V240Uktoc2lNWWVma29ld1ZKZG51dzRlbHBaZ0VPZGo4OXI1L3FLUTZQRzIx?=
 =?utf-8?B?U3lhL1Y2Um5yQU9VOHhFWUpzVkdyakFRV0w5Z2RBTG5sVDdhQTYzdDF3L0pU?=
 =?utf-8?B?TFlBdEdPWmlZdFREb1RJMVFxVXBiRlVyRXZFOEY2Z3NWU0ovck83d3JiUDR6?=
 =?utf-8?B?L0JVZ3hoUXNHNFhiM3ZLRDZLMlQ2NEJUTURaQTFKRU9sWUx3N0FQRjVrSXgz?=
 =?utf-8?B?a0lmYUxlbklNUFVzTVJMM0dNeWc1RDNoNm91ZE1HVGR1K3NyMUxrVE1rMUlN?=
 =?utf-8?B?RUhkK3NaRFFlYjdMeWoraVJOSnBHd0kvZ3FUb2E1YzBFMFF3K1FJR2tzMlc3?=
 =?utf-8?B?OW9XYUFXNEtaSjRIK1lzU2hMY2NvdkJkVWRIN0lSTXYvU055VUIwOXo3b1Q2?=
 =?utf-8?B?UDdZOEZIWWpiN2lBb2xmZHBVS3JueFZJcU9DTnpwSm11QmhYZmlRSGpBMFhs?=
 =?utf-8?B?YTdWdXpMZjBmS01wUFl6cERsYXlEV0x0ZlVHWVk2M1ZDNGpFRDluczE1SVgv?=
 =?utf-8?B?ZnlIbTRPYWVxR3dmZEZGUk1mWXFCU0c5MVNBQjVIS0NIVFJwd3lxVFFFaVgy?=
 =?utf-8?B?U3MydElIZ2Z6c3p3WjFKM21CTXZCZ01yTXQ4ZG5XVUFabE41cktZZERaYmxF?=
 =?utf-8?B?M3EwakNya0lmZWpkdjVEM3dDcmtiWTFNK2owYTNyUEhSZU1sTmQyS05wQXFO?=
 =?utf-8?B?cnVkWnYrSmJ2V3l3RE5RRHNuc2Q4NzZKUmIvTUYraDNaWTNkaExzaXpXczNH?=
 =?utf-8?B?OEZPbWQwT0lzZWFlNTVEVGJaQmNhb3hLUmlRRDM2ZDJUUXF6eE13aFFkQmY1?=
 =?utf-8?B?NHhjSUdQbWhISHNYVHdRSWRSMFNSU0dUVjdpMEROOTlUbnR6dktQUHNoN2tP?=
 =?utf-8?B?YlFsWjg5ZXpFYkUwS2FOd1BTUXlndmRFL0t1U240by9ZckRrUkV4ODZ5aEFo?=
 =?utf-8?B?bmZuZmN4bk93cGg1c3lSZmRoYVVzTUZ4Y2hlZWNqWlg4OTJNWDdxVVpMTTlT?=
 =?utf-8?B?MXNDYWxZTzk4M3p5ZFExZitCeXZWUjgyeEdMN0xUT2kyUzd5ek9EcThWWGJV?=
 =?utf-8?B?bGc0cnNRQXBXd2hyMEIzdjU3cFJ0TlVVRHdPUlBqOXZhdzZpaUVtYkEyL1NR?=
 =?utf-8?Q?i17KOD0fyigBqLSE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E83EECD8FDCEF4B9CE26DF907786CAD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82e1c86-c30c-41eb-9f76-08ded71adb74
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 02:45:48.3659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCSB0pDVwJ8BDDqF2vY4BwygEy1xTUhqwGYn7vzLtp1gslqo0bKnrvqVcx90vOHUHaJoKOdmpNrISMNMNvjFtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306

T24gMS83LzIwMjYgMTowNiBhbSwgRnJhbmsgTGkgd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDMwLCAy
MDI2IGF0IDAxOjMyOjM4UE0gKzAwMDAsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+
PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4+IC0gW01lZGl1bV0gVW5kb2N1
bWVudGVkIGJlaGF2aW9yYWwgY2hhbmdlIGFuZCBzaWxlbnQgYnVnIGZpeA0KPj4gLS0NCj4+DQo+
PiBjb21taXQgNWFmZDVmYmVlOGRjOTI2MTEwMjg0YmFlOTgzMTBiNTk3MDEzNDEzMQ0KPj4gQXV0
aG9yOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+DQo+Pg0K
Pj4gaTNjOiBtYXN0ZXI6IGR3OiBNYXAgQ0NDIGhhcmR3YXJlIGVycm9ycyB0byBJM0MgTTAvTTIN
Cj4+DQo+PiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBEZXNpZ25XYXJlIEkzQyBtYXN0ZXIgZHJp
dmVyIHRvIG1hcCBzcGVjaWZpYw0KPj4gcmVzcG9uc2UgcXVldWUgZXJyb3JzIHRvIHN0YW5kYXJk
IEkzQyBlcnJvciBjb2RlcyBNMCBhbmQgTTIuIEl0IGFsc28gcmV0dXJucw0KPj4gLUVJTyBmb3Ig
YWRkcmVzcyBOQUNLcyBhbmQgaW50cm9kdWNlcyBkd19pM2NfY2NjX21hcF9lcnIoKSB0byBjZW50
cmFsaXplDQo+PiBlcnJvciBtYXBwaW5nLg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMNCj4+PiBpbmRleCBlNjU5ZWRlNzlmYzAzLi4yN2QyMDI1ZmNmMDQxIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMNCj4+PiArKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+Pg0KPj4gWyAuLi4gXQ0KPj4NCj4+PiBA
QCAtNzQzLDEwICs3NjAsNyBAQCBzdGF0aWMgaW50IGR3X2kzY19jY2Nfc2V0KHN0cnVjdCBkd19p
M2NfbWFzdGVyICptYXN0ZXIsDQo+Pj4NCj4+PiAgICAgcmV0ID0geGZlci0+cmV0Ow0KPj4+ICAg
ICBjbWQgPSAmeGZlci0+Y21kc1swXTsNCj4+PiAtICAgaWYgKCFyZXQpDQo+Pj4gLSAgICAgICAg
ICAgY2NjLT5kZXN0c1swXS5wYXlsb2FkLmFjdHVhbF9sZW4gPSBjbWQtPnJ4X2xlbjsNCj4+PiAt
ICAgaWYgKGNtZC0+ZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spDQo+Pj4gLSAgICAg
ICAgICAgY2NjLT5lcnIgPSBJM0NfRVJST1JfTTI7DQo+Pj4gKyAgIGNjYy0+ZXJyID0gZHdfaTNj
X2NjY19tYXBfZXJyKGNtZC0+ZXJyb3IpOw0KPj4NCj4+IFtTZXZlcml0eTogTWVkaXVtXQ0KPj4g
SXMgdGhpcyBhbiB1bnJlbGF0ZWQgYnVnIGZpeD8gVGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25z
IG1hcHBpbmcgaGFyZHdhcmUNCj4+IGVycm9ycyB0byBJM0MgTTAvTTIsIGJ1dCBpdCBkb2VzIG5v
dCBtZW50aW9uIHJlbW92aW5nIHRoZSBhc3NpZ25tZW50IG9mDQo+PiBhY3R1YWxfbGVuIGZyb20g
dGhlIHRyYW5zbWl0IG9wZXJhdGlvbiBoZXJlLg0KPg0KPiBZZXMsIGRvbid0IHRvdWNoIC5wYXls
b2FkLmFjdHVhbF9sZW4gaW4gdGhpcyBwYXRjaA0KPg0KPg0KPj4NCj4+Pg0KPj4+ICAgICByZXR1
cm4gcmV0Ow0KPj4+ICAgfQ0KPj4NCj4+IFsgLi4uIF0NCj4+DQo+Pj4gQEAgLTc4Myw4ICs3OTks
MTAgQEAgc3RhdGljIGludCBkd19pM2NfY2NjX2dldChzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFz
dGVyLCBzdHJ1Y3QgaTNjX2NjY19jbWQgKmNjYykNCj4+PiAgICAgICAgICAgICBkd19pM2NfbWFz
dGVyX2RlcXVldWVfeGZlcihtYXN0ZXIsIHhmZXIpOw0KPj4+DQo+Pj4gICAgIHJldCA9IHhmZXIt
PnJldDsNCj4+PiAtICAgaWYgKHhmZXItPmNtZHNbMF0uZXJyb3IgPT0gUkVTUE9OU0VfRVJST1Jf
SUJBX05BQ0spDQo+Pj4gLSAgICAgICAgICAgY2NjLT5lcnIgPSBJM0NfRVJST1JfTTI7DQo+Pj4g
KyAgIGNtZCA9ICZ4ZmVyLT5jbWRzWzBdOw0KPj4+ICsgICBjY2MtPmVyciA9IGR3X2kzY19jY2Nf
bWFwX2VycihjbWQtPmVycm9yKTsNCj4+PiArICAgaWYgKCFyZXQpDQo+Pj4gKyAgICAgICAgICAg
Y2NjLT5kZXN0c1swXS5wYXlsb2FkLmFjdHVhbF9sZW4gPSBjbWQtPnJ4X2xlbjsNCj4+DQo+PiBb
U2V2ZXJpdHk6IE1lZGl1bV0NCj4+IERvZXMgdGhpcyBzaWxlbnRseSBhZGQgdGhlIGFjdHVhbF9s
ZW4gYXNzaWdubWVudCB0byB0aGUgcmVjZWl2ZSBvcGVyYXRpb24/DQo+DQo+IFRoZSBzYW1lIGhl
cmUuDQo+DQo+IHVwZGF0ZSBhY3R1YWxfbGVuIHNob3VsZCBiZSBuZXcgcGF0Y2guDQo+DQo+IEZy
YW5rDQo+DQoNCkhpIEZyYW5rLA0KDQpUaGFua3MgZm9yIHJldmlldy4gSSB3aWxsIG1vdmUgYWxs
IGNoYW5nZXMgdG8gdXBkYXRlIGFjdHVhbF9sZW4gaW50byBhDQpuZXcgcGF0Y2guDQoNClR6ZSBZ
ZWUNCg0KPj4NCj4+IFNpbmNlIG1vdmluZyB0aGlzIGFzc2lnbm1lbnQgZnJvbSBkd19pM2NfY2Nj
X3NldCgpIHRvIGR3X2kzY19jY2NfZ2V0KCkgaXMNCj4+IG5vdCBkb2N1bWVudGVkIGluIHRoZSBj
b21taXQgbWVzc2FnZSwgc2hvdWxkIGl0IGJlIHNwbGl0IGludG8gYSBzZXBhcmF0ZQ0KPj4gZml4
IG9yIGV4cGxpY2l0bHkgZXhwbGFpbmVkPw0KPj4NCj4+Pg0KPj4+ICAgICByZXR1cm4gcmV0Ow0K
Pj4+ICAgfQ0KPj4NCj4+IC0tDQo+PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4MjgyNDYyOC5naXQudHplLnllZS5uZ0BhbHRlcmEu
Y29tP3BhcnQ9Mg0KDQo=
