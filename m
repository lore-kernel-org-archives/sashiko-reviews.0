Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125EC492E33
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991729; cv=fail; b=oUsQVQKvzLrYL9c68D/mUTzqgE3uyVrdbl8sYW/nZ+l76gjFeAM4MdIGxK8d8BF2bb6gLtVMPNZn35gsaFYJIKzbDhr4Yh8NRMo7woT5qYoLLuSASnFztQLMaQCYX1QD91XKFYMwWSCuNUWtkRx7q3vbmUT7Zv1NdGQ5Toow0XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991729; c=relaxed/simple;
	bh=d7Yzg7QqWt7IQ6bOB03Gveo0ViFcEArRNxR9zlhLIgE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=odpJ9UNqGhPO1QzQULnotcpVRE5TlFe/pP1wctAz0HQjReztmh/gInwnWGoKvujs2sviarbWfAomthp0w9rIhelz5YR/w5bRilnctFsDfYxvFXkzHmqTySTxIl1yQ7jYlO0xPQjzZJfXAPEScPN4vnS7jw+PTwCdwbBpMj5ykig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dmr0Yohq; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dmr0Yohq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789991727; x=1821527727;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d7Yzg7QqWt7IQ6bOB03Gveo0ViFcEArRNxR9zlhLIgE=;
  b=Dmr0Yohq66Q2YWYgGbmVgzYqv17Kzc8DybhJb5MSi/F1mXAoLUtxI7LT
   BFXwim4vvW4GZ5unyL9KqHO9MALA/dmhydqP2frsvLMfM7CaHMEjmolPa
   miZnDtyDCnvJvAA7TN5oiw50kR5jB4dXXIGdCWMWa0RxywSw3gv17o5EQ
   cEgJ+wyRTkSoFAeH4S4V6J9VtpnkqRMLTE4lyNkAcbBTXx85zL/HIfFvC
   yvfXZRwAFicJOFpEqaXRBePdOmr72KwfXpg8cYJ3LcLDLYwa9f4qU/k6O
   FKzhZd7e5v0jd7ouIH/MWPbubHSYrFhDn0pjwCvJcLTdHhT6AOT43BaxZ
   g==;
X-CSE-ConnectionGUID: tnfQyj44T4mafJMKD0tzRA==
X-CSE-MsgGUID: meSDyYsHTm68h1iYk8JUwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1001853"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1001853"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:55:27 -0700
X-CSE-ConnectionGUID: skLiK0R2Td6bLm92RasJMQ==
X-CSE-MsgGUID: fL1llZJgSAG8HoOavFX1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3618019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:55:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 04:55:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 04:55:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 04:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugSSryEbWNVIenQoFlPxm7azmJtGIQ6JybF626/1kGkR2N0LC0TOjG0ZjEaZZRFY4niYFhM3/KHVzpVbdwgP6gfhJTAjAi3EoDTg0A4eFh5oulj+pVi+eBAAD5rLEPDEXgSwJj2oRn5MaB7FATdJOd8dO+PG6wHixQ/it+ul1KYfHxu3QrzhSSRFYgIeE1L/eDyKAFZICdTro4LbDW5tM9QPIoNi6dXmC6ns/UbTIhjMtCr6kpYA5AMC4m269eCNiqcKaQ2qUHv/Jj95zjFo803UqEKebTrnVo9lYxEesLij0poFDFl56ZSj7EoyQ7yCrwDvY31zFacYKCpUG5WtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60Gzrxe4W7gJ/AoTPmZpDSIFoHLsWgPgAAFEl6mnlbs=;
 b=FkWefT8IarndtvwmMt4f7UzbHkEX7rn/gh4JydgisB5ocMdd8ECl4GQn1c35hNr4jSp5VCk36sPN4n1G+Z4uGSKPBQjgtSEHeF67UlJfKHA5Fvibr2gvgy94c8vqWX9nn5nsEMcWGj6A1I0qtXhImW+8XemrisDwa1ZYTovkLgWP+NYT9ye5PTt1l6oIzZ5jTGBJI2otgUzKrDjrly7XnEpcdYGstjrLmxd/+UsQAJH4FktJdJV+QTBIF+zzmKxYj8tRM5JGfevNwak8+31AlHDMUCgLD0uqudohk90Joks4GO+M8j6tpvwgSfmf06dgzt00Fo0oshB0N3xll51IFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB080898.namprd11.prod.outlook.com
 (2603:10b6:610:34a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 11:55:23 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 11:55:23 +0000
Message-ID: <26d2fb30-3188-4736-8755-1d6b52e6baf4@intel.com>
Date: Mon, 21 Sep 2026 17:25:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/24] drm/xe: Update GuC submission backend to run PT
 jobs
