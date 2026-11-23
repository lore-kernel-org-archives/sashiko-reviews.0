Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795425200;
	b=gv5+sayfo6Y8eKtBZ1TsC6ObVgJ8OSZvsfpjo7SJp4Dv6byXUU2T6zxbJV0YrtZ3Zmhb
	 thnCkuvZJUM7gnST/FmI0eMdm6MFYtIJcHF8fUp+FqpT/ikZKAHP9sFCJJ2TxGqZWQdNx
	 fCnQA0aV44lua4DuwciLAQvCUKCmHaXmvU2QC4rB2VJN2MUvjttQu93g9AEGL9SIbVINA
	 FbMaHf8H4oKQfB3mBHOGaZbKodqdDMqFMZKHMC1HAPxYxLqbWc1ZfqJHFZQ04Gy29lnEK
	 tIV1ovSaBNEY2KxUeVGfUTLr0GSDApQbGEk1qfytQTBL9dRG9hPuB1DXW/WgMOwY8Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425200;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=3xRTQbn+zqJQGpRDbCOKJw7J6DFmm6YrnNWVHZF87Uw=;
	b=yUniem1GZ1G09qDYXbuIAVe39AlbzQJll9JrKFB7LuUQzuwI14i/4Vm4A3zfin8g+mgz
	 zK11jq0tri+RS7WCVGRC/PZZBXJtyaBkLLT4JEyt9jikOnB46g+wlkVLkZppttlTFMCbq
	 wJXqA3PyQWM92M0C6QYvYM5ifReVAoaHGf4VCgyeNLI7HjxCCMmFjnPC/wBu77F9T/1IF
	 b3gmIZ3u+hDcYTO20M8Z0Z63u9i0KBjM4EHge10g8g771DtuvN5Jxhqx//qhtEkRzvgqp
	 rUT/mIARku0oO8R7kZKbpYAWhFcmRlbAX8Q+bHydma2RhPIm6yvXqbJq21uTBHuU3Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKELMDyu;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Y3U0Qx57;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D789606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D789606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKELMDyu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Y3U0Qx57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795425200; x=1826961200;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XweFbVNw4Y/WCPdb50ut0pYdRuemTzeduNPQOyQGe9g=;
  b=CKELMDyu2qqHmPo4UY2xkywIF0VmA/GTy9AERWEGFh7HUM/imCvx/s4r
   CqijbfsxpAPla4JFLOAfZJjT3u4Xz9u87CVRmCtsCbTH6PYAbtw2A9Cyv
   SWULGs4sjJ1/LrCvKrQk8JYQxtr429DlCXWf0igJNeXVTMB+xqMLUj9j+
   xtwb/u3QBM1sMSpkzHaHN7M5SVUcwoRyx3WXZ3UMHi673JQge2tg3rFp0
   r4ZnuY4+ZxfY4WFCX2B78pu7dYl2Kp6K+klkp69JMfChYnCMygRs7AUMc
   7+dBXiNAi1dNNiYgRdrPqnKNt0shlxdd4K3OIHbXdkDV0Lwl6XPdWvKPH
   g==;
