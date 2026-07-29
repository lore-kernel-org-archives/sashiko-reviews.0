Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F563DB639
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367317; cv=fail; b=o3pWkus7JUJ8MgjtA19bOPpkG+SavNitQoXALMwC+n3sj/o4jCuDHOiRLy9B3asz0Y6g51fWYt8cR3H7P0dcsSfCRUjhMWoxCcKpYsyr9C941FmnCELkVpmwoj61Y9ErlCLRu2y1YApBHVafhuFp+O9CI0BK6ZuJFjCNx4TrM6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367317; c=relaxed/simple;
	bh=kQWPBXvMdTIU31VVfwkoTvuD2TAO2oF0oq01VQ1XRrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WQuIsNU1blizX8wj/aLF+3FgBWdoBVWwXUywdxWK48n4U7Vb0moNht4WHfbkh55/tY+AdpHWNUdmQ0Ax8oZeQsxYxVF2dy/BfGRPs6jl6hCjaFuep6dFWeIyIoYCW6SEdsPOfL5MtA2JqFg6vr+E2wfK2s2+/4nRbWg+VAtif6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GaHnB8c4; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GaHnB8c4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYCFB9rxAJaUGgBHz7LSfeOpDvXnz/8rgZN+tW6tuNZgwCIJGzpzTdOPm41zGw0jiRsL8eQMr/dW4i8J4rmcZWTeBSae2MoZa2Z3o2aOZVmLKA8mej8wzr/tQeH5zDsIMEQRJSRYpn8ZiCIODKXd5xCS8tGtCAud5oThTfV2TODFcYfH7mdBPXDLXJd8i/aY2RBMiw5g4R4D22kwP6o8AiFELfVw9R3UOqs9MMlGyv11lKBtw0YDxjcZfVM0sd9b5T2fykU6NK0D2bFO+iB3VnbyRqwg9d2Pr0ZnPq3zhEKrJrvBYWfhSF9ZgCkCDBk6sEIQ9Rw97fomAbUBJ/nlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQWPBXvMdTIU31VVfwkoTvuD2TAO2oF0oq01VQ1XRrw=;
 b=vlvvuZAts7eoPGZa8qNaAvFjjBDVyuNAUCpW/6uLRfbMWz8yDESmXs9dHqnB2rX9IIKSGpsDSJh/VCvX4U9bGBfQtciNfnJnVix8XrjzukgpFx2tzzHgxfbHduG2pV7qDkFLh4VIqZ1UIV9Os38bzFkGZPXyQpfFHzRnmUGn5Tt0saexGKp/vUPvVZuMlfWHnB7aoHg8oBAqed9a5zVhVFpA32cgNW3vqNRV1HWw3TZ51AJWwb4dxlrH/FKAooOqEbbb2SzDWk0eaHHcPK8pmciy3gPdSpuBqVHMlgtovH0tnPZS2XdSyQAYohDLjT4GFvh3DT9IpsvOF/X8JFShmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQWPBXvMdTIU31VVfwkoTvuD2TAO2oF0oq01VQ1XRrw=;
 b=GaHnB8c4SMdY6Yytn7HPDMRST9VNiWzK6bky//E4LHx7evr4IZx4UTTqonBa0RQOw9y1YpyPUGnYnrbZFkM0uLjQQaLRx334D/hFQqUaseyc5pE7SR17gxd585itpDIcFznJVVvEhjkxygNlVYwBKbmQnkIljefe4Jtl8Kiv1zhkS2RJjekE59rmsjVCTSDAlhGxHsF2CKFux3O3cHXMKJu6XY1DDZcsKRHKymrTLAkpEefhkUMpqig+cj3tODNd478+rNe6p6G5+VIZ0AoSmnqiZjVwXL8zfMfWwssCxk/ufJjBBCbNE4hP+OB/I1VTilQCBQFZWbaFbUyp8fU0TQ==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:21:49 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:21:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v6 4/8] gpu: nova-core: transition booter_load to TLV
 images
