Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C951474E
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473789; cv=fail; b=SfnDc+VD79dTLQ0od7F/Cj8JB61upJ9kbTDZ0qLuZSV/BGPon0nKL9zBbXv0lYTd40LLmk9FjXuhKmR1PL2UtFp1Dp2VgtUq4LAsuX197fY77RQWvJoW6CdY3MxcBWeQkrSHdf2ivKjvQAFcVJQCzEUzRuqG8q3oEnM5cd2gsX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473789; c=relaxed/simple;
	bh=imBeQ8+uhymjH1Evdu7k+oOaczGv3MmKJ5MQc6jw3RQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KDOuU700Q7lvXvqLPFB9YS72E3kQxAAhqZScXmVneq5zmvgNWFFmyOWnopUMU1QPlb6CRVHh0QC1WiVhIolWxbvDu/GPFe4A5MkR2wyoOzuMZSqr+ugOxwi6DV4qCoRSJIKuWSYyC1+Ddvxxs9Uqs3EmqIZtln4KZLlYlT3+bRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzw34+gq; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzw34+gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788473787; x=1820009787;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=imBeQ8+uhymjH1Evdu7k+oOaczGv3MmKJ5MQc6jw3RQ=;
  b=mzw34+gqEzTCJhCXfBctkFt1SQropQ5Xlgu3CldPC86ay9Z00/4M/WTd
   wwJPOWeCqFpvmmqv7uvSvKVua/DijFIR7GNqjud11tTdhzimBQ5tbFBaD
   y9yFMMhwNL2Wr3IA+dXCtgokmg4a/RHbQiGZvpm51OLifRjUbQOIhlgQq
   G0WDxQG7jLHG1XDbvyAbQZiWOcSlH0LG3vdBMhjzV0uThc0euH+lP5Qki
   czTfKbrjUJl/AYw2VaYRvq4TwIR/9+WMWK/JxRCFpYY9soNK700Zw4LX0
   fqVAOse9xDxGYZohSxF9KVrj8tboRjTtyEDWBEvdh+8hlEvlqTAK2B9Tk
   w==;
X-CSE-ConnectionGUID: +PPaiC3yRF6g2P9nhKoy6A==
X-CSE-MsgGUID: VjTx5WVjQxGuKlHLlSc0kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89094674"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89094674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:16:26 -0700
X-CSE-ConnectionGUID: CXlrJbmpStq5h2VuFoaeOQ==
X-CSE-MsgGUID: THJKTsc6TpekUdEhigk7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275130187"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:16:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:16:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 15:16:25 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OM+GEamAB7zkCeeTZvqKMUYZJtVC05REHUtDrjWLF3AyIa7R/5cNQ4O83ebH00IbLCZoV9waAKLyQTWi/BBh88wAWdQUGUukQY90ft9+oykJpgPYoCl5UmmMebATL+2135Buxg773mlIOOILvxrflrqzKBvxf8bfc1tIVtbxe6BqslYW2gT6K0ytbwVBzvLw2WfSO51ri0Sj42cMzbLnbqnx88/kN3LINZQXHr304/MSl9nCXqQSAs9xaP9lYbXaQSODDLCUHxjQvl3U8p4ckoxC8G3GUNs0cqj0WXbbVQCz+fxdCRevMbDZLAKN19CpGx0MBMdwJYh9YJurWbyzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mg3HvfIYau2EKnMAfTCtZTcULuarPCCRAr7EDTWdtY8=;
 b=L3TYsPilA/RAoKs2jpYTObrwfvJpqvzSbB6TlqGFkw4LRq6qAu8mf1O4SO4d73HmkGgUJN9ac9ouRyhKEFtcXuVgRKhu+zEledq5YLMt2xLQ4KrkYrsGZLe5cARtQM6+Rw2cxp6SHTyR/H/nZbjizIcZoMGDllT6o53Ai+kEDcBGPxt2Z4flOKLJ74W/lrHaRI8vARftVOK8TDa6zsfNDA4jv8gDnebRBvc41Qri53OoVnu3Z1lzZ1IB+DDQNhUKvNCVmbgzGc3VE2xN+EOgivcQc/Wvlu6RKinsxIel6P/N5tmbxZbn6NcJa3rqzmHnFuCkcvm+MP4KvOJhmTATCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 22:16:22 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 22:16:22 +0000