X-CSE-ConnectionGUID: ZBc+Y1krQTyAGW9nrtDi2w==
X-CSE-MsgGUID: QogDBaADTnGcif16+Mvm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4260419"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4260419"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:13:16 -0800
X-CSE-ConnectionGUID: tGkeNND+TGat7RdJ+cd4Qw==
X-CSE-MsgGUID: gLtO3c+ET5Sd2BGZqsEeOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13056318"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:13:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:13:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:13:16 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:13:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpj0GPtaV0yh/pfCfoJDajUtF1KXmui/2noDfm7Qe32u7LrpTZFo7uxXEKBS32PTiNoa1PFcn4ssUkNkWbYaXtHYzbgQWqcf7ZJpnJFN2qpuSBlma5gFYKO/vvVDhPaTihciDaIR2oRv8OGIoDTDOV6gE/l6wO5BwfFZlHkq7gKQ0ndgs6UDE9M+KLvJQ43Euix8Ch64bunpveOrF5j6PWdJqkUf1Ai5WzYvC7OhPD+Ev+xcEYhu41Zrt/VODm3XfwiMqERwSGh/TDbAbHCr0Rz0YKiVXbVg+ng8cF4TZkf37Qz/pZEZM6b7i43R9Uk7mdsblMuuMAJdLzGvG61sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xRTQbn+zqJQGpRDbCOKJw7J6DFmm6YrnNWVHZF87Uw=;
 b=aXXeSCPLMF5+Ise1D6KHjT4BpKyN1X70HZjOiYVonUOb2+4Kikg3bu46tDPSPLtZfPNlY1xdYi+gWm5NxXyZaykyppZJ0M9jxHACv3/CsKO7JRvlQaRqmueCFyBdHlP6GeM85TJ1dBpxx5h8vS6V3Ckm7NYjz0rAwgwL2PQLhrxoxLC7XUTrwrG4BBdDqr8iCHol2HbLhASfJHxrEAouO4HzkXPp4XBBSkf7uG4QX82tWUAQcULdbqv8g+6O6ioCIp7+StWZymHmaZtBImj1KDlCb+BUWKC93rt8UPj4iUa4dP8YFjlAZakyo9rRrRpYhmm8e9AuR27T3OgBG4VBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xRTQbn+zqJQGpRDbCOKJw7J6DFmm6YrnNWVHZF87Uw=;
 b=Y3U0Qx57dnPgzwvkAuWzSGrZ/Pc4j+7wvYBOx4zIh3NKoHKqt9KX2wO+7ZBGrPYvDLm8Sw9PWZUFjlCeI037g97j3N/IkI3bcI4SYTICmL9UI6TbKd2YoTO5F7A40i0xH4tPqiU56bGdaDNj4NFtyRk6yfpwYSpaFtjpG/8iMoA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by CYXPR11MB8709.namprd11.prod.outlook.com
 (2603:10b6:930:dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 09:13:13 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:13:13 +0000
Message-ID: <9990fc9f-b78f-435d-8828-42990d0f4cca@intel.com>
Date: Mon, 23 Nov 2026 14:43:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/color: Program the 3D LUT on the plane's own
 pipe with joiner
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
 <sashiko-outbox-223707@kernel.org>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <sashiko-outbox-223707@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0333.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::18) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
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
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: def4991d-8cd3-451f-dec2-08df4941fffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: kLoHxMO5oc6It52a35qBo4euY5UsbwJOd1eNHxDJKTpmUvzwg/ZHoz/ZTp5EyhCNT4F10zQmTCKudzx3PCa2PmVhkuo244im9v1V/iXIABm7f+zk7PoxvQij91/PBqFrwr2baot1E8xLc+UMLkaxBMxUoFsR7W9mOYISpga7KRJjd8kXvbIUtXfSeUZT8wiDP/WM3ozvzdPMWfUUgmUF+K76rJh5OP7AyfoyrqT7ER+sMlIVexrPsx60m2whHjW1//a+7hFJdVqnd8B7dWuzfxJfaHWZLxeRzWtTqqmqzfyQI38M6le46CdWkWZLRrQVpJ1hXzRYudXZEmChQtdshlUcNIdkLrbe1o2gRnGsjFZuwrUeC+eJIVGeyibrR91yMckKuXCiCzXyw9cnqNYyq4cM+INLY7yiegvHSV3SYZ1pg0xZddGwC3HQvUnqEg17NDU7jBEpLVgic+JT6ItFECbc/8lxAb5MP3M3yNH7v/hca60mrvrHHI3SkABwalaFvkMAQOwvQ+W3OacgypAvLowCN0+H+RrnUZRcy2HiX01vgzUoNwpRfLejy5xMudeuBLCSISloyt04Zx0N4690gRPd/yy0Eq62Xd7mR/OCQ/4wRtRTY+tQ+0mbfmYvPC9D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR11MB357627.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWhYaHRVK1RSZFRobGlVcUtIMzRvT01mSFpPWWs2SUxZNGpxVkVvZGsranFP?=
 =?utf-8?B?QlBkMkV3YnBJZk9GQWFzM0JOZjdJNzFUOVRUc0NHUmorQk5qM0pnM2NmSklR?=
 =?utf-8?B?QUlxMkZ1VTV1QkJ3NGJ2d3Y0WVlxeEZFV3pvOTJVQVZyQTdrbW1YTnBnZWFB?=
 =?utf-8?B?aUhtb2pLbi9rMlZEbnI0NFh6b2p4Zk9Qa0FXMnBpbDZGNWZ1b3FIa2lRdCtT?=
 =?utf-8?B?QnBYME1oY3gzSXpCaVF6VFJYM2JQTldLZWwwYWg2ZFgwbzd3cVJFdmozUkFB?=
 =?utf-8?B?MFpsOEZrdVNJYVpyeHJlL2lxSjB5UGV6RXdiUlY0b0xXU2lHS2NGQW91N1VF?=
 =?utf-8?B?NjFuc1JsUndnZVd0YmduaUpMSXl3cUxtY3FqdURnM05aRTExQmZPbHBJd0lV?=
 =?utf-8?B?b05YY045UFU2enZHR3FUQ05QNTNkcU1URWNRc09rNXFhaVNlUnRPOWVjVm12?=
 =?utf-8?B?VXVlS052TkduMllnMEt2UzVxbk9KWUVLZE5wdGNxVkxKYThXZnVyTDlUa1Vk?=
 =?utf-8?B?ZWRodm90SVl2NCtFcmhZUWJSekNQN3o0YlgwQ1M2bzk5YTFVRXFMdURJK3Z4?=
 =?utf-8?B?NHpiZ1R3NmpOejFMNWRMcGl1a0h3QVgwN3lSVS8vMnFCN0YwazQ4eURwcXFV?=
 =?utf-8?B?R05lVW1wUWxveS91TGM3S2FQQUtEQ3FGVkw5ZG5LeklWdVdnbVdZMCtLNWNS?=
 =?utf-8?B?ZDh0R3M5ZnA3Q2s5cmFnRXRha2hnOXNpd2UrQUh4ZTVlblBmK08wanU0K0Vu?=
 =?utf-8?B?Y3dwcjZ4WXlEaVphaDhmQkY0aG12ekRZdWh1QjdleTJKemJua3JMN2Ixbk1H?=
 =?utf-8?B?OXJnRTVLRDhQL2VxK1doS1JNQVlxckp6LzVnU3R3UUNZb2I0L3ZOVHgyTzVY?=
 =?utf-8?B?ZkFscjVkbjd1NW9CWFhhdko1bFB6UytXSTBaeUdxN2J6WWx4NnhGemZ2M2xs?=
 =?utf-8?B?Q255MGVkTWMyaWYrSVA2MEdOa2lHc0tmYXRkTG8yZ2pwTEgwbjZxUFlnK0Zu?=
 =?utf-8?B?R1FRZEFOa2dtaGh0VWNWaEhnMjNIekx5b3VkSkRGZS9hdnY3SkVhZUUrUUpC?=
 =?utf-8?B?NkRIOW4yRzFTV0ozbWpkZ2w3eU1jVHp3ajZzT0I5aTZJYVdPK1A2WnF1a05W?=
 =?utf-8?B?SnlMSE5VWGtqdTRvWXNoMWJCSU90eWZaNVMzcjdSeVNpTEJRZk5Qa2xvdVhJ?=
 =?utf-8?B?NjdBQ2ZwZGYxeGwxcWJ3alZabXdRRUpWUGZiZldqYXZtbXBMd2Fub1VXeU1Y?=
 =?utf-8?B?QmxyZHBad2hvWEp1U0dJeFVuUnE3cGJSUWd2M252MFREVTJWeFV2WFlFTi9q?=
 =?utf-8?B?THVIRUxKWXBaQVQ0L1JLSjBHS0hkdlg5K0VmZkdzZHlrWWxqUXNMamxxWnFH?=
 =?utf-8?B?OUxhVER2NnM1Ujk2elRTVjlibGVEVm0rQThkT1R6V05iQjZJT3dndVZtRysv?=
 =?utf-8?B?WkZLYUJxdVAwVmxlSEtzcDlHUmhYTnBJT0JocVA1cmFvUmQvL0h5MU13UEln?=
 =?utf-8?B?MmdSWklEcXd5NUlXR1Erd3creDBiZFEvZzhaQ1N1VHEzMnVSS056UURJZFhT?=
 =?utf-8?B?eGJFcWVzb0pCMTRlOWFtd25ZZWJKZGhYUXFDZzFhSFJ2L2hOYVhmZmFDNmdO?=
 =?utf-8?B?dGU3dkV4dy90ZEVwYjhaa2VqS09UTVNCVUhiS0lCMmpYYy9PQXl5UXVTcldY?=
 =?utf-8?B?V2FZSGVPbXVpWTh3Qmh2RUxwSUJ1Q0ZHU25xS1lJVWlYTDhreHNvQXRySHJN?=
 =?utf-8?B?dEg3YVdsSmw5QTdlU296ZzEwMktadEpUaGd6bzdjZkhYN2ZzMEpsN2FyVUdK?=
 =?utf-8?B?SllLSlJLZGhRRUpmTUtLVWdiMHJ5c2dqbVBoZEV3c1FOK0locGcxK1FKKzhG?=
 =?utf-8?B?dDR6cFpWY2R1TG0rMVB5MW5wYlhRcHphUVJsM1lhZTdwMmJYYUlzcFVvZVpj?=
 =?utf-8?B?S1RRdmlySnZlazBQNUc0Tjk3WU4wWkhKMG1ZZy8zcnF3WXZJVTNaZjJoYTVn?=
 =?utf-8?B?WkgzaFpBK1ZTYjYydExaMlQzQ3poNUVnZ0hVNzdFNFZJWlMzRmsyMVk1eTd3?=
 =?utf-8?B?VzZWa0pTVTlLa3B5OHMzUGV1L241emRqZDM3d3lMTW1mTHVkWkJjekxxbmJO?=
 =?utf-8?B?S1JEUjBDR2lJdkN2Q3JuMUdpd09KRFlNL1NUUE8vVytrT05EZnkvZktGR0lI?=
 =?utf-8?B?akI3M2ZHdHlVcnJCdjlGMVowcGpwMWpibk9IaXc3cjd3QUdSMm80M2d3TWk3?=
 =?utf-8?B?d1ovanVNN2thMkdWQytkeFhBZlY1bWVyZHRQYmh1Zm9paGtkUWFUVDJJK3dl?=
 =?utf-8?B?Umpsbm1RUzZxdXhvQnRCRFJNOGVjRVdzMjMxU1IzQVhKRDNNejQ5c0NBSGl4?=
 =?utf-8?Q?dJVHFOueimiTkea8=3D?=
