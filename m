Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748F30D401
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864260; cv=fail; b=kWyh96LMkUJMg9X+lSh3wWIKWu3kXEOQdR9ZzNrTsiA6k/KFfsI7aUmWhJ5TlUJNamNU5cpeHGcPLSdie7zhxcVXcvufZWPmSGfN/OdzgX4vI4QPhrAUcYgYVUY++aqPbzTS5x7rdREDgm15EJ5E4ntoppvLmicq6CESPrhY3mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864260; c=relaxed/simple;
	bh=22FmZeaBVndiyDkWWRunn8CMYWm0dpJUrO0q1Tggh3c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D8vYmpYGLlJ+vdXT0OOI5YD59sa16UIek711zyXzGbyLIcWkJDm25dBln1AOgf5udvktAoTgw7SVsea5tyr7baaai33+OoYI06mCtdUvm6J/LSsYdP/BFWOm3F3eSASX9ywouWNEabOxHMdQw107lfuNJuph5TvatH1+pDx0Gak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSKitwPX; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSKitwPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790864259; x=1822400259;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=22FmZeaBVndiyDkWWRunn8CMYWm0dpJUrO0q1Tggh3c=;
  b=PSKitwPXInnAGZRqyfFhOEzdUsSRi33u14H9XJEvdzmgPujrfjwb6Xb6
   h/Zl1NB1rjTiMUAXziZ0IT3/P4X3Hs6B5DP35devO4Fv3q4l4eyYBguiB
   1aAJOjNKO7v53U5pq+K5l+Thgcuqc8F1IV46n+K35IA9WlOy1hxfeWTXk
   zR2b93gCNd2YEwWN163vf/MD1a5kmT/devtlXkobTZMFpiaQgtKei3ZYl
   sCV8LoOn3qAwjIe/skkIZj1wiw9dWCYhs7fbV3/VYTCxCjuW4Z4l8oa8b
   npU5CFLVXukcD7vUa9Ze+LTVPtHLFi7EYhLNcGur+HsVk74gcf7oOzdeR
   Q==;
X-CSE-ConnectionGUID: 0bk6srHQQAaKjBUNYInjWg==
X-CSE-MsgGUID: B9EFxOGLQEiv3VAH3AxoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="100956161"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100956161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:17:38 -0700
X-CSE-ConnectionGUID: a3T4LUx3SQGTbYXTRrT0cQ==
X-CSE-MsgGUID: 4CRBmKxQQfiuEwfs4r9TlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274087253"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:17:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:17:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 07:17:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn8Snm4ioyHVzPCkYGVyKSBb5HaJSK8zOU4NkqHLi6GQ1m2dTS6nZDmB4iBNGMu2y9fX9MzGoKPxSw1alOAU6JPszyKIGYmK3k8o624kl0qApjpt2YfHYWJGW6Cs0fl0vppAP5FP9zlvw4Ni4F+BHXPMg9s18rfRNQEBerpo1srVpmrlO5GTtKtBOS/aHIDBW+vxZdOG5ZIgsOASnAUjiTkhARk+h66de6Wx4/4fWqVLAJi1u5sckvUWi4mYpeKS8S+Rvxbe8EITgS11fWFhZRInoQZvdtt0OEmjAfbKjloaDidDh9YjAAUHbZSWPLsPTuAGP5oQ+ViAGwUyqK+luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCKAlshmUL66Imh2bUp+4PWzRvvkq6uNZR3junHYBNU=;
 b=GW5P2xVxIIefNt6fr+IHbT6urYp/eQjUs65BMBKD4zMmck4EXow4Xkxj/kVBJTR1YDB4xrbvJPoBV+iLTbIqTmm6O3i1L2XLxA72eAsAPfESG3Zp264tm3sGxCKwAmB5GYVTkOyK53k2Ku/OsKLTPqbC+lqjTyc4bTaNy0KaAbcT7PE71huuaus/Vf7kmIOl21bPj7Zu2S2xH8bM7CHBxo8dylUwTkUm3h/XfTCEvUbzV2RcNbCPt9CC1w2qBuWtKrkB/0Drm1QN959wklQQUUWHboPb/NDiIncGGSBKu0PxqCJJZOY312W1+fUrE66437XLe937hYEWZZ4e19nAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Thu, 1 Oct 2026 14:17:35 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 14:17:35 +0000
