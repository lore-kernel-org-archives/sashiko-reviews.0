Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013026.outbound.protection.outlook.com [40.93.196.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A0352C3F
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849713; cv=fail; b=VPuaPGODFHI/QiSxOa8V4VxQzY2ysmTPAu7E9+hRG2q6BvPdobaZtmmYBWfiQb6vlC1fcJfMszZ8pWRJEAF1GDcyzbYMk6b7WX/celZFlsotrk6lRSqEtD3FHrIlEnVF0IbpXSB4UUrLjDF3/meZFZ3FtZEZFeWWqMOpRwShxAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849713; c=relaxed/simple;
	bh=C7wwxnPHPcs8BDdkRL5I4Tgr+/18y/ZqqZt3qa5eKIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mrwZlaT5wOiRbwIkU31qh//4W3WUVEmi8t0znH9jejQs6FXEGrBWJ4INO+zVW5BCcRw8Nf1mAlj0fRURtVdCdlh68TszcEqMVKq20Ogu7chGPXIA8NWDLSLbidRjqjx791St1yWlV8QRjEL4b/UDdO2wOEkuTN4jr13tq2jZUdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NwPvw2yE; arc=fail smtp.client-ip=40.93.196.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NwPvw2yE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciO9YM8GhldVA/UDjeh63PjSU0sJQtDV074Ejzkf+s6jXdzE19nO7d0/6jajnB+jNt6EyG08p+PdS0E82Zb0CHF1Tz0lcb4u5jlOJU3tEUfSn6ytnwZzd6TaNMGXsCTipo++oqgIarhmuLAjKUadwfG1belnFuugA0DiacJIoNXisqQVrOlUxszI4xBueJuUC6n8XH9jXB7F1LoIFHr8l0babzAdI9DBcImrZuo7h8HJtRO9axdFhbut51YwyHhxW2gGpfvKW8qT7f3wV5gBN8y+9SiOdVx7a7+BwMwyaicD+OaqVX+Nq2S2wwXZMTz7k6rwLp1DxeL6TA2WksrPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7wwxnPHPcs8BDdkRL5I4Tgr+/18y/ZqqZt3qa5eKIg=;
 b=yQe6IbKZz0qsiyb8M/zqLapblMYhNCkZ4PIdDgj2II8NVgZPlEoaTfoSBK4XBFp//OHellIUBYNtZLz4T3EZc5ofSZN35YjxY21s1AlR8HpqJSMTlWgS4mqLVSEkCbYctiCY41qVcOEvrWpzBy6ZHh91q0u9g/M31iJlMfdyS/nUjeuBiBWcuYwIFnCxsUFjmuN0AFfIG2yldGT+r5+tIa5FcgVgPN+E1IiqasNWU0hscb+VOzRD1ucTqc1K3xNix86uYTPZpnFui1W41sR5IVbAtcGyhP1cIq2XDgFqo9hlHeOXPAkY/3kd0UqlrSLfh0QNqB5Dj+TjgyK782WmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7wwxnPHPcs8BDdkRL5I4Tgr+/18y/ZqqZt3qa5eKIg=;
 b=NwPvw2yE8/HVWlNSRCchSoRqKhJ1P9Eg0NN15bFEPjId91wKnRdpvW6N4DVZnhVsrnstYXXfE6r1n5fd2a2zEB8yH8p3pPscSZRP9ypM2KfrgNMRJdi5BqUp7b/h+5PNhFEvOt0d4ggZM2Bdc1L0CS1IEhGCt0UeMuip0IPykCPVzjcKY/gePID5bxDOT3MwgHGCOrfJpojai5vMbN+OB7o1ijilqnnWJtoBIeq2SjajtiH/8L0KvZDAyPScdybIXtGt/95Clpl97H6wgrioPC2mWJUc1bmV3jhlTCa5Mf1aHcPlPQ6NXCxW0IRcku8zbdG3O3AyVvVwrQT5g20AMw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 20:01:45 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 20:01:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Topic: [PATCH v2 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Index: AQHdCMlyQfszGbWpRkCAhwVOXwSvEbZXg6OAgAABVYA=
Date: Tue, 30 Jun 2026 20:01:45 +0000
Message-ID: <ccebbd6c2f73b0708f44d4a9327c130bd282b7f5.camel@nvidia.com>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
	 <20260630194749.1209490-4-ttabi@nvidia.com>
	 <20260630195658.026D91F000E9@smtp.kernel.org>
In-Reply-To: <20260630195658.026D91F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SJ5PPF01781787B:EE_
x-ms-office365-filtering-correlation-id: 76a1bdeb-f6ce-4cee-30b4-08ded6e269a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 xVT5Sx3LSjZW4+oCzbRhlil7UWcFPzvHHGnnqpiTjS6xzVWFBO510iC8Ly1Yi12e+HLQwDZnYk9vHgE8whdzz15Gfh8qdmEIzeFMq2NAQ3v+hvSJaSapPWNKsQDzAJJqLQd/L4DDgqmqNMGbLE9wCsy1n7wjpAWewH5oH+HArY7KHGB4kEmu3x+ahf5dZfbGsyimh2C7WcSd0VtK2K9kBuFLT30xYCQU7B+lMphaI7oOcjiofFXqu7eOLCcEWt/DdMYPIXSYDrXM/U4bsg44AOSsbT8IoP/52i1cHEGKbTOI/rJXe9muoHE22/xOxRHEuGG4rF979q7RnI268oyrCeaOZOzcsJluGsQ/JZjKiL7f4T3roZVvWn9woCB/Cf4Qbey84Oq5nNTQ7y6cVuKClwU149eKmJ59AEb7dzCI3YkSLgRZUJvM5mBFH5oz6YQmuePmrBL39HOMfvK6ox6XAvIYW/Ap94y0LcvcuVMrbZvUREsEbHU32yRARpziVCNEUz5C0rwOLQeV2GbE/nJFkJ4PEKNvHDfUq+XEq0Z+EB6Sh+PH1TIPEkaArGChMZv3eINNL/xazHvEJrRMKMM6J1N4K5Q3BzI+qIExGL375eAqg9J9gJlWZF2Ww2Iflsx80N0M908aGVWj6ZK9UfqnEGQq7nvi+Q6cZDxEs8xhhI3c3CEgPJifPVUcox2zQSvsHTWA1wdUHRNmk97I7wFrNOJcRJhlLVvURaUBQcg6iJ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzJBVWZsWC8zUUpacE9iNkF3L0tYMFo5VWRSUlFNMXVLY3hyR21YVDJ2VjFT?=
 =?utf-8?B?SkFFQmJUYnFjNVNKcm9CbU9BOWk0ck9sRituUVZPUlJHdkljdG9lRTE3RjA1?=
 =?utf-8?B?Y1AyYzR2TkRzN0d2bndUN0Q2b2JkOFpyRkh4Z0FaM3BMMjIybXVEcmcyTGps?=
 =?utf-8?B?UzE5eU9qczdITjZwbTNzS3pSVmVNNWNSNjZiMkhid3gyU24wOFBkVDBJWitu?=
 =?utf-8?B?aFB0WnkrNHErSGREOFdaZ1NBUlF3ZzJjUzQ3YzlEYmJieTRCT2hMVndPY3Jj?=
 =?utf-8?B?N1BtVXE4TUgvbHk3Uyt0WHc2dlg4eWhiS2oxUXpZalJUWkM2MFNsQjNBVm84?=
 =?utf-8?B?UzNnUXZGZ0tQZXhzc3dabDFlTEVydTVTVUluWmR5N2trcFVnVjNRc01pOGlT?=
 =?utf-8?B?NjhvMElxZCtVOGV0NFVOZE9VcXJvTWthZXl3YjRLL2h2aUVndDg2NTFlcWNT?=
 =?utf-8?B?OXd5a2pIbVdvRXJxdUN3dVRmK0xPTmgvS1hiSzRaZC96TlZselBIMXgxN3Vi?=
 =?utf-8?B?QkNySjhVR09HbVhRU2NBb1QzVjNXREVWamdRRkEwZWtJZFRTUU8zV05HNFpK?=
 =?utf-8?B?eG5hV2F2c0RheUJXV01rTjV6VTdocFdFZFFGYzdHQkFKWjcrUm1mTE9EbXNx?=
 =?utf-8?B?TTkyQmQ1Si9hbnhoTGNzN0ZDK2ZSVWl0K2lmcnN6b3g1T29lRlAyOEpMR3A2?=
 =?utf-8?B?NFhQZjBIN3g5eWN2d0pxTG9mVHhYMWlaRlZYWDdHNDUxdkFVMGFjUXQ4VnpM?=
 =?utf-8?B?QUdzbFRDMG9GS2tJTmJwbWx2ajJ6QU1sN21kNjR5SHAzOGMvc2kxVVVRVHo2?=
 =?utf-8?B?RWN6NXM4WWNxRkcvNjB3N2NvMnVmUFdoVjNDcElHYXIydGJGcVJ1M21wWkVw?=
 =?utf-8?B?c2pYazdoOEJ5a1Nyb0NvdWxJbTY3OEwzeEZCOEhhVkRsQTc2QTVmcHVWWjhN?=
 =?utf-8?B?dVFJY0U3eXRXVmxmTXNaeldUQ3MrY2hNd2djS200STM5SHEvWXdkQi9ZWlZH?=
 =?utf-8?B?cldML2phLzdSRDBaQW9xZ0ZzRmRDZHpnTmxYZ0l5cWhmem90RVhBNlBqMzcr?=
 =?utf-8?B?cnZBTFpjbitSTTlWeEJnUHN0VURWSGhkL1MzOHAvaUFleWduN1d6a2dUTEFR?=
 =?utf-8?B?a0tad0tBSnlkUWw5VUw4cHV6WXVrOEQ4Y1lxaFV2UmliczdxVXVqRlNWdDRD?=
 =?utf-8?B?Tm5kRzlxR2ZLemltV2xYLzlIRm1tTFp0Y2IxVThwT2xBQ3VPMFZMOXNTc1FR?=
 =?utf-8?B?ZW5iUnFQY1F1dGdHenUxTENjZWcwQzNxVHpIbFhwK2ZXb0NRMG9QYm0rSTVV?=
 =?utf-8?B?ci9mQ2ZicmZwaHd0YWUySUM0aHo4cVpvdHIwc1EycEkwMDlIcGIrMnFNSDNR?=
 =?utf-8?B?aXdsL3g1bWxXd3VCRkoyYm9BbkFVWlNoeGoxdU5nZ3JLNE9UdUJjbjJ1UWdG?=
 =?utf-8?B?RGdPUG9IWlNKOW8yZ2ZJenhBcnFld0YwZlZ5MG1jbHB5dEhLOEV4Q2FpN0hm?=
 =?utf-8?B?SEVBSGQ2NVluU1puVGEvM3grM1NPcmdESDJ2dTdKMHEwclU3dmJoUEdDYk1Y?=
 =?utf-8?B?czUyWWh1ZnRVeVY5RXU3T3NUQS9CajVyTFVidkFPK2lKNUljTTQyeEtLcjl3?=
 =?utf-8?B?MFJEdlFZd2RKRmMvOG9LN01kUTJtM2RJTzh0MGZwa01ZZzQ1djZBa2x2NmR1?=
 =?utf-8?B?NGJWNmx1QXhXdytJSStLd0c2djhBKzdtdFlEQlVZOUttQlVlT2RKQzBZdUdu?=
 =?utf-8?B?ekwxVEZ0VkZEUnY5MVhRUEV6Rjcvb1pDSjU1ZGM2U2NadUVsUmg2bVdtcUxz?=
 =?utf-8?B?Nnd1SGpMVWwxMUJsNHB5MDFSbm1Pc29XQ01LTmNzdC9tZzJQS2pqbHJKNERs?=
 =?utf-8?B?L3REbHRVTXEvZkwySWlNVStzcDZaaC9jRFd6SXVoTmtPUTlYY3poY240SG1y?=
 =?utf-8?B?OHlZUTZrbXdkTW1wN0JrV01EaFIzWlJKaGw1dWNSWWxmME1PaVZHMm5JUGtw?=
 =?utf-8?B?OG1COHRDUEs0N0toMUNDbmZlV2FtOXNmTEgyemdtZitOODZ0UTFyWktiNEVX?=
 =?utf-8?B?ODNzZ3RVOWdwOUs3TlFIWEZBU09DTStRV3k3UWlrM0NOVXFKeDgwODdIaFd1?=
 =?utf-8?B?VEFJd2lNRFBEbU9waUlUN1RSd2ViWVBLS1RyQWcwWVRoMElrRVl4K3U1aEJE?=
 =?utf-8?B?dHE1U01qK25jQW9kdFFZSEc2dkErUnFKR2ZKakRweXNkY2s4L0taZHpCZGJi?=
 =?utf-8?B?aDNwYlhjTkRYOHZHcWxoVCtQVE0wR3o5QXBmR0M3VFhqTDRVa0c5dCttWWJW?=
 =?utf-8?B?ajBWd0I2cVFzODMxY1FQRlJ0c3BaUDc0eEtjSWxjUVFZTkgxZE9HZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B0DFC6C6B52114DA006DDC3231031B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a1bdeb-f6ce-4cee-30b4-08ded6e269a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 20:01:45.6198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+8oF9xaxcnGQIyCysDOPb5gXsoCyxJr7r1PkuuLEloYzmaopau74UdljYAcs6BlwwGjfuJxnt3dVXMEcx8NzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDE5OjU2ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUv
Ym9vdGVyLnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlL2Jvb3Rlci5ycw0KPiA+
IGluZGV4IGFjYjdmNGQ4YTUzMjcuLjk4Y2U1ODUzN2VkNTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlL2Jvb3Rlci5ycw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L25vdmEtY29yZS9maXJtd2FyZS9ib290ZXIucnMNCj4gWyAuLi4gXQ0KPiA+IEBAIC0yOTEs
ODUgKzg1LDkxIEBAIHB1YihjcmF0ZSkgZm4gbmV3KA0KPiBbIC4uLiBdDQo+ID4gK8KgwqDCoMKg
wqDCoMKgIGxldCBudW1fc2lncyA9IHRsdi5nZXRfdTMyKGIiTlNJRyIpPzsNCj4gPiArwqDCoMKg
wqDCoMKgwqAgbGV0IHNpZ19ieXRlcyA9IHRsdi5nZXRfYnl0ZXMoYiJTSUdOIik/Ow0KPiA+ICsN
Cj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gQm9vdGVyIGlzIGFsd2F5cyBzaWduZWQNCj4gPiArwqDC
oMKgwqDCoMKgwqAgaWYgISgxLi49MTUpLmNvbnRhaW5zKCZudW1fc2lncykgfHwgc2lnX2J5dGVz
LmxlbigpICUgbnVtX3NpZ3MgYXMgdXNpemUgIT0gMCB7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IElmIGEgbWFsZm9ybWVkIGZpcm13YXJlIGZpbGUgcHJvdmlkZXMgYSB6ZXJvLWxlbmd0aCBT
SUdOIFRMViBibG9jaywNCj4gc2lnX2J5dGVzLmxlbigpIHdpbGwgYmUgMC4gU2luY2UgMCAlIG51
bV9zaWdzIGlzIDAsIHRoaXMgdmFsaWRhdGlvbg0KPiBjaGVjayBpcyBieXBhc3NlZC4NCg0KbnVt
X3NpZ3MgY2Fubm90IGJlIHplcm8gYmVjYXVzZSBvZiBgISgxLi49MTUpLmNvbnRhaW5zKCZudW1f
c2lncylgDQoNCj4gDQo+IFNob3VsZCB0aGVyZSBiZSBhbiBleHBsaWNpdCBjaGVjayB0aGF0IHNp
Z19ieXRlcyBpcyBub3QgZW1wdHkgdG8gZW5zdXJlDQo+IG1hbGZvcm1lZCBpbWFnZXMgYXJlIHBy
b3Blcmx5IHJlamVjdGVkPw0KDQpNYXliZS4NCg==
