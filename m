Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121E3DA5C7
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561316; cv=fail; b=MHtBzHQuPh1dkpN4qc/1ontMyaBLvkP+2biQnLu7e44DeFrtEXUipze+tJJy3RK8pBL7EcUTj87jRkNkBSlUaxuuw/gpnVdnARwE3csacNqGs5gP624XF8uwyXr38AZl6Khl8s2JmNDBSDJjTbbiHaeYNmUiJYw0xnZJy+Glftw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561316; c=relaxed/simple;
	bh=SEtHASB3g58sq5tsZKJZrHCe8fj2L1v11G55/raNfM4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QKBZvc32XvPctOQNx9B5tzRx8RGjoUbc8HzCSIcEjnmmEOpmWLn0Ly605ZVUj6dXXByUQoMzBunfc+o/+xHzL42ds4RNZ4zhKR1tCH1TksjWwFozUHpP+t+sZJoSajhV0+q0pUifBMBI44ikc9qoE2fuCR44cLT5ZT5bW+FV8ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYkzt8Br; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYkzt8Br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789561314; x=1821097314;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SEtHASB3g58sq5tsZKJZrHCe8fj2L1v11G55/raNfM4=;
  b=JYkzt8Brdebs6fKweMSr/MkqJfg5VaP8ZMNjACRwsmIL9CpIs8DFjaap
   hziuCQ0NjeVx7RcEY80kXlucig16rqjbZOPRZvgii5iiHnQz3GaILpHt8
   bRgq6LREpJ9npF6Z63bOoMVqRVDR4SaAYd1ZByAf191JWv3DP7/O/BPmS
   fMIMMnmTsCeRWgz3W9LzlFRSZdA+Xyebi9a3iiyt+3Yc0HFbmBqY1UXuB
   BkC8PnLGvPU3Nf+2L8jqL4V9xh4WNhXQjp06VnUhVt4LUBM2q2DoNP1mT
   MxD51rLRxTTS1lkcOtFdFwien5uCfEOefaluemRby51/H/+ZbPRIH9lNa
   w==;
X-CSE-ConnectionGUID: FTtywSlES9KO7HRt+0I24w==
X-CSE-MsgGUID: a/4XEOCfT4+ZVLyuJC1gww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112703241"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112703241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:21:54 -0700
X-CSE-ConnectionGUID: 9C8ByJ34SJqNWpfL3BeAZg==
X-CSE-MsgGUID: EAnh5IKuR8qG/uFSFQkYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272850705"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:21:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 05:21:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 05:21:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 05:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO1E3VtSWr7kwafk5US1l25Dnu4jMNdKRnKj5XTuN5HUgXflRtEyTp5+zIt4/HdXW5Ra0A8DvHqJFTgYFD2SzcOJuQAWIOWnZgCdXX6SfEcrHWOxfHcRbBJUWkHWRRRFfqRI8EMcma1GEX47Wcg0yWTn9lUxlZl4odOMeXJXUl6d/iKMcaCWPh6Drf5/nZF0EKJIvLIBd3Wl8PSrL4UhXg+o5K+kaYlbHumun7YRMntvFBKElcSRsdiVvMXm5TJhWBCC+9gO4splyTIDY+GNTSPxSFX2zchGO7cnwE6tJNN+S0UhCQ/U+TbFfu7eKHBeRvqzTsINHGzJFuHY/NSekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbhl+3XS+PV5uXcvrXYL1agjTPzgb9U6ZoUTcadnlDs=;
 b=Sdh00X2Rz6JOYq4L1gE1C48VhY9NDGcc/X6WD3Xej8/2xvKU5R8OKyfPdF7X1JetYAX+FtoJQmAe/Ei+8Mo48ATzKsje02aItegQ/WdhrJiC/RwqvqliMN6JjRPQb57WTsGXysUZLPdBfmfbyWfQ5i7SYI5cDmOf6Ao35/iqz9p5XVs/iSOhIOZpI5K2xDCxe027qVdw1TxOvdlN1fQViaBVLii5rLGOdAjvvYdRDiDov9hr7JttUC9vLrdFyA9W2/zW9LBiKxbca8+HhJVS7ZIpYwblTXK5innKgx/JwyvsrsMH89C25IESsYB48M7+20cUTLaNoiRzsksvaJ+MZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 12:21:49 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 12:21:49 +0000