To: <sashiko-reviews@lists.linux.dev>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-11-matthew.brost@intel.com>
 <20260904213927.4860F1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904213927.4860F1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB080898:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cb20f4-d57f-4b36-70f1-08df17d7379e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 4llhVDlcAvxintNwTnU09Fs9ENp5HaAF+ZFUi9g9dLSX+DZtOgs9OObpwXU3QTLJYhkLZ6sqD0WhK4NYXeQMQuMMmY7YkC11O1TXeNu0ptndOeRVnWlwHqi5M8YnMS+owf/vr/v+88NvrTpKKDRzj7VYWRi1k7Mq+vxhyqeQq7Rn/MVMKKXQU/sAW5EeJbiZEd+Tc8wGc+SP13Oon0doC4XMTwe9HLzRbru0x/xABM3fzhKfXQ1LqCF1J3fKlLRatoVjMGoTTSljdqrxcMVC5RGt151V8csejYcWYDIWviHOzCZIB2inp8k/wo817IScUKihfkGW44cjtOJBhEunCqy5mk+8g1/Vjx0S4KdF90QW+3hOFW2GG1JJXfVSnVOCmN/e6DhW5dXnmDMbJ2hp7xCYfQ4Obo4KQ4WCcyHyp83kWaG4Iu4eif2hMJVjaWFyN7Wf1fnbLiJFV5zqYYA8n8UKZrseWt2uLrCa5TF7FnqOPgTij+fktwbwe/89fngg4Gp+1kkgvN3XgYPEAGMRBaJ64u/3ovHj7C1prr3UleFPzstTctMkgzASUzm+FHbraeUJ6Bdhzqk9Id/DFoprHy+5S1jDxugefp/Q3nx8aQMbu/KM+UTtQs3a6YOadl4f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF691668CDD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZDanV4Wlp5VlAvVUdLK2hVS01DaTdCcmM3Y0tGR0N0SGhzTS96aXQxZTV2?=
 =?utf-8?B?T1VXZHk4VHMvUFplSFRrNC9ieDQ0ODNQWDlDUG13elUxS1pUWkhkelRvKy81?=
 =?utf-8?B?RXcrYm8zOXZvMWl5bVp1Y2o3aHlmLzdtU1poSGN6NlpiQXFtZldtZ2R3UTNn?=
 =?utf-8?B?cmpWU3RYaVI0M25tR1J6T0RKWktxeHV5WGx2VXFES2lCdWVFcElFUUp6RTgx?=
 =?utf-8?B?M21ja3pKeFQ3dnh5WUlQR3NtSTkxOE5CcC9NSG0wd2d3ZXJsWWs2aXBHTnBx?=
 =?utf-8?B?R2pNTjRyU2JBdmQ0VVorcjdyUkM3bHcrNXBOd1VteVdTaFdEeUJFYVpJdjV5?=
 =?utf-8?B?dkJRQTY1cndVbi9aM2pZckhQMUxwcTBiajg3cnpZL0ZpMzZFZk9nVXFpRmxE?=
 =?utf-8?B?aTdFMHo4NHBvVU8wNjJ3L0ExSitBWldyb3RQdVhRMXZXamRQRGt5RWx4WnZT?=
 =?utf-8?B?WnVTaTZhWTdPbmJzZHFjZno5WjJVMUdNMDJQcm1XdEEzd0VWOFhlYlduZzlv?=
 =?utf-8?B?UENETFlMWnpsYUM2ZWZkS1FUajZrcUlNMFdkRW16R1VpL29yUVZ4cm9aaVNY?=
 =?utf-8?B?YXNXeXNmL3dxZUpIclVEd0FEekwzMFdYN0dydlM1MmR6RzduZzFONGwyNWhG?=
 =?utf-8?B?VVo0Vmt6ZDBmN0xWM3lQODlza2hsWng2ZlFmNUJuVXQzZWhCaGIyMjdYM1ZI?=
 =?utf-8?B?dWpNaHJTOWc2V2dMMVl2aWVhdFYzMUxKWjhSd2NlbTZxNWRiL01KNWJ0MFI3?=
 =?utf-8?B?ZmNzWnB0VUJhNE9OTXdFMml1TVViR0tRY0Jwd1VzSHpudGN2bHdKOElmZTZZ?=
 =?utf-8?B?Z1cxMHlCSlpIRGVna05wNnhYeERpQWc0SWZxa1AzRDRQbHhrc0U1TWhFRFFy?=
 =?utf-8?B?aiszeUZBbnY4UE01Z2VvSHdrb2ltRDQ1Sml5WnRTS1N2VTFwdloyejE0V2Vt?=
 =?utf-8?B?REtNR2tCQTB1aUN4MGxraTJ5c0R2amJlRGY0M2xaMTBjYmJiaTNNOHRsME5u?=
 =?utf-8?B?V0ZtWHNJY1NzeWphbkFKeDFBNnp3bnVHVjNCZTRsenFENVY1ZlMveWRicFZh?=
 =?utf-8?B?T2U0WVlvaG1uakthK1FsUmkyc29LVzI0WVUrL2JBZ2Uvd2dFV0IxS0tjRDdt?=
 =?utf-8?B?dHZMSjFFcUh4eWhIK3pVL1M0YjR0SXdXNkt6Ti85MUVEd0pOTGFOd3RKSnFQ?=
 =?utf-8?B?d1k1RFA5ejV2elczSmVoQmNHS1FMMEM0MGtwSjZZL2pHaFRteG9KTzY5K2tw?=
 =?utf-8?B?L3RTTHBVU08yYTBsb0V3dy83ZUo5OUdEbjZvTzg5RTd2UCtXczFGYjhoQlNV?=
 =?utf-8?B?Z3pDTnVJSnNOQzVCVjNHS3hsOFA5VUx1bUNHYVdxZDhsQmx6NE1aSnhibDIw?=
 =?utf-8?B?RTJhLzdFeFdkckVwQ2pWcm9WNk04Z3A1NXUzYWRPZDA0dUxsNHlmSTMwUnpT?=
 =?utf-8?B?Q3ZKNmRTWDdmQVdHZUhWVjVhcjFqQysvSnVUOE5Gc1FMMkhBWG13di8yN1I0?=
 =?utf-8?B?ZnEwVWxJd1YzYmNCVU01cnc4MDhHcko1R2JIT1lKZEx4NFpzT3hnT0FFdk9k?=
 =?utf-8?B?a29CQ0pURU00Z1dxMjd6S3FRa1NsNDJpdEd6RGtwUWxRdkgyaytpSzBwUDVx?=
 =?utf-8?B?SW1UbGMxRlZwcDBQeVE1UmNFN041Y2ZvYWhjSjQvVVZkbjJRWWVybVFqTFdk?=
 =?utf-8?B?OTBLYlh3bjZjWUxrdU9VY1RnSTMxYkdUYUo4UDlEYlhMTi95UTB6a2ViY3dK?=
 =?utf-8?B?b0o4OTdDSXl2cWVLUHNlSW5Qa2hvUVdtZjc4VkYrUkR6QitrUzc4WUlqUE5F?=
 =?utf-8?B?eXZ0V1RuRXBIZS9SOTJOMHdUSDRWOS9Qa29yYWdsclNKeVpOeFpxd0tpM3E1?=
 =?utf-8?B?aVNndUpjR0lhaTJkS2N2OHRHQk40UCtEK2VRODdsVnRNSDE1SCtrWWpsMEtU?=
 =?utf-8?B?Q3pwaDh3Mi90OFZwRkFhQzFEMUs2b2VMZnZoWm9VRTc2bnRRdVlxcHB0cGU0?=
 =?utf-8?B?L0hZZWRjWldQU1J3cXZQbHRRMUxTTy9qVUhkNm5MN1N6TU8xSVQ2dnl5Y3Yy?=
 =?utf-8?B?OW43cjFCUzBsWGtpK3BWV28wVFcwS05xK2FvWGZ6Z1BHa1liY2MwaHkvMERV?=
 =?utf-8?B?dFhGZVVxMFlnd2xxRFVESEJGazNSbWRyeUFxMFBpMS9ySGU5TTk0dngrR0Fy?=
 =?utf-8?B?bjhQUmsrTFlVbmg1bENmSkUzdTlzR3MyZ000QzN6N0JQMzQ5R0xNVW5ZbW0z?=
 =?utf-8?B?Wk5TM3c3ekhnSnF0ell5dmxrRk5ad0lnOHYwUlZGRmV0Y3NYWXA3QTlSTkt5?=
 =?utf-8?B?NEpJTW93dEZOVk45N1BhWDJlSEx4VEg5RXlham5zOHdVWSsvdmFRZU9tRERh?=
 =?utf-8?Q?xPrP5PcDaKplfOOM=3D?=
