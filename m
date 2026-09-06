Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC73B28D
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711543; cv=fail; b=J12oNxtDg/l21TqYDGr+sLp005kTXqw1N0436BeC3B7jrHMEL7CAuV2/aNTDhnO6qc8YtzvjLYlOGGvUefaFM1vB616PDOBdaeMt/G7/PC5gwnPS6ceaezMBEwLTauM1wGalEpDSHOjLBfshpI18wWduyHp6DA2ITOsRmHDznag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711543; c=relaxed/simple;
	bh=kCKQsMgpF905AjRH6+mrsnG8v4DkSRCzP8qEXE8scK4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RE9iVNj7I5QZW6OcOYVlzYXCYYqup18Ei3/ygucdAaP3J7u3EbbeJMhFbHhVP5QmWbWKpkvk/VA+rdcqyafWEFFRnVel/dz9kf1WNWEcudiMDR3l7PnhcnpdX0IXrIlqa+B/7addz7QklYK0eFQFvGpq7R+PD92abt702BFyh+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kl+RWSpK; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kl+RWSpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788711541; x=1820247541;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kCKQsMgpF905AjRH6+mrsnG8v4DkSRCzP8qEXE8scK4=;
  b=kl+RWSpKLA1na5JzVNtqZrGrTKBZJCzXkI1/PGSCf5rP5/aDIQgUzQCv
   QfAmaDTG6d43WvtNVAltWQ5k44pg4TBm05wwea37hhIX1j5zFSkCmJJmS
   dk5s7h14ta0Xb8TEJo6uWp2QXMf91roWhjvrhlLjPfMcjsZZRpPDuHX+S
   D0Qnn9GcMiPzW9z96aZA8nIFl0LB+S8GnJ+wtZEFV6PXS/Vv3qYPFAMiB
   qgzUsdqPrzPLK4DtukTrceDXg9VJ9K6G4B1AxkUdHh/OcFWUvzf0w9Ft4
   U3huNSDRzqWvhaJn8O6USVU/SzTlNGgD+90zBvSgNzPafpAjJ9uKGGF9u
   g==;
X-CSE-ConnectionGUID: WW8+5XcRTxuuH7o9kS923A==
X-CSE-MsgGUID: EuaPS5gDRD2zNa47gRK9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89185368"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="89185368"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 09:19:01 -0700
X-CSE-ConnectionGUID: ib7FVtQUTLOu+WcGo92S8g==
X-CSE-MsgGUID: l246z2/JShCz2hKtVae9ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="274658353"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 09:19:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 09:19:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 09:19:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 09:18:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akzjR0gUH+5G7aqVm/HA4gNvdp8GWTdaDU6vluCgRWvu2czeUq3Hukx1uVE4NzDCwH6f6Bqpvx4IpZh7T7FSuS/9/DRp8MR3NatGZMYMrjP7yf0C6Wyt0DW8C0nTtgPJdemNedHpU3dVBufkd2et41LsSXBi3sXnuTxeai8Nefwgy+kZdmoxHQz5hj87Eid7a1nEUE2miC3KWzSMUQne7sMYGjlpBPlFi8Jof3HMIe61adaYNwm/W5KrTGKg9T1B2ww9GXPHkBsfaVpSb7ODDJ3TwP7InyHjmtEmfE7EfgF8upl/zBca93OVK7KVjXzDaYtqZOyS6dRKaldSV2kRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opgzq6NgWPuPe/Man4EtU+8DqsnMPB4O2OC2+AQfR1A=;
 b=LYVBEoUOeJIVthpxOR2KZLPGY5/kxX8VVATZMF2erMzLoC93/tfsMhK78GzzKnWJT50KKk8mSn3e+nZR4r+/gArFRU//Njfjh4hh6aLprZb3wT4DSpBt8JRsvLWIt7ibLye1+lu3uw0pmNoKgLPeryNkVEyIrR+s6yIGHL53mdhnH17N9s3Wd6rbwUJxoLskrMBnAYHeTEIoFdm22wPDQRaXjNIGM4RRb7VAifHRY1okp6q/eIStxk8Mj3V/gHyXLgMUICZbwMqExcgUDIKIPi+4oDPOlfL5sQO75NBR6TwCYb0Ce4tjBmN2npXoo03Oif8eL5UmcpPpGxx5wVQFjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 16:18:56 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 16:18:56 +0000
