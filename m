Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0858569F0D
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001032; cv=fail; b=WQM1mLYEPX8K0JZTXQODyy3WL9kly5LtAMTEYNuZYFUnIiWlHJWks0Yp0jXEDnkceqTFiRLStpHPsOgJJDQoGBdnK5UtFwu1oGQwEq5kF0EjtKjBZbNwQgxpSzuFElgHI+zTAce6/nVhzYuZag/2UmSA+v77FMV9bpjKvIgBfmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001032; c=relaxed/simple;
	bh=BxsXMpur5+9YroeH/HJWqXX8BfSVVfOcPu2czSa4y2k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ULl6cxtXq58KsiqOEvKym5ShBrlrxV3JUq93CrziwHfQKS5yDklFUNyFNxHLYN24mZNBM1MCuFa8WZDOTplvjWT9uE8RSCGzL9O9DiyHNTYkF+Lj7Kt/OP0Dr+fv7RNrx4BaLvedXjeEiAeqt4yOfnJRgZZVWOM8kODRjpIp8cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxeyNjd2; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxeyNjd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792001026; x=1823537026;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BxsXMpur5+9YroeH/HJWqXX8BfSVVfOcPu2czSa4y2k=;
  b=TxeyNjd2Y5fCjhEZXb93Y+us1pwO+nScFBkTKae5o3i9tx/M1NHKoLR3
   jbyshsWAoR+61HovDj7B7lsncyyD6zJTp/bgMd98Jjp60aw8Pv3klpJP7
   uDL41C53ZqB1hAdLjSVinPsWgRq6+MqiTk2ZFAdgYxai/5g5SdkVrp/03
   w1fxiLJBvb0is0GuxfAp1xeSX0RNKPyx5H7vQ46lBztDpXJaG5x/DsZld
   LWkvdI8hqqw7uZflVlHDz5QrPUFa6aqio3rU+/j8s7oS9aKQyqKrOi1uM
   OVbQX+Fk90yH1KVWS2DJ627hOyyEdg/6DuhE493xuHQlWXwWvL4VZy6Bd
   w==;