Date: Fri, 4 Sep 2026 00:16:15 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v11 7/8] drm/i915: override Combo's VS/PE when requested
Message-ID: <tn4aptgci5wty3f5t56dr7xjfq4j33pzzl6scimokxhqy7ezts@6ioifmxxyjoj>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-8-michal.grzelak@intel.com>
 <20260813165017.4B5141F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813165017.4B5141F000E9@smtp.kernel.org>
X-ClientProxiedBy: AS9PR05CA0250.eurprd05.prod.outlook.com
 (2603:10a6:20b:493::28) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7a2e4c-3755-4a7f-fbc4-08df0a08fac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|6133799003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: qnoBQIxW4dJGrW4uKoMSaxgLWTxYrVNBNzFzsZ3zanyicS+DSYQaQBVgcihbR6yW7bNP6dZvVUlfrlgw9/1giZdi/AePTuQ2XJ8aWeDs3YtwDY/nZRjUYgfH2Y0zsmg6XxQxTDZCNmVNCp1PdfnkIr51C9LVRK09Zm/4oOzNnZkrYupfySX6PmpCzqpId7nXQhKEsuBTxiE6HeciUHjk10//jXYzPtfGNMAD1nylIepOmB18OWGpNhFFDtvv1C5d85eU7F4H0n7nwYMoNwDlVsf8jjD6CSuJoxiSGeZeXbQmskIXX3YVAelINpXTC1y89Ny5VhAmBOazV2zOq67VQ2vYAi+/OoCKMbV2TeX+8y295SU82S7yAmBdnpyuFMBS0AOTpKB083JrB+IdaVqn7esHPL82xfKoHcVb290Kl8LMEDFb9H14n1aK3rDeHFb5z88vE4u0dqS8tNubsrNyZ80k7hY47MtzUGpNm+UqHT9awzkrS4tFQo1mjEkQ6EfoQ2MNnUJ+Y9wC9R40aSQCoJx2adTOAxex83kEZb7esEAEQXrKmBnvdac0k/w9IKaYGpckrmoyhawDCVklG1geWms8KV7PXtI37cX42G6An3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTZoNjAzZVprWUluckNMUkZTcDVmeG5mVk9hTlVFTGpaTVhVMm5BeXErZGxl?=
 =?utf-8?B?MkdUM0ladkxKeGVWRW0vRjM1cFExc1krMWxwZ2Jja0dYYU9scnFlSktFdU84?=
 =?utf-8?B?YUJONXIzWWwydThRT1BMSWQwWUNPOEFaL1ZKQ0ozK2NWZDJmN1Y4ZEYwMCty?=
 =?utf-8?B?MXZwM2xlNVNLcjBGOEpIWENWUUNWZFJYV0d0MWp4Wk9KcStGVWdBUHU2Ymtp?=
 =?utf-8?B?ZnhNUGR2a3o4MmpoRFBwbVVjZ2JpM05XZ2tFRERydzA2YnpwRTJpcWdVRGlL?=
 =?utf-8?B?cTI0dFowOGZxR1UycitsS1lsMjNSSWtPeThKbkJQQW5lb0lSdUtqYURJRG9h?=
 =?utf-8?B?ZVhqb2F5aS9NN2hDSlJ5OTJ6cmUvRXhaZm9NWnBGNDY4dXBKT1RvN2paMDRC?=
 =?utf-8?B?Si96ZklhVFN0OTRNVlNqcVE2U0dIZTR6QUhpYzFuME1iSlBjaTJnWEtIbW1s?=
 =?utf-8?B?QW9jM2s0QjlYRFZYRmJocXkxenFRTmRqUlJEblJxSlA2Sklzek1WUTZ3Mity?=
 =?utf-8?B?RCtZTmtVSTlqN2tXSnNjY1c5TXNHaHRMZ1RiaERKVFBYeXczWWRlLzErcnBX?=
 =?utf-8?B?Z2djeVoybHJhT2NsWEgvVlB6MUZ4T3BCTUgzODlzc28rZEg5Z0owNjArbHhS?=
 =?utf-8?B?bllCTXl3S2dqV0JSY3lRcjhzaHI4NXRkd1NWUG9YalRlZDJWeEE3N1FVZm1n?=
 =?utf-8?B?K1ZkNHk2YnJKb2lIQ2JEcEJxOWpJbE8wWXYvVWtlNVNkQ1lTK3R0eVNPa0V0?=
 =?utf-8?B?UlFzTFZEc0EvanFCQ0l1UUZQd1VGVEVWWlN1dkVuL1QxS0lxMFhKMEFiNVBQ?=
 =?utf-8?B?d1hISUwxa1phZEJONDRhdmlxTHVyQWhKRmVIMnRDR29LM2lET01kOVlZdWJW?=
 =?utf-8?B?OCtzcEhXMUt1U3ZOMFYrWXJRelQrKzVQNUI1bDdrWGdjS2NXVURoK0VwdnZQ?=
 =?utf-8?B?WjRXOUJRQmt5MlM4MUNkMG9rK3ZDNVE3RzNsUmJDVjQ4ektQWmlFSjk0QnlV?=
 =?utf-8?B?ckJmaHljWG8vc1o3OHZFY1pEdlhYRUlvYVZnNVQ4RnVsdUZ1L09vTGhuRGtk?=
 =?utf-8?B?L1hVRjhneWlJNzZYT2huQzIzUUJUZEtQR3Z2SWxhVlR5MDkrdDYxNzZsb0FU?=
 =?utf-8?B?VjI2UllUcUxjRmc3cGpBd1Ayaks5UndkQUowaGczYjVkWkhuWmJTZUFqaEFF?=
 =?utf-8?B?eEZxR0EwVFNobUpCQ21mOVdsaytXWTF2S3pJZXdVeHlWVW1oNjd1Y0dmZjlv?=
 =?utf-8?B?b0QvS3ZGazZNTUl1T1k3WjhTRmROL2NscHVndVQ2UWFBZWZTQjRWRmlZZVJs?=
 =?utf-8?B?TVF2L3B1RzFCdkVVQmt3a0dRM1Zvbk5Ec2k2bmc2ZWxYaEkzVjA3a3Zvejdj?=
 =?utf-8?B?ejlBUGlOOW85bmlLOWM0Q3dIUzA3WVg1STF4bE94emxyS2IvTVhXMDRWYmo2?=
 =?utf-8?B?aHI1RFhMRXByWWd3WVlPMFhhcmttTlNlc2w1bGg3bkNsUWs2Z0JBMDU3dlVq?=
 =?utf-8?B?UnJJT3gxdGZxdlFDREpZZEg0SVdoak5zajk4VHhDbzVTQk1jSXhxQWtoYVl4?=
 =?utf-8?B?UFpNRENYdndlbEJ2dVVTYVRDeGI0NFozVUx3OVJFcFY5Sm00RUswQXVOTjdz?=
 =?utf-8?B?QTdhRDdmYVJFb0xscWFoQmhGalFyelQwUDBFMDVLUEVZTWExKzY3Tys2R1F3?=
 =?utf-8?B?d3BkT2J0aGdiOVhQYm50YWYxWUtUc0xYeWlWQTZwZjA3bWVrMmdUVmZVcGlG?=
 =?utf-8?B?dmgxTnZ0RFowSkdxY20xNFNQdjMwWkczQ2hveG0yeGlOYk1FbHRhTGUvZFBX?=
 =?utf-8?B?OHNzaFVCTzk3ZlA2RnhVNjQrN1VQZUpTOW1LTXEvY3JLdHFpYlhyNHFNYW8v?=
 =?utf-8?B?ZTJIci9NbFBLNnBTdThBaHlzZ25ycTdrUnVCcDM2cVFidU85VjY1Vkh3QStI?=
 =?utf-8?B?Tzh6MGhEVEdaYm9Xc2hvbWdQRW4vUklTZGpkSlhaOW1MU3BtWUU3c2VKOTJr?=
 =?utf-8?B?QXEzZTFaZjVFOUQ1MU1pTXNWNS9TeVdxYThtZ1hvM3NyWjJEMWFISmhyS1Jt?=
 =?utf-8?B?S0prYmdoTHFkMEplNWoyZmlnSjRWWEVOQUo5Y0dnRjBpNTl1QlcyZG11UXVQ?=
 =?utf-8?B?MTF2N29sUjJ2SFVFWnNyaGhCRkQveExsay9wRktjclJwMWM2WVZWOVUvNmpK?=
 =?utf-8?B?YldHTVBqMjdsS2RmZXZ4Znl3NWcyUTBNcHJRSm04VkVZTGQySUJWUW1vK0tu?=
 =?utf-8?B?OVovL3J1WDFXOE1lRWpvWi9qSG9iWURGUDVWUXlPRHRsUW9zYmxWR0VTYXJO?=
 =?utf-8?B?ZFl2STBCdUpCM1hOa0JkU3FXcStxbmJzQ3BKMzE1UzVQbWRKY21DOGk5ZXpY?=
 =?utf-8?Q?h+aqq/BQ08+IcKmw=3D?=
