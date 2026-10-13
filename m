Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0287522F14
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911747; cv=fail; b=IeIJzoSMkhju6pL2mcSGH/VBxDCpgc/4eUDW0c2clNnWajbRLI0uKfteojQ3UCGJq8dRJPP2aT4z0zNtBaat9Wb1RLZEa3D9qiopQKfYjb+dibaTqJe8Lc0D6X2KAl+2ty2Xk8cnnwy39Sulon3WhL+C2fAlgj7m7KSS1BwNoT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911747; c=relaxed/simple;
	bh=PiduIglqcQpby8qPFSd9J1v+kDvuwd6TMj/e7c9PeWY=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pRuiS+rJ5H+K7qgJeCfXDxtQl4UbWMsqm/2QXA6u3qLZ/QrakbsAOExy0NGMle6e80sfPDZvV76BVpQCf4QipBC0ic/scqn2p6KFI+Djh9e40wnm49yg//Qh7gA5a3RiLQ2bVsgKcoDoSvSnQd3JjxIa9YIUBmHsCaYaMB/Wmm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6jYF7YI; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6jYF7YI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911745; x=1823447745;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PiduIglqcQpby8qPFSd9J1v+kDvuwd6TMj/e7c9PeWY=;
  b=H6jYF7YIuB47/+sn0hJnFoCI3mJGvtCG/DYiflB8fqhDuCSgKoIOUxMI
   A/dSAes4709BA51lQjOQwzVvhrBvvVV0hkc5tYKhq8sJVUrhW2WuHBqAi
   X1dxeSHN7ILR8yosskvSppCJ98FOccBLf0EtnkujdThMbzSBosU6TE6s0
   6cLVu0ey/8KtHXB83EcEieYtAeSK8jTbJG9Rd0G3R67kU/2ZC0KehPJiO
   v2Ax+yjNoAoJGZ6Ngmnx7RjZ6+nYyYgYFjMauo6KarbGjXygiPXHdBC0E
   4uo/6G6R4Ju1D1INcjOSKJKsSLzi3VbqOis3G+BRQMk0/kSZHG9TjhdPY
   A==;
