Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8E3C3F5D
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643750; cv=fail; b=DN6LpYHjz7/sZ10tanuzwMuueFbLflcCJqb/gDR4LX8jY8e8sPNoL38dZqPxGmL0XqhXecBNbivu71j/5Wf5JsDcxOd9npLjwTZO87Vvsw+J2ePfVHKEebDh6Zb+MfSaARjCrvbo65kIJ38wxyzPEQGjW0WQkkYuDS3bsci5sQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643750; c=relaxed/simple;
	bh=AC1Zge82fYyrfD0ueBcNfJzTqUyfqqTlvHxqA/Je3V0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AKGCFrxQV94VW2SxfdWJ1iKQ2BL4BdF40qW9jlWeV1zqElfR6QUzB5DxRPtmxoLk6BBKHZ0bx9KHRbgqSqUTkjO6idT8vc0HkwCnOsqT5nyvkrv4g7ZYIdF0Aaj9JJF84PM2icjTt+j5Lz2+sBxkFJtf6mLc7L+RKx9tEiqCnCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmMiayC/; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmMiayC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787643749; x=1819179749;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AC1Zge82fYyrfD0ueBcNfJzTqUyfqqTlvHxqA/Je3V0=;
  b=dmMiayC/nQyGB53bnztssYlllmCOF+u02GRsGcxRQyc//rRCwXUHx5eK
   NEzYIznTxlGmn63pkGAArgC4WCjQnPsgZQ3fwpaebHfSTUdpviEgPUJ86
   ILq7yGUn82K5sXEkJCwnvObBPAT0/t9ZWcwZaSgLDnds71aOXg3Ix9ego
   ydMKOabmtYUbW+pYnvEZfaDEFQdqRSlIa5xYdcLOe8QitOBYQha074s99
   uI0bClW9vCNV93jlk4XINHQ37D+Ueobu73nwSvDTctbdgz9n1qCGhLcuz
   KSlxk4T1UzNjxCIulbwoSHp3Xhjf90cqcRbV0uZ1/8mBLvw/045pcllaT
   g==;
X-CSE-ConnectionGUID: 9glECKQHT9O5ee6x6LBbzg==
X-CSE-MsgGUID: hMzJ3sP3TOyfMrUBhsnH5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87978020"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87978020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:42:28 -0700
X-CSE-ConnectionGUID: pRM9EcnLSSSUy7QEzLJLRA==
X-CSE-MsgGUID: pkGDlmf9SHW5bdzOdj88eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="262904685"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:42:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:42:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:42:27 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KG1us4K/TjuEcFfrWGHSs2qXbmfzUcBMKNomJ/xeWH3MsOoBAh7sSw10nsYyBspEtYa1UowfXGCNi60YW/ezTP38zqz3fciNtzgTQ/UbSfH7GBz2nxqi8CNyKd7gYlO+seQ3ltoJWf06v6tFbskG4U1P8G1M+PfsnudYgCG8XdITW2jpLGPtvUwmprXwE71iMSqdRRxZcShnwb//WC7Kekfs3yHu266JLNj5eZI7Ti8eDDyY7QTSzYceUfIb0syQ4CG5e6d5jOJMn8DSWVbltE5yJvpBTDx55QhXuG9ZlECipMTnmgNE73UbGfJnJIaRLpG/YLfKta1htymVfDoJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iWRillbhf3T9NVdJg0fo3rRUpKG3O+a3CNun8u9L2o=;
 b=I/hTsI2pGCMo3bo1z9jwqdjg6pzdAwt14j6FMooXiBEzgLNFicVGCschu8hFKq4xURJ6XjtuR/cpRha+0Ql0QiS3R8ZQHHHamDZReEXk7sz8PrTFPEWfv5SNJMgmIC7J4lHhJ3505kT9QsToTsvx17wHSGuoJFdmobiNC1x8GMtodMNA9ZU9qMfBdPKoYqPHEzkQVqKkO7OpsBuiEsEK4GiyloIcrdbhfu4Cs0rZM30b9orIKq7G5DROKvufeiyPms87CQDFcMwJUMGzWEDZQtod3nB/MP4XsgC1QmkwTJLjwWqqLtuSVg2hYkhjBvguQ6uGS6jcPjGqzmhD+oHqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 07:42:26 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 07:42:25 +0000