X-Exchange-RoutingPolicyChecked: r6ABdjObLvn0Odx0rz7UD8Svjq7pXUzC/dZnHoTTQ2cx8wEe0bUzUyEtDGnzTcmGce9dCuLTQa7GSr38/q/QR2YlzOYyk1nA6Dbdu1TwWIGnLVTdkYm4eozEaoXWo7R2AaMiwAyik349rd2jLghZG03LB7+38hrwUwWTwHECj8XFs+j5gL163ABHXK9bw9qltx+M/KVBKDggOeGLfANXb1PEDXV9TESXQpsVkATalI5Dn/+HZlqjfArNItAl5KvXGFnHzias5xxyRIVOk0pJM4Q3/ZfKxpHLpvEMdpFq0cZE3BBvKKyBiM6gGrANWkfHh5U6yb+iER1ag7kAE5RQiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cb20f4-d57f-4b36-70f1-08df17d7379e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:55:23.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9aG08J/nOJlCR4l8WAHkSQPzdQcmH2Julv57UlQN/B/xikaSTGEieshXSSObVQqSM9aaIEFhRmffzXJlq1EJFpJUwTgwYysZ5+YwqI3FmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB080898
X-OriginatorOrg: intel.com



On 05-09-2026 03:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] PT jobs swallow dependency and cancellation errors, silently reporting false success and potentially leaving page tables in an inconsistent state.
> - [High] Memory leak of xe_pt_job_ops and a dma_fence reference when a PT job is canceled or destroyed without being executed.
> --
> 
> commit c6e167292efa7934a75cd29809e1057eae0d18c2
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Update GuC submission backend to run PT jobs
> 
> PT jobs bypass GPU execution for the final step of a bind job, using the
> CPU to program the required page tables. Teach the GuC submission backend
> how to execute these jobs.
> 
> Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel.com
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 8b8673f4e037c..b7ec96650405a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> [ ... ]
>> @@ -1262,14 +1278,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>   				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
>>   		}
>>   
>> -		if (!exec_queue_registered(q))
>> -			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>> -		if (!job->restore_replay)
>> -			q->ring_ops->emit_job(job);
>> -		submit_exec_queue(q, job);
>> +		if (is_pt_job(job)) {
>> +			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
>> +			run_pt_job(job);
>> +		} else {
>> +			if (!exec_queue_registered(q))
>> +				register_exec_queue(q, GUC_CONTEXT_NORMAL);
>> +			if (!job->restore_replay)
>> +				q->ring_ops->emit_job(job);
>> +			submit_exec_queue(q, job);
>> +		}
>>   		job->restore_replay = false;
>>   	}
>>   
>> +	if (is_pt_job(job)) {
>> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
>> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
>> +		return NULL;
>> +	}
> 
> [Severity: High]
> Does this code leak the xe_pt_job_ops array and dma_fence objects when a PT
> job is canceled before execution?
> 
> Because the cleanup operations (xe_pt_job_ops_put() and the extra
> dma_fence_put()) are tied to job execution here in guc_exec_queue_run_job(),
> they appear to be missed if the job is destroyed before running.
> 
> Looking at xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c:
> 
> void xe_sched_job_destroy(struct kref *ref)
> {
> 	...
> 	xe_sched_job_free_fences(job);
> 	dma_fence_put(job->fence);
> 	drm_sched_job_cleanup(&job->drm);
> 	job_free(job);
> 	...
> }
> 
> If a PT job is armed, it takes a reference to pt_job_ops and an extra
> reference to job->fence. If the queue is killed and the job aborted before it
> executes, xe_sched_job_destroy() misses the xe_pt_job_ops_put() call and
> only drops one dma_fence_put() reference.
> 
> Can an unprivileged user repeatedly submit PT jobs via bind ioctls and
> immediately destroy the queue before execution to trigger this?

