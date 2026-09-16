Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE362D1907
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532319; cv=fail; b=h6UqHqLwTXigk8XYRZMcx9Cgsj7bQa94red3rtg73A4FYSkprjE64kx0xBncyxTz9rI26RuScxI66ZtM8b8gTXgFBuz5nipgkVd6okQxkqr5/X+2YSPKSEhvqIwv8Y8x3q4EgoKSNO47r/ycxvV3PeSvcldoMpq6NyVtMaAKZjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532319; c=relaxed/simple;
	bh=fKysE5EVWKM0RPxjnmjDAAMluBJ2hxSwXelXNxGX9cw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G70rRmOVfTVF0f88pm9k4ki1+y89EjDEuhDzwSnKjQCxCjX10qIMEeclhJQTCQx2xdZ2QEx+UauCUvQ5CDOtj3AprdLr3p1DnCdYSxLjk8Ctr50NMbP/Go7yBnB5JnPtOSEaHdpXGFTZcYh3zM5KHuCwexdDyXSJNeKnvNiOJbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhkHdsLT; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhkHdsLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789532317; x=1821068317;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fKysE5EVWKM0RPxjnmjDAAMluBJ2hxSwXelXNxGX9cw=;
  b=VhkHdsLTIT7CKQspKw/y69zNWAb5VTenuIAFdOl2zkRUN1fywjPv5Fxn
   3gLlnU7i6WoNuWaYolVsxHZwRvj+nIrow+5lOrNMPB58eZ3QiQa8M5OgZ
   4FdeJPydkKDfBAWe+IpoJkQW32DFnH3gV1yGe10fh0HL82vH1lvDeu8ul
   eNKkZb5+UdImJgfieGF3Q4XhH3UX34xAqcJLcrtobDixeQj81t4s3ohc9
   hFic9YI59U1Dc5ajG9NAeJ2xNPn9WZovTFhRdDNd60dOTrrSy3rFMyjXQ
   t43oN6KEe+nnEswdVJsa2KoSqtM3doUiXl+c8n8HYf4eVh0MdfFmPylpr
   Q==;
