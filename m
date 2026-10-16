Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2F831355B
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112150; cv=fail; b=KJLar57n7RJOu34jHvxEX6sLWqg6YXo1Ag1z/GEy/JvnLMszhZqomfM2LLZHYwV1UffvdZt0EwJp9aHwumqYEJSsnzgZaDlH+d5rOyR2mwxdhOqw8hvLbH/H2o0Ks7mjp9Iqq9SjibgKsXPJaCM7CA1/uLNFRyc65t4f35XuZlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112150; c=relaxed/simple;
	bh=o34pFuL9isjT1FPHpwTckOaKQ1QryYFnpS45f2NVeVI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GEZB0TdRoQEbZggW5aVdUwT7Nq8OTUMi9C2ClKr0S0UPx0r3qqdVkvm5//859RE8isXzKwriv2XcLchf9J6PEEKLpa6J9plKOne8Fd4apeulW9AOnXLURJg95DcqQlucE/YoibyF8ZOAvyBVzmF03fpmrW0M8p/1zPwjRxE4p1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=U2kUeIl7; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=iFMzg0xV; arc=fail smtp.client-ip=148.163.129.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="U2kUeIl7";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="iFMzg0xV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=o34pFuL9isjT1FPHpwTckOaKQ1QryYFnpS45f2NVeVI=;
 b=U2kUeIl7BisPrn+/I4KZfl7qmqIAZY2PD4hAio8duGbdylabgf7qMPAkK3dftc1DaSK9U9S6aVks+gQVoZiXSMVl8HQKGuHq/N2uERkdXPzy0yHKpeK7PpavWc4xucGcJzzMUrDMgxgOoqMBGymPlJhSwN05PAGSGO7KT237/Iy+8wp/KeTax8WnLcw9kSL1LyuDvfogkkyqdLa4/Y9+NXiz0re84rnVClc/QBoLT2PgDZFv72HyTYNgjmLT6kAa456KOMbRkUJeBUsm0sQXvCoLPxMCK/iirZslKlx3A/kJcRo6DF1u33Z2SFTKfBsmGmH5MgEn1zGysZ6OEPq+kg==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020104.outbound.protection.outlook.com [40.93.198.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 6899FC006B;
	Fri, 16 Oct 2026 00:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+rt4GrnBUj4I3x/Je9NU3PuNBFJnODGf2/wXL9zyoD8YFkrJLonrWcEmVENHxUdmjNBdKHqABs6VHC0Q+dsIv66ZmjIzY2FeyC21qKV/KuaD/y/dJr0oiYBDBNsGVfHpWpNShOX4hbaw3XsO6mQZO3/VXODkz5Ak2Xy51JaEOtHskd2J/8O8UCkMJUAyOQZd6hteLLbjrE1phGIJIGuK37eNMZE0mDjZsRFgH/x6cQw3w5WfLnXY4JjDoR99uw9D30o6Ji6MOJP6C9JbeRYK3DJl/cMFunQaTv4xCOWzbSTiN3ppkqzsv7Xlr279y+Nsre8NkClZEnsslAleqzsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o34pFuL9isjT1FPHpwTckOaKQ1QryYFnpS45f2NVeVI=;
 b=ioZYdZiJrhcmEn/7NYseryGj82k9eqwDtImCj12Iiuee/JFi9Gf1xIZI4iFf5FMcmAFhubf1uQ8laP8/2Sdxlxi2XHCDtzC0Ro/7otwgDIvPCvrtZrL05+JmZac+wMZyZ9BMdBKSRpXkCxCWEmX/BgQzDr/njhjfeAWt4/5jKpt60osCdkbAE2LIwLOYbb4dqWCDoR5T5wq9VuiFKAhp5s+rQnvxafm7z9Mi7JylA/oUqVoaIXjSn1qIWIvi41gvovXpyWWkvesQ+dCs0yyBBerQHH6kjwG2sFh/aIuSrPNLD9RdmqiV6qjNSp3Y5h9zRV9aYL3cqYZtyZzPhFh+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o34pFuL9isjT1FPHpwTckOaKQ1QryYFnpS45f2NVeVI=;
 b=iFMzg0xVX9XxFV9OehTd2G/Gu4/xul2zw00tP9ZdzydXI2uLQTOf5s1nVPJefij8uIkLnoLzumQElaoJUJUklDXuZwQLWX8vbVpEpLpsk6Zq45HHnkM4UIM/lIU5IVwi7mu1VxjAXAVifWAtJlhyRKqF2Y5CCUY6AjJXQ40h7RrDrRlW2cGSOBqYVvK/dd3glCLiPuniycrIE4NNGsSuPJWdmVvP7q1NVgvfqFCZMXOcz8zD4hLrxN8EHSaQXPK0EQt+pzyyKFofhND2dEkjvMrXOEMM4vnfdH9bKs7+WBuRfOHKZ8qQwxhqQD1C8U7XffhpGjIKHU7lXRVmTvkTwg==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:45 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 00:55:45 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski
	<arkadiusz.kubalewski@intel.com>, Ivan Vecera <ivecera@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Carolina Jubran
	<cjubran@nvidia.com>, Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v13 12/12] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Thread-Topic: [PATCH net-next v13 12/12] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Thread-Index: AQHdW2QC5cGg2ZHRfE6zmmz5BnQjd7b9o52AgAG3vIA=
