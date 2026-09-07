Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED24964F
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773935; cv=fail; b=O6j7FZrIJYjvtdayj+QNZb2XCCuuk0FC9CN5l6OIazkTQQ6Cj+yX5zL6VpjsuNujduG7dcZF2YB74Y4EBtNRZEpeegbpGC050FkYws3n+2KpVBaeeipjisgRT2TLFD6BkCZyxcFlMibFHbm3Vp3ypmGSyghnZyVGB9juTsojf+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773935; c=relaxed/simple;
	bh=6J0YacyZCtf8S9s3LJfg4wxsv9kkqj3y9japJNrUlHw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s1ZFCAo9XB7WK1oiZbmKSa7CjdX7XwkCG2u3W/+UuYK62BkPOpnT6KYU5nTO3INILfNTlaLZ0mgWO1pJY7++2xM+JmErpKrMh6xXx5e6UpkvqibTchLOGP31mJcVEwZtLXCv0iMaRiIDH0KP49LPIRK1u+t0YHfxzzHWuMzCg08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaQpfQIy; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaQpfQIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788773932; x=1820309932;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6J0YacyZCtf8S9s3LJfg4wxsv9kkqj3y9japJNrUlHw=;
  b=ZaQpfQIyWL0h9091rnvVeRDzAlRoIj4Dbwt2xY6hMu/YsCenXWYn2TzB
   OgF+vP/dY/lgh2ZOi0ROtQc8kll5J65/S3YR85rHn/FHn8h7wSHwSfsbt
   ncQlYY1XqmeseC+lrH/iT0g0fpYbl2WGq131ZB/j2i+wWrYxRyVbZ3qPm
   h4ZvjaKVMQKISXzG+EcrGrzPOxXsFtC4S3wjnH8Wty/1P8iUDl66bFz9Y
   FKwj2kZN6NZUzxYG18c7+EC/CY1KBOjGN2+j6emBGg+gVIOuAFb2Y3UVA
   ezW55ibVtyyu86ZwATPfvaEO3HdXseV96VhMGvSh7SpRMzyRnzb3VpEX4
   A==;
