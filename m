Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AE2F7EF3
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 00:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001312; cv=fail; b=Lks6ZylxDUpIVS/AxvpBCy+iDlmDo9tanbHxvQulASY8XqT7bS61LfhpGDOyIRDRldN42IXb0X7CytrxH9HA1SNZjF3DLWsAq5wjYYCM35YwPEPcsudBobFUSh/F76igykbwnVRbqrs/QhKFwiP3LxWT6pw8rZn949oSVSctjC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001312; c=relaxed/simple;
	bh=xCevsZnyjA8p32pzdzRKwzmm0UOK+UY2fLtXYd9TVew=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qx4Ejm7yOmSGtgc28O3Iaw3NTbDU3BDIPgaCylTUhDHQ4bMGrBXhH0zdVkRq+ezkz5XWOhW9upRPY8GQXhxH66oTpKEaGI5x4C51a6t3uv60is/+bBcx6cNM9r01Ozo3Zcuf+SN/2+u5ax3PJvpQjYdntnSEgESyR2+F6/RF59U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bStjOenC; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bStjOenC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789001311; x=1820537311;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xCevsZnyjA8p32pzdzRKwzmm0UOK+UY2fLtXYd9TVew=;
  b=bStjOenCsu5mQgLWdYFG/eXbY+P8paj+nQq85mdsNX+Y+vR3ufOLkj0F
   wAxIOPjbq6xi71uVzzVJovHssnbSu4wXA2/JKj4LE8dX3m4exhXgID2BE
   PlFP+B6ge+e3uQAtBHPM0nsVAVfEtQHnIH8w78aUWEaHBcil8yZOAftpJ
   DARWWllzBryTbmi92fJz8z0jeIApCJfyNsD1aAEHRJDKVpLh7tnkdlNHS
   o2odmq2avz5xR7Yl/C6cu86gvQ1qQv5O+nlw12Oicu3De8I79S7wwMnt1
   2LsDnAv29XGmr7oKLK2yI5HW/FQZz8M9OnS10DIjJnEQ78+Tg/5yl8g91
   w==;
X-CSE-ConnectionGUID: U/vcC/gYRqyrKuV3DxT8MA==
X-CSE-MsgGUID: SuxxlkUHTE2Ox9Y0dUhLSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="77001089"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="77001089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 17:48:30 -0700
X-CSE-ConnectionGUID: VbKKYn/XTEuCvdLxLbvWEA==
X-CSE-MsgGUID: 6wNlLUgvRpuBnrFBKodvZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="274991985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 17:48:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:48:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 17:48:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZPyKITzBD2kmQrU01l50r/q78nH0FIUmPSvqFjd2AECHv5HOUPZ9sh/UIjqi2/UKv1/8qkQuhkSsIbzRvZS30AeYJVWreKe39ftORnJK2zgNxunTnyD3v1SqMGXTWhyfL5CpH/vjWcZCk5mz11fyfKJ2QCjtYNIrsUSwZgZ4QM3kg/1ct1Gkq24+xYZuPU6uiKPebXX+D9rWlj8fHEchIDYcL9VSfhF05KXBAN+Vtjql26Y88dEv/cV8ggyfFNMxhzKZhDTGLBuRiwxipmVOW6UYen9yl6a3L2THuOVD6h/vu5vdgMrebeI02k01ordloB+D9FxLZkPFEGiuay2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VE6x4Qb5UWeCGAmdXP0ShW5/1qq/2VrIbOX3pjjDCs=;
 b=rLTTsDiGCLMDVVyXcqvZLEQFlTKpGGPh/T+Vj/tb8VZtXck/aKqI0I74an0efcCkfjFr/6zkVcSlVBltHTl/MnqED3w7wu7JF9miRC79/N0HjjanZT2W97x+tD54vpyBl63rjLseFo9Mt/vj2NKJOitMYMd359uTisfjdOBq3SKAfaCffxAfaYb5i+5UElokLo8R3hxB790Dn5LphJP/Lwae0vq4idtO/fEHa48+PIT5s5KZQ7fuKUYjjNLmLmA2H7gdwNiU8+rJhvJT5Vs8YCyPOV12HqMpJgPAdHZ8xFnQ+ZSBcADtkQ4a184ZUUfI481N6pGCkIbxk3QXr+LqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 00:48:27 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 00:48:27 +0000
