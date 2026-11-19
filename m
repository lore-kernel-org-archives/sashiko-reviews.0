Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795115821;
	b=H1v6iqtJeP9Ecymq2g1i1xWlrVenQ2lUpKefqgncYBH8sQ9lSlLPQsvwXcjQhPO1zRh7
	 /ZQ2mieMw4l8luHcAeTxEv2u+8zWcAiz9fcNpeK2pnmGTO73MLB+poeqksffMoR3BHk5x
	 lPvJtyPDv6oETHGkycn7naOPQOYNQ/EKWRaDuUGP6DidGgcT0PePSYyU0hQMF/CC8TsJD
	 0XNbliJd+QdBvXUKXw9cEjvdmq4MH4lHwHmWNukQG/UF3lgT2whujquh7gzhssp/KygR9
	 n/oK1CPR6HCnV3sWJ0FEkCGI9spBNpzDgk48n6CgJdKwdCvhqVfPBUZ76Pw4jehikJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115821;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=ldyD5yNPg19FO2bldRSN6jhIeFNFcyAn/Tc+TU4BMcE=;
	b=Oa9b9tIqSd1hl7ysNiutQljmqNbb/Y/eIdeNRlxN5eMVKucPff+5T3SJwY6pHdtpspVo
	 mtdtaPpBBzvcN3DRATjBbqxcey+PC2hyTfcJk+7pIcAdluUbY49bjlbiNu4fKxfct25mG
	 NeErORUkOCU5E0AfCIpl3uRoJf8mpePpXw8yIluolcVFK3sW3zwwdsxTdESmCObSG12l/
	 yyjBdx3qszE7M4fKrlOvV2UDDEOX2ao09wCRvH/OikiZT7+jGZvDcPeCXbSnwURmmfGLR
	 I3RTZ4Pc3kMgOQx6k/djxo+P3qRk7Y9gO3K7UurjzpxYtJz39JXSdfRlB5Qq9Y6xn4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qgf53rgm;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jGiTzQLb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D4606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 19:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60D4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qgf53rgm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jGiTzQLb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795115821; x=1826651821;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ldyD5yNPg19FO2bldRSN6jhIeFNFcyAn/Tc+TU4BMcE=;
  b=Qgf53rgmyn60t5j0q0qqaNKenzxPByIV/a7dRisJqxCgn4+7h4cPm7l4
   2oXXV12rALtN/zc1pTzYrwLa0GxGnIMAdpoYR7+kSvZBkts04y4dyBs/i
   U7e9ZOkA9iH3tRYywCe2qgDX6qncsW6PA/uAlUm+t7iUeZAjVVKMmuqS2
   it7tokiJsJ+Y1OWSXTxxvYcdC+j0f5D7X7VaRj/s3Vi32uvWi0/MV9SSE
   HcV4zskl9q2MGHz0+213+qsosIxrk3dYWtEwrisevQeGwX+JQSYw7Hkvk
   u85ZuZtUilrF8SlZ4N8o/IhUaPRLL2re21j0KrYMXcmK23q48b9Di5+ml
   w==;
