Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218424;
	b=cuwpFdHLJHt4VaSKuJu/yXT/ScPMHudX2hmzMZTIzTmQ1QlpRPxYb1ed8Lwlk5fwhFst
	 GFrnjweQqWZR3exocB2YvlYZkkKZorkHOMZuwmFckLS9d1t9cv48hg0WdlgY7eJt/HF2S
	 YwtyRuchQbx0r6OVTkOvy+azYBwmqR2qkwTlc8Kaj39je3g93Q28qs5InTTM8clQoAvQt
	 dfW94p19mKip3qdDW7jUmRlNcyPQoKX4zl2J4SEPteRLWexsuD4sKYeHt3w36HpMWoR2T
	 nVopBrGrP0mquCsuF4Az2fI4m5wLuGp3ngVny3plYg2VOmNw9x+k4X3bRs3g10PEHuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218424;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=R944DWw77XEiO3RvxAJ9Fs3O7jPZjGBDQnv1TyrknnI=;
	b=VkUsk4qlBK05GP6VIGZzrD6cnUvxkFKNKYOposOX8VcE4bZxF/v5Ewpy0fKPXtJAjrBm
	 iTQw4mKV60PFopyJeTjeXrmGhFDEm0m4r3yK+d/9WdnKV5STflhnA6PAKpuXICBXW0sOF
	 7W1XQi8EuB8qXMzStw1zGLKlCbF6RU0X9IzXSf6cYZAYmsrUTAFu1I6vDa8gShY9currT
	 JppqFljQRAtmg0RorcjiMCCfVM4FIqRyQQV/CJ2QcGEd0Ub8if91csUG6erMlbbd38jJf
	 TPI8QBFKODf+qVd0rNmCw8EsBB21MWiWKpmIOIQRIOKVc3aB+OnFbPeErPbv+B41zIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJYoGED3;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Axw7gt9P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D069606A698
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 23:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D069606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJYoGED3;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Axw7gt9P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795218421; x=1826754421;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nX73pLyqzzbTi+e/Ck+R3I6HVnuuVJzWXuzh0VUSAZA=;
  b=IJYoGED3TnS5bPSWJsj/T0NPFpcHG31I8KFtS9SSxRaUJDsJHx/TtYfj
   v8r7T60izbiK5R/zY4lHWWrc+Dm5JahzwXJuhL3V+iDVRwnV09/KhJ6Sm
   Gfnz/N5RSFEe7PmaCGjFbA+A72h4BesnDhEnA51NfTdph4/EyCQSU64/s
   zgz1ujupsAQXScxi7JNK7fl3CcpX5Q5HSGgTlmnEHzWZx4NXxmf6Iy7h5
   IVEukmfDeA5w04p6grM+cJhpRx/vXcbwZYpIr8jbMPPAazxPLkM4USeMc
   KSrT/9lkf4ar8q+vtCCcmfE7ZOKXA2TrQI2JZLpeYD0nUEmQc4HvDK6OD
   g==;
