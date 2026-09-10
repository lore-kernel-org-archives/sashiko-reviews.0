Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8481A6838
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008441; cv=fail; b=tgpBFh0JK+scDO9kksMt+kdkln1Zpm88wuJyY2Mev86JgK2f/HWXmigmC8PrI1C/e6jXMpkcJMkP6oZ7LFAwsDe9kNIlmjkOuV/ZcFpdNUIDwPi6OYcfpL1Ol1vDnaRFtuUu/5MJS1czdvl6DZUx5SiVStVlnkOhAFNzgCDG5jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008441; c=relaxed/simple;
	bh=RRkOO+okzFnHNj712qMv4sJYDOpQZw3/6iqXDDgaTZI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FMC3Auj7CC/OAsRTYILzbW/ezdiQrjHz3YanqknvLRdlSKsIsgqPEhOnZk9x6ARB4AMCE8uQ7i2yPgmHxkBxzcfu5Bty/mcF+AeRDMnSOgQLPW2BxPW/azrC94BAS4tVzhB3PwwBkV7InoAeboG6HJek1SDEZOVn4QJmR1GM1fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAvBeAbn; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAvBeAbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789008439; x=1820544439;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RRkOO+okzFnHNj712qMv4sJYDOpQZw3/6iqXDDgaTZI=;
  b=iAvBeAbnHNQytuxEy0K24SkfRwIk6ChaCclh3Y4P/XvZTSx6uo/kD/UR
   yKh5iT3fshBv6Se+2+Q9XE48iT2ZPCDe9f1BPm2/SwK3XCW1tPSRsg9RF
   OY0zn2m/aOFOnKNeSimKadL7Z8lmYUWYhaHfyulBaVFhbJWp7/D2hU33m
   SHESo5J5W4QBWIkD4HQ2WHIivKtOCIPqFgQQ2M6wg0d1rfilnHlQySTqy
   ImNXiK12Qqk14du5+PZWkfT4WQAduyRq3/ob+PdV1yp16HZr9sn1ZL+Yc
   5L2HDCpYpXmSUqqC6hDdjXaM7gg40gNEsrTzxezN8nnU5KZw/Bk7NG/q/
   g==;
X-CSE-ConnectionGUID: ZwobKt59QpG/rB+b8Aozig==
X-CSE-MsgGUID: +1FC/Bo9TvWsQqkxHlLD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106817810"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106817810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:47:15 -0700
X-CSE-ConnectionGUID: 74bcwXwSS2GhW8E8iYaftQ==
X-CSE-MsgGUID: UOPOQTIKTWiZlFWbY9Gxkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271007546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:47:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:47:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 19:47:14 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNmBxzoiyvhxXV4e7VU9dmNsi+au6ys5TqDyx+n6tOWBbUPGS3NFhI6yoTqDSmA44XT0JZk6w3fO9CgVZeloLVUiuihPoc2c8258crFJKJE6NRjkTTCnYKET+iyCDcGof+lk+zcxQvBuA7hSvh6z049xHZf758XLgHdVF/8FDBGHxhoiVI23LJknrqfegaDkCXs30Uyb5CUyh3KEokXCNtCVzRDYnJbKQNKlZPzBN3qIP5D6vzPe/IEAu05O28SjZuFxIv7TQYX3zrJRuRNnVl7+zsU1E2oC/sFXlJQ6PGGu/EUtUGtKpv/zf5FPYiSkghMS64OAQXV2ik/rXfHAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzthG7/30bz/czYH8sQ6Dg3BUM+usKXnigniryPyJPs=;
 b=MUwedjkijuv6QTrHPsA13kpTTDERnJyoHqRbg+hmW6CHyNsmRifjzR9xuB6y5HOl9dbRggXDUwaLThHErrKVxBBL3cn1chvnlxnrOJeU3RLN7J5g09NDbB1beJj/iqWWZFO0ma+9JMPXTB7AtmbKtdgwa7udH3afXxGD4GHStliw50NP9OmhdGKf/ZOGxyIhqX/d+DO5inJFiOwcY7f+ZLhneSgvBiEvQIbPOeq0zm+OexrK0SGschXV+sviLs3Gg+bF+orWqJUgkjExzpxKJWx64jv4NgpmmDzprsqKqaPpS0HWarle44iG7F/i3EbQo1lfBT8FIu20wehU2uxtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 02:47:06 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 02:47:06 +0000