X-CSE-ConnectionGUID: EJiEWuG8QAOZpq+rKCthbg==
X-CSE-MsgGUID: VGV804hvSM67m7QImkx+1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89019438"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89019438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:38:52 -0700
X-CSE-ConnectionGUID: 8EEMtr38Sv+xqTBZCvFREg==
X-CSE-MsgGUID: yI3xV1z6TZaIgZBvBVbp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="264473996"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:38:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:38:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:38:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5UeKsvlWZb9y9CNtnoWX5FEJlOOU9ieqKWz8Q9yCWDuFf2ydNQmYIVLAb06sehMenavrv/CiVYDXGrm4fp5vA9a/aGY16NDONNZraYUXMkQK6wlIm+AVWAHt8Ityre7uXJQpO0iMLcg5DCwe8q4sH6ExygpQskQLiNZLY+IrPSXkcnflh2Dt0wxpRZO2zCM3NLozXcRuWK2pWzw5CwcAQ3F77tCg/sIIgGv0oCc6ghrUATpoYscTNtJbAC1S1Y0PPEWiq1/kmAulqNnW/F0CoWLPeC+ka43I7cLgqFjCL5nDcA7RbWypJM/MjNvfYbGjkUtjziu3NE6aE9xRX9+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14E5V+oAFfvO290RCvxTW1zdGS7BEaOh53TTFLfNQrU=;
 b=syP1Wih1vLglhra/kSbKBqJpzgkLyge9MlTKiTXSYembJvL4pR1Czqpdb+wI06yWhNmEknm2YA8BfrifY5rg3YE3sO0h8zfTNIiH69Hpm2POzW5Ch/Y5c9kwxPcdjV2WvcqsQvFSatMdGEXpiMtAXVwSDIhYj8VdsJRnlJsfz6HihqRjw1CAGMBn0I0eBYv8VxTZwfNBz9D4GFjh6rgRYy+JGyQLAbZDGJR0QlCoEErOzOFmFoxIqc0F+ScT2/SsQcurHN472x5ZAo3R7WugZdtDfTMcURqiDtIYji8V3rCyz7a9vgxWpoLsb/GrAyTuHgh1cTVjmSSoAsZb+iftZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ2PR11MB8498.namprd11.prod.outlook.com (2603:10b6:a03:56f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:38:48 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:38:48 +0000
Message-ID: <153bd423-fc59-406c-b87e-661b103f145b@intel.com>
Date: Mon, 7 Sep 2026 15:08:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-17-mallesh.koujalagi@intel.com>
 <20260831110741.2C3781F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260831110741.2C3781F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ2PR11MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 888bd1da-ba60-47e4-23e0-08df0cc3d10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TKoefmS4+icTi6QvFX/FbCKd+OEnfwyHier0Lji9JBdB4n/dbu2Mmz8fAqC5+LydzcgD9An0W61EkuzH8m0urZ2962ZfTsBfY1UfeaSTiefDmlCo/x8clzxbNNYufP4NE2lmKQmf3nHDzLucRClrWKSdnFl+OwaUGfHgo8FL+/m4qwys4FkANMjFLIMlVrLSe95lsjhrzqS4mGowCGVFlieBs8TcXDmjqRDcX+yZow1uvpGRPFam4Q6AcQG4a/S4fQ6x37dlRT115YD9yPBNyi3t27HDI47n6gikJJDyEWv+r3BkyZHsZE8XUVLtDcuTyXN7+ZwpqrV63N/bJgLPwQPR5ZJRtQm7py+9M7IHiBGOt4bO5H5Q1Ol0JYb63SQAL90kj+MfCxnMjhHFR00CdkbNU8+WLfXXMfLfpaTXmkUSZ0+ZeyPxp0jGNw+qd9eNYRR+/a1DvLMcZEyAWO9UHEUNr53YdVoyXfgNUfytxep21b8MqgpIIuPnuJ8Q5fiBn+WUfRoZx62YDjAvDUnXBvmGtaIRdkN9UFOmfWlMofwxfU6yydmIL9O1489J2MKBjVID1p5na6Z39wnN5pssMFeq1MlURU4Ryxr9r3UiGkMt506ck/+u8hgMZcfI5Imriv9wlhmNiCOgluzy9b2rmx+hZyWZgDXv1Jmd/Ne8cCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6207.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNkQngxQjJyYkw2WVF5UUtIWWFSMHd4WEovV3dZWlBaWjlRWVphWXdyN1da?=
 =?utf-8?B?U0Y0VTRIb3FScnhnS0R3RXMraEN3SjB5RVAvSTM0b3FMRFBFTm4rT0xiMHE0?=
 =?utf-8?B?MzNvT2VBMVV5djBxMkYxa0Y0Z0RMWnJlQW9XcG1nOGpXSDB5c05xMXV0NmRX?=
 =?utf-8?B?ZzFQaUJoT3NLNHF4VGtEOU5Qcno5eE14QlNSWVhaaHg2NUYzL2Q3clJGb1Rl?=
 =?utf-8?B?Z0FGMUhPSGRBUEI0amJEZnZEMitiRXJLRWVwWk8xOVEvWjZJMlFwNUs1UzVG?=
 =?utf-8?B?Tm1vTlR1ZGYydDNFdzM0U0FPendDMjJHU3psUjF4REw0RWFIVlRHN0J2Ry95?=
 =?utf-8?B?akZQQ3lZTm5ERG5uM3doenpGUStpZGlnVlJ1UmF4aWo4VWFtZUx2MktZVGU4?=
 =?utf-8?B?Y25Bci9VMFVOMThkMlpnaTI5TGpSSUFBam40ZEVxNHkrZ0VROGtLQUgrNlk4?=
 =?utf-8?B?SXg3eXBXTUJFTVhWeTUveERJL2MxRG1GSVgrT29tQzNZREZkbnFvZG51OWxY?=
 =?utf-8?B?UzBLbUYrOGJWQVZSelFuSVNmWFo0RlpGQ0N6RnpGdUx5KzNQaUpIYUVaK1lZ?=
 =?utf-8?B?QXQxVkRKQWtVV0lNQjZJbVpRczBUZ1RhY2E1UGNrbTExT2JVbDBMZXYxeUUv?=
 =?utf-8?B?L2x0a21OdTlOdHJXWDhHQjNaNU1GUHFISGVWN05YWGNZVU5nL0duRUhLWENu?=
 =?utf-8?B?L1JKK2phdXpUSXhQRFh3aS9TS2hNeEYya0I4Sk0yR3lJWFZIcmhRSVdhNUYr?=
 =?utf-8?B?NzJqbTEraWx6OGdLNVBNTkU2R1QwNUtBYWxjVExZYVZmRHJOVkhzTk9jc25y?=
 =?utf-8?B?M0NDa3ZjYVZwNUtVd0IvYXNRdHgycmduM2lwWE8zbUZmTWx2VU1remx0Uyty?=
 =?utf-8?B?UDhWVGIxYmlQSDU1RVpWdzQ2cmthWnJXQmhSODIzQm9tK3U3R3orZVBWRnpJ?=
 =?utf-8?B?dVlTZ1J1aDQ5bjQ5WDFYZmhmYWF6eExQNFVPWjBVSDRoRzk4ZkkwUTh0dFpT?=
 =?utf-8?B?ZnFkY3ovelF4dDUrUzBsSS96ME95NlNrajlrb2YwbmRhNjZLODR5clZXbndp?=
 =?utf-8?B?VE1GM0psMHpZTlBkSFduT3pCWlhvQi9ocmhoZ0MrNkFKV2tTVWpIZHFzZnJT?=
 =?utf-8?B?QkxOSm1JOHhZWHlqeWZmQ1RnUWhsZzF5bXdqVEs1clBwZ0VFY2M1Y0dkN2R1?=
 =?utf-8?B?QTJKRG4xd3I1akNCQ2JwWTRNSnhTRm9oR2J2VlVHbTNtUzRyM2phNGJ6bXdz?=
 =?utf-8?B?dXJjMys3TEQ2QXFnSXZ6eForQ0p3bGhkcGdLa1p0dmlJMHNKSEdKQVdNMTNr?=
 =?utf-8?B?Ry9BUE1MWmMwcnh6djc2dTVESEwzbVFMUTVnNGwzOVZhQWErUkU5QkpoNm1i?=
 =?utf-8?B?bUtnQmJ4WnhMUFVkeFUzRDcraFlrKzJBbkhNdE14SDN4ZkIxSmRnQ3QxQjkx?=
 =?utf-8?B?NlU2d1Q2Lzgxclg1MmZmQXV0NFBycFdnYWN6NG56WFgzbG1zcHNmNUc2SXlO?=
 =?utf-8?B?emFqcEtuTWkrMkZ4WW04d3JwU0REM2dPd202UzRRMnFhZmRmUHo5ZjRmWmh2?=
 =?utf-8?B?alRac0FFSEdpb3NqeEw2NUZ0SHpNK0hBUU15YnVIUDNJa1dneFJkWWh4K2tM?=
 =?utf-8?B?NFVJTDBBQTd5U1Q1UU9FTE9ZWnh2bW1HOXVHOXNTMWw4cnhZVVFDSWlva1V3?=
 =?utf-8?B?K2tCZk1veEEvZFZwNXYyZi9yVm1SUmhiRVlkYWYwR2dxU25xWlRYMVU0QjRJ?=
 =?utf-8?B?U2ZFbmpMeDdvY2hQWHN5T2NtNytFaHF1NzB0YmVJVm1HRDFwaDlNU0FNaHor?=
 =?utf-8?B?elk4TjJqazlTaHg0SGRlbUVseW8xL3ZOYXZvVk0wbnU2YW5DcjBCZmFVTVI3?=
 =?utf-8?B?Z0pySWRSYVd6dEIrcnBQdmpVaTZPbTgwL0prUnplNFpmZmlsSDhjNW05eVpG?=
 =?utf-8?B?Z2tDWmdYayszN2gyVXBZeVd4UFJ5eGJUaUw4alNpQ3J5RUpsRnV5Q3dZS3Ux?=
 =?utf-8?B?OXFnaTRxUVlUbWt5ZTNINGhRVzBoUjZGUDdwNDZsRkhraDBYa3QrOHIwYllF?=
 =?utf-8?B?cGdYQ0ZFd1JPVWxodFNiSVI5WklJaDdKVWhyL1hSWVRyUzZFYlpjdVhyOTM0?=
 =?utf-8?B?RklYUEl6WW9VUjFiRlZGMjBlbE9ydmcwd0ZoWFVjS2kyRXJsUHBxakpGSHQy?=
 =?utf-8?B?aHNEaFF0d1NDdUwzUmJJYUE3MTBkcnJMazZ5OEFnWjU0ckRhcVNHcVhlNFpt?=
 =?utf-8?B?ZGc4bVpBRitjOHI5OTllQXA3ckFvdkJLSXRGOVVVYURLWmYyN1V5bk5ydzJt?=
 =?utf-8?B?Q2pUZ25mQnNvNUxON0drR3QreldnZG9tZVg4UUN6eUVQOXRZamFOQ0UrU2FU?=
 =?utf-8?Q?ClXdUJEyQc6bN9Ko=3D?=
X-Exchange-RoutingPolicyChecked: hF6GuY74+8xn3jHUZZ5uZ2GwEFKD3aiT9PG+65MBB9HHp3GmhNjKB4Y90jIdbGzKI7TVUmIPoBXMHVGSOiin9+Ep9tma5yqv9c2t4KdfbcWcnL07DTN5AIj7rePbbrZqgufi4CgzGSLzQ+w4UW3bZXtvFfLI562VrBi7/nHaqMsVRVFePQ15+ttV5RUCn1gfZktObwD7Axd4a6VgRjEntlD5yjvXorQrXTj5E+NxGXi58WwOBKoSfKqlCPPcEbGUrgiFQcCQqOAJFHOfQm8l8dmaV/XwY9T376Ip7ijFn30lMHtCt007wyfUV0Mv5/vPOCODv8KuYGUeNzBcQC0cXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 888bd1da-ba60-47e4-23e0-08df0cc3d10c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:38:47.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tT8YMrmQS5jLgL1cUi1ubY7w68+1XRpEi4xqvfv4tfRv/yPtGAJ+wfl5pHKR5aEJ3AzXmyqX/cWHbC/lR/Yu7rq9nJHMFrj4sQG5BxsQ08o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8498
X-OriginatorOrg: intel.com


On 31-08-2026 04:37 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [Low] Incomplete migration to REG_FIELD_PREP() leaves packing logic inconsistent.
>
> Pre-existing issues:
> - [High] Hardware mailbox state machine lockup on oversized firmware response.
> - [High] Endianness corruption on Big Endian architectures due to memcpy followed by writel.
> --
>
> commit 44f13e369dbf9b94796ecb4d99fe19420e2a9d18
> Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()
>
> Use REG_FIELD_GET() when extracting fields from SysCtrl and
> application headers. This better reflects that the masks
> represent register-style bitfields and improves consistency.
>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 50bbdab072de6..3aa868f60b386 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>   } __packed;
>>   
>>   #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> [Severity: Low]
> Does this migration leave the packing logic inconsistent?
>
> In sysctrl_prepare_command(), the code continues to use FIELD_PREP() despite
> the getters being migrated to REG_FIELD_GET():
>
> 	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> 				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>
> Should this be updated to REG_FIELD_PREP() for a complete migration?
>
> [ ... ]
Noted, will update next revision.
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> index f0d5e3d7f5e31..5a3dd14e3a110 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>>   struct xe_sysctrl_mailbox_command;
>>   
>>   #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
> [Severity: Low]
> Does this incomplete migration leave xe_sysctrl_create_command() inconsistent?
>
> While the getters in the header are updated to REG_FIELD_GET(), the packing
> logic in xe_sysctrl_create_command() continues to use FIELD_PREP() for these
> same masks:
>
> 	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> 		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>
> Should this be updated to REG_FIELD_PREP() as well?
>
> [ ... ]
Noted, will address to next revision.
> [Severity: High]
> This is a pre-existing issue, but does sysctrl_receive_frames() leave the
> hardware mailbox state machine wedged if the firmware response is oversized?
>
> Looking at sysctrl_receive_frames() in drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:
>
> 	while (!done && remain) {
> 		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>
> 		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
> 					    &done);
> 		if (ret)
> 			return ret;
>
> 		remain -= frame_size;
> 		out += frame_size;
> 	}
>
> 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>
> 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
> 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
> 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>
> If the firmware sends a response larger than expected, the loop exits when
> remain reaches 0 even though the firmware indicates more frames are pending
> (done == false).
>
> The function then evaluates the header and returns without draining the
> remaining frames from the hardware.
>
> Does this leave the firmware stuck waiting for the host to clear
> SYSCTRL_MB_CTRL_RUN_BUSY_OUT, preventing any subsequent mailbox communication?
It's pre-existing issue. It's false positive, checked code author.
> [Severity: High]
> This is a pre-existing issue, but can this cause endianness corruption on
> Big Endian architectures?
>
> In sysctrl_write_frame() in drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:
>
> 	memcpy(val, frame, len);
>
> 	for (i = 0; i < dw; i++)
> 		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>
> A little-endian byte array is copied into a u32 array with memcpy() and then
> written with an endian-swapping MMIO accessor.
>
> On Big Endian platforms, the u32 value constructed via memcpy evaluates with
> its bytes logically reversed.
>
> When this is passed to xe_mmio_write32() (which performs a cpu_to_le32()
> conversion), the value is byte-swapped again, writing the bytes in reversed
> order.
>
> The same issue exists in reverse in sysctrl_read_frame():
>
> 	for (i = 0; i < dw; i++)
> 		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>
> 	memcpy(frame, val, len);
>
> Does this endian-swapped MMIO read being copied directly into a byte buffer
> via memcpy corrupt the response byte order on Big Endian?
It's pre-existing issue. Code works as per little-endian, confirm with 
code author.