Date: Wed, 16 Sep 2026 08:21:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
Message-ID: <aqqJ2fNQ5lxSGRr7@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
 <20260915212050.8E5CB1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915212050.8E5CB1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV1PR11MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c5d919-aa75-4f9c-26b3-08df13ed14d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4143699003|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VvDH021CMu+qviwFeHT/B0JUul8HM9Z6A8JF37ZdgN005uWYaTvgjTw/8Y1qrsYvJj9qYt6ejlZXA/c9jFAYfqCb5XxnaXOhFef3cyz3R5QE4Fqzm9m1hwXLTJitDSe83CANcZdPHgXh6Hc+zxcO/YfmMXwf2ea1/eafchVEX/K/P5MSZ/kiiSK9+r7C0q6aS3KziGIcThjswMYl8L+s7GOAO9Zb6iDP7t0soVcJwi7N2XhPxgeV2cM3HUjVa7PCCuUoWnHwkwl/2HN4mWTekvqHE8RNyUHYo+8ygJRfnGlWyz4w2RXlIWiA7R60RgEaKjTJUhpWZHvXwz6DUT9JJVbt6u/uda1gckPfmhzzE5ewpxWNFF9UFP1hLIQnzvxFhZIC8/uXzGChtSpx6UH8ittM+3zsxNnOkzB9dL2S+z8RhB9RNUJ7HbgEhvd1o+j0WlzBgw/MrkMBcGVBo5vwiyBO7MTxFpCd+2MWfBFbZx7iqtYawMmRHf11Ba5vAu5YpYTL3Abr12SwNrIcvRtTybVowFpncwohS8NzBdq6mVYbJ0UFAX1R5lBUjlcwc/W6LhLKcJrDts40Qz02xpAw653z/W8j3iDRVnzVxFpzMys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D15QG3/Al7El8j+STKiiChBqGy5HpjEiF0bHdUncudzucwPZ00xqvFGqN2?=
 =?iso-8859-1?Q?67SyGfCD2p/nv9NS63+b4QHBS5e95Qa6It1RjXjRnIpsAWPfc8p7PeiOn5?=
 =?iso-8859-1?Q?QrLmXCzLoI09PncK1aKo0Ts0wB/vvpZf4Njx0o3KdLiMS7X9RWeCqBa7kk?=
 =?iso-8859-1?Q?PB9yA3qlUfh/t27K9npPW+Nef6evmXRUVLhmLKS7bAzDWauG25PXNdWRiz?=
 =?iso-8859-1?Q?VRpyYlwPbXAUJfFyS9Q5Cneklf/q/pi/RqUQIUFPRaP7LraHGy/k1MuVXn?=
 =?iso-8859-1?Q?ZHX5qQIsktaIKRlfgcney8XHP5Ym3l7mANzLp5m6Sacnr0nJSwdh7C+bwr?=
 =?iso-8859-1?Q?K8iu+fRX8DMm13GItYSUEAFklkjhz/hcbNXpnm1KecLHz0CMPNGlMhn81A?=
 =?iso-8859-1?Q?qn83fN0TgZaABJW/FWS+/MOAnye3KxJam4YqecvpVuXnGIetDw7s9i2kMB?=
 =?iso-8859-1?Q?bPxM8ZBZXAou39RTWz3Jb/U4lMa5iNHGG8+mX0ReOhlMrjIyZtJSxriAVx?=
 =?iso-8859-1?Q?QrPJviSaApkVnY7Pn0yqDS9ungn7r5jfeDW9NCc3v6TLMW4L4ao5YF5Uw2?=
 =?iso-8859-1?Q?4b8V531XcBmMOLWPZ/RX1f4Us/EYlmdRFO7Vr06WQlEwnP1caE3DiudObs?=
 =?iso-8859-1?Q?tmNq22eZpFvgxYQH5w2sR7/zCXOb0DjfDNYE2GafExFyotMUIA1tXCGSWw?=
 =?iso-8859-1?Q?Fm7NZmL/okjiYOGjQTxGOd/U9lHqiAkZVUNaEhLYiPFzyTf7LqEbi+Q45f?=
 =?iso-8859-1?Q?z7U10N6LmpWa9tCiJWWBMj0xBKOUWcE4IcOID5U+KottOxCGaJ8r7nVZLA?=
 =?iso-8859-1?Q?2fPgMauVNwhhs2oH5GXaCiTamapHAyFFY29DLSonRxtOcp0R5G9rrOP1AV?=
 =?iso-8859-1?Q?ePXB0DecNZ4HSRWVjs30qYcIVNp1xtkZrOW9APEiSyY1kQnQ4gLLnrN3XD?=
 =?iso-8859-1?Q?xinTVlqlDEhWTSlf9XpGpNY5+DAP+Bp5mdy7sYniZPqnafMImI2fgFhLgN?=
 =?iso-8859-1?Q?tRn+N6uy3jH+dzWRBU116unZBQuKeZNI+a7jQ1Zl+6NWSmROOooElCIeMv?=
 =?iso-8859-1?Q?XspWxCBMqEAVzECFvNSkcGj+tIk217Q2LT78EH/UrRQb9BUyKZkT8zA9V5?=
 =?iso-8859-1?Q?O6F4opInUPojf1/r+KmAoRWkQS12k0OS02paTs9BwkTchpyv0msQBhVcTo?=
 =?iso-8859-1?Q?fhs9twenDkE7l5OItFUIpZlQrC3JfVz9vp1k0bAxPqE+JxfpnE91ETu4sX?=
 =?iso-8859-1?Q?ISeW0m/TkZOMrjR36ES7rzEo3xibAZPnJRYQEChYYQhMLk8exEA1Y3UnFB?=
 =?iso-8859-1?Q?pAuBMJSjlQPSc8hf6Yi05Vc6xR7TN29JMxL7iRAxowJNg1vj34JUlP+mu5?=
 =?iso-8859-1?Q?hUs5rBKPFFB//GEXLhqmk7t9D82sFhhuCN4FM445gHQnfCZEuCI8ypWA4x?=
 =?iso-8859-1?Q?0rWlHI/wqwATx5cnGIsysp9hVstApjxeukrJRFxYCvGljJYeLNyNpFJHd/?=
 =?iso-8859-1?Q?exiSaRLCsKUatJYGCYg7YVmSJxILDyKmyZYXWYAdAJ/8vC202rSbjlyD4l?=
 =?iso-8859-1?Q?3Wrv3LSKVn2c8W6S0mtiC3vtjBorYt6EojjlcGxy8RRPtcDWHjdqtsHZnl?=
 =?iso-8859-1?Q?g5ipw6x0E27ia6XwAYw+lfaYcVDVg4xGe7alU6vLMNlABQmuR7j3ECgANn?=
 =?iso-8859-1?Q?cIR/SFmUAdhhTV2+gxxAzY5Dt8KM7W0FouZAhbX5QqZHhPaBlti/tSvr04?=
 =?iso-8859-1?Q?ZtiR4ZUabTpwEYcTbwSM6LTlEQWmDl3XeKrof4gCzpsATZvz8K6CtOGVjZ?=
 =?iso-8859-1?Q?kxqZnYRcAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: mviEKAH2yfJiulNSDOeLFHXhr65FtFz+fTHTNf5op5WddQT2PDBTBKeexfk9FL2NiSmIkz+J9tDnLu8cmggz4aP9Ba2TkYqYK1KEJywPzRXHB8NCVwELszmKVSzT90RSi8AExHUaSzVj91H+edV0B0YsGGc3P2lmVdUvBCuWxHamcMBwdvkttDBoyXBWCNBMhbf8AKM0GuqZ+V5cXWw95lMle7LMZ+ARzhOZ1EWMTYsaA32dsShc6WVDs9tdqsE0XkefN6tRgaOFWsSDXaXeGPzdobLcGfVEYZ43yZEsD9gkl6nxG/IGKH+J69b4XetnyUoSDPsmtAcDhwhbo63/pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c5d919-aa75-4f9c-26b3-08df13ed14d2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:21:48.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04uru0dQBIjfvFbNdhKPeSJdngO4nlpPon7D+/r/KGorq32CZeNRM6ddlGvmw7ret5/ci5cDZ+uSU7aJtL9WIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
