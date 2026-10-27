Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793127732;
	b=JojUdQLcbX9Uk8SkZHjtLsguI29ncsy1gGisXDyQe2N321vfh2CVsmtUN/0GAnlc20yL
	 QOH5emiokZjgH5L20mHmIGHGYg07Q1Ia3di4UjMgGyGNFOlCQTo+Upn9vsnfVlRRMaYvk
	 AuOZlO2lD2GITqJB+epFqNw0H/txAPyL3z6aF00168m+5TSLiaZlrO939jas5fXBKAuhy
	 myDG+OHb//3I4trmVG10jU/7QCaDRwXSwnX4rHcAnPl6dyQa1KqEYQAvgOaLnny8T1E4T
	 fCiUAw1K2vcEAs21aqSoWvyjuJWJz1gTsxTeS971vBcLdfSOBdJvoBwZ99Ci4oXPRCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127732;
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
	bh=e3/Wpx4DOChmA9KaVPnZH3JZizIDsyX/7L9pMOulcCg=;
	b=QBT73btmGeihWjXaKPnfMbDp42a151DMk+YR71LX+lQfxQCZ0IpVQ5TF+lBwKoErghK9
	 hnKccbxqceoekprf1p/1pHWZ1o3yAG8iuXy2JoDdVwdFF7Yq/gIsKPERwyvVv7n7H/LL7
	 834sCW2j9zREabfK5cCR0PUgJa0HodfyP1fl6jqQZ5aamggxWc+LSSiqHMXK49WZKIHEs
	 aQaRmIDn4jJPPbyxAdxrOYk97DY71wyRtZMDbmCW1kkEdGVXQjar3x0VQd3VLihB0l6ly
	 0XUyA4ihiDkbmeknZTC+DJ7PIxb7iNG0MiL8GuGCf+H+vZ8GpkCMq7757hqUI12/ZOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nf8du6o3;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFD606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nf8du6o3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793127730; x=1824663730;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GQtpUIyfxF4cdDnpoXt9OJnp9sYfmSGqZJY5llRF6Lk=;
  b=nf8du6o3GD/YIPsTiSJ0hVb8bmEptElZ2hEnFU6MXFpT8/dLsKaRtkxg
   YaE7bRODUUHN/5tNXClnj2awmbMpwLfDOc9pKvlO3ZzEc3x0SAWDYMp4b
   FFxcJn9EZFg5IPFMP+tL7JGXnA2SyNeoGQkMFZWfKSeaKy9eXKbpKQpUk
   iZO9qEftlIeJ4xu9in5Pw3RZnKU6iG9F8EkGTXyIJqBnvCripoWaHwh/T
   AFJNX2thuiHCKrUHVpoLTv0esKcLY3ftzbQHXo240Oje8jYoK5mOVaj2M
   PCJPxwFwUGyqwb0xdMZ9yD5Hp1knjJPwEvMLdDrkq5H27WSgzrScs2Nam
   A==;
X-CSE-ConnectionGUID: l9TqKz7CQxaeU1ZBjdLBxw==
X-CSE-MsgGUID: CUV+eb1FQLWNAzYtpnUAFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1733334"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1733334"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:01:40 -0700
X-CSE-ConnectionGUID: wcTSpST9Q76julGpjuTtcg==
X-CSE-MsgGUID: J2Px0Uu1RiuHXOngETQEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4722809"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:01:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:01:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:01:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJmPEvuKYKs8689buLlJfgWFTpC1ODnIEU7mYZtM0eExRiJmKb9glX/62tsonw4+K/W/Ve9bpo72qa4rv0FHN3LWFM7lo03b/J4jbK/mErsoRfMHjVSs5155q1ubZWRL/A3WsudOkTKtvQLB8lgQOIvR3EKbWDgi6YPo40hIA9VX7ERhM7wF5OsQaNWhFPXj0+FNU+rUKjE9CkxSTcS7Ekn8sJkSpX4+UbMnVbfOFoi3Eu6/NxBc/ldglWBbyCOzIKoh551E2uVmmqboxf8/AqCfo+78Fm5eq798o8cqbi2NHa3HebSju//RixKQraeK55aFVhrI0Yk0DXxA4kb3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB/pZ7OywTQ/zlUXtdjLffwHRgJXj0A5Ct9WydnPm2A=;
 b=nO2t2UJuoCIIMloGK0PFEgGK0VLT6a5KlOUaLAcmpeJm+Ekg1tv/SML7+GdMMlgAYkuva4sOtEf7ozKAVDZTCmVMv2dlZA3riUJmfyoj6K//ZuPUjlI+kJW+VpkiUh6kXugmWrIEXf211TafhS8nQQ++EIgITjyqBsSmumuyswoR36F39Zjmys6NZELiqAvalZMDEvFTJqrRLReb0EcXQ3JzEGVP73n9tzPsqB9Ob0L5SuY5IZDwJC7w/KxfPeoVzixJgPZNaZVBlC7K10ZN603SSndAhliucwAQBu7RX5HBKwhJEV6J8s+SOvb7t7UbZDXEfPzquxJuZrZLyCSc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:01:35 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:01:34 +0000
