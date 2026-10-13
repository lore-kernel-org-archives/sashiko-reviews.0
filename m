Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C048032F
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897701; cv=fail; b=PGEh1EsaCqlL6SAyqVY63K6IGr/45wad/sNWlqkgoJt9pIB3q31fFZr+I9S9bbZpsAciJt33vv//dnGIjF4T8Sna80xJaZ7dFeZUH5qog6a5EtrZOAbWVNrZoir1P8Nbyb1zLSr5uwfFoFyGp9I7ODeQQXSF10JUCTImSC1USTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897701; c=relaxed/simple;
	bh=uPTvMI9GcgY27ts5ExPREZOvNppMkagw1A4ryILrsgQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=atUG7n+bLlAhglnWlggFv9OGpbkteFvw5Z+LxipmnAOxOM7kzN0/7wr8bkY/wAUWPH6+a+0Z9J4wf6E+zRnWwNAnDt/6T6SQjKzhRdRe54OIzdbE7RAhcSEblMQNamiaIBnPiCkcRJets9TueECrF9VeTRsx/N1BriN2mY70uOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHf8fC1p; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHf8fC1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791897701; x=1823433701;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uPTvMI9GcgY27ts5ExPREZOvNppMkagw1A4ryILrsgQ=;
  b=LHf8fC1pHfgOhFH+sPe2HaBO5J4cU8yFM3mO9vRDLhJHv4/2blNb/vGw
   0++hRHxAY6eT1ei6fYwuEpe+fZxMxTRmyGQgrDueGgrAwtLG1gHcMVkTL
   5+LtnKZxXlL6RDWq5rxerGAfMIaAv4NvE5CpEsjxL/cfjtFN9R2HXQCMH
   ruEDHMwMOONN5kgUFgBT6OfQGJx+HZoqdwIQCD1+gSOmyZF6un/PXeu2K
   Fwzs4vaifA+YjTYMElsO/03N5pZQDsEt+6wAXF8RMoZNF6lpu4eeNuYqR
   dP6C/4Ava0aUJtpB1VztSjwTFvN30dC6VbhuEC1bFDe0+KGCxC0L5IkYX
   Q==;
X-CSE-ConnectionGUID: o5Yo3bCcTfW36DBqzVimzA==
X-CSE-MsgGUID: WSdEheoEQwGWLlO17giORQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="615636"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="615636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:21:41 -0700
X-CSE-ConnectionGUID: /ko9NeV1RhWMR7xV4LQnww==
X-CSE-MsgGUID: +HvN/8X9S1iNjzyeP/3mOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1136849"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:21:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 06:21:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 06:21:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 06:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrRHF0fiRso8yN2snIomOX4e/eAV+g/f5/DD43px5kfAA4hz1F68IwK6xb4VUTfEXMfx1XsL7Ps/bwQNiHfNmPO9dk/tV1ER9C32c8l1YVP1ZRRXzKD03g+4Uu6FuTvNAEkMA+4KdP2Yd7CimLj9lXP+tnw0CEakjSA00k1UZ/oeKn1re5foHd7N+sbwOqDw/VSl1CiA2SWZFgOo7a3Q94Xv/TGyXHaJhoUFPsbfpW92A15ydGOiavXllWz87FYuXXQd+5CZUOnfQ7dD79ex1P4PXouL20DZ4e30uWXQHe50lFarxIuc5r5RuHqB4K5Ny/mAg4G0JyGyQTouQ0vywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycyuxxTcno3fKGSe2OMH5ttGOqsb5Na4gOIUYQ+espY=;
 b=ePSQ9+In2ADD1wbf9J1zHa77NeGB5jspfrXPQ/sS1iBtZhxhjroCuv4qAbhR/EFHmsJsjktCQMhaFvhD5+bzO3RRgRmuHfPbzkeFu9JyfOQ1DpY1nisjDpyhhjRUo+svd6t0swOjbyOp3Xex9yhnz83cTnFbiuuEGN56K4TmjggnxuIktlZLxzQGxO/w+dTHj87+Fglx8TgdK4aAX0lkd00Pah6dEJupF2dPgsi+1MkvknBjBGD9JstWHhBTtxUAbIjYaZACLxqxiBNmvdKeG/RMdRSWyiGYaoHV/MrnCDRun/IKLkmJse6ed6tvJXgVLCv7QjzYbFM5kEq24jLcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 13:21:35 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 13:21:35 +0000
