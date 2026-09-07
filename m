Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A52D592D
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809452; cv=fail; b=HdSv7aATZyOd4r6YAKhyjXTWdPLlcxirIy8e71q+MxY9SccOpWqGPLCJNE+U6kUUonG9+z7aYykBU55NXX/+YVlOhsQDx24tyMKU8mHTHgdHFO9zBi697rIIhcQ+9VVgH9bJbJ0dluFJXslrpkFjJ2c0C3hef401xYnydl7u3ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809452; c=relaxed/simple;
	bh=eLmGpvnVegcMz1uO5flaOZtTqC7pb3ymVdxy+8e303s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KdwxyUr6z5WGfSc2/rNEqCW8+pHsCxjZh4kU6XCdIMMqku2MsBvfMHSMO1zKmtrwtmfQScHArQM6XKdNSYYe/1Nbmtc2GvHv5RBAUTj3FWHKYPk6cXQk9Q219b9oHxN5+Ft+1LZY1giFfaF5tKWNUNXliK9IAx5oqyFtBIXAFA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5xcXSTH; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5xcXSTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788809451; x=1820345451;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eLmGpvnVegcMz1uO5flaOZtTqC7pb3ymVdxy+8e303s=;
  b=D5xcXSTHrC8+8kh9/fq3PizGofIZ4NvM37GvVuWFtG0Sn6ZskNYBmTlh
   8JKhrmRnibtjUbdpFTL8l8gWIlr+xVSpOiVDpPbBsQ+yqGsKGe7nmBJEJ
   Haoy4SutX80+YFtDySxrVDOGFCfWmOa8uhTQi7MosO3xgg+KWmV6QkWqg
   ve4+SeJu7O4undBnvLFZ30D/u38bwL51RtE2Xnn9xQyaDsdRLO+Jg8SEK
   mYQZFsi6Xes+MdTxmGKdRkZJfue9QEaaC7nLEuozfpisdk9ISIYOoVJ5x
   9Cz7f0MUf2MSclGWpbAfgFwFKsiYwCA++0YQZVj/LBf8vXyuO936DZmzW
   g==;
X-CSE-ConnectionGUID: qtIxYXS0SNOqKBIM4wxMgw==
X-CSE-MsgGUID: 5HSOI8J7TASfAJbjIEN5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106580775"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="106580775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:30:50 -0700
X-CSE-ConnectionGUID: zQGgESWJQJmP1bMzqISJ6g==
X-CSE-MsgGUID: uZMBItv6Ty2be0KAbk2pAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="274578495"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:30:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:30:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:30:49 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4zN76++VU/YITmYfZCrepr0yMqEIqsTzr1QJHEgEZMdHyygr+SEHijbIvhINtnIPsSie9xrBf9a3KAtbHmaEhsZd7hLWukkoXB7jsuhA7njAYWGL7X/V8l4gNkwyyPnY/xBw707HHe0nklQXNJDCPNuOigKvmOSelQDI21f39b2G2bx9nGSkqGx6xL9ByP5IAHj1QC718v253Fj3RyMYlSMQwpFYdxmupRyHb8zUeno5olMP+C+xpJY5MaxCjb3adJU40iEGwZfYsG4mMOXkB+/hwzEFnDzxIQPb8njI63BFesgHVQH7Zje3n5dZIXK5nZcpIGs+pLZLaULUysJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e99gyT3IfnlSEawBljAuG7rlTbfb9Z6ClTbFvLAcS5w=;
 b=p5ZvkxtzZBaRzOWpPdlLkVpwgipR2r305El+kaBfHWhMSp3p5Y8hJXeBbainmaPQWBYACCPi6fINGbEyvYFNIyr7AJrhMPVtr60LpcnoyMkYJeaGADcbdsUGPzQBmRwVCAl+2GAyQ7wvNncsLs/CTnilbDzKKLWwV70Bd3u8FJJhfIsu49YidJJUIgdibmBKsA4OrGC9O1D5+NYViqPIF4fMwbhOb7yOkTzYnKEp3h00CLhKjQU3pVDZlw0mJsairsSwT29knVhqJhIQZOxWdpctuXJzGL2g/lYB2tPSBo6tC9Hdg6f/H2wGBMgaXnkqjl6ZASHGcIofmn9xx2DwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:30:46 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:30:39 +0000
