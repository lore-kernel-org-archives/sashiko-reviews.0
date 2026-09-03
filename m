Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72839501F4C
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473693; cv=fail; b=XCEQyOkQfcl4RJfdKT07BBMD6WF6l5B1m/u8KYuk4NMKY9s7uk7uBJPjAwSm6qYfiaz/HTmE8bHuNLpOmhvevCrNdTa5zRxMOKF3jIy8mWYfA+IZ3D+p3Qz8e1WYWELOI93BsokO5QeSpDgU4sByrgUkTZ/QE1uhhnDKmBL1Lbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473693; c=relaxed/simple;
	bh=l/TRUoL87Taed/qtRQp7rlwzJ6TuNtXwdx0i/RvKirA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oHqY/YFA8xr4xTPcrvItEeiciwiVDbgXY2gnvwMseS37QFhS1hmZSLV2YqeEDtg0YXfNxAkP8I3B4bXgXCUTGY1a7hLDqnRFJ0s0tX0jcNUe40iLwgADkZnk8R/4ltH7gGJuj7P4PpZL/6I66W7xdHaS68Aom10mZ4+bl4bsu7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvmLHTW7; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvmLHTW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788473692; x=1820009692;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l/TRUoL87Taed/qtRQp7rlwzJ6TuNtXwdx0i/RvKirA=;
  b=CvmLHTW7mh0MEX/vyG2dWAcG8e9YDt3HaFLjB8Vxtg2Zld+gW8r9zeS3
   JpFU0CPXEeMTG4ZRHDvf5wRBSw4gGAH24BvgnjgcLntMhh1QIt5N75Gqf
   f1u4Lnv7yaseMUpnkU3+puGNdmHB5VPeS/AmxuzBJnTtIZQg5IPrK59Mt
   xfdMmqPtXqIKTK5MK7XeWOPbZT2O9E+PHN4DEbsm82Gq5nV1WRE5/E3rI
   ajcejhd1bGX5VNbuflySAZFrA++qaykaPZaR02m7opYHKaGmec7tOIwGZ
   fcwaBj/SBhbGgu+ZX6XDzAu5zmODdHiqwUnZBlvSrijH9quYDhrWqm7BR
   w==;
X-CSE-ConnectionGUID: u3qdhKIJSriAYFaRfDnWlA==
X-CSE-MsgGUID: eej60ZKYRA6PQKMwRq549w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89094494"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89094494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:14:51 -0700
X-CSE-ConnectionGUID: MIT1UqcOSTiKyTqr37gpzw==
X-CSE-MsgGUID: 5v7/x2yfRZ+MHe/TE3f6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275129537"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:14:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:14:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 15:14:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltulXTjipjyxFIYkTZDQaYNBzF10sCe2+xzVu67zdwHNglLai2ICbIe99y6yzDAoRo7SRVkK589N0s5mrIjqRH81b++kA/g1qOa/PlwXyaUxF6yifHa3z5UzUHuuPp+DbWJSIOkSGxNCsgZZRAVo+X6SAEaUioGOJ3EY0+AwQmIz5qUMYg4Awo8S8WVpOyzXag/0bVvqqKEfyStYsqxfBXkFxv20oy1G93AxiN1lvCGVn9bDigXpxD5DzBAMUlXhY8Ylf2Umot74PztOuFgOU9QsUuduZ2W3Khjsfnbb9KEnUe84zl17HJZsloSKowMSVckf9wHcNw8Obdu+UfEYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+/+vTTxf4otpQc4XFDp5Znfer4zaJ4vo5MOZW4LV5E=;
 b=LoeaIS/HKI2xGfrXQfVnb6o+G8hlrYlBTa0jdfym6N5z/R7oZ4SmSjhbrOQTP64fLVD0U6V6Iabfj0oxPpkqRxEdEk9l8KJc98+bl/ny7jIaLnTFqjgim/q9C2ywEctAR26l69yOnywzwjFhL0nz5vi96kO4XN5YEeoMFddxiHmSdnm/9Vfba8mUS91YlfUTr3/0ryTQWI1Ax3UHT9OeZFC40yJCuazEvW/ODuM2wUC6NA9XRgwRaNp39+c+3y20rqOMbzHkIekUI2+ClWwIg1ZsSQfGTCxjYjR3oBiPamdB7Zyv1bNd3DR2BW1vXk3dEM8JjYyjywZGevYjPxAKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 22:14:46 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 22:14:46 +0000
