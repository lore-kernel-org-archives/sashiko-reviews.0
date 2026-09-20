Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56979248F72
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789919313; cv=fail; b=XwFlq+AfPwlQSBL85Lj0xGabf6wtfaoWC8tJl18kAfXT5e5gYO1ko+Q2oWWpBTm1vb/mygTfMMAE+uRuBeSH2sam9stw9qoy0A82uYwUwjpnump5DGPuJQlOq2iJFFi/VM9lr+U31B4iH4wMFjYFzB4MSMULZSaeQD7MMC9uymk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789919313; c=relaxed/simple;
	bh=1cm7xBe5eSee6KYfnMRVYpWyspQtxJ3ceBXbcoDg5sg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t+JqtsvG/7e9Zf6DVlgK2JZkqIL+7GcKBEdiUhb6lbk0QVVo72A0MjUoSc+GNcFNR/Q0qw9UoGXk4zE7Y2WpmWctnifE6jt/DTrxqclh9XkyA+4lNpuDJrq+q9LFuwzWKw/1F5F2kYfWml+r9VP0UGf/W35dwymsMnxGFdeP+rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/nPPYAb; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/nPPYAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789919311; x=1821455311;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1cm7xBe5eSee6KYfnMRVYpWyspQtxJ3ceBXbcoDg5sg=;
  b=g/nPPYAb9EBv8OPbFlXMPPojCVrFOI3C4SvdEw7vgqedCVqpAYHrnOqR
   FpW861AAtZXcolJa2Dhd3XKCzk64GcoZY6pU7JIwdKG77oAqugCCTSin0
   rglYezFrkCQl+ms+p7r3tsIuciRMlYNJ5HC/CMBTEprY2mW6byKRQ/lI8
   iSzM0KHLA/cwOXiyOsCp1rP4ecUbJbiqiRV6dn+CBnbNR+qAKxW/vjelQ
   HvjfR3yjAFlyJmCPRciCYJFaxWUTrot8c4t0kq+zqBSCq6PZ62LiD0bsi
   jIuuP62A8S3FjWv9gTZoXm6DhAj8n23zIYpMQwoFPwczMNUt/yZTNBHSj
   Q==;
X-CSE-ConnectionGUID: 6ycG83oIQbCRVz7F7kcOJg==
X-CSE-MsgGUID: auVhVMhqTDe52FHaeKaqAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="923922"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="923922"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:48:31 -0700
X-CSE-ConnectionGUID: 1yNt/RSPTOKfDM4QuG1AwQ==
X-CSE-MsgGUID: TviaaYI1SeWBMKtLFPz0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3635731"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:48:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 08:48:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 08:48:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 08:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx2pnff0iClZ+dc4Q13ogQocSRaCba7r2wyLnRdJ8dGSf7Z98JG/OFrGoJ4j7fIzL6ZR5ZfBDbGmwTQujcOk+yG1kP0wOMjReUHmMZCNe42ehWiEcHT/UqPUcRux6TpcKOXV7yAe1NvQK2MToqh77LUwIztMk9YcZfc/N+3jHZtFYVnKZ5QPQDfXuBFjXcj9GUpb45CtiF54+oJeh70JBNblE2xFu4F3Ols7094kkg8tpZSVgCDHHiZ9Dyf6I2hMMGa0zQqxzdNTZ6y32u6opvJmK27y5vvO13BGln/uTXXio9Rt5V4k9MFhMGJdoDIUeOJh5WGtxpAzb77bjpGumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot5Tkpn+qKK/GUo5Xx2ajEeU1oIo2YPWFNx9yvsC7Ig=;
 b=K1Htw9/51jGjaT4jgn6SmcVl9HMGfvZj9D9eB8MnIbHJvFDmtkFQ05F8qYiN1nlUI76pG+w3X6JgS8bd4lwaxzoW86rbL2NNqReYoAfIqZue6LxxwcR+JuKssfdP/v8YwSbYzxTY0+eBt1uodJ+4x+OhdgLfbcgJaowj27oEWnDoRdZzJEoha3hCiPZrj7ephWycUNbD5VXmsXv59n5ShwJ6crDK7tpid4mobYYchKDFbgUJ4DGu61hOY2z1IV56Y0rUydrw6I/8Fg7ZiPVURKt8sq/SF3YoK/cnougq02/dw1iTO3rKwbrI1DaySjzcRu+4pJAbGet1mfqA+FAeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS6PR11MB641336.namprd11.prod.outlook.com (2603:10b6:8:468::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 15:48:27 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0428.015; Sun, 20 Sep 2026
 15:48:26 +0000
Message-ID: <96f4b614-b9f5-46cd-9c03-a355cfe5adb7@intel.com>
Date: Sun, 20 Sep 2026 18:48:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 16/17] i3c: Restrict HDR modes to those supported by
 the bus and target
