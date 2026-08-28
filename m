Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E934CFC5
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932405; cv=fail; b=VrgAPM/fKk5BndlbREOf7gFG5ccoqPUl0eokbwC5uNf5b6mAW6KlTSiQy2vW+WzOcoTG8tq9Qdb5DIoF7H9N6VnkY44hjprWtiPErTgvpissVNgXMfMTHep2NavsMjzc9camfUIvMHEWCM5NK7PFOU7VWMCf9NH/YMUUxHaaxXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932405; c=relaxed/simple;
	bh=xSfU3QguNmB/d/YBNjVmL3AeUFDHtVIta0NGFHLMTfw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YLrF023JSGXqRH+iMgKz+ZeyIrcnDucPdhG94wYNqrqkiXxMY7DWqCLRMLl0jsPjG8g3nd3Taijr1J5v7YitjUoVZCygMOz3vbKM0QlAekLphLygHSFlm722eG4AcJ1ejWzAy02z2U11vbrWEDJdK2JdXuvnJbfj7Bq23j7NRDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzdNG8qi; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzdNG8qi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787932403; x=1819468403;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xSfU3QguNmB/d/YBNjVmL3AeUFDHtVIta0NGFHLMTfw=;
  b=jzdNG8qiQ6lUXZ1MiL1SK/vLF2TyrMCkuO0d+nWSTiSvCLKlUXxGni8q
   69AJQw2UtBEpr+hZdP3qqrK2RoM2ENm0yxQ0EozGtIccQtW0p3uwoVGt/
   Kh0jjsKzAujSVTf3C9apxpBriLcoP3vjVl2hjeXvvjfq2Mzma7Hy6PZJ4
   dylF1dmZIgMNPZ9zjEaq0/1nYmQeo7bkkoKir0YxSG4B8d/gri2GBlCZa
   xqIp/nzU7h19hpjPFp/Rr2/rzYoa+Q6AgcIzWekVLjQCH7Q0j3MAxzBkT
   byNP5kGaTS/HbPs5BHT2hU1LUQvH/pb/1ED7zJG1fIlJ0fRoCYVaTHZ0r
   w==;
X-CSE-ConnectionGUID: 1gWnIjLdT8aoldIFP27d6w==
X-CSE-MsgGUID: CMML3MZeQE6EhUziLVpX9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="90954346"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="90954346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:53:02 -0700
X-CSE-ConnectionGUID: FvgLxB5ZToC+DOb4bJqCtw==
X-CSE-MsgGUID: UEO72GnZT+muuArIIuwF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="264439217"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:53:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:53:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:53:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j87ia4KhboyJUginMw6pcsaAU0IMm+TYhWm3fNYt8JE8a3+T4fIALXnut8DL4fmWIGSiYBcjDXG0/Kns35iYJCV+FigQqtBItS6u9xvHKjbMYJAJ+y6qGnRVAZB7tKfjB8D/ujJUDYWtOwRW/qcTqtkX5wpta8ADPc8CQPp0GfkyOOBhU6sDeuRXkDyj66vEhd4ksMzp+RtuEE1aASYS3UvNLiyCSp6XpkRVtPOeUl0WVpOmEWoC5ofxD9w9B3DHdRGh5ksdK1/O47FuQ44WuiPRlO3HRXsFOBNq1lK+PoaqI9QuPMMmCMeqCcLqdtSbCtuEoN+6+2v3zHqsb667Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bxBeU6ixCWT7Liod4Uq+mjJInF6ROjvk4EtDzWnAms=;
 b=jPza1fGtJ7R5ETvv5k9Ap+E0c3h2xM58fqSlPAJIamzFN/ghcrpJdfwNQh96ftKYieIQPkPvcfpYf19zJSSBXsf5x6yWTGbRyP08a8/V0YjAk+ENkdbZSBYNifYTRoqFySGrkfHQmues9W/kToaVIz+kBHNP+vKaqAy6hjuSwDtC2VbuxsZLHutW4Yjk+MjWQ3gzGn0WmV5WPBQPKlaJTqAl1ciKs7dG7siHDOjhrlp7ft0oi6E93tm44fNtoqu/0lxL1nj7Q8ewh8Q3j97ZDRopGpQ9XIJl7w+HBfKAWmmt21/JXhUFkZbtR3I1V/g3yxb/felvA4Z5rJ4tdIQFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 28 Aug
 2026 15:52:56 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:52:56 +0000