Message-ID: <546154dd-66e2-4c7e-9a0d-59c56f07b85c@intel.com>
Date: Mon, 7 Sep 2026 21:30:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe: Keep reference to device descriptor
To: Gustavo Sousa <gustavo.sousa@intel.com>, <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-3-michal.wajdeczko@intel.com>
 <20260904171419.E21DF1F00A3D@smtp.kernel.org> <874ig3956l.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <874ig3956l.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0289.eurprd07.prod.outlook.com
 (2603:10a6:800:130::17) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: f9209e25-ba76-470f-9af5-08df0d167fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|3023799007|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 5EvVK0ebj4GQ6yRISNbzRiTcRuQm+ZHMJ4zp/heVG/her/zO4gikGa3JLCRpLtii+F54sA+Iaq+Q5bXUraTwN2iE4C2IMQ7/XIwzL1dQ3E4rkODT+IyEFkWxjv08n8+SE8WayikquUN6V4fqmQD8zy0LMea10rpFQCBUsIAVc2cEJVcmGh0pqsl9W2snAxJrc3xrVZcJnzyZzcTT6eN7IrAIojtW+Y5GO0nfWEqGrPEgs4/uACYwbiwope+hkNuayHOFVsD/pVv8dOPGc+cs1h6irU5qW5MsuVZThfJXho3hR5ztE6gALliUQDo2vrtVsiHKNmtGz1cgeGCrezLL1VQThqOxuTxKJlMTqgeO7L7AAsSwzQU6jbO1F70VYgJ2a6as+4F41Vut8obvRH98TjaU0yXk4R8HEHUO6+kULHT0994eSsjLXs+A51V1ne3MN4uq3fm76xv87o+jJ8Mk+CIto25RAdJWKQo+x6pNPs+52Z0S9p4yNqcwYVl/4r4VNfJf0/yppEML/O8RfP6wzSt9kQ3Wo5aulr5Wl4i3zEKbcRoIbTKMvxkNcyaXgc1oqUFoGtTVMcdLU+UuTTr4hqJyJvG4pYYjH3gjAZfLeaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7551.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enRlMVRDa2JpSXg2VFhReWszMWlnZVZrYTBlMkIzUVVlNEF3cWl4M0J3S1JE?=
 =?utf-8?B?aDN5VFRSMERXVlFvOEpldkIzeHkvSzUyYzVzMHlsQkQvYnY4bWNHVEFkNTYy?=
 =?utf-8?B?ZGFYYkRmaU9EcTJpRVplUUc0VUZ6YlFtKzgxZ1NYcXl3d1NTM2dkZ1BDNWts?=
 =?utf-8?B?dDFBVnh3WTh2enJ5bWJWTEdJWmk4dFJISnZzbzE2UUE3L2lqa3ZWWGs1cXBl?=
 =?utf-8?B?Tm83aW5ld0FCNWJ0MWRkUy9kcjBzMjV0b0Q2OGxaRkpBOXdLeU5JU2doR2R0?=
 =?utf-8?B?b3dyTkxMVnRLVmhocEMwMGRIa3lOSjZxdHhpcFFHZHkxak1PQm0reEVodmVV?=
 =?utf-8?B?eXZyZzVBclduZzJZQktBNGhFak5KYTU0TzZpTVc1NXFjbmlSM050V3ZETnNN?=
 =?utf-8?B?TS93RHlZNFpQYTRQNVV2NGlxWU9SZTZoRTVLRzVRWU5uM3BwR2FHU0NERjJQ?=
 =?utf-8?B?aGNtZ2JnS1ZvL1JQc0pLMzJzQkw2TnJvaGJnSHRiZEtKZUkreWs3dnJVWjRL?=
 =?utf-8?B?R0RFeDNVRVlzTTJUMGxteWk4cVh4NnBTeENZcXdjYnpjU2o5OFIrMk1wS0p3?=
 =?utf-8?B?clh2alJUd1FGa1lsV255UkxwSnp4Vi8vTlJqZ0NlVzZWOHUyczZ6Sld1Rnd1?=
 =?utf-8?B?aVhGQWdxVkQ3dzhCNnpsckY0b2NPT1VIQjF5Q3VuTmU0Mk9pdmptNXgwOEVK?=
 =?utf-8?B?RjUvTzJCR0h3YjVFT3pVcTNlUno1WFZGbUhRTHkrSW5xMU05MjdqWkFGemNM?=
 =?utf-8?B?VE1sdGFZc1p4U01UYWY0Mi9zblM1WWp4ZHluOFVnSUhNdytaSytvbDdyOTY2?=
 =?utf-8?B?b25MeHNJZjlxRkhpd3RZY0tQLzFvZUl0VVp2am1GOG9aWWlxMG91ZzdHWEI0?=
 =?utf-8?B?VzByR3N2NXNZTC9HRkpIRkxLaWR0SEpBWktVYnlSSTF1M0laMFBNVVFPYjhz?=
 =?utf-8?B?NkJVOVJ2dThRbzJWU1Mxekt1R1hoNFg5RzhVcWg4NkU4NnFDdnlzTGwyMVpG?=
 =?utf-8?B?Szk2bXRVN2c0UjhxWXorOGJKT3h2S2JKakI5UGlLQ1BtdmJVTGd5YjByQWx2?=
 =?utf-8?B?cXJ3Tm5tdUhrdnAzZnh1eWtrQmZXckRQUytJRWFQelpGaVdsLy9MaEl2Y3kw?=
 =?utf-8?B?eXZhZzJvNStZY3Z1WUxpd3ArQkk2c2xPSXdURVlOWDZ1OFI5bGVUUHBFdjhH?=
 =?utf-8?B?QlpYVXNlV2MySmxZUVVQeG5mWklLVjVCU0xsZ2VKVDRjcWY5MXNSV2RZQmli?=
 =?utf-8?B?MjRRbFIvc25TU3dMa01xaERBY0o1VzJkc3o3cnBuczgzL20waGRpcXpjNUZx?=
 =?utf-8?B?aDRlKzBMU0tob3FqVkkvalJGcTEvUTU2aHphUnU1Vy9GUXh1ckx0YUFFd2Y0?=
 =?utf-8?B?MStPR0JNLzBjdkdDejVWeG8vNGdEb1M3bGNwTVBtRFZ5dnptczBPTHBvU3B6?=
 =?utf-8?B?eXlieGFydFNRVlprNklLSGZVRm9IQVVmQmRBbFZ1eFNUNjNZMjB0b3VOL2Vu?=
 =?utf-8?B?Rzd0N0RpN3pWT3RKVTFLcXAzcnVIYkJSUnA2Sy9kcFgzKzNEelIwRVNoOWM5?=
 =?utf-8?B?UGF5MlNrTU1LY3F4TnBUQlloYjlwVlhvZDRpWDhFeFZvWHFMN0dhRTNjYjE1?=
 =?utf-8?B?b3BVdk5BTENWRjJ3WDlSV29aeEFGbGloaUs4RlBqdVV0NC9zMVpRWXlkeSsx?=
 =?utf-8?B?b2o0WklKbHp5Rm5NUHM4Rit4cGFjMUtHQUtTSzZ0aFVHVnB2eDF6VmJWa0N4?=
 =?utf-8?B?dmp0eko2OUtOQldGcCtLS2lGNHFveXZKdGdCVk5iN2loS05yNHRGNXprbVR4?=
 =?utf-8?B?b0RwbStBb3YzR3BGM2dhanNWZHBPZE5zUnMrUTdwSWtOTUcybVNNTERGUkk2?=
 =?utf-8?B?U3BQTE5jcEtBUVpCa3lVL1N4amxqSHpUem4yUGdMVFpWL0Z1UjdoVUVvWnZM?=
 =?utf-8?B?WDJSSFNra3NnbUp5Mk9XQ3hyRnZLRWJ3STNBK3R4WVZTbGh3YlJRdDc5Nm1n?=
 =?utf-8?B?V2luZ3ljd2xNMVRCTGRxQWxycXJwUVlFbk00VjVGK0xPaEFRZTI2empjcGRD?=
 =?utf-8?B?dkRiL09vUnZGYXlRdzRKUVNIdFdUemNiVTdERkV6VzQ0a0xLRDdFOXB0WVBn?=
 =?utf-8?B?YkJtUjlDa3hPNitKTThHYkl6T2lXZDh5YWtVSzdNODNtUWo1L09MTzlETk9a?=
 =?utf-8?B?MmJDWi9LczV2S3VGL1c4MHJNNURQU01BRC82bWc5UnZqdDJXUVh6TnBZNnAy?=
 =?utf-8?B?N1BBSTg2Qmo3bXJzVHo0dFVpSHZ1czgvSlJNV3k3RlAycHgrdXlLdEg4ZEl6?=
 =?utf-8?B?T2dYSEs3U0tUdldYT2RwWENhcHJZTlczcHU2dTl6enNseWE2ajA5TWxPL2V1?=
 =?utf-8?Q?stVV5EkN5DqVN3+c=3D?=