Message-ID: <e79ead5e-3851-43fe-847c-10f368f206cb@intel.com>
Date: Tue, 13 Oct 2026 15:27:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/14] iavf: temporary rename of
 IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-wired-lan@lists.osuosl.org>
References: <20261009121433.30347-1-przemyslaw.kitszel@intel.com>
 <20261009121433.30347-9-przemyslaw.kitszel@intel.com>
 <sashiko-outbox-166503@kernel.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-166503@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To LV3PR11MB8508.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|PH8PR11MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 283231b6-f2fa-400c-1584-08df292ce78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|11063799006|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: uA6Ze0E5N+KF3d2K6HdeGTqlkpn56PGwDv15cwnQeLKfY1YJ1Qo+Asl3wPe5m8vIaXN5ozQxwcOWb7SM7lhX2OcbjjYcgYdVAKJd4RKSZNzsBvXWAxJoA4oBFmcPrzI8TiFDmvSddzRvv2Q30Dk4XAqHZomuz0uBp+fcL2opCZtJkFHOX2mb4sUa/RKpD1zgSkJTzqygxtFYBWqPEOVU6jramV0WI1zRyStOT+e4EQOU0nd7vL831rlwJggg1Eur+ekr7cqLybIkLv2C7VNvtcJJxMPV/Nw3dDIFmBPGk8pc0g41qoQmbf40+ZBgwfoLPAL1hVJcNRGEfhByilZHxVmzuoyWT7hQq7TGdMyiyH6v5kyaW8ur547YrzBmGHXZ9v8E49fhiWKN5n6y8hOyC6pukXZc5WRM8bT7DUmPfoEdbmOJSLQWyTcoVDcz0T8OGP0C8Ijg1r7DbRApYkW/myZBQY+FuohZAfFIDkIRgSql1ExpuILEMk+lKZuCZfpINkxIBFRoQEgLoCClztCm72ooc8pbBCqqmqXvJ6k9b3r3MvdC66Y98TGGIaTBHdwVP3DdRBjG/cUJRKaysd8pRYKigIqRLQ8ZVmH3lcbzBiYxu+86sUxCNgtYpmeGnZfa9Bnt2lmDpYsL/tjj9iE2iNuA9ijZno0EWZkyQuDuYj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdVNVBaRWpOT1N3VkZwWE9HdXdZUE8zdmFBaGxPei93MGlVTEpnOC9HQ2tt?=
 =?utf-8?B?VmJXTmhhN0U5RllGMzBYNG4ybGhmRnJHWUJBZDMrak53aWhucG1GUXZ0YjFL?=
 =?utf-8?B?NjBSNjduOTJmbE9velhpaEI1MEx5MWIyNDJ3UU1LclNUcFhwZVdkcWZUU2pO?=
 =?utf-8?B?dnFuM2FJLzJNdVRYS2NpNW83dEZkQjc0U0VpZnVLVDdQQXJGdTdvd0ZSdnVl?=
 =?utf-8?B?dUZxS1JxZlhKaktXdVE0bEJXSDRFR0xTZitGSlhRdUR0UE5TTTNObzlicFVk?=
 =?utf-8?B?cU9EMm9EOEp3aTYzczNBS1JUSVBVV01TbEtaVlNkblIvMUtXOVk3Ti9Va1ly?=
 =?utf-8?B?d2oxaDVUTHFuOTUxNVkwZjVDbEN3MDhoem12Tk5kb0kwUUExUHRUQW5VUThM?=
 =?utf-8?B?elZiUDNsbGk5Y2NtZnI4dDI4UnloUFRiY0YzeWN5MDE5OVBVTzVEWjByRG93?=
 =?utf-8?B?bVNhSW1NYUJvUmw3SUNIc3Z6QUdHVkZxRUhyeTRlSGJxN2p3WHNrcWN5N1h2?=
 =?utf-8?B?Y3RtekdOVzdQTFc3S2ZKZTQzallhcFZJY3F2VDIraFdpMXB1Mm45ZGNGK2Zk?=
 =?utf-8?B?WGN6a2lwQkI2cEhoTXRldTlXb295a3VzcGE3SWNIODhTOE9KYm5UNkZrT1N0?=
 =?utf-8?B?SFBOOGFnZVVCaUR4UGU3ajRmR0xETEJ3LzdaTEJZcVIwUXlRNmw2NUlyWjds?=
 =?utf-8?B?SStYRzkxUmdsVm81U2pBS1VmZ3p5cVMvNjRYdElsSTlUVG8waStCbFh4YmdV?=
 =?utf-8?B?UVFIZlYxKzFRbEUzZUVSWVg0NEp1Q3M5ZTdsZmgxQ1RIb0hjZUZzNTZsVEQx?=
 =?utf-8?B?NGl5S1NpSFBQMnFJM2lDS1RQM3MrR3JqeUlsNlBBNlRRYzczL0t2eTkwY3JX?=
 =?utf-8?B?ZUxmK1hKWjNPODlML0t5NTdQMmxnSTVVdzV0ci9DWHFNYmxOcXFJMllPS2ZI?=
 =?utf-8?B?VWVxbnBJQXpYM3JBNmlwYkpTdlZCOGZRUDFMY3pJVDVNaVBBTGFXdVQvL2xi?=
 =?utf-8?B?MlIvY2MrSk9rWkNQOFczUU5rMU9QOHorV01YSE5LU2Rma1U1N1NYT2NqVWlE?=
 =?utf-8?B?REVUOVF4NDdqOTZFYmZoUXBvN2I1Wmh2SWFkQjRhaysxNTA5UDl6Mjl6eFA2?=
 =?utf-8?B?QVZKaVBPVmRCdzljdFYwUDlQSjlzaTBZallpOXdGNHdJR3JML2ppc3VCeG1P?=
 =?utf-8?B?RU1NTkt3cUN3ZFJQTW5hQS9sUXg0VjY1bXdndis1WHpFbnNqVG1zSHZncjY5?=
 =?utf-8?B?NHE5RjVWbFlzcEF3OS9qa3B2UytsSWdxOTFRR2ZZYUhQRU9GSHlZVkZWUnlF?=
 =?utf-8?B?eE1VK1Y3N1hEQlBZZ2dMZU5xbTRxM3QvcFhldWRoK0lRRlJjRmhLVjh2RHA4?=
 =?utf-8?B?cWRvN0MrVzhmS3h4ck5GeUI0SUhsak1ROWRQMXVHMEk5VU1rMzh2ZzFPNUs4?=
 =?utf-8?B?Umtpb0ZpYXdzanNLV2pZOWpFOHowbk1xcmhSTU5IRmczWC9LMDRYZm5BRldy?=
 =?utf-8?B?ZmxuRWRFOTBxd0EwWEkwenFkM216Vk0rLytpSTJmQzlLV2RDVjZYdVErMlhS?=
 =?utf-8?B?R0JHZHN0Y0QvakR6K2JaWkxtVEtpdHp0VitjV29zOXM1TkkzRCtnbFBvUm5i?=
 =?utf-8?B?eEdES0h1djZyN2JlQWk1b00vQW5DRW1BMnIxOWQvT3R6Y2RaMTRIdFhWbHhQ?=
 =?utf-8?B?T0w0MnFleEhIT2lLWXpNQm1rMmY1NFZ0ZEZCNHIycFZycVBNdGQwalNCc1F3?=
 =?utf-8?B?WWIxNjVVaDh2Wm1vQU83Zm5Ud2IzdTRwSi9USWozd2xlWkNITldQUnlWeDBG?=
 =?utf-8?B?Vkl0ZkxlZGVKL0ZsT2l5MFlQNmxjRUhvYzNtYTAwMzFIcjNWckx6RXo1d1cy?=
 =?utf-8?B?VnJCT2krdnVyM2grUTZscUtFOHZiUkZCYUg0TnIvTVB5UnJvTWFJZ0N0N1Fy?=
 =?utf-8?B?MDlXTUFFTkpmVjRvMWgwamhZYzRJZktqR1hETzNwRGJmVlkwZ3pLNHN2R2V4?=
 =?utf-8?B?aUQyeDNmK3EyelMvaGxuOEZ1SGhJRTVieWNyN1ZoWkJJeVlGY0txQlk2UXJM?=
 =?utf-8?B?ZmVQa0ZoWnAxczg2RkFHQ1p3RUlFcHd5L2Z4SGo2anBWOFhrdGtOeW10b2Ir?=
 =?utf-8?B?ZEVZaWs2b1pOUk1xcDBXZWE0U3VMM3lnWUduWjFkOGt6TkdNMjFTd3ZlNmkx?=
 =?utf-8?B?QnpZRWwvUVlvdCtkWXJnSUtvQXVtQTF4aGFXWmVyZFhzOXBvM2pqc3BQOWpn?=
 =?utf-8?B?UEFyZmVwMWdZQTMrMGd4bEZpRmdzYkNDWWhHdExwcU4xTFRrdjdiYkVkVEM5?=
 =?utf-8?B?Rm04emhRaERiSHNpWkI2UHh3U0x1MDBFS1ViSjNkVk1JK0FNNjB1bzZkUnI5?=
 =?utf-8?Q?aQIhD+NT6bVZQML8=3D?=