Thread-Topic: [PATCH v6 4/8] gpu: nova-core: transition booter_load to TLV
 images
Thread-Index: AQHdH6167aFkkhYapkGi1BXriVJZULaFHvcAgAADu4A=
Date: Wed, 29 Jul 2026 23:21:47 +0000
Message-ID: <d671e650-996f-4580-ad5e-c8a84d187b4a@nvidia.com>
References: <20260729225534.2046933-1-ttabi@nvidia.com>
 <20260729225534.2046933-5-ttabi@nvidia.com>
 <20260729230827.556411F000E9@smtp.kernel.org>
In-Reply-To: <20260729230827.556411F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ2PR12MB7867:EE_
x-ms-office365-filtering-correlation-id: cd4be7ec-4389-40a5-fafd-08deedc82954
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 km5iCrdh6ReYOYR8QMqOyH0skJscUmiQiHpvPIRyacUzYxSwqWXu71w52AjpYwSACV0FnR9VycwDvvopIvh4LmhIyC/OpOk6ui/6XCVEyg+ADRZjbVYvGfwOHCtwM6HziMdj6T04Z5C8DRR85XXAjk+H8YyY8Zy4K3LLTbehc1EWEIWPkZ/63O6c9qNQfndoluA/WlUBn8gG1P7n0o0/wbdfCgrbgakaz7tGDWc61640wRsRF3di8kw37+yP1/lWbwcbvtVpij9l4wLcoZMNm+4sLe5/+bTVUSd587ZdQGFais6H8VZrx8qhwVRx3sgbstDyNCyzs1A+r1izIWq0xt5BwSOShs7aqamZgQCd7++ByImj/oA7jfxEQjk+pG/oKOCo84anM1Ac0cI/F+7VrMjp8OTksKcW3Win+oSy1k7jlp+V8//gKz6ETWFGMvRxCRLeC9Lv0PzCWuRAjwL5RCYQ1a052tfpoJD/YKKbtiLE4jVUBp3gsnPjl0urWkC+Z83WYtAqSTMyjO41pqBQvTBiQwa6tkOxhs5ATRrnAd5xJgJZvxkS8+dXArK7k2kdUdlA4jl6Aq97hbGiXYhdR/zvuo0kVpox1/K2kii/ZBtYaaDGUr+NKphvZwR950omzq/K98nk8ROr/3PpBwtnMTJEDdA647XPCTZ+6wF48r0WTpqPwXzPUthRc1NvfQz/xz3AvP7tZNexc1OCzlwnHZ5BmTFW9lwt+VezSQos39M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2RiazBsdFhvNFc0SksxZitsVkdOQTNJbG04SEdVeDB4QUo3cmZHNXFnTlZ4?=
 =?utf-8?B?VEc1OFR0VW8yeXVyY3dFZnVERlArSVBEM2xOU1hWU2szQStUcm0zRVExeHRW?=
 =?utf-8?B?ZzRmY2dCNCtZQU5MWVBYaEgzbXJ0RkZkU0lyYjh2YWR1TFh2QXpjcTU0S3k0?=
 =?utf-8?B?d0xkaTllbEtZcVpEaHFqRWo5cC9uTFdiZ2V4NHlRNllLRU1XSmxnaFlWY3d6?=
 =?utf-8?B?cWd5RmZrSjc0ZWZjT3NxL3VCMGNIUVJHV0Jib1JiSUVKMXI4NmpFMXMrRitj?=
 =?utf-8?B?KzFhY0p6UndkeWZwM1Fhb0lxNzdBSWJvV2VtN0JrOFkwUFc3NzEraE1CV0Fh?=
 =?utf-8?B?bEVIVTdBRnVjMTR4dTVzZ2szNnZ6QldwODNsYXpYUEdrTU5EOEJnQVRNT1NN?=
 =?utf-8?B?alVtWFIxbkFEVjBGd2NyVWt5bjJMbWNSWmRISlo4NDFNOGc0WURJUXRnSWt0?=
 =?utf-8?B?bUZyVS9FSWQ5QWxDZEl5SFJtV3VsNUZzdUVoSTVmVUVrTnllQ21WQVQwVzZx?=
 =?utf-8?B?dk9ocXJZWTRKUTNabjZYeEtxSTlZNDlHUnVYZm1pWnVkVEt3RFE4c01UNHVJ?=
 =?utf-8?B?a2k0ZXFmQTl3UHoyNElWT0EvR3k0L1prcnZFaTdpblRyYXdma0VBU1hrU25E?=
 =?utf-8?B?QnRDenFBazUzV1U0YVlIRU85VUtqUFNoZGNaMlE5VTdVdi9KZjl1Tnp3eW0x?=
 =?utf-8?B?WGVzMWxkVE1HVlgrZFkzb2hEV2cvQWRjTm52MnJZaFViQ0NnZG4yd21YZDFw?=
 =?utf-8?B?TWtIMGVGWTZlcHJlNDRQVm1YTTRZdzVMb0JkRmUrSTJobkFya2NuNGY0dWlC?=
 =?utf-8?B?U3NJTGFWSWo1Y0MwTXlCdC94RVhlR1paVGowdVMwQU02Ry9TNjR4amdxQ1I5?=
 =?utf-8?B?U243ZlZLN2t3cTI2OFpna1RKVHBwbHpRdDhtMmt3M005dDlVMmRBZmE2NDdu?=
 =?utf-8?B?N0p3OXJJU1N6Rnd2bHJzMWs3Z3pCMk43ZFdaWXZmbjl6RXlwM2V5SWdvcE9r?=
 =?utf-8?B?ajVSM1l3NjNTRnVvYmpHclFNemF6UG16RjNNbTdZQjlMZExUKy8xU24xM01Q?=
 =?utf-8?B?aS9tSjFleE1DZkh3NkhGUmk4UGM3SjVtSWllMkZlbzhEdHpiK3E5WVdBdFJP?=
 =?utf-8?B?aWQwakdoRlZ0R1Z6bWFLN2Ird1ZVUWV3cE5ta2toZnFSazhheDF6Vy92MGJ5?=
 =?utf-8?B?cDJxNW9ZNjFUR2ZCUlQzc1Z3c2FRd1dZRHlTQ0ZqdU9qR01uMzlHMFVqWEpr?=
 =?utf-8?B?Z2V6YVhxeEtCNGpIWlRNWk9CNmJDQXVxN1BWbnJnNCt1Zkw0UWZ5NXUzUGx1?=
 =?utf-8?B?d2xwMWJ1TzBxbHBtVW9MUlNycnd0UHJ4ZTFHZ3kvZkpLbHVBV0d1RHVvV1Jt?=
 =?utf-8?B?TEhEMDJkT0FWTTdXSjNzNGJPZDJDUG5UZkUzSFcvbVlkVUN3dlA0RmxVSXdR?=
 =?utf-8?B?Mm9GRUt4QlVHai9zeTNhMXUrbkwyNlMyNXF1UVFXb0RMQjRiTTY3alU4RjM3?=
 =?utf-8?B?OHNmcDZ5WDNETldKU3ZieDU4ZXJOakYzSmZUNGVONHRMZTR2MFlLZmlkRGlz?=
 =?utf-8?B?NXlyVlNCWUY3QkpkMkEvOFZYb0NNR0htdW9MTUtoVlc0Q1pra09MbUFRUlRl?=
 =?utf-8?B?L1ZiYVNpdXhsQTkyYzJTR0NxNUtoUzVEaE1rVlhLUWFHZFJNSEtjUzZPQXlC?=
 =?utf-8?B?NytpYTh6SjUvNFBIcDdHYWZEMHNlWURmK243UDA3RjVJUWtKQUpuTjhOVEJn?=
 =?utf-8?B?YUJ3dEZ6VGhMalZWV201QUpHN0plWW5TTUtqUVhCVkFHa2FsT05ybll5bmFa?=
 =?utf-8?B?a0ZiTWMyY2F6bW56SkdZcS9mSTNpVjVveTA3UG1PUEI5bCtrQUxaL1RyemVL?=
 =?utf-8?B?Y2VFL1NPTDVJUDV0bENiNXM4RXcyczhBZGtZUHVSbmk3eVpXQzkxTTA4UzJI?=
 =?utf-8?B?ZHV0b1NUbERGSjVWcDh6MFphNHd4a0JFMFlVRmVVdnYzeG1TWUtxYnJQWUl3?=
 =?utf-8?B?TSsrZGYvRFhpSktYS1dmTU5Na2dKeENPN1FoUlBIVW54QlU0VjZmbUE0Nitr?=
 =?utf-8?B?TlBacGczejVMdXlJRG1HWEYwOEtPbkp4U0tXV0RoalpHKzJCQjJXMFJod3No?=
 =?utf-8?B?U1F4ZjVkRjZqckRJclJlcmt2Q2laY3Nac1VUd01lazQxcHdkMEY2azdIQ29m?=
 =?utf-8?B?NllxZjJxM1Qvb3dBN2lyMlJxTUY5NEh3aXdWRHR2WFgwY0MzWHUyb1QzbWVi?=
 =?utf-8?B?OHR3Wmo2WFpKWVdKWFhvOEMzdUxpa3l2b3cyMDlTUE5oSGE1UC81ckowblRE?=
 =?utf-8?Q?9NWezwag3V/nlX0ouE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D53CF1D31B91034EB017FAABF220C83E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4be7ec-4389-40a5-fafd-08deedc82954
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 23:21:47.5669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVoFZ8sODy7/10cjdhCzA756YX/te+i4JM651bD5HSGB/SaPO+GmUH1slLtyJV8gS71iSHLP3GlncnFFzpaxvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