X-Exchange-RoutingPolicyChecked: 3Fx5Dm4kqFATUaPYVBDZ4U3OLR2ty/V3llGJpWSHxjM/TJI7/6hY4N8yI72wl6ADdFb3PzajylsMSKzLbbo/yiucfJczfR1ptljIdBkWHS8fSEMyHzDsQBLfSSYrvfa5VJwNLFOyc+Azw37QZ1Pf5wqLVeFDpN1HYZ1iGDalLII/86rEFq0cPNDY/j0Fu8L3PGbdTUqgC3SyB0tDeKrLHTTUACbUR8Jg0U/LlkCU5S6y5+kOPck2Lyvt6xzPDy1ZP9n0NZfJj4jG1ubo2ojXEOok9Da62Z/WeA2w/RDHpGyHZHEmCLBhUbEijdp2aeQNp/orH62qvctITSazakllxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9209e25-ba76-470f-9af5-08df0d167fb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:30:39.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR96JfhVnqR1C1x1xHV+djzuyXoV4/hmuKSNdHEp/kxZqU0M1M6x5DhXgx8D9wQgMooffFN7OVI+avbidcv7S6z20enVPEzBxK5w9zv9eGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com



On 9/5/2026 3:52 PM, Gustavo Sousa wrote:
> sashiko-bot@kernel.org writes:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] In test initialization, `xe->subplatform_desc` is incorrectly assigned a pointer to a sentinel element instead of `NULL` when no subplatform is matched.
>> --
>>
>> commit 2fbc7ea3deaa915eef829a4c64ec08fac1f4a8a9
>> Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> drm/xe: Keep reference to device descriptor
>>
>> This patch stores a reference to the whole device descriptor and the
>> matched subplatform descriptor within the xe_device structure. This
>> change enables access to additional non-mutable device parameters.
>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> index 4965a01f6ba52..48d5ee478fe69 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> @@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>>  		return -ENODEV;
>>>  
>>>  done:
>>> +	xe->desc = desc;
>>> +	xe->subplatform_desc = subplatform_desc;
>>
>> [Severity: Medium]
>> Will this assign a pointer to a sentinel element instead of NULL when no
>> subplatform is matched?
>>
>> In xe_pci_fake_device_init(), the search loop terminates when it reaches the
>> sentinel element:
>>
>> 	for (subplatform_desc = desc->subplatforms;
>> 	     subplatform_desc && subplatform_desc->subplatform;
>> 	     subplatform_desc++)
>> 		if (subplatform_desc->subplatform == data->subplatform)
>> 			break;
>>
>> If data->subplatform is XE_SUBPLATFORM_NONE, the loop exits with
>> subplatform_desc pointing to the sentinel element of desc->subplatforms, not
>> NULL. The subsequent check (!subplatform_desc) evaluates to false.
>>
>> By directly assigning this value to xe->subplatform_desc, the test mock
>> environment now gets a non-NULL pointer (the sentinel) for devices without a
>> subplatform. Could this create a state inconsistency with production code,
>> causing tests checking if (xe->subplatform_desc) to falsely evaluate to
>> true?
> 
> Sashiko seems to be right here. I think we could initialize
> subplatform_desc to NULL and assign the one from the loop if we find a
> match.

for the record: IMO this should be tagged as a pre-existing issue, as even
without storing a xe->subplatform_desc, tests code already could pass sentinel
instead of NULL to the xe_info_init_early() which could in the future make
some decisions based on non-null descriptor

anyway, fix is done in separate series [2], which shall be merged before this

[2] https://patchwork.freedesktop.org/series/173450/ 

> 
> --
> Gustavo Sousa
> 
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260904170531.516-1-michal.wajdeczko@intel.com?part=2