Seems really a valid comment. better to handle xe_pt_job_ops_put and 
dma_fence_put in guc_exec_queue_free_job ?

> 
> [Severity: Critical]
> Does returning NULL unconditionally here swallow dependency and cancellation
> errors?

How about we return -ECANCELLED for banned jobs here  in 
guc_exec_queue_run_job?


> 
> If a queue is banned, guc_exec_queue_run_job() skips run_pt_job() but still
> returns NULL here, which the DRM scheduler treats as a synchronous success.
> 
> Additionally, PT jobs are initialized with a stub fence:
> 
> struct xe_sched_job *xe_sched_job_create(...)
> {
> 	...
> 	if (!batch_addr) {
> 		job->fence = dma_fence_get_stub();
> 		job->is_pt_job = true;
> 	}
> 	...
> }
> 
> Since a stub fence is permanently signaled with error = 0,
> xe_sched_job_set_error() fails to set any error state, and
> xe_sched_job_is_error() evaluates to false.
> 
> Can this result in page table updates silently failing while reporting success
> to userspace? For unbind operations, this could leave memory mapped in the
> GPU after it is freed, potentially allowing read or write access to reallocated
> memory from another queue in the same VM.
> 
>>   
>>   run_job_out:
>>   
>>   	return job->fence;
> 