Message-ID: <47308f12-1bae-4b2b-9ad5-758c92de4f37@intel.com>
Date: Thu, 10 Sep 2026 08:17:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-7-ankit.k.nautiyal@intel.com>
 <20260908070911.26FE81F00A3D@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908070911.26FE81F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1394a2-d284-464f-3a93-08df0ee5cd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xg/s+CrePqiVUcGJRTvqA4NL4vK681EOzecvRiPoXtfjvwxL6zr19S/uVTuKKgIj5Efvbp+3d477IZyWccDPOUTx9zwLQvFMYPZET4EfCXOnNiU6xzu/eobVJPmJC0LhiOxSi47mwr6QjzVtfzW0CrJoJTKF4IeDBXxgSCmEEVPk5HHsXDZmQHzfKGSdoZSMQFbHHYFld+w5k0CC4LX8Y4PFM3ywWHfx52d2TK48MXOJT4KFKGrkAUiJ9SRXsgGCDfepcp0vFplhb1+DQhZHrqgaxBT0mRqJ/6L9BKGWoXN4GO5cC/92sn0eh1Jp///srBBswkKsUfh+ZDB2Nj8lWSDffom6uJUcHY26yNt6t9vGTY+49vsy8IiXxp/4fuM32R7ayruCbxCH/hZLZB+y+g7Rpmctq6hoSbsWEONR0GgMKSqhoMWLIw5cJSwyU0iBW6TGJ+m0/kRYHbUROtTJwysHxm7RNbxbLu6KRifZPXTQF+P5+ZmOn16n2Z4A4x48+/UFUwL2VJ18/FBXOMcYbsEMlGa+derWIeoc9OQRgU9TQkGoGbgJPnP0ARwdIHJbiuUokLZXvoW5sS6Wj/6kX9HGYCQf2uJz70pT2rrXea9b9DD6HqCdvnTJ4rzqYxLad4FSnIO4i4SrPl4tfRkBox5eByVHiaZKJ4rRthRgqX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7554.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZBWjdIazd0WG1CYlE1V2VXbjVJWXdzaGM5dlI3SHRpR014Q1NkaEpKMFpO?=
 =?utf-8?B?eFF5ekRkWk5za3AwT1FVb01DWm1WaDlwbzNZb3JuQ2dNQ3A1ZC94ODdWQTRy?=
 =?utf-8?B?MnRIak12SU1yNDVzLzE5OEZvbDRuUmpGeWNhM1I4Rnd0dzNhT1BQTEFCbndE?=
 =?utf-8?B?YVZQTjk0cWRNb3VLbXBNc0UxYXRFdWREZFhSS0J1WTVxeGFpL3RMQWVxOFNh?=
 =?utf-8?B?cFUyalkwS2ZzVUU2clpMVlFrVlk3c3BEZGloSGpGVi96aUxXUjU2MndPMXFL?=
 =?utf-8?B?TXlsK3VaL3ZrcUlBdmdoS1VqcnU4ZzFkSWdLby9zZzMvUys1T053ejA2WWFl?=
 =?utf-8?B?YkcyYm0rMmF5dWNOQk55VGtNT2Q3UjB2d0F5Ry9sMVVrL29OdEs2QmNETmsv?=
 =?utf-8?B?QjlkWFV3dmVPQlEwbEJ4ZVpYYzd1NUdKSHNtaE1Xalo5a0FOdTJpY0hONnZa?=
 =?utf-8?B?eDEyVDJKRlkwYUpUa3VoY0wzM1ZZbitZVEk4OStFSWRrK1NYU0tETHdRVzI5?=
 =?utf-8?B?cm1SV2RmckNITkR2V0FOeURaZVI3dWgxVHNONVBmaVZ4c2tRdklGdkFJWjhS?=
 =?utf-8?B?YXM1UUZBbFBkM1RSVU1TN3JRRFJDWUZNOVFKWVBsZVhtanBTemlyYW5yTnhx?=
 =?utf-8?B?NmNUeklFWnhVdzJ1R3hGUlR3TFBIbXFjQWtVRkEzckx1RHppUDc1R0lEUkpj?=
 =?utf-8?B?SGVwWXhCaUxTL2pxdjUxZTQ2UFhvazBVWmZVU1hQdHkyaVZOMkFQQktoQmd6?=
 =?utf-8?B?cERsb3JkTU5OUCtVTzh2VkJkbmtlUEUzTm9CVm82eC9pSzdWQnoydUx0bjky?=
 =?utf-8?B?UnRUWEN2UEJqV1lncG9oQldGY3luVkZGWHgxalVyVHBRTDlGMU9xVTNTV2N4?=
 =?utf-8?B?Zk5yVHY4UEVHNzNodzZCWThxcTVRK3hWVEVxeWtTVWpCc1Q5bktLekxtUGtk?=
 =?utf-8?B?ekxHY0x4aHpVZjJaZVp4dCthUVhHYkpTYkpKL1Q0V3pDcHhabmsxTjIxL1Zk?=
 =?utf-8?B?Q2ZzQ3BLUkxLTTZPbkdUUEd5SjcvejBtWG4zYVNPdThNamlzWEhweWN4RjBa?=
 =?utf-8?B?Q1habGRrbEFrbm9nYmVZckVjRThaaE9udXh3Q2sxenlqUzE2a3BrY0dwR2da?=
 =?utf-8?B?akY3VjV2Z0tGc2tUT3NQYktJOWtVZXVSTVg0THJrOGxVcHZCOVNXdFhudnJD?=
 =?utf-8?B?aU5yRmFCMkRLaXJacmZmUWt5SDAzbmpTQmNHUHRTT0tUNUVVNlI3b3JscXll?=
 =?utf-8?B?TDVYTGp0cFBTUWcwajJ3S1FtV0tHMjZTdlhGeXBZekxzbkYrY3h1N3BJRFVy?=
 =?utf-8?B?WFgzQkllZzZTaUp2aXJRRTRPRG9BMmtEbkdzM0VUak55VnJNVlBPeEMyZGtl?=
 =?utf-8?B?dnovcEM2S2NweUVBNFFYMlhobzl3Y1NOc3pBWmFQb3l0UGZvVlBvK1FXdXFq?=
 =?utf-8?B?N2R0Z1hGS3ZzdWFiQlNzeFVNN24rRFVtODF4S1BiY0xkS0ZJcEx4R05sdnkv?=
 =?utf-8?B?MjJkNUY2ck9SWVBETjJPZ2JYdGxPUXZ3cmQ5K3lEN1dDanFUSUwxVzIrNFFv?=
 =?utf-8?B?UkRLWFZuSlpVM0N3VGNOd2M3aE1iSTkrYWdGMHQwYlF4S3MwY3ZIb0hKd0pC?=
 =?utf-8?B?MkRaUTRtT2cvMUt6VDJERHhTQy92OWg4MllWTlZqUWorRFpqWjF2SkhDZVdw?=
 =?utf-8?B?dFN0eHZHeEV4enFURUZHNTJteUx5Y2U2Wi9ubjJPRWIyQStILzFVdUQrc2VG?=
 =?utf-8?B?amtUbWZNQktubW1WN0NvZ3NrQk94NEN1L3laU21vM05jV0FrR3RIRy84dzdB?=
 =?utf-8?B?dXltZEJmL1BITTJaMmV3WTRxejZZWjZ5MUErRVV2dXdNQmw5OWtVdmJRWSsw?=
 =?utf-8?B?TFBmUktLYy9HL1BJSmFiSVJ3THBLZElVVTF4bjYrL05wTDFad2lvNVBHYlRz?=
 =?utf-8?B?TkFUb0hRVXNzWlRXUmhzcklJZi84RmdEdE1rTG1ybEk0czFCN0ltVDl4b1My?=
 =?utf-8?B?Vm9BSCsrVXdCUjkxRnBoUTBFSUZQOUFMWHZhYVBlZDYvVGhOaVp0OGZNSUFo?=
 =?utf-8?B?MWV2SG85YjNVa2F6d251WTZaWHozcytuV3NKeFVqOXRBU1RSVS9sbm9uS0dt?=
 =?utf-8?B?NXlpdUY3aktLOVdYaStMVFUwNjlKVmg0b2p3VUNjc0JhTVErWHBIdk1LYUJh?=
 =?utf-8?B?Umd3RVZTOWtMR1R1YzBTbXJaWnZvSE9IS2lHbnBIamVkUWFoMk5pdTdnKytG?=
 =?utf-8?B?Z0o1bzZxMENRSzMwWitjVU1vN1JuUVJGSXVYd1F4TkxDVnhtWDZIb0h5b1FE?=
 =?utf-8?B?Qm1JUEtldnhzQzgrdnhLRWhjKytHcE96QW9mYk1LTjZQdndZOVdDOG5xVEVZ?=
 =?utf-8?Q?jKPOx+6/0W6yvpLg=3D?=
