Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B71397342
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758951; cv=fail; b=pN4YKgklUGg9NVUY61yIkYgk5qczBsUjl/BEsAfokrVXw8ZC8Mkdy4sKAuoPvx+l7QFF0nSElR1kcxiTV6Jmb2Ix49Ibiemm1EAmV+R8SYuECDUlmRRxPviJMYopYJtUvubhgoQfiUNBGt2lqqHdQ8D6DutHu8MB+rcwdm+UFiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758951; c=relaxed/simple;
	bh=VrzXiWNw1aYvLgPJjJG6xkRYHds0pl9IUi249D0MJyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GOQcTbqq+5hRYVlmOGvkoIfBXTw0uV1/cyubO3izlknY9dsvMamPJGiV9HT3SZMIXTer2hTKEFjJYlCKsEqjSKn5s2/L2U79dK+vd6JFozRWOAqSTA3X6vJYs804gQvcCW4zQ8Yf7Y31NbfggzuP6sqNj2c3XeMFqDSE/y3XKPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CpaMBMYf; arc=fail smtp.client-ip=40.93.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CpaMBMYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH5QXyM9U90Qbfa2XToWVzGs17PFBM9G+bWYKgA+sus6K8krXXTFJVx3XrAahw+yY4qlB9PIUhn7hMGHuGN44k7JNt0J3fFPkwQdeb484TCe2ilZmofefmwmCvJrCytM7smAD1JjXSAtkJGj0WELxpdFYnVD7AyTsgWngqPPY+XNYdDbrWbK1oiTDLsWGnm2htRUEDVUDAUUChP/x7nj/RwsMaUqtfW7mx8DnpA+fs6rmx86AFXYGFbWkXxCfFsgwt9la4CMPZT7XccCCwZQpV0ts8E42JfWmmZVrHCHk75GnyzCCAcA3u6NlmHCGE2k6XNOk5jK/tlSTFNTFpWgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrzXiWNw1aYvLgPJjJG6xkRYHds0pl9IUi249D0MJyo=;
 b=TGQ+iZGEx4H8t3ksqivhmlBvmv3voutS4is/H70jwke1V1xF4WdiEaMFmGJPiqpeDTRrxc7bsDvzmQ/U1tRSHV2pX7mHZMzclcLAlgYkALQRT7spKjwcUfJUmD2S6hhFOGcBt+w0rEIipvTw+knAG4839BoF/SrcTAs+yGycsQ1vF6SZ6OEpmMbfp9TRWxsAaj/yKzKZGbqu3AC5WhrMBuHVMx97kkQR+9Brnug8OiJwiNXHzZu9MAgcSTyD9jGVgvaN4IM9V6stTXTFK79x4JHi8YHOLilgyK3+PVDUwylqAMBzBOk8dkhhBPGugy1FR28egyv59iccxoxAkzRg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrzXiWNw1aYvLgPJjJG6xkRYHds0pl9IUi249D0MJyo=;
 b=CpaMBMYfGCdPox5g8UJbkse/f6SSNCG+tWznEE09poY2WhL20qKZ6dvRRlKAAkhfw2o5gemhpfKQO9iG4ZzmCq1hgyuK5FapX6RrKnpJYVeF6lVOm+6I7iiLzPs7TnzHDa6WNjMsz9/zLDAGSLR/3EjLVSakeHRU4C8K3jal/W0VhgGb1aw/gHEEk0yJ6lav3kQ/SnMbWvn3xQSSqMrYcC60LlVJe5KVb0PNsKAOZzeQu/3yqUHTp7sZ2Hq/E1itPrmclicedCn3Sa8epmuKFsO3uOQ5m1mGAg59xkA7dc5wSKLl1LLbxEk2xzezdsAOs7/OniMQdxygRcoKPQZgIw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 18:49:05 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 18:49:05 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH] rust: error: add remaining error codes
Thread-Topic: [PATCH] rust: error: add remaining error codes
Thread-Index: AQHdB/V+ZO7uFPsl70KZ1SCcKecGFLZV3jIAgAABzQA=
Date: Mon, 29 Jun 2026 18:49:05 +0000
Message-ID: <5c195baa8bf901b3bdd092a0dc0d4138ba1f36df.camel@nvidia.com>
References: <20260629183022.2709524-1-ttabi@nvidia.com>
	 <20260629184238.88BA01F000E9@smtp.kernel.org>
