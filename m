Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D884FDA77
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898841; cv=fail; b=JkkKMebs3FUtzBt9MmJx6KeDQMHzXmrPRqpSIrqt7/atqx0SUSIwNTs+mZlcKUUz189qyKhHxJDl5wypyWeXIsDu2SUNs0mKSDSoJKMuQwe0/MZkEbzisAIcYAVpIEopC0jLZ4C95FyjKgHky6k6OtWCf2lJkm6F44364UN4DUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898841; c=relaxed/simple;
	bh=kH5ZjrxlurM25LQRk6vS2GuJjmY0Tu0Y0OaaMMLse/c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lAcKxhy+ZFFtfL7O3Tx8DBkmXxCvTi9mZMizyeUt9deIQbFVcbHMSmsbsTH/kdWXwPNypKecoPuPeUPZ+hKJgiTRuwj1lGpG33K3uFpTy5nhLO1jsW9WVcADznGZ8CAwf0jXAKCpdKYwahpz8EKQS11NkqMM4GEzS1mggd6OFNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaiZrnbQ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaiZrnbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791898840; x=1823434840;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kH5ZjrxlurM25LQRk6vS2GuJjmY0Tu0Y0OaaMMLse/c=;
  b=NaiZrnbQtczc1ds5xx0x5UIaskS0MlFNCACthIgbVaU8dTMeBTh9jK4W
   f+EOI0yhgBB4dCrOxZX2b0mfSLDLRAadHcz6wgOFavY1GcDe7LgF8GK8A
   EouwW8Iesd/hQxXp7vgqi8Zr7tkgX37AEZ57eRyADK88NPqmOGgJlWmfk
   4Vnj015plcbis2E4eO3Kykjbg7tishAYsr9RP7IckOSKyYwh3FXIYomch
   bBH2n/M196ilFI7udlxZZ/icWYvkje+Cl6PHk3Upe0EHh5syPzPSY+Hxi
   94h0nz+6cM2cjoe94RgW7qb9zVs0JeANcFm/DmQHQgqH7S6kOb+KJDoji
   Q==;
X-CSE-ConnectionGUID: GyQD2wJ/TOuNr/Z8/StD1Q==
X-CSE-MsgGUID: 3pyqEVIeScaSc9fB6vI+bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="627825"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="627825"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:40:40 -0700
X-CSE-ConnectionGUID: STPD+E1GTW64C+UTaQEwhQ==
X-CSE-MsgGUID: XowaGnxtQHq4KWznFpPI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2927800"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:40:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 06:40:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 06:40:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 06:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCKtEgXR2LwVXCvGzAAk7dNtW6dTzwyFJ9TXf9ei+pg/7tWnjx9KTMwINA2Gfu07wvawzMP31jNSOyTJQSLtl22d6JDWX6lHmclWBM1gnt0CZN0A7qyRzc53f1vl+8ZblnJ1GedFLFxPbpm+sQgisGfqwbJRXM/7EK4O1o3A4RuRrBZ+QwUARo09pK4Nqyf3V9KlqqDQrnT118fQC9/8V+oVPkSzb736OaU2OOQoZLxPwPn9UPnEk/uOkzOAZl+w9hxUNZQeOVXHuGQh2ppWox9DVTM/NkzehBp/XKeTPWc5IiYQPaA+wy62YOjrmXETo66dFVeNtfH6MAX/oVJxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbojo2OomNf2sZdzqa/DiKJeX4oprkPITFwbGOMBiSY=;
 b=nZrTjvQ6yKInGgC3YWpTFiw4fvrrdLj+AKI//RJkreLyUcvgICUxRiHvKbtuPzAjgZFskRXhBKaOusuMU8/V5q6RkBlqqfrzGsJEpiFYRgy1AZlL+/M6rNUQaKnAS6ljO0Dm6mXjhAufTQJ6swMbRFj3zNfN6tiOte94A4M9mNZPGJu4UL5vN9n8YxadrWoqbaKOzfyRnxv2XSUH+ZcxVRVjyWxX23UxvV21HdgBYJqZ1ZbOxUFa9kOtHIwnmyCwvv3Y7T8dU1hngzBoYtHpIKTqKoervH4c5BiuZgQYXEtdQear7ByxE15eZxRO4PJoJXHiRbXLKrf2+BsWi/L9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.35; Tue, 13 Oct
 2026 13:40:34 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 13:40:34 +0000
