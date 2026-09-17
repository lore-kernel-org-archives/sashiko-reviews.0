Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C144BB7F0
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642953; cv=fail; b=jnMnH/1wDvq7q9JoQ6LE8Y0pK88nPK1bYrIQXHhgVg8OYWbvs6LB89H9HiPhHC5N2Zq5XlxpTaz5BVyOxogt0Z/N2en5AOIoolREqPtpUysrJCuQQLi1RbDgoYOB3QdINfuctCPD03tLVLNPm/L/XptnniW7VBC0PsoBW/4u1Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642953; c=relaxed/simple;
	bh=EZpVu4Sq74uRY4Rj4Z41QCqE68r3ZG+RAy+2VIdWFNY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U7bmWYR7oYuwD4BKXIhCn+Wono8osWVqIKba+FJAhrrZcuUb/J4eIUdWApTDGocyHQK0sa5Mrt2snb7F5TgHTZCe0W78srHLOY9WxMsUFuHgMV6gb5nk38OgkzVeAqPNSKDfmrObTEOGSfsCabpN1KpYyEyFMRzw7we1BE3XRts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDbpbvRM; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDbpbvRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789642946; x=1821178946;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EZpVu4Sq74uRY4Rj4Z41QCqE68r3ZG+RAy+2VIdWFNY=;
  b=ZDbpbvRM8BJRTxa5gTgdO32afeCC/IY8eiBvj8Yoi88cFWU+1dJANU/J
   piqToREcDlEkaU0Yo75gHRoPwg0LY2xXdyUzFELb1PoCz6H/Txu0X3KI2
   l+K5AdhvnXICacgoJlcqnS3SsPo4DCEtM332xCuUxMxQ6ehl0MQ7M+Sae
   EXxRXMqRkwRaz9l9jnyHayDNg51Q29QpzzVvbp3WDdMk6GI+PjsRpWlJX
   N2sn3wZKNOpZ0sku6FdIR1OP8e6RrVn8yUglUut2uvp/Z0pOidrhdFF4X
   E5fK+UdlYxGYaQf4yROmKpcLWrcOuq/XRrU4ha8WOV8PAb060gL3snvjY
   A==;
X-CSE-ConnectionGUID: ooVJ/TxdRpSWENt2FvHtzA==
X-CSE-MsgGUID: 3GYvJ4qCTEOT4tO769m6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101396887"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101396887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:02:23 -0700
X-CSE-ConnectionGUID: b2s/nV9PQSqEg1cpRxK9QQ==
X-CSE-MsgGUID: onCt/phbRp6znDcOkx2PFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270038371"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:02:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:02:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 04:02:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDIdak1MBaEaEhU5scqlglWAiusjy2SKU4BGzlDlnOC3nQ9YEsQngV66uTSr1RT7N8QRv2j2fh6Yome5t5hjAPHLvHLi7XSDIqG4NlpEE//5rSRc66BTbB81IXKbLURQkvb0mCiQcdgNdAOA1SLNZ9dVDu1qpfPeFooVMDxSmz6BNdPILssMgyqQwS4lhYpV5qwEZ8A1GSsJH/emNkpYVqsFZDe4XCeZyytRNfMDglin0ViX7wP2vWMSHgrP6+O/AKTtf6ChEForsiffaSleb1ERSjVFWaqVf8GAhL9TKYm8GGrrcTBxxr5BtJMbj7o9lPb4k469NEdVFszGGJB0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+69SlANZ0CH4mzznqwkoRxPWyZdudfNqY8LzyUsd+c=;
 b=bF6UjQ9b4DcUz3InV6EUfMGJjGSzDQWNTl4FgOtGFswQztVLEpt51wcKUC9aLovUMwCHf0IemrVkLi8yCCHNA78zMh33QVB7QighSaw5jzvt0zbiRh/ZPPRUbQSAFCEZozNBbOmCHJ2eLGsKBbCQbVEeW+Ubp0LYtpADllMhfjjLTEdDqlta4W+ea9pWPHkblAACuP2jdi36mu/zvtBzImoHBTbmalIBtlOmIKwGMn0jrCkYpKZH9lAMWaqFXY9iQXAt5U4uwOZ/7hDPXpPXA6P2ypG7BXOceIrjEd2UptEZOZmkczCxljxu7AFkBFBhRYUyfBCuEUFI/hfaPJKY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 11:02:13 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 11:02:13 +0000