X-CSE-ConnectionGUID: mFR+czsAS2+ul7plbM/EyA==
X-CSE-MsgGUID: rDAXHkQWQ7extC3Hf/zCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="532604"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="532604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:15:45 -0700
X-CSE-ConnectionGUID: nZp0Fa+nSsWm4pTddm0hBQ==
X-CSE-MsgGUID: rh9QP3KkTf2zE5nHi8h2cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1136385"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:15:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:15:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 10:15:43 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnOno901JZBMPITI86XnKR7nfuHTZ7J/5iuMEAve9jAnlDbpUYgt0rM6o7YCUdxwzTalXqqJvkYkU1VYMYCl0+mlV0IsgdrPFZbzgRQjLh4w53rysJOFRxNlthR9mLTRLWikEYIwbQHES6nfB0oI5W68xNBmNYfl183uov8K1hj6/7qFMhTUZjq1TAu+EjAQxOLFfAPnE/ysc8/ZZMoQaZS41obYO50o6AAvM5bzfI8RDaz6JHBxfhgkElWHI5h1/naOox+Yz5R8Nl1MFYUOBZMASj9/8Eh6rtzcn5K5+xhLsPX9+Gu1Pip2bcbGIsT7PKrlD4AlVSryaqYGf4BdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45LN74a0muWejpQjxgbIHB/dSl6vduM56+q7hfDNAxY=;
 b=hsUgBKG7OBESLw3PNX8ZRQfre3TRXFvEVAFCe7ZOpatsxKg/pklDQBIe45GZ6rk6EPvwbj5O6vCnrh2+pn4xdQLY4GOTmUlz09J4Cw8Hfm9a9KATizhY6C0Mo6AmzZOt8xgvE1XAMGsTu+4jhoxxpwych44rvbHQNqaKdrY+K3qBipR/McKyk9bD8AGgsrXCGOPPsSQpTr6EgY9rQRjzFqtozxt0zGWwqN934kSwewCpiyrP28VrmC2MCEF1g/jnBSZc5fuNLZXIcdMrHfpaeIRrEt2klOlm71PcT0TUi2lpMLzj5JPHCqlF6mzk6874ZRpEvecWdnrMVlznAEpyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB186312.namprd11.prod.outlook.com
 (2603:10b6:806:595::5) by BL4PR11MB8870.namprd11.prod.outlook.com
 (2603:10b6:208:5a8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 17:15:39 +0000
Received: from SA3PR11MB186312.namprd11.prod.outlook.com
 ([fe80::fbe8:9ba6:fcd0:f0b]) by SA3PR11MB186312.namprd11.prod.outlook.com
 ([fe80::fbe8:9ba6:fcd0:f0b%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 17:15:39 +0000
Message-ID: <5a6710a3-5cc5-4bcd-890a-eb9c268575e4@intel.com>
Date: Tue, 13 Oct 2026 10:15:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 2/2] idpf: release PTP before freeing vports on
 the init task error path
From: "Tantilov, Emil S" <emil.s.tantilov@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-wired-lan@lists.osuosl.org>, Tony Nguyen
	<anthony.l.nguyen@intel.com>
References: <20261009212537.3996-1-emil.s.tantilov@intel.com>
 <20261009212537.3996-3-emil.s.tantilov@intel.com>
 <sashiko-outbox-166100@kernel.org>
 <c9375bbb-1528-4221-8052-f6fa8aa9bf18@intel.com>
Content-Language: en-US
In-Reply-To: <c9375bbb-1528-4221-8052-f6fa8aa9bf18@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To SA3PR11MB186312.namprd11.prod.outlook.com
 (2603:10b6:806:595::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB186312:EE_|BL4PR11MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 12471ddd-404a-4dac-7c8a-08df294d9ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10063799003|22082099003|18002099003|10067099003|3023799007|5023799004|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: LvhY0Fo/bX9+5e4b9hIf3ssYt2OwG3Qd+26H2rv5GTn8OLJ+enw8gkU5pVbBi0hzorgLEkV+IlYkJ4f623iTR6PiMkPqvvXtQvF8Sd8zYfYM6/m0NaJBfFpwHaIwIU9Mij23XZ9LSrXq0ZTPRq1Usq9jnqX+NYB0ozJ20uGuxgt6UV76cIOJR6uT0D9Iu0u2fI06jdDPeWXAhhhp2/w7HjiOBQ/A5PrJ5AqwD4d/y0ezlyhFauvyL+H0167gDVhYJ+w15aoRTGOt3ZsqX7/F0MPeZy+hyJZ8hVk3gB519kkgI5YDRJwLwP53fleXZwmKc9x2AzfjmFfTysequw6UzCRNNu+WO5Pe/ZFnhy3vRF+IOHnqPWrj5ZjokGnMq/rKbZD8uOQpKVVzXmA94e2OzxwgAkxQ5LtSX2sdYXjGvA7tmOHRf8ATydEPc9z7m6UpvNGc8RAd88bbH3UBx5YxGTfK0y1o50h4OgK0PObfHsVT6M1txOH5/i1SXt6Qdie8B24tnzL0w79wpVsM2aw2BTahcdII5ymBbgAxAnoOe7Fnur1HFs79JKvqhjBCS/jVvWHp4xzytjtl0KqnpdkNXs8Eh8XFkBhoQkLS5q416Y/Dn5spyzSFXRcQTn7MMhUK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB186312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10063799003)(22082099003)(18002099003)(10067099003)(3023799007)(5023799004)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekQzWUZPSXBKWFdjaERxb1M1VGQ5d3Rmanh3a1BrZmxIcDZWUURKdnlBRHlO?=
 =?utf-8?B?Y2Y4OHd5QUdkNXNMRDByakVkbHZMUWswbFhvc0JDUThSNFQwbVNVbzFGZUVB?=
 =?utf-8?B?dVUvbEpzcVBXVnpHUGdnTEJjZzBIUFhmdzBUZlVwcEx4RWJIYmlpVW9tTU9R?=
 =?utf-8?B?T2lWRTZNR1pwT3Zob2gwM2RkazBkbmY4K3JvZkowanhKRzhJdGVId2dHUzdT?=
 =?utf-8?B?VW4yUFgxQ2szWGx1bGcxczRtWVpodytkUmFtOHJtTHVaNlp6UElldFExdGdh?=
 =?utf-8?B?Q0pUZjlRd3VaYkxLTVNQWXlwd3owV2lSakh3ZzBoeGZRaXdJaU1zYllWUjNt?=
 =?utf-8?B?M0ZmWFIvS3MyanN6WFl3U1hySlJtSjVsODFyUGU5ZXRkcjNibFM3VlJRM0JO?=
 =?utf-8?B?S2NuUFU3cytyU0VFcnZuUjJSaFJrRDlKb2tDR1BEY05FK2dXcG44dEJMQmhs?=
 =?utf-8?B?MjJ2cU5mLzZQNy9BQzE0ZU9mYzk2ZlUrRUEzVW9IS05OdHJWYWF0QTR1Uml0?=
 =?utf-8?B?WlQ5MUduSGl3amN6cExlTzM2NmF5TmcxdWtvdWNEZDB6cFNQeWlvRWlyc05z?=
 =?utf-8?B?aGFhaGlTS3psbW8wZnpGVVB5YnZ3eVA3T3AvdE9IMzBEREtsS2xGZ2QwR2cr?=
 =?utf-8?B?TmlDK011T0RDNi92UmVLVnI2enBmVHZQTzl6OW85WXVISHp2bG1KUEQwKzhS?=
 =?utf-8?B?WmZYbmFPbi9rdm1PcjRtSEROMG9HMCtOc3BtOEdLekxKMWFmZGd6djhzdlJz?=
 =?utf-8?B?SnpYKy9QRS9xOUluOTF4QStYRlpRRkZOaVdiRTB3Z0hTV3UvZGpxRzBqMlgw?=
 =?utf-8?B?SXpZY2N5MCttZGd5NkVwZGZPWmsvckV2c0pUUDNuTERHdEJXRGpHeDZ6TXFX?=
 =?utf-8?B?WkNFTUQwRlJXbE8rMTVWT0g5bHRkeVNwOHI4TUZ1R1hPZy9paVZpdXAxN1dX?=
 =?utf-8?B?RndJemZVbzRmVmx0Y3Z0MlR3Smg3bmZsMzRLSVNSSUQ1aUdMSTBVR1l5U0Ev?=
 =?utf-8?B?cUVLRGxlL2diSXdtSjhWeTdlZUVYYmU5MCs4WWxkbGxHa0xTYWp1bENuSmY5?=
 =?utf-8?B?ZXFKMm5NemxiNG9jLzBIaW9LZ3lDVUN0T2s5Z2k4T1JtOWZaWnd1bzV3K3dn?=
 =?utf-8?B?YTVmV2VUd2pWeklUMVBoVnlzNXViaE9vTmFaRGdCK1YzVi9IcnVDYnUwczNJ?=
 =?utf-8?B?UDFqTERzOU1QUHdXT2RsOEl1M1hLbGJWMkJsSmx4R3dVcGl0S2ZiZUxTTWZx?=
 =?utf-8?B?MlZTVGE0eElHY2NjWVZ3bDNBUkhSY3dwbUxQL3I0MkxneHM4K0JwRS8vTEl0?=
 =?utf-8?B?cXgxU0QrRmRldVNVOXhmd0xVN1QwbVJKY2EyMFZhLytQM0VVYUtiVEpwb2hj?=
 =?utf-8?B?Z2xlOUhsY0tNWnVYRlJxS3NtYVMrNTJTMDBLZWxRVmxKSk1JM1UxclJvZXdG?=
 =?utf-8?B?ZjRBT05NUm1ZSFF1VXAzK1dxeTZ2emo5MXhkY1kzeFBEYkRKNWlMS2ZyZS9Z?=
 =?utf-8?B?TUFuRFhhQlBkMDlYdG0vYi91UVBLR1pKOU5LZElRYzY1RFZxZVczeG1hK3JE?=
 =?utf-8?B?eFpRWTB3a0I4Tk40Nm5OMzVqU0h5S2xrSXR2Vk1HQlIyZHF4VzBqWFhMVjZ5?=
 =?utf-8?B?V0wrM2F3YVlwWVpmU1BCZm5JSnpFRmdKdmFMdEIyeGpmZjR0Q3o2WkQ0eVZk?=
 =?utf-8?B?ZEdOYS83K2RHU20vdm53UjJubCtrSmYxeWtyN09JcEd1bDNKczhtbXRMZDUw?=
 =?utf-8?B?dTAvcUxpU3hMQWhBWTNOSUpPTndkTURTcUgzSDJqNWg5YkNHVGQyYzVieU5M?=
 =?utf-8?B?VDladXIzZjgrU3MwRVEyMDgwRzFpYTlpR1ZSTmptL3l5cGo1c01Cc1BJb0xx?=
 =?utf-8?B?cjdORkw0UStNcUlMV1h1bnFOMU11NEJuRFdTY3h2a1ZuZVhuSktybVByU1k4?=
 =?utf-8?B?OEFoTThjTERJV1lKcFhtR05PaHFxL3pvaTI4a3BFQzRMdEV3SVhUNGg2TkdL?=
 =?utf-8?B?WVdRRnVsY1ZYTnNQR21NdzJQMlhURGNVM3ExQjBvend1Y3g0ajQyNjFjQ3lt?=
 =?utf-8?B?ZThSYmxManRUTS9HZDNwVnIyM3FGbjRUellTbGswSW4xZXlrT2NkZmNULzVQ?=
 =?utf-8?B?MXd4aUJQVCs1Yk0vNWpnWE01eWtjcmw3NGVqQU0yeHlvZUNTM3hUVS94eG9m?=
 =?utf-8?B?SzRCNWp3SFB6cUtDWUU3d29GeGgxZnloSkRlK0V0eXhhRUFGWks1RExwTW13?=
 =?utf-8?B?bVhjQVJsRUJRNER1MWw3c3hwTVhKaUdlb2lPbVBwV1FaN3M5R29xaHZybjV1?=
 =?utf-8?B?OFhKbkhKS3A1enpGeXMzd09NaXRvczBNWVMxaU11SCs4QXVid3Urc0oyTjRZ?=
 =?utf-8?Q?BHJmkV/47E84DL3c=3D?=
X-Exchange-RoutingPolicyChecked: svjg/x/UMNOgsUZuaXh+/DSjgtsFWd4nPidKFRwWDHZduziuwHpgZdpvrjuMAltWefG4ZqBspu1aJ2E+VkXpmwByzsxjXL7zl6kHwnLZOxFpkWQVT0HsFr+QgWSReVr7CqLaNCEsothedFOz3/jY1nh/lhc4nwgeizMd4e2Oi3Yd+2kzQOBcwvWDMaubAICf1RWXk/xTyFUu9e0l34px8uLze5dDfW7nHQ3KrTloDX8AC5MfTD64mGHzoMjQqoY6YQ99MhJLp3uwie+TbzgSMEWCGeFsCoYqTCsbboQ8OcUWp1WsLx4jNX3SE1/43yhGR5ojW6B8/YttYy5Rk4xLXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12471ddd-404a-4dac-7c8a-08df294d9ab8
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB186312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:15:39.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAafpisxEoGyDiZSim3WkeKdTQjiD4RHuEx15xArGxjleyqN/++720hIuodlEVRL2VB+I1a8JKnuiTWAqVXqMo4cltWj7x+ws33ktk4KTvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
X-OriginatorOrg: intel.com



On 10/13/2026 9:41 AM, Tantilov, Emil S wrote:
> 
> 
> On 10/9/2026 2:56 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] idpf: double free of adapter->ptp due to concurrent 
>> idpf_ptp_release()
>> -- 
>>
>> commit 140d271eb2e765967ee1a351714e7ad1ecc7d8f6
>> Author: Emil Tantilov <emil.s.tantilov@intel.com>
>>
>> idpf: release PTP before freeing vports on the init task error path
>>
>> Release PTP, which cancels the aux worker, before the unwind frees the
>> vports, matching the idpf_vc_core_deinit() order. Previously it was
>> possible for idpf_ptp_update_cached_phctime() which runs via the PTP
>> auxiliary worker to read a non-NULL but already freed slot, pass its NULL
>> check, and dereference the freed vport.
>>
>>> diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/ 
>>> net/ethernet/intel/idpf/idpf_lib.c
>>> index a1c739cdd5406..9c541dd6ed4d4 100644
>>> --- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
>>> +++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
>>> @@ -1747,6 +1747,8 @@ void idpf_init_task(struct work_struct *work)
>>>       return;
>>>   unwind_vports:
>>> +    idpf_ptp_release(adapter);
>>> +
>>
>> [Severity: High]
>> Does this create a race condition that can result in a double free of
>> adapter->ptp?
>>
>> If idpf_remove() or a hard reset is triggered, it invokes 
>> idpf_vc_core_deinit().
>>
>> idpf_vc_core_deinit() calls idpf_ptp_release() before it calls
>> idpf_deinit_task(), which is what cancels this init_task:
>>
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:idpf_vc_core_deinit() {
>>      ...
>>      idpf_ptp_release(adapter);
>>      idpf_deinit_task(adapter);
>>      ...
>> }
>>
>> Concurrently, if this asynchronous idpf_init_task() fails during
>> initialization, its error path (unwind_vports) also calls 
>> idpf_ptp_release()
>> without locking or serialization against concurrent teardown.
>>
>> idpf_ptp_release() performs an unlocked check-and-free:
>>
>> drivers/net/ethernet/intel/idpf/idpf_ptp.c:idpf_ptp_release() {
>>      struct idpf_ptp *ptp = adapter->ptp;
>>
>>      if (!ptp)
>>          return;
>>      ...
>>      kfree(ptp);
>>      adapter->ptp = NULL;
>> }
>>
>> If both threads execute this concurrently, could both read the non- 
>> NULL pointer,
>> leading to concurrent executions of ptp_clock_unregister() and a 
>> double free
>> via kfree(ptp)?

Actually, idpf_init_task() cannot run concurrently with 
idpf_vc_core_deinit().

The init task is only queued from idpf_vc_core_init(), and from itself 
to create the next vport. idpf_vc_core_init() is only called from
idpf_init_hard_reset(), which runs from the event task, on driver load 
as well as on a reset. Once idpf_vc_core_init() succeeds,
idpf_init_hard_reset() waits for the init task to finish:

     while (test_bit(IDPF_HR_RESET_IN_PROG, adapter->flags))
         msleep(100);

The init task clears IDPF_HR_RESET_IN_PROG only in its last run, at the
end of the success path, or as the last statement of the unwind, after
its idpf_ptp_release(). The bit stays set while it re-queues itself.

idpf_remove() and idpf_shutdown() cancel the event task before calling
idpf_vc_core_deinit(), and a hard reset calls it from the event task
itself, whose previous run has already waited for the init task. So
idpf_vc_core_deinit() finds either adapter->ptp intact, or already
released and cleared by the unwind, in which case idpf_ptp_release()
returns early. This patch does not change that: the unwind already
released PTP before clearing IDPF_HR_RESET_IN_PROG, it now does so
before freeing the vports as well.

Two concurrent releases are possible on shutdown, but between two
idpf_vc_core_deinit() calls: idpf_shutdown() does not set
IDPF_REMOVE_IN_PROG, so a Tx timeout or an RDMA reset request can 
re-queue the event task after it was cancelled and start a hard reset 
alongside the shutdown. That is being addressed by different patch, 
pending on -net:
https://lore.kernel.org/intel-wired-lan/ca88d67c-1595-4bd7-9560-080de7104e6d@intel.com/T/#u

which sets the bit in idpf_shutdown() as in idpf_remove().

>>
>>>       if (default_vport) {
>>>           for (index = 0; index < adapter->max_vports; index++) {
>>>               if (adapter->vports[index])
>> [ ... ]
>>
> 
> I will address it in v2.

Correction, I think this series can stay as is with the one hit above 
being dealt with in a patch in the "destroy vport on shutdown" series:
https://lore.kernel.org/intel-wired-lan/20261013121224.84482-1-luckilystar08@gmail.com/T/#t

Sorry for the confusion,
Emil