X-CSE-ConnectionGUID: GxSg39P6Sfm5HL6lg9kbPw==
X-CSE-MsgGUID: t8GuGdcPQ02bXj73BuDDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89921694"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89921694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:18:34 -0700
X-CSE-ConnectionGUID: KhDlsqkkSIWXiprUExqLpw==
X-CSE-MsgGUID: 1666Vx/NRv+nzNANZ1Qn8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273761202"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:18:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:18:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 21:18:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7BtvvQZoUcA2I/MrK296NtlKfL5biKwNuWb+JnpQqGGGYBH0I7GkJxjM0EOxWso7bQEopwX5IsGuv0s18el6Fi5HaiF8tRqZ/JOUo6ZUvo5Lx5WBxGq4cZQN2hkLHhQ3EmXkfJSfNAqpm9mZG5XBC2xBpWTZbvsTBR2ElEeyoySmWWS1fSuG9HPbCP5Rf5Ff3Bq87tQdrRJpk8n2CNik4IuWYl6HVVyNa20bulnfFrLeHLrSxe4u9X/77NY3HwSp4ouVbxo5E0yWzdV0WD4lh6j4xfohB9vn7eOS1CRJVtwHW+usiV1dz9e5bIilEbmapV9sRC8iSxAk+6YlfWXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCO5BxUjCscJ9FmwnJUzTQDjLQHgBo6bA4mwurPfc1A=;
 b=vRxJmMgRHG8L8u6Z8x+Ki9/A2kUcwXdv3LSAKMNowzQXQUq2CJ7KGzAE5Mjt7NXQ9XYuJ2Fd/cnVC0qUb7QIctQg2GLEnujDpxS2E9/WGOwq/8pHgUgVITPczKR2kGrQpwdiV/Waj7XavEG04R/uxQ5bOBRa75Uk37JWCbZ6uebyEdkDdKt3+DAb6tVCpPKseHlEBDZ+MqbFBCLuSF5/CJHq6Qp/C0roVTi8S6CD8Ae8an3SIWj7LrwM3fkTv52Jj2LEuT461c5Oi5WJCVJnjiN3CAK3bRJHC+d9Wd5TNrE7zPNIfReGwsOIUA0Rm/jssN3ef3ITLzhHq2mLaH1JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by DS6PR11MB797010.namprd11.prod.outlook.com
 (2603:10b6:8:528::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 04:18:28 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 04:18:26 +0000
Message-ID: <74ef18fd-a83b-483f-a64c-131d5d3a49af@intel.com>
Date: Wed, 16 Sep 2026 09:48:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/14] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
 <20260915164657.3429075-7-ankit.k.nautiyal@intel.com>
 <20260915172218.D0EBF1F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915172218.D0EBF1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|DS6PR11MB797010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5bbdb7-8f04-4014-a37e-08df13a98dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NUClVts44Mrs38JCEFXv/U71LqJC5stV27/ZlSkyQFz+FnV7uQ7xo91zpA1aC7+NwxddiC6/oL5T2XqtrqLesBnrN3IhZ/xOArmEgLQLBkK3xisuzMdwhtunEG+yal90eJfNpOgyt+bfiGxWueShV9y5OHyEWdBy2ysfWDDlazdhyFzHwZ7suKOE8hdj4uYdUWArSpyKrBBeTCc7vRr2aNrFLmAv5sDOnyi78VJsjezcXlm+/YIcwoAsQM0PevoVltOOtq6tmhUTiT4wqZ/ojJfaI8RLeh8lUSiHxMXbupoSwN7EbRiLO1mOdwA8TD684WIf4cYTCscvncKql3vjQvO0MZo2jtj0cOEccSqe+UIGfTBfoXOgSzPfGsWJ6IQGf1+6TIbJCGkDGRaVRRRua2zU0uiYw1jnjuLhiCy1h4vhP5wN+1akhecksr/6pYBmvJzCTGepWTC9ROD9hhQxLXohFZAAVWv0+dX1cXrrNEl579SLAp6KZeRJskbNnxx7fXfU4xO4Ln8z43DxBnxksi/Egu4BQFUlqD0HmnwpYK1vMnp2fH7TO+1IM2IehTJTX0LIRs4crUhVvXdoT+mHueRfVceOfJjoB81YcwGMI7pBMI6UhmSRHEcZmzkwFFnsdc8j6Qtrs0NFY45sY8Hu1nl73tqrMwO2c0giHjwIZVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB148960.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpPVlkrNGhuS0lvMlN2Y2dWemMwSGYycm5ZUktIL1FZYVllN21OdEFndkl0?=
 =?utf-8?B?bTZKZFF6WWhWdDRuY2s3UE53UUFUMEpxeHlVaVBkRXVTbkJUNWdkci94MnJ4?=
 =?utf-8?B?ZUZ2SG5UcXhSazlha1M3RmFQN1FCb2Mvd0drSHZJRWZ0L1ZEZmxqemtjNmpW?=
 =?utf-8?B?Z2J2TVdTeGtQaS80eUVkQmYzY1FGc25DSytlNll3VlRPdGxnTndZcjJSYjlo?=
 =?utf-8?B?QUpNNy91NXNld2pMUXpwRi9wRHpDVW5BaVlRUEhqbHlqTkUzRm15U25ubnAw?=
 =?utf-8?B?bEprRzBJcVFmZkIwbXROaTYwWUc4b1hTMHg2UEpjanBBUGNpQm1nWlVwbVk4?=
 =?utf-8?B?d3BIZVViemgxeDBQOENMZHpPcDFDMUZKUlVHc3JSSzh2S29RNXlaNUNUazZk?=
 =?utf-8?B?YlMvd05odFpCWHpXckVpb3hYVEdBcHhyWllsOXVQcll0bkQya3M1VkZWdnlD?=
 =?utf-8?B?Wndod0N4RWlRQUNMRjE5OGRvUVQwODVVaXN2U2swdExSbXQ2TkRnc25rQUlL?=
 =?utf-8?B?VlB4UFVNb2ZvTVJ4RWdMWnhQTVVTMDV3R0hyUU1KZmVVcU5wTmtGamM5R05x?=
 =?utf-8?B?NUZROEZmREViNTg1Nm84NlI4b1ptVWNYaitGU3A4NzdUc1JsTlB3blpza2dm?=
 =?utf-8?B?ejVLVUJ6MG1rWEtpaEZ5ZnZpYUFrZjF6dEltVVk3Tis2VHFuaW1rKys2OUxN?=
 =?utf-8?B?d3J3WVQ4QjVRQjhZb2cxY0o4YXBjQjJqeU5qZm54MXJqblRkZFBjSVRGRWUx?=
 =?utf-8?B?bW1oc24vM0JVYVI0K3R4NWxDSDNnNjl0UENubzRkaUl2Rzd3UmtjeVdkQWlB?=
 =?utf-8?B?T1FKMG5SUFgrU1NHMzcya2FYY1pjWG5uRkM3T2JTMlZIK0FldVdVYkJOWVRm?=
 =?utf-8?B?QXkvems1cnZqRzkvT2ZETld2L09Zd0xGa3IzeEdSaUJJcFVkelg5d2E5d2tD?=
 =?utf-8?B?RE0wMVZPQjR1b1BJbG9vTEo1YlJGa2w4K2xMZW1oYTlORGJrRHFaNlRYeGwx?=
 =?utf-8?B?eWpMWEpKdHNoWTd5QXlWRTY3UE9TQmpYL0lhMkFUM0pWVUs3N21NVHFlN3RJ?=
 =?utf-8?B?VUxVMWRjdUQwUEhzZkl5QjQzbWh3elEvYkFzSjJTNW5jbU94aWIyVGlZazZW?=
 =?utf-8?B?VGFjL1hzS215a1ZYbFQyaXpQUFBPaW5oY3V1MXV5dkV6Nm4rb2puSFBlYTF3?=
 =?utf-8?B?QTVMY0ZGRUlQdUZIVjRadmRRZTNnMDJscUlaUnUwRy9xNkxPTVZyZU9oNk50?=
 =?utf-8?B?VEl5VWo5bTd0MGpTeTZ0ckxGTkEzMjdzRGNIUGp0M3ZLWUZxbzY1NHdHUkQ3?=
 =?utf-8?B?V1R2L1ozUXMwUTF1R0RrMWJKeGJpTGMzaWlDd2hJZ0o1dEhXd25VclU2SElh?=
 =?utf-8?B?ZDcydXF3OUFqMzlKSGVVT2crd3RFT3haejZ4czV3SjBMb2paUE03N2gxV2px?=
 =?utf-8?B?WXhaNGU3TElrYlBFTnF4VEYvVE9zNXM3YlhtY3J5NEJqUUJhc2tTSmZmSy9H?=
 =?utf-8?B?TG5YV1pDS28yR1pNam5RS0NwNXBEWGZ4N2NaOUJ0eVFDR0NPRCtTdEFtQkNt?=
 =?utf-8?B?Zlhna0I1blFxOG9FczBndUJSVlhPT214WGpsejJpMXNFR1pCVXk5RDRsbjFX?=
 =?utf-8?B?M1pPVkVaQURkS3A1dThPV0VBbFJ4YkQ3Uit6a3czOTdzNWNGV3lHcEVPNTkz?=
 =?utf-8?B?Y20zZk1SSTl0QTczSE9uVS8wMlpmVDNBcWpMZjZKc1YyMlM0UXpMRzVOMHJM?=
 =?utf-8?B?VXU5Ynh2TXViK3JzKytQcUNqeExGQlVOVC85WDNtdkVaR2kyWGhpZTFEUWE3?=
 =?utf-8?B?M1ZuNnhqS1V3NkdjWjNxd1dXblZ1WkRoVXpRa0lhcU11NXJLUVR0THgrdVlG?=
 =?utf-8?B?S2Y2bCsyRk5FTjhRZ0hZZUdtLzVRU3Ezd1YvOG5tNGpYYXFVSEJ6NXN6aTNU?=
 =?utf-8?B?Q0pRcXpON3Yzc1VkMXlRdVVGL1NKR3E5bWFKUWl6SXVrVGZDQTU4STJnODdF?=
 =?utf-8?B?OExlcUlNcTN4M2dhb0NwMzZKaXdlWDFwa0h2cFZFUTVzRVN4UGFxeStyeXc4?=
 =?utf-8?B?akdzb3paUHhQcER3Y0lRSW8wSkQzeG11ZWM1M0NKYzVEVXpBVzVDVURmbjE4?=
 =?utf-8?B?YmE2TDZxeE94NVkxUzBsZWZ2M3I3ZFNTdUI4T3V2bVFGbGNIWlZjbTgzaUN3?=
 =?utf-8?B?RUhIekxDUklZMUFudDhFWEpMUlVtbkJzdGJhdW56ZHI3am1SZGM0QnVqVUgy?=
 =?utf-8?B?SmRWd3RKWUlnalJ0bWVIRXp3U09WbHMxYzR5YlRHTDZFTGwyRHpia2FMaVdS?=
 =?utf-8?B?ZXFEbklZSXN2YUhKbjFBY1J6aHBtNjgvT3RXS0lPb1BQK2FIOUd6YkJLb0dC?=
 =?utf-8?Q?InCojn/9aeOC/yXw=3D?=
