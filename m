Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76F3D9526
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549981; cv=fail; b=WXI1vZAl6cviLlodGHweddoS/vUb2H24XPMCiU8+vVbSAV7A8twIWdHJI2FF7Qh70kBzw2X9bkyE+Nhz7EFog+GpdK5u5W41G7CNO/5HJQr28T/vG2vwMvw/eHP2aEwBvGSqUt7luvHSGdnQmzj90gOaPaII+mRgQVBokx+mxYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549981; c=relaxed/simple;
	bh=IrsWrZR6kBFhdNIrvSonFBpotCn2/lY8mh/stUbSAxc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t3ks7y6MHOR6LZOtkwReLyqmWXg1ct7bWRAm5yBXa2kvn0j/1WpX953Cu8ymkWPD6XitV3a9Yv60zCMkM0zNvAuyceckfuCB+KNfLUi9bPX1bj7iPrCx43HOPgI6TQ8eQA83YX6bE5A4oEdiesc+zg5Q+tVje0GIAPpk4RmdFQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLSRauJg; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLSRauJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791549974; x=1823085974;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IrsWrZR6kBFhdNIrvSonFBpotCn2/lY8mh/stUbSAxc=;
  b=ZLSRauJgPjWeZMvZgrXiAYWeR5mKqt3L1mOg/XMZwrUC5xcClxAe/Zai
   Y4BP2jks4MOckRP2NS39NjIkMp1x2zsh4/J3UwctmZfUzF4zcq1CoTwfH
   v1NZ+Stk5naDWoxu9Hj89cQW6METZ5rgRUb1mb8z7ydGLrbwaapvyN5aG
   WJsxmjkQkRrjqhAgZ7fGTJATAHkEWZZkZpNnLNQ4+WCjlbQ8Pfz7UqcXr
   NmdixdypWoJCuhXtxVuOsjOGInEy6rFmovUTpyjJtDBzGDNjnCLUAE3ir
   y5SeTUr6FBo+uKJAk3rleU7DuO7fYdFe2XkfN1fal94lgW902feVcIdnG
   g==;
X-CSE-ConnectionGUID: NU/aWzz4Rfq3lRmOrRvB6w==
X-CSE-MsgGUID: QQEWwPGWQeuBtFfRqTymTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="359217"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="359217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:46:14 -0700
X-CSE-ConnectionGUID: SwrfS7fuQ9aBbS2trsGskQ==
X-CSE-MsgGUID: B7NCmNIJSlG5lSGdW4nG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="265562"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:46:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:46:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 05:46:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYQThksueTIFDecC9m8PUjF2639XCEL5K3z/dyl5pLg+Nzn2mgtLQ8lg4yxE27bPjMTJSmMA+LNzIhMkpI1UincRBHBOr4Znd4iPz7UgQyHO8irQvbZN4hHTKXRTuO/SVli0Wh79icfhLYKD0Znp7MagbtZRuFWifXmxHZPm67bl74tleM1nVZwIs6h+iXDCv/Ttad53dJMxzRBxtiNNJzUtr0P4VIIuTV+fTssNkqkO6d0uVqg8w3xAlAycMo1p+IXtFvERAH54r6mLoJbLn9XWg2gBnCr5PQMj1JttmfYGTB9pq19u31uUmG4ML6aJax/viqHBB8qyKGk9nuEfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+n8STQr7x+BPKW5qJa+p0qUjbc0iL2sXangOpziAoYk=;
 b=pNurNJ6dp4IesXKH7YT2RF91ReHpeiTTSt6ZNMQeGmtLLzvNDkPlNPWy2DUyKM3JeuYNeidnlHA9qQrkbkQ/cdQ9OzeDIqMUs0FgZoJ7P50tJyvoBLLqh2qLpDBP+Oc7P9TCGnqPami5tqTCqbk4vGMMZY13a+XmZeZozXdVz6VVSA4HIbHmXOQTLLTeUUOIGWtT5y6mUaaqSzKLY/fxtIf+IGILWVlLrhH2sXSeZmSHyFQUG4B0y9YycK3guIgfKdDDx2G7TDTFy9Q5RbsjSB6AOGdimITHDf5o1HUV+FZaOIwz0ZO7I3iaEFYHWGPOmuA1+PqMPUA15iZTS5FpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:46:04 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:46:04 +0000