Message-ID: <e8095bec-4ec4-4d8e-bc4f-e248de365b1b@intel.com>
Date: Wed, 9 Sep 2026 17:48:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Poll GT for C6 before D3
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
 <20260909013712.1962521-2-vinay.belgaumkar@intel.com>
 <20260909015343.CE12A1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260909015343.CE12A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: d727d92f-1429-49f3-4e0f-08df0ed539cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TV9QSo2yzFrZMT4eun9G6abyM/25m7eRLGinFxmaW8eiHPbI8H0ed1JQtjcPD2MXMzVOnS+X8U41S6GY6209GvenWWMZauf7kCAZWSjurgGNBXpJQOY1vfDheUY+OxqFQIGyS9LELVkMPSDat3zdRnylm3FjLmR8n79b7iS8kxWcX56AiAteh6ZqjIUrB0y7FjYA67hlCsSpDQL8FnZK61DLa6kJpEJnmdehYXpvxmwzcBK8c+SHh3uuj+8zKzT2A+n25EnlS+9D9myLOqgk020ANWtZhxmpFDLgXtuDmmUsBntlyEJgS3y3kNvwkJNlfPJvUM1rzEcJnNJikMe+WJ/pKp8qG97ltHMqLV7bacFnQhjkzCWjhY9e0WQKboT5wrQq8NXAxjkV3iJRd8+i7KeMaZoOybVtWXv4nh7mOC65HhkJzOEmjs6JEzcg60b4Vv56RbS100iBqrdEYLAvimOms1FF1B5MSTAwT/PMco2Qq6Bj2a6rvEImPr8RdmByEay0B+5Y3JIzPJx1kJGgeHeSdqM76LpDrhKJIIAEBBaahpgTWklFri9KyC0foC4WNpo6vzXwrHuMOQKEePfZJYj7h/hpv+nCLR9DP2gXHl6N0vcJ8RjgMbRHwT98cmsiAqhPFA7zn5vWEgaY+7BMPp9uJZZntcs1XGGjcEajvbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7757.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0k3KzBYTFVKQms2c1N3dkNoM3NhNmxHbkxyemZaeEMyV0NGVVNIWDQrbm1r?=
 =?utf-8?B?OW1jUE5UV1BMVmZiY3pvRjkyeDNSYnpQdDFSQVdQdmo4NWpLa2IzaUhFNnlW?=
 =?utf-8?B?VnJVRGRnbDRuTkNEa21MeWxUWDdVWlcraWVibk9HTjFKNGZZQTJKMnh6b3Vq?=
 =?utf-8?B?MlZFT1NSZnllckIvS1lVVld6aitWTG1nZXJQN1VxTEtsVTNhM1ZoSlExSU5X?=
 =?utf-8?B?aDF3WlpKVU9UdzFiY1piS1BNMzJzNkJpODNhMzluRjJnQzJ6b2ppSFk0QkM4?=
 =?utf-8?B?R0t6SjNuSGx4TW5TNjJ6UHgxZXB2L0lOTkJxNmlFYjRxTmc5bHZXSmtJcDB2?=
 =?utf-8?B?M2tvcGU5TzZiNjFoMHoyeVdHK1hMUFg3UTdSc3pBazdBWkFzMHE4SnBhWTVs?=
 =?utf-8?B?cFdEcitscldxL3hvNHI0RWFRVGxxNVg4TzBmb2FhR2tNUUVMcmtzWExKeXZZ?=
 =?utf-8?B?eVJ0S2V6Q0NoZVJ0anJRTnBEdUwxNU1iQ05IYTlsSEIralRoMmF6TzlCKzRq?=
 =?utf-8?B?dGhaNkFkWENVUHRheE44WjhsSGVZVnZQOTZtUFBIRC9OL3gwSmwvN0dYOU9x?=
 =?utf-8?B?d1NzelJtVlNIQ0VZeFg4czJHSElaZXc0ZkxwR2FmMEpFbVBYa1FwQ3VISUJG?=
 =?utf-8?B?YUl2RUNmUEN0YWtKYnBhTmhqU05ZL1ozdFE0bXBaQUZKVlFrQkQ0NktXc24z?=
 =?utf-8?B?OFA3L3VkQlN2MWs2NkRudnhkeXVpcjh3M29UTW1VL2RRS1hEdmtPWkx1a1hr?=
 =?utf-8?B?ak5PT0NLelVZWHJDei9Obm1BQWphd2RueFRJSTA3NjI1dWpQMmN2a0c0MlBY?=
 =?utf-8?B?TUpLRWFLTFNZYzhobzZiK0U4VGVYbTFvS1ZZN3RtSjVWa2xLTmJKa0g2TE5D?=
 =?utf-8?B?ZGlndDRnekRiQldiL1JtbGNVMGNzL0lZSk1SZlRtUGNUbzZvVUtUd0tUVGJN?=
 =?utf-8?B?M3RvVzdMSHRIYnlnMHg5Yjh4eWx0c0dYSXg1VWdaNUwyeWNUeXUxeVVHSW9X?=
 =?utf-8?B?U1BiQlEySStpVVk0c0RhRnFsZkxCTk5oZmpyUU1jaDZhSlVGZDdJNGRmbS8y?=
 =?utf-8?B?UFlTNXE1anZ1RzFFVWlUU3JtL2wwOFlTVW1rS1dlY0hCdU8yaE9iUHJsbFhF?=
 =?utf-8?B?SHdSbGE2bjZMdFJQamk5OEtvVVYyd0pQbkZTQnd3Qy9hRGdKQWVCTkwxcERi?=
 =?utf-8?B?TDd2a0U3ZlhSbXo1NlU2V2FTL0JOaUhlOENVRVZvN3FBeFdWTFJIUVBxQ0RO?=
 =?utf-8?B?OG8rblJXYXlQSm1Pd1BWMTZvVUp3d0hLNzlGdnFTS3hOaDRGUmo2dU5hMC9y?=
 =?utf-8?B?aDRaYTBaRXhsU2x5MFBmeUJseStXaUdqWHZpRmdZQkxaYU9rNVR4eklNY0tF?=
 =?utf-8?B?UjRMRzV6VlZKRDh6SXUwZzBuN25qdTVnYnh4SGlVQndJTkptM2VXT0hKMHZj?=
 =?utf-8?B?RVozUVJGYUJSYnJrQjRMWUp3Tm1yQ1R0dzF2MjF0Nnc1Tm1NZVh1L1NIUEl0?=
 =?utf-8?B?ZGErTnVicUFJbWRvM21HNmt6QTBMZVNlczZPd1V4QkZpUnpOVGljTTVYaFZZ?=
 =?utf-8?B?RElLK0h4K3hPSnRTV2Y3ZzdQRXhTbUhSOGc4cDRWRnlSdWtlU2lSTEFaMGpP?=
 =?utf-8?B?RjliK2lFejN5Rnhrb1VCN0xrUERtZGtodFN6NDhuUGlQaUZ4QTE2a1dYMC9l?=
 =?utf-8?B?R3lSUlpoVDlEZzVrWWhUdGV2ZTk3UC94cGxkS1hzbytUMWVIeXltTDRWTFl5?=
 =?utf-8?B?VHdieUVHUjBxeThrdXg1dUhFeGZGS0pGOTNlVWJKVWNJdyt3M0VhK0dnUFdn?=
 =?utf-8?B?S2R0dE1ucDZES3I4bDBpVi91QWdMMU9QbjlqNitxTHN1WEF2bzhsUXpCY0tT?=
 =?utf-8?B?a0FvM1VNNnhNdHQ2ZGErN0NyMUh5VU10dHpmSlVFR2JmWm52d1FSb05JbnFq?=
 =?utf-8?B?S2xNeWxiM1dZNkJWMkRHNTZwS1hHcG9IYTlndDZEdGlBTVBlQUZDZnBCS3dw?=
 =?utf-8?B?eW5KZitBaThVS1ZZb1NZSmlHQWZsU1pjMXJCNElVVkFkNFpNRk8xT0V2R0Rj?=
 =?utf-8?B?eUdLQTI1SnFkZ2RvaEtJVUlsYlgzaFQxRmNESFl3Tzk4SHg4ZW40Wi9rQlNB?=
 =?utf-8?B?Zkd3UkFhMk1TZ0M4QkxCcVlGRmVvVWdDeHdYRDZmeHZlS2lPM0ZSSG5sL0pu?=
 =?utf-8?B?UkI0OGh5Y2dTRGZQSmJScCtSeUNVT0pOM1RlQU5SZnYwbjQ0ZFphV1p6cE1Z?=
 =?utf-8?B?K0kyd2FBZmFEM0pPY1lmSTJNSU9vS0s3SGtlVkNrN3RxU3FqZUJHTnBMSFNY?=
 =?utf-8?B?aUZudTEveFpFRVRlVGhsVkkxRTJhSHlJdkFYWEcwSm9jYW1uaU0xZEc5VUhl?=
 =?utf-8?Q?t2p/nMkxRnhTb47s=3D?=