Message-ID: <098ea99d-bd4b-46d6-82a7-032b7f9fc5c7@intel.com>
Date: Fri, 28 Aug 2026 21:22:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
To: <sashiko-reviews@lists.linux.dev>, Chaitanya Kumar Borah
	<chaitanya.kumar.borah@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
 <20260813120016.3444891-3-chaitanya.kumar.borah@intel.com>
 <20260813123432.23B281F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260813123432.23B281F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|MN0PR11MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: f6401bbb-3c4b-45a7-f7b8-08df051c6d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FY4Ps+FBxcUfeO/yMGZq+D080Afu15dI1qtt9+/upCDR6aaqYrI24UsY8hfa4FL63XcsIdofS40v490QkNeM7VzmukwIFDtGXK+xfeePiOYGuHCfe0apZXKPzczb8ruS0AhHwwFZnkm5H46l7yB/11NEXSPcYXGjWXSWU9yayauAni9HQFFBfxqZTF+kB1u42clog4/OzcObMI9KNmQJWdCEEfG2yhhE3nHtsG814EQEjUI9YBVUJ7f6w12CBLlURvVx5XCn2G67ON23VHm2RV0BWthZ0QITecjg3k5pQzxkq4OUEYtWqBof8HSq1XpXWAmXNCMRyZANvQaNC7PhViyiONaPZx7Ef0e8yqkh4p4kl5vcDFeDEOAWmFXkMSNhPZ0+vsDjhKVkBynHEsPeYwI09Gz8VDGrTg5krK7e/5qt53qRFsMg44Z45WBj+JQelC9QOmLcmrFxPOmBM6eLGwVn940hZJIbzQt6WQLOCpqvkAxD0ZO68KFGw9t3hRYlYAhWorzji0r70myBoH+X+Vtr0JLprD7Po19lEVzUrPQATKNe/oqSLhndqf+bmNIg1WUSQtrZwPv4LmJh7YoLh2Lrcjw16KMXKcMhl/RDi4EUVMjoRuooMTWDzE1AWyBlEQoFQIlaHoBVpXhRXb6gnp3Z25eFAMig5IM6wJ1tuoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7554.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJHNVVMQUF0Q0VQdlJCZk43UXJrZ1Q3cFJIRnpSQkJxa2JDMXd5N2JFNTZE?=
 =?utf-8?B?M2R0azQrVnlTY2dCTWVkQ0cvYWdsc3FmUEVFRFNaMmpOOUhDQVNpWnN5ckJ1?=
 =?utf-8?B?OGJFYVo1bVlFUnNIY29ZSnNVM1NGYTRjWndNSEFiNjFOem5PYTdIeUVoYmtY?=
 =?utf-8?B?LzZmaWp6UkNGOTFuSEtDMTMwdlBGN2crUlRkaGRUdjBJMUpPejZ5djdaZlgz?=
 =?utf-8?B?YzllbzZPbWQ1OERMcDN4OFhmRENxbWZQemJiKzVYczM4cEN3RWJXR2czQTFW?=
 =?utf-8?B?cHYzWkU5aUZOL0QxM2JjUFNQTHExbmdrMjBLbnFKYnNZaUZBNXlYUTdpQU5W?=
 =?utf-8?B?QWlueEo2d0ZJN1FHYm1kZDZZd3dPRW54ZmdscVBiZDJndERxV3k0QkJTV2wz?=
 =?utf-8?B?NVkxSVU5TTN6bjkycCtBTHViRzBEOGtjc1NOSTBMMThtUDAxY1Nta0MrUEdN?=
 =?utf-8?B?MnNsOFpLbWVlTjB5VFQ4ZEU2ZU5WemVDZkxHdnRvWDlIVlJ6T2F3bVNRZ1Fo?=
 =?utf-8?B?L0kwVFpYcDJTRXFFTjFDWUJLTThTbEkvK3BWWHJGSFZoMGkyNng1UHBXRm4w?=
 =?utf-8?B?MHBtRTBHcGpra1I3M3c2bDJmdVJ6cnpIeVV5VHFyVWVTMUsyRWdGaHlNMS9J?=
 =?utf-8?B?bFNaMElSUE1xTHZ4dEcxd0NVYy9xZUdIUkJXSnh4K1BBRHlmczBvT200eVJK?=
 =?utf-8?B?aXZmd01QcmUvdVVZOVg1dlpIUjZUcUV1aHR6YitoNGRvam1HUU51UEQ1bTNo?=
 =?utf-8?B?bnhoY0tzVnB5V2E3ZTloZXRhd2dYZ3ozMmxjYWVVc0RGRHhVSVVlWElmLzFz?=
 =?utf-8?B?RFBPRjFVV1JGZlhrb3cyKzlzV2JoTXl2RGVoS3ZpQTZvSnRyV2MyZWc2UVMr?=
 =?utf-8?B?M2pMcmtsYnFSK0V6cnFOb05UWmJsMk1CNWNwWUVpQUJuZmZNSDJmS25kaEZ1?=
 =?utf-8?B?UlN6bTd2Q2FFVlZIemVqYXgwdlRDS3Ruc1pHcjVDcFAyMVZ5YlRVekxwaHhW?=
 =?utf-8?B?ek9keHFjcUxUZmRiczVsTXZBSm04cHVuU0hzdC9RMTR1STEyeVg5SnZkWFZE?=
 =?utf-8?B?Y2Y2MUQ3ejc1WWlOL1BGdU1HMGw0T0NOamtBeVhkSFhwVmNiMW1tQ0s2RnIw?=
 =?utf-8?B?S3V1S3JiMFlTeFpKNWlSaUozT0xERlFmQWRCOUE3UXNCUDVuTWhZMzdsbnhn?=
 =?utf-8?B?MWVWeU9IcVh0c003ek95VkptMWJML1YxYW1yaVpLOFZaQTU0QVU0OXhIUHFj?=
 =?utf-8?B?REJzTk9NN2pPa1NYbFQwS21HVXY1LzRISjUxdGIvSHM4UUo0SmZjRFI4UER3?=
 =?utf-8?B?SVRNSUZuZnhINlJkU09ObThhMTFDQnQrOUdleWZtb3d2bWZBdUZ2eDV5dVo5?=
 =?utf-8?B?eGVVUnNBc0E1WFNDL0Q5M1BwTCtVaVFWeStQc2N0cFpGcWxGM1kxR3VxeU1H?=
 =?utf-8?B?T0xuY2xwdmFnbU9IZkxEQlpBZXZUQ1dObDZtTGl0WDJQYUFnbytxYUk3bUV2?=
 =?utf-8?B?Uk1tWnZSa3kxVmFRaGZPK0oxTFpPdUU4bDVGVHJUck4rY2NlOTNBSlJ5YnJJ?=
 =?utf-8?B?VWVpS3drK1N4d3phUDNrNVFlTnVlbUlYNldXY2FseE4rQnUrL2krY1d6b3dt?=
 =?utf-8?B?V1poOTcwam1hTHZOeFZyL29EaFZpVXRlMzNiM0RnNjdqN2lRSkZmRGJCRmQv?=
 =?utf-8?B?ZHpTSS9rNmhkSXo1OXFQTzc3UVdzL3l6OGpsWGhOcTJ5Y0M2SlZNckhMTnhS?=
 =?utf-8?B?bElvNkN1MWZvcVhVajUxWlpwcTBUWWRpY21sbFFUMmtCcVFNc3g1ODNsU1l3?=
 =?utf-8?B?c1YzcHNaNXBEemlJeXBHaUg1NnF6YUkweFQ1Uzk2RGZyUTY4bWp1Wi9EOFJw?=
 =?utf-8?B?YzRqcU40b1dnckpDOHNZekNmSTZUdENWS1lCbkZNNXZhV3N1TjlKeU1tSGpJ?=
 =?utf-8?B?WWdpTEg3djZ1eS81UGhXT21tQUhkVEd5NHlVemVwT0NETXR4cmVnZGxneGs1?=
 =?utf-8?B?bXQxSXYyeHR3aksraTNUM0ZjaDE2dFdMcnQyNit6U2RkMmRPZ2ZyMmZQRkNq?=
 =?utf-8?B?VXF5SXo4dkEwOWhic0pZVGQ2VDBxalRiZUROYWdndEJMUVNZRUNxRjVDOHV4?=
 =?utf-8?B?RTFhWGRTVWxYakRReDNEY2cxM0xkZGM1bGo3eHVMdDc4MmlhVUdXQ0VsTE5H?=
 =?utf-8?B?MHA4d0xScXVqSndBMnNyWlVlaVZWSklLa044UUduY2MxZEtCTml3cnZ3ZFhK?=
 =?utf-8?B?b24wMW1oQjJHWURyYk5mSmw0MHR6dnRMVDFGdS9nY2RPU29vaVNBSG02M2JF?=
 =?utf-8?B?dS83QjQ2MUczNVIxc0ZwZFR3dDl6SUlMTFVuWHhFU2plbWJ2T3pmb2llc0JS?=
 =?utf-8?Q?aecQXiW8QwMBaE68=3D?=
