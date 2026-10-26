Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793058504;
	b=bd62DT2LU9fA4WPlzGkLmqf4dWIZz0mQxG+sAevKJFG3FDnu2nAohahZmXgBSAipYcvi
	 VB5goTTt3C8/zO2Uh9G4OZUGXniTTamugQvNIt53q8I5aElqWXXbYo9ZGtfg8q84ZEVzi
	 UNEa/rlBy9Xz58Txze+UMqBrYpdr1XsvyD6YOqZ+mM+CrIHcbNOSxVGwV1CYky2qgN1re
	 WeqhJPhrGz+r6ZL3KNSI6zpNjcA7o0Aw7cs+dqQfCdc+WoPUfECgXObccyltOQbiCnjsJ
	 20BLApMl/ADzzIibqu1hiLRJ6omdsRoHNgsIe5JftehEidyEhZN4/hioK71sHxvyNoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058504;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=ydBFyts4vqx0nI1SLurNcSLMfKUmjdZNw5PHS9EczgU=;
	b=mV0k6she1JzNKXvtGAZEXSaLagxeLEExEWC25feJIOjwIuia2R5ykzNrwTyBCGtbeVWE
	 R/KBJfr7nEZSzpPxnYk/CSDZ9+nLkYdz6rs68/yP6m76I4KN8dXDNM62J0VlF6Ofkukz2
	 S+BPLDdg+qplZHH/SuCrbj+mwEJOJ9qkyt1Z9egtjL1kwVIioVJL+F6W+N5a29bR8B/xg
	 tyzLuw58yuU/+NQVqQXwInZUDcjIkd440jYafpjwePVElCOTRYUlNq93hekdGtRSpYWeh
	 hFldFHZ8Z7+Ph/dH1QfS+ePM83LqBSHYmBRONodeP4PbXlBlSdqnIn9LFixuSQpzhIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WA9IBFk1;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA260606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 23:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA260606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WA9IBFk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793058502; x=1824594502;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GZ3AraRf87VJYK1CEMaGET5Pr/tR0wxymgazYvdgvGU=;
  b=WA9IBFk1ZucFDkZgUQZpKtimMBszD+NBTWVWmIRvhhoCjTdhXqSFuZE1
   eLHsxsZ6Hk/01Ugj7kLxnVJ+Q6vWGKTPc9HC4zzTSzMExXkkkI78oTGVE
   gSsFGhv6phO8uQCT0ag5eTgXlPtpb7/JcYw7CP+pzGT7KP/IBNpdR4htA
   QooI/NfIyzs4mDtBvnJ5x4KazpqkO+MqtJqSYKvqQiv/rYKV1ULlGazx1
   GdM5ghyzVamUTkHtpJG0XL64a/jU9rSGQfWSNo4fKktsrooXKwDojHN0E
   B3+MirVJYGfQJq3SgjvuCfDV3bw7teCMG86jSP0pIck0eEURNMjG5Yqi+
   g==;
X-CSE-ConnectionGUID: DaOKjOgcQ3OTPvkRbLdNxg==
X-CSE-MsgGUID: SR2miGgxTr+7tEO4F1ceNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1775880"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1775880"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 16:48:21 -0700
X-CSE-ConnectionGUID: Pmixi+d1SJOs0+Pzg5i/Vg==
X-CSE-MsgGUID: mQvkUL6VSTiLhJuRpOlyOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4549734"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 16:48:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 16:48:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 16:48:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 16:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWIASX6q7CiqsSQ04HjET43Gb9I+V1AkRylM0RMpdMIFvy2lL6eulpO61KM0DCjJ58Cxp05gsmngPUjNuSCvzRS/JOSD6AORcTeOn/ozxspYfQhC5s3dpaspti2izP2YLEezsgt48+0uX9LsTqwl3auMJu0RISkgUrkpxLL+DLOTba0cJZTFF68F7NR6OwszgEzgNoDlsMZ+ASsF+MfTFYUQrGxop7z1B3DH4P37FoIooZA0JVO0Uc+Yi3MNqg9VQRbEZcuwFN+OeA9zTIgQf4wndHuI0ZheApI3H0IuqZXiMBHuH3TSQyLvu2w14M/aqGcQ1R+50nU85wfiVnJ99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydBFyts4vqx0nI1SLurNcSLMfKUmjdZNw5PHS9EczgU=;
 b=skaXCRY2WSQ3JyQyid5npQA/YYZGyEiCvPNrVJkJzGSyLIArUMiq9I+/zeFEG0xqc9R4HAVyNX5Uvqv0+sjNfT76XWR3FQL6rp2AyeLzo/4cEV9J8oPJJ+4Ucb/0qtiu0NvPKsFXnKmkj64LkTGq0DQ4Z05o7/zcpGF5i9pFRrgZDlw/m2cA1MLeASz+gXkpMd2xsFSry5TkIOuScXvqVTP8RCeJ95c+cpgjW80bfce1rw9jAhsBPSPtbbLhSCjOq7TFu2piEWMbPgQTQtHXikGxdTVSqMkzOirllfDCFvetFlEIqxgZsHmKr4Dow3nC91WSeWHuiwrDl/hrd+B+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 23:46:35 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 23:46:35 +0000