Message-ID: <04705a90-5ac2-47d2-a1f5-d9c37c21128b@intel.com>
Date: Tue, 25 Aug 2026 13:12:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory
 controller temperature
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-4-karthik.poosa@intel.com>
 <20260824185437.555D51F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260824185437.555D51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA4PR11MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: b060200b-af46-4f83-95e7-08df027c680c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 47DGIS31ZQzc9nQ+3huUpGCsdd9mm2GO0RVbs+kfEuMOnp3gMVQq52nHl1tUib5PrdHBLM7ri7hSl4FcZIAxFefkXuDG/RfeeU0jl2fKfaDYlhEaLUN7IB3b3+OPcfLO6UVZEKR8KJvDCSKnCvGQwRE9JhNRoQjN5DG/uonsS/C/euyY3LRU7r6K3FnUZgMoktoBOKy3qdL6gn3EbqGctvic1h4kG1IJZdDfErsHQsftHqI5GVIvG3MjwyOB2LWYbwkw7GSJJGfeXtVIzwqut96L3FbwS+GUum73od7kKCpHcJUPzswgC8ZIQzIG4uRb6K81W5rcMT5OmUK65Qb6/DMb57YFECbzn02AR50PKvF7rqBKtd2Qj0zKSF0UHSQA0k1VZFSyQwfk5tL59u52YWrbR+qnXk4CQ/Z6cJoiXzylqsl20TLsnR3/5g+K43KEAUS9xuMTqn0ZdF1ue4saEne94eym+wk4UjsKGDLahJsh9joedD71rW7CPbRLNbI9BfJKBXt/iDMKqiKqh7g8rJwRSx4m6KdVpXb8r+YinfEghUcwMMbf/hzag9fBgIDMRpZGBifWZqur/uh5JwXlqJcrEqKaDrKY/vSBrlSxONorKeVxuu9yPUCdxxlrZ82F98kOrpWQkWzYYmrwVshlcg2x9Wf9J/0Y/1R1qUlvpcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTV0SzIrWHlLQ3BydmxoMDZkNG1oSnpUMzRaS21ITHJnVmVPZXlZZFc4Rk40?=
 =?utf-8?B?QlZFRTlOVm42UGZvUDQzMVE1NmZ1Q3JNeFJycC9PZDdwSXB3MXczZXd0VEtQ?=
 =?utf-8?B?RGlSM1FuR04xUzJXNlVNREJUdXRmcEVLdi9QV1V3S2tCRTZDQ2xBTTVUTVRI?=
 =?utf-8?B?bW94L0tseFpJa2VJMVRrNjhwd1poQ2xCaERkWDVmRjZQejkzNUI4cjFrWGhM?=
 =?utf-8?B?cnljZi8vckd0WGRmbGNYbUF6ZWIvdGRjS1dheVVTSzBFVWNxd0JNOUFRUUZO?=
 =?utf-8?B?NGY0NGpYRFliYjFCQ0NYTU1MR3U1SnlzUmY3NzVTMU9YV2RMYndKNkt0YWxD?=
 =?utf-8?B?cng4cHgvSDZUQ2FPdG5kT0Fxdm1RU2YrWkk0T2ZKL2VqL2NhdittKzAveEI3?=
 =?utf-8?B?emE3dHRoeHpaS0NHTWRxQjB5R0l0clFGWklxQUJCUDJmTzB4alJXRWlITk5Y?=
 =?utf-8?B?WEdKbXQ1L01VY3h3dytCUkNvL1dmanh4cThHWU5zSlhleGY0VlRrMUdjMU5m?=
 =?utf-8?B?Z1R0QTNLVCszNldyTlNhOFU2ZTdiVzNwa1dFd3hxOXRtRi9YV2ZBcUxldkZB?=
 =?utf-8?B?RVRLcU5jRzUyRmk5ai81S3piQjR0RzlYazJJcTVweHJXZUQ1czY0MWVkNWI2?=
 =?utf-8?B?OFdiUUZtT2FqalErOUJlKzVESlc2U0NFcHFSdXYzN3VHczlOQ0RyRCtnQ21x?=
 =?utf-8?B?azQ3cVdCMU5UY1J3KzBxU0JsVlplN0tvdGlWbyt4NkViM0hXdTdkbWJLZGRH?=
 =?utf-8?B?YkdKT0pmeEdFRzhUclRxcjZ4dVhJUjNCN2p6K3RXNUJ4SkNlaHIvc0hxRWIv?=
 =?utf-8?B?VllWdGtQVEhkQ2huaENWSmJYYk9EU3VjWGRQdWxTL3ljWG1laDBwQWJjV0Yr?=
 =?utf-8?B?b016aHVpQXlmam85Q085dDcvR1h3L3VvdDJyREZIY3ErVnN2bSt5clJwMk8y?=
 =?utf-8?B?R2lpMTRlR2RFcy9Kd0YvUjg2NEllZ1VJSFlab1o2UzNaSTJzZitJMVU4Q2FE?=
 =?utf-8?B?NHdQbHppa25kaWY2UWMzOWE0SVZseXBETjg5VWY1R3JWOTRUalFJdUtYVlp0?=
 =?utf-8?B?NmZQSGZJdzBFblRldERWcUhjWHJ3YzRYMTJyTVVQYzFid2VSZ0ZPbVdud1FG?=
 =?utf-8?B?ai9MczJrRjVNbDZzSUxNeVRiYkZVR2I1aFpyY1YrcFhSMTRSWUVGTjQxVkFF?=
 =?utf-8?B?aHo5WkYzNWZTTVBLTGYvT2d5SytYY3VJQU9JcjIweXR6S2FiYml1OStaWmtB?=
 =?utf-8?B?L2w0WmpYenFVSXNvaDBsYldkVWFyY21VdGl5QkhSTTVZZEl1NUs3dmZVYmRM?=
 =?utf-8?B?eVozdEhtT3c3UTFIbW5ZV0lMNGRLeWRVNWc5Z1hQRFRMQkZwajdyTnNXcWJo?=
 =?utf-8?B?STI2N1NvOVl3dEtUd0VpZkFVZTBSYldZUWV6ZjcxNnJvNnFYS2hPeWUrUjVh?=
 =?utf-8?B?K2JUV1pCdGdpV0FyaFl0Sjhsb2xoU0gxN0ROSVN5TVVwUEpPUmJMekNkdTdL?=
 =?utf-8?B?RzZzSi9waHp4VG5ZZ21XY1RJWnd4NWpVKzZCTDZIMzl5UjVuT1RicGt1S3ZO?=
 =?utf-8?B?bGNoQklpOG9wTDFhVTM2TnJHYS90MXR6SUpPOGJtbkFJODZtWHJJaDRtcVJF?=
 =?utf-8?B?VHlzbFA1MERMV1JHWkhOa1hlRnFXUjBQQTRYT0N6UWIzWlljTkhXUmhVaVNp?=
 =?utf-8?B?djVUK2d1cHVrKzRYS1RiSStwaGtMQUFDb3p2c2JqQmQrWEtqL0o0QzJndEZX?=
 =?utf-8?B?TzY4Y3dCN3VlWnNqSDhlYXRjMVlIOG5vZ24zNk1hS2JEcm1JZ0pwWS9zTlJk?=
 =?utf-8?B?Tk1OdVRHb3NKbXVBdmF3YjhVQTNYWC9jaXBGaGUzb3FVRHlUNXBnL3pERnNv?=
 =?utf-8?B?UkhPMzI2YVp4cm81Mkd3QnNObWcrelZaSlg5ck4zeFNScTV5NVpva1VoY2Yz?=
 =?utf-8?B?NjdkK1Y2OWROTUJXYkZYbXpuWTBDck80aEtLVEZnUnZ4NVZvdFpyNFRrOGFS?=
 =?utf-8?B?NnBTdVMyV3RJcVVPNkc5dFlMWnBKTFU5dmNvZ0NOM2xudXQxZFRNUzZnQUdJ?=
 =?utf-8?B?UEtrN0ZaVUJNSzFFWkxNZElQalpkZ0QrcW9pWk5LZWZHeUdkRVdyaUtvbDJ3?=
 =?utf-8?B?TUQ1V05ZMUF4SjA5QkJlK3JvZWNSYll2Mko5L2o5Q1pnUWxpUk1PdjJHK1Rz?=
 =?utf-8?B?bTNTVzg2UU5HNVFzbW1iRjBuSXhXMjY5NjZKWFFBMXd0dDI4eWVWdWNYTllB?=
 =?utf-8?B?SW8vRm9PQ25ad3NHcE1JMjVkK0pSSkRrVjgwRFQreVV6Ny9BRGkzWVRoZVhE?=
 =?utf-8?B?RVQ2SEV0a21uQjFpOVBGWlBZeE44Vy9sTjEzazY2TEhVdklUVUxCUT09?=