X-Exchange-RoutingPolicyChecked: kROiGBaGd8QzXwn6jEkE7+c+SKQ9n8Y6dofLVbwc7tGG6i2fs/XkvTRsYKc6EKNUM/kbYE3G2VuPs6wMg5vvxE8c+cPSYKVUa8uHHzPJKre+Aj7xI+8llFe7JEVtukX1so/s8JbZ4oD4duxoz6PGcKiit4tgVyciufMYtdCdZmRZVLnwkSfs1nCy2azSr2/RAXlX6G3iRDqDndq/47VTWKwMzzT2H2cXall/ohvN43/3wsjh8YrVilJLuyYUt5yNopeMvYfGOZEXbeJ89AGXf79pVhA9pkaychTxGSNWSWhpEb7lcDphePZ62QLt4PU8vKTRjYn8QEzLDLp0FxI1qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1394a2-d284-464f-3a93-08df0ee5cd09
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:47:06.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2Nbqj40L1Q7UjN5Qx0CRx533qhW6/1BdDCdtdQRT7ZX8dyNInRCj0/piduBswJwJdjIiqUA29vfI44AjOoQ9LSceszIkPNVg81vh7qB9jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
X-OriginatorOrg: intel.com


On 9/8/2026 12:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Spurious state mismatch warnings for dip.emp_as_sdp_tl due to unconditional hardware readout of stale register values.
> - [Medium] Unconditional fastset check for `dip.emp_as_sdp_tl` breaks seamless Link Refresh Rate (LRR) updates, forcing heavy full modesets.
> --
>
> commit fdc12bb4795c43a7d04cbec4746e152e2a99a6d8
> Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> drm/i915/dip: Store and use AS SDP transmission line from crtc state
>
> This commit moves the computation of the Adaptive Sync SDP transmission
> line from programming time to the crtc state computation phase. It stores
> the value in the crtc state to be used when programming the EMP_AS_SDP_TL
> register, preparing for programmable transmission lines for other DP SDPs.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> [ ... ]
>> @@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>>   	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
>> +	intel_dip_sdp_transmission_line_get_config(pipe_config);
> [Severity: Medium]
> Could this unconditional hardware readout capture stale values and cause
> spurious state mismatch warnings?
>
> intel_dip_sdp_transmission_line_get_config() unconditionally reads the
> EMP_AS_SDP_TL hardware register. If the encoder is HDMI, or if VRR was
> disabled, the computed software state leaves dip.emp_as_sdp_tl = 0.
>
> However, when VRR is disabled, intel_vrr_set_transcoder_timings() in
> drivers/gpu/drm/i915/display/intel_vrr.c returns early and never clears
> EMP_AS_SDP_TL. This leaves a stale non-zero value in the hardware register
> from a previous DP modeset.
>
> Could this mismatch cause intel_pipe_config_compare() to fail, incorrectly
> forcing an unnecessary full modeset instead of a fastset?