Date: Fri, 4 Sep 2026 00:14:42 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v11 6/8] drm/i915: override Snps's VS/PE when requested
Message-ID: <2lwl6gzy5qsuay5r6qkgycerikxcgkz63uib7dhxdj2ht3a7jm@ksjpbzuaj2cw>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-7-michal.grzelak@intel.com>
 <20260813162911.AF5701F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813162911.AF5701F00A3A@smtp.kernel.org>
X-ClientProxiedBy: VIUP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::14) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 89303033-b566-4751-dfdd-08df0a08c36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|5023799004|6133799003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: albsxqYDkaEZrMeLfcH5EcoMPxrsRq8rf/XDIsMh2IgbSEgXSxpKe5nbpxvecRh09s5Iw81jHOMXer0DwU+bzjcGcJO2byY34JAfu2VjokrXGrzTcjlvEVrOh+QrwZDs0UNsa/PrheauPTzUCp9W8yohboTClniPfWjytRvXc08938gRZ+kRCIeeLgJdAx9adzQzBU+pTtEHcazg03ShEUv19tW//ja9Bwhh7b4MNKdpQW3R0i1luBivP6/JSVbOOYoDHlK9Nm6+8BRVuQDsLMaRxllrkWXdvv3GzRGcCYtO6a14B88lrYRjHd5aRk4ytbl2K5QKKsqK2JT16D9rtq7wbIsrURBMYDwI47y0Rj3aQK3x4mspAverRONpk1T9+ptR1jMzlK0Is783ZOjBWbBYFiHpJGqs2EeNOFbKeLEzAt2aBOVguwWNf3Z5wwOjG5YxI0jtKVWJTc2wWI8q2LVlzL6hBx0UcwnAWNui2dl0mjw6bv3NfF7BhyvpJRkv+RVu+cGaf0o6JTNMf7vcFZzS3Msh78FmdZJBkB4qJ7aBcdEP06UOdDaeCKO/q4PrcusgL2vgNX8b6F0HKU022+/g9zSf7i2yRbrXxSfc+kA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(5023799004)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWVDemJBWkFVc0pERVVHUmF4V2lmT2d6VHlBMTZ0eitCdmNwcWE4aEM5QzB1?=
 =?utf-8?B?OUF3YlhDMUhpbzNnYlY2UTZhL3hJYVRUSDhyN3pFOStwYkduQldNMXdkZitT?=
 =?utf-8?B?UFZzbmRkT3hlamJlTC9IOTBzNnNtK3FBOG9mblh0TjZoVndGdUlZTWFtbmpQ?=
 =?utf-8?B?RjJzcDg2WGNuTGg4VW84L2JQaFBSRVpFZTlhS1JFejZ3V00rcGc4US9oTm9o?=
 =?utf-8?B?TEowanR1TDdpdkJ3REpUVTlGNzNHMit0QUczaEZrNldSUEZLZjFSMmprbUo3?=
 =?utf-8?B?TUVwU3ZWMUtLby80L3V1dm5pT1hmTUNMVXYxaTdQdU9jV1F1eXAzT0R6TUdl?=
 =?utf-8?B?dG52Z0tiaDdvSFh2R24wekVrWlFMTVJjNmxtTXZLdmQvekNsS0hFUVhvQVdi?=
 =?utf-8?B?Yk1VaDBQdjhQRXdQWXQwazRUcjVtZXVqZ3hicllNdzhOWE5PVkorV2pYSFM4?=
 =?utf-8?B?Y29ENU51YTFESWFDb0NXUHlaZjRselhtcHhnZzE1YzFlbEtZcm1hblpPRi9y?=
 =?utf-8?B?K1UrV1ptRmZ1ZWV1dldOcjlrb1phKzlkRVhDcjV6NWU3ZXBpdjdIdlNxTjE5?=
 =?utf-8?B?YjI3Y3dyWFNaSnBwV2EyR1pYN2dJcG5yempxWjhQV1BTSjFCVy91UTVkMWRC?=
 =?utf-8?B?T2FVVk1aNndjcVZpcEJJNHJzUXdlNWhwclpZaXpGd1VTNXFUWXNzU3JhbFpL?=
 =?utf-8?B?L3pFb1dOTUtUMUhqdHMxV2ZWUnJwQ1c1S2poK1QrK01QcDdoN3g2TmNOOXU5?=
 =?utf-8?B?ODJHbmJpcXR0TVNycU9IelJWU3V2N2lxcGpQdU9sSkJKMkRodDdHUGhQYVk2?=
 =?utf-8?B?enpjU2E5ZU03OENibERseDhQQStlU0VQMkk5VzdyVFdrdUJjV3FLaFlIWG96?=
 =?utf-8?B?SFFIbDNodVBJQ1hHM05pM3BmdVY5cEI1bkFZS3dxYTB6bUIvNWZMaEcvVUNI?=
 =?utf-8?B?c2tmZDFnakpWY3RXekJ5a3kwWUZFZXNOOFkrR0cxQVlrbDFFbnRjZ0Q4Q1JI?=
 =?utf-8?B?Y0t4WWQrWXUzMi82S1gyZEx2cXlhYmNZNkM2Vk12RXNJSU9KQTdodWRuUHlE?=
 =?utf-8?B?TFNKVEIwTzZFSEtCS3lBMGRNL2NhVjdPZWJDTVprQWRPdlNZNkdUUmZUcmYr?=
 =?utf-8?B?dDY2TXYyRWlOTEZnQkR6WndOOHhxY1lPR3FYZDU1ZUl5bm9kQzVwN2tNeGJN?=
 =?utf-8?B?VWJGN05SYnlndXIzZzg4b0x6djAxRXpZeFdpYUVhSk5RRFVBWW5aNHdnaEd5?=
 =?utf-8?B?VmpZMjhYZEgyeENhOHQvODdXNkRQUVQxSUlGUUc0cklyVlE1MnFRbVZuNUU3?=
 =?utf-8?B?VXUwTUdDU2JFb3JLYzUwUUkvc3l6WW8rbWRxM3pxTHl3QW1rV3lpTlgxbVpB?=
 =?utf-8?B?K3NxaFFYOUpVUUdXamF1dWhxYWxwTXZVR0dUMDFjT2plVXF0MW4zS0JkYTh1?=
 =?utf-8?B?RE5iWlZBbmRJcHI1S0hySlBDbFkwOE94YWtlVXdjeTQ2Smp5by9YSmg2NnF4?=
 =?utf-8?B?Zkt1RXhQbGEzMVE1Yyt2NDZPK1pQMjhDeTVLOGpGRndpWEJnN1FDOEJXSFQz?=
 =?utf-8?B?Vmc1Um1oTXJWclVPRGlzWDFaLzlqNGlpalE1TjRWWEpnZFFya29LSHptR05I?=
 =?utf-8?B?Wlo2eHVVOTNTd2pCTU9SZStPcmFpOEc2dksvSWZ0b2ZzRWhRK0dXMU5ESzht?=
 =?utf-8?B?enJ2aWhKYnR1dEUrZ1ZEdkNWdTBvd3hlRUZ6Q3EzU1FyZFc0QTVaQW1qOEty?=
 =?utf-8?B?N1VKZnlKbFlubFdRdUdQSzJnVlVrR0FpZktJVjFMVEtqZGxFT1VuSWIxTFpX?=
 =?utf-8?B?Ry8yNUxKL244WTVPTHhaRElnOGR5bTVNWU55eG1OTUxIL2ljU2ZOeTkwRThH?=
 =?utf-8?B?SE5nQmRGWHpjczlvV0tOOG9yRUx1TWQ3RDhEcWpwbTJFRmVXb3lHYVdPYUpL?=
 =?utf-8?B?Rzg3OTBTTDNjLy9MWHNKWEpmK2VIRk5lczRDdUNSc1RUN0VMT25yZlI3cGtT?=
 =?utf-8?B?ay9xNmFsUlVwa1NWUDQvcVNtYjZJUlI3LzkxbCtXOFQxU0VwUzRTRFBPV0Iw?=
 =?utf-8?B?YUxkZFpCMHo3Y0o1RlU1Ymk0K05LNFBuU0E2RWJYTG9HejhMeGhVWk5Ob2xF?=
 =?utf-8?B?RXQ1M0V6L3ZYMXVyMHp1MUx5MzloMHhVME4yM2k3OUxoV0I5eWJtNjFENGRr?=
 =?utf-8?B?NXk4dERSaERPNytEZnpSbC8zYXJKU05oampOcElackRraEVNT2x2bVdvR0x0?=
 =?utf-8?B?Y0VleVltNzc1V0lUT0duZitPcXNIbFVyc05nWnZNVWY4MzZRYmUzRVhoUHpl?=
 =?utf-8?B?V0YvZjZpYVQrNUJoNW40MythZ2JGcG16Q3hOeXVVQk1vTWllYkdveUUraEd2?=
 =?utf-8?Q?pYWAXas6IdoXPfzU=3D?=