Message-ID: <6b561918-fc55-4335-9a77-a4f2d62a7d81@intel.com>
Date: Fri, 9 Oct 2026 18:15:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-19-badal.nilawar@intel.com>
 <sashiko-outbox-165251@kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-165251@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0302.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::19) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7d75b3-9e0d-4e30-23f2-08df26034812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ToNSoVR6tdLt31fRdKXCu75BT4Gqw0QbSD2nliNaIgZ0vJUDGwn4sigsgEFdrvVo1HHP73Ss017kspMuCcymHRoaQvNrHibAydDdOLe4GMJL03/R1w6GbWp06+gilyaCYTG6+u/S/TzVTwV1a/YcbffGOzFY4pnuzv6X7eLoazM/sImrRiLl5ss1RgtkgmMT1F+8NsET7R+2ZkEHskF+WtMahXBPmn8SHTo48ae3pYvk6QaG1tu15/1XfKe65UJSkhDtYUSO4JY9wmIMXNuSd9mneGgMofQTHKtjqGLe6FvkVAqmQYG2ibBFDbxNwBVYh8tOXp81LOjnIjGAjtiw2FCSZNzbMF3DfuakRNKLYOwGea1cSZWdv3zAPSS0PneooOjQ+Bxl5DT7cePdZzc/PySp2Z2GJNMiF8CE3dTcOAi3K6TSSGEeuph2hwSFOCc5PCQvPg6MlLwwxcWbeKcyCjdmmZNrS0zECH/uDDmiBbQN9jT0Dw4EIJhEBOFw3SKxZPn7DCJMOGGqbzhoo8TaA+qh7Bt0ZBHWlBPYZrR/v20xQbLu2QQmYZjFPTZhL8YYj4J5jLSohPWM+K0GD79XoCarp9q9CY4oazDIeSSxjxl6wdV1ubhD7CMxs7oXsFU6B3FF2sniltTZujfYP75I5KloFgIPm6tNQt/NtGbej2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCt0ZVRaSGpzVVdUMmFLbTNDSThOemNtWFJSVmpIUGQzbWlQNks4WGN2cUFy?=
 =?utf-8?B?OWRwcURFR01odjdTU2FNbkswKytVMHRpdHhpWTRqclgwR2w5dEc5SSt3bS9T?=
 =?utf-8?B?bFg4V1NBUW8wZzBqTVAwVmJPTDVNdzY1Z1Bya1FjNi9TV3MyeENGMzVNUHRX?=
 =?utf-8?B?dFJ2cmZrVU9mdlpFbHpZZUQ3YnZPd2FDcjhpRFk3U0RYVHhZdGZsc0FFQndw?=
 =?utf-8?B?OThrZi9lUzl1VUR2NjVrem5manhGK282cUtqQjRKUlZaalo2dzhHYVNTVUNo?=
 =?utf-8?B?U0lSL2RxZ2YvLzllTnR5RjIxSVlpQUV1VlNReEVHOVluV3lNTHVsd09JTVlP?=
 =?utf-8?B?TVFrT3U3MnlZMmtuTDdBTzhoV1NNMjZ1ZmhUSVdseWE2QzBIS0tNN29oN3Yx?=
 =?utf-8?B?R21hUG5qUkxocEhwOU01L1hsaURVZGdUQWxMRXhkSmY4c241NGlQeENPSEFz?=
 =?utf-8?B?NGxWeG53aFFKcy9YTzBCUHNSV3ZMNE5wWW00N3ZjSGlKc2p2U1NZV2JBZ2d2?=
 =?utf-8?B?dUt1TW54TVU2TnRpM0s2UmdjQ0Nnd2ZxK3BSSEJsdThQMzN1WEdDYmQ2MWoy?=
 =?utf-8?B?L3JnOUgvUFJFam5qL0RPZ25YMkFXUTlHdVhlak5QenFyM1FhaUMyWGRXeWZP?=
 =?utf-8?B?cVVleGNIZGZjcGlBT2l5RCs2NFRRSDMzSnA1RThqL1Q0UjlpdzVvbEN2R2t1?=
 =?utf-8?B?NmtRcnpRYzhpRU96bjEzdURiTGV4aGkvY1ExTEd2UUpyMVpEZnZtWmdTbS93?=
 =?utf-8?B?SFRiRG15NFdjYUFlTStyaXc5Qk9EWk5uMG96T0tyYU9JblJUTGgrN1JkUzd6?=
 =?utf-8?B?emxTVEpENkFVNzJjSTI5M0cxUDBMZi9hK01nS0dIQUs5MnpRU2pEM0NGMzJE?=
 =?utf-8?B?cFVPUXU5NTdhVE9OdlVqSjA1RHl1M0h6ejJZaEVuNUNwbzZZNHBMRzZ5ZTVE?=
 =?utf-8?B?YTF0VCtWbnZ1bjZvWVh1Qm5odFJtbGFqdjFwa3NydGFEOWFmNXBPakRPbWxR?=
 =?utf-8?B?OWxERUtoRHN3elBtZFprZmNlRklZNEpTNzUrQkh2V002Y2dSdkw4ZkxKMkhO?=
 =?utf-8?B?QXQwa3VtVm9mMmJFZG8ydk1QSlNRRis4KzRyQTZsNWF6MVBVbVVBa05OTkFh?=
 =?utf-8?B?dFl1SGVBMU1UTU51bjYwRXV5c0c3MXlmSG9tN1ZFcVZXM1lsUE5NaWRtUVlW?=
 =?utf-8?B?YUtnZkh2bUUvbVdOTCtpdXRxcXJEVUdxK0s4QUVUSjUxcEFrQnVFaHQrTEEy?=
 =?utf-8?B?dGFYSFlLa1c1a2dWSzBBNHl1Nk5XOHRlVTAyWmNBa2p0SW5LSEZ6VDM0QUVJ?=
 =?utf-8?B?QWZrNlg2UDYxek1NdVVEclVyTkt6WXI2anZmSTBkWUt4ME91bXZ2R1dENmxB?=
 =?utf-8?B?VStsUkM4ZWtxbXU1cFFtbEExQ21QcXJ6MHkwNGRYK2RJSUVzcDlWLzl4Nmp0?=
 =?utf-8?B?QUJxeG8xN0hWc2lVcDFsY1RlWHUyZW5wQ2VHTkYzdm04Y05hK2VQNkFOa1lG?=
 =?utf-8?B?OW56NmRDOTdKZXhla0N4SVBNOXFiM1p2UjdKK3JyakRpc1MxWTYwYm1oNmRa?=
 =?utf-8?B?cTdUeWJXbzJqNjRBYVl3VlRkTlJCOGV4aUdiZi9HNGpsbFNVL0cyN1NwRU1h?=
 =?utf-8?B?N0VjZ2M2WEN1TWhKcGVMNTJYb0lFbUFZN1dhaThUcHdMeWZmTUxzN3IyU1Ev?=
 =?utf-8?B?ZTQyQ2tST2NJYU5DbVNPc2ZRZVl5M1NJZVhnSVN0RmI1aHMrSUl1RkhIR1U0?=
 =?utf-8?B?bmFHdFZ2RXhsNFhFcS8yTkdCZ3VIeExYVWRsQnZ5cEhxVGZGZnVyQjdFc2Np?=
 =?utf-8?B?SVo3MjJEa0xYU1MrQW52Mjl2N1lNd1JtN1FjOE5yTFVqVWUvREtQVU1wY0Nw?=
 =?utf-8?B?bUJxMkdkZ2h0WmRCanNxVEwzbWJrYU8reDBtSGZWOU5jR0RXWnAwUGUyR0ht?=
 =?utf-8?B?bWJKOEFMTDl2U2NObXJtbVdFNTBLeldTa2ppcHhad3B6MnhYSW9zRUNHR3pS?=
 =?utf-8?B?eklOU2VwWFZyWmxQejVwVGtaQ1lFbjJFenQ0WW5XMFpud0JobG4ySlRIVEZj?=
 =?utf-8?B?TitlKzF2Q0FDYkwrTTIzaTdJemVqOHQ4ejN2QUR5TjJNU25Za280cUhGZ3Q1?=
 =?utf-8?B?cno0cnBXeWRRN0xiZEpRenpvN3JON08wMEh2cFBJUHBPQzdLNkVxRkhjcEJL?=
 =?utf-8?B?bWk5SGNrTGNubWk4QVhReDdwQmhZWUwxR3hOajRENkZpcDNiWlpRandIK0Zh?=
 =?utf-8?B?clpSa3d2SW1KSDBxYk5WMnR2bm5ZZGZaaEtvRStVZmJHRGZjNDd0UG1xcTdU?=
 =?utf-8?B?ajkzKzJPWktheTVPVU5MUHRFT0NZeExqaEg4VHJHaldDK2tOVzlpZz09?=