X-Exchange-RoutingPolicyChecked: uxi+119AEinBF3673Et0lj+0lbyMDiPIKhHgBS08OMi46MlAxHXQrgts5+Lmiy39++OYLUrVAv2LxG7dZFGt4ZKy+KqETLQ5KS2bcxWiKDNgQhZgBdTtO0F4ym160dnGjzlKs0c2bh/wcRC0Ev+/LnBM2SY0eSwdAAVUes9Zz3uoiO3LMrLnMqngmX0+ZHACpnx0WLameMCyxW+s5d5zCxf5xuklixor4a4rad/e7O77rhZ+W9PJUzjq+Wh/Xxl2gO6mBrG5uT/024zAJKkQN5SlNDgPn5MeouhtZ5qkNW1OY5zorz5VpHfE8pM68AX1ByqGdWPW2eAxjQXIBJcZvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b060200b-af46-4f83-95e7-08df027c680c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:42:25.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4XLRU3bGxf6waPmX5HuV8rlH7c1hRIrE/zgnnGTwJhCtE4hD+wOx47m5amGpItmIEqeSGbZFziRfDIdLabT4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
X-OriginatorOrg: intel.com


On 25-08-2026 00:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Out-of-bounds write of 1 byte into `hwmon->temp.value` when reading thermal data from pcode if the sensor count exceeds 252.
> --
>
> --- Patch [3]: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory controller temperature ---
> commit d6bd40537c53d76ef6df15e33458ad0d982f56b1
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Correct group selection for memory controller temperature
>      
> This patch corrects the memory controller temperature group selection by
> updating get_mc_temp() to read all necessary groups based on the actual
> sensor count rather than a hardcoded maximum.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -820,7 +820,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   	int ret, i, count = 0;
>>   	s32 average = 0;
>>   
>> -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>> +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
> [Severity: Medium]
> Could this lead to an out-of-bounds write into hwmon->temp.value if the
> hardware returns a sensor count greater than 252?
>
> If hwmon->temp.count is between 253 and 255, the DIV_ROUND_UP calculation
> evaluates to 64. The loop will execute 64 times, reading 4 bytes per
> iteration, resulting in 256 bytes being written to the dword pointer.
>
> Since dword points to hwmon->temp.value, which is sized at 255 bytes, this
> will write past the end of the array by 1 byte.
>
>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>>   				    (dword + i), NULL);
>>   		if (ret)
> Yes, I shall change the hwmon->temp.value size from U8_MAX to U8_MAX+1 
> @@ -149,7 +149,7 @@ struct xe_hwmon_thermal_info { /** @value: signed 
> value from each sensor */ - s8 value[U8_MAX]; + s8 value[U8_MAX + 1]; };