X-Exchange-RoutingPolicyChecked: bTPsnRc8ZuR0zr5C2oY0S9TSdsZEGquOf2xOgkYWtsxDNxkZx/zoDH4cpz+PWqxSyelWVZb/OuZjC5HkNymL38Z8VrprqySzt+RhXZpCGggszfZBnwyDZoEMf6zD+EvCCssmrfSU2EZ39g1Z8AVO9HuDePyYDb0NbqKmKdLM7pPAiw64bzPNjyZ8F+5jPzja6dKYOaAMMWQQTOtevBOacIRccCMsL/Pkqu6frz2DJn5UyCTXAbaq7iIfOUxWoCgXb2eH7cTFd9YTdrEQIGUkJ8OmKh3ijYthGmCRTE9eNB/jdVujdyj4hIs/YJM8d8lN1JfAblFMAWoB72h7BPUEhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89303033-b566-4751-dfdd-08df0a08c36d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 22:14:46.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGGLuJ3hC5xLPSUcsC89xnZocKyzTJXHRXu1/7qYpSh1B/y3sQJJkMrpB/m3SxcioiQ/mIEQWgKXEfokGWDvx1+A2LjnJlr1lBZslIOzpCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com

On Thu, Aug 13, 2026 at 04:29:11PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Out-of-bounds Read in VBT VSPEO parsing
> - [High] Data Race when writing to shared devdata->entries array
> - [High] Missing VBT block causes ZERO_SIZE_PTR allocation and out-of-bounds read
> - [Medium] Contradiction of Intent: VBT override bypass for non-DP outputs
> - [Medium] Memory leak of devdata->entries
> --
> 
> --- Patch [6]: [PATCH v11 6/8] drm/i915: override Snps's VS/PE when requested ---
> commit 70006d8778b43948ec0e561395199a65420366c2
> Author: Michał Grzelak <michal.grzelak@intel.com>
> Date:   Thu Aug 13 16:09:16 2026 +0000
> 
>     drm/i915: override Snps's VS/PE when requested
>     
>     This commit adds accessor functions to read requested VBT tables for
>     Synopsys PHYs and transform the data for the port's buffer. It chooses
>     the appropriate accessor based on display version and PHY type (C10/C20)
>     and handles table indexing based on link rates.
> 
> > For C10, 1st table is used for external DP with modes below HBR2
> > (exclusive). 1st table is also used as a fallback for non-DPs. 2nd
> > table is used for external DP with modes higher than HBR2 (inclusive).
> 
> [Severity: Medium]
> Is this description accurate?
> 
> The commit message states the 1st table is used as a fallback for non-DPs, but
> looking at validate_vspeo() and intel_bios_get_c10_vspeo(), the code returns
> false/NULL if has_dp is false. This completely aborts the VBT override path
> for non-DP outputs rather than falling back to the 1st table.
> 
> Could the commit message be more precise, or should the code be adjusted to
> allow this fallback?

