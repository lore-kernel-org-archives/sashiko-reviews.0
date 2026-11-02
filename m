Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793653763;
	b=0yc2e4ahwR2cqtEI430MJ/rWSswubF6Rj7c9GPKrUDPuu2D9YhWDMux0NJET4vmmRaB/
	 eUzLzXOUjZYTEnUeL+SC7EZp5uUWgB7572Jme30VJxmruRisXxkMTtMo9h7osQejc3e+n
	 Fx56czDPsWi05QiFmhP2JrIIuFBEPD/gb2NcJpRfOTVUn6sC8vFQkaBmZJ05m7PVwRVkG
	 fO111sj9RQhJAZa8yJpK/SmmLgR1MganhiZpaXEmKcWAl7tMcz2NYIpxHSP6EM5F6Lh6P
	 ZSL1PKkDJ9YWcqR1gbbx/+gevZJwBPqIL+3KPTDOiD3cdfn2dphRdwLTOeI20FPD1tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=vVvutdzLQGKR2l8sNDzXvfu4MmGKFNrGce38m+IuvFk=;
	b=xJHbNOLWFjBDiPTdXVWF/lX3KXEB73H1sl+tYqxmP7DTASLEOTsMxlsUG/2fzf1dqAGj
	 3Q9/FzuRgdzL2isI/ThtGVZoIN/prGm05su6YcwHUXn+Bv6VrB7y0KPP9uLZfFjOUnVbt
	 4SYWOkGqO7z662T1TAjM3zVhnj02yO7DbO4YObwH3rkyCI9exyIbJzVYuSmLbVnpuUe7M
	 +aFnoktFsZbH/QjX6zJUPOp2IHqM3ZozwLHOprlXp9Nm+rZjyeLCoy9Ap1f+X7YT4j2mK
	 R0tnwA7B7eHwUfMibsZHdr+N2af8hd0I8JElzmAfzpd1ofm/YIt9y73mnfaw1Oe9ZjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqAMG5A0;
	arc=fail smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02961606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 21:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02961606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqAMG5A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793653762; x=1825189762;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jBzxkqhQs2g+DT62/IHr4fr8qEF9NjQ93u3cZLJ2U6Q=;
  b=EqAMG5A0H7oA42E7TcHYLWKkr5wmarBtLty4t79ab/SSIdGCludmTSxG
   f1gMBjdeVXbIAgB0AlcvpC+gcYuxmpR43q0pwPcp6qdnICua4fdK3gJPH
   krWrZKuv7MtAgisZhc6qL2SCUQ+GMRIrjKjY6pW4QuEqPK3c7EhjNyKLK
   1AaH7zrkA1HjKZ3mSQZYKEX75yJaGcWGsgu98DNNqcVFPwSgKpy5ftkyz
   PfkIX5CO9O62wKKYvjhmqWKRT36XyGIPCt8Sy1eFaVc9Q6Djj4T+guU+o
   A6UQV2tgwzpyucJHWyK4v7DTZVVF6F1yv1uC4uILkPf5JM1ORqsIva4Qy
   A==;
X-CSE-ConnectionGUID: KRD/hdhIQYmVubCBylTpfg==
X-CSE-MsgGUID: utUcQRw8T4qGnapnw1lCvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2245332"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2245332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:09:22 -0800
X-CSE-ConnectionGUID: Hmgpy651Qr+r3tfd3pYYaA==
X-CSE-MsgGUID: GF5DKS1LS+CpIA6c/fKR4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6229826"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:09:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:09:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:09:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:09:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBDCjZ8RYdHtDnRa5PJc9ynBdkLqb2AEmJqu/fKzaDY/+w4HUQ7Qh9NdD65v/khA0ue1KOUwXONouCeKeE3Du5MQOZxNi2o/q+CNHYuNxyWiJcOL6N5E7lJl+2pP6/5JcNIeie9Hry7sUYjCqcu1i38g07YYrEc9YxqUmPev9/x7AIMmmTncoX0LlnnYHIHDCeuw0BXV9hPXf/dp7R8ZMuo3jSvl6kF7C+8ZGq6KIOP9nFNPWgP4W+tVEtiPBMYbzsZEUQft7Eo/HswpWtDTYyxpomKfWIyFnXh+0aNYgf5LpELu9CaKLwHqIs5ELtzT8ula93lx2wCZNTl1M4Du+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVvutdzLQGKR2l8sNDzXvfu4MmGKFNrGce38m+IuvFk=;
 b=fSKnnTA23AM117QvpY1zZRhA5H5kYkzYt8+QxXOfh7/DckEEjNgbrWKBY6TbGHuqzLq4mEq88MZ+e0E/PPZ8y78RSQy9sWqFRXI1VZQgEGXdEUn5vGSvM5LC3/3SCl4MQPt3UXC1qid1S6+040lTjLevi4zonpHi6e54xIBEi81Tdw9dif/H06HVDNOHdER8G5cqSwUcyrba4d5wsI+FZntuc+65frO2H65S0KUODC4bAFvEFmiSe1vo3eBspDwsV7oJ+lt54ntHIwTNeeKBfQnqWXUWuSxVZOHObEq3Qd+k+9HaaSogPWd1qJwqoxqUm/vznOzm+Zj3cMMFQnAB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:09:12 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:09:12 +0000