Message-ID: <ee350beb-c940-46b7-811c-8f6d93698d32@intel.com>
Date: Thu, 1 Oct 2026 19:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/i2c: Expose AMC Alert reason sysfs
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
 <20261001120746.06F791F00898@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261001120746.06F791F00898@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f22290-8f23-4c90-9b1c-08df1fc6bd83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TEPgnBVT56QSXTr6Fjblq9KrRcXoDRIL3kO01XxG48zOiiwgVn10cytJm1/6vLf1fGIb4jGekrX//vOeNZinSElYXzNeeANGIjf0lBdfNhu0PuHxzNFcmUx4RAe1xnWQMjvKi31FeVRNUMOrsuUNJC23SiNBJ2yNP1qlO5RU5TCTNmgYuznZjXfblIiKx72zsT1scOgU4vIKpXXpNTjYezZU/BHCuPe7q0cYcvs2US5XbudMYUmUA0cv6Yi+EVK8mtFMo7gnBT22UD3Vqn8oIWhsrgcbmHegoEsDc8lAL3V2qmnQbg5q0dILH6HvndjPAsQlRoGCvYN+Nekv9FNjLHi3RHZH2PBdvRkAS57edkoqbekf0fuH3DlgQUC12Yal+DX8vfBnUN8hMvFLutsqZMl6go7YWALzQP4mKxSEhx0G3Lw6ppb/VRZ+DGzfKCr8YO1U7vmNrUBnuVdL1WZqlpHWJoiJv3EytYg/Ij76zYUqtF2EDBdTXn0E5DPs2aYa47YNBBcrngvVGt3dgGj75s3gK4AfB4E1vHHOn+XEtvlwf7HJ0RY+TZoJ/gYzTlX0u1oRydcwtrseqdfMlzkR3a02CVVvvfOBv+pc193jxJM3WLHJVodJgzrye7rEVdsLgz1yO0fweXB2VYtblnXBZqpkAZo0TZuOwf0RXCqmNqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTVVZUV0emptQVdpRHMwT09kOUJ6QUtQTUlzSEZ0cVg3Q08zaGQ3dE5yd0VQ?=
 =?utf-8?B?NXFnN0ovK0IxQkI5K0NqcEI1NmRzRWtvU2NPeTYxbUNjL3VTYzc3cVNiVVRY?=
 =?utf-8?B?MmY5WmM5TjNCZ1RHL0hadHIxUEZ6WExzNy82emZLOWpxT2Y4QVZ4MXJPK1F2?=
 =?utf-8?B?YU9nS3JEbHl3ZjllMUgvODdFb1pQSEcvZmxzQUE0OEkrWUtkTTRPaXo4MXli?=
 =?utf-8?B?YTM3VlloK1NucW1SZ3VsZVVBRXk2eUtjWE9yL0hsQS85bzQ3VkoxckxzcFNX?=
 =?utf-8?B?V0ZjWUlvVFYwYXJmSlNna0dRMzdvV3Z2Rlk2OFdsdXRaV1VhZ1gwMFBZMVFS?=
 =?utf-8?B?LzBUdmUrUXVtQ2RmYU9uZUdsVjQ3Y2V0aHEzZURwUjVOOFBCTjlqY3Rlc3lL?=
 =?utf-8?B?RDI5em5oOHZHdXArNy9XWVJCSXFRSzVUdFNFbHRlcEtPZGhUMGNNRkdaTXJs?=
 =?utf-8?B?eDZiZnZDamRqU1V5c2c3N3BISUNaTmx3UVlZemlOQldRWjRmNjN0VXVudnps?=
 =?utf-8?B?dUNhWm5HblkrRU4wK2twRVZSTXBZaFVRSUxKNzdOejhIelNBTUtzVWQyWHM1?=
 =?utf-8?B?OVBhMVJBMjkyRjZzSmJJOGJkNDVoOHloTkorY0kycFhYN25tRzFWUUxCd0FC?=
 =?utf-8?B?UHRTNVNKUzBrZWN1ZGV4MlVuRVFIQzVDbW5ITHhZckRvcmYvZy9LckcwRG9n?=
 =?utf-8?B?Wlp0dHQ4ZFRWM05VTmIvMmNjK3FCMGdmUUxhcUFzeUVCNURub0FVd2NpNkFC?=
 =?utf-8?B?QkMxZ0I2VXVrSHBtUmdLVCtYeUZCWm5PSUxJTFBPOCtCMkptd292dU1KSkJI?=
 =?utf-8?B?dmVId1M3N2YrUmE5ZmRVK2I3RGEvTGUzZlN4V3JQZVgxTFVmWnRLeXU2RzYw?=
 =?utf-8?B?d1ZpcmhVTkVhN3h3MU1ubmdDbHNubmU4cXNjVFNLMENPUzNEUDRpL1YwTDhz?=
 =?utf-8?B?TGhsd2YwQkNMeERzWW9RcGdyT1ZabkJMNmszNzkvNE1YeE5WZ2hucGhvVml1?=
 =?utf-8?B?OFNjd3dWdFh3eEpKeXhyejhMZU9QaGo5NHVjODhScTlCK2V3c05jL1lMWHds?=
 =?utf-8?B?UldNbXJwM3FhRWlublJ0OElwWkx3ZDFhejhKK2JPRGlEdTFyMWtQakxWdXBj?=
 =?utf-8?B?R05MTmFYN0F5R3ZFalNzTFFhQjJreFIveUZLQTVZNUdqd3VSeWhZNUhPRy9i?=
 =?utf-8?B?MlVMSVk5eGdWRm1SOTM4RDk2bFNqNUc5dnlxK1lqVkd2bFhEcWVPKysxeWRW?=
 =?utf-8?B?dGpFZStRN095Q050c3J5QlZlUWV0ZGNSNFRwdHZVMkdtRmNrM1hjMTVFcVo2?=
 =?utf-8?B?THp6RVZ2bzdxUWIwOC9DdGd0MS9SUHRYUEhqOXM2S1BhcGVRYjFyWGJvc3dm?=
 =?utf-8?B?ZmZHZStFeGZBNENsQTFKeVFlKzdmcGlKNU5obmFOZnNRc1RoWTlOSFhqYWRp?=
 =?utf-8?B?T1dHZXlDdzIxUTlPcmJ6aGtXVXdGcjNHeXVZRmQ1Y0FmK1gvWEh1Tk5SeWRn?=
 =?utf-8?B?WjF0dHl1OG80NE04SDVJS01GaU1STGJVVVQ3UnVpVWloV2lvbTVmQUdJcGNN?=
 =?utf-8?B?YmhuL2VFYWlJcU1PSHZGSDBsVktkbWphREUraWpHNzR6ZzQyV3lydHVrVzd0?=
 =?utf-8?B?QWpiUnNHZ1hQOG81R1FsSWlSSlpkUlJxTzVIUFYyaVFMZ1IreFNteFVxbGdK?=
 =?utf-8?B?bnlJdTViWUFaa2tPNDdIajF6WlU3S045RVFXNklMM3FMbDVZSkx5ZU5PVHZJ?=
 =?utf-8?B?ZGI3SUVuNTkweFVyNCtyYlRIRHUwMFd3UzByOTloU21SUGlTeHhMektxVVZL?=
 =?utf-8?B?cHdPSk0ybWsrdEJ0aHUwN2RDa0p3REhRN0dUelJSZXBrS2hMUzVWMTAwK3dC?=
 =?utf-8?B?VE9aVDFPOXhERHlhQ0lvVEl3ZTNGbU9rckpUeTJ5K05HUTl0cnZhbk1zdDhU?=
 =?utf-8?B?Mm1kcjdUdnppT2ZITjdLSlRHcWNlS2hrU084c2RsVTU0QVVyK3hZWXVIZ2Uv?=
 =?utf-8?B?UXRSMTR6RFhOZ0JRWktoUFFnM09BT1A3RHQ1UHBSeGQwT1laeVE4YW1lOHpk?=
 =?utf-8?B?OVg1WTBReWEwaDd1NVVVMlpteEFBTi9UalczejAySExlNExpOUdnSW9nejlH?=
 =?utf-8?B?cC9xcnhKU0hTcCtaZno3UG5VZFdyUjA4d3k1VG93eFB0OCt1TUJBbFp2ZDJK?=
 =?utf-8?B?dEdzakQ2dHBGcVo2aVcyY0YydWlsaHc2VGlUOGRlbkhjYitlWlUwdDdZVG93?=
 =?utf-8?B?NVo3YnMvYnRQNWdPcW5CdGMxUEtYeVVkcWp6bTBmak1HVkNFaFBES3VlTmpC?=
 =?utf-8?B?MWVpaDdPUURoNVBOTW1iMVF5NzFBQ24vSHBDOHZVSTA3blFkbm9JUT09?=