Message-ID: <97a908e5-3aed-4ce0-bf84-36f2d99d650e@intel.com>
Date: Thu, 17 Sep 2026 16:32:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/hwmon: Detect unavailable temperature
 sensors
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-2-karthik.poosa@intel.com>
 <20260910184244.1DA8A1F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260910184244.1DA8A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: a9179881-70ee-4277-17fe-08df14ab207c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 6c7AyJa+sjgX7swprgxxahQ/6OP9MZvhP84VWOP6tVEaJyc545aW1XxD2E/Zo20i91yBVjLpX9dZ582gY8i5Wm+w4cwzqiRbV9l4tiCSoDMzGVfI/pLkGXHWgWCyDH7rCUA2POZ8LuoogLm9fhQ46XJDvaCoKIsKkxLNwfm2TDcqtmSeZDG1JO4/ddCG8Q6tRX1mBfg8Hg+7GlA599rLmmqoVt84F8z7Xw+XL2tFFHsU7fBX5sbb5r9dKnTImdedpGaGOvgyXpmlnDg4bSxHs2WihAesHmxnlc0/efR5MR772uIOyd3XirWLxC7hE04I41Kh4Uez4WAtaNR5c1+aBiMWzvbezAdL69AadHlqnZYU9OA2LqM+Xg90bJ8vc0UTR1Idr/8EVeKMiuCD8RoT5TlSJzptdUvrkeowYFqvX+bARQFDPiDgoJ1lsfGC33I8W1+uKboPH7x4GEcNSLEtQF07EaqVi4KmJDKSDL5wHuZ1zqD//AhRbQYVFwczrOLezgkSnh0bipAawg4vUNQFf2AOY8XiOQu3lAxYcsbT/uZkbd0EXxWlAU51JlozcxUnzT9EtHw7i5OUUB3KJF8bURHE2O5UEpVqjeAzm3I6YoucEmEp7jiPRlk4bw+uwRciiPY77FqGm8XVopAJt6SILhBNg9j4UIytOg9DpjtnbFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlAyYlM3QW00MHBndy9uR1JNUWNCcjRmbCs2OVM4SXMvaWVLVU1EMS83U1FE?=
 =?utf-8?B?VGhSY05WMXppK0tWWjJRQk43bXNneGlLVFRRWFo5akl0dnF1ZlppYzZ3c1BZ?=
 =?utf-8?B?aEJ2YTlIT3VZMDh6TmdzV0F6MmFMOW4zb3lnZm5nanhmVytXQlc4SDM1bE1x?=
 =?utf-8?B?U3JCWkxvU3JQR21vOUN6Tk9kbnRmRE1tSnFabHJjS2JmdFdaWXpJOXNwb0E5?=
 =?utf-8?B?bUF4ODBTTG5KU3FBZjJTTWRydXhIV3Yra0J0aWtUanBHdFJXaFd6dmVrZGtU?=
 =?utf-8?B?eWtMS2JOQzc1QlF2WDJaOWhIbHVPVzUwOHZpSE9HY0t2VTB0ZjBVYW42YVdT?=
 =?utf-8?B?eFA3elMrNEVPUDFCcjA3elVGa3FSaVErSEFxdDBuWTY3ekpFd0VFeE5iWU43?=
 =?utf-8?B?c28zMFhVM1p5MGRZcWhOZTlmVXVwaUNwZ25jVy9EMjBzMGF5dXRPYWMxd3Zr?=
 =?utf-8?B?dldqdDM0OXYxTzUvYWd0TXRWMUhmOFRIeDdKUVk5cnVOV0x5anJxUGJzRDEz?=
 =?utf-8?B?amdEb3U2S2xCOWUzdEl6STVkWUZNaTY3QXJjZkFJYmNlM2VPTHpBTWNSdXdp?=
 =?utf-8?B?dC8zUUM4YUc5dFJuelY0UHNnNjNTNFBZMzFVUkN0WUo0aFViY1c2TkF2NCsx?=
 =?utf-8?B?dXNTVi9YZ3lDbjdha1ZMUGZtaStCTFZwU0FBanhZTUVCa2gzcmZmNjB1clhG?=
 =?utf-8?B?dENWNm5tcUdxdVBoSjRZOVFYQ2puNGgrbTFRRWxJUTlNSFpZU3h3NXF0enZ3?=
 =?utf-8?B?c1JpZnQwTkl5MTdkYUJ5aklaS2xobXV3azBGclJhdklJbENiUlVyWE84SlFE?=
 =?utf-8?B?aFRDOFVFcG5nUUtraEpUWkU1TGZvdXlKTnMyRzFqaVFob0NCdDVrdWNyNkNE?=
 =?utf-8?B?YmFBNWJMaWlwMUtOU2xpV1g1R1paQ0xPd0J5NFVyb0p1SnlwdlJmckdFNkFB?=
 =?utf-8?B?YWlpVnZpQzg3YTlLbDQxK1BWTHRHLzdSNis2UGRhSVdFWGEwYlpxd2dEK1hy?=
 =?utf-8?B?TkwrZTB4UlNram1vUWdmNWpIalRrcndrR3pJRXlKZTV1S09KY295TjYwcjNQ?=
 =?utf-8?B?NUxmQUpQT1BPaUZ6bE5ZVWJhTUpKckY5Z3dSQUxjb1VnNytrVkZ6NE1ueHZu?=
 =?utf-8?B?SmFZbGxzUzdXQXR1blAwWEo0NWplbGQ5K2Q0NDFPUFYxWE5TM09xS1FYNFFz?=
 =?utf-8?B?bmVjNGVyZkdoSWI5N3RlVXhXSG1VYTV1VllaRG9nWWhIYnBCRGMwSDYvbm5H?=
 =?utf-8?B?cGZFRjlMM2FERnVWbFk4UTRqb0RvVjh5eVloQ3g5U1FKdlNiMWF1UlVMdk9p?=
 =?utf-8?B?aGJrUSt4RkIzOGpSakV3Zi9QOHJLTGszWjNXME85OWtucSt0eFZQWlVISHBV?=
 =?utf-8?B?ZzZyZDBFUEZzbG1pcFJHQVNpRERtVWlrdlNIaFFkcWF4ZnlqektEeDY3OXB0?=
 =?utf-8?B?cDFZS0RwS0gyS0h1OXB5djJLV2hrck9hYi8wQVhYeTU4Z3FkMlV1aGdQdFNs?=
 =?utf-8?B?WVBjSm8xTG5vbDEvRWFyOGlEMUJ3YTIvOGd1eng3dUJ2djVjZmVWK05iLy9s?=
 =?utf-8?B?bmtiUTNWYkNyVmZGWEVNWEVoYlZSWVlJSTFGTy9oUUpaZktHeUJzVjhHN0I0?=
 =?utf-8?B?azdPTHdsd21UYVVldFRZU3NWMUVrWUFMVkpjVmh6a2FHdjE1aWFXRzBCZXpS?=
 =?utf-8?B?eWM5aGRQWmdDRDRYUWE5aXhqcEtwZTd4QnpOcENHcDZxSzBMQ0hORXdKWDFI?=
 =?utf-8?B?cm50VkExMUdiSkI4VDh5M3djc0FxbjVrbEZvN3J1UkcrRGdxZDA0anhFS3N4?=
 =?utf-8?B?citUejIxVDZXSVRiVmJsWHJkcU9GeGhQU2Nsb0s4ZCtRYjRwQWxremRiQmV2?=
 =?utf-8?B?L0ZObVVjYllmWU13NktjbXloNkxZT1F3a2g5OGpxOWcrTmxjUlh3REtoWURM?=
 =?utf-8?B?MWdVYWpVczZqU0IxV1U2YmJpU2hWS0VxUS80amlyM2ZFMEJDZ2ZWMXJSNi9i?=
 =?utf-8?B?OXBKS0h2ZU1vZHd3U1k0SUpYaHZlSG1jc2xuSHE4TTJOVUpNaUw5NFowMzNl?=
 =?utf-8?B?UVgzMExJcG1uQWZIT1JsZVZDbERLSGc5UGxJbUJpOWJCZHp1K1B5NFpGcjBs?=
 =?utf-8?B?RzM0b012V0hJOHJSOTYyYlVHTFBHajErTEZ1bVVUSVNBWU1BTGl5VnBNRDlP?=
 =?utf-8?B?NDRncGJ4ZnU2NDkwdmtpYzFTUHNFZ1J1THFFWVhseGtoSUV1N3ppNEw4OVBq?=
 =?utf-8?B?Rk0yUDQvbXRTVzQ4N2JiMzJ6MnBrTmkxdzNOVmwzK1IyTUdOSFNZVEtIc1BE?=
 =?utf-8?B?a3hPYTdrcVR6c0xEVHdsSEIxKzVzQW8yMEVVMHNUUGtWemF4WmZnZz09?=