DQoNCk9uIDcvMjkvMjYgNjowOCBQTSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4+
ICAgICAgICAgICB9IGVsc2Ugew0KPj4gLSAgICAgICAgICAgICgwLCBOb25lKQ0KPj4gKyAgICAg
ICAgICAgIChvc19jb2RlX29mZnNldCwgTm9uZSkNCj4+ICAgICAgICAgICB9Ow0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IERvZXMgdGhpcyByZWdyZXNzaW9uIGJyZWFrIHRoZSBHU1AgYm9vdCBvbiBH
QTEwMisgY2hpcHNldHM/DQo+IA0KPiBUaGUgRE1BIGxvYWQgZGVzdGluYXRpb24gYWRkcmVzcyAo
aW1lbV9zZWNfZHN0X3N0YXJ0KSBmb3IgdGhlIHNlY3VyZSBJTUVNDQo+IHNlZ21lbnQgb24gR0Ex
MDIrIGNoaXBzZXRzIGFwcGVhcnMgdG8gaGF2ZSBjaGFuZ2VkIGZyb20gMCB0byBvc19jb2RlX29m
ZnNldC4NCj4gDQo+IExvYWRpbmcgdGhlIHNlY3VyZSBjb2RlIGludG8gRmFsY29uIElNRU0gbWVt
b3J5IGF0IG9zX2NvZGVfb2Zmc2V0IGluc3RlYWQNCj4gb2YgMCBjYXVzZXMgYSBtaXNtYXRjaCB3
aXRoIHRoZSBleGVjdXRpb24gZW50cnkgcG9pbnQuDQoNCkkgd2lsbCByZXRlc3QgdGhpcyBjaGFu
Z2UuICBJJ20gbm90IHN1cmUgaG93IGl0IHNudWNrIGluLiAgSSB0aGluayANCm9zX2NvZGVfb2Zm
c2V0IGlzIGFsd2F5cyB6ZXJvLg0KDQo=