X-OriginatorOrg: intel.com

On Tue, Sep 15, 2026 at 09:20:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: D3cold runtime suspend always fails due to C6 check after GT PG disable
> --
> 
> commit 691645f0da262033183939383983163842757c50
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> drm/xe: Poll GT for C6 before D3
> 
> This commit adds a check for GT C6 state before the D3 transition in the
> runtime suspend flow, aborting and resuming if the check fails.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 00b2b5dfb8f6c..488745ce0473f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> [ ... ]
> > @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
> >  	if (err)
> >  		return err;
> >  
> > +	err = xe_pm_check_device_idle(xe);
> > +	if (err) {
> > +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
> > +		ret = xe_pm_runtime_resume(xe);
> 
> [Severity: Medium]
> Will this idle check always fail when D3cold is allowed?
> 
> Looking at the sequence, xe_pci_runtime_suspend() calls
> xe_pm_runtime_suspend() right before this check. When D3cold is allowed,
> xe_pm_runtime_suspend() executes xe_gt_suspend():
> 
> drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
> ...
> 	for_each_gt(gt, xe, id) {
> 		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
> ...
> }
> 
> xe_gt_suspend() then prepares the GT for power removal by explicitly disabling
> power gating:
> 
> drivers/gpu/drm/xe/xe_gt.c:xe_gt_suspend() {
> ...
> 	xe_gt_idle_disable_pg(gt);
> ...
> }
> 
> Because xe_gt_idle_disable_pg() writes 0 to the POWERGATE_ENABLE register,
> the hardware is prevented from entering the C6 power gating state. Won't
> the subsequent poll for GT_IDLE_C6 in xe_pm_check_device_idle() always
> timeout and return -EAGAIN, causing the device to constantly abort suspend
> and immediately resume?

I believe this can be dismissed. But it would be good to run some experiments
to confirm this.
If this is right, then the CRI bug is a different FW bug...

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260915210113.2915363-1-vinay.belgaumkar@intel.com?part=1