X-CSE-ConnectionGUID: K3ILr5yhSMqKPmton3I6Mw==
X-CSE-MsgGUID: SJb/BWAZS2iPf+4j8yRnlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3880207"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3880207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:17:00 -0800
X-CSE-ConnectionGUID: rDca9UvWRaqvvjsaPw3K/A==
X-CSE-MsgGUID: e66r//hcS+iAgk4r1cNC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10596808"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:17:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:16:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 11:16:59 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:16:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMbaTtTm2JZjJBekBptujPffPuQXEyoxiE6PkyPJElJ5U2OI9DO0tKXVkYtS2kr+D78O38IwXszbHAaNhKI0pZr8wFdYRNqT5qWpuaRLia+E6qPqiQ0RXcmroG1kezB9FYqIP+QBQiE7wqg9QqxSE+dDIhtq3kcujZmNfBklmmt8+Tks8O9hXya8MxLl5AszVUmb/FEfxuAuNem8rYf9Sf+aef1p3VblLeulliERyAxSLPHarC+pu8KbQjTJnEHGUQhDchoOBnq/LE9YaTki0j2CN9n1BVwfIc9PuLTnBzEI0ITg6r31uKMSm8V4P0RmzEQ8dbU+fHlX9pdwLiwvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldyD5yNPg19FO2bldRSN6jhIeFNFcyAn/Tc+TU4BMcE=;
 b=u8pSrgX6iAwmRW/xcDFqqx9lyrGvy00647nvLNEdWCwR7m5f2jFv4qS3t7Dg+ofkZUJxHk488N0KazpsRhm2+56ULLt0nc6LJg8rLTdq7iD9OOCcSVuJ2sj/afk5hA+yBPXM/De5iRHDSzjGSIQTAtnVeyRs2omZxAT1AFuUWgiXHyPwcOlCJlG2Oxhkij8EzQilM0GVDVFpJfYN1XoQtnRoMojFT54V89i3D9n6NygHleCminy71tt12fSBYeI/Y9CERn1BORs8W3TlPr/4uZMPWw7Ty+6DUMFEfkdzt93fr3BbbHGdoV7Z6TzYYvXbKAEL1c4jqVcHU7smlKxuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldyD5yNPg19FO2bldRSN6jhIeFNFcyAn/Tc+TU4BMcE=;
 b=jGiTzQLbEu0mLS8PV2KB2vZWx1847nAm26pwpdP0d0U5SiU71ufg+ANwWD8eIVGFEqldeVEC7bi2th6D8XyziaaKAyT3oKWlPaK7yvQd/cJpc9oOShMskpQGsOrlJFQs0yinnWlQDUeLAw9OP+gZ4ctofQXmkTaOgmd+1JxkSu8=
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by LV0PR11MB311182.namprd11.prod.outlook.com (2603:10b6:408:60d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 19:16:56 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 19:16:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Charles, Daniel" <daniel.charles@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 2/4] drm/xe: Notify scheduling-state waiters per exec
 queue
Thread-Topic: [PATCH v6 2/4] drm/xe: Notify scheduling-state waiters per exec
 queue
Thread-Index: AQHdeE6Y+WtdWvoVxEGsVsJ8ejpsm7c1sN6AgAAS8bA=
Date: Thu, 19 Nov 2026 19:16:56 +0000
Message-ID: <CH0PR11MB5395CDC2D222AF06B26EE979E5792@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-3-daniel.charles@intel.com>
 <sashiko-outbox-223756@kernel.org>
In-Reply-To: <sashiko-outbox-223756@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|LV0PR11MB311182:EE_
x-ms-office365-filtering-correlation-id: 91fa4c11-f36f-46a4-eeff-08df4671ad68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|11063799006|261009223027099003|261021121427099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ZcYgusr9gFO9n5JnhGJ5ibth7UkmB/s6mRrRcvKXIirVcmxI47IccbJ6jpf5cCgIjwsrTglE5y0tPSisaQ8VGw4MzZp04AXj4O/kHQ2gS57O5793eoakaRgXRsp0FlqSiy4kYT38auMkLPzxlrefSSbA/7YSC5vDiKLitbAbu3lsem/mCu3IoFi9YJE0gpdBDUgt76u1tj1ohsgFWz4ZOFuk7si+gmOHdc24b5GAZLbwbVBcMhHsHOZSOB7c6EwVLQzvYw0kJldcbnAox6acsSy3egerk5L3N8bim70MZ38bMhpjd7djvSR4zxgdUxL3DbBAX1ub/NiTa3TIqLqlsUKjs1dmRgJkN8hYxPx+XhBrRx2J4Fukyw2taF4xXfp07NbQ4l0julVLCg95In5wxmOHwn5yQGd3KkalyC/hnyvUeJxc1jyqXRGeA9UQdk4T1qiCuFegSQb1CHNQfzRZE5+nKpoXY7URMUuzQnTX+H8nN8mYh+mTjV/+K96hDOiexM+lEht7h47cicqxr4SQMi6U8unCgAHGHjU46lT33S384ccStmjAHdnXzxnjapBTl9/FPirCZvw235lWTNS+kHDWRivQ85Y3b45loyGxqh7E5+oKSvE+kujWDcdYZzUWDTXdxvP/wLcwb9LmbcMvhEoTenmIz3txqfLHdjOeC6Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5395.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzQvamI2a3dpQjZwREJVRnFyRUNxamVKVTRtaHpoN3BIeDRaTnBlQVhDaldO?=
 =?utf-8?B?eDc5a3Zod1dob0xHMzc3NC8wNUVxcXQ2eStJYngzVWJqWFg1ZWZJWXZGZnlj?=
 =?utf-8?B?bWtoVUZZRU9hTEgza3dmZHJwWXk3K0VPcHkvalJBSkgxMC9TT2RlbVROV0F6?=
 =?utf-8?B?d1NHWW8yK3U4OU9qc3VRZlM3ZnlzaGxsdnNpa1ZPaDRodDc0cXB6L2Z1dXc0?=
 =?utf-8?B?T3ZGR1duS2xCaEd5OWlmekwzUGtNcnR0dmgxZ01sbnhxUnYzR1M5RlJNbnR0?=
 =?utf-8?B?MlIzQ21VZ0lTbDlQWkpNamlPTGovU01NSVRGOGsvckYvd3d3d2d3UURpMUZJ?=
 =?utf-8?B?dzE3eVUxNHdKWkY4Zm9NbDY2UE9YZjdIVGlaS0ZwbWxGWFdTRDhSSUtFS0NP?=
 =?utf-8?B?YjFEaGVYbGRENVpzZm5Sb3dubGJ5RkdEbFBITGZKRnZuYzR0VDA1MmpRQnIy?=
 =?utf-8?B?NmE2Yk15OFM4Mk9IUVFJZmVWeWNWZmhjZGxUdzhCMkM3OWdKdG9lU0JaYmll?=
 =?utf-8?B?NnZaZzJwVGRXSGlSemxLYzdaVkpjQ05vNFlpMnY3dE1TYWhzNFlJYnZzY3k4?=
 =?utf-8?B?clRQdmluK2RiR1FKczNYMXBaeTJycnZOZG9welFhK3EwTEc3YXZQeWp4R3Vo?=
 =?utf-8?B?djI2WGwrdDN6V1RDNWFrZVpsTGdLMEN6RURMTjlNNHRjQjBHemJiZDRrR3lC?=
 =?utf-8?B?MWRwcmtrV0hqTmNvTTBBUWFhVVFtd0hEQnBKKy9UL3hWTngwdTZDai9PSlM1?=
 =?utf-8?B?VkdDdnc5eDY3TlVzK1dEVVlQOTAyVEZBVUMrNkZDMTZWdVQ1K2RQRkx3R3hZ?=
 =?utf-8?B?N280c3I1TFpxK1UvWmlCU1pwNy9pMEdwODRPM1hoQVBSOEVTQk4zRTRncEl1?=
 =?utf-8?B?ZFdhdHVkY1RvN2ZlLzAzUjRCYzBBVTFhRkZrVVdQTWxKczlYQTZjK1lqUnQr?=
 =?utf-8?B?SzErTWFCN1hOc0ErWDhKNnNlYURCT0xJMWhNQy9BcE04aHNRaHNXUkU1TDhY?=
 =?utf-8?B?QUgxL2dOTnJRNkhGQ05VRU50Vk44UmxQeHlTbFRJaGdCeEhXZGlmYUROeWpj?=
 =?utf-8?B?di9SNDFpUzI5azR2ZnUwRHozTlRmVzFhSlBMMnZzNWh0RzRJMlJFTFEyMHdu?=
 =?utf-8?B?eW1XMG9FQ3lubjd2dlQ1cjV4LzRZWXNiWTF4SEY1WVhDbnlFd3FkYmFaUWt1?=
 =?utf-8?B?SC85bnRaRjYrTHBSREhPQXNmNE8rejZwVDBUVDRTRGNrME5lYUVsWXkza0JB?=
 =?utf-8?B?QU9acmhVUGJ5cTRVT0VQZG9ibHVBWDZaVTJhZ05OK2FVLzJYVTJwWkVlc256?=
 =?utf-8?B?SzdCMVFTWHptTmNLdTJGTXdROElueWgyY2RKUUZuTnM2RjRzS1VmL1VyV3Bp?=
 =?utf-8?B?RE5uc3JNMWlYSm9SNzRsYkRaYWg1QlBBWjc4SUxhTHUzUmxmY2ZBTmh5SUtq?=
 =?utf-8?B?OHZEeExSaUtISVpwNFVXWGVkbzhOcnNpWDRoRnhiSEJpbEp6YWxXcDNBcDBt?=
 =?utf-8?B?QlJacG9PcDlacUJtbC9hZ2M2QS8yTnZyL09IaDgvc3BOVEE3NzVyUGU2azhj?=
 =?utf-8?B?djRLZmFkT0ExRUdQelJTR3RMYlB1QlpxZGZjK05DWmdxdjdHc3V5cC9Bck1U?=
 =?utf-8?B?Q0lBWjFhaE5WL3FIWENQSHhLeTYreWtQTW1ZSkdRMWVUQjM1YUplMGo5Nld5?=
 =?utf-8?B?SGNTVmo3enROYXNTWWRUbDEyVVIzUUZUQnhNVmQ4dk5KY2xMWHprYlFWdnlw?=
 =?utf-8?B?WDZrYTFmaEdYU010Q3MxbE9OMWx0Z3Y4d09idGdVR2VVNUIxcnM3TEhjamdL?=
 =?utf-8?B?U2VPYnAwNklmR0g2UVlKeGlHbkhYd0tEWVhONEg2NnVLZW9rWUtQaCtsSEpU?=
 =?utf-8?B?SnJiRkJ3bTVYRDJobU0vTFhVKzNiUnBRM3Q0WnRrMTFIcFl1cGtjZDhpTisv?=
 =?utf-8?B?eFBGNCtRc1EyMWhBUTVrNXhJdXdsQWoxVDQzS2pBVG1xb2tpN1QrMDVvQTd4?=
 =?utf-8?B?VHlNVTJJTUtZaUNsY0ZxM00zOW5Lem92cUVWY3p0SXM4ZkhyMnZnYWNvV3Vz?=
 =?utf-8?B?YnhxMHY2ZU9QeWRxTlVOMVV2TUJ2Q2NEMFc0MkI4bDJrcnY5M1FUQ0ZpdEJS?=
 =?utf-8?B?QjJCbUtza3orODdSOFlNSWRzdExpNEo4cmJ0bFVMWncyeXB5ZllnZkUyVk5t?=
 =?utf-8?B?WHVUNGQ5dElxdThPNkNRVjhrYVB3dEwwcHFJaTNLeFRnakNiYnFwK1ZBakhG?=
 =?utf-8?B?bTBZYXpMMFlVL2NLdW1FSjJ3ODJWRzlESHJacGZUMWhpNUs2K3FwNFVlZXha?=
 =?utf-8?B?blhIUCtQczFOOG1TWHRWbUI1V0F4QUE0cXpIRnlvS0pUV3lNNkhhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KiLCtOqBpzbfSc5xSLl4CP25LLLyujRsR6T0bvo4yXid6zJPYBPFQAJ0Kq/qru8hdH2B+iOUoqquxwrkrLGTSaMYddiHXTArsTPMdMxS6Ewy/hp+D4XQ6y5W0BbPV0NBVUhW9LB48GgGo7NkdpokzshBq5D4tSWRXA4/KEnOyGpkA2eK8VWXuFYbaOhDnHLJUK6jG2xqW2CqCaCUB2XKxo+KmDd3qO7kcpIwcyCpNC82mFKIX0sev79wHyYrvJOsRgoR0qafycB3IYNvZr2LlBXFoFWiuLOfaE5uLffUL0la1FjbBB4yvBux9aB60PRykLRKKSIPGe3ZaqaxeD7hzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fa4c11-f36f-46a4-eeff-08df4671ad68
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 19:16:56.3942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yYoIttyL/pkAHIjdBmqeR2XKMKyeXhZNj0Lz10EOG/CPhlzyQWrCj2QZitgOM97MUP3i+a+YUBleokT1vaZ3HvUu2cIm52QD+geztX+/Xgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB311182
X-OriginatorOrg: intel.com

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIHNhc2hpa28tYm90QGtlcm5l
bC5vcmcNClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxOSwgMjAyNiAxMDowNyBBTQ0KVG86IENo
YXJsZXMsIERhbmllbCA8ZGFuaWVsLmNoYXJsZXNAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIHY2IDIvNF0gZHJtL3hlOiBOb3Rp
Znkgc2NoZWR1bGluZy1zdGF0ZSB3YWl0ZXJzIHBlciBleGVjIHF1ZXVlDQo+IA0KPiBUaGFuayB5
b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVu
dGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gZHJtL3hlOiBJUlEgZGVhZGxv
Y2sgb24gZXhlY19xdWV1ZV9sb29rdXAgaW4NCj4gICB4ZV9ndWNfc3VibWl0X3dha2Vfc3RhdGVf
d2FpdGVycygpDQo+IC0tDQo+IA0KPiBjb21taXQgODI1ODRkNmMwOTkxYjI1ZWY0NWJiZjE5OGQz
NzA5NmY4OWM0ZGI4OQ0KPiBBdXRob3I6IERhbmllbCBDaGFybGVzIDxkYW5pZWwuY2hhcmxlc0Bp
bnRlbC5jb20+DQo+IA0KPiBkcm0veGU6IE5vdGlmeSBzY2hlZHVsaW5nLXN0YXRlIHdhaXRlcnMg
cGVyIGV4ZWMgcXVldWUNCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgYSBwZXItZXhlYy1xdWV1ZSB3
YWl0cXVldWUgZm9yIEd1QyBzY2hlZHVsaW5nIHN0YXRlDQo+IGNoYW5nZXMgYW5kIHdha2VzIHdh
aXRlcnMgdXBvbiBTQ0hFRF9ET05FLCBzdWJtaXNzaW9uIHN0b3AsIHdlZGdlLCBhbmQgVkYNCj4g
bWlncmF0aW9uIHJlY292ZXJ5Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMN
Cj4gPiBpbmRleCAxZjI0ZTI0OGFjYjk3Li40MDg3YTM4YWQzZDY2IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gQEAgLTU1OSw2ICs1NTksMzAgQEAgc3RhdGlj
IGJvb2wgdmZfcmVjb3Zlcnkoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ICAJcmV0dXJuIHhlX2d0
X3JlY292ZXJ5X3BlbmRpbmcoZ3VjX3RvX2d0KGd1YykpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICsv
KioNCj4gPiArICogeGVfZ3VjX3N1Ym1pdF93YWtlX3N0YXRlX3dhaXRlcnMoKSAtIFdha2UgYWxs
IHNjaGVkdWxpbmctc3RhdGUgd2FpdGVycw0KPiA+ICsgKiBAZ3VjOiB0aGUgJnhlX2d1Yw0KPiA+
ICsgKg0KPiA+ICsgKiBOb3RpZnkgcGVyLXF1ZXVlIHdhaXRlcnMgd2hlbiBhIEd1Qy13aWRlIHN0
b3Agb3IgcmVjb3ZlcnkgY2hhbmdlcyB0aGVpcg0KPiA+ICsgKiB3YWl0IGNvbmRpdGlvbnMuIE1h
eSBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dC4NCj4gPiArICovDQo+ID4gK3ZvaWQg
eGVfZ3VjX3N1Ym1pdF93YWtlX3N0YXRlX3dhaXRlcnMoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+
ICt7DQo+ID4gKwlzdHJ1Y3QgeGFycmF5ICpsb29rdXAgPSAmZ3VjLT5zdWJtaXNzaW9uX3N0YXRl
LmV4ZWNfcXVldWVfbG9va3VwOw0KPiA+ICsJc3RydWN0IHhlX2V4ZWNfcXVldWUgKnE7DQo+ID4g
Kwl1bnNpZ25lZCBsb25nIGluZGV4LCBmbGFnczsNCj4gPiArDQo+ID4gKwlpZiAoIWd1Yy0+c3Vi
bWlzc2lvbl9zdGF0ZS5pbml0aWFsaXplZCkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJ
LyogUHJldmVudCByZW1vdmFsIGFuZCBmcmVlaW5nIG9mIHF1ZXVlcyB3aGlsZSB3YWtpbmcgdGhl
aXIgd2FpdGVycy4gKi8NCj4gPiArCXhhX2xvY2tfaXJxc2F2ZShsb29rdXAsIGZsYWdzKTsNCg0K
U2hvdWxkbid0IHdlIGJlIHVzaW5nIG11dGV4X2xvY2soJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5s
b2NrKTsgaGVyZT8NCg0KQW5kIG11dGV4X3VubG9jaygmZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmxv
Y2spOyBiZWxvdz8NCg0KVGhhdCdzIHdoYXQgd2UgdXNlIGluIG90aGVyIHBsYWNlcyB3aGVuIHRh
cmdldGluZyB0aGUgZXhlY19xdWV1ZV9sb29rdXAgeGFycmF5Lg0KDQpBbmQgY2hhbmdpbmcgb3Zl
ciB0byB0aGF0IHdvdWxkIHByb2JhYmx5IHJlc29sdmUgdGhlIFNhc2hpa28gcmVwb3J0IGJlbG93
Lg0KDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gPiArCXhhX2Zvcl9lYWNoKGxvb2t1cCwgaW5kZXgs
IHEpDQo+ID4gKwkJaWYgKHEtPmd1Yy0+aWQgPT0gaW5kZXgpDQo+ID4gKwkJCXdha2VfdXBfYWxs
KCZxLT5ndWMtPnN0YXRlX3dxKTsNCj4gPiArCXhhX3VubG9ja19pcnFyZXN0b3JlKGxvb2t1cCwg
ZmxhZ3MpOw0KPiA+ICt9DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IENhbiB0YWtpbmcgZXhl
Y19xdWV1ZV9sb29rdXAncyB4YV9sb2NrIGZyb20gaGFyZGlycSBjb250ZXh0IHNlbGYtZGVhZGxv
Y2sNCj4gYWdhaW5zdCBwcm9jZXNzLWNvbnRleHQgbXV0YXRvcnM/DQo+IA0KPiB2Zl9zdGFydF9t
aWdyYXRpb25fcmVjb3ZlcnkoKSBjYWxscyB4ZV9ndWNfc3VibWl0X3dha2Vfc3RhdGVfd2FpdGVy
cygpDQo+IGZyb20gaGFyZGlycSBjb250ZXh0IHZpYSB4ZV9ndWNfaXJxX2hhbmRsZXIoKSAtPg0K
PiB4ZV9ndWNfc3dfMF9pcnFfaGFuZGxlcigpIC0+IHhlX2d0X3NyaW92X3ZmX21pZ3JhdGVkX2V2
ZW50X2hhbmRsZXIoKS4NCj4gSG93ZXZlciwgZXhlY19xdWV1ZV9sb29rdXAgaXMgaW5pdGlhbGl6
ZWQgd2l0aCB4YV9pbml0KCkgd2l0aG91dA0KPiBYQV9GTEFHU19MT0NLX0lSUSwgYW5kIGFsbG9j
X2d1Y19pZCgpLCBwdWJsaXNoX2d1Y19pZCgpLCBhbmQNCj4gX19yZWxlYXNlX2d1Y19pZCgpIG11
dGF0ZSBpdCB1c2luZyB4YV9pbnNlcnQoKSwgeGFfc3RvcmUoKSwgYW5kDQo+IHhhX2VyYXNlKCks
IHdoaWNoIHRha2UgeGFfbG9jayB3aXRoIGludGVycnVwdHMgZW5hYmxlZDoNCj4gDQo+IGFsbG9j
X2d1Y19pZCgpDQo+ICAgeGFfaW5zZXJ0KCZndWMtPnN1Ym1pc3Npb25fc3RhdGUuZXhlY19xdWV1
ZV9sb29rdXAsIC4uLikNCj4gICAgIHhhX2xvY2soLi4uKQ0KPiAgICAgPGhhcmRpcnE+DQo+ICAg
ICAgIHhlX2d1Y19pcnFfaGFuZGxlcigpDQo+ICAgICAgICAgLi4uDQo+ICAgICAgICAgICB2Zl9z
dGFydF9taWdyYXRpb25fcmVjb3ZlcnkoKQ0KPiAgICAgICAgICAgICB4ZV9ndWNfc3VibWl0X3dh
a2Vfc3RhdGVfd2FpdGVycygpDQo+ICAgICAgICAgICAgICAgeGFfbG9ja19pcnFzYXZlKGxvb2t1
cCwgZmxhZ3MpICA8LS0gc3BpbnMgZm9yZXZlcg0KPiANCj4gSW5pdGlhbGl6aW5nIGV4ZWNfcXVl
dWVfbG9va3VwIHdpdGggeGFfaW5pdF9mbGFncyguLi4sIFhBX0ZMQUdTX0xPQ0tfSVJRKQ0KPiBh
bmQgdXNpbmcgdGhlIF9pcnEgdmFyaWFudHMgZm9yIHhhX2luc2VydCgpLCB4YV9zdG9yZSgpLCBh
bmQgeGFfZXJhc2UoKQ0KPiB3b3VsZCBhdm9pZCB0aGlzIGxvY2sgaW52ZXJzaW9uLg0KPiANCj4g
LS0gDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MTExOTE3NDYyMS4xMzExMTU0LTEtZGFuaWVsLmNoYXJsZXNAaW50ZWwuY29tP3BhcnQ9
Mg0KPiANCg==