X-CSE-ConnectionGUID: MOMgVTd2SBaAmG7ksSb5zg==
X-CSE-MsgGUID: 3o/QkNaUS2eUlNQPWcrpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="664317"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="664317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:03:45 -0700
X-CSE-ConnectionGUID: KrU6vPR8ScW0Tj8kfz8lPA==
X-CSE-MsgGUID: JtGeMSkhQeuaPz0eXVdm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1500644"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:03:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:03:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:03:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:03:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIacF/RtRk1BsjzT6AslqldDhfY/BDBtXJiMp9gColKBeXHgCTddA5PMss+LzAEMgS+RQKNRW0oHCKus+6MiY+i2kjV+/pRx0UTFqgyUAT8rKgtw/ExzSaAyE8SA4iHcFNFq2WC+fzxeRi1Fowsk3BLvWwN3eXm1/OY3x71Gi35RzHGJGbioZ1zu/AKy0fy20iRRhoCDilt4dqDyXS3WOYT5qAlIj0cE3QDA1stMJl07la/dMiNjQS2PMmi6ooU0ZYoh+Gf8rM5jcc2+k+Eki9GZwrXOys1KjxnovFO4OPDUz5lGDSh1xdyZOpVjNkVNwcmZ+nQnlGpCi0jto2WxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRqQwxs6dsGSPH3hq+bw/OonPVDXaGxjis67uxbRFmc=;
 b=ilgQ1+YaHvuG9eRPx2Q/+77YZ1fjJbCweTGAO/zvHlQylaPrLu9YFmz/WkkX9oYbHlAsIeYipbUd6Zf+00FHCrygn/7vBjXMUy7CgO9MyPFBzpSy1twoYacaRu4A8cGl7PSVtxuJHOBJcnxQW+9nPl5502vgaVoOZHJiVrKm4iQt7NYAyXik2BDAtkYRYGUsUS678PIH7uHTSKsHYDPiNa9AfxAAc0SV3VOMDoC9NodzBdngMrCamxg7Bt3WYSiv0M0LpfG9Mr3HMSaSbGL4suEwv2+SSZxlAeS/9biVqVzyQtV6Q5xq+wLYvkoTfvdsp1t2eLNwkJRZ7R5PV3eoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS4PR11MB292207.namprd11.prod.outlook.com (2603:10b6:8:4bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 18:03:42 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:03:42 +0000
Date: Wed, 14 Oct 2026 14:03:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as_D-ufL0jfV1uiP@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-2-raag.jadav@intel.com>
 <sashiko-outbox-170856@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170856@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS4PR11MB292207:EE_
X-MS-Office365-Filtering-Correlation-Id: 792ca9b1-aec6-4020-5d84-08df2a1d7b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: jkt1wMYAQMXfYXnhFUN7+wSF8OJxsFtXB9abwCNO1pJDV1ThGurRcgtVEcUuSU8i1xOJ9lkX0LdPwkeCIw2G0QsuPvuPI/F98fQ/BIXZXMtdhO5GHKNm1TGNfXxN9gYH79b4tIcLhVqGz9XR28X+NstjByXUWKdfkVO42yUVqMevGov+aXE1muJX0ZGs81LF0o3U6GBvrBVfuoq0JxeHGY7Ai0RN9Znd0Xv0uIIoi4+LWcmfaZ9JkeEvbSULLXRc8/Eq3dsPFnjxstUBKSqXb8/fEVNJ36rgvuTF3kaUKKj0OVlRC26zaQEWwtKblpldZgFPQ0M8V9buRvOyAiNN/+f1D2DjC5ZuRL7XutauzZFLyWvO/f0YQtIlm/7VobF6xjHCRk87GvelpXUkZnhbJj+S9rntmy2O+KBhO8Yf1WJaV/9Rwb8eOh8l7NGFJuluo3NeVhcp3zSAf89FfIhoA0OP3u6KQayftGqUor5qLAMK+7fmCGNF6AYwCRHcHQbxFcazltvdJAu2j75ZY4MM7N0iUGqWGQ4NDVf2d3L1tN+fvw9FEpQi8UAT7u7gt31twAdRQ4vqu/BvuUYgHXbbeLEYdQhncO4kmOnW7279P4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uUBqtHZNKCf4bmygIasOGBS3er6uipW1PNgph12RE9nY+mpCVRsACQaCgQ?=
 =?iso-8859-1?Q?2+TKaPNH31qJ7jL3fUgTJIq0R6P6zCy6x73M1GTkO6+LOxTcjfLVUeIvLw?=
 =?iso-8859-1?Q?md5CcSfjwZKdfszhRPGecFdikvsSmG6xJXak9eVZimN2CwIkNW73ygQPD7?=
 =?iso-8859-1?Q?I3eTXmeRYnsGP/1BlemPBDATP5vV8KDTZFdQ1P+qYmkZL4nyN4DL8FGhLe?=
 =?iso-8859-1?Q?anYvBe0BSCVzU67snaBV1olx1kbFIBI0i7ER0ZsMjgeJZxfp4cO5RfmlhB?=
 =?iso-8859-1?Q?hcLHLxuZzygHYC5xv7BD/dsPkjvMpky80U0IMxZcTtj6Nwqiy3AFY+J5Ah?=
 =?iso-8859-1?Q?RazyyTd5ADwyLrpre4JXMJOBdCknJ6RrJUYBHWK5ITZIBfJCfqbZysAxzo?=
 =?iso-8859-1?Q?vUBqkJOwfYmAIIG70wGNSCLgXkhVdje1rpFa16R71rb0RZZTcGIDhT5bD4?=
 =?iso-8859-1?Q?PF6+1Uu5ku4VxMR+PWC+eol8u1s4a3baj/U211DSXNtGZl6AjwCALh9Ftm?=
 =?iso-8859-1?Q?iAt6gmVj5OS9SunEOgMuRprjfkqp2kvRsWtSGF2i6Mt4n1Yf+9SMo2kqFr?=
 =?iso-8859-1?Q?nTFbDVeoGLG8VtVbm3guMt1yze6RLJ/kxG9MsNV0c+J8gRmrh9KfvWb++o?=
 =?iso-8859-1?Q?RZZk1BARmYy80p3t1C6PJgNQ618jFElFIundmHFov47OsknwKqbmycnjdl?=
 =?iso-8859-1?Q?kl/fxoPToIf4YJIS7uMwWIyzIgCAliJFp0J8mimDroJXNYzEPQI9h0zSgP?=
 =?iso-8859-1?Q?7WOx/uy3M6nXtRMnfymusSNdz6dYGz8DGNgoZd9aiVVg4boinJ1/43Uyqq?=
 =?iso-8859-1?Q?9bM/e+EDbzskgST/uE6dIldV6bFha9IEfRdBxhh7JkU0jfNaWTJfXHdEMT?=
 =?iso-8859-1?Q?Bg+bKx8r9pHG8A3Ljzh6lkG9TlWaHQskkCh/4kbJoqAmf2z/sDJflEksm8?=
 =?iso-8859-1?Q?hF9mu53VVOy1Gi+W/9i7+CdUmF05MQf5PwXUqrMx6/IUARS4XVfsX4QOOd?=
 =?iso-8859-1?Q?qVNhCf1OuXUH4t14iThp1BJaMEJS+5QfpdodpXfejswpEfUFcvoJftBXjX?=
 =?iso-8859-1?Q?fuQwKbfMdl2sYz922+GqMR0ytec/wxzHctggzMmjpAeOp4TXCclWlpBAHb?=
 =?iso-8859-1?Q?JHIEuUVQuP8u1A2uYqkM8Dvnx7WgzTleNuWfnKtAs2MsMYm3k0RpR8dieQ?=
 =?iso-8859-1?Q?tLvzHo05+YZluroRz3w6aKYV2GWPM/BnuFXVlZRLPkdpkNAkxg8i8UH/Xx?=
 =?iso-8859-1?Q?Vg5Omy3VwMnz9B6BnyjyYU6eN2r2TbmT6odZao3GxXYimTmaZOSQf9Z/Fk?=
 =?iso-8859-1?Q?6mnxrndhlzF6zRdRU3BeYKdkP48zEdTw/RaOnxlNb3j2Q0XLLvSkBG4AUE?=
 =?iso-8859-1?Q?V+PaK4D9nOgZ2HnTOUHacThY9YlJKWw6lrOqtcfF5R0HxhWpPSgZmj++fq?=
 =?iso-8859-1?Q?+vCSyLOOV+yeJaoXBVfWiYwv5yTeVXtscY9AEkCmCaBFDq43il9V/Zxzom?=
 =?iso-8859-1?Q?frmpJtv2npwSKp76djmdSsiSmn7loRGjpTQATIzSIKIQiOt2/cI3qv4lHe?=
 =?iso-8859-1?Q?FgzVIZ2VHsW5LqXQabVqotKJdh1zUYk9MNe/5sxDOi9vh8C1LYn8DUsxe/?=
 =?iso-8859-1?Q?WCNFtrXxIq9RVqJmJ0IE7Sy4rFjByY6UkOrxpVbZeIeMTyqAdMnzHbbdVF?=
 =?iso-8859-1?Q?h04q33gYJamsBOWZQ0+NqIja6U5v94nffYefJyGGl8pw1avW3rzQucyKcQ?=
 =?iso-8859-1?Q?SApfHpEcBPXWy1hqCUDKyK9xxMz90gqksTpzyiY+XpO4HkGT2MX3RuHELu?=
 =?iso-8859-1?Q?TB7RsLvMQg=3D=3D?=
X-Exchange-RoutingPolicyChecked: E3LE4loXP2mukQSJg64EOOOPrD1b4R2Mgt4yWtIRPYFI3Hez6Yjq0niCNNIQqzR7/GFcPWk1Vzh9lxC4Ze+D5AgCP5hAP5D2tnG/T8Ow9IiTj7vABwXvWRXg53D+FUztbUhxsNMlWF94iPzZxy/OVmJsqhid1tPrGE12Fm/cx8bef71uIPchnTxvliag8hJZEzr69T2ldrz6cySG5/rnKSmfPh0mVGEidXCe9Weg+EEmTDRFOV4bLjipprBYFDGsJU89WCl9YbcQQBHP4N66w3mzeEXeTC7P//Rmxm3+qGIaWnkvitcR1Q5U3woIj+TnZV2QkfqCc+Ath3xZ346YGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 792ca9b1-aec6-4020-5d84-08df2a1d7b0b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:03:41.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ/XV2q14N13Y3Xo/jtOoqUIjaFmN7Ie+5PZ2Qtc2dXfm99UJJmwyZa0A4gAmeC/zP8q/6dpgjippa9op28BjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB292207
X-OriginatorOrg: intel.com

On Wed, Oct 14, 2026 at 06:14:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: Infinite TDR loop when device wedged during GT init
> --
> 
> commit 6009cd9a52688d1928f2b5ef571d3108edd7243e
> Author: Raag Jadav <raag.jadav@intel.com>
> 
> drm/xe/gt: Use GT ordered workqueue for wedging
> 
> This commit introduces a worker for GT specific wedge handling and queues the
> teardown on the GT ordered workqueue. This prevents scheduler disruptions
> while jobs are still in-flight. It also introduces the
> for_each_initialized_gt() macro and uses it when declaring the device
> wedged.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index e1979bbcf7bc6..014bc5b0216dd 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1425,7 +1425,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> >  			    WEDGED_URL, XE_BUG_URL);
> >  	}
> >  
> > -	for_each_gt(gt, xe, id)
> > +	for_each_initialized_gt(gt, xe, id)
> >  		xe_gt_declare_wedged(gt);
> 
> [Severity: High]
> Does this create a race condition if the device is wedged concurrently with
> xe_gt_init()?
> 
> If xe_device_declare_wedged() runs while a GT is initializing, the GT is
> skipped here because gt->initialized is false.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 775c826b68b42..d8bf538ceafff 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> [ ... ]
> > @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
> >  			return err;
> >  	}
> >  
> > +	/* Must be last */
> > +	WRITE_ONCE(gt->initialized, true);
> >  	return 0;
> >  }
> 
> Then xe_gt_init() sets gt->initialized to true without checking if a global
> wedge event occurred during initialization.
> 
> This allows the GT to become active even though its GuC was never wedged
> (since xe_guc_submit_wedge() was skipped during xe_device_declare_wedged()).
> 
> If jobs submitted to this GT (like migration jobs) hang, the TDR in

The race is real, but I believe that with the wedge this scenario is
impossible, so we can dismiss this case, right Raag?

> guc_exec_queue_timedout_job() runs. Since the TDR detects the global wedge
> via xe_wedged(), it skips the hardware reset but returns NO_HANG while
> immediately re-queueing the TDR work:
> 
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
>     ...
>     xe_guc_exec_queue_trigger_cleanup(q);
> 
>     if (wedge_device)
>         xe_device_declare_wedged(gt_to_xe(q->gt));
> 
>     /*
>      * We want the job added back to the pending list so it gets freed; this
>      * is what DRM_GPU_SCHED_STAT_NO_HANG does.
>      */
>     return DRM_GPU_SCHED_STAT_NO_HANG;
> }
> 
> Can this lead to an infinite TDR spinloop (100% CPU deadlock) since the job
> is never completed nor is the hardware reset?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261014055215.330408-1-raag.jadav@intel.com?part=1