Date: Fri, 16 Oct 2026 00:55:45 +0000
Message-ID: <20261016005541.11374-6-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-13-arouhi@sitime.com>
 <sashiko-outbox-172000@kernel.org>
In-Reply-To: <sashiko-outbox-172000@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: 1eac94da-971a-437b-7a0e-08df2b203627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|5023799004|56012099006|261009223027099003|4143699003|18002099003|10067099003|6133799003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 8LmuWJG210iIoTo7jXyw3yKRVS8MSxEfTuFF4C9vx63qFLsg6QWYJaJWhkYE2EldMzlo63z5GQtT2+TavgV9usAjv5Gw2TBYv0+tIQHp3hqtMr2Yhv/2yPVbYSdFnyLNSsVLnnFNb/DaoQU9e+nCUlLUUX7MMLkC8JKcMrk56o7TPLL84jeW5EfawvtXo08MtaGVzMiduvqAsBxXuXLI4GZMICerYNJtpuGUqR9bwsZloZZGJEgfF/9TBPRyIETVM4JXVQqoYEPoa53zIa5VQRxFc+HKAKRFv7dk77fWuf6CBnOB3O/OdWG/0HkaiWyFeAPyB8Cjz76PMrEqdncV8m5+an6Rbx+3EzC45cy1bZIDfuHnU8aRrD7WbQKS0+UPQqME+fz1iNGhNHxL/vouvTaH3BYT/EDjPO5PoNhEurvwz0KXMXjb+kRh89oyG607AkcAgToqok6K9vw31sY10r6D42CS6KZI0QeaKT/l2pIgW13gXiUPcURdQnqvq9HwN9IBJoxzi3duBFBkQGFYQ87LLHoWYicr4mTU9ZAQBea0PsVRf3jaVrw+2IN1ZseALZA3VZ/6K//vXtF0Ybh/vQF8s2yt703jrMugHWEdm2+9pEazIb8tvwzXebRtId196ILLGrF2YMHqcLwjoGLAiHmQUE29OkuNLSCz/WpFJ1jHK/51WlFHfowd2Nmt7SPwKTK4m/B6T15icAyISFX1Q5bRaCIt2mBCNFKdsGtZ9Y8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(5023799004)(56012099006)(261009223027099003)(4143699003)(18002099003)(10067099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3Rpd3R0QmNYRDJSYk5PUkFVZEV2RG1rc1UydVhrdUFUZ0lHNVg2bUtmT1k1?=
 =?utf-8?B?YVpFS2FOM0pseUJoZDg0QXErYXNZVTh6L0JyTXpmWmpEV0Jud2xSQ3Brdk9T?=
 =?utf-8?B?dG5PbkU4WGtITDRPdlRKaUs0VE52Sm1xQ1orbng3K1FVRjlUVUR0NG5aV1kr?=
 =?utf-8?B?eVorZ01ZT3ZGbzAySUNCeWxnMjhCOEpNdFdSN2ZzRUV5d0RxTGhNYVdYRkJw?=
 =?utf-8?B?ZTBvdVlFbEVodTEwVFpVS0xlQ01IN2IrMUIydTdobTNtR1RFUVhoZE13eW5a?=
 =?utf-8?B?NmQ5REZwU0RqV0tTTCtma1gyOURFUDFjSStxd1JHVWFlVC9vRHJCNmM4QXN0?=
 =?utf-8?B?ODFzdEFOcEdIYXVUVWVJbHFqcG1pczl0Y3JuMDdZU1E1NzNReStpakcrL2d1?=
 =?utf-8?B?S1NaaTNnSi9wZVRIYzUwUDlBVjdhc3pZc0ZMbmFTaUJuNVJkYjFnaEFBSHlx?=
 =?utf-8?B?RExkWUFLY3poV2xxazEzTm41UnFySVBTTUsrOU5CTjJjMk1rWXkyeFRMTHND?=
 =?utf-8?B?WmpVZzJCTzliQUVsWkxua3FnNXg5c2VYemdCaTA1MVlwSFRwRE84bmxjcVJV?=
 =?utf-8?B?SndLMzNLUlFYVGdIbHJsTmh2dmNWVzdwbjdaejZ1aHNmR3RoYlQwdHFMQ2ZN?=
 =?utf-8?B?cFlyUS9hK0I2WVNSYjdRT2pzMUJMcjlINkgyYU4zT2wrd2NtNVFZMFBIZWdk?=
 =?utf-8?B?c1BVb3pMTTl3cUdaSS9naGVHYWVRZTJPTGVLeVRsV3RwbHpVbjhLQ0VNeTJ3?=
 =?utf-8?B?Q3RBYk4reVZud1JkZjNBbnJJMnAxMGgrN2VsSUQ2VDlkL0pIQzNPMGR2R1NF?=
 =?utf-8?B?eHVBbFdVUWtyMHI5SkdXWWpxTnh5Z3ZCdEsyN3luNVBCc1FWUUdWL0g2QXdt?=
 =?utf-8?B?eVZ5S3RTNm5yNEZWNldjdTZXTk1OdEd0b1dSdWlEQTJzbkRoQTAvazZpakNi?=
 =?utf-8?B?azhmdVlUNlBjVEdEbzRvL05VMGM5d2YvM042Wkl1WE9GcTNpeTM1Y1owb0hZ?=
 =?utf-8?B?YTZML3dCbU0xOXBiS292MkJjdjNsMjhzMmpYS3ZIWURnSkwvMW9FaUc2Vkdt?=
 =?utf-8?B?QXRkSG9xQ3FPNWphTzF5djhlekRtVmpocUNVUWZmKzNuMjVoZHZiR1lWTW9B?=
 =?utf-8?B?TlhmYVlVYlhaU0dNL2FRMjFZa29wN1ZOQ1V5SldISDVtUFFEam9FSmRRK3gw?=
 =?utf-8?B?NkxKT2ppT0dvTk9lZ3J2ZkEwRXlBZk5DNHV1Rzk1eUZLQVJUVFkzV0R0UnhK?=
 =?utf-8?B?c0t3c0RZeXZSOTdob2RQSXBNbXJYR0xsY0w0bC8ycE1iejNWMjVvajY3UmRo?=
 =?utf-8?B?S0U3RFV1NEVYL3pTejExL0J3Y3E4OVFGTldOYi96cXAzWnZ0WEQ1dlV3azRE?=
 =?utf-8?B?V3ZmUFJFem1rTHhaSE1tWmZZaWg1a0o1K2tNRWhRTXB2NFpldzIrK2x1NTA2?=
 =?utf-8?B?RlJkc0RaRHRkcnFMQjYrRUZmRjNJY0Z1WTRSOVdjQ1g2cGZmZnZCb1FNdlFC?=
 =?utf-8?B?cE9kNXQycUFGU3dHdDQ5UTZ4VXBZWHU0KzkrUVBrbG8ybWRRUldGWVRBVnZR?=
 =?utf-8?B?d3doUXBxRW9qbUd4Y3BQc0tONDJubmJPYzcwR0MzRVhYbWNQUHZ2d1Urd1lj?=
 =?utf-8?B?TENCcG1mU0dBTml6OVhjQklXWGFzNHJzSlZ0bVNIMytqQzhVQytES2hpb2NS?=
 =?utf-8?B?RnF2dFE3eHU5ZU9qMGdnOUdVbjVsM0NQb2xjR3FCMEMvb0szNUlKS1FEandh?=
 =?utf-8?B?a1JiMS9hMWlaZm1sakxOdzBXd0ovUU54NmNSbktQckZMUitWUkl4SVlvQ0FY?=
 =?utf-8?B?Ti8rQjlENWFqc3dLZ0pEcm9ad0thUHVLa2FFTEc5VDNUYmNRTW15TVJNSjJJ?=
 =?utf-8?B?bzFyMEFXRUN2WVZhOU8xcjJ1T2Nic0ZqTU9UQUdsRm1PNk5kQnc2ZElmdEZB?=
 =?utf-8?B?SHE3bCtpbnYvRjBWaFlBeThXRDJmam5qdm1lRCtJeWpFQi9MZ1JOL0J2cW1h?=
 =?utf-8?B?c2V6WndQMzh1NEM4ejhZeW9wWFVuc2tSWWh0S2g0NVVmbWtWa0FQc3p6OEZa?=
 =?utf-8?B?UHVGeUg5OXhTUm82Ry9mSndSVGI5QkRPUXM1ejlSSFpLdUFiNG5ML20wRDh4?=
 =?utf-8?B?MzJnRmlWWUVUK3VtcnRSSHdmSk9OckZSN2hrQndQUTJ6NXdqOXhnK0wrMFpm?=
 =?utf-8?B?Q0cybW5STXpMUTlXdEdPMEhXNmNBclUrakUxbnhvclkwcFhvQkZIck1BMzhI?=
 =?utf-8?B?ZlN4c1ZVaUxIT25ldUtBQXQ3eW9qeW5iZDZwQ3pXbnEzNUNhdEFweHNLMXAy?=
 =?utf-8?Q?7pRHO3XAiU9Rs+BayT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	xNhAbILba712gQTf4no2mYCZwt+I75br+kKtlXGD76yCaf6m9DVf8+Q3awK3Dorg91cCYh0vQPB21TjknuBAjarjdgKTZpR3MGm05KDgcXjlM6VCkMzUxN3UDbY6e2JguVPam+3WhOO+aSCAsAZqXfd7JxTpme02WHlOQ6QP90D/BThTHWOBx3CsivlrNb1wGPJJYqmXns80c7nFz/lAV5F9fhAK2YnTDMUBCzoty8qnwNoYgW/BnINNpZuoamcqV7hocaFoXfx1fACR+9IT+U84zIT8jyFyR8jrqx1uINH1AalZbND4Ne6ReImRnT0RPMP0PgOz55H9NSOV7op7ug==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eac94da-971a-437b-7a0e-08df2b203627
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:45.6985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjoN6NJ4V7yB+eHqMw8do8bq9KAqx6MKbRtmWMObCvW0nzKW4GC3IXYbTZITDF4sBLfxYXio6AKHbiUcz3pgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112148-bTPiztvjRdrc
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112148;bTPiztvjRdrc;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLg0KDQo+IFtTZXZlcml0eTogTWVkaXVtXSBJZiBzaXQ5NTMxeF9pbnRzeW5jX3Ny
Y19kZXRlY3QoKSBmYWlscyB0byByZWFkDQo+IGZyb20gdGhlIGRldmljZSwgdGhlIGNvZGUgbG9n
cyBhIHdhcm5pbmcgYnV0IGxlYXZlcw0KPiBzaXRkZXYtPmludHN5bmNfc3JjIGhvbGRpbmcgaXRz
IHByZS1zdXNwZW5kIHZhbHVlLiBVbmxpa2UgdGhlIG91dHB1dA0KPiBtdXRlcyByaWdodCBiZWxv
dyB3aGljaCBzZXQgYSBzdGF0ZV9zdGFsZSBmbGFnLCBpcyB0aGVyZSBhbnl0aGluZw0KPiB0cmln
Z2VyaW5nIGEgc3Vic2VxdWVudCByZWFkIGlmIHRoaXMgaW5pdGlhbCByZXN1bWUgcmVhZCBmYWls
cz8NCg0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0gVGhlIGNvbW1lbnQgaW4gc2l0OTUzMXhfcmVzdW1l
KCkgc3RhdGVzIHRoYXQgImENCj4gY2FjaGUgdGhhdCBjYW5ub3QgYmUgcmVhZCBpcyBsZWZ0IGZv
ciB0aGUgZ2V0dGVyJ3MgcmVhZC10aHJvdWdoLiINCj4gSG93ZXZlciwgdGhpcyBnZXR0ZXIgZGly
ZWN0bHkgcmV0dXJucyB0aGUgY2FjaGVkIGludHN5bmNfc3JjIHZhbHVlDQo+IHdpdGhvdXQgYXR0
ZW1wdGluZyB0byByZWFkIGZyb20gdGhlIGhhcmR3YXJlIGlmIHRoZSBjYWNoZSBpcyBzdGFsZS4N
Cj4gQmVjYXVzZSB0aGUgcmVzdW1lIHBhdGggZG9lcyBub3QgaW52YWxpZGF0ZSB0aGUgY2FjaGUg
b24gZmFpbHVyZSwNCj4gY291bGQgdGhpcyByZXN1bHQgaW4gcmVwb3J0aW5nIGFuIGluY29ycmVj
dCwgb3V0LW9mLXN5bmMgSU5UU1lOQw0KPiBzdGF0ZSB0byB1c2VyIHNwYWNlIGFuZCBlcnJvbmVv
dXNseSBhY2NlcHRpbmcgb3IgcmVqZWN0aW5nDQo+IGNvbmZpZ3VyYXRpb24gcmVxdWVzdHM/DQoN
CkFncmVlZCBvbiBib3RoOiBub3RoaW5nIHRyaWdnZXJlZCB0aGUgcmVhZCB0aGUgY29tbWVudCBk
ZXNjcmliZWQsIGFuZA0KdGhlIGNvbW1lbnQgbmFtZWQgYSByZWFkLXRocm91Z2ggdGhlIElOVFNZ
TkMgZ2V0dGVycyBkaWQgbm90IGhhdmUuDQoNCnYxNCBhZGRzIGludHN5bmNfc3RhbGUsIHNldCB3
aGVuIHRoZSByZXN1bWUgcmVhZC1iYWNrIG9mIHRoZSBJTlRTWU5DDQpzb3VyY2UgZmFpbHMuICBX
aGlsZSBpdCBpcyBzZXQsIHRoZSBJTlRTWU5DIHBpbiBnZXR0ZXJzIGFuZCBzZXR0ZXJzDQpyZS1y
ZWFkIHRoZSBzb3VyY2UgZnJvbSB0aGUgZGV2aWNlIGJlZm9yZSB0aGV5IHVzZSB0aGUgY2FjaGUg
YW5kDQpyZXBvcnQgYSBmYWlsZWQgcmVhZCB0aHJvdWdoIGV4dGFjaywgc28gd2hhdCBpcyByZXBv
cnRlZCwgYW5kIHdoYXQgYQ0Kc2V0IHJlcXVlc3QgaXMgY2hlY2tlZCBhZ2FpbnN0LCBjb21lIGZy
b20gdGhlIGRldmljZSByYXRoZXIgdGhhbiBmcm9tDQp0aGUgdmFsdWUgaGVsZCBiZWZvcmUgdGhl
IHN1c3BlbmQuDQpUaGlzIGVtYWlsIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgZm9y
IHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IGFuZCBjb250YWluIHByb3By
aWV0YXJ5IGFuZC9vciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJpdmls
ZWdlZCBvciBvdGhlcndpc2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gQW55IHVuYXV0aG9y
aXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwgY29weWluZyBvciBkaXN0cmlidXRpb24gb2Yg
dGhlIGluZm9ybWF0aW9uIGluY2x1ZGVkIGluIHRoaXMgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1l
bnQgaXMgcHJvaGliaXRlZCBhbmQgbWF5IGJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYnkgcmVwbHkgZW1h
aWwgYW5kIHBlcm1hbmVudGx5IGRlbGV0ZSBhbmQgZGVzdHJveSB0aGUgb3JpZ2luYWwgbWVzc2Fn
ZSBhbmQgYW55IGF0dGFjaG1lbnRzLCBhbmQgYW55IHByaW50b3V0cyBvciBjb3BpZXMgb2YgdGhl
IG1lc3NhZ2UgYW5kIGF0dGFjaG1lbnRzIHRvIHRoZSBvcmlnaW5hbCBtZXNzYWdlLiBUaGFuayB5
b3UuDQo=