Message-ID: <6a0b15ac-473d-45f6-9bd8-71a5b681b7c2@intel.com>
Date: Sun, 6 Sep 2026 21:48:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/cper: Allow hardware error CPER reporting
 from xe_log
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-20-badal.nilawar@intel.com>
 <20260825175419.377F21F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260825175419.377F21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: a13d80bb-b916-4597-953f-08df0c328cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xCsjoiuF/v2XPc1SxBhqRRurkqDpRmNucqKbhUZ/aTGOX5ao9VB4DP4zX0hbA4hdsPqTmZUu6kowpSJVdNDPghWEy+gCK8ZbKXH6zfgGwMfYIrzC0O3/lcH/unmHzYYAxVJl++u8UkiFE808hXp2JEeFOgZTRkCgZUBkQlee6Xf+8hJRKWLRELoKGHmewwtli5iqg7CCF6tV9syGJSjs/rOmD1YxOO92QjO79repWC88+55DZQIcb080yOuc2xRYVFr514KLiXunhGPENBeDPWqE/iK3KSUOdM+/zbO9w2mcC8HaLssO4++xIcsyOH34sCXwaj1wSBn1Y11Md4113IcazgsYL285LtMDLwV9mO70Sb5Cqb5gvfUuGEYFqHkLzLV7REU3pj9is7j94LAffNcaXx5hqlWU+F/Mc8M+HsYmhCi6/R7I/aF3B+Z8DUYJ0pX9eO0GaC04gENwycoUqD73yEAMM7NkJbjqw4UvexNWsTrRmPP5hNV8OhgBc3oCxVChQ2OHOPH0Pz+FB1lt/+x00q3oxX7pgE+2kNRxVQHCTk+m+KsQsEpIBHUv/KGnkUtVJRVD7uG/pY+pqLxCge5LNdUzUj29/BYJFgC85WRGkkcx7JNEInXFVZ5nPCl6kB4/W/RriP/DxKrjeMucKGJaAQ2ozH4GoUbpF3r4Pys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTYyNmxPdElBWkVmTC9GTUZzVWFiQjRYRDBycElCZHVycDh1cHJOSEdJTmFT?=
 =?utf-8?B?bFZYWEliTXYvQXBxaUdEL0FHbnYvaFFlRE9SRUswcWdvbXBtanlRaFFLUzA4?=
 =?utf-8?B?dXIzejAzNTMxU1hPMkoxZGhqS1JJYW8xZGtvdmJwYyszRVovYnhVYUhrU1lY?=
 =?utf-8?B?V0ZOOEZ2K054UTZHK3A5Tkt0RTNlajh6M3VmRzFlVU5MWnlCblJPS1JqSnl1?=
 =?utf-8?B?WW93UzNTclFoMERUajJ0N0RlWlJROUhIWmlSYUt6QmZBZHJJeUVjU2NPQWs0?=
 =?utf-8?B?aGlpT1NIcmwzVFE5Q1FyK3BUc2FXYTZ4M05xbWZMd3NqSnd6T0JWaTlSaXJm?=
 =?utf-8?B?MlU1bUpLMEJueHhjOWxPVTZiNmZEbFBzRTBJMGhLY1EzTVJrSDY1dUNuRVNK?=
 =?utf-8?B?VGxyUTIrUHVQcmFqOVVxdWFDTnpSeEVBSGZhbUNJTlpRVUJESExKeHM3YWpm?=
 =?utf-8?B?Ny9RWUpFNU5pd0lKemtsckd0a2ZxbElqeXhtLzlxa1JqV2NrVDdZblZabjBC?=
 =?utf-8?B?SVhlWDZCbmc3RklaVWZWcE96WDc4emRuU0hvVStNWGh0Um1vUnRnMUdSR01t?=
 =?utf-8?B?V3Y0TkFwWGJoRzZ4MGFqb2RlcXV6OHFzL0VoTUFVaEJ2TXJmNXgvWHJHUXNy?=
 =?utf-8?B?d0dWRFA3alZHR3l2ME91ajNuTjN6bkVtZTV1VzVab0Vjanpnc1NiZm05OWJJ?=
 =?utf-8?B?NXZjOXltUFMwZmJYTW5DSnU5OUJoUWFyMjVjZDNzbGZ1OFFNVXZRMjd6czVo?=
 =?utf-8?B?d2ZSQkl0UTVveTlWU01mY1FSMUxZK3JFZWxSV1lBS3FjTGkwZS81Tk1oSkRa?=
 =?utf-8?B?ZFdZV0NSazBOUEQrSitqMGk2eHgrRzJYNVIyU2hNY3h6NG4xOERlaEY1YjRR?=
 =?utf-8?B?NUZHUWoxUEZEWEtBZzA0ajFrWFRXcnBiUzFPZ3lwZ2RDMVYyVjMweEtvRGV2?=
 =?utf-8?B?blRVN0s5NnJhVVRKSElLa256dHFEZ2NwYnJnUDFNZWtRS0ZjMWpkT0t6b2RS?=
 =?utf-8?B?NDRpU2NZd0l5YmtPNGNrK3NLK2dCaUQxM25BOGsyY0QyWFRrSTI1QzJsUEFO?=
 =?utf-8?B?V3RDNDI2Rlp6Ymkrdis2cmRUMndDNUZDUnZPdVN5MG9iVWx3cTh2VjFUMmhB?=
 =?utf-8?B?b0JYckM1M0pzS1pHS2Nubk5Nd2NmbkRvOHhCakJmQmxBSHZoeC9wT3BYU2pP?=
 =?utf-8?B?SEVrQXp2QjB5cjVnVVpOeXd2Wk5xaGRrTG5IdnZaQmhuYzN6VnBXUHd0bHhW?=
 =?utf-8?B?SHV3djlLTVFuRGRkRmREdlpQSEVYdkVFS1d2UmJkUVhlK2JMcG00d243R3po?=
 =?utf-8?B?UjVjZWdRdGVQK1VuL0FhRmxrSzVzUGNrYmp4SjZUUG5VRzBNYkhxOFNkeTZ1?=
 =?utf-8?B?WUIzRXAvRzFnd2N5UlRPdEFxM1BuK2hpUXhvVDhUUnF3Y3h2Nk1GcmphMVJo?=
 =?utf-8?B?Tm9WZDRHSmZFUFlZQWtiMjIyeWpxLzZDVXdQY0tQY1cyRlhqMDhkditEdU96?=
 =?utf-8?B?QXhHSENUQ3oyQXRXeW01WDQ5SEgrVWRWVzNVVjZZdjhzVEhTeStxZzhIalBm?=
 =?utf-8?B?dU5lR2YvbUVqb1lsUHBzRTFTZ2dDbkxZQ1I1ak4zb2RrbHpNMkhYNDJpRWZi?=
 =?utf-8?B?Y1o3T1l4R1JDZjZHN3RreUNYdlM2MWhPZkhadkNIQkhmekgvQXhSdEtPT3dL?=
 =?utf-8?B?ejVnTWhCUllOdjJDUzgxYnJMdGJMNHNiUXZNSWVXdHQ1N05PdlYzeThXVDBS?=
 =?utf-8?B?WC9zekxYQVFMTGZMZDJnU0E5N0wzd1FkdHZObk5hL3Q5MFFFMkVpUDFic2xa?=
 =?utf-8?B?SWt1QkJ0NDFZWksrMW5VZWs2eFloOVV1WEdSTEQvVXZFZkhPc0V5WGtJT04y?=
 =?utf-8?B?WFlyb3kxRWErMTAySnRjZlViV3NJYXFFK0hDRTNGcnJXeHRseWl4SXJ5UEpZ?=
 =?utf-8?B?dWtJY3MvUWtRcGIzcDFKV213andoVW5ycC9WYUU2dWxZTHlTa0ZoYUY3NmRX?=
 =?utf-8?B?NGxkZmNvNlRKMUZxUVIvbUJQcWZzRTgrYnMyVFBVUTcwNHpmNm5ST0FKdlpY?=
 =?utf-8?B?RVN2aUJvRW16ZXdpVVZUTE5mUjFTTFVVZEZqMkNKSG9ML2NSQ3VvQVByeE9u?=
 =?utf-8?B?YitIeWs3aERsTFVxcFFydzM1Q25BZnIrZ2JCUUtaaHRzOFJZMm5BYWxNN0VB?=
 =?utf-8?B?Vm1zeVBaR0duNFY0WTYvSzVjSzNUMk5iUGNwemliNVBxdmlIU2wzWVhNdUFR?=
 =?utf-8?B?Z1pxbHpqZ0J0eEwyM0JjRTZZT2EzWmtNS1RHeTdWNjVEKy9GVCtVWHBXNlY0?=
 =?utf-8?B?anhkb1Q3ck9NWUZqajJBRmp5TnA5emI4b3FlbndDOVJzb0xqYUk2VTQrbmJO?=
 =?utf-8?Q?F0mxBG9tcCo6gnG4=3D?=