Message-ID: <c858f6d0-2adb-4bd6-9889-19e14b0e30eb@intel.com>
Date: Mon, 2 Nov 2026 13:09:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net v2] ice: validate VF FDIR queue and queue region
 actions
To: <sashiko-reviews@lists.linux.dev>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>, <intel-wired-lan@lists.osuosl.org>
References: <20261013144435.1406126-1-aleksandr.loktionov@intel.com>
 <sashiko-outbox-169952@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-169952@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::32) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b62897e-3e4f-4d97-af02-08df39258b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|56012099006|4143699003|261026121527099003|11063799006|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: oWihULSKyn6KIwqaV6jojvI2HKgSC5WWaf5HYP6w7UjtpRQ0TwdFr3Njh/aoZjKTRDATAeHta6aTz+qN/oPD5pUS9jwEHd9VvNUoaAWlh7plmKk3Vp0IM7mlvJu2D7RkxbasR0JdJC2Ip/yGVOzm67M15I9WvJceF3nsNSud4/h/VhtqZRVSerEeTake0BgI6+SNN6bhH/NpalxNHT8FdeJSwT8kPw0z+R9BnzfBFGzFIaFdw53SVbj9QVLT3u33L30h4xyicUrt8kuJ7en5ZFWJu9hH9VrULQoew+y/SQTRS6X7lDwF4WMGqKAwdm7UZt04SSmp5TyysQE6kD+qYHli4+UIPsZ9rtr8YEZ5ZH2Wg9ZwzP9iaJYwp6EsGTVr/vOuPmpEh5mbS3jfcJqoMBh7yot6R9V1XyvHjEDlO1b+x+RhYm3lNn+D08DLrZpdveQcEKGrlEJ36LKNoSx4DkwEqG0/5GFH2Kb6lLZXPVdpYCF9EQNOXVC+dtsv7EjL1ePg2N8j8Rt7aZR2A7wkss3Aa8J1QeAGuYsYCmlXYmCSx7QVn0Oq6OYcaTabNIknlARGM/KV7C4Dw/sIgY2R29L7V+uircN2PjRTzcl0vRJaNBjhUMoMEB5zpEB2On4Sm8dhruf6KDxfSuTmnc/betGDqzjCAYDVWQLb8blCZmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(261026121527099003)(11063799006)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3kxbUtwVlZLaHl3ZXo1VGlsUFRJMmUvSWxLYURRUjg2RzlxSFhPcnJpcXlp?=
 =?utf-8?B?ZU82WEdmaWl6ZWNJVEJxbHhtdTR0a2NRWnhEeVhKb0FWZ0p2VHhMN2kxVVNR?=
 =?utf-8?B?aC80ZnNDTUdVdFlRcUVxeGZhaXdxUVg2eFVOWVpjeTlFdExUeGlITDBSVnFK?=
 =?utf-8?B?YjhPcTA0UWd0ZDAzekRGZWJ3YkwwaUpmNUs3TFhHTFNHdkhXeXZ0d216Yi9W?=
 =?utf-8?B?R0taa05tOEtRQXFwTUVBTldzY0xhVzQ3ZWVHTm9vWSsyTjNlODdPQXN1UmVw?=
 =?utf-8?B?UU1yOE4zRXZ1cDIzNkNqUFZrNnVBN2I5UkU4OUpwNmkveHRYc3lXNHI4bjJm?=
 =?utf-8?B?ZFc0Y204VVl2dDNtMUJFaFVEOW0ydk9KZHFuZmVwdGo5YzNBQUV6eXRSVHhZ?=
 =?utf-8?B?WmM5ZktKUXYvbkcwaDlwU3QxeTcvdGlaYWpid3VuMGZHMWpza0xOY29PWHR2?=
 =?utf-8?B?M1ZuRTExNlUrODdsNWJ5VW9rVy81NjI2b3Y1Sk84KzBvY0xORitOWDFrUGRh?=
 =?utf-8?B?T1lnWVZYVW5lbGFaSXYyQUo1aXhEZldJK3ZIRVpVZDkrSk54dnR3TWg2ZGpG?=
 =?utf-8?B?V1M4YTFhRXdROGxlOXlqQjJBQkxCV0o5UzdURyszaStRWWRaSVpWaUVoNzRo?=
 =?utf-8?B?ZkdaZ1FrWjBDZkRzWVRPN1h2dGdCZVlyWFZTS294ZlRtQ0xvSWd0aHlyZi9D?=
 =?utf-8?B?MEE2c25lVGRWczE2Q2lsUkU2MUo4WFl6ZDY3WVRZUjBlVnJvY0dnTVJGS1Uz?=
 =?utf-8?B?MlFla3dlQjVXN3ZRSjM2S0lTVHpycWN3TnBrQlpOamluUFZDSHdjMGlBb2pT?=
 =?utf-8?B?OENJbDlwNlVSR1Z4bFUwVjFYUmJGVm5rVmJaT1hQZC9yQW83MUNqa2JjYTVa?=
 =?utf-8?B?ZjhYY1BzKy9SRWhhaTA3S1l0U3BxMWdVVFJUYkxVTlB1cVp5N1lXVC8ybDcw?=
 =?utf-8?B?c3ZDUFRoL3ByTnFXOFR0bHNTUWFPSkZyd0NIS1o5WHNlbnYvNlA2N3dBRkdG?=
 =?utf-8?B?MHRiTTBpbnI0VFhxNTRXZUF3U3E3OHBkSzE4aSsyNmNRTG45U05oYnlCVm9p?=
 =?utf-8?B?dm43QkF2aXJwMTU2UGNtMzNGL2NEN0R4eWdmd2dES216Z09QRytUUEVHNFoy?=
 =?utf-8?B?bkZjN2JwSmdIY2VWS2xuNXU3dUkrTlVNTSt5Z29SQVllWHBIRUNEa3gwbkJY?=
 =?utf-8?B?QlZpTlNzNVR4ZGUrdWJGOElwRmp1bFNzVTIzRWFYWVZrRkQ5ckxwWVAvaTFR?=
 =?utf-8?B?dVp0eFV2UnRDNVFJVFpEc05DWDhwNVVHYUlueUJ3ZFFqSTZYK0ZIcEppTmE5?=
 =?utf-8?B?eHhCMkhxdnBXSEUwNE5rNGpNbVExNy9uRTR4RXZlOCsxYVJlalpPQlV3UEtL?=
 =?utf-8?B?WjF1SE9WOWkvSUVBUXRtQStmc0libmI0djF2cnA4VXF1VlBPSXlvY29Pb2Ra?=
 =?utf-8?B?dkljR2xGd0QreUZocGFVdHREWndBYW5wUDAvK05RL0ZGSUZoNE0zU05Zb3FI?=
 =?utf-8?B?N08yc045WW5IcGUrRitaR09BQWVrcjRENnMxZUtpUnpoY25QbmZBQW9sOFlD?=
 =?utf-8?B?VHNDbVU2cUZsWkI4YVhsRDJMUm1LaThWYThkU0Vsc3hxcGdlYTU1SjdoK094?=
 =?utf-8?B?ekZBTk84Z1p6RldTR0ZSR1NHU2lPYUZONDZlWEdINWNPMHBObWF0UTVxUCsz?=
 =?utf-8?B?Q0dJUHduOTNlQ01YdkpaRk1ZWE1hVTdiTjQ3anFMTHJMaThnSHRJMzRZY2xt?=
 =?utf-8?B?RUlpY2JMNWVEK0dYYU4zUVUrYWR3MSs2dUJWWTJQTElGV0FpOFlTakxuSXc5?=
 =?utf-8?B?NkVLYWhSdUJPcmVUN1FSOGY2bVZpcUZ4K3k5N2JuRC9pQ01DdndndnM3TklY?=
 =?utf-8?B?ZWJONWltbndjclE1MFVpZE9BR2VXbURHTHRMbC9EaFR4VDl0eXE5K1RxVmNv?=
 =?utf-8?B?WHh1UytpMlZqZXdVcm5FaHM0VUl3dms0UmF5YlNpTG1DS3lWcG9aSWgxNkRU?=
 =?utf-8?B?TzROQWo1bjI0bWhQTXpvbVJzMjZ0cHNWUjdrTXkyV0MyTXcxcTZZMkc4Znd0?=
 =?utf-8?B?Sm15RWVwNEhUUFJJcmoyRDN0bUR3emRuaDhTeUxETWx6dFZGQ1paWWl2UjJL?=
 =?utf-8?B?azkyaUs1SWRMQzllOXlIZEN1WG5FMllwajdZSEEyUUp5bnU5OWkyd1lDcU1B?=
 =?utf-8?B?MytZbS9YeFI0TDdNSXovRDBOaVJHZHlLKzZaVW5jOVlYbjZxalNhaVZ5OWow?=
 =?utf-8?B?SE44ZXBleS9OWkIrcXA3Y1dnRzRReFhLTXN2YWZjekpuMzRKK3cxYUpoemJn?=
 =?utf-8?B?blhFQXl3bXA1Y1Z4ZjFNc3NzRW1vcjhadWlDVjF4cHhMMFQ4NjZXUT09?=