X-Exchange-RoutingPolicyChecked: dX3e6eTJi/WpgxAybbnD1HqOsGbJ9/GpUIx5i1uC5c5HmZ1Qc9ADbKtaFY7Zg31UFQ+J91gOoA+tkxFGBLm9OFhLIOZdcb0QDr6XiXhysK0qYveqUGBzZmaNLxFiVKQwd13C/LbPo9bL0M8WxDnymGW4TX2bsxO5cETI0UI64tZ7+RJ3W1ihAGMiNhKcmVofesMsmjeZm9I+v5PGAO08EWZ+QFumtpuPN4/zvUiXXQRhc8pN/q0aJ11IpuEXnCl0X41DN6ugQRM7d4Yp4rzMc/vfgxxmK4TbSRAHKGDLIHWew6IUhWQl1rgblbWfMjqTl68moDch84fq4bHn1nx1ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7a2e4c-3755-4a7f-fbc4-08df0a08fac4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 22:16:21.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xy8hKuHI/EHwRLRMx2pQSE4ER7B0jSCaU85yko/s8D/zbouZg1Ikrk9UckznqbKh3NTWiuD19bXZXm4IhOTMOKxAfVgVamQKK8UmyMHWHL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com

On Thu, Aug 13, 2026 at 04:50:16PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] EHL PHY override logic incorrectly applies 'low_vswing' settings to non-low_vswing eDP panels
> - [Medium] Potential out-of-bounds read during VBT 'tables' parsing
> - [Medium] JSL PHY override logic is reversed for HBR2 vs lower port clocks compared to intended behavior
> - [Medium] Memory allocated for `devdata->entries` is leaked on early return in vspeo retrieval functions
> --
> 
> --- Patch [7]: [PATCH v11 7/8] drm/i915: override Combo's VS/PE when requested ---
> commit 3f316b5929dec8d0ea8bb76e4cb8983db3b9bf70
> Author: Michał Grzelak <michal.grzelak@intel.com>
> drm/i915: override Combo's VS/PE when requested
> 
> This commit adds accessor functions for the Combo PHY to read requested
> VS/PE tables from the VBT. It parses the requested table and transforms
> the data to override the port's buffer settings based on platform (EHL/JSL)
> and port capabilities.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> > --- a/drivers/gpu/drm/i915/display/intel_bios.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> 
> [ ... ]
> 
> > +const struct intel_ddi_buf_trans *
> > +intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
> > +			       bool has_dp, int port_clock, bool has_edp)
> > +{
> 
> [ ... ]
> 
> > +	if (!validate_vspeo(devdata, has_dp))
> > +		return NULL;
> 
> [Severity: Medium]
> Does this early return (and the similar one in intel_bios_get_jsl_combo_vspeo)
> cause a memory leak of the devdata->entries buffer?
> 
> During teardown in intel_bios_driver_remove(), the driver attempts to free
> this memory using kfree(devdata->vspeo->entries). Since vspeo->entries is
> assigned much later in this function, returning NULL here leaves
> devdata->vspeo->entries uninitialized or NULL. This would cause the teardown
> code to skip freeing the memory allocated to devdata->entries.
> 

Duplicate of memory leak from PATCH 4/8.

> > +
> > +	if (has_edp)
> > +		idx = port_clock > 540000 ? 2 : 1;
> > +	else
> > +		idx = port_clock > 270000 ? 1 : 0;
> 
> [Severity: High]
> The commit message indicates that for EHL, eDP configurations using low
> vswing should behave differently from eDP configurations not using low
> vswing. However, does this logic unconditionally apply the same table index
> logic to all eDP configurations?
> 
> It seems intel_bios_get_ehl_combo_vspeo() does not receive or check a
> low_vswing parameter (like the JSL equivalent does), applying the same
> fallback logic to all eDP panels.

Yes, this will be fixed in next version.

> 
> > +
> > +	offset += idx * num_rows * num_columns;
> > +
> > +	for (level = 0; level < num_rows; level++) {
> > +		u32 dw2_swing_sel = tables[offset];
> > +		u32 dw7_n_scalar = tables[offset + 1];
> > +		u32 dw4_cursor_coeff = tables[offset + 2];
> > +		u32 dw4_post_cursor_2 = tables[offset + 3];
> > +		u32 dw4_post_cursor_1 = tables[offset + 4];
> 
> [Severity: Medium]
> Can this loop read out of bounds if the VBT is malformed?
> 
> The parsing calculation offset = idx * num_rows * num_columns followed by
> direct accesses up to tables[offset + 4] doesn't appear to validate that
> num_columns is at least 5, or that the overall VBT tables buffer is
> sized adequately to support the calculated offset and rows.
> 
> [ ... ]
> 
> > +const struct intel_ddi_buf_trans *
> > +intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
> > +			       bool has_dp, int port_clock, bool low_vswing_edp)
> > +{
> 
> [ ... ]
> 
> > +	if (low_vswing_edp) {
> > +		if (port_clock > 540000)
> > +			idx = 0;
> > +		else if (port_clock > 270000)
> > +			idx = 1;
> > +		else
> > +			idx = 2;
> > +	}
> 
> [Severity: Medium]
> Is this table selection logic reversed compared to the commit message?
> 
> The commit message states: "When encoder supports HBR2 choose 3rd table.
> When encoder supports modes lower than HBR2 choose 2nd table."
> 
> However, the code assigns idx = 1 (2nd table) for port_clock > 270000 (HBR2)
> and idx = 2 (3rd table) for lower modes.

Yes, this needs to be fixed as well.

> 
> [ ... ]
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> > --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> 
> [ ... ]
> 
> > +static const struct intel_ddi_buf_trans *
> > +ehl_get_combo_buf_trans_override(struct intel_encoder *encoder,
> > +				 const struct intel_crtc_state *crtc_state,
> > +				 int *n_entries)
> > +{
> > +	const struct intel_bios_encoder_data *devdata = encoder->devdata;
> > +	bool has_edp, has_dp;
> > +	int port_clock;
> > +
> > +	has_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
> > +	has_dp = intel_crtc_has_dp_encoder(crtc_state);
> > +	port_clock = crtc_state->port_clock;
> > +
> > +	return intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock, has_edp);
> > +}
> 
> [Severity: High]
> Should this override function be checking use_edp_low_vswing(encoder)
> similar to how it is checked in jsl_get_combo_buf_trans_override()?
> 
> The current implementation omits the low_vswing context entirely, passing
> only has_edp down to intel_bios_get_ehl_combo_vspeo(), which prevents the
> distinction between low vswing and normal eDP configurations from being made.

Yes, since it is related to earlier comment from this email.

BR,
Michał

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813160918.918857-1-michal.grzelak@intel.com?part=7