intel_vrr_possible() (vrr.flipline) can only be 0 via !HAS_VRR(display) 
or an interlaced mode.

On every HAS_EMP_AS_SDP_TL-capable platform, intel_vrr_possible() is 
true since:

- HAS_VRR() is true for those platforms

- interlace modes are not supported on those platforms.

flipline gets set (non-zero) in both the VRR and fixed-refresh-rate 
branches of intel_vrr_compute_config(), so it's non-zero regardless of 
encoder type or whether VRR is actually enabled.

The early-return path is unreachable, so no fix is needed here.


>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> [ ... ]
>> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
>> +{
>> +	crtc_state->dip.emp_as_sdp_tl = intel_dip_get_as_sdp_transmission_line(crtc_state);
>> +}
> [Severity: Medium]
> Does computing and checking this transmission line state break seamless
> Link Refresh Rate (LRR) updates?
>
> LRR is designed to perform seamless refresh rate transitions without screen
> blanking. The intel_pipe_config_compare() function in intel_display.c
> ignores vrr.vsync_start differences during a fastset because it is
> explicitly guarded by an if (!fastset) condition.
>
> Because dip.emp_as_sdp_tl is computed directly from vrr.vsync_start, and
> its corresponding state check (PIPE_CONF_CHECK_I) runs outside the
> !fastset block, an LRR transition that naturally alters the vtotal and
> vsync_start will produce a mismatch.
>
> Will this erroneously fail the fastset check and force a heavy full modeset
> instead of a seamless transition?


hmm the dip.emp_as_sdp_tl and other cmn_sdp_tl can change on the fly, so 
makes sense to put them under !fastset check.


Thanks & Regards,

Ankit


>
>> +
>> +void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
>> +{
>> +	crtc_state->dip.emp_as_sdp_tl = intel_dip_read_emp_as_sdp_tl(crtc_state);
>>   }