X-Exchange-RoutingPolicyChecked: b0VeJYG5bpHwSOnQdgH1ZvEVSDq/cROSuvhvzTBYcVUlYG56qWvjtNQD5t7KVrl3gv5R2qzZ3GNoh+Y/rXyiua3B2MZxIqqp2z7gLweTWvkeAOVr20+OQ4Tl8b0uwklPKF7sFcdaC+bqBhsJD9x0qOEUDgDXldfm1NsV8B7YEjEy7J90CMKtUViihodq953PmYDPneRGmepTn3vis6+hn7NPxm6X/VRt7obBMnIqeF5gMk6wlIH/RhLzdpx9y0dfGoI99okjMigs2N3ABst++aL07mz/R1WXGUg6DO8HRiW+M+M7TRFDjsZmoSwtVJSAXi+dpThiXBArkFv8daDFeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d80bb-b916-4597-953f-08df0c328cbd
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 16:18:55.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLOjHkzM3EYDCTgul6QMemh/m95ytGguEOQyHKpvmTSGMgFMDeJsanfjf4fh01w18K39EQi/gS/WOJljmDYkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-OriginatorOrg: intel.com


On 25-08-2026 23:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Blindly casting and passing the optional `data` parameter in `log_emit_cper` to hardware CPER emission paths causes kernel crashes if the pointer is NULL or an ERR_PTR.
> - [High] Synchronous hardware CPER emission inside the `xe_log` backend introduces blocking and sleepable operations into general-purpose logging paths, leading to deadlocks and panics when called from atomic contexts.
> - [Medium] Missing payload length validation before casting `data` to `struct xe_ras_error_class *` allows out-of-bounds memory access.
> --
>
> commit cde7fec12b9f07e68b4ed966ff02eeef7dd8e6db
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Allow hardware error CPER reporting from xe_log
>      
> Add a public wrapper xe_emit_hardware_error_cper() to enable xe_log.c to
> emit hardware error CPER records. This hooks into log_emit_cper() to report
> hardware signatures.
>
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> index 5549ef6966fd8..c78fc195c55bd 100644
>> --- a/drivers/gpu/drm/xe/xe_log.c
>> +++ b/drivers/gpu/drm/xe/xe_log.c
> [ ... ]
>> @@ -10,15 +10,25 @@
>>   
>>   #include "xe_device.h"
>>   #include "xe_log.h"
>> +#include "xe_ras.h"
>>   #include "xe_printk.h"
>>   
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>>   static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>   			  u32 component, u32 location, const void *data, size_t len,
>>   			  struct va_format *vaf)
>>   {
>>   	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>>   				   component, location, data, len, vaf);
>> -	/* TODO */
>> +	/* TODO software CPER */
>> +
>> +	if (is_hw_sigid(sigid))
>> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
>> +					    (struct xe_ras_error_class *)data);
> [Severity: High]
> Will this block or sleep when called from atomic contexts?
>
> When a caller invokes xe_log macros (such as xe_log_comp_fatal()) from an
> interrupt handler or while holding a spinlock, this synchronously invokes
> xe_emit_hardware_error_cper() from a general-purpose logging path.
>
> The underlying hardware CPER emission path eventually calls get_counter(),
> which invokes xe_sysctrl_send_command(). That function explicitly checks
> for sleep and acquires a mutex:
>
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:xe_sysctrl_send_command() {
>      might_sleep();
>      ...
>      guard(mutex)(&sc->cmd_lock);
>      ...
> }
>
> Should this operation be deferred to a workqueue to avoid deadlocks when
> logging from atomic contexts?