X-Exchange-RoutingPolicyChecked: SnBjiVIe1Wz8Tq9xxrVbnKig2bcDXTyW9DG1d8D78igpxj+o502rdhKn0Vs7qXyVC90wc+bF9yZSh20e/8ZYyoUGOFXoKnfrpPKRI/ZAwE62JFz4QGKjZPA4NMIim+Xc4CPtK84JNk3Qk+4nVtPwukHGK9/2VQMek7ZAhJ1zq8+ZFR1wBathc0z7nq1nPvw+0xuLfL6Lk7E3c+wN9W9yqYmgL3eyUj4WHajFBMflnf9w6axCah0dvwhwlW8+H6fm1RAE7rLDUHsXLnTV8w8ZMWqvmpMADIN39sToKS5hQjCV9CzmtGkeMSCILGiDbbMhwfRke7J62vh3x58hqNhdLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 283231b6-f2fa-400c-1584-08df292ce78a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:21:35.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpg0wTKb52tJuz79psd7DwEdWr6w7kpjT8srDIzj9AXd+CXsNPGfxEwEF66tUsgBQE8U6drWLJJ0nchAd5u+UYQrVz8Rm7NphdKdi2rfhEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
X-OriginatorOrg: intel.com

On 10/10/26 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: iavf: missing bounds check on num_vsis causes out-of-bounds write
> --
> 
> commit 96fe4c02ff0c0cd29e48e38845a6fbbedd204284
> Author: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> 
> iavf: temporary rename of IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1
> 
> Rename IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1, in preparation for
> the next patch that will extend the max to 256, using old value of 16 for
> the "v1" variant of virtchnl opcodes.
> 
>> diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
>> --- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
>> +++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
>> @@ -268,19 +268,19 @@ int iavf_send_vf_ptp_caps_msg(struct iavf_adapter *adapter)
>>    **/
>>   static void iavf_validate_num_queues(struct iavf_adapter *adapter)
>>   {
>> -	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES) {
>> +	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES_VCV1) {
>>   		struct virtchnl_vsi_resource *vsi_res;
>>   		int i;
>>   
>>   		dev_info(&adapter->pdev->dev, "Received %d queues, but can only have a max of %d\n",
>>   			 adapter->vf_res->num_queue_pairs,
>> -			 IAVF_MAX_REQ_QUEUES);
>> +			 IAVF_MAX_REQ_QUEUES_VCV1);
>>   		dev_info(&adapter->pdev->dev, "Fixing by reducing queues to %d\n",
>> -			 IAVF_MAX_REQ_QUEUES);
>> -		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
>> +			 IAVF_MAX_REQ_QUEUES_VCV1);
>> +		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
>>   		for (i = 0; i < adapter->vf_res->num_vsis; i++) {
>>   			vsi_res = &adapter->vf_res->vsi_res[i];
>> -			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
>> +			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
> 
> [Severity: High]
> Can a maliciously large num_vsis value from the PF cause an out-of-bounds
> write here?
> 
> In iavf_get_vf_config(), the message from the PF is copied into
> adapter->vf_res without validating num_vsis against the allocation
> size:

this is both pre-existing and we should trust PF, will ignore