X-Exchange-RoutingPolicyChecked: Yl6GEFHas1AksBEiJjECyqJDxKaifYWdza1FFZCkd7A8u+o3BVsIWzftZbw0Nge9sEaCk1FVXD4PG44ZB9YO7R0ufe5x5tZgvwtvVGgfUMa+fk3/5ePVXv+M/LzvtmdU/yzjPjzXmd3knlSxM1YwUuF0KrVrb2eBGPanjs1fZ4ululHmxZ+CkNV3P2X9heoPWUDMxByYwi2iqUaPmgReZ0qAYDwJb1eI/WtIYmaxmajimQbCQEaIGkAzkjRP6EeRwNkh4T45QHDchF5BcgxweX9U17rnz5O5noQ7A/yLijmr82jtZj6LgdpWUC0qHXpJsOcDXfivWLddaPiz4FNyBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5bbdb7-8f04-4014-a37e-08df13a98dd2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:18:26.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9WqZX6A1pLjwq7AeaofMhgUxIsTCCHmL2Mbx/fKx/09Oo1dx2Xsy3695bivqf44s7vFllaHEfFlPA01VAGNZKSjId8lR6LB7VvGGY5kCPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB797010
X-OriginatorOrg: intel.com


On 9/15/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/dip: Spurious state mismatch for EMP_AS_SDP_TL on HDMI fastsets
> --
>
> commit 33aef03ce9383e1676d66a385c5b27a724956776
> Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Subject: drm/i915/dip: Store and use AS SDP transmission line from crtc state
>
> The driver computes and stores the Adaptive Sync SDP transmission line in the
> crtc state and uses it when programming the EMP_AS_SDP_TL register. This
> prepares the ground for supporting programmable transmission lines for
> additional DP SDPs.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 9b3b526e5e55b..dacb4b7588a02 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> [ ... ]
>> @@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>>   	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
>> +	intel_dip_sdp_transmission_line_get_config(pipe_config);
> [Severity: Medium]
> Will this trigger a spurious state mismatch for EMP_AS_SDP_TL on HDMI fastsets?
>
> If a non-DP (e.g., HDMI) connection inherits a non-zero EMP_AS_SDP_TL value
> from a BIOS handover or a previous DP VRR mode, the hardware state
> (hw_crtc_state) will reflect this non-zero value.
>
> This happens because intel_dip_sdp_transmission_line_get_config()
> unconditionally reads the register here via intel_dip_read_emp_as_sdp_tl()
> without verifying if the encoder is DP:
>
> drivers/gpu/drm/i915/display/intel_dip.c:intel_dip_read_emp_as_sdp_tl() {
>      ...
>      val = intel_de_read(display, EMP_AS_SDP_TL(display, cpu_transcoder));
>      return REG_FIELD_GET(EMP_AS_SDP_DB_TL_MASK, val);
> }
>
> Meanwhile, the software state (sw_crtc_state) expects 0 for HDMI since
> intel_dip_sdp_tl_compute_config_late() is only called for DP.
>
> Because the dip.emp_as_sdp_tl comparison is guarded by if (!fastset) in
> intel_pipe_config_compare(), the discrepancy is ignored during the fastset
> compatibility check, allowing a fastset to proceed.
>
> The fastset skips reprogramming the VRR transcoder timings, leaving the
> hardware register at its stale non-zero value.


intel_vrr_set_transcoder_timings() is set from both modeset and fastset 
path and is written for all platforms that support VRR && have  
EMP_AS_SDP_TL.

intel_vrr_possible() is basically checking flipline that is always set 
for the platforms that have VRR and EMP_AS_SDP_TL, so there is no early 
return from intel_vrr_set_transcoder_timings() either.

Regards,

Ankit

>
> During post-commit hardware verification in verify_crtc_state(),
> intel_pipe_config_compare() is called with fastset = false, which strictly
> checks the field. This causes a drm_WARN backtrace when comparing the expected
> 0 against the stale non-zero hardware value.
>
