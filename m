Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C210F1
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847597; cv=fail; b=IjuuhE+2nwiBUxsT4LpM7KbSnsOpxB5saxk4fu4XdVq+J4CWpaqyPoNr6iq8VBnrt60cFwShUy4dLckEw/ZL7GqkA5t+2G8jPZLtCBypUaY/s9xyqNS1/H5SKNVjI20yK7314RWWaAzFJeI1Qn/r8spYHhYvvHbq81xg5jwER7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847597; c=relaxed/simple;
	bh=J2e3+G5TFrUfKxWjj6udoK7jYYxkE8RK5/UHzH3+7D4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BuzBagnZmvJHtxIX5Zb1Px93Y7a1H1knRsbooYaCMjE+BzzIyYLbvBe8Hw1dKZ9iHAEi/iREJ9G35y1wQWfo1CR/DwNdpSgQg9ctSXf9aUjbxTl+PX0pXrDUP55hUIlq34AGj/lLcAuxe2lE9hVracB4hXwVtsAE9JBRYJVosHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyEBh3wg; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyEBh3wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788847595; x=1820383595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J2e3+G5TFrUfKxWjj6udoK7jYYxkE8RK5/UHzH3+7D4=;
  b=cyEBh3wgvJlCrDTWPqW/wbnzeOlbzKGfTQD1rZUVB7casmhydIaafB5P
   qNhsCZJUsjDF+jr993gBVNe4MZLS++b9+DpcyJPRAFr5IqTWudD26vPO0
   ZmIb4AT/1D8EfmURpOoAkNjwblMP6PEt+tqGYVeA6I7Tj9XD37iT21PlY
   R2JzyurZ5zG1hXXJtYpAwl89iY0ZfYcPpJizBkdAqaSJb2AeiWhmzUWue
   XM2PbhjsmNS/IJIjNbzAv/Zb6soyza24OHmz2uE2BZp8QFp45pogAGP/j
   sNn26+v4I6PwoQ8UYMADlGY8Aarc0htatmltrxGj4ARFrz4QDM5sRgxbx
   Q==;