Yes, commit message is outdated.

> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> > index a491b85006117..56b4aacff7763 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bios.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> [ ... ]
> > @@ -3881,6 +3881,99 @@ bool intel_bios_encoder_supports_tbt(const struct intel_bios_encoder_data *devda
> >  	return devdata->display->vbt.version >= 209 && devdata->child.tbt;
> >  }
> >  
> > +static bool
> > +validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
> > +{
> > +	struct intel_ddi_buf_trans *vspeo;
> > +
> > +	vspeo = devdata->vspeo;
> > +	if (!vspeo)
> > +		return false;
> > +
> > +	if (!has_dp)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +const struct intel_ddi_buf_trans *
> > +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
> > +			 bool has_dp, bool is_uhbr)
> > +{
> > +	struct intel_display *display = devdata->display;
> > +	union intel_ddi_buf_trans_entry *entries = devdata->entries;
> > +	struct intel_ddi_buf_trans *vspeo = devdata->vspeo;
> > +	const u32 *tables = display->vbt.vspeo.tables;
> > +	int num_columns = display->vbt.vspeo.num_columns;
> > +	int num_rows = display->vbt.vspeo.num_rows;
> > +	int idx = is_uhbr ? 5 : 4;
> > +	size_t offset = 0;
> > +	int level;
> > +
> > +	if (!validate_vspeo(devdata, has_dp))
> > +		return NULL;
> > +
> > +	offset += idx * num_rows * num_columns;
> > +
> > +	for (level = 0; level < num_rows; level++) {
> > +		u32 vswing = tables[offset];
> > +		u32 pre_cursor = tables[offset + 1];
> > +		u32 post_cursor = tables[offset + 2];
> 
> [Severity: High]
> Does this code adequately protect against out-of-bounds memory reads from the
> VBT tables array?
> 
> There is no validation that the chosen idx (which can be up to 5) is less
> than display->vbt.vspeo.num_tables, or that num_columns is at least 3. If a
> malformed or older VBT provides fewer tables or columns, could the driver
> read past the end of the VBT block here?
> 
> > +
> > +		entries[level].snps.vswing = vswing;
> > +		entries[level].snps.pre_cursor = pre_cursor;
> > +		entries[level].snps.post_cursor = post_cursor;
> 
> [Severity: High]
> Can writing to the shared devdata->entries array inside this getter function
> cause a data race?
> 
> This getter is called during PHY programming and link training (e.g., from
> commit_tail and intel_dp_link_check). If the asynchronous modeset worker and
> hotplug link retraining worker run concurrently, wouldn't they race to
> overwrite the exact same devdata->entries array without synchronization,
> potentially leading to the hardware being programmed with corrupted values?
> 
> > +
> > +		offset += num_columns;
> > +	}
> > +
> > +	vspeo->entries = entries;
> > +	vspeo->num_entries = num_rows;
> > +
> > +	return vspeo;
> > +}
> > +
> > +const struct intel_ddi_buf_trans *
> > +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
> > +			 bool has_dp, int port_clock, bool has_edp)
> > +{
> > +	struct intel_display *display = devdata->display;
> > +	union intel_ddi_buf_trans_entry *entries = devdata->entries;
> > +	struct intel_ddi_buf_trans *vspeo = devdata->vspeo;
> > +	const u32 *tables = display->vbt.vspeo.tables;
> > +	int num_columns = display->vbt.vspeo.num_columns;
> > +	int num_rows = display->vbt.vspeo.num_rows;
> > +	size_t offset = 0;
> > +	int level, idx;
> > +
> > +	if (!validate_vspeo(devdata, has_dp))
> > +		return NULL;
> > +
> > +	if (has_edp)
> > +		idx = port_clock > 540000 ? 3 : 2;
> > +	else
> > +		idx = port_clock > 270000 ? 1 : 0;
> > +
> > +	offset += idx * num_rows * num_columns;
> > +
> > +	for (level = 0; level < num_rows; level++) {
> > +		u32 vswing = tables[offset];
> > +		u32 pre_cursor = tables[offset + 1];
> > +		u32 post_cursor = tables[offset + 2];
> 
> [Severity: High]
> Is it possible to read past the end of the VBT block here?
> 
> Similar to the C20 function, there appears to be no validation that idx is
> less than display->vbt.vspeo.num_tables or that num_columns is at least 3,
> which might lead to out-of-bounds reads if the VBT is older or malformed.
> 
> > +
> > +		entries[level].snps.vswing = vswing;
> > +		entries[level].snps.pre_cursor = pre_cursor;
> > +		entries[level].snps.post_cursor = post_cursor;
> 
> [Severity: High]
> Does overwriting the shared devdata->entries array here introduce a race
> condition when accessed concurrently?
> 
> If concurrent accesses occur, such as a hotplug event while a modeset is
> active, they might race to write to this shared state without locking, leading
> to corrupt PHY programming.
> 
> > +
> > +		offset += num_columns;
> > +	}
> > +
> > +	vspeo->entries = entries;
> > +	vspeo->num_entries = num_rows;
> > +
> > +	return vspeo;
> > +}
> 
> 
> [Severity: High]
> Could a missing VBT block lead to a ZERO_SIZE_PTR allocation and subsequent
> out-of-bounds read?
> 
> If a system's VBT version is >= 218 and use_vbt_vswing is true, but VBT block
> 57 is omitted, parse_vswing_preemph_override() returns early leaving num_rows
> as 0.
> 
> This would lead to allocating with size 0:
> 
> allocate_vswing_preemph_override() {
>     ...
> 	entries = kzalloc_objs(*entries, num_rows);
> 	if (!entries) {
>     ...
> }
> 
> Because kzalloc_objs returns ZERO_SIZE_PTR for size 0, the !entries check
> passes. When intel_ddi_buf_trans_get() returns this table with num_entries = 0,
> the bounds check in intel_ddi_level() behaves incorrectly:
> 
> intel_ddi_level() {
>     ...
> 	if (drm_WARN_ON_ONCE(display->drm, level >= n_entries))
> 		level = n_entries - 1;
>     ...
> }
> 
> This sets level to -1, and the PHY code then reads from trans->entries[-1],
> which is an invalid memory address (ZERO_SIZE_PTR - sizeof(entry)), potentially
> causing a kernel panic.
> 
> 
> [Severity: Medium]
> Will this sequence leak the devdata->entries memory on driver removal?
> 
> In allocate_vswing_preemph_override(), memory is allocated and assigned to
> devdata->entries, but devdata->vspeo->entries remains NULL until one of the
> accessor functions (like intel_bios_get_c20_vspeo) is called.
> 
> If a port is never used and the accessor is never invoked, the teardown path
> frees the wrong pointer:
> 
> intel_bios_driver_remove() {
>     ...
> 		if (devdata->vspeo)
> 			kfree(devdata->vspeo->entries);
>     ...
> }
> 
> Because devdata->vspeo->entries is still NULL in the unused case, the
> underlying devdata->entries allocation appears to be permanently leaked.

Duplicate of memory leak from PATCH 4/8.

BR,
Michał

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813160918.918857-1-michal.grzelak@intel.com?part=6
