Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1B38836C
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532089; cv=fail; b=i5I1LP7EOUu7JQgqikmuwNZhwlB8kMaTMd6yvBDmY0KUJK01AkLdKpkiW0YNWfslQamgMmSupFRV0r7E3x3uYEjQr756JHIWqwg59q5cvqplig+/rpVhYWeRjZgdyFSbr+wNcFEufs2qFuEE6I3cS4ErPF8nHhJnl3NKsZYfzJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532089; c=relaxed/simple;
	bh=l108xTulCPYWM8vjWAOLXEDbbx77NpUlIcTq8XgWAbI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nUVLVl6mvYHkzGlahvL0XwvhtHULTSGbS62za8KuEMBEfAQEyc84wCpGpaewZ3auHjf5VOEpli088XSNKNS4XfBxnFMdXi0E8biBFajUbib4pq3uVLAgOSIDI4mkocVDAZF8WtsMICGdQsGxwPJEPN2lKIShrCUyZZ5C1JZ+bZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDbgSdYm; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDbgSdYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791532087; x=1823068087;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l108xTulCPYWM8vjWAOLXEDbbx77NpUlIcTq8XgWAbI=;
  b=QDbgSdYmIneO1wK8jOI1jxrzMr/KJuYAEGbJqSv+gZMW9b1u/DVFDHL9
   vWJHgybEZugf9G+8GKSqIwaSJpBJi4FtvsD2cRL5tGgM0y3d3Ga43JQYP
   I+gYpfw0OiPqVaeivBSpbe+3SmmQkON1yPWt3TmnImOeLh0SGbU+yLmsq
   fVetXkFPfl0HYqGnt8/LM+4lcuf6LxE7lO1nq/UustabeU3+6C38+EUAV
   oD0BWu0NHB0SY9KGqw52RyW3XtkhC8RbavpOKBHG7GBu2m5OQ9Tu2Xvrg
   a786B8JCNAeP0n+lTFWyIDGrLttN4vSVkBovFuUO9FQIYQ1XgecbsgMY7
   g==;