X-Exchange-RoutingPolicyChecked: RnodX8tJdSxVpFi9beaOA5/hHHDapecM6B0J/H9iTnzuX36Ym1ar3iYVEo9LbbgtFl+M/qsABggwhHF4Oc7w+0IZ4ly7vdYoaTltIMmWS0ruWmT7N9j4hl7KmpeG2vugQxbz7229mL2PBAgGDFALtTtEMhFiV/VInSIEYXi6Ie1wIh16Tlp19sEHFUx4nMcGNAR78RYWaYx4IbcI4IbfoVOTEEAkveVuigZrzTFoa4DnuXn400iYtOOgKlAkzymkEMIuSDC/cE4zBbQt73QjETLlJnPrTreHQldNg4uq0vZQY3kbfcaaiNilbmqvNplrt8FI9PQAittxOML/rMc6gA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d727d92f-1429-49f3-4e0f-08df0ed539cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:48:27.2092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FM5b5eSQ83XU5XODpBW8nitSmpgs2n//FNOlA+fT2/AXNN5VVyH335Fb3BJmpzLfkG6SNI5nC+a1oIp23R1tVU/mOsLwKD4O0UkN5c9iNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
X-OriginatorOrg: intel.com


On 9/8/2026 6:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Returning -EAGAIN from xe_pci_runtime_suspend() without rolling back the successful xe_pm_runtime_suspend() call leaves the hardware permanently suspended while the PM core believes the device is active.
> - [High] wait_for_gt_c6_state() dereferences a NULL idle_status pointer when executed on SR-IOV Virtual Functions.
> --
>
> commit 5290095cf4ef101ed42731b369d55f98f9bbeaa1
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> drm/xe: Poll GT for C6 before D3
>
> This commit adds a check before transitioning to D3 to ensure GTs are in the
> C6 state. If the GT is not in C6, it returns -EAGAIN to allow the PM
> subsystem to retry, preventing component access during forced D3 state.
>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> [ ... ]
>> @@ -1377,10 +1378,25 @@ static int xe_pci_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int wait_for_gt_c6_state(struct xe_gt *gt,
>> +				int timeout_ms)
>> +{
>> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>> +	enum xe_gt_idle_state state;
>> +
>> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
> [Severity: High]
> Is it possible for this to dereference a NULL pointer for SR-IOV Virtual
> Functions?
>
> If IS_SRIOV_VF(xe) is true, initialization is skipped in xe_gt_idle_init(),
> leaving the gtidle->idle_status function pointer NULL. The
> xe_assert(xe, !IS_SRIOV_VF(xe)) in xe_pci_runtime_suspend() only emits a
> warning in debug builds (or acts as a no-op in production builds) and does
> not halt execution, allowing a VF to reach this unconditional dereference
> in wait_for_gt_c6_state().
yes, will add a check.
>
>> +			       state == GT_IDLE_C6,
>> +			       20,
>> +			       timeout_ms * USEC_PER_MSEC,
>> +			       false);
>> +}
>> +
>>   static int xe_pci_runtime_suspend(struct device *dev)
>>   {
> [ ... ]
>> @@ -1396,6 +1412,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   	if (err)
>>   		return err;
>>   
>> +	/* Poll and retry if we don't enter C6 on any GT */
>> +	for_each_gt(gt, xe, id) {
>> +		if (wait_for_gt_c6_state(gt, 200)) {
>> +			xe_gt_info(gt, "GT is not in C6\n");
>> +			return -EAGAIN;
> [Severity: High]
> Could returning -EAGAIN here leave the hardware permanently suspended while
> the PM core believes the device is active?
>
> The driver successfully suspends multiple hardware components (display, GTs,
> IRQs) earlier in xe_pci_runtime_suspend() via xe_pm_runtime_suspend().
> However, returning -EAGAIN here aborts the PM core transition, leaving the
> device status as RPM_ACTIVE.
>
> The PM core will not invoke the resume callback, and subsequent driver
> operations will attempt to access powered-down hardware. Should this call
> xe_pm_runtime_resume() to roll back the successful suspend operations before
> returning?

Will call xe_pm_runtime_resume() if GT is not in C6.

Thanks,

Vinay.

>
>> +		}
>> +	}
>> +
>>   	pci_save_state(pdev);