Date: Tue, 27 Oct 2026 12:01:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/5] drm/xe: Leave the VM bulk move on BO release, not
 on GEM close
Message-ID: <auD1DQSSOgXvtLgE@gsse-cloud1.jf.intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-4-matthew.brost@intel.com>
 <sashiko-outbox-187039@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-187039@kernel.org>
X-ClientProxiedBy: MW3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:303:2b::32) To CO1PR11MB4787.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH0PR11MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: d08b0a8a-51ff-433f-3555-08df345cb889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|18002099003|22082099003|261026121527099003|11063799006|56012099006|4143699003|261009221227099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Znnp69WnkZw3giRsFW2NjCGlcI5qkX8qGONoGIOxhR5b2fAX1yWTAVPHcedEHBJPGoW5kYjhnNAOB/lgxIEgrOmtpP4JBbo2i50JiyrJXxechwMaDJabKrDqiGIHGXkPFvSA9qjvvKs1iBsXGcDDsJuWZLA6plOWsnnsM6DycwCpFx4viZ7ulKpJxtxGc7TgQs9AU0M7my1yW0LIz/f+HiOj/+DdGmGJiXlfztJxHFmhUP7PPC3mQfYik7u8SWPv7+Yr68zK6YvjZQrtA++GEqdxQl90o26aW60Vc+PzhRZVd9adQvX6JpOWqjNgbzFqKZ2WxeKWGTbM7Kc0Bil/uCd5uzPA+UJu7lLYqOSK+/PURMfqLNmLgH7/iGIy5v8aOgi0VD+ieW6dIyjrKTCtoJcmO2clUVaQ78T+B5fegzdt6Ugs+kLVIy14/ieVwj3HBB0QzEikchh1c6AOMFINs2gWyIXxcQmk+xIg9/4X8sSY8pTklZvPlkVAD9TyuWfwubKEPj29jpUMZ99ibfVxmjuavUemdyr0xfqGxZuZXSjQsZKHvzwwwACCMteOudPMhmQ9RkM5kuY2ivmcMM718vwjBQ6kA7c9xBqxdCIRAfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(261026121527099003)(11063799006)(56012099006)(4143699003)(261009221227099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DWFxeR5cFe5Dt7TXV0XTPLb6Ay8cRgAiHsxMONQPmtvcCYcWxVFj2uYi5z?=
 =?iso-8859-1?Q?t1l41bPlLH6+JXnTaN6sSTofkqzEof0FNYLTs678NGzpav99GUBtaonPvy?=
 =?iso-8859-1?Q?R8SfOGpD0RBINovrswuEeuFfVln6OJeKbz3dRqQ2f09dxAF4Fkp5pMAJen?=
 =?iso-8859-1?Q?cgZuLfPKBV8P493ADAR7303wtbibpm+7vpqE2h1xXN8ODhZZLUnFWGrmhH?=
 =?iso-8859-1?Q?+Gyyzxy4Cmc19Prk4irM0uCB41uxGp1yJC6EojvzTmU4Bkw11MAdEyWYK+?=
 =?iso-8859-1?Q?S066w9sgtb5sVqlFwLrzI3MxzhRYbs0bIw82Csi7lPD0/L8yREdx0jcz+p?=
 =?iso-8859-1?Q?u5tZj5HYZmkZbfLjMsmMPC1idu6x+1L+mRfjm698yNS7IjHVIJ/Ez0k5Rh?=
 =?iso-8859-1?Q?ZBYOp84CHE8fIMiQAzXjfzCUuIN/xQSC6poX8g+YIGuQOQDThEvciDyaB1?=
 =?iso-8859-1?Q?T5KZRQa3E24y0gjlnWagBZjX0fm4NA7G4cKoNPmoipQPFYWJv+3/ZxP+Mg?=
 =?iso-8859-1?Q?u+LpirhaNoFnlvjdLp4dbsUozssI0NpzpjpDgloMnppJAreA0vLktRI6tB?=
 =?iso-8859-1?Q?YZhuvNWHVWhRVJvcrQ56czJJ4WEhX467/V2l9xX+9rmfHkAtZK/vF3OA5r?=
 =?iso-8859-1?Q?p5lhNQVHzBsFlDzqZ21JCAH1td6mSHyD2hRzJziCjOD15Abyfw+x768Pzi?=
 =?iso-8859-1?Q?qWnwIGLUHl0yiZgsFy+UxkCPJnGKhjgnM9Q9CcJU6PwKFsQyAq9gDs8uLN?=
 =?iso-8859-1?Q?hglrGww6F0+5GoX78nCdKCsFbfkNUNjGC5lbRXyT4cQwar5IJwjKugMhc6?=
 =?iso-8859-1?Q?MndiwAjtb8dP9JzOeabK6zbFLWhi8HFwoG6YPELhBQx5wA5qcGmnED8cZp?=
 =?iso-8859-1?Q?gqjWx+lTucUZrbF4MFKHNwpkaoTjVTBpJhNuJnaWTFWDQ/hZMK8tUM/+xd?=
 =?iso-8859-1?Q?nhQZ9KZBmp9CaRC73ZR2nb/tx+TYsYlC582iGKbDFaRVgyWd0gR2Gs3Ify?=
 =?iso-8859-1?Q?pjEWtmC1cpyuH3woKda7APGF0Kw2U5VUxCET4+sY2dtdpJiIYW0+eTsLlY?=
 =?iso-8859-1?Q?/MUNkV5LMI05lOgm3wF4H59ZjDd03FIsVMuNTJbOPua1HIDkfSjWuJE2rb?=
 =?iso-8859-1?Q?D5nk0VMwyeQuzj83jSnzeExaf5O8s0RzeloNowUBn2zoyNIfXXWJ/ItERC?=
 =?iso-8859-1?Q?1diHjObtunil/BOnZiJgYl5fMtxEAYwNIFul4/LWJpJhmsqNAfELp//3TB?=
 =?iso-8859-1?Q?S4/jDObXF3SCmu9r7xIEqbYJJGez9MU+wpbFUdjhMB79oRn3HRUmtKTzww?=
 =?iso-8859-1?Q?jZyG0ZnLynUWOLZIc/M0SsGNW+o8twbqS2flIsN97BiKQnjfzMO/ZXUUI+?=
 =?iso-8859-1?Q?xRuwTdD3uyqQwWw0Kcmd0+NL3xq7yJVWEksSgc3C4jC+LiMCRChrhbIj7h?=
 =?iso-8859-1?Q?of0kW1Yk1uIsJqobtUTVh4G7lyyqJZzD/Kf8MH5kepjYNRQOgaS3D/nHhe?=
 =?iso-8859-1?Q?X4mu/l+Qzd4lLXRjymY+kSkH0ebk/foilYiYmr2tQXQ3BXw+2moSqyhUkk?=
 =?iso-8859-1?Q?TPnJI8vNihuPfX/2n64GPM2jDNB40goP5wTHQx1bVWSnvGjI+AEtsj4P9Y?=
 =?iso-8859-1?Q?qDuhPaaGlgxZI7EfuyqlVoDJWTvTwGlzBC0GV07AYdX9ytxbEcShPev9Q/?=
 =?iso-8859-1?Q?r1ps3E49JtPkDFuXKcA81YfverQHMy0wHsHQzsuNB8cHVSmDFVrOePYYcT?=
 =?iso-8859-1?Q?HVVhRrLCOR6UAClA6cjDVDOqAMyiSb5Llx4kEdq1AdXI720O6yf6n/wz3M?=
 =?iso-8859-1?Q?CqEQCXQOCDxjfmwD4Fo05PX2aeb8Ohc=3D?=
X-Exchange-RoutingPolicyChecked: u8n24NA98673teAs/wzch7NZVYYMXufewVyyfQWO9JanXiIdUX9DClwit9gSX0jPOefE7DIyu2VXg2L+jz4zafSDicnFVndAF6keWyXjwUwUuvbjhZDP2ciflp+1HOLK8U89d0GLr+vu3HXpdx1jqC75ki2KojIG/j8bAz+OncnVg2zBv9uIB/VDq0HLRs1JXcuwSCac3QLYs1cEihPSzQgNvciz0+cMGtvBkk0r6IbHNvrd1CoRXhiD1zZK39PEvGD7WLVuDFf3tmQ1og/cuLy0qcM8u/Hl1ofZeHRvIHhAc+t5/QKHRqKDZ5nKWZREc3kY5lTOUufe2h8gMZD92g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d08b0a8a-51ff-433f-3555-08df345cb889
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:01:34.9290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YD6vthgwSKjTVvCFY1L9jMiMvsIvRgGWvwANNAMPNI28kTcQ1V03jyY9pXMcS6rL/g+4WZg218g2nrB70j3YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
X-OriginatorOrg: intel.com

On Tue, Oct 27, 2026 at 06:47:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: bulk_move detach in xe_ttm_bo_release_notify() violates TTM invariants
> --
> 
> commit 5d85520c1e2e507cc032c4248bd48c50a734e710
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Leave the VM bulk move on BO release, not on GEM close
> 
> This commit removes xe_gem_object_close() and moves the detachment of a
> VM-private BO from its VM's LRU bulk move into xe_ttm_bo_release_notify()
> so that BOs outliving their GEM handles remain part of the VM bulk move
> until release.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 42a6aa1a2e4a0..ba16b260dbcb7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1869,6 +1869,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >  	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> >  		return;
> >  
> > +	/*
> > +	 * Leave the VM's bulk move, which is only kept alive by the VM, and
> > +	 * whose LRU position no longer says anything about a BO on its way
> > +	 * out.
> > +	 */
> > +	if (ttm_bo->bulk_move)
> > +		ttm_bo_set_bulk_move(ttm_bo, NULL);
> 
> [Severity: High]

Ugh, this is correct - this patch doesn't work but the code prior to
this patch is also incorrect.

I'm not immediately spoting an obvisous solution, so I will just drop
this patch for now.

Matt

> Does detaching from bulk_move in xe_ttm_bo_release_notify() happen too late
> in the TTM teardown sequence?
> 
> When the final reference to a VM-private user BO on a non-fault-mode VM is
> dropped via xe_gem_object_free() -> ttm_bo_fini() -> ttm_bo_put() ->
> ttm_bo_release(), ttm_bo_release() checks bo->bulk_move and individualizes
> bo->base.resv before invoking bdev->funcs->release_notify():
> 
> drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_release() {
>     ...
> 	WARN_ON_ONCE(bo->pin_count);
> 	WARN_ON_ONCE(bo->bulk_move);
> 
> 	if (!bo->deleted) {
> 		ret = ttm_bo_individualize_resv(bo);
> 		if (ret) {
> 			/* Last resort, if we fail to allocate memory for the
> 			 * fences block for the BO to become idle
> 			 */
> 			dma_resv_wait_timeout(bo->base.resv,
> 					      DMA_RESV_USAGE_BOOKKEEP, false,
> 					      30 * HZ);
> 		}
> 
> 		if (bdev->funcs->release_notify)
> 			bdev->funcs->release_notify(bo);
>     ...
> }
> 
> Because bo->bulk_move is still set upon entering ttm_bo_release(), releasing
> such a BO will immediately trigger WARN_ON_ONCE(bo->bulk_move).
> 
> In addition, ttm_bo_individualize_resv() switches bo->base.resv away from
> xe_vm_resv(vm) to &bo->base._resv under bo->bdev->lru_lock and then drops
> lru_lock while the BO's resource is still linked in vm->lru_bulk_move:
> 
> drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_individualize_resv() {
>     ...
> 		spin_lock(&bo->bdev->lru_lock);
> 		bo->base.resv = &bo->base._resv;
> 		spin_unlock(&bo->bdev->lru_lock);
>     ...
> }
> 
> In the window between ttm_bo_individualize_resv() and
> ttm_bo_set_bulk_move(ttm_bo, NULL) in xe_ttm_bo_release_notify(), another
> thread holding xe_vm_resv(vm) can access vm->lru_bulk_move while the dying
> BO is still pos->first or pos->last:
> 
> - Calling xe_vm_bump_lru() -> ttm_lru_bulk_move_tail() will fail
>   dma_resv_assert_held(pos->first->bo->base.resv) or
>   dma_resv_assert_held(pos->last->bo->base.resv) in
>   drivers/gpu/drm/ttm/ttm_resource.c:
> 
> drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_tail() {
>     ...
> 			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
> 			dma_resv_assert_held(pos->first->bo->base.resv);
> 			dma_resv_assert_held(pos->last->bo->base.resv);
>     ...
> }
> 
> - Adding or moving another resource in the same bucket via
>   ttm_resource_add_bulk_move() -> ttm_lru_bulk_move_add() will trigger
>   WARN_ON(pos->first->bo->base.resv != res->bo->base.resv):
> 
> drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_add() {
>     ...
> 	} else {
> 		WARN_ON(pos->first->bo->base.resv != res->bo->base.resv);
> 		ttm_lru_bulk_move_pos_tail(pos, res);
> 	}
> }
> 
> Conversely, if ttm_bo_individualize_resv() fails (for example, if
> dma_resv_copy_fences() returns -ENOMEM), bo->base.resv remains
> xe_vm_resv(vm), while xe_ttm_bo_lock_in_destructor() only trylocks
> &ttm_bo->base._resv. Calling ttm_bo_set_bulk_move(ttm_bo, NULL) in
> xe_ttm_bo_release_notify() will then fail dma_resv_assert_held(bo->base.resv)
> in ttm_bo_set_bulk_move() and ttm_resource_is_swapped(), and mutate
> vm->lru_bulk_move without holding xe_vm_resv(vm).
> 
> Should bulk_move be cleared before ttm_bo_release() runs (or before
> ttm_bo_individualize_resv() detaches bo->base.resv from the VM reservation
> object) while holding the VM reservation lock?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027183638.1031299-1-matthew.brost@intel.com?part=3