In-Reply-To: <20260629184238.88BA01F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA1PR12MB6388:EE_
x-ms-office365-filtering-correlation-id: 78d39c64-babe-43bb-a245-08ded60f182c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|18002099003|11063799006|56012099006|22082099003;
x-microsoft-antispam-message-info:
 86XWufMS8pxU31DnbdUYxd8w7l0Fpa2azJxAMB8V64WEgrmOLij6aWeAhl50Io4BKDJy18C34FHFLomCnvIJJGgwS7H02+FvNDuQ1pdCVEC7euaVAvk9JCFpTl18d14cq5wPcCiBoiaNm7xnyWmLiPeFtqUngv+3I5a3uyuhBjIke750ljZ+SYynfRpdk1wvPqPWtOKSjEwtqWAbNBhELjgE3EnmqSixzl6NcV9ZCxZG6X3rOtcXvtPUa1PGU3jeAk/k6BeK8WCIRDxBip07Y/o0oOonD8oaj7BLtdqunkiQh9Sgmja/kyCh2Ns+AlLgq/bfvBMUEN+iR7uj1dRS3gS+amGYdVh8OMAoeLzqPtitdi3V1s3nRqV6OFDmJ8sksRme0kulQUzCwTrLGqU/OESivTgW+zdkptYmGRo5T248i9slGlmvRTlVt2+hsQcbhsOX00lTG5R+eYnmJ8vgJsWVr2clCsX4F8+dKlg1rLHK78t1cTKHcoNBe/sftrE5zHTfISiTGLnOzc0eupuyYV66yPNfwitHfrOWv9Uz7WLcL1D1clevmXoNjEDvtcd38rpnmeGIdqDhRLbKbzm9+vpHW6HjXBcWOI3uw25vcd8IMl8ut9ffCOWCLnkooJjPr26Q/o7GDtn2Uc/zcq9ehz0X9DOE7hOgvNeS9Yju6anSG5+6lRWDL8Ij6W9iepLM5VZrRFQklPkY3Zy3NSaKzfhna4J0e4sNCVhdjIlUgZ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTR6VTBVL1NneUtVSFAyTUZ3LzVucXAveWxObFlxR24zaFlFK0RidEcvRW1P?=
 =?utf-8?B?Vi92ck9WbDVjaytsWXdwbGlpcHptb3FXMTRPMi9FQ0pRUFlxeGhQNHJHZFdB?=
 =?utf-8?B?cDhLallZTzQyZDVqZTRlWmtoWS95V3lJYmt0Q3pEWHdjWUM2ZThVQU9GbkNt?=
 =?utf-8?B?UXN5WmNEVXJzcDBLYk1pdmI4Q0llSGVMM2lrZEFDSE5ReWRYVTY0eWdTNlJT?=
 =?utf-8?B?S09qR21PbjB0MkVrRExPWHdOenllMDAwTVhoRWlYazYxQk5XUVl5Tyt3UGpZ?=
 =?utf-8?B?NWJxSzdGZmpOeVFBQ2tscVJtYllldmMzRmd3eVkwSTZrWWxKTmJ1ckVOMVVq?=
 =?utf-8?B?RzBsMVpUVW4rT2Fya1doRWlQdXVYYy9ZMEJMSW1NRWQwZDFDcVBNdUg3d1Ba?=
 =?utf-8?B?b3VPYVkvNm52bWNWUlR3dk1ZeWF0aXFDNmp1TEJPaUZVMmhmU1l6VDIyV2Jo?=
 =?utf-8?B?OTc5VmNHR2tGaksrSTQyajVpdHBWaXBSOG1MRlVPdTZybDk1cGRSN2JqUVdj?=
 =?utf-8?B?RlJ2QXF5Z0crTklWck1rN3JmWi9YK0xPcWozRFc0OVg4TVR3dHhMbEVwZXRK?=
 =?utf-8?B?WXVGbGxEUW9qWGxZMGt4bTJRbXpQMkUyWXhoUWdJMVUySWl6MUxVQjI5Q0RV?=
 =?utf-8?B?akVDMUc5RTkxRmNLdjhaNk5qQmp4cEpKT0x2Q2pQbkRYazNpVXZZQ0lKV29R?=
 =?utf-8?B?QUNpUzhSVzg2V2ltQVpCQ2hFRmZNWVVMZWFFTjBiY3FId2J3amN5V3ZGVnNF?=
 =?utf-8?B?ZjJFaUpCVnVMejJNSzNoaVdBRERuRDRMQXdpOXlyVnNFNWZ1dmFQNkhlY01X?=
 =?utf-8?B?ZmsyTlIydlIrZmxGTWcxMjhLc3VqTG4xMUZoTmdxRk43SG5hd21FT0VoWDJy?=
 =?utf-8?B?ZG03RWFUcEsyZWJ3cmVGUWhHZzBKNFM4czF5b0V1TFV6dDVjK2NDVkZDUmtL?=
 =?utf-8?B?cXY0VHpSc083cUZ4b1lqbFNnaTFCUEhVc2U2cDhrN1MyVXg3WGhiM0IrKzlu?=
 =?utf-8?B?MVFRUTRWYlNyUDZwT2ZXM3F6WEMvUDFkYmx3b3lNMWVlWmk1eUE5eS9mNGNu?=
 =?utf-8?B?SkhtTVNVWWJPaW9oYXQzYnZ1eUE3RjRQNXkwdk5FVUhFR2FWRmlLRzFkNDQ3?=
 =?utf-8?B?SUFsT0ZLcmpSRmhpNkRqZkpCSXcwZmpqUVVQcDFZaEx1RHZHSkNFRnkwOGNW?=
 =?utf-8?B?S2R5eGxnaGxVVzhBOStxZmw4UkxHdWEwV1VJOWR5aDdtT1F5UVNBajVqcmli?=
 =?utf-8?B?YlFyR2lFN0RkeSttUjlxd0M2dHpNdXBFZEdVUHVXRVpORHJMY20rT3JDcVFh?=
 =?utf-8?B?MnZVbm9GL0V0ZXRLakFiY2p3MkN4eERMVktObWJwNitCSnpzeC9BNmppUXFF?=
 =?utf-8?B?SE5BL2xRcU14aG5TMmJSRU1OS0pWNWtJTzk4UC9NZENRT24zUWdETnM0RjhI?=
 =?utf-8?B?azNKa05qaEd5ZGh0SmlxamF1cVZSWnJJQWpCc0NZNkZPS2V4dy9BbTRHVFgy?=
 =?utf-8?B?OFlmcHc3ck9PRDdScXlHTTduWHA5UE1HYW9IcVlLYyswY0hlRGhzS0pEZVZQ?=
 =?utf-8?B?N0dSeGlib2RIWEp1L1RxQUU4N3VEQ0tVMEdOOERjeG9oOVFWZElTSEFhV2Nv?=
 =?utf-8?B?NVZvUzI2ZXR1UDg4K1BIa3k5eHZHNDdPTEROcHlwRDM5OW55enJDKzFvdjE2?=
 =?utf-8?B?VisvNkxqeldUaDltdXplK2o4S1dSV2VqeEt5VjJ0TmNaUnl0VEhKb2tPU0V4?=
 =?utf-8?B?cFE2SHd3UkI0b3ZZZFVRWnhSVXBqZUtkV1R5ZjlJa2N0WmRZNWZpcXVUaERS?=
 =?utf-8?B?N2ZCOGhLaEkwa1h1blpUeEZ2eTV6NDdwQ0Nxek9yWWtVZVFZNjVBUzd6MFND?=
 =?utf-8?B?RzNVd2JiaE9QVGtaM3RiUG1iWkVvejYxc09LVVh4NytNSDZCRW5GYVFCelo5?=
 =?utf-8?B?RmF0eUZOVEcvUW9zUjNBSmtWdTI0Nkl0bEJ2cnh2aGpBU2Z2dHlZbDkzVmZ4?=
 =?utf-8?B?NW1CYjZhZnJhQUd5NG4xa1VRb0p2L3NLWlN6Qmt6VUkwV1NJVHhDWEdpUldE?=
 =?utf-8?B?SXY3UGZ6cVhtbHRkZTBCaWNyYmtkYkpvTCtYc3E2T2toVVUxdi82S2tJTmZi?=
 =?utf-8?B?bEtwYzdsRGVNRWRncDEwM1RuWmloVTlkUEhiVWpmV1JaUFY2cGlOOWFxVWg2?=
 =?utf-8?B?djU2Mkh1bzkyS0trdE43b21FcHdKNTNqQmxjZlFCQ3h5VmVBdXlOcHdKdHJx?=
 =?utf-8?B?bHRUTm54bUFqWGw5N0JZbGRJMDI2VmkwdWUzaHA0cXQ4K2ZvdDNNeFlGdysr?=
 =?utf-8?B?QTF2ZVprQnMva3h4TEthN3llQmtsL3ArcnA5dkpqU0NVTVpGN0NMdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6617888D82B7C47A26EAB199E205D00@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d39c64-babe-43bb-a245-08ded60f182c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 18:49:05.1495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qz7qCb0ASIfghij7IrrZ4bOM3InN2qPAoDB2gi31ul7Tn3Okh15nftkZn5N3ev4rRt5RZK+H8IfOrq1bhM5L3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388