X-CSE-ConnectionGUID: RaRvpYxTT/6uvdcFQoMS9w==
X-CSE-MsgGUID: sDIbJxuCQ26qAu0A1iTtaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99573138"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99573138"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:06:34 -0700
X-CSE-ConnectionGUID: Kb0tnLFNTSeJ8pQOwtB85A==
X-CSE-MsgGUID: B18bYrllSuqfb+fYQpL2Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268311151"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:06:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:06:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:06:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLgIBhu/JL+n4hbriwuqahNEei+0LKDqm05Hm3mUMHS4nwrTSc2h4Vj6+hXJZecD4SvWHOQhEtQY1wdM6bfteRIUeuDCiSspzCgmFsnD6PASRnvHcgibL4lDKjdgwtm1fNX/hm3DJvRk0y+XEbpSSup4w4hxcgpx2uakCyvtywP6AwUIcWMfuju+wdTEDHmdSl8j9LTjbn/6xzcRyakGBVrWZhbjZHLugStDnYL6MQwMNlBD643H6aqZIZg7HLq0YISGqGPVqVtIdKnaj5TCZkuzgFnDMAsZD71T7vgNfIepmxbIeou/YdpZmAMmUEDFkfp5hFXS7U8dj++mLYwf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy3HjhONhyPF4A+kz9tCKWRorG99QKH7Fdcwwpaxeow=;
 b=cFGuGMuqAnvb5FRzgr2wUXubPn6ITboOWK7mNGPc3M3SoDY+EcNOrFGz2uf6K+mDJqKTaAtvAS7Mo20NosipzK8nVp4kVYQ0/+dnb0c+4a2pOsXwdle9zh3+OEjJqgjsmQ+lC7gxs+jDOH2m/esvgLGnbxHKxsirKKJgiukkW7v1myJbXgnOPaDN5Hc/XfJDpi3MLR5ddAphn4AYtOWOeIRIagIi5Xv0Yb76fI+ewUAYoKgjkz2yesNgTOYNb1OKKYnVsdPLEVuYtVb89KzhuNoYmTGwAgKLLWoRz5w/86AV9K3oL4Hd4kZrNrOrdGjQuVLlL6PAeUKjWVRbImHlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA3PR11MB9349.namprd11.prod.outlook.com (2603:10b6:208:571::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:06:29 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Tue, 8 Sep 2026
 06:06:29 +0000
Message-ID: <700408bf-660a-432f-8feb-1cd97da8fdc6@intel.com>
Date: Tue, 8 Sep 2026 11:36:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/hwmon: Use shared pcode default timeout for
 power limit write
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
 <20260907083520.192418-3-karthik.poosa@intel.com>
 <20260907084418.1720E1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260907084418.1720E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA3PR11MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: af4e32fc-a16f-48bc-dd8d-08df0d6f5275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IL7g3opLXV10+qLC0Kg5gTlNX56yyKKfo05zNGYuruGgUdaEjucz4R07rd0nGYTdRqE8Irrh/GZumZvGwwFuaoEMKONyZAWMugQoBQILhszv47gYpv4ZKF+HjPzwEGCNlY2dBblSzZY7957WGeqTLkL/Zi3FJnfB/h5TkgJ+oYFGZ1q6NyUaNhQU0QtKrk4d/O3bC5SeDqdf/Mi0aPvSE5hfLXLmlLhWHhj7te37JTVfoPCODJv2uOWk4i2XxYFp9O8gKwkG5U71JtclYZkvhZoJ6IAi1mxZlgNhz5px588lKvG8D6+36wehXxxZgLTAOrIEmnQqpgHyX9xkrrbrh49UwmqHaYAk4bg4ltuetMQRTkbXb7BzbsTClAOmMIDzbYgI2FwxiTKUTKEEWK2kXwylhEOk+pciVTW8GWF9F/W+RKykWO/bLGiP5KAmdGF0AnlhrGP4GXzrN7xXh4GWfidrimPEqUrdWUzrh/Zf7KzgxqZuGuMM8fe1o4BrZjCmUutcEykLRv3A/Lm1ojvh4g/KAzpNR+reWcovGL5LFb8dFAAXGMg0qZdNooIasGUUAPVhB18svTteeAKUm3619wkqNjz6EknKRbwOk1tyIzHAxB/s+BNhk8pTXdeiNIutwoAbxa45rzZ6Ee8dCJon5qpLMeS5L03mtceRN2z/aIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNhbE1tWGpWbWxHaTNmdmw2RUZlT3QwTk56dWJjRy9oUnlncTJsRzZTUysr?=
 =?utf-8?B?TTFBNTBWOFNoVGV5V2s5aEh1cDBMeDQvS1V3MTV5WHVjN1MyR3NudlJFZ29p?=
 =?utf-8?B?ZjAyUG1UT083cVQxZ0k5V2M4Z0RVR0xGb2dVMDJTUWFHUWNNcHpBSFBJeEpi?=
 =?utf-8?B?bHlxSWNiUmJpelg5UTNxcDV2cVVQenREZjJMSWMxMTNUSmRHU0N0Qmc2OG5H?=
 =?utf-8?B?MFo4T3JUMEQwWGZXWHcvd2hxdU9YeFdqK2lwWno1M3grWnNUZlJsZzdLcDlV?=
 =?utf-8?B?SlFsVllrVzJuVkU3Yzl0cDdEbVRCS2VRWWs2K0RJeWRYN3A3L1p2MjlNQzVa?=
 =?utf-8?B?eGdRT1l3Y2ZyeXI1M29kQzFKQmRxMDNHRTM3ZnRMYjBuSzJsRkVINU5DWEtF?=
 =?utf-8?B?ZG8rQldaaTA0a0RDNFVSQTVPblNHZHZVb1BNRkVBRitQQ0orMEg0b3c4S3kv?=
 =?utf-8?B?ZXhLR09abGpnbmxtYXhRSWZHU25MSEdzOXV5QUtKSWVSYnpBMElpMGdsZEFp?=
 =?utf-8?B?M0MwK00xMlhFaXJLWUp4UENpcDNMbVllN2tPODNvTCt0aDVsc3ozNjRDY2Ux?=
 =?utf-8?B?T0VJVUpUOGdqM05ja3EwMkc5Q1dQQlFHKy8vajRpVEpPRDIxaUpBbjRZR21T?=
 =?utf-8?B?R3l2NmdvWFBiVDd3YnhxcVNyeTFpcitRQmdlSEdhbFRLeURyYXdTKzdJZ25Z?=
 =?utf-8?B?MDJlcEphU0FGZ3U4blBNWWZud0VPNjJPOTFhc04zUnBaWk1INHgxWVgrRGNG?=
 =?utf-8?B?TlpzMVRXT214YUxvYlphQlZZSVZCbDhHSWh3ZXJWMTRGT0luTWU3ZVJqSlNk?=
 =?utf-8?B?bysxVVJxRG1vWmVSaytjNU1qeWkvUnlwQmFaSFJBRGJhVUFzc1NTMXVpTnlZ?=
 =?utf-8?B?ZzcrakRhTzEzd04yVWZFbnJoUVdNTlN2dTRGd2ExQUpzYVlzL2VMRE5QcDQ5?=
 =?utf-8?B?aVJiSHkvdTAxWldjaytFeHd1U3FvNURBOVFsbExnekxKUWFpUHpQSkFSVUZR?=
 =?utf-8?B?dFB1Wmd6WWhKbTI2RWlMS3loWE51YTdsWkEvL1h3RnR2dFNIQ1dMaFByb3BV?=
 =?utf-8?B?SWJ5TDFnK2Z2NVFRS3lTRjhMVlpCVHQ0NE9JZTQ2RGNFTXlQbU9xeGNENUF2?=
 =?utf-8?B?QUpzK0hmSTB6bUVRclJwMXRFYjgybXVieThVOThGTDJodlMvbE5hMU1Vckdo?=
 =?utf-8?B?a3ROaXFyOGZlQzNKTWQ1cHNCTlhWWGlGVTAwNkUzSHpKTnFJNHJMNll3QkM2?=
 =?utf-8?B?MGNXdlVHUG8zVUt5NkVHeUZWNWVoR21qanZhWC9WU0g3amNiem1SbXJVcjN0?=
 =?utf-8?B?NkdzalYyZG5FZS9DeGVDR0xsZ2IvUGFBY0w4cnBuYkVsWjhHekVQTDBrTWJY?=
 =?utf-8?B?d0J0MGNlMkhydEN0SWkvQmZKeVhMdFJQaUJKYVkycmZiN1c1SERJM0pDWm05?=
 =?utf-8?B?SkZWOHQ5VS9UTkY0blhKRHR1Vm82V2tqL2c2S3dPb085cUxmQkREMit6RWpD?=
 =?utf-8?B?OTYrOGNNOW12VFFmUjVTc3crQ1FFOHkzK3RVVmxWb0ZCNVhmNUpXMmhkaVFx?=
 =?utf-8?B?UGtMSjJvSHFZa3ZMbGMvaXA0SjdIOVk0OS9xbXZJMDBKSFZua2pGaGQ0N3Zs?=
 =?utf-8?B?aCtFYi9NamNoVnQvVXdmbkxIVWRoczVJK1lPY0twVVpTU3UrOXo2VjdnTDMw?=
 =?utf-8?B?U2FxSHRDcjNLWWpOVjBoY2w0WlMybDBKNHdnMU94RGx6bzJMWjcrZXBrZGpX?=
 =?utf-8?B?Q0VPYUVZSEpQWDVFNmlIVlpSUVpGRmI3bzUzb203TGpFV0twOGlSWmk2MHNo?=
 =?utf-8?B?QnZoT2l0OTNsMVJ1UGQ5UXVSZlFDZ3JtV1VDamJJTEZYTER1RzkyZ1pXUXdm?=
 =?utf-8?B?aUZIalI3VTVXdHRxQjRjcjhDdkw1NXNlRElmaWJRQytTOXdjTlpBUGVyK3ht?=
 =?utf-8?B?UUUvTWlvK0hSMG5GNGs4N0lkQUxLekl3NW1iNldSZ2dobW0wWDVYdjl5cnFJ?=
 =?utf-8?B?UTV5ZFdqSjB3akcvR1FvNGpLY1BnRTcxNm15MTZ6OFN5dnR0N1hXcVpKWUJI?=
 =?utf-8?B?ZHNybUdWbUlGUFp1djJXN0VwUlNrbW84bmxYZy8zRjRpQjRUSWkrdUttV2ZB?=
 =?utf-8?B?Nk1iT1JNRzRNRW1QejBJRjJ3cTg1SlNhUzNnNXNRaEc4MzhrdlpxMHVtNjVI?=
 =?utf-8?B?U211ZVh1c201WGlOV2VDbm9OLzZqeGNaMHlGRW1OeG1URmlSYk5hTkppcWhw?=
 =?utf-8?B?M0JaK3RqaGRJYktWUDNDbzU0Y1JoSVdyTzQ2UE1CeUh0QWlXbVRLYzRFSG5x?=
 =?utf-8?B?UExtS2k3UHdUVmxTNWlOUk9oSVN6elE2N1V1NU9Rd1RnR0huVDBVUT09?=
X-Exchange-RoutingPolicyChecked: SpZ5GBnVKjnTElwbWSNKc1kuC7+RkAvuvxcNUkzjyRjzilubqjLhbSTm7kDxe62GS0dOK9yy9PIr8Lywq+B8D4GGp4h9J9EJVUTr82siEuoiNUTCbS76uRD1TA3tFeRnr3iKdXn1pepW7zlUlBdKwZFgtw/oQyI1nURaNO8LhsZyCNxqiRPiJZl18lvha2QFgjhSxCX7SSItS+dFnw1q5Oe/tGl8M6jVfCDZZH9D4O+Mfko6I6Ic0xozASRgyYDe0VrKnnvOxSX7+Ib11V2WdmJrWxySUmF1E0NTMjHeNTWk7sEBBorJxAlX8n2ZaVTNRbJJYTE33FG4vx/osebKQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: af4e32fc-a16f-48bc-dd8d-08df0d6f5275
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:06:28.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1z7pixpM7a8DW+FRuvW9NZGFp+fK14i1YUgcfoQaMOPKhtnSusZURq0Xiuse1A8lYkPKUFzAL1z0/aXgKHFrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9349
X-OriginatorOrg: intel.com


On 07-09-2026 14:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Missing early return on PCODE mailbox read failure causes hardware misconfiguration and corruption of pcode registers.
> --
>
> commit d67ad2da2fb13ff7d9f642e82666f4e587b00a48
> Author: Karthik Poosa <karthik.poosa@intel.com>
> drm/xe/hwmon: Use shared pcode default timeout for power limit write
>
> This commit drops the local PL_WRITE_MBX_TIMEOUT_MS macro and uses the common
> PCODE_DEFAULT_TIMEOUT_MS for the power limit write mailbox command.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5284cab6703d8..5edeac961ec33 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -252,7 +247,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   							     (channel == CHANNEL_CARD) ?
>>   							     WRITE_PSYSGPU_POWER_LIMIT :
>>   							     WRITE_PACKAGE_POWER_LIMIT, 0),
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at the earlier read
> operation in xe_hwmon_pcode_rmw_power_limit() in drivers/gpu/drm/xe/xe_hwmon.c,
> is an early return missing upon read failure?
>
> If xe_pcode_read() encounters an error, such as a mailbox timeout, it logs a
> debug message but execution falls through without returning. The val0 and val1
> variables remain 0, and the read-modify-write operation is applied to them:
>
>          ret = xe_pcode_read(..., &val0, &val1);
>          if (ret)
>                  drm_dbg(...);
>
>          if (attr == PL1_HWMON_ATTR)
>                  val0 = (val0 & ~clr) | set;
>          else if (attr == PL2_HWMON_ATTR)
>                  val1 = (val1 & ~clr) | set;
>
> Can this fall-through cause the subsequent write to clear all other fields in
> the power limit registers, like time windows and enable bits, potentially
> leaving the hardware power configuration in a corrupted state?
Yes, this shall be addressed in separate patch.
>
>> -							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
>> +							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>>   			channel, val0, val1, ret);
