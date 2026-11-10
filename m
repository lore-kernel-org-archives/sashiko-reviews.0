Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794304454;
	b=qK3sJXbP7OIC3XMnS32pbNJ9ARKvra5c0+sMt7vQgbXXB7WYsfRrfDsHcRO2BDTPRoJS
	 6C9VgyTwl6JAsAaHYx5FDAGH29MTai7U3l8m+De4Hj79fXt59yWcUYZkjEw7lBVQHsHoM
	 avt9Piz3zOcrwBNTTu3PemOk6dg5cL+l7GsDpvoiLOR5n7f2RqEQvl3kEpPx8+gpJQ1hM
	 gIOtnF2qEDmTk2an9+1lRocVeTg/afMuiGz8TfEwoURCykvSC4xi9SGllx+BOwXyI84wH
	 bH7xInRGC+WsIAiJIS3ZGBAaGJNTLiCbuHN+qtEwm8nzCvW5Y+tL4dSFzYmn70Z5R4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304454;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0G0u7CATBl0F8k0hUWvorjhfWEZWBDHS7JvND12OUzI=;
	b=lNUq2ax+M+d7MMYR6XJkzajzhydx8zWVV7v24HQMkEH6M4jSXEpSYrd0oi87DkbhiTLG
	 G9JH9ILLJZAU6tKT0Bvd9u8fQFfgoMhH18qrMLGFTdm54AAmytZ1JiJC/ThFC5g+vQvEM
	 P4ZS+xd1jTJf4HxEc4tM+Wrp1XrCpk3RWv2LX39ldGoSaiYRR2RbTqvyBg0zr6K2cRBv/
	 miQO5uyRLwqygbBf2748lS+wcs2W1u6Yyhyv20KO48kADaFsKSflPhmG8z1ociY/WQeGM
	 qxaAxRlcUpZHMts9sK/vaRsI3uZrJS5CtmyFuZAqO2xN77QBv7NHxFdxS6GhvvrtTJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="fYC0/bsE";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=adf+FcLn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F54606A321;
	Tue, 10 Nov 2026 09:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F54606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=fYC0/bsE;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=adf+FcLn
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lHcH3216555;
	Tue, 10 Nov 2026 04:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=0G0u7CATBl0F8k0hUWvorjhfWEZWBDHS7JvND12OUzI=; b=fYC0/bs
	EtV1opfWjFEGyKZeyoLXG12VshUp4Dd/il47UfAYbybkpKIJMrSa/fouyzlGPUj7
	EYgBLjpwrInJIFe5xal6o0D6nrG9MPQ3IRXJ5bcnux0bs70aqosVBzbkiEbpZmcJ
	R9N4UcgjHhqk+oLw8WYC6G2YQ+9LrwJIib3eKzK8Fn37BfmNdRZr4vr9JePS4oeS
	kDiWkMHogF4P7TP+4hTSOo5P3OeNE2O8PhzaDOLIEXUfJTD1U0b477M7V5HGlzgF
	9p4FAZiWuRG494cOk/3LKiZqu7gjXLyHyaKyNmW4P0ucGUjXOzqvCUkMH66Az3f3
	p2RAGSmx8wKdWIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0G0u7
	CATBl0F8k0hUWvorjhfWEZWBDHS7JvND12OUzI=; b=adf+FcLn/znRnVDnaSKwW
	ljr8JaMZXhm7O8oLVNl0IKGfeVAi/rWIscZ4zZD6aB9TvGVEbNvBBM721toQcODZ
	P6ITGshX+AremqmXEIPY00+spBssp6bqOxj1IpV16Zbw62wFz/N4LXGx3146165B
	JzNpQc6Eu5Sr4uEblrs56zr/74DAnMXhmrcAXc7GZw8bJuVO5oeYDkF+ukQwEy/6
	RQb00WqNwp5SESr+K2y53bhLISOtvH5fQbxG/dfkEuNE0Ii2NFwM7YjdacnuUPkO
	BWuM12X7iAZAf+eY68kwAJlw/3bHXqkixnXw2th+r1xPn0aC9Goa3XDK3ZcbZ3qi
	A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huwenhehe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 04:54:11 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHNMysIZlZSTXDCjODkcbqLca3MSuBexxcpCojoVbLY1qa17VlUONDhYSCIzyYlvb4D0G8mvPRyKQhLE/RgNuIWpv08b281MCH5nqys+n1n81kkMAOzrd7I6LtfvII1d4/6IMVBnkNe2jv7cMMnFZr5vjzHsvnRI+FVhG7OlFeE4dFgj5YGE16pL79SMiGfn19KEnIB9JtgIk2BwfSJQHHCvg1wn1NNfuG7+x4FKjYhBvWj84/wZ9F8jmMfey9N5pED+P0DxnMJV7TlN+UDkTinsHBfJTy0GbH+d5GyHatgHWaTShldyJ7dpFJWodNkKniwMKl80ovF+lVYCZ2l5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G0u7CATBl0F8k0hUWvorjhfWEZWBDHS7JvND12OUzI=;
 b=rnbamX9rPVa7yVzcV7cnmzbTc65ncPofyS97FIdksZ/U99zwNy5bCHZfbsrSzPcr3HMa6xddmi+aqoiNtwX/14tZvzUUelTWBJNbLEwwOTRCUGGLFBqRqjzJBJ7Rc+sVg/FuTYMPtGDskRxD70G+naqmXkOwqye2Nje4qfapgCw+C02trdDLAUSfMEGfysRBE8YXyghw5JhIYL7s6tPDTfVIwaqUxu6YJijsZrEXVG5UEDMJ6KFALL16nlQrIrS18Cd5CZ7oXWpGE2EpBQJ/ck25Pdpk16jeJMU5DijB66OlLu02qb+CE1STr9kdJvg0PnonltHUSak2NW4OyBFNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by PH0PR03MB6381.namprd03.prod.outlook.com (2603:10b6:510:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 09:54:09 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 09:54:09 +0000
Date: Tue, 10 Nov 2026 10:54:06 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: sashiko-reviews@lists.linux.dev
Cc: Iustin Stolniceanu <iustin.stolniceanu@analog.com>,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: adi: adin1110: Add OA TC6
 protocol support for ADIN1110
Message-ID: <avLpeyOXz5yqBuFI@analog.com>
References: <20261109085952.105331-1-iustin.stolniceanu@analog.com>
 <20261109085952.105331-8-iustin.stolniceanu@analog.com>
 <sashiko-outbox-206699@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-206699@kernel.org>
X-ClientProxiedBy: CPAP307CA0006.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::14) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|PH0PR03MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 614b5a0f-6efd-49ea-3c97-08df3f1090fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007|10067099003|261022105027099003|261021135927099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	1EHyV2kTcjbkjABb/+1n2Ns6VZp3RONZAJBVXnKwV2pYen1VGd/a3fYPY3f+uMmP4IfyY22iOtA7Az8dI7+kR2NxqZ/WbmuBJZEMgi7QUR72wM+RA5UsMPgghGCLmEoh91JxvhKRShB0VAu/kvPM0TyEZQ/gFDRTnZ/Eq7vpEytN7UNDygR+/K+Dih4DH1/XWuwkWi8w7S8vWii2ON46Kj5ijagzIZ3ec4ilKz/4n1ekMMPWQX6hCURHc+NS/j404CrWjDqPkuTVl9XMlCDP8Iuo/kqgOEs/tor2TW+t0IMTzE8DzJPuT+bi3wKaNhBk40mbskz7+58vOXsXOmzpQMSnkhU3+HKU77krU1xCMtkhcq+RdcvT0No1LjEu9MxbkuYcALZAmzIUwokpTyCRGaHKnCeWlqxcOKV0aHi5UZHzTDnH7O5S9hHV/33hQjhDc+LH4rfVuiuaZHLfDkPHITzETbW0kJ3jkScjfQvXlq/7hqVWH1cJeFoW5gWooF1zSWQGLo5NqPgIAjTEuhgVVyZv5VCs/E+KLBNmKscfvxmMktM8xx8FMntcoN+b6PKAgk9UTzpRZPOnUHY6A8IKsjkp1U3OtoMruwzDtQbxvqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007)(10067099003)(261022105027099003)(261021135927099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlyMkJub0hLTUZIOHN4TW9kc0drODRsdGxjMkpLVGkvQkJMRWdRWStYUUpm?=
 =?utf-8?B?TysvTXlHd0ZlTjEzR01WWWMxS2NIaUVWUHJZZzJ1OXRaeG41QWVOaWtIT0oz?=
 =?utf-8?B?UTRVaTRObGRRTmdmT0V6dElJVzRFVEk2UVZabEJYaVVHb0l5SjdWQkVvOXBt?=
 =?utf-8?B?bVZvL2dkRjF0cmluUHhLRlZneGY1d25UUFBXTVMyUWQ1SVpPYnZHRnI5MFAw?=
 =?utf-8?B?Yld1b0xaNUlOOE5EWnFQVUV4VnFaNkJxaHhVd052ZUlJWDQzakV5OWo4UmJ0?=
 =?utf-8?B?QmJubkJYUnUwZ1VPeGYwODJhMGh5U1dwcmEwejF6WHFIUGpoM0lhVkxjWkZy?=
 =?utf-8?B?QlF0ekMzTmxQSG9GMTlHOUZtZkE3SWpjQlA5RWRnVXh3di9OUEtocGhma3Fo?=
 =?utf-8?B?MHQ5d2JJeXBGNVgxK2FqZEZFblZrak1rWmc2Y2tNQlVVM3JhOXhVb0ZkOTVS?=
 =?utf-8?B?WVRKK1FFNXpoV1JiUFczVS9qK3RCR2UyTTBleHRmUXJleWdVWjdjN2hCL2hN?=
 =?utf-8?B?MFpWbU5PVTdzQkpWV0ZDbER5RkVsRGtZTTJOV0Q0dWZqVGtQMGxiV3lTeEw1?=
 =?utf-8?B?VUZRYmE3Y1I0Y1lIc2ZJRzFhMVVBM3pxeC91U0YvZzRWdHZETEtZM0ZoVGJY?=
 =?utf-8?B?YmFXbmhnSzBtT1gzYmJ6VExxTHQ1OUdFZ3U5VjBFZEpGaE9GNDkvVzdvWmpM?=
 =?utf-8?B?U0ZObm5LUW1oTWtDbjk0RE14bGdXV09UYi9Gam01cytFWHVqNENldWJod0kz?=
 =?utf-8?B?dDlOQmEwaUk5anBVU0c0YWUvR0tPZW9uQnJVZEovV0x4anF5WUJWYXBMTkph?=
 =?utf-8?B?eVo0REU0bS9WRDRCcHlTRDBGcktCTHB5NDhpOERXZ1lLYi9kUVpDZWQxN0Vw?=
 =?utf-8?B?eWhEeFhIaSsyYThmbVJlb0s0M2c5ZWtJOVo5NmYxcExCblhqd3JKWkJ3L3hY?=
 =?utf-8?B?TElDWGRnZy9wTEZXUWo0S09GS1JmbnVNQWNjdld4YnlKbmVjeFcyWVFycGxl?=
 =?utf-8?B?eXFpeFlmN1ZzUDRCbnZCa09nZEZaKzNLZTcwRVQ4S05sN1JnMk8zTkRESnZu?=
 =?utf-8?B?RlpObVA1enhzT2ptbk1vaGhCR0NoZzZDYVM1WUkrcWlHNjN4NUlaa3VOVTlL?=
 =?utf-8?B?Z1I5dmhWeXdJTHdvZXhIUGFGVmZ2M2F6bnFUZW14Z2E1d1dhV2plY3NDMXpU?=
 =?utf-8?B?S1NSLzBzQStmU0NIYitBb0Vha1ZrMGMraVBkOUFRWllJdWMwRElESjNMSGlK?=
 =?utf-8?B?Y3JsSGZYS3V1YWNaZkhRN2NDSmJJbEJsQ2tnOGcxc0YvNVVwUUt1V1EwQU4v?=
 =?utf-8?B?a0dHbnV3NytzcWUxSDVKdVlDZTVwUkhuN1pVeE9CTXlka01FTWZ0V3c0QjlJ?=
 =?utf-8?B?Z3ozZEFGUzFGdmFzeXdDek9qdW5uQ3J2QnBWSm1rVTZMRitrbS9tZGZhMTg3?=
 =?utf-8?B?UURFWmRGRlpJSlFyYlVrRk1qbDF3Z1hoYXAycVFnTUlrMlRFMDUrWHFONTJM?=
 =?utf-8?B?YTBJVDJUMXIvb1hhVWQyb0lzczBrRVVQdnNKZVIycmt0WmhBU0pIcEhMdkRL?=
 =?utf-8?B?NUR3ajFsVUVERlFiSU5CZ1AvSGJyRDJwY0pVanVWbERoTUk0b3hucEhDQi9x?=
 =?utf-8?B?Y3VyYjdqcEhBWHYrS3VHajdTWENVRlJZekE1a2U4WCthYWZlK0p5MHdWalIz?=
 =?utf-8?B?bHFsMUxXU0kxMFFiNThsZ0VLYmZDM3ViQVozNVBZbHREdVB0b2lYSUZQWUd3?=
 =?utf-8?B?Q2F0U3BpSG0rdVdVUVRHRDd2Q2IxeDZxUmNDblhyY3VUdk5rNFJHWWs5cWZu?=
 =?utf-8?B?OGZlTTJVc3A1QU9YZzRJeEJERmxPN2I3WlNhZVVvYTZrZFc5amNHRnF4Z3Js?=
 =?utf-8?B?Wml1UG13cjFreVFGZmRoaWp4TTUwcXp4SVJ2Nm9ibjVGclNKZU1Pa2p3L2tM?=
 =?utf-8?B?TmRpYUFLV1d6Y2ZLVER3VWtJd1ZjY2ZlOUpDL21zQW45N0I2eUtjVWF4ZFJX?=
 =?utf-8?B?dGJxZnRjTTk1NGtjTElHVTY5M2IrYWIyRHoxQ053U0NaVEN6RjUxRnlMOWh3?=
 =?utf-8?B?TXdlaURVRGxRYzdRRi9zNEwxU3dUM2dzd1JXMzVkd2xVVDJhUjFHTXpZemZx?=
 =?utf-8?B?NTIvdEdVSUtzK01FU1MvTjVBUytnUXZzclRtbDU3SG53WFlpQVB6anVNV0Fr?=
 =?utf-8?B?VDI0OHZ2S21kaVJKOHRzOU5HdklaWUNlc0FPSmJvL0FqaTdmMFBjcHJNcEkv?=
 =?utf-8?B?OTVoU2wrbHVrUFpBM1VudHJja291cktOVVRrZWpRUEdudk9vWWtJcml2VTdJ?=
 =?utf-8?B?WnZBRjNESEJvamZrVVNTRjJkNHBjTlJLT2JPMW9kVm1KVFVzNjdTQT09?=
X-Exchange-RoutingPolicyChecked:
	2aXG0mBNXzKKl036qvC6TsbJlIWcwcm0Tw1YQmMHDCL2Ya8QKwrnjQH8pJ1Ux9WYsi7m+DZox+NbAJJdTt99ItXrs2pPguGdIHVzpX5mBLyDpy0Dhu//yFkfWl5btS7nSgIjET2K4BIPztGJa5srl0m8/Om0UVL1O/lVaaVhlOJ92j4yQvXjzN91DmocMT6jcqKLKC7BW5QBQUSdYJgjsBtpIBj61ENRgipu+6gLq7dofpLcjp+8NvpTMwUw1CUzysQx/KUTRFw6ap+KvLsJAltuEAQGmFkSfYco/b16JuIk6agpK6o/yRfu7hA+EkUysFkg9Z+XVfNkDcMCzyGcuw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614b5a0f-6efd-49ea-3c97-08df3f1090fd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:54:09.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0fH7FIY58Y62gbjDmuObId+1o+WAGBQZ/GToNrNXHEIXOpnjhFdOlcR/72kqagca895Fs8bim5zt5YOIC9TC9hyS9y5gUmPdUK+XbWy6Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6381
X-Proofpoint-GUID: Du2OcoRMIGys0acqk5eVY83HW6i0p_R4
X-Authority-Analysis: v=2.4 cv=Dv/Da2/+ c=1 sm=1 tr=0 ts=6af2e9c3 cx=c_pps
 a=bquUzJqYOqw1EpBvECFzMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=qsGz6egzXmWmyU-IHT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX1ZSYPmOAloVr
 GpCj9iiQzawuAXPIj6ISEadXe7g5Y1AgNijIraGIMs9JuADXKgf0mKmQxgHWNJ6+6XLXitSxrZv
 Edp+etgZbIPxPwsUHl2EhykmTGiIAqNcDvIhHOGpFbqLiyZW1No+Eu0v8/FCo51leYCFg0HJsAN
 zFtg4D5KwE+Zq8KtapqYs7L+08HJmz/pF5vpy1BMijCRBYs1aiJ0wjLFyrUFY1nhjY/09oBuJyZ
 hCSEuOSIoroof0fLBmBl8v6IaDnw7tFeWc3Nz5aoFUGhpP/DfKb6iyFs9B3hjem6e79IevnQOW8
 xlRMTcjnGNxF5oHWgCeAgeOGTwXxVLD06s/tZs1cme8aD2Bp6Knq5xBqrFa+1jeZR3K4CygZv3x
 LixfDV6AVHLbMTEP2pnYE+998OCO0+PLIV6Wv7GU5blTqRMrS0b9KD+9Yuy/OoPxadGFkBzaZSj
 Z2c0068+RUjzzftXU3w==
X-Proofpoint-ORIG-GUID: Du2OcoRMIGys0acqk5eVY83HW6i0p_R4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8FR/sFYCw/6n
 /bp4ZfEuPVos2jp0dZgGWdwcw47yRzFJvjocejHSDumraMUsgwzCwpJi2TTidkllhIF83YRzmxE
 p9kr5Itq+an+wGZiWJ94ZGwJxtaXM1WNvRblZIAt/k6SFkUZVQ1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

On Tue, Nov 10, 2026 at 09:02:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] net: adin1110: NULL netdev_ops dereference in
>   adin1110_oa_tc6_probe()
> --
> 
> commit a8946759404622a473f14b5de5bca9f8c82eea9c
> Author: Ciprian Regus <ciprian.regus@analog.com>
> 
> net: ethernet: adi: adin1110: Add OA TC6 protocol support for ADIN1110
> 
> This commit adds OPEN Alliance TC6 SPI protocol support for the ADIN1110
> using the oa_tc6 framework when the adi,spi-oa-tc6 property is present.
> 

[...]

> > +
> > +	netdev->if_port = IF_PORT_10BASET;
> > +	netdev->netdev_ops = &adin1110_tc6_netdev_ops;
> 
> [Severity: High]
> Does calling oa_tc6_init() before setting netdev->netdev_ops cause a NULL
> pointer dereference when CONFIG_NET_SHAPER is enabled?
> 
> oa_tc6_init() calls oa_tc6_phy_init() -> phy_connect_direct() ->
> phy_attach_direct() -> phy_link_topo_add_phy() -> netdev_need_ops_lock(),
> which dereferences dev->netdev_ops->net_shaper_ops while netdev->netdev_ops
> is still NULL.

If this report is legit, then it looks like adin1140.c has the same
problem. Just FYI.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109085952.105331-1-iustin.stolniceanu@analog.com?part=7