X-Exchange-RoutingPolicyChecked: NAupMgHJWtrYhwTzNubAi83HqbP9ddtxUJ5Kt7oGlP8fKG9f+Fb8zXYhAoA2J8SYw/pDYpZngEGI35SzpJ62HDYn5ywbc685nbFkMtX7CUJBtUoxCgQ66Jv/e9omzbs4po645XdiWDiXcP580dvIz6yuFvP98kKXe5osJRxZGXwcL+Z8DhhVL3Ofw+KMok4eOwaOP6/eAbhFRX0d65tHhW/BHVdrGdzv1s9usKqTmrioOTUSx+Qz3qMxtpajDoi3gtDtWt2MP4ZT9SY6/lvyvm3X+85EpBD05wG5F8/ltIaAfWzu6nF2D49mjjHchOQDkSJN/5cuj7dabDyEonQOcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9179881-70ee-4277-17fe-08df14ab207c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:02:13.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9VLvNLGQLIKbLnkzZ38ZDbNEBAOnW79mVSkVj58dTE07NWuMILR46rIkMep65JLEAsXRKOrZ2pmPC2LoHzL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-OriginatorOrg: intel.com


On 11-09-2026 00:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Repeated fallible PCODE mailbox reads during sysfs attribute visibility checks block driver probe and can cause flaky attribute registration.
> - [Medium] Data race on `hwmon->temp.value` shared scratchpad buffer when `get_mc_temp()` is called lockless from sysfs callbacks.
> --
>
> commit daf20f08a8a78b5a377223b407b9b3a08568942e
> Author: Karthik Poosa <karthik.poosa@intel.com>
> Subject: drm/xe/hwmon: Detect unavailable temperature sensors
>
> This commit introduces is_temp_available() to validate sensor presence during
> sysfs attribute registration. It uses hwmon_temp_is_visible() to hide
> attributes for sensors that report invalid values, avoiding exposing
> unavailable sensors to userspace.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5284cab6703d8..faed2f5da3947 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> [ ... ]
>> +	case CHANNEL_MCTRL:
>> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>> +	case CHANNEL_PCIE:
>> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>> +	default:
>> +		return false;
>> +	}
>>   }
>>   
>>   static umode_t
>> @@ -973,14 +1019,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>> -		case CHANNEL_VRAM:
>> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>> +			return (is_temp_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
> [Severity: Medium]
> Is it safe to execute lockless hardware I/O from the sysfs visibility callback?
>
> The xe_hwmon_temp_is_visible callback executes get_mc_temp without holding
> hwmon->hwmon_lock. Because the sysfs core creates attributes one by one, an
> aggressive userspace process can open and read an early attribute as soon as
> it appears.
>
> This could trigger a concurrent lockless execution of get_mc_temp from
> xe_hwmon_temp_read while the sysfs core is still evaluating is_visible
> for subsequent attributes. Both threads would concurrently execute
> xe_pcode_read and perform unsynchronized writes to the shared
> hwmon->temp.value array. Could this lead to torn or corrupted temperature
> readings?
Yes, that could be an issue for get_mc_temp(). It uses hwmon->temp.value 
as shared scratch storage and can be reached from both 
xe_hwmon_temp_is_visible() and xe_hwmon_temp_read(), so those paths 
could overlap and observe a mixed snapshot.

xe_pcode_read() already serializes the mailbox transaction itself, but 
it does not protect the full get_mc_temp() sequence or the shared buffer.

We can address this by taking hwmon->hwmon_lock inside get_mc_temp().

>
> [Severity: Medium]
> Could these repeated hardware reads cause flaky attribute registration and slow
> down device probe?
>
> During hwmon_device_register_with_info, the sysfs core sequentially evaluates
> the is_visible callback for every attribute in a group. For CHANNEL_MCTRL and
> CHANNEL_PCIE, this now unconditionally executes blocking hardware mailbox reads
> (get_mc_temp and get_pcie_temp).
>
> If the PCU mailbox is busy and times out for a single attribute's check, that
> specific attribute might be silently omitted while others in the same channel
> are successfully created. Should the sensor availability be probed once and
> cached during initialization instead of evaluating it dynamically for every
> sysfs attribute?
Agree, for this we probe the temperature sensor availability once during 
registration and cache its state and use is it visible to avoid slow 
device probe.
>