X-Exchange-RoutingPolicyChecked: VoYvFgPf+yb+CYJXM9tvBkJVoKpnSL7bL82eS5Q2qrikjxEsaKE0jxePCr0oB6OLJyZxHC9PkMOsBFYsSqokPVt1jNdLXuit/RoVWlRs0tM1CnxLsBmntTGb+puQWhVOa/aAXL77WfD/vnpdDf/A7KIj1z65dzROzL0IQVZzg/pNhsHcbtJ0sZpEd0Jn/a9DQU82WYkk3jC1CP5Xjue3tXXzY6U3DHw+1taKSq/uFl+1CQ3hB2pgXwj34ntWimXqT9LIAP5pcXc+Tb+y+5wXKS9wLYfA6JkvFKYIE8Gs/Ev++ueDZ/jDpvjc5yS3XUV7ZD4AmuPgrz8ykLkbaScRlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b62897e-3e4f-4d97-af02-08df39258b2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:09:12.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19g23TzwR1YL7Zm7hdaIDmI1wcr8VlVI0SUEv36rFyfvi62QFZfxoeWkcuhXA7FQfLdkVgjf9caGTdcQm/+mGr23JrUNBulAXtjqA/Mv4+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
X-OriginatorOrg: intel.com

On 10/13/2026 7:58 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: memory leak of pkt_buf and prof in ice_vc_add_fdir_fltr error path
> --
> 
> commit 6477a5eb13b0a0dff01249d4a775aff5939e63e5
> Author: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> 
> ice: validate VF FDIR queue and queue region actions
> 
> This commit validates the VF-supplied queue index and queue region in
> ice_vc_fdir_parse_action(), rejecting invalid values to prevent a VF from
> steering matched packets to queues beyond its own range.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/virt/fdir.c b/drivers/net/ethernet/intel/ice/virt/fdir.c
>> --- a/drivers/net/ethernet/intel/ice/virt/fdir.c
>> +++ b/drivers/net/ethernet/intel/ice/virt/fdir.c
> [ ... ]
>> @@ -1176,11 +1181,25 @@ ice_vc_fdir_parse_action(struct ice_vf *vf, struct virtchnl_fdir_add *fltr,
>>  			break;
>>  		case VIRTCHNL_ACTION_QUEUE:
>>  			dest_num++;
>> +			if (action->act_conf.queue.index >= vsi->num_rxq) {
>> +				dev_dbg(dev, "Invalid queue index %u for VF %d\n",
>> +					action->act_conf.queue.index, vf->vf_id);
>> +				return -EINVAL;
>> +			}
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but does returning here leak
> memory if conf->pkt_buf and conf->prof were previously allocated?
> 
> In ice_vc_add_fdir_fltr(), if ice_vc_fdir_parse_action() fails, it jumps to
> err_free_conf which frees the outer structure but not the inner ones:
> 
> ice_vc_add_fdir_fltr() {
>     ...
>     ret = ice_vc_fdir_parse_action(vf, fltr, conf);
>     if (ret) {
>         ...
>         goto err_free_conf;
>     }
>     ...
> err_free_conf:
>     devm_kfree(dev, conf);
>     ...
> }
> 
> Earlier in the request handling, if this was a raw flow,
> ice_vc_fdir_parse_raw() allocates pkt_buf and prof and assigns them to the
> conf structure:
> 
> ice_vc_fdir_parse_raw() {
>     ...
>     pkt_buf = kzalloc(pkt_len, GFP_KERNEL);
>     ...
>     conf->pkt_buf = pkt_buf;
>     ...
> }
> 
> Could an untrusted VF exhaust host memory by repeatedly sending requests
> with invalid queue parameters that trigger this return path?
> 

At the very least, this new error should perform cleanup, even if you
don't take the time to fix every existing error path way that is broken.
Can you please investigate?

Thanks,
Jake

>>  			input->dest_ctl = ICE_FLTR_PRGM_DESC_DEST_DIRECT_PKT_QINDEX;
>>  			input->q_index = action->act_conf.queue.index;
>>  			break;
> [ ... ]
> 