Message-ID: <f30dc79a-37fb-4451-9eef-761f14c6ebfc@intel.com>
Date: Mon, 26 Oct 2026 16:46:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 1/2] ice: store cached PHC time in ice_adapter
To: <sashiko-reviews@lists.linux.dev>, Intel Wired LAN
	<intel-wired-lan@lists.osuosl.org>
References: <20261023-jk-e825-e830-timecounter-v1-0-e932602f0d16@intel.com>
 <20261023-jk-e825-e830-timecounter-v1-1-e932602f0d16@intel.com>
 <sashiko-outbox-183491@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-183491@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a034584-0342-49bd-d945-08df33bb5ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|18002099003|22082099003|261026140227099003|56012099006|261009223027099003|5023799004|11063799006|4143699003|261021121427099003|261022105027099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: vMahcXgxU9U6cD6bpSUyZnu5Sy6MEFytqGEZNuIkuwF+QYOXbvfmCNZe15aBSLH1ZRsWtwX+lAnyc5SQniAofAQsiaGrJ5H+X8PyBg4YMZyyYFQBkLbyDNg5GQNOGCpWAcwcGleil51g0asMXMQI9pS/+rk22UPcPQjmN+xwqGqAOlqs2yG9d79uufmLVgauww7DO79GTYT2uIvQbYOPKhw5pEoS7vWcMKE/2FzMTUGku+vIg5iNwaXS+e72qcKalqpHe3/8oGk8HmVmwcPFpi66ntbcCkYN+0rs/Y4ogTQ6x3vZ2Sz9ITQRiMFLmWvrzYLKflVF7HxEfzaS6MXOuwc5Eram9aqwBH5L/NcA08b/ZdZm6QPqVOB6y3jYLR0bpvMuAM/ZcFQxVZigDZO4YArYFNeN8RWPNZMjG0wRQkQXMjMxjp4vz280K9NDnTe0JuhoLcaJZz3wcdPD6t9bspAYjbv1O8B5Co18Wnx3bKz4h5qf3IjgGf13jtMHclNtzGiEMooLBDkiij92hD55Vd9eqOVA0JXacDd4ZL7suUaF18yDsgiK5Ck22T1v2Era/ZBqyP2Ww4r7h++LMsDMtciSJiKPrLahk3e+oz7fO3U6TftuVYDFD3tFScT4XoBDhpb12bGjhvenatiAxHMdF1sehcg+virDdZKzXLryr6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(261026140227099003)(56012099006)(261009223027099003)(5023799004)(11063799006)(4143699003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2dQczJKVkduRTRSOVgzenZ1VC96WGNNU0lvc0lkVy9ZQzhtSG1uYzJHbXY0?=
 =?utf-8?B?MjlxZEl6Z1pZekluN0dKV1NTcUJXUHcrcGNZbU44WXFWWXZjSm9rV3VHSmdV?=
 =?utf-8?B?bktrYWlvS0tpckNwdUNLbnpDWC9kc28yamc1TFZ5VUIxMkdWMjlGN2QyeEdi?=
 =?utf-8?B?dm1vVUYzd2E4djNhUkgwdGM2S1A0WHlEL0hmOFVBS1FjNEVZd0h1UHBWUkcw?=
 =?utf-8?B?UWFKelkwUk52NWFwemY5ZGxMR3hmbnJjYzVxM2htLzNad1puT2JPU0F4NmVn?=
 =?utf-8?B?SFZwMy9OK3ZwSDF2cGdwd0pGRjhKdTg3S1d1NDNDdUNuU1hUSDJKb2IvRlJJ?=
 =?utf-8?B?b0t2R3VmSE5OZm94ZFNhd1RobFd6aStCZG55Z04ybUl6bWx6WXIwTklUUGtI?=
 =?utf-8?B?bEtiUU95OFFPQ3l5YXFPemhBaXlVanRicXlWSzhXT2QyUEJ1QnZjb3NsZ1Rs?=
 =?utf-8?B?OU0wN2dnV3BYMDdLK3pmU2FZT05IZlNDM0h3R3BJUjl4dmVzdUJOZHZuWFNr?=
 =?utf-8?B?V3RBT1NZK1VvaE1MdXhXeCtCMzRBdnBmWGIxeVIzazJmdXFqc0xSbE1sUWRq?=
 =?utf-8?B?eXBSRkJUdEEvczUyeUpORTJmM2txcW1rek5aWHpMUGtqZFU2MG02ZXQxZVMw?=
 =?utf-8?B?NGRnZzU4MEtPTVNsODErZ3BhamxSaDRnVWV5NHc5Ni91Y2YxeVZOYXRlSFFS?=
 =?utf-8?B?K0NHS3hZQXdKM0E0YzZyQTl1eVpINldWTVp4N2FuajM5a3RlcG1MSHkxUzJp?=
 =?utf-8?B?VzRXN2pUS2liVGllNWhsZk80UXMxZUt3YUd0eEhiYWJhaW13U1QyYmpjT1VS?=
 =?utf-8?B?UUg2ZitxdEo2T1R5T3cycGtFbmNXU09jaHVnTFFQMFZ0YU4zTFByVU16aWdK?=
 =?utf-8?B?SEZmeEd6SFgxMDZYVVBJUkhNYUFYTUI4T2ZzU2RvOFhZdWNjRFhTSmVtQ2Ux?=
 =?utf-8?B?ZFlyZVBFaUlMZUQ2a084aW9uRzhVc1ZtQ2x0WG5zaFpKa1lwK3orTFlwK2tx?=
 =?utf-8?B?NlNNa0Z3VkVHZ0o4aWVtT1h5OHpLeHJmVFhhSXJFNnI2Q3doZnVYTVRBa1ZC?=
 =?utf-8?B?R2d6WlNxbW9IbHo5VFo5ZHh6VXYvM3N6VW5GOWxxNXArTnZTU0dMYWdOTEFM?=
 =?utf-8?B?Wlp1cHRQZHJVcXE4eFYyUkloTWlIU1Q4WTdjS2xVNVRGSHo5MGttc0pBZm9p?=
 =?utf-8?B?WjREWW1COHlNNEVYTHNEWDJXcyswQW5wazRLZEtqZ0QvOU12WWRGaWo4RGlO?=
 =?utf-8?B?cy9wR0cxMjFHZ2hIRDRwdHhqMWEzMi9sUnk4cE9hNDNSR2tPV3N0T2tWSTE2?=
 =?utf-8?B?NzlvSExYazZhUUFOV2dvUUltOE9pbjZtVm9HM0lxMHVrRVFuWGhIWklUUXB0?=
 =?utf-8?B?MEpvK2RiU1NZRjNVWkdXZlNpMk5CNEdLQVhVbDlPcXRreWpIcDNUTVlXS0VU?=
 =?utf-8?B?Qm1NZXozdVRuS1ZjdWEwNWVUTGwzWHpsUzJ5SjhIUCtuZEtNMDZhZHZIeUJY?=
 =?utf-8?B?U0E2R2lLTDlMcnBMZGN0a21SMW9yRnJjRlNiN25aaDNRVGt6UStRYjVCOEJN?=
 =?utf-8?B?cDBPUkN4RnhHaWlJcHFSYU5FTzc3NkMzcVFzM21BdlY1UnUxZnBVWlFTK0pE?=
 =?utf-8?B?dkxDV1cxemlZVk5HTmlTTEFrLzZ6aGdQbndidmp2L1l6NVhKYWl5ZGxHN000?=
 =?utf-8?B?RHpHWWZNejF3THl2aWNPM1pRQys0Z3hvMmg2RnN1MnBIZ2JMbXFCL3h3cllU?=
 =?utf-8?B?RTBaUkRJaEJ6eXAwalJJVnZkSm0xTWJEc2phTFg0c05mZHhzdTdYM2tkNVVR?=
 =?utf-8?B?eDVWWlRpbCsyRDBmK0xkczY0THRlVU9tK3JuUGlQSzRGd1pKNFU0ZnQ2Q0Nh?=
 =?utf-8?B?eTZ6b3VOSUZyMW1qV0t4OWVKMytvQjduaDNKTVZlbVowNnczbFJxQ1d1ZFlN?=
 =?utf-8?B?OXFTbEFLRW9NTm5rQWh3SlN0Q1ZDT2NhQnRVcFl5UmhBcTNGYkJEeDMrY1dX?=
 =?utf-8?B?OUQ0SERySG5yOXc4VUprczNKUW43a1lCOXpXMEZNUVg2VXpTSG1hMlZySkdM?=
 =?utf-8?B?MzZ6Y1luOHpQYnBBQk40MWw2cmRQT1BJR016RGZYZ3pNMU5CbmRjZ1hoQm13?=
 =?utf-8?B?eHJSbFlCS2pqS2t1YWtZZlNNN3J2ejBxanNpSXdMdjN2dW5GeUtPZFFLaktV?=
 =?utf-8?B?akExVUppTHhmOFlWTXREUHBZc1F6UHEweVhEU1lLbXAvTlZjaGhuTlZXRzA0?=
 =?utf-8?B?ODBsQTBXUURHYUMxODhvNEFSRml4WTFFYmNNa1ZYZEpHNDU1NFE0WmtBQlVy?=
 =?utf-8?B?cHFDWHdkZCtiL1pRLyttZ2ptNXpnRGpUK3BrUjJXYlM4dk9rdThHZz09?=
X-Exchange-RoutingPolicyChecked: UPlEZt9IermTTG6JOhlW/KujRK6B5UZC8l1qv3sR9bhwwpC6Fv3bWE980sXamEaBfbJLzU7WXVxjK3xWKASXczujvFfGROLX8yEep3/0/ZfgeKyZ/sN2oZfQhRIJIwb5rvvwRtvW6MwC40O3yKsJ/IbZGpqniuK37mUOrmVsRZfKpGapwpmHbz+xN7SQ9jd8mbwE4BkqQmWzAgsO72gflBxw/XRQB9QBzoC6ftCl0/8UtrAqEoQyXzJqHSrh80DhbeochAO1rkPoAI1ka3YrkydN2m35fH1MrvwbQxya8q7Fl/NhJsZ9I1/HiR5OH5xo9x3lpNIYtLiOp9xOVyuAkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a034584-0342-49bd-d945-08df33bb5ed0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 23:46:35.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddel+w791eCYzbUjbP17XKvk7gV85JTvenZ02x4f2SBLDF0O/mV7gk2rBeVgQ7NrYVt0XL7ym6G1K5ehgHp9sxzkFy9KIzqLgNBjT5tmK00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
X-OriginatorOrg: intel.com

On 10/23/2026 6:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ice: stale shared phc.cached_time when clock-owning PF stops or unbinds
> --
> 
> commit 866055ac7173935e690af3f73268e559a0698a8d
> Author: Jacob Keller <jacob.e.keller@intel.com>
> 
> ice: store cached PHC time in ice_adapter
> 
> This commit moves the cached PHC time from per-PF and per-Rx-ring fields
> into a shared struct ice_phc embedded in struct ice_adapter, and updates
> only the clock-owning PF to refresh that shared value in its periodic
> work.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> index ec24c09280785..4b4a00beadd2c 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
> 
> [ ... ]
> 
>> @@ -987,35 +992,26 @@ static int ice_ptp_init_tx(struct ice_pf *pf, struct ice_ptp_tx *tx, u8 port)
>>  }
>>  
>>  /**
>> - * ice_ptp_update_cached_phctime - Update the cached PHC time values
>> + * ice_ptp_update_cached_phctime - Update the cached PHC time value
>>   * @pf: Board specific private structure
>>   *
>> - * This function updates the system time values which are cached in the PF
>> - * structure and the Rx rings.
>> - *
>> - * This function must be called periodically to ensure that the cached value
>> - * is never more than 2 seconds old.
>> + * Update the PTP hardware clock time values which are cached in the PHC
>> + * structure.
>>   *
>> - * Note that the cached copy in the PF PTP structure is always updated, even
>> - * if we can't update the copy in the Rx rings.
>> - *
>> - * Return:
>> - * * 0 - OK, successfully updated
>> - * * -EAGAIN - PF was busy, need to reschedule the update
>> - * * -ENODEV - no control PF owns the source clock register space
>> - * * -EOPNOTSUPP - PTP support is not compiled in
>> + * This function must be called periodically by the clock owner to ensure that
>> + * the cached value is never more than 2 seconds old.
>>   */
>> -static int ice_ptp_update_cached_phctime(struct ice_pf *pf)
>> +static void ice_ptp_update_cached_phctime(struct ice_pf *pf)
>>  {
>> +	struct ice_phc *phc = &pf->adapter->phc;
>>  	struct device *dev = ice_pf_to_dev(pf);
>>  	unsigned long update_before;
>>  	u64 systime;
>> -	int err, i;
>> +	int err;
>>  
>> -	update_before = pf->ptp.cached_phc_jiffies + msecs_to_jiffies(2000);
>> -	if (pf->ptp.cached_phc_time &&
>> -	    time_is_before_jiffies(update_before)) {
>> -		unsigned long time_taken = jiffies - pf->ptp.cached_phc_jiffies;
>> +	update_before = phc->update_jiffies + msecs_to_jiffies(2000);
>> +	if (phc->cached_time && time_is_before_jiffies(update_before)) {
>> +		unsigned long time_taken = jiffies - phc->update_jiffies;
>>  
>>  		dev_warn(dev, "%u msecs passed between update to cached PHC time\n",
>>  			 jiffies_to_msecs(time_taken));
>> @@ -1032,36 +1028,12 @@ static int ice_ptp_update_cached_phctime(struct ice_pf *pf)
>>  		 * longer tracks the PHC, and both treat a zero cache as
>>  		 * "no timestamp".
>>  		 */
>> -		systime = 0;
>> -		WRITE_ONCE(pf->ptp.cached_phc_time, 0);
>> +		WRITE_ONCE(phc->cached_time, 0);
>>  	} else {
>> -		/* Update the cached PHC time stored in the PF structure */
>> -		WRITE_ONCE(pf->ptp.cached_phc_time, systime);
>> -		WRITE_ONCE(pf->ptp.cached_phc_jiffies, jiffies);
>> +		/* Update the cached PHC time stored in the PHC structure */
>> +		WRITE_ONCE(phc->cached_time, systime);
>> +		WRITE_ONCE(phc->update_jiffies, jiffies);
>>  	}
> 
> [ ... ]
> 
>> @@ -3078,24 +3025,20 @@ static void ice_ptp_periodic_work(struct kthread_work *work)
>>  {
>>  	struct ice_ptp *ptp = container_of(work, struct ice_ptp, work.work);
>>  	struct ice_pf *pf = container_of(ptp, struct ice_pf, ptp);
>> -	int err;
>>  
>>  	if (pf->ptp.state != ICE_PTP_READY)
>>  		return;
>>  
>>  	ice_ptp_tspll_monitor(pf);
>>  
>> -	err = ice_ptp_update_cached_phctime(pf);
>> +	if (ice_pf_src_tmr_owned(pf))
>> +		ice_ptp_update_cached_phctime(pf);
> 
> [Severity: Medium]
> What happens to pf->adapter->phc.cached_time on remaining PFs if the
> clock-owning PF is unbound, reset, or fails PTP rebuild?
> 
> Previously, commit dcc2c9108e65 ("ice: Reject PTP access without a control
> PF") handled control PF removal by having each PF run
> ice_ptp_update_cached_phctime() from ice_ptp_periodic_work(). When the
> control PF went away, ice_ptp_read_src_clk_reg() returned -ENODEV on the
> secondary PFs, which cleared cached_phc_time and the Rx ring cached_phctime
> copies to 0.
> 
> With this change, ice_ptp_periodic_work() in
> drivers/net/ethernet/intel/ice/ice_ptp.c only calls
> ice_ptp_update_cached_phctime() when ice_pf_src_tmr_owned(pf) is true
> (and the only other callers are ice_ptp_settime64() and ice_ptp_adjtime()
> via ice_ptp_reset_cached_phctime(), which also only run on the clock
> owner). Because ice_pf_src_tmr_owned(pf) guarantees ice_is_primary(&pf->hw)
> is true, ice_ptp_read_src_clk_reg() never returns -ENODEV here, making the
> error branch in ice_ptp_update_cached_phctime() that zeroes
> phc->cached_time unreachable.
> 
> Meanwhile, when the clock-owning PF stops its periodic worker in
> ice_ptp_prepare_for_reset() or is unbound via
> ice_ptp_release() -> ice_ptp_cleanup_adapter():
> 
> drivers/net/ethernet/intel/ice/ice_ptp.c:ice_ptp_cleanup_adapter() {
>     ...
> 	if (ice_get_ctrl_pf(pf) == pf) {
> 		rcu_assign_pointer(pf->adapter->ctrl_pf, NULL);
> 		synchronize = true;
> 	}
>     ...
> }
> 
> nothing zeroes pf->adapter->phc.cached_time.
> 
> Because the Rx path in ice_ptp_get_rx_hwts() -> ice_ptp_extend_32b_ts()
> only checks whether phc->cached_time is non-zero and does not check
> phc->update_jiffies, won't active sibling or secondary PFs continue
> extending 32-bit hardware Rx timestamps against the frozen
> phc->cached_time indefinitely?
> 

It does seem reasonable to clear this value when we clear the ctrl_pf. I
can fix that.

