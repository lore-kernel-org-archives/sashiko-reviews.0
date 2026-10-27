Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793131094;
	b=zki1JZfKCOq+fBuwzqgyc1gb70F5OiZ4hz25Zc1HT9uYdjhCfTpe3GV+wPpJG2q8OWb8
	 8TYLTgRE2x/xr/Jx7NvsIK9dsUwocr/jUhKKLAeVCQVjYFxKZPX7k18WEoIlwKQdK/Uxz
	 aXWKteOSPOeRDInwBiKspddjhD6zyNmfj7odiXSSc9qC5Fk4zGzo6KVFC0jFQ5bSQX/TS
	 9Az/kc0RIVrgr3rVTeTonV6fubBIXtJGJ0bqEUB7tl6Ywg7hyQ+FL6RqDVXYASNctahoz
	 AS76PoYYY+LGHGYTSKUdTHBgyie+wYF0O8OFHvJ3siaOg68yLP4JyizwlJmdCJI738Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=QYAd+1bkK7EjNUY6R5TVX4hfvO9LriU8bMIyfcOljKA=;
	b=Mds3R/pKZFCp8t6jRmdeL7PXfjM9pAAbhxtRqmO7Y6GqjF4+HAuytDdnymMryDmYiMGk
	 m/Gm+n1EEBjNC45mE5KB9g79Pv5Ae4P8tnCfvE4lV+htN/GXWq4peXYuy18vqC4Y8LB2o
	 cJfixT09hvurzBcuxNEIvPuoGbV1nLToE6pJ3PsIQrNyWTTKuskUBIl/ORf8n1SDkM/q3
	 ANOtZUMzzZdunryBtL+1zLjTR/+EhRgjsfAIw8l1u7in6GvhWCWf7Cb5twXj5/XKXl6Zn
	 aYA7tcKQujZjGlrKG0ErfeFGGdIMkyvY4BZ7RyBloe/Alk/f9A+Fc+FUerFcYTUsJ1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="iRUXAj/S";
	arc=fail smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3F606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iRUXAj/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793131093; x=1824667093;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T3RNHX6+lmM3Zwj09UMlkNkaz8RS5eXPZnLO3WvMJG8=;
  b=iRUXAj/S363dknFGFSpPl5W3K4ir3rO7+XpLduSW3J8BhOLI5Xp97J7J
   bUaO4KsgBcA7na3aGnG/s0axFWt3Bfojl2Wzkug1iR71a589Bj+wIAtMn
   h+BDWBzoJpZcwJlDrtfALYuwt8tjmz+dYmG049gtZmKhuRGm6Es5zyvA5
   TXV+uJjF1iVDGi8lBOdabk/Ol+chWvVKvIhGG9WGv1FTCuI/q35c28Ufs
   LewXihPUOIeNCW5T3bApUDpIdsWs63bX/apaEwptPMPG/Tn38goX1Jhrb
   3C7jY9TlPwDLNUvGJiMTzfb/X9YSFySxf4VmBHWI1JDsFD5Wl7Xu3XBJu
   w==;
X-CSE-ConnectionGUID: XWIlKMj0Seux2SsnEltlhQ==
X-CSE-MsgGUID: 4msr5zNASFKiCC+kX6jyug==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1720029"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1720029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:58:13 -0700
X-CSE-ConnectionGUID: Suvneh51RcaziG7ZWBnOlg==
X-CSE-MsgGUID: 9R6Dn1m7QrSq0MGMbIR5Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4693466"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:58:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:58:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:58:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7+Q1f9q+rHJMZVDUZbn7DI8m5DbK1/lETbYzveBPUG3piid/DL0P5exQD2TABwjw2JdqiIh1MsWYx0lghYJaHbAl6ig7dBp2n8oebs9eBAgfI5giZLp2O7N5SeNupFKFgqKfzCAaSgCrR3+cGyFXnmp8FsQLb44jYnoR/BHvOdBVU2N8rCyP1dJcOaq/BaqA9KzRyI4JtHOlzpN2PzC7w8PoLCT7Wem8sLY0UjDgpLQ3Y0rz39iR45nuJFa78+CNDLiZpEZ/OlZwXK/Mmj+1x4jemH9JffsUs+X0rpMFrP2EJaTlSi8CKbA2FsIUDK/xRhpSReq/Z9i1A7oEvvYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BREcXmUjAGdNYurhmCzQMw9atmw+0lBHOWACtqWLJA0=;
 b=DRgTj0d26fqHMR9McyqPqS6shO7x5GCGRA6kpHCi5qcFi6BkEfs4eYQDx6KK4BEFEfhaJf0mJtk1RdGfQ6dg/CjVFotTczIqjj61URrh/07Nt87WWTk0KNSmVCc2ANFRew6kNd7Z0LLWX5bub0GTItdiKkHkfwP7g9YFXARu4DmOTU3Y8qF56ITgIDMdz6k0iGPOrzmgndmZjh6y/eW1YuqsPs6cEU1SmChFGJu4Y46i7pspgf2Hh9jfgcf5AE4n2hDbGHcFakdh3yDZjwGS6Lm6QwCPIUmFg9Bd0DZSjOiiT1fi0ABZbfPDwXdPZ3H3y7vxHInrtPkCUeExemy6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:58:10 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:58:10 +0000