X-Exchange-RoutingPolicyChecked: OBa2xHTZBbd3C4Xgwo2O/FSxXqnWXGcwGXvjcW7rxBnN+LY+z/WDKspZIQFekBYbMjO9Oc+4Zyo51EULkILedJHK/jxWblkCepPgrsfNHFOc04GRV8AKozsYX9ht5NdZYNTs5EVi4c5Rex9ZOq3nW64Ep4/0LDYHvz+AuvQpmeOKUx044Tv6XuAaAjO4/2p9zYaR9ceNE4UA8owUnICrpTd0OgJMuROE4aOWVnX8EHumxGnur/lM/IjSvCtDGWoINDf+3+0xUZxkdX7nv83R1a+Desz9XukWYoPOf+q1/v1Q/yie8llsPfakriAdI3+Y8u1C/OWfylbe6qhKrAtGug==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6401bbb-3c4b-45a7-f7b8-08df051c6d93
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:52:56.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86koe68gRZGfbzSGPNmvijYl1NRsDp58j0sPj1OOwCRmfn0nGsm3tEPrC2T0HiF28pWmggLundnvpYbsk0tUybYmlYKd5+fUu3PnXtrFvd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
X-OriginatorOrg: intel.com


On 8/13/2026 6:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The bandwidth check incorrectly uses the maximum pixel clock instead of the minimum pixel clock to calculate worst-case audio packet accumulation per line.
> --
>
> --- Patch [2]: [v4 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth ---
> commit fa98484a48f1957f560711682a22233b5a6fa1f5
> Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth
>
> This commit adds a bandwidth check to determine whether a given audio
> sample rate and channel count can be carried within the hblank period
> for HDMI TMDS mode. It uses this check to prune unsupported sample rates
> from each SAD in the ELD.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
>> index eae76e9611055..9eb6867fa3f3a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_audio.c
>> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> [ ... ]
>
>> @@ -697,6 +698,158 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
> [ ... ]
>
>> +static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crtc_state,
>> +				      int available_tmds,
>> +				      int audio_rate, int channels)
>> +{
>> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
>> +	int pixel_clk_max_hz;
>> +	int audio_pkt_factor;
>> +	u64 audio_pkt_rate_x4_x1000;
>> +	int audio_packets_line;
>> +	int hblank_overhead;
>> +	int required_tmds;
>> +
>> +	/*
>> +	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
>> +	 *
>> +	 * Step 1: pixelclk_max = nominal_pixel_rate * (1 + 0.5%)
>> +	 * crtc_clock (kHz) * 1000 * 1.005 = crtc_clock * 1005 (Hz)
>> +	 */
>> +	pixel_clk_max_hz = mode->crtc_clock * 1005;
> [ ... ]
>
>> +	/*
>> +	 * Steps 2+5-6: Audio packets per line.
>> +	 *   AudioPackets_Line = CEIL[R_AP * htotal / f_pixelclk_max]
>> +	 *
>> +	 * With audio_pkt_rate_x4_x1000 = R_AP * 4 * 1000:
>> +	 *   = CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_max_hz)]
>> +	 */
>> +	audio_packets_line = DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mode->htotal,
>> +						(u64)4 * 1000 * pixel_clk_max_hz);
> [Severity: Medium]
> To calculate the worst-case (maximum possible) required audio packets per line,
> should this logic use the minimum possible pixel clock instead of the maximum?
>
> A slower pixel clock means a video line takes longer to transmit in real time,
> causing more audio packets to accumulate in the FIFO during that line. These
> accumulated packets then require more TMDS bandwidth to transmit during the
> corresponding blanking period.
>
> By multiplying the nominal clock by 1005 (adding 0.5% tolerance) instead of
> 995 (subtracting 0.5% tolerance) and using it as a divisor here, the code
> calculates the minimum required packets instead of the maximum. This optimistic
> calculation could incorrectly allow audio configurations that will overflow
> the HDMI audio FIFO and cause audio dropouts when the pixel clock runs at
> nominal or slower speeds.
>
> Although this matches the exact naming in the 'f_pixelclk_max' comment
> (suggesting a likely typo in the underlying BSpec/HDMI hardware specification),
> is it mathematically flawed for a worst-case capability bounds check?


Mathematically the reasoning is correct, but this is exactly how it's 
defined in Bspec and the HDMI spec.

Perhaps the ceiling function and the audio clock tolerance can take care 
of the boundary case where the audio packets per line with (clock + 
0.5%) falls to 18 and the actual clock comes out to 19, though I am not 
entirely sure.

Since the patch matches the specs, I think we are covered.

Regards,

Ankit
>