X-Exchange-RoutingPolicyChecked: MonvfoORDJcaEjV42Zb3MjVDNCSr7DqAVVDBnoJjmIAzDpqVknCeCFJgiaHDJyIs4QWzyO7u3HmvbuhqMIK24pJr/354vn9dAa6hyFoW6JabyIuTdNm2jpO51ZUBm/XT153AiZglC2OyUHbU1sg2hmim7s/RpNFSeCGZ1ntCoE7GHHJ/rvoQK673CAAr6Wj31YJ/oOWnsUhul81TN0YmIp3vurj0JaIvAfeMya72qkhHKyGT7mOD0c7YVu6YqGTQ+D8JHfcrXxB7gjrconP9hyiq6aFpDyFGaIkCKioTKKyPvJtP0ZFz06pg8eq+r87RCW4F2go76OITlPrvABTdPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7d75b3-9e0d-4e30-23f2-08df26034812
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:46:04.8648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVefpw+Tp5a6/dHcYNUKBlgEv0jOO9syjA6f2mZtMcIobcq3HcMHwBoCFSaacm7/lF3Da3cQunIw0yWEsOOdYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
X-OriginatorOrg: intel.com


On 09-10-2026 16:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] xe_ras: missing validation of operation_status in get_info_queue_data
> --
>
> commit 7080ef5206c9792b353853f321f38646d98e4924
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/xe_ras: Add support to retrieve info queue data for CRI
>
> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
> a flat buffer. A follow-up patch will use this data to prepare the CPER
> error info.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 5cfc9beff8c13..900319938fe54 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> +static int get_info_queue_data(struct xe_device *xe,
>> +			       struct xe_ras_get_info_queue_request *req,
>> +			       struct xe_ras_get_info_queue_response *out)
>> +{
> [ ... ]
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +
>> +	hdr = &response.queue_response.header;
>> +	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
>> +	       response.operation_status, hdr->chunk_size, hdr->flags);
>> +
>> +	*out = response;
>> +	return 0;
>> +}
> [Severity: Medium]
> Does this code need to validate response.operation_status and return an error
> if the firmware operation failed?
>
> get_info_queue_data() executes the XE_SYSCTRL_CMD_GET_INFO_QUEUE mailbox
> command to fetch chunks from the firmware. The firmware response includes an
> operation_status field to indicate whether the request was successful or
> rejected (e.g., due to an invalid session ID or out-of-bounds offset).
>
> However, this only logs the status in a debug message and unconditionally
> returns 0 (success). Because it fails to return an error (such as converting
> the status via ras_status_to_errno()), the caller
> xe_ras_drain_info_queue_raw() will proceed to validate and process the
> payload. If the firmware did not populate the payload on error, it will
> contain zeroes or garbage, resulting in a confusing "invalid info queue
> chunk" warning or silent failure, rather than properly halting the fetch
> with the correct error code.

The firmware does not use operation_status for GET_INFO_QUEUE.

It should have been marked reserved like the other unused info queue 
fields, and I missed it in v4.

I'll mark it reserved in v5 and drop it from the debug print.

The field stays in the struct because the response layout is part of the 
firmware ABI.

Each chunk header is still validated by chunk_is_valid() (expected 
offset, non-zero size, bounds) before any data is copied, so a rejected 
or malformed response stops the drain.

Thanks,
Badal

>