X-Exchange-RoutingPolicyChecked: HsEWvAMR3vMRLOlSMe5SaHI6/+4INNZOPJ6AtoBT6xjg922BUjDFAa1+PJTPVTM5psnH4L1Eq8JkfatYEB2QaV6wKlOo0QymRmg5TqfB+Q3yKwt6vUUNwe3kD93KB5cEJB3fgTlxSO7MfsPs9NxV7TsBqMTXwQu4nhNVRMClPod991wJwKSUIEvtSGgVtatWRiq7T4VFgclK3HF4JCVB3oVbwL1VaV/CmPsxa8znwviyCXvaeDRSVaH/PFqy7eQz7PBIRswjDzMreAZcOTyUzFAsJohoS+1h2due+MN3QQ1mL6E9sq9fVaHpprsEDkD3RUoNpJoYZ+6MsCquR3HWUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: def4991d-8cd3-451f-dec2-08df4941fffc
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:13:12.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzVG6HrwQH3GDvJfpec8ZHm8gQY331Gl+vV9Qc5hweRU0bMWRfFvXqtMiV2mbLNeNJLN+OJw8yZo5DymoCF0Ai/ErNF9hpUc9X+C3smWvqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-OriginatorOrg: intel.com



On 11/19/2026 11:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] drm/i915/color: intel_color_plane_commit_arm() disables 3D LUT
>    on non-PLANE_1
> - [Low] drm/i915/color: inaccurate commit message on joiner secondary
>    plane uapi.crtc
> --
> 
> commit fb7959aa23c8ae58895c1901c0ab349857f2f45e
> Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> drm/i915/color: Program the 3D LUT on the plane's own pipe with joiner
> 
> This commit switches intel_color_plane_commit_arm() and
> intel_color_load_3dlut() from plane_state->uapi.crtc to
> plane_state->hw.crtc so 3D LUT registers are programmed on the plane's own
> hardware pipe when joiner is active.
> 
>> With joiner, a secondary pipe plane's uapi.crtc points at the primary
>> CRTC. intel_color_load_3dlut() and intel_color_plane_commit_arm() use
>> it, so the 3D LUT is loaded and enabled twice on the primary pipe and
>> never on the secondary, leaving the secondary pipe's part of the screen
>> without it.
> 
> [Severity: Low]
> Is this description of a joiner secondary plane's uapi.crtc accurate?
> 
> In intel_plane_copy_uapi_to_hw_state(), from_plane_state->uapi.crtc points
> at the primary CRTC while the secondary plane's own plane_state->uapi.crtc
> remains NULL, so to_intel_crtc(plane_state->uapi.crtc) evaluated to NULL
> and skipped programming the secondary pipe rather than loading the 3D LUT
> twice on the primary pipe.
> 