X-CSE-ConnectionGUID: CRpniXQGSpeCfKlHCPGGcg==
X-CSE-MsgGUID: x0esK/KmTU+l50f2osoxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4135995"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4135995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:47:01 -0800
X-CSE-ConnectionGUID: 7KfUSahUQbCtAGD+2SmeGA==
X-CSE-MsgGUID: agqld19gQTe5FV0KTsOSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10825949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:47:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:46:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 15:46:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:46:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFcobtArtUKT/pvc8wlDvWLVz16LonFNhPwexwkrPi60DIhEcvCLdwy3xchO2mk2Wr6gcAo4SwBsVqI2jIqtQu0FJeOyB1yPPAHPDSR5cefoFFLypHPK+I6H56XBluBHw2AnJFZqXZSybgqmey2qIsLVzNxuSx+pjCbsvJ9Xovz0hhVsdOaab3GWs7h9vEVH5oV0EodmYp33PYY7rU0co0QgXQsHFhIYozSDIF6CvvKx3jEALD57H2K3t9+KtjoPQ+7Ef/NHPmA2C6SVet5ROKZE8sG05jxoG8tSpVhrjQCY03A3BGF8t298+acJbRazA1EiUnJtqBnJgLUSLhrxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R944DWw77XEiO3RvxAJ9Fs3O7jPZjGBDQnv1TyrknnI=;
 b=d7wx8sXyrfXc3w/o/xX+k7bwNV6cWe8QV7PL9ODVMVrP5hauoSbO4O0zE42WNhc10cVMBIM+9ayI6iT03vVz88BLYWqbQGuyHfmTFTX8ecJqhiZd4La7sL/0k2RjCnFixnXcDNMmSoNKf+qjjJHfaCAZhdDNmoNCDX38WwIis/j4hkNteO3ZTPszZFDCrvFrOVZVCeb23LS+8iSx+6AEZg13HpmqNd+kVVJr8hcXPredrQdEkMFvWE5cdfoA5XcH0R4oGN0Dra8I2JGD14Vec6SakiABMF8gM40jMlxi/D51Vex9vKKVMMeRmK7DuvsYw2xZtl65ww/W7ulUglv8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R944DWw77XEiO3RvxAJ9Fs3O7jPZjGBDQnv1TyrknnI=;
 b=Axw7gt9PmP0xEhdv2h+MYjpB+60aQEwMAzoaR5wdhmz/vDZFoHV4jJHO1TSdlocSVYy4LdqseWw80zU7G5OSWjIbChvb6ohGzdzJnkGtVqjbpfxGFgm5I8Sw5G5trzF2HQUvWhELXcVSke7A/dvy81uMqhiwBI/RCBckX04xQJg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 23:46:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 23:46:56 +0000
Date: Fri, 20 Nov 2026 15:46:54 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 7/8] drm/xe/oa: Free the OA buffer and the stream
 after the stream destroy