Message-ID: <1db07de7-5d4e-43bc-af9d-65ff2e5c52f7@intel.com>
Date: Tue, 13 Oct 2026 15:46:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/14] ice: bump to 256qs for VF
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-wired-lan@lists.osuosl.org>
References: <20261009121433.30347-1-przemyslaw.kitszel@intel.com>
 <20261009121433.30347-7-przemyslaw.kitszel@intel.com>
 <sashiko-outbox-166501@kernel.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-166501@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To LV3PR11MB8508.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: b819906a-390d-4576-9fac-08df292f8e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|18002099003|261009223027099003|10067099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tPJovYPO+AunZEWxu113f9uF2jKSESqrLAjL2F42TO01jq1WBfvRHAk/rwpU+nlohGT8ki8OaKxp3d7urZo834zulPdu7lAn9mrFS45omcIeX9CGRuxNFN9i/+IOuAjdtvdm2MtHp4QDORzhx6caDXfr7tsov+uZpM7mXF0zfFH9Y1uJntoL4u+wjx6OlkPfGlFrzcbWPaO6HnKEUZEETnHPKOBAEwmxouIJY26vmbMXciEtTsfkMTL2KPopmK03/e+rWpNxR3ea/oSHXcuQZzeMB2ADqa7AxE2ZULaBJVi9rXn68ews/CVBt7BmLIIJOlWkcTJasd95XpinukhZ31y569WEktVLWDAKiBOrdO/JPrVDY/LsoBscnoYfAt5AGnvr1i6jeSxjdcIcVuIueHVTOsYXR6JNIdjiNiclGDXJ7zdA8jL4CGwXDEfT6KJ0UqkvhXpA9gAq4QC37Vkd0+IynevU//mQio70919oAlOzADRX6YLtkPhDWniY/WOAG69HJk8DY8H23b5CeBignPM+ymJ6g9bN8bq9JXoK4BUiqTWZhflXd/MWSWpP8uNjO7YOyb2WiB0nCBoutCytfJ68Un20kd80f6g5bkM4vykcUrzeji/EkPWMCwEiIPuSB5INhTtdv5hpaj3qTPgLQInjQez/nSpraPSR6hX8Gsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(261009223027099003)(10067099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFNZblp5dGFhWWlKdUNmY2IwSzQrZ2lGaWVwUnE2djZpMWhwYVI4QUUwYWxk?=
 =?utf-8?B?UXduSUFOUjNaVzJJd3g4S2kwOTdUWDZNUzIzczFFTmxvUXoyQ2ZFZ1k0QWV5?=
 =?utf-8?B?bTVTc0x3eThrTkxicEdGT292ekIyZXI2TmlUMTJrRjRxb2pWY2E1RTZTQU9z?=
 =?utf-8?B?Zm1OS0tvdWZQR2lQWE9WRnhhRG1GU0swNy9DcjNGR0ZEM1F3OTVGMGpxaEEz?=
 =?utf-8?B?UE5aVGhOUmtqVzJJeTNSY2wvUTNPclMwZmtvd1dTQk96TEUxYnIrNEU4QnNm?=
 =?utf-8?B?SE1LRHB6Ykl5djhRdVFhN2xONWZ6TUJVRWpwMkpZUlB1TXBWQXNoemlZQ0tI?=
 =?utf-8?B?MUlmNzNqMW1FUEFLSjZFMy9kWmFaSTlEWU1CTVBVK3ptMTdERjdZQ2xRVGVY?=
 =?utf-8?B?YnMrZU9TWVllQkNPcXhiYmtEcWpkMVpDT29NdjAwODNhTTFSalFHb2c0Vmt4?=
 =?utf-8?B?VzE5WGhncU5VNll2emc2V1R2b1REdmlQMlhlVFM0OE1XR0prRTdPUlE3YXpk?=
 =?utf-8?B?SGx5d3M5YlJHY1VnWTU0bEFtSSttcHc3MWhIUDR2NzJCMi9vdTVIMXRGeUhZ?=
 =?utf-8?B?ZTNnMnhRS1V0Y29XNHhCZHVDcDZ3Q1lTeG9xWDdrYnV0aVdCWjlpOTFWdkZX?=
 =?utf-8?B?NlZQanFhNUxQYWhYR1NnSk1PWG9YZmR0N1pDQnFVMlJua0twR2JFVUhmR0ll?=
 =?utf-8?B?T2NjbVROWUhkQm8vNEJEWFZBR0RScHlWeUVNYWZldk5qeXUyeThjbCtEc2x1?=
 =?utf-8?B?RE1QbUgrZkxIRkw0THVSeENjVFlxaTB3NnNqZVB3QkFYWEVNL1pZd1hpc2Fz?=
 =?utf-8?B?Zi9JQVdmeEV0TWV0VVlvQmF0ejZEZWFTVzVGb0JTU25yU2NOUkRiVFQvamg5?=
 =?utf-8?B?dHJXNE5DYWJmUkQvdk5GOUx0R2UwTll3SzRrV2JNZE81N1Voeng4eWszY24r?=
 =?utf-8?B?SEIrS3BpeUNhNUZFSFM1N0RPcUpKZTdiRkQyc3BmR0R3RENndERVNWRrdU5F?=
 =?utf-8?B?OGk1WU1zWC9XNnZvejd3SU9UcVFMMWhKUkpjbWtHTU02TndZd2FFMHdEUW5Y?=
 =?utf-8?B?NmIwc3VJQ0tVcllxSzJVQ3BWTUlrU0NWeTdxdmNTN2IwQ25HYVVDblNNTWhR?=
 =?utf-8?B?NXp4cEZOS3dxd2VuQjcwYU82QUtIc2t2cmFFTGVzL011bnpwd3BZZVVBOTJi?=
 =?utf-8?B?bnZiYWhTM3o4TmtCOFpxWWlPa1ZqbEZFeW1IbGhsZW9FTTFvNkN3bVdUaGow?=
 =?utf-8?B?bFJjRTg2b25JMmFYeWQrN3dpYmlIZEhyck5nb1ZMT0tyczlwZGFSTDRnWnVq?=
 =?utf-8?B?cURpZmVsUWt6SjN4M3QwZElaRjZJWWhnUS9zbE5jbVVldlNiTGtkRml6QWFP?=
 =?utf-8?B?cG50SS8zNEpQS3VxRnl3M3BjTTVXTUZ3QVlWcVd1Tk1sTkczQjZpb1lHRVhi?=
 =?utf-8?B?RjduTlhIM09lUlRXODU2TkhLYWhobEkwdzVzMWpuWHJoLytaTkxTZmpHNXA1?=
 =?utf-8?B?bWd1VmN3aTBmckNCN1hvZm5ZalJXRzFUQitWWWtsMDl4QTgzWnc1L2NrWHRU?=
 =?utf-8?B?VGxGQXJrQUZpWFQyZVZZY0lwYmFQa1J6eHhhTlFhSGFRYllURE9ZRzBSbWpG?=
 =?utf-8?B?UDM5ZS85VkhOckNpdHM3bVZJRHhjVmQ2MHgxRFZyUE16aDZ2SE5PNnA1aktT?=
 =?utf-8?B?TFNpcUNQTzFHT2U2T2xCN05jZU03ZjhBRWEvWVlpTy9mMnlUaUNxc0IrNVE0?=
 =?utf-8?B?amRIb0JnRnJ2QU5WRWdwVjJoQXQweStXcVJYbkMrQ05VM0NTY3hRYkcrSk1Q?=
 =?utf-8?B?dHRjVm9MNmhSOWdQL1N4N0dlSmdVTitvdHE1Y25pdDVyM0h3bVJJTUpMK0RQ?=
 =?utf-8?B?R2d0M2ttMWIrL0NEWGVqQ28ydEtnOG4wS2w1amFqODBlM2YxVC9qYlE5bm1q?=
 =?utf-8?B?d05NQ3dvTFdNT1lqVHJFNXFnSzBTcVNvNDNSazZua3NsNVlUUjQyWk1kb3Vt?=
 =?utf-8?B?aTNqOXIydnBuVmVVSTNhbm1UczhKRFV2M0pzbXhkLzhwUmNQUXF2UmtJVXJN?=
 =?utf-8?B?VnFRNUZzbldwWFJYeGh4NkQrekMxT0NSUFBiOUxNU3VJSHcyTFEzczc0THRm?=
 =?utf-8?B?cmo2RXdPQlF2OVJyV1J2aHQ4NHlYMkNNYXBvUWMyaEJqVXp2dW9aZUtZZWUv?=
 =?utf-8?B?M2svRGFzSzY3YTY4S0oxZ3E5MkRkdmtqalVkclR0czRsTkVMODV2alg1VVBj?=
 =?utf-8?B?UXgyZTdnUFM3L1RZZHY1Tm94S3lIZ2pYb3lMVTFNMVcxc0g5bGZSR3R5MTcw?=
 =?utf-8?B?L1Q0aERTN3c1ZWVGdmc3MFQ0UnlubXZObUg1UXRnemRyMnVKbmQyLzhadFRF?=
 =?utf-8?Q?i3uOP2q+906nVvP4=3D?=