To: <sashiko-reviews@lists.linux.dev>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>,
	<linux-i3c@lists.infradead.org>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
 <20260920151248.46936-17-adrian.hunter@intel.com>
 <20260920153400.0E2171F000FF@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260920153400.0E2171F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::16) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS6PR11MB641336:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9d2482-bfca-4ce2-65c0-08df172e9ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: sg7HuDl9xZrbsiUWv2zG8iIOc5TPO4SDiNeNbjLAyoh5o6nmMf2ToxFkDoezdmhZaB7kjJhncqkRyIX6qte5gpYF9H+UtSxcAwiYBZAmb6C1kFW8xtNp9Jz65OQr8aunO5RjjAM5RA28Yv48jltztWN15RJVXS30kzPXR3tLmtYi2PBANpTjAmmebWxaP+Qum8A150KXKQktrh26yMH9wT1CD5+DmjRNuhr9Xdk7oygG7dbfwZ4/WvqRCbwClyVoN2jsxro6LZiYp1+8C622XTpcchR2bcbhW2Rd2l4brP2zHgOfVkOQDKae7L5YzrqvEfieuMDtBm89zNWybZ91oI8LoX2LsHBtATe5G9sxZtCaxnx77kWorxfYbltCe/3ClNgCYvzq/h68uITZYB/jQSEC0kO2+j1lJz1UTZEBNGhh4Uejk/qyUtClVvykYuY4EUOjQiX+YSNc4VJoHrGq+ncUOCVM+VYiRMBcGjtLf6TkpiIx49xMnSNXxmtpYwZIwMkb0STmlnwD94Kq91ru2a1xj6HKS6UU0ANYjGwR1bZefDAfgbxwY7IHTxA0StlqsdrMVOk6al+Gp+E33K/haQfS1btbc9OwocGW0B47WtVGRZCGnXwDE2pgWdAEOMDEuuiHOLeOo0x/7r2Cow8HtYnLVBt53H86xJYlltKP5X8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmwyamc5K1NlVERxMGFvbTJGdFNJQnVrZzdCaGViSEUxNDZ3bnQxWGVDUmFD?=
 =?utf-8?B?enJkTnhlNVh0a0dGVHZ0QWFvTUs2MXZINTBwV2M3aTlEOXpWWFJCWll0cXVs?=
 =?utf-8?B?RGUyeXl0eTZJZGF4VVV6Z2xqT284K2JRMTk5REU1bU9kYlNSRG5qYVFsZTE1?=
 =?utf-8?B?UFZWT2hwOWVWQ3MrU2t5aHMzcC9Yd3o2ZlBQY3FKQ0xnL0dmdGhDd0NHM0Ev?=
 =?utf-8?B?NUlVczJEMitTSkh1QytIdkt1eFNRa0taS3AwUytYM3dHWm5JZzJ0ZFpyTDFO?=
 =?utf-8?B?d3hOdVNrZFhHMEhOQzRqWjdiZE1Ucm5DbkhsNmR5Vk13TDlXVFZwdmU5UWtt?=
 =?utf-8?B?UWtoSTFHdzhVMFhybitCTnAwcUd6RUM1bDZJU2RNU0djZU5WWmZFWVVnZEp3?=
 =?utf-8?B?Qk1UUW5RYlpJQzduTFN0bHFwSXlJQ2w5bnh3V29UY2xMTmM0dSt6NVBsVysv?=
 =?utf-8?B?RjcvKzRFcUxyaWQ5Mm4vZ01tZ0NlRWZEZ1g5UFZZbCt5WFdnSlVkMjd2RXMv?=
 =?utf-8?B?YWkvQlhLMGRhTk93cG9BbERETDhiM2paQk5Gejc4ckdrS3E4NHVXS3IxRVRF?=
 =?utf-8?B?RUtKVGVIK2VPNTFQdDVKYTFOamNSZjk2NU1YdDV6VmV6OVUxbjZyYTk2YVBW?=
 =?utf-8?B?c2MvaWhIaUFoZkxxL1ZvWTU3NVpoKzB6VTV6QVBLM3VNb3h2aUp6UUtaQ3hL?=
 =?utf-8?B?Rk8wOEh3ZFlFb0JPT2pnYW5RT1k2cGkrSGFlb1orRDM2bVZjbERXcEdURjhW?=
 =?utf-8?B?REl3MzlTS3dMSU00MG9TU2pnTlQ2RTI1MU9sdmk3Z255YVgwQ1JMNVc2eVVY?=
 =?utf-8?B?VTNqUWl6azJIa3JjZGVDTUhZbGpPYmN1VHlIS054R0FJYkRSTkYxMXJENXJw?=
 =?utf-8?B?ZUVVYmFIdVZpSFhYRTh6ZDRoY25VbjlHWFhkVkhCNklxVEU1L3VqRFlVdDdO?=
 =?utf-8?B?QVhEeHl2cng0MGNVS21MOEo0ZzA0M3ZZSnJtVlhIOGFqSW9Yam1lbDlTZzhH?=
 =?utf-8?B?R0cvN3hhUDNZaExDREExNmJ2ZjllRmZkcEUvUCtjYWx5dmR3RDFPQXI4NkZu?=
 =?utf-8?B?YWR2aW5XaE5IRHlYdmZPa0ozL3BKRDVKdk1rdTRtREtlaDNXTkZSaC9aVnRq?=
 =?utf-8?B?RkM5K3JXNTdad3VUcWpUaW8xVHlKSStQeHIwSkJubVh1eWlqL2kwR29yMkJE?=
 =?utf-8?B?amdhWFBsdm9lY0VpQVVyRHFwdmhQaDR2UTR0MEhUMzBhcllpRDNZbEM2WUFm?=
 =?utf-8?B?NG5xSkVlM24rSng0K3NqN1MxODJuOWhGR2V6dnFPdERhRWcrV1h1TWdWbXhv?=
 =?utf-8?B?YlN2eElHT2F3amM2SE9YalIxWUw4cVFaR0hzTCs2eDV4M2JsYU55VHBnbk9B?=
 =?utf-8?B?b21aei85Uit5bTUrSTc1Um5lcjFVZ2JIYnhjUkd3K1Mzb2tWSXYySUtFNGRh?=
 =?utf-8?B?OGp0ZzBhbGhiaHphbG9rMmdZSlZnZWhXYmNOa0J1U1ZpbGVQUUxhQVN3Qkk5?=
 =?utf-8?B?K2QxcEZ1RjIxTEZsZTdNVFFLeGZ6UlhzVnpEQ1NJbUZnNnlxWlg0cHF6TGFY?=
 =?utf-8?B?VVg4bHVtaTh6WUhZNk9YSldKYjY1SituQ2RRYjlQN0JXWnVGT3ZNTDdZMm1M?=
 =?utf-8?B?MVpoYzljS0JqTVk4aHVnTVFBM21YOWcwaWVjVFRJQ3hjaHY0NGk0UjJkaEQ2?=
 =?utf-8?B?dk5RSjNybHpPZ3BTOWduVTFHVkNsT0hISDNwYzQxSWtuaFcyNWlQSVpxVStx?=
 =?utf-8?B?L2dvUWFCdGg2c3ZIdjJMNTU2YUJDWjR2WWE5Z1FzeEU1b0w4YW5NTlFPSlVj?=
 =?utf-8?B?eVNvT0srT2wyWW5SL1FRUWpmN2hsRTJ6VWpwaGVocHlzdmZhc0FSUjYxTitS?=
 =?utf-8?B?djU5MW1uald3RUVUTjNMY001SERzNXNHSUJZUjB5L25Cd1ArdEJOQkN3MkxM?=
 =?utf-8?B?TE9mVDQ4MFdNOGRla1BZU0djSGZDVnhrd3ZFNFlnL0EvNk1DbTAwQWI3dnlQ?=
 =?utf-8?B?M3V5dVVINnZIdmpoSkxQbXZKelhuUlI4OU1WWVJuUWp6N0pBQTRPbUxaSDcw?=
 =?utf-8?B?bzYyYjJDdjU4dmxFdVpHVHYyQ0RKay9rV3dOMXNzMU9iT21XSTRxRVQxWnF2?=
 =?utf-8?B?YzJEWTFFRHJZYUUxT0lBM3RwVmlSbFlOMFRjOGxYKytsSU1tbnVvWVNOSnFT?=
 =?utf-8?B?c255WTI5Szk3WDVHTnZmUnl5QmVncnVYMG5xMlBZUVBhQUJBOEZFWkNqVlBP?=
 =?utf-8?B?dk1RRStobnlFQ0pkMFo0SGZuMWptdStaVHVOTFN2UzVERDVhVDl4Vjgvd1Q3?=
 =?utf-8?B?ei94Mkg3cEFpeElESDhrNHUzdXJCSnNIdEJHZ0c2Y2F1ZWVkVkNMekQ5U3kz?=
 =?utf-8?Q?kycM5AQBddhCls/U=3D?=