Message-ID: <awDbrHW9fffriue7@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222265@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222265@kernel.org>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef08ade-cf60-48d9-d16c-08df47608faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|260925021311599003|261028144727099003|260925021911599003|261022105027099003|56012099006|11063799006|260925022911599003|10067099003|261009223027099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EbrA7Vlvs8HBkYEywnx5lnWLSfl+3FMm0N4XC4mxthYOATTVOdesW9UNV6ObYon+uOZdkS4KuLlzSMyW8wJaYrBg6+vHmUMbFLvCmKI6HvrogWMkgtA9NLI4llTXU7hqFpS0FvBusVOoKuem6QPSTGSIi1rBMZwTiI4X96z+hfIJWqcOf+B4Ncq5yyQ79WcFES2DrrYGsPMFw33jN2Fj/V6rgTVrkL6mnl9JeD+OicGGOzsT5VNmsPzGgDmJLHyBKl4dhQ+ttx6ae/HR4Qd1nabx8feIGtprYDftZ00uj9/19H+XHitQDQNE47SxtfNL+QHFf3xT8IBZTSNjohJe+3lKMBgvRQM3PvkNtKtNw2ONKunGSfx19m4ZkgEnq3oZS8vQEy2uDwuUDyD/hj/RBNASKdjucXNqdzy4WxOLSAw6cuNp5xlKT1UkwhmDPye4MqJi5HhzErfVa2Ahb2N08OfUaNRYpcs9lOQWaU1m3HeV3WiKreuyz8XI4zxQUbTlypsw5/xh2AO3WWS4Ne84LEDmD/xB2EnbZX52FXhdfsh2XsZ6qxNCY/JYt4CahkrGEkby4IpCb/1Nh4OF8xpid88K/2JkUl/vS77bajJX5A8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(260925021311599003)(261028144727099003)(260925021911599003)(261022105027099003)(56012099006)(11063799006)(260925022911599003)(10067099003)(261009223027099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC8xdUkzZ3o5Q1NUMDdwZHdZTWsrWE4zVC9rZEg5bFBUT1F0WWZoaXhYUmRj?=
 =?utf-8?B?NzdCL29Cckdtb09BdjFka3dDU3dZQUplMHh1UlVBNWRaWXNBTTFURTVEUHpF?=
 =?utf-8?B?WW1QYXBHN0FYVTROUDE2dDluTG1CSm1xajFxbkxScWxGb1R6c3FyeUNYUlpF?=
 =?utf-8?B?U0NzaWFrRXJKYWVCL0xES3pXM2dXU1R4MDdpbTMyZ3hjNzhsUi9XL3hKTHBs?=
 =?utf-8?B?clhjSGdWdXZKWDZyVHZMVGpRQUcrSFNZOWRYSG1hMkpWQUlHMmNxYXM0SWx6?=
 =?utf-8?B?TzIzYXpRb3RndFdiRUllTnRLdEhXbFMrMEVWZWVQdC81LzNmZjY1dzQwdC9o?=
 =?utf-8?B?VEJRcDZUMnpZY3V1bGROdkVkNy9jeDE3M2lVOTZZejJtSjBRQnJZdy93eXRJ?=
 =?utf-8?B?bXJZNFI0VVpNL2JtWFRhK1VsajJ3bGE5QmRxUXBtYXNrcHRJTWs2Q1ZXRUVZ?=
 =?utf-8?B?MnpycUdPSjRWaGV5VDBYenlpeWhSbndHemt2Vng3eER1R0hCZkxZemRjcDBh?=
 =?utf-8?B?UUtjaGRpYzVFRFR5NWZxcmo0Rm9TUTdFTDc4QTlYK0ZCYzFhaGxrUEg0dElx?=
 =?utf-8?B?RXhDdUxPVHRsQmlqNllIcnU1MkltdDlzWWFqSjRUSTA4OFc3Z08yeVphWFNh?=
 =?utf-8?B?d3JPRzV0U2JWUTk2Zmc5ck1Xd0J3V3B3VWtrSVE0UFBSTktTSnB6b3FGVGpD?=
 =?utf-8?B?YUxnSzlIVFQ4ODczZ0pqSDJyZnJqVEwzVndQWjVMR0x2OW8vb2laQTM0bjll?=
 =?utf-8?B?RDEwRGhKeHVPNEI0MmsybmVVL3ZWcHRlc2prM3B4bStzSWljUzNDYi80d2lX?=
 =?utf-8?B?VmY4N1FSSVZEbnRCMURRYUE1ZmYyNm1ib1BwU1VDdGxVUVd2eUU0NUZ1OGVC?=
 =?utf-8?B?WWR6WUxlaXhTK1FXTXFSdkhqVmJtdlR3K2k1UTg3Vks2Wm41QTlKQkRTdGN2?=
 =?utf-8?B?YTZDaklPR21HRG15dEtZMWpMc0JOQWVCSEFSTWtjUUJDbWxoS216TFFmamx1?=
 =?utf-8?B?Y0xZS1dCYkx2a042TzVQTytScGdsYVlyNHdUalVzWG9sM295QUU4MVd6ZS9k?=
 =?utf-8?B?YzY4dXU3TkJhVFBFYVYvN2hNK3BIZ2g0U05xcXRiOC9oNDE3T1lKN3BXR3RT?=
 =?utf-8?B?czBvUWVTVWRRRHZxZTVnSDV4akVQYm1QM2hrY2w3eDhLVnBGd05PQncyL1BR?=
 =?utf-8?B?RXVmSnFidTRzMzlROFFOYk1qOFE1K2J2ZnFVN24vZmkrejh3WEZkS3pTUmIv?=
 =?utf-8?B?YkJLM1d1OS8rQ0ppb2h5cm9BcFhvenFNQlBwdWlDWEZLcTFVMXlQL21BdTFF?=
 =?utf-8?B?NldMRDF1aUxKK3RnQjZkSEJaZ1Nod0NXdlNFVnZIaUlTSHRiMFNEdmRsQWNY?=
 =?utf-8?B?T3JQZzZnRWc0emNTK1JyS240MVBIRnduSUNGS3VMUmtDZ1F1eis1bENKTFM5?=
 =?utf-8?B?a0l6QXF3WncvTzNFM0oyTkdGYUpFdmpwaGlFU2FEU1UxM3B1VTFPK3VIWjRM?=
 =?utf-8?B?MHI4SHdueTMzUytoQi8vbTVPbU5hbXJqV2U4RldiT2VjRy9qQnlMYTUyNk8z?=
 =?utf-8?B?S0l0VTJiVnNoR1hhQ28vWUlOSXFZK3hFbFN1Wkp3elR6cWlKUFp4RFN1UHJM?=
 =?utf-8?B?YmRFU2dXbVc3OVB6b1JPQ3c1eVFXcHBIakhic1BPU3MyOVJNNXh2emVNN2Nz?=
 =?utf-8?B?UDhFMlBma05TQUhMeGpEajlqbHFTY2d5bFh6Y1FTNExpSG1WdTgrK3YybkNX?=
 =?utf-8?B?SmJFN0prNUE5WWFBT3UwRGs0UE5hRHpqQnljR2RQRDJRVzdUL2NrbFhONndI?=
 =?utf-8?B?L3pFTks4aEI3amdGdDRwc2xEekp3OVZMWHZsN0RkbWVuankrS0d4eHpRUEJ6?=
 =?utf-8?B?K2RwbW1Za05wTWJZazFlMDUvOS80bHI4UzlzZ0xodGYwRnlobG5uOWhCSUZU?=
 =?utf-8?B?YytRRFZBSW5ZT3RPc2hJOTVwME1MU1FRSXRDOEEyL2pBYUo1WmpHWE40b3d3?=
 =?utf-8?B?TThoNWs0RXdyWmlGdE5ZVXdkZ2x6Ny9jcVlrankrVGdNZGg5YVV5UEhBKzlQ?=
 =?utf-8?B?S1VlWGN2Vkl5WjZmeCtIYi9jS0k3U05haG5sUjF4RmROQkg2Mm1IbnRscExw?=
 =?utf-8?B?RUgrbWJJeFNvSEwrNkFIYkpmSzdWU3VKSzlmTWlnTU9qQkVOVXVRelZudmVM?=
 =?utf-8?B?ZS9SeDVMejNoT2VuSzlOWkdJb1FOR29YeGVxSC96Nk5LaVJqZnRTUkpiNXdC?=
 =?utf-8?B?MDJGNFliY0hNT3V6R0FMOFR0RmQ2TEwvOHRldUtMWHg4QzB1cUF2eUxNbVVn?=
 =?utf-8?B?WFpKNmpEeWhpMHRFaG1sVlFwY3NLTnE1bm93ZTZ1OFE0SlU1MzVGL2tyU1BM?=
 =?utf-8?Q?5b11Id8utvck16MI=3D?=
X-Exchange-RoutingPolicyChecked: GTeuWzMoj/4Fg5+/QAbKWv1XPZSefqx2H8XVcjVX4ZzHKE60dzMR169R0i9weYlxbzjJUn0wR7HF8Ft45bAUp1FOb3Z4KZM6FLyUmJU6H8yvkYeKtC++QkvN9aTC3aWHEMsM+/jxNWt0ifQC0n5+gMeHYxMvJ3paFPgUvctrreFKTvhg6M9nL5ItJfPeNtGuvcNGTHZbkwcLKsISS95DWrNvQ9dlgkcroHw0RpjKpepOF0xy78eAhfND2oSYxJmIgmNmHPwxq86HtD/I8V6bCTVJ8iG6AoYgFFrIMPmtGV3ojsDERswRdmYj+G8y1/9sBqWss22t5I39LKaRYZDT3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef08ade-cf60-48d9-d16c-08df47608faf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 23:46:56.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmSgqI0paalK/fj9zglZDmNItUceR0fb8rAzu/mH1UqKxup+jxLvxA6vh5edox6bw4Jp6It+yH2U7HRdLD4TvSoMDK+9iTtpAckdg4yqIOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 12:48:10AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential
>issue to consider:
>- [Medium] drm/xe/oa: xe_oa_free_oa_buffer() without rpm ref races with
>  D3cold evict
>--
>
>commit e0096ecf7691779fa66e916b1237581810b85b60
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Free the OA buffer and the stream after the stream destroy
>
>This commit moves freeing the OA buffer, destroying stream_lock, and
>freeing the stream structure from xe_oa_stream_destroy() and
>xe_oa_destroy_locked() to their callers, xe_oa_release() and the error
>path in xe_oa_stream_open_ioctl_locked().
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index f3eceeb34e7b6..223419347eb7b 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -929,8 +929,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>
>>  	WRITE_ONCE(u->exclusive_stream, NULL);
>>
>> -	mutex_destroy(&stream->stream_lock);
>> -
>>  	xe_oa_stream_drain(stream);
>>
>>  	if (stream->sample)
>> @@ -939,8 +937,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>  	xe_oa_disable_metric_set(stream);
>>  	xe_exec_queue_put(stream->k_exec_q);
>>
>> -	xe_oa_free_oa_buffer(stream);
>> -
>>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>  	xe_pm_runtime_put(stream->oa->xe);
>>
>> @@ -1772,7 +1768,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>>
>>  	drm_syncobj_put(stream->ufence_syncobj);
>>  	xe_pm_runtime_put(gt_to_xe(stream->gt));
>> -	kfree(stream);
>>  }
>>
>>  static int xe_oa_release(struct inode *inode, struct file *file)
>> @@ -1784,6 +1779,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>>  	xe_oa_destroy_locked(stream);
>>  	mutex_unlock(&gt->oa.gt_lock);
>>
>> +	xe_oa_free_oa_buffer(stream);
>> +	mutex_destroy(&stream->stream_lock);
>> +	kfree(stream);
>> +
>>  	/* Release the reference the OA stream kept on the driver */
>>  	drm_dev_put(&gt_to_xe(gt)->drm);
>>
>> @@ -2052,6 +2051,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>>  		xe_oa_disable_locked(stream);
>>  err_destroy:
>>  	xe_oa_stream_destroy(stream);
>> +	xe_oa_free_oa_buffer(stream);
>> +	mutex_destroy(&stream->stream_lock);
>>  err_free:
>>  	kfree(stream);
>>  err_syncobj:
>
>[Severity: Medium]
>Can calling xe_oa_free_oa_buffer() after the stream's runtime PM
>references have been dropped race with D3cold pinned-BO eviction and
>restoration?
>
>stream->oa_buffer.bo is pinned with XE_BO_FLAG_GGTT, which places it on
>xe->pinned.early.kernel_bo_present.  When D3cold is allowed,
>xe_pm_runtime_suspend() and xe_pm_runtime_resume() walk the pinned lists
>via xe_bo_apply_to_pinned(), which drops xe->pinned.lock before locking
>the BO:
>
>CPU0                              CPU1
>xe_oa_release()                   xe_pm_runtime_suspend()
>  xe_oa_destroy_locked()            xe_bo_evict_all()
>    xe_pm_runtime_put()               xe_bo_apply_to_pinned()
>                                        spin_lock(&xe->pinned.lock)
>                                        xe_bo_get(bo)
>                                        list_move_tail(&bo->pinned_link, ...)
>                                        spin_unlock(&xe->pinned.lock)
>  xe_oa_free_oa_buffer()
>    xe_bo_unpin_map_no_vm(bo)
>      xe_bo_lock(bo, false)
>      xe_bo_unpin(bo)
>      xe_bo_unlock(bo)
>                                        xe_bo_evict_pinned(bo)
>                                          xe_bo_lock(bo, false)
>                                          WARN_ON(!xe_bo_is_pinned(bo))
>                                            <-- returns -EINVAL
>
>If runtime suspend finishes first and a subsequent runtime resume races
>with xe_oa_free_oa_buffer() on platforms where mert_wa_14026633728 places
>the OA buffer in VRAM, xe_bo_restore_pinned() also reads bo->backup_obj
>before acquiring xe_bo_lock(bo, false), racing with xe_bo_unpin() freeing
>bo->backup_obj.

To resolve this, I would just drop patch 6 and let xe_oa_release free 
the buffer under runtime pm.

Thanks,
Umesh
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com?part=7