X-CSE-ConnectionGUID: CB623fBvQ8qAhfUfuMWsig==
X-CSE-MsgGUID: 7T6Hd++VTYaTaTn7Bn+fjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="319179"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="319179"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:48:07 -0700
X-CSE-ConnectionGUID: kVjwl3sfSQ2kaqBhXMGydQ==
X-CSE-MsgGUID: tN4YJwTbRU+yoslsPvsCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="271539"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:48:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 00:48:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 00:48:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 00:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7Vz78vqIIEVOqSdThZBgTPWOb/g22rHyVe+hMN1+hFYuuVw4pQ/sVMCZ/LnRKti1IUt2dRYkbaUzNXCciCr2NMGzRjii9Y7r3C0swaNH7RJ/jdsJTtlQm5kl1Q4jAiOtQY18Su1DsvIBxG9BF1QrQ8BliWGzI7A39wvIA5urc4vnNqr1OAVksH9MasvPLOEDH6VNUU4WYb63G5mtRBJ/MUUtisqT/o98zPUn2HRv+mS7qKsDaae1E/JXOLWEPaNNdWk0DzqcK6oW6nto60LOOdUDvgJ1ZOnLnOm9CEvgk8mVUXCJByazHY6rZWz0+UtzVDX8eQOOmleDoefABGXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAhLyW4iUUCugl8kf191YK+ObMiMlCEEiaDptn81dxY=;
 b=EQ0/Q4KpReOAaE+RBG3dtgR3GFfSiHyqTyB2fuXH7crYy3x1XafRbtSQtS3Fe95/rWWY7LeKKY3kjAnEfqvQxzSnjKB02M1fnI5vRSfexaEwjHvX8IdyRvXSwNHVGKYbNZx2A9kkdOPgFNpgu+BMJ7fh2FJr4ed87abuPP5I89BwVZP4Jh38W4d4W4dkI2gEPuSYZ22qVEVBTiO6p4UwvWrlttU/2MSr4Z4Y9aM/RrRXad/bTYikFLq6NyJNuf1DMjiJRD60hC57Zu7vBGcQcCvPenBlgUvejQFLSr6pwNj/9E6eg3YcHgGh7kPHPEKprgGHg39mVIousC8AE7a68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SA3PR11MB489778.namprd11.prod.outlook.com (2603:10b6:806:58c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:48:04 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 07:48:04 +0000
Message-ID: <8f421ec2-1b4d-4142-9a77-6217c916cd27@intel.com>
Date: Fri, 9 Oct 2026 13:17:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009065748.1304076-2-varun.gupta@intel.com>
 <sashiko-outbox-164984@kernel.org>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <sashiko-outbox-164984@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SA3PR11MB489778:EE_
X-MS-Office365-Filtering-Correlation-Id: a62304b8-2599-46fd-ede9-08df25d9a664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|260925021911599003|260925022911599003|260925021311599003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: M4Y+GOqEHBfAj2xhLGWQqAbKPxHbLgiawGQDjbLBr9pmDOxuOkWnMNPSf8vWliGMF7BnTNK8G6JTwVD0S5QBSbMW2sZGI6WO6BpAr1GalQGmkntUg1SBGHj3vxworYDt/QTloOjn0Heo0V8QRgqsx4Z/rB634eFC/VfolPMg1ky1WzUcCFLMqplxE6bihkZegb9c/P4hyE4OdMpQAzA4UfJcOX934CgE9sXWtWpo0P8x/uygCTO+znSYFJuIGGGy9LEHPD50l5RdssU4etLC2ln+vYse08E0+Dfbjcq3YilkjKUvMKbf2+4afFC5C4v+2PoPrMPDsXbVLUfZ58EX78TuJFgqx4p8LmwewjGtSpehrn2niuTERG2Tcw4QIaYG8CBX+DOwtD4lCZPuVk0CgOIljFKPYKSvDULmj2SzsgCTtS0sE4ac+TyMfo7VCxMpOn0tQ1Fvd1UiaK4hT4vWNAU4JxFmF4X+m/qSpwHOXzrMRlvwZhM6F3WjIHGeeqxlHC4GoNoKdqyFLIOxm+lVZbwLtpdf2pydtxTyLfDPrBrPSDBEg4li/GmAjmai/HgPvnBwwMsAvHdwx+KbiQfQPanC0IBbdiFQmuNil7qxmyyQnSlqGGfunlu3x7m8tzMih2hO0WhAYwd3BNMwcb8nta+NuadMt10jclNXsYROPhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpHczcveWJKNlZhR2NnNzRMY3JUZzJZeEtEMG41MHJrOExaMHYzYU9iK0Rs?=
 =?utf-8?B?M0NSQWJKL0VmRlphQVkrMjcrVS9hdGJhNjhMV2xyK1FnaGd3N1IySGdUSTdr?=
 =?utf-8?B?emowUVY0YnVhSDZUdU5hSWJ4UkZORmhqZkdURUppdDd6QXhzL2tGZXVoejBH?=
 =?utf-8?B?UEwyUGN6QSttZHBkSW9GMk9nMXhtRUNFdG5sUkVoM1ZVcE1vUEtrU0xSQWlU?=
 =?utf-8?B?YkxkbUluUjBlSkx2OXNKOSthU0hkeGFGcFpzVjZqQmRXemovaUVINEtSV3h1?=
 =?utf-8?B?T1FNYnhPWGVvSVhxZThOdzA4VVhzQTVxWXNpdzRHRzkrMzhJSU1OQkNmc3Fq?=
 =?utf-8?B?YnFzeXRJSUQwakRnV2JjckRDcSt6U0JMUGJJa1BxYTlqU3RZTzBWNXBLV1o5?=
 =?utf-8?B?YUx1VDlFNTRITnBKNmh4WTdtSDdGdHVPZ0diZDBBSW1hT0dpeXV0Q3FJN0JT?=
 =?utf-8?B?aWpyVlQ2d3Zwd1luWGxJQzlRMjllVVFTZkNxc0JwTUhMY29TQjA3Ym1YTkFi?=
 =?utf-8?B?ZHVub3A4NFlhaFMwSGFoYlpSL0s1bXI2a0EvTHllWGk5M3ZkQUc0SS83Tysw?=
 =?utf-8?B?M1QvSjBzTDUwYXdEK3l6Z3BHK3ZuOEtPSUNOVHNmSTJOaHVxUmRlaUxQNW9D?=
 =?utf-8?B?UDBmcjhyaFV6ejlHWi9qRzMrSUlPeU5ybXJDRmRBUHBxMnZrbjBqb3J3MWxa?=
 =?utf-8?B?c3F6YUFBdGpCQVJRcjBnYkFoaTdVay9sd2RRbi82YWpuQnhUN1BSK0l1bXFO?=
 =?utf-8?B?YW9ZcmRsbDJhZThxSlBBQ2pvWlRrSWg5SWpFZnBvYTNySFg3c1dMdmdhV2xI?=
 =?utf-8?B?eUtCZDRxN0luR1F2RmpNODlac01nY09WY2NVRTQ0aGNVQ3E2aml2SmdqUnVJ?=
 =?utf-8?B?S1hjS3pGaGZwMVZOemdqMXhhSkpwTGVVdFpEYWNpT3U4K0I3T2lGSi9PTU9o?=
 =?utf-8?B?bzhucCtoQW1yNll3amdtQjlTUTJTemZMc2kwQ0EzcVhOWmpiTHo1enJSVHBt?=
 =?utf-8?B?cjJZRTBWVnBjTEdSL0w5Rlppc3g3S1YvNmdKS0x4SU9KQXBkYzZJNnZrUVRo?=
 =?utf-8?B?OFVhdlN4cnRLaHlDU0lqcnYrWWxrN3ljYWtjN25pL2ZpZFJ5aDZ0MVVKVDVT?=
 =?utf-8?B?amVoZXVrUzR0ZUhRR2RrdTBaNHF4bDg5Z2VIdXdJc3N6VXFuYzcvWHVUNGFQ?=
 =?utf-8?B?TW9MWFBqK01EMXBMdTZpU1plOWdYSmtCRjU5Rmd2c2dCbHA5Q29CdGYrZndR?=
 =?utf-8?B?RUZPMkU0NE1lSjg0SHNrc0N5cTlYSys1cGllbmduZ3lzeDlZQ3E5M2RWN1hS?=
 =?utf-8?B?L2xNMjVxTmlIZkFpNGJaMllHSTFwa1d0di9OVS83dmhydWpjdkIxbHpiSnVu?=
 =?utf-8?B?THMzYUx2TXhpUGdHNUtqcmFpN25KUEszM0RxZCtiS1EzZnlNMGZFY25Bc0hS?=
 =?utf-8?B?bVZ1cUd5aXhKR29jcGsxNFRLS2JMbEZ2dCtGODBhM01ZazJISld3cHdTenJZ?=
 =?utf-8?B?djlWUGpQbDhRZXA2eFBvT0x0U0pZV2Y3ZGNLMzYyb0QzdzkveUd3QlZSN3dR?=
 =?utf-8?B?Nk14MUhSWUJ4RngxNlhzTk5zZGFUdTVETk5jbDFiSW8xeGduZzByUnRGRHNq?=
 =?utf-8?B?ZlBlVE8zUlIvcEhyUnkvNjd4YzkyUTBkZDI5YnhVQUh1YlJnSVVLR1F0WjI0?=
 =?utf-8?B?YnR3K0F6c2FONk90bnNnbW1TVkp1Tm9vZGpVNVVhaWNVWVZ0Kzc4NVluUWlE?=
 =?utf-8?B?dEpIOWx1WVU2V3RoOUoycndhYU52WFZ1bFA4Z3VCSEhMdUIrbzNqQ0NpU1FD?=
 =?utf-8?B?NWFJV0pNOGdhTjhKMXRzREVjZWFrc0syaDZuL3lBMUJXeUZOR0hEUGM1V0F4?=
 =?utf-8?B?MTlGdTVhTDhhSGFBYVFzL1pwc2txYXIwNXRzM0cwSkNiYkRLbTBmbEltM3RD?=
 =?utf-8?B?R3dVVW82bE55VzYyMWY4OHg4YlJ5b2cwZUcxNy9CV216NTVNaXF3dUZlV1Y2?=
 =?utf-8?B?SE0rQ0hrT2N4ZDFLN2p4cGNpL1VlMzhlRXFjWmsxTlJHR0E0V2pqOWRORHox?=
 =?utf-8?B?LzVwSGlEUG5zNXRYMlZCeWl6MUdJTk1jZ1JETVErQkJYdXVxRmhXdGl4N3Z2?=
 =?utf-8?B?ZUd4bWljU1c0Wk8zZkQwRThXcFFKV0hXRHlMQWVWZ3ZqcDVWUHk5ZGwwZCtE?=
 =?utf-8?B?c3BHMnV1SVovdFpZenhERlA4RVl2aU9ZNHpZZnNnN0UxVllJSkdXOGtZZTE1?=
 =?utf-8?B?NkFERUdMalZjRkp6b0ZtNnRnMFE2RGZ1eTNEem9DZFBIRWY0VGFnNFFmVFJv?=
 =?utf-8?B?dDY3d0R6cVpRWVVYWWF1SUFpVWJJVlBZWEJUcDkrVi9KQjhweU51UT09?=
X-Exchange-RoutingPolicyChecked: jLnbChR+M+o/8Ai2qdvflrlrL9noDsoiJgDOhdnwLBZb2gZ3U5x7IomZuK1kR3HL2bC740EHNS5soklgh02nKiTmSgAg/glRQDxGJjhRGljleeNKvTCj92gLsvn0oixFGx1GDIR8M+gtG2eCLL8X8VdNqbCo4TFxIYGAX8WsACxlM1eUx7JMkHdXJmpmA4ofMK7FeCvAwoIv9ChC7sZRiEsWnnzQJ5AbHnhaJ0sfIsyR/6nOEvXsubCGQ83bIl5MD6k+q9QnL+1XdXLla+FrprSJ2QqKHfT3PnDDbdCLusTNrw1TrhN8HYQXmW/8JzrCCb0U/vSTUJRN7AvoBzo18Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a62304b8-2599-46fd-ede9-08df25d9a664
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:48:04.3307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDepVxzGs/LsFtGiR57fKaqwH6nZ4WZ+siCUH28dvGKriZGZNVDwEnjNZJxdgyFKrwpuKNvDdrMpg/VO4PlPGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB489778
X-OriginatorOrg: intel.com


On 09-Oct-26 12:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] drm: missing error return after drmm_add_action_or_reset() failure leads to leaked work and UAF
> - [High] xe: Use-after-free/MMIO fault due to deferred workqueue cancellation in drmm
> - [High] xe: nonfatal_msi_work accesses MMIO without waking device, causing suspended MMIO accesses
> - [High] drm/xe: UAF and uninitialized work_struct in csc_hw_error_work
> --
>
> commit c1e7bdf12138e40e4c7ecaaa2d05a9ee296aa085
> Author: Varun Gupta <varun.gupta@intel.com>
> Subject: drm/xe: Add wa_14028434957 to Graphics Version 35.11
>
> This patch bypasses a faulty AER path by intercepting uncorrectable
> non-fatal MSI errors and routing them to a deferred workqueue. The new
> workqueue reuses the GFSP error containment logic and wedges the device
> if a reset is required.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5f2abc9485ff5..847ca1ae411ef 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> [ ... ]
>> @@ -173,6 +177,27 @@ static void csc_hw_error_work(struct work_struct *work)
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>   
>> +static void nonfatal_msi_work(struct work_struct *work)
>> +{
>> +	struct xe_drm_ras *ras = container_of(work, typeof(*ras), nonfatal_msi_work);
>> +	struct xe_device *xe = container_of(ras, typeof(*xe), ras);
>> +	enum xe_ras_recovery_action action = xe_ras_process_errors(xe);
> [Severity: High]
> Does this workqueue execution need to resume the device first?
>
> Because this runs asynchronously in a worker thread, the runtime PM
> reference from the interrupt might already be released, allowing the device
> to auto-suspend to D3. The nested call to xe_sysctrl_send_command() uses
> guard(xe_pm_runtime_noresume)(xe), which blocks future suspends but does
> not wake a device that is already suspended. This means MMIO accesses
> to SYSCTRL_MB_CTRL might target suspended hardware.
>
> Other workers like xe_sysctrl_work() seem to use guard(xe_pm_runtime)(xe)
> to explicitly wake the device.
Noted, added PM guard in v2.
>> +
>> +	/*
>> +	 * TODO: Request an SBR instead of wedging, once VR driver
>> +	 * quiescing support is in place.
>> +	 */
>> +	if (action != XE_RAS_RECOVERY_ACTION_RECOVERED)
>> +		xe_device_declare_wedged(xe);
>> +}
>> +
>> +static void hw_error_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>> +	cancel_work_sync(&xe->ras.nonfatal_msi_work);
> [Severity: High]
> Should this function also cancel csc_hw_error_work?
>
> The code initializes csc_hw_error_work in xe_hw_error_init(), but it
> doesn't appear to be cancelled during teardown. With a fini function now
> added, leaving csc_hw_error_work uncancelled might allow it to run after
> the xe_device structures are freed.
>
> Also, it looks like csc_hw_error_work is only initialized for the root tile
> in xe_hw_error_init():
>
>      struct xe_tile *tile = xe_device_get_root_tile(xe);
>      ...
>      INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>
> If a non-root tile receives a hardware error and schedules this work, might
> it operate on an uninitialized work_struct?
This looks like a pre-existing thing out of scope for this patch, will 
spin another patch if required.
>> +}
>> +
> [ ... ]
>> @@ -436,6 +461,15 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   	 * here for those platforms.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> +		/*
>> +		 * Defer non-fatal MSI handling to process context because the GFSP
>> +		 * query can sleep.
>> +		 */
>> +		if (hw_err == HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434957)) {
>> +			schedule_work(&xe->ras.nonfatal_msi_work);
> [Severity: High]
> Could this work execute after the MMIO mappings have been unmapped?
>
> Since hw_error_fini() is registered as a drmm action, its execution is
> deferred until the last DRM reference is dropped (like when userspace
> closes the device file). However, devres actions unmap the device's MMIO
> mappings synchronously during PCI unbind.
>
> If this work is queued just before the IRQ is torn down and executes after
> the unbind finishes, the nested xe_ras_process_errors() could attempt to
> access unmapped MMIO regions via xe_sysctrl_send_command(), resulting in a
> fatal page fault.
Noted, made needed change in v2.
>> +			return;
>> +		}
>> +
>>   		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>>   		return;
>>   	}
>> @@ -546,6 +580,11 @@ void xe_hw_error_init(struct xe_device *xe)
>>   {
>>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>   
>> +	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
>> +
>> +	if (drmm_add_action_or_reset(&xe->drm, hw_error_fini, xe))
>> +		drm_err(&xe->drm, "Failed to register hw_error_fini\n");
> [Severity: High]
> Is a return statement missing here?
>
> If drmm_add_action_or_reset() fails, it logs an error but initialization
> continues. This means the driver can be fully initialized without
> hw_error_fini() being registered. If nonfatal_msi_work gets scheduled,
> it will never be cancelled on teardown, potentially leading to a
> use-after-free regression.

Thought about doing this in v1 itself but went against it to avoid 
changing return types of functions,
but looks like it is really needed to prevent UAF so implementing this 
in v2.

Thanks

>> +
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>   		return;
>>