Ack.

>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>> index f1df0f9ba7624..31958bee4717d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4275,7 +4275,7 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>   				  const struct intel_plane_state *plane_state)
>>   {
>>   	struct intel_display *display = to_intel_display(plane_state);
>> -	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
>>   
>>   	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>   		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
> 
> [Severity: High]
> Can this disable PLANE_1's active 3D LUT when a linked planar YUV Y-plane
> or an overlay plane is committed on the same pipe?
> 
> glk_lut_3d_commit() writes the per-pipe LUT_3D_CTL(pipe) register bound to
> PLANE_1, and only DRM_PLANE_TYPE_PRIMARY exposes the 3D LUT property, so
> plane_state->hw.lut_3d is always NULL on other planes.
> icl_plane_update_arm() calls intel_color_plane_commit_arm() for every
> visible universal plane and linked Y-plane on the pipe.
> 
> For a linked Y-plane during planar YUV scanout on PLANE_1,
> intel_plane_y_copy_hw_state() sets y_plane_state->hw.crtc to the CRTC
> while leaving uapi.crtc and hw.lut_3d as NULL.  Switching to
> plane_state->hw.crtc causes the linked Y-plane update (as well as any
> visible overlay plane update) to call glk_lut_3d_commit(dsb, crtc, false),
> clearing LUT_3D_CTL(pipe) to 0 on DSB commits or failing the LUT_3D_READY
> check with drm_err() on MMIO commits.
> 

Ack. I will fix the y_plane path in v2.

The overlay plane path is a pre-existing issue which will be fixed by

https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwartz@linux.dev/

The above patch will also prevent the y_plane path but to keep the 
current patch regression free a (plane_state->is_y_plane) check in 
          intel_color_plane_commit_arm() should do.