Date: Tue, 27 Oct 2026 12:58:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/5] drm/xe: Bump the LRU of every BO an exec touches
Message-ID: <auECUPrlW11vPz5P@gsse-cloud1.jf.intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-2-matthew.brost@intel.com>
 <sashiko-outbox-187044@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-187044@kernel.org>
X-ClientProxiedBy: MW4PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:303:8c::21) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH3PR11MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: f96de2ec-0138-4541-4050-08df3464a033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|261022105027099003|261022075727099003|10067099003|56012099006|261026121527099003|22082099003|18002099003|11063799006|4143699003|261026140227099003;
X-Microsoft-Antispam-Message-Info: kZfdCptjTosgGH+8/nu9wRpJ0WOECb764GhX0xM3PmH2BWjNLaQkxAH6n1Lx6q8bZR3it7CRppP2hoDbHdoBXo2u/5u8D5kwmhdGrlKqRCrizydPg7ecSaH0YI87z8FpfE6JVEXrLfyaYTy2+6BZ9td0vVD9+jBL2B+WJiyMRb5+OT8xZNAZBKzFdCppu8q1wA27PCPn7SIeaZywgdsV4ZTyif4Uc6xWtyQoa+/L+b6dNB6tFVJO4Ssxo4qRXJe1e10uYKzgpmWk/xwJclPLShv7NIHYzXkdN7ZJ3tp/nuCutfBex3khtdCYgK67/JzkTGWfzgGNlS5sGV8UhdPMv4y4dwMMFs/GWtsTguMRW68NvZTxz5SS1WCmCEnIRENiCJlEL1u20QKlSwjnrEhgYBKJ6/9W0GRJl+cfrn/Z1OnI72cIeo+FR1Plp7nFmjh09AWV3dhCtNEtkujDw64DIlbZo5y5APwv82AyTmkB9z4GnaRPIBO7Y44UJ2LVIwDpx0K4a0Cm17WIlsXtjveJ0HlbPrNuCVsTL7hCDUUJEQEe1HD2fl3Ad1+OCQhZ3jPH9WDCLxqousqC8FQWZYjgFPbmTTw3tsRfqgDTdhJl46Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(11063799006)(4143699003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ixxBm7G4Iq//GiPBBzSgYIOHVpNNMi4EmUQMRt3Ip4/unz8etbxcYNoFkd?=
 =?iso-8859-1?Q?BWpXmnU5iia3Dc6nWuybEptjRn5EN/CTnsQyX6OAg4Cao7OHkoAV/YNHb4?=
 =?iso-8859-1?Q?Iw2/PJu5ALGOKkHBL6qJkILBMs+TsclC/MrEQX0icjVWihbYIPxWns5ui+?=
 =?iso-8859-1?Q?PNE/tA9cfeb0YmVMYrN5zTdJkBN5glX8wlrwPx8gw4m99FUkbQf75tRuHN?=
 =?iso-8859-1?Q?jV4KZEAbPvgn03aKlbH6f5msUMDWKX/7XsrR2Y20eJpC3GevnOS+kRvaRL?=
 =?iso-8859-1?Q?GJ154VanjUsj0ZUCc9Fsitl4Xrd11GAhMpezjTOIwsLOaIGvqk8svYPFWq?=
 =?iso-8859-1?Q?rGdFTd/P8vdQU5CIhvJad5hLJ4ppoVZxFV0doMt7x4Sw2hL//GQlgwHMpF?=
 =?iso-8859-1?Q?uFP7mvvBXg7e9Cvq1pTD3dILpFxnOj+sh7qn00KC4R/L3MbHXzYehu8Ui8?=
 =?iso-8859-1?Q?n1vijXy6MJFBQUxo+zuQovPtI6ALt7NB86V7KYs+BUmlGlZCaj3bjCF90K?=
 =?iso-8859-1?Q?gYbaBTALoYWMnEFB3w4X6Fj4Z684PcfbXqafdZyBuTipccK7WANp0o+qBB?=
 =?iso-8859-1?Q?0h3PhEbjGhedAVa9jxvHo8lbkdw6UfdfIQ1doVSAdUu9f1sMBUTGHLnBBZ?=
 =?iso-8859-1?Q?/LrzvkEt9J/Ju7ZtpARapyawhLEFk13Rp0dWRs4YExbCGZL0dndljvjna2?=
 =?iso-8859-1?Q?7um5FyFsQBgPyOY9X8d35hUR1QOzbMzyYT0LAFD6Af6sJbALk8Xz8rHlW6?=
 =?iso-8859-1?Q?endvtXGaJNx8RqdJ00dOOfPPd4wi2Tvs5lJe4+cZ8eRzajPKRonCxffory?=
 =?iso-8859-1?Q?rYMnD1xBuIRIZ8uZrgs5iYu7KKzkI2mekimBEAkFND3iClRRrcnWcGk2Mn?=
 =?iso-8859-1?Q?1Qu4JhjnJUWX8r+Cj5E9ZDulNIOcGtbhyCiyDVKHbyKoIKcxCqHoEt05M7?=
 =?iso-8859-1?Q?i5a5SMgN2RnZrfeJoVCWbMzdbUsDlMmwx8B2ujMLNVOEuj9xWPPZnTN+p0?=
 =?iso-8859-1?Q?GFXM9QgvqA8DX2Gnc2ajuqw8x2YCAyhUU8cohARDmellCfilF9B1Qphcag?=
 =?iso-8859-1?Q?gZnBL8BTH4B2Vga7AfzPMqeO1CxCynJTdQv5wpMyZHVCPgkbfnffukAMNW?=
 =?iso-8859-1?Q?6jEVV+UrzWx+V8q1sDICXH/sxsbb3fvBTN43Xx08bzwBih6+3Zrubfeyy+?=
 =?iso-8859-1?Q?CL+iNzQEI5Z7zgQYWNtDySLo3KgUL2oZVzA1ANaU+pF3SQVuKESkDS4+o2?=
 =?iso-8859-1?Q?UUvu/MciykbGHPTCo/VelBBhwzTfhze1hoNyTmQW4gHoQ+rvu9jwI9XHO/?=
 =?iso-8859-1?Q?TrxsV9YVVpAWD5hGtPQsC0C1iOwz2/Hw5janDeJ6esFJyYaKwL7PiRu1hZ?=
 =?iso-8859-1?Q?w8KfBh5dyTpiPUYbLfJwEImT1JKLLanGYwEGoxSFe245U+jsnW50upPfZW?=
 =?iso-8859-1?Q?wTPVIzWB80nQaK4mmDW0+bGh1jVv62Yz3W+uc/QfHAWuvbAkeRlWUbpN65?=
 =?iso-8859-1?Q?fa7HhuTpz3Nrm4Ez4PBjaOXwseGgGq2QZlwwCDMn8dfaYmF2NFBY0Yg1eq?=
 =?iso-8859-1?Q?DUfoHDNPOAFhl1umEZ1dLd053OPU+7TB0hFe1zR+lPMC3+nR3RlKLWh9Ii?=
 =?iso-8859-1?Q?j9UxHfKopEUatIzDTGOoJWRwGIUCUhRvvF/QzEtYDP9yf0Fj9OWlxx/jnq?=
 =?iso-8859-1?Q?+zCyL8ebSWSmMxZpRoV9ysbrcKR7e7l1+lTyiXJOkfTeS0tM5KY4ODjNor?=
 =?iso-8859-1?Q?b5l1gLHinA5tCuO0JmC2xJYonnx/YSD5GP0o26pv6pwfeftfAZxAelkxuC?=
 =?iso-8859-1?Q?6mPKr8suyw=3D=3D?=
X-Exchange-RoutingPolicyChecked: RGG6WtQo/zWo+p8oEk7p+Epnb9nEpdZNzuQXTEuGUtxRuWOufS5Wsb3bXPWn07N4nJYXAvKFDyTzrS7kR+FARiWX6my7yERvtJ0/T3V0ijjkbmPR6FcKvpJm+HbiReju9NNoeb+5TpV1Ha3rA3qwsFWYt+x2recSKQX1BlvLnxPHkf76ACeEZs/ZPbRrsGAdMg4vubxT1DNt0dfcWeq1Z++nc+z18kd8faKDMO2NZokeCo4dvgXpM3kHJQxkaww3USiKqhVmYByaOgSiiEvYENWE7heHysqjOa13yjSZJ6WYnXTtofhK9NuU0K8JSbmTkdzuUWvWiHFN/dmRmzCpSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f96de2ec-0138-4541-4050-08df3464a033
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:58:10.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaKIw4Fy/MZxV5s5Gv5WShdqloIw0kTRXbUo/TyP/WTs7By/n4gjC604HxprZylc7rTRmwn4x6fY/QeGfJFgyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
X-OriginatorOrg: intel.com

On Tue, Oct 27, 2026 at 06:59:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: xe_vm_bump_lru() never visits private BOs in drm_exec loop
> --
> 
> commit 035844b594106f3b21b07d586a5574fd0b1e0af5
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Bump the LRU of every BO an exec touches
> 
> This commit updates xe_vm_bump_lru() to replace the drm_gpuvm_is_extobj()
> check in its drm_exec_for_each_locked_object() loop with explicit checks
> skipping xe_vm_obj(vm) and BOs whose bulk_move matches vm->lru_bulk_move,
> intending to bump non-bulk-moved private BOs such as those in fault-mode VMs.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 1ee72721b2ce3..2b84721804a77 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -426,10 +426,8 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> >   * @vm: The vm for which we are bumping LRUs.
> >   * @exec: The struct drm_exec with the locked GEM objects.
> >   *
> > - * Move the VM's private BOs, and all external objects locked by @exec,
> > - * to the LRU tail. Private BOs are moved in bulk using @vm's
> > - * &xe_vm.lru_bulk_move. External objects, which may be shared with other
> > - * VMs, are not part of that bulk move and are bumped individually.
> > + * Move all BOs locked by @exec to the LRU tail. Those covered by @vm's
> > + * &xe_vm.lru_bulk_move are moved in bulk, the rest individually.
> >   */
> >  void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> >  {
> > @@ -439,10 +437,17 @@ void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> >  	spin_lock(lru_lock);
> >  	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> >  	drm_exec_for_each_locked_object(exec, obj) {
> > -		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> > +		struct xe_bo *bo;
> > +
> > +		/* The VM's dummy resv object, not a BO. */
> > +		if (obj == xe_vm_obj(vm))
> > +			continue;
> > +
> > +		bo = gem_to_xe_bo(obj);
> > +		if (bo->ttm.bulk_move == &vm->lru_bulk_move)
> >  			continue;
> >  
> > -		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> > +		ttm_bo_move_to_lru_tail(&bo->ttm);
> 
> [Severity: Medium]
> Can drm_exec_for_each_locked_object() in xe_vm_bump_lru() ever visit a
> private BO of the VM?
> 
> In drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked(), private BOs (where
> vm is non-null) are initialized with xe_vm_resv(vm) as their reservation
> object:
> 
> 	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> 			       vm && !xe_vm_in_fault_mode(vm) &&
> 			       flags & XE_BO_FLAG_USER ?
> 			       &vm->lru_bulk_move : NULL, size,
> 			       cpu_caching, type, flags, NULL, exec);
> 
> Because private BOs share the VM's dma_resv, drm_gpuvm_is_extobj() is false
> and they are never added to gpuvm->extobj.list.
> 
> When callers prepare the drm_exec context before calling xe_vm_bump_lru()
> (via xe_validation_exec_lock() -> drm_gpuvm_exec_lock() in xe_exec_ioctl()
> or xe_preempt_work_begin() in preempt_rebind_work_func()),
> drm_gpuvm_prepare_vm() only locks xe_vm_obj(vm) and
> drm_gpuvm_prepare_objects_locked() only locks external objects from
> gpuvm->extobj.list:
> 
> 	drm_gpuvm_resv_assert_held(gpuvm);
> 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
> 		if (drm_gpuvm_bo_is_zombie(vm_bo))
> 			continue;
> 
> 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
> 
> In addition, even when the follow-up commit a6d00986d9f1 ("drm/xe: Bump the
> LRU on a successful page fault") calls xe_vm_bump_lru() from
> xe_pagefault_handle_vma(), xe_pagefault_begin() -> xe_vm_lock_vma() only
> locks xe_vm_obj(vm) and external BOs:
> 
> 	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> 	if (!err && bo && !bo->vm)
> 		err = drm_exec_lock_obj(exec, &bo->ttm.base);
> 
> Since private BOs are never recorded in exec->objects, the loop in
> xe_vm_bump_lru() only ever visits xe_vm_obj(vm) and external BOs (where
> bo->vm and bo->ttm.bulk_move are always null). Does this mean the
> bo->ttm.bulk_move == &vm->lru_bulk_move check is unreachable and private BOs
> without a bulk_move (such as fault-mode private BOs or private BOs detached
> from bulk_move in xe_gem_object_close()) still never get their LRU bumped?
>

I think this is right. Let me drop this patch + adjust page fault patch
to just direcly call ttm_bo_move_to_lru_tail.

Matt

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027183638.1031299-1-matthew.brost@intel.com?part=1