X-Exchange-RoutingPolicyChecked: MJktvYuehSpU4pPyvFQlL2WhFyrO3yI7RD21IRyIZULRfJN+JEpVWLxv2MchjhPceLJWfkSfEt6HEO7BunRL4hmaj64B+O95y2OaIOUDKPIdTOAn/Prx7CmTIP/ChkqeSVfonIUpjHhSYLIgUt2P/WX0gjPs1DRJI45R8/5bVdgX28wcQ4IF1mGj8tgk+zXIRKzrGYg8t3G9bs3RDY5zKNQDk2pMb9SRYAKk4ubeHrtyT3r9pGXcOsBt+S63rZEhk7dmWARltvoUfOt3e02caTxyxq+Nfc/udE+Q8s8P2p4UAMQVCnyu81iRkMOI3AvYAmmyvU0s4m5F7dWwFW4d8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9d2482-bfca-4ce2-65c0-08df172e9ba5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 15:48:26.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvNmUsyoU66jPOwxb669Vf/n3grNxCPhngmXW5HRAsVIafo91w3xb1Csqz+1BCVsJJCYxHmTIzeyBPHmUU04GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB641336
X-OriginatorOrg: intel.com

On 20/09/2026 18:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] i3c: missing NULL check for dev->desc in i3c_device_get_supported_xfer_mode
> --
> 
> commit 62529bd655d4c18d69da34f93d179ce363aba85c
> Author: Adrian Hunter <adrian.hunter@intel.com>
> 
> i3c: Restrict HDR modes to those supported by the bus and target
> 
> This commit refactors i3c_device_get_supported_xfer_mode() to consider HDR
> modes allowed by the controller, bus configuration, and target. It
> introduces a helper i3c_dev_supported_xfer_modes_locked() and adds bus
> locking in normal use mode to access the device descriptor safely.
> 
>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>> index f1ba363b22a17..4df4682af1504 100644
>> --- a/drivers/i3c/device.c
>> +++ b/drivers/i3c/device.c
> [ ... ]
>> @@ -301,16 +301,23 @@ i3c_device_match_id(struct i3c_device *i3cdev,
>>  EXPORT_SYMBOL_GPL(i3c_device_match_id);
>>  
>>  /**
>> - * i3c_device_get_supported_xfer_mode - Returns the supported transfer mode by
>> - *					connected master controller.
>> + * i3c_device_get_supported_xfer_mode - Returns the transfer modes supported by
>> + *					the connected master controller and @dev,
>> + *					and allowed by the bus configuration.
>>   * @dev: I3C device
>>   *
>>   * Return: a bit mask, which supported transfer mode, bit position is defined at
>> - *	   enum i3c_hdr_mode
>> + *	   enum i3c_xfer_mode
>>   */
>>  u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
>>  {
>> -	return i3c_bus_to_i3c_master(dev->bus)->this->info.hdr_cap | BIT(I3C_SDR);
>> +	u32 modes;
>> +
>> +	i3c_bus_normaluse_lock(dev->bus);
>> +	modes = i3c_dev_supported_xfer_modes_locked(dev->desc);
> 
> [Severity: High]
> Does this code risk a NULL pointer dereference during device unregistration?
> 
> If a device is being concurrently unregistered,
> i3c_master_unregister_i3c_devs() asynchronously sets dev->desc = NULL
> before driver unbinding completes. Other APIs in the I3C subsystem (such

FWIW: no it doesn't - that was fixed already, refer:

commit d2c743efd2d1ee64e94324664808f623dd865872
Author: Adrian Hunter <adrian.hunter@intel.com>
Date:   Thu Jul 23 10:57:47 2026 +0300

    i3c: master: Fix info leak and UAF in device unregister path


> as i3c_device_get_info() and i3c_device_disable_ibi()) appear to guard
> against this teardown race condition by explicitly checking if (dev->desc)
> inside the bus lock.
> 
> Without a prior NULL check here, dev->desc is passed into
> i3c_dev_supported_xfer_modes_locked(), which unconditionally dereferences
> it:
> 
> include/linux/i3c/master.h:i3c_dev_get_master() {
>     return dev->common.master;
> }
> 
> drivers/i3c/master.c:i3c_dev_supported_xfer_modes_locked() {
>     struct i3c_master_controller *master = i3c_dev_get_master(dev);
>     ...
> }
> 
> Could a check for dev->desc be added inside the lock before calling the
> helper?
> 
>> +	i3c_bus_normaluse_unlock(dev->bus);
>> +
>> +	return modes;
>>  }
> 