X-Exchange-RoutingPolicyChecked: TDSBnPHYqBIWrOShOqt+v/kmiomkH/CsPWjfyyoFZTptd9Q1QhrWrJB3Rr01wfNfqYp0ji/AQp/gGdBTp0cxJx3AeCwR8P3BZD/vrEONYUJ+pzRlE0sFP3ar8qPI6oWhhwWvlyRqTn6OqAWxdkA8/C6mT0/ZO1RMV/FaviXBRu4YixNTIBszzH8P/J3vn+1i7L8cZkzSdNPr+hC9vmjl5iUZb7FBjnJnwN7X7/czRqa6nUoRVocX7JnyJaT3iLwRX6DFnndX37OvO7Bn3gwP1x5XuzRe4DPb52GrkFqcbGMC26a8LU1/wBy0NIBKSKSIJH2+itqbT7YBQE1R+drQkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b819906a-390d-4576-9fac-08df292f8e90
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:40:34.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWs9iQ2DM9S7Ng7uiUe0dCimxLuK/xBoJjrbJC2M9vuq7SPpcDZN5Civnh84WDYHzUwkOf7Z/y3Q6nx9VWDAg4VQLCMOPeQk8X2HLHrgsqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
X-OriginatorOrg: intel.com

On 10/10/26 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: virtchnl error path disables wrong queues when loop index != queue_id