Current HW CPER users (xe_ras_counter_threshold_crossed() and 
xe_ras_process_errors()) are not IRQ-context paths and already issue 
mailbox commands through xe_sysctrl_send_command() before reaching the 
logging code.

As such, the CPER emission path does not introduce a new sleepable 
context requirement.

>
> [Severity: Medium]
> Could this cause an out-of-bounds read if the provided payload is smaller
> than the expected structure?
>
> The __xe_log_emit() API accepts an opaque data pointer alongside a length
> parameter. Since this cast ignores the len parameter, if a caller provides a
> valid payload that is smaller than sizeof(struct xe_ras_error_class),
> downstream functions like get_counter() will read past the end of the buffer
> when dereferencing it:
>
> drivers/gpu/drm/xe/xe_ras.c:get_counter() {
>      ...
>      request.counter = *counter;
>      ...
> }
This will be fixed in next rev.
>
>>   }
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ff9d917b8e29c..b4cdb5ec64915 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -837,6 +837,29 @@ static void emit_hw_error_cper(struct xe_device *xe,
>>   	}
>>   }
>>   
>> +/**
>> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
>> + * @pdev: PCI device associated with the Xe device
>> + * @cper_sev: CPER severity
>> + * @sigid: Error signature identifier
>> + * @error_class: Hardware error classification details
>> + *
>> + * Emit a CPER record for a hardware error
>> + */
>> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +				 struct xe_ras_error_class *counter)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	if (!xe)
>> +		return;
>> +
>> +	if (counter && !ras_counter_is_valid(xe, counter))
>> +		return;
> [Severity: High]
> Does this check handle error pointers or NULL pointers safely?
>
> The xe_log_err() macro permits the data parameter to be an ERR_PTR
> (e.g., ERR_PTR(-EIO)). Because an error pointer is not NULL, this check
> will pass it directly to ras_counter_is_valid(), which will dereference it
> and cause a kernel panic:
>
> drivers/gpu/drm/xe/xe_ras.c:ras_counter_is_valid() {
>      u8 severity = counter->common.severity;
>      ...
> }
>
> Furthermore, if counter is NULL, this check is bypassed entirely, but the
> pointer is later unconditionally dereferenced inside get_counter() when
> emit_hw_error_cper() is called:
>
> drivers/gpu/drm/xe/xe_ras.c:get_counter() {
>      ...
>      request.counter = *counter;
>      ...
> }

This will be fixed in next rev.

Thanks,

Badal

>
>> +
>> +	emit_hw_error_cper(xe, counter, NULL, sigid, cper_sev);
>> +}
>> +
>>   /**
>>    * xe_ras_process_errors() - Process and contain hardware errors
>>    * @xe: xe device instance
> [ ... ]
>