T24gTW9uLCAyMDI2LTA2LTI5IGF0IDE4OjQyICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0g
VGhlIGNvbW1pdCBpbnRlbnRpb25hbGx5IG9taXRzIHRoZSBgRURFQURMT0NLYCBjb25zdGFudCBm
cm9tIGBydXN0L2tlcm5lbC9lcnJvci5yc2AgYmFzZWQNCj4gb24gdGhlIGluY29ycmVjdCBhc3N1
bXB0aW9uIHRoYXQgaXQgaXMgcHVyZWx5IGEgZGVwcmVjYXRlZCBjb21wYXRpYmlsaXR5IGFsaWFz
IGZvciBgRURFQURMS2AuDQo+IFdoaWxlIHRydWUgb24gZ2VuZXJpYyBhcmNoaXRlY3R1cmVzIChs
aWtlIHg4NiBhbmQgQVJNNjQpLCBgRURFQURMT0NLYCBhbmQgYEVERUFETEtgIG1hcCB0bw0KPiBk
aXN0aW5jdCBpbnRlZ2VyIHZhbHVlcyBvbiBNSVBTLCBTUEFSQywgYW5kIFBvd2VyUEMgKGUuZy4s
IG9uIFBvd2VyUEMgYEVERUFETE9DS2AgaXMgNTgsIGJ1dA0KPiBgRURFQURMS2AgaXMgMzUpLiBT
ZXZlcmFsIGtlcm5lbCBDIHN1YnN5c3RlbXMsIHN1Y2ggYXMgWEZTIChgZnMveGZzL3NjcnViL3Nj
cnViLmNgKSwgRFJNLCBISUQtQlBGLA0KPiBhbmQgSU9NTVVGRCBhY3RpdmVseSByZXR1cm4gYC1F
REVBRExPQ0tgLiBCZWNhdXNlIGBFREVBRExPQ0tgIGlzIG1pc3NpbmcgZnJvbSB0aGUgUnVzdCBi
aW5kaW5ncywNCj4gUnVzdCBkZXZlbG9wZXJzIG11c3QgdXNlIGBrZXJuZWw6OmVycm9yOjpjb2Rl
OjpFREVBRExLYCB0byBtYXRjaCB0aGVzZSBlcnJvcnMuwqANCg0KWWVzLCBteSB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgbmV3IFJ1c3QgY29kZSBzaG91bGQgdXNlIEVERUFETEssIGFzIHRoZXJlIGlz
IG5vIGV4cGVjdGF0aW9uIGZvciB0aGlzDQpjb2RlIHRvIGJlIHBvcnRlZCB0byBvdGhlciBvcGVy
YXRpbmcgc3lzdGVtcy4NCg0KQnV0IEkgY291bGQgYmUgd3JvbmcuICBUaGVzZSBhbGlhc2VzIGFy
ZSBhbmNpZW50IC0tIHByZWRhdGluZyB0aGUgZ2l0IHRyZWUgaXRzZWxmLg0KDQo=