unlikely error, but easy to fix, will do as v3 is needed anyway

> --
> 
> commit a7e9d03ecfb2e4d593b7ee51e67a3a4e87ee7a85
> Author: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> 
> ice: bump to 256qs for VF
> 
> This commit adjusts limits, bitmaps, and arrays in the ice driver to support
> up to 256 VF queues. It updates the requested and default queue limits while
> retaining the legacy 16-queue limit for older virtchnl opcodes.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
>> index 2667634e3c8c3..61304493af34b 100644
>> --- a/drivers/net/ethernet/intel/ice/virt/queues.c
>> +++ b/drivers/net/ethernet/intel/ice/virt/queues.c
> [ ... ]
>> @@ -841,7 +841,7 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
>>   	if (!vsi)
>>   		goto error_param;
>>   
>> -	if (qci->num_queue_pairs > ICE_MAX_QS_PER_VF_VCV1 ||
>> +	if (qci->num_queue_pairs > ICE_MAX_QS_PER_VF ||
>>   	    qci->num_queue_pairs > min_t(u16, vsi->alloc_txq, vsi->alloc_rxq)) {
>>   		dev_err(ice_pf_to_dev(pf), "VF-%d requesting more than supported number of queues: %d\n",
>>   			vf->vf_id, min_t(u16, vsi->alloc_txq, vsi->alloc_rxq));
> 
> [Severity: High]
> With the queue limit raised to 256, does the error handling at the end of
> ice_vc_cfg_qs_msg() disable the correct queues when a failure occurs?
> 
> Since 256 queue pairs exceed the 4096-byte admin queue buffer limit, the VF
> driver must split queue configurations across multiple virtchnl messages. In
> the second and subsequent messages, the array index i will not match the
> actual queue ID being configured (qci->qpair[i].rxq.queue_id).
> 
> If an error occurs during these later messages, the cleanup path iterates
> using the array index i:
> 
> error_param:
>      /* disable whatever we can */
>      for (; i >= 0; i--) {
>          if (ice_vsi_ctrl_one_rx_ring(vsi, false, i, true))
>              ...
>          if (ice_vf_vsi_dis_single_txq(vf, vsi, i))
>              ...
>      }
> 
> Could this use of i instead of the actual queue ID inadvertently disable
> unrelated queues, causing a denial of service to other active queue pairs,
> while leaving the newly configured, partially-initialized queues active?
> 