X-Exchange-RoutingPolicyChecked: y2dmux1efeaYN+mnetU/F31AFghQEnjRfUf6yMfFJlA/vNYoPb7oOqpPKlMu5QDSkwKNahbSUpEN1qs7qU+sDRonEXpPJeykXt1Rz5G92hGnZQhKVhuP+64lYdvv6gHhj8pd85Vh4lGG98L5uEeXSVfJlEmwRkKjdgy5NBlDGBpSXb4TrTWDXx8ZuAbYGOskH9KPbis3pMXTpPIyUBlEvO9Q/rNkuGZrXgsvwaqjFbwey4k7bo6C/neXx25mjV6jghg/Kwl31Omgp3b5vxLlLsRCE9UFCJqYCLMvETSm1W+SMWGIfYCP6hLZPE+RPcBsiFu5ioAPnnxJnPhdNi0hTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f22290-8f23-4c90-9b1c-08df1fc6bd83
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:17:35.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6/eEGN/wHQPUpmsksx3/QBE4JFK+jTCB6BE6X7uhhj6sMcqhqNezQTo9VOc2GMsS0IgpDRrvS04he+Vg+qOKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
X-OriginatorOrg: intel.com


On 01-10-2026 17:37, sashiko-bot@kernel.org wrote:
>> +/**
>> + * DOC: AMC Alert Reason
>> + *
>> + * Expose AMC alert reason through device sysfs
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>> + * specification.
>> + */
>> +
>> +static ssize_t amc_alert_reason_show(struct device *dev,
>> +				     struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> +	struct xe_amc *amc = xe->i2c->amc;
>> +	u8 alert_reason;
>> +
>> +	if (!amc->alert_seen)
> [Severity: Medium]
> Could this read of amc->alert_seen cause a data race?
>
> The sysfs reader relies on this boolean flag to decide whether to read
> alert_reason, but it lacks memory barriers or READ_ONCE(). A concurrent
> sysfs reader might observe an inconsistent state here while a new alert
> is being processed.

|alert_seen is not intended as a synchronization mechanism. |
|It only distinguishes the initial state where no AMC alert has been 
received. |
|The sysfs attribute is expected to be queried after the device is 
declared wedged, by which point the alert state has already been recorded.|

