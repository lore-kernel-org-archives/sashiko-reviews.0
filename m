Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1D4E06EB
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648273; cv=fail; b=hZYRlTDc6sgGB06fBra8MvUUcaoyhlnGn6z8u3oPsXb4whYsbeXA1l0Vj69WNzM6HGSUS6datXbd+vMBDpu840aRJWX61MdlwyTNbZ6eIUrzphbH8jOLtfaf34MjGrf/1+kIMMUQlM2dX4RWlQ59BPMbrovMh4Wqnxa5al2R8Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648273; c=relaxed/simple;
	bh=3JhO2y21WtuVPS/1LnRLZSb+bOZECAr1qPHjENVQFjA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YycJabbNB2a9P/yGx6EHRByhaJJmEc8QVM8kDNy7esmR+mhGA6s6liXxKG5yGosekMhG1V+sLu8k5Ry3WBuX2i4LL5DgEcfz0s9sje4gu6WF8Vld182bj8EgJ/Hk/4X0H+TUoczF4sTz9eGbzDgbgPM6dTziqaAmDBq00/5Mw3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIEyLB/d; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIEyLB/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789648262; x=1821184262;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3JhO2y21WtuVPS/1LnRLZSb+bOZECAr1qPHjENVQFjA=;
  b=lIEyLB/d4kJYvzUM1O8CzQtmEvMzmnIXGuVcRh3XwD/iVDgi3x3OOcje
   b0m6mA29eazw1DPsu6NdBbQ0YX5HjSWefg6FeYzIV2RthFQY87DSDATxu
   i9ZeedEZcfX8oKnVrvlhz5+QA/91Wpdk48cM15EpSNLXEoWhx1TeId7Ag
   HelnAkD6+YkB2y6Gqd/oc3ryt44iP8VwoZXw3El6DTRkgCYRqvmGSWNWc
   HWFzYvl1ggLHHA/LZJTfcuSTKsx7frQCKnVQpo7dTQ+4ee66tzpTXEjZf
   dseVJHw10jp2kyykr6R2pr5UGdbUFfTXGb/gcA/g4pyu2ckThJUwCrfYG
   Q==;
X-CSE-ConnectionGUID: 8W17TuGvRbCRydZMCMOUfw==
X-CSE-MsgGUID: hHg7+rkpRHOH9n7E0AR27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107570501"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107570501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:30:39 -0700
X-CSE-ConnectionGUID: HjYP8v1ARI+PAHJC/JdQlw==
X-CSE-MsgGUID: YdXoIGjmQEaKl5mfNmegOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270452982"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:30:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 05:30:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 05:30:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 05:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EINtFnkCAlGjyyx1vJR3UvW+umbD7MyhNU3xBViG4JCloPHlbHhG8zF8TJ3OfeEr7wzhaeYwNwitLnLNXk1XP9VQrBb7TWTFEismF+XnorZnp1X5wIonp95TMDtpnoAqUviaA4pcSFVMFSNVI/ZtYvb3AdQMvXUd7B+jroct8N24UKQOB/AKTMkTvBBP2mI4NdtoKVuH+hEqAPiPl36g8oL+HvN2llXjZYsVAS6p3t9BcRyZv0LoSAnK39cX3/CQ0sZ6CMRn8gk8NtlxLFGP/+zI7UN1yp9uCXAP3S5fJ+PQwIahaLqE33FhVuOMRoJVKDpKhgVmWHE4ZLMCy02Hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JhO2y21WtuVPS/1LnRLZSb+bOZECAr1qPHjENVQFjA=;
 b=JuyjReDVlu8d+CvKrGM/CsYk2yYR27M46wFQN8o8ISmkrpG/KsZzg5nZHvW3LcUif+QkLfHifr5tCj0mbuUumf4YUYxuKLp/cizX+WtrqxocfNUa8V0dpkpQHoajXVGv1VuYOD6VRxpQaUqkQRpKqD71mSQuy7xDjx9htWqIzP3fBg/0QnGTGCL2KM+MWij0bRHVFZuwRUe6w40nfVClFzUYdjqtctYx6R49+ih8dT+4mLjk/dXwssvBJ3HC/xk+vQkbKsKNw/3fWewujt3+pSDjpytt8aCWh/uTtvXaDKaNQA1IhlqzTFLd87ZDLLRGJFv0n2fkQQoyyBT9nJI5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by EAYPR11MB9564.namprd11.prod.outlook.com
 (2603:10b6:303:2c1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 12:30:34 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 12:30:34 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v9 17/20] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v9 17/20] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdRhkJkdzHkazmQkeBnzIHLmv377bRp9MAgAEMLYA=
Date: Thu, 17 Sep 2026 12:30:34 +0000
Message-ID: <CH3PR11MB046149F1A39F826242EE4A9DC2C1B82@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-39-michael.j.ruhl@intel.com>
 <20260916202902.ABAA31F000FF@smtp.kernel.org>
In-Reply-To: <20260916202902.ABAA31F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|EAYPR11MB9564:EE_
x-ms-office365-filtering-correlation-id: c65e30b4-c936-4b83-8aeb-08df14b778c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: zP8m6e5leEtmqQcz/QW7QpyA2pCVZLUtuDT1oDJWZ4McJvEDGk+lyodo18hFSXyDsdjTnnX75Kf9DBiUPPJHTKVKIWhb8yV7RWd4vDZrqTdEiw/jN/pYRfFbVnzxjYfSoFbRhsvnoOl/XVyH2Uka3ImdF4Juz+plYogc6qbUN2rIjEBMeFm+XzzIHk9inwJqG68eYCZ6jjdEifM8ddx7+RWYAD99M9PW4shAyPTBf9sYX+48TLv/dQKkUU72aVlGiIEnRNxQh2uAmtpBibNcnR/kFyM6KckDS/vhXoRHHY6ck+3Q76cHgyfjIduiWROjZzfKcNAFWZFDTYYgP3xqoYR/7le/fDjjddG4dLFopg0tbHb6BvxxmsO8r0ODOm3wulwfrQIAHN/vQ5XQ4FtrHIHkqCt5um8YiU0uRXywzIUx6y2g8CYgVczalV5hLT99liT6UCKywZ8FM2do9YaBWyEBg6UK90UvmwAvPBrl11QP6mKekG5zNv83UqWzv4hkHI5cLHRG1HODhlazMPLKC/BuGVrigEj/+gDVgVkGrLAFJjsIwUkK90QqFA1EatLOCxHI46BK5xVJzKsviqbRfoYpzVzRc+hAl2FPUt+ESD77de3yigjOp20V5i4uOIJnKD1SXBVktW2fcwXEjIcOgoQ4v4rcMv+CRjhVb9tWxiw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm5tUUpwUUVJS0l2UGZKMm45Wi9kM3JPUk9iOGxpR2dhMlF1VG1iVnNLMkdl?=
 =?utf-8?B?RG1uSG5CWEFuM1piOUVpdDJ2eFZrckN0WTVqNi9GTkhKNXpDYnBkcXRYcDZw?=
 =?utf-8?B?WjNBS0hqMDd5eGYyYlRiNXVkM3U0Q0ZGc3dobjJIMWcyQ29IQ0xqUDJwN2tx?=
 =?utf-8?B?bjRSdklPeVBHK1BsRjdCRUFvQm1MTE4wYkYvOGk0emxUZnF3T1lWdnR1QmR0?=
 =?utf-8?B?TGZjSWxwUzNtMEJyT2VaODB0NzRGTEFRa2VBVjlIRHRlb0J2dXhuMHI2RVZl?=
 =?utf-8?B?T0NCc3BUR2pKVUZaVEg2ck5UUnd2OFNaQ1NoTmdwU2ZxU29yRlJGUUE1TXpl?=
 =?utf-8?B?bFJwZ3BDYURFci84THNmQjlOWVo1eUNkaVFYeXBhVTRxT2xhV1RKZnJJbExx?=
 =?utf-8?B?NGhoOFhyRzNFT295V0dhZEF3NHQrSERIZUhRUk9yNWJqckROTmJkblVHMTRH?=
 =?utf-8?B?Yktqdk8yZVlZWUtPY0ZVWnJyRUlBSmg0YVZTQ2RLd3RPYk1jZnhkVXJld1ll?=
 =?utf-8?B?S1A4dUFJSGcxbDFMblJab0FCVTQ5dWFxSkRta0tSZzU1ZUgrS1kxVHRqNDhW?=
 =?utf-8?B?OXluY3R6bVdsVXU0UDBkazFLU0FnQzZIRDV1K2kyUzJvQ0FjZnNJYXhQUWN1?=
 =?utf-8?B?S0s0MzlsOHgwNlFsRnA3MHR2MEV6eHRKSXZCd2hiMmQ2aDVjOGFSWmsxZXRa?=
 =?utf-8?B?aDcrWVNxU1hBZ2JHY0hDMnlMUHU4dGErY2g0TjIrVGY3bXJ1TmJDaVZSQ1Nm?=
 =?utf-8?B?SUJ0VHczN2NzWVBaZGExdWpTZlFERXE4NUpza3J5MWVjSlpnUEVhVnNHenB3?=
 =?utf-8?B?SVVoeFR1NFZJNjJ2a0VtZzA1dFRTQ2oxdHc1UHFhRWVuTmY5MjkvLzNxRTdn?=
 =?utf-8?B?S2FGTEhBMG9qajhtR0lSdjRBQmdsNHlqTHlFSDg3MVJSQzl6OS9rL25Sdm9L?=
 =?utf-8?B?RnFzM1BnYkYyS0tKcHBLbTdaQ2hwazB0WjVGeEVsOEFGblIwWmxhQmhLK0dH?=
 =?utf-8?B?MW8yQ0ludEtJdXpGVTBxUmxVQXVCMGhRQXdBMHZ3L0ZjZUF3Z3dINFM1bHgz?=
 =?utf-8?B?ZEttYldqK2V6bllGaHJhSHVMZmNOODJ5SSs5RWV0TmZ0eWdmY2V6NU9OWlRl?=
 =?utf-8?B?T2o5VE5hV09ZT25IcjBzWCtsb29FaTR6djVlZE5QSDdHcEdqUzl6U0VJUUpP?=
 =?utf-8?B?NW1oMG83ejl0bXJBR0x0QThZQWFOKzAyamNWdnRhQ20yNWcrS0xCZjNKVGtC?=
 =?utf-8?B?NS9JaUF4RDhUdjhEUkhmUGIxbDNXVElISWtrK0pFVk9DbVhId1Q0YTcxUlo5?=
 =?utf-8?B?clpVOEpFVnFZNHJsSXBEa1Z3WmI4WnBTc052MWpjcVgxenhvdCtJL2xmOC8y?=
 =?utf-8?B?Vk5TMHRrM0ZCbTZySk5hNFN6Snd4aStVKzNLeWZlS1JxWENCQ2lBQjVlck8w?=
 =?utf-8?B?UWRmSCtXcnVGL1VpbXJvSUpkeFFwOVBhcjNoNHVLSmtqQnljQXVvcTNCZWQz?=
 =?utf-8?B?NVlSMWUvZjdMa2hkWWFPbnVCMkhmUWFSTzhyRWQzWE1EbW80QXZJVDl6WDJs?=
 =?utf-8?B?OUdodG5KRkgzSUlEa3dGZ1pwVWZSVUo4NFMvL3YvOFBPdlNLVjZ3Q1M5dmxx?=
 =?utf-8?B?TXV5bGlxOUdFVi9xQ3RhMEhUWmRDOE9sWS93ampyaCtOdG80ZHYvQjg5bHdO?=
 =?utf-8?B?bUdBNDJoOU5yWG5yQUhvOW4xS1hmeC9DcHVsOG9uZi9yZjU5VEl3UC9VQ0FN?=
 =?utf-8?B?SXJFZFVwVGU3VXk4aDgvNHVPV2k3ckVqWk1ZWDBHb2FwUHArWENCYm5sYUhu?=
 =?utf-8?B?U2dOOWtPWGcrVldEd2dsdjlPaEtydmJ3YkpDc2pNdS92cEgwK1Jsa2YyQjE1?=
 =?utf-8?B?NU52VFNWWUdKZGF1VXJ6WktFRU4vTjBPa3FwSkt1T2p5TU1mSkd3RXlncXVZ?=
 =?utf-8?B?K0lXL200akVEQ1Z5UnRCdElHN0N2bVRtOTVmUGd0UGgveGxhc3czSVBrZTJO?=
 =?utf-8?B?YUl4SjNtTE0zc0twNmU1SmNQbklpZEttNkdRbnZhekJ2RDVmeTluWGRtNHFX?=
 =?utf-8?B?RXl5NS8zK2JKQnBlYmhNSDRrVWl6aEZyNXlLVHRuUTNBR29NVDhObHcyN2RI?=
 =?utf-8?B?ckp0YVU3K2pWM3J6RlkvTm02UURnc0R4UGNYdUhyOVd0YkdGMWJaZGRFZkdi?=
 =?utf-8?B?N09OdkwzQjJqcDlWU2NIYnJ1eU9RbWVjb2NiNTBxTzJHUHdwRlFjTzhKQm5V?=
 =?utf-8?B?VjlaTDdJZ2dGMU1hNEdwVHAwQkRWbm5mUUE1QndEUGFOUVNnL3JiWEhBMEdh?=
 =?utf-8?B?VUxDd0dpSzVxWmVYNU9TbEZSb2NVZnphUjFJZzNjM0FicVJNSFBiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CQ+huU9KIpSAYLQ+CUDWGIUv4gDh0fJXj+DXN2x9kj50kpu96i3SJ2Yao7x1b3U7Phjr7N2BWWLnTH8tgMWAMu8QnT/JczQ3XZ7Jcx/6H/2fXHtYkP6Nccmw8m8rKRUuv73QSHgrXUfYHx2SNEYGGIhnVPg9pufLKSeWEbBO8Psq7lp/uz7A08AVMUWFTveutgACo54xBoKJVjaHdpC69AVCY+frwv3lbFmh24Qq3qrtv0sjQO1boJ9HX/gsSfydkjIpSZIHz0Qnctih96VItznepPRv/lc1KjV11TfnBdONEDlb3bB1HyG0Zg3zOFNbWCYnVGCdy2xanPNtwANcTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65e30b4-c936-4b83-8aeb-08df14b778c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 12:30:34.7606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0bntGJxJmmYPAIH34t5xXB+TDvPknwptw+xc6Uy9wh2rGVqHUn6JXyBetEP0+4+UPeN/9VzV4AuMIZYV+751rAqvzx+6AIwgrNWVcM86U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9564
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAx
NiwgMjAyNiA0OjI5IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50
ZWwuY29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBS
ZTogW1BBVENIIHY5IDE3LzIwXSBkcm0veGUvdnNlYzogU3VwcG9ydCBsYXRlIGJpbmQgZncgaW5m
b3JtYXRpb24NCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJ
IHJldmlldyBmb3VuZCA0IHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVyOg0KPi0gW0hp
Z2hdIGRldnJlczogbWVtb3J5IGxlYWsgYW5kIGRhbmdsaW5nIGRldmljZXMgZHVlIHRvIHdvcmtl
ciByYWNpbmcgd2l0aA0KPmRldnJlc19yZWxlYXNlX2FsbA0KPi0gW0hpZ2hdIHBtOiBub24tZnJl
ZXphYmxlIGRlbGF5ZWQgd29yayBhY2Nlc3NlcyBNTUlPIGR1cmluZyBzeXN0ZW0NCj5zdXNwZW5k
DQo+LSBbTWVkaXVtXSBwbTogYXN5bmNocm9ub3VzIHBtX3J1bnRpbWVfcHV0KCkgZHVyaW5nIGRl
dmljZSByZW1vdmFsDQo+Y2F1c2VzIGluY29ycmVjdCBwb3dlciBzdGF0ZQ0KPi0gW01lZGl1bV0g
cG06IHVuaW50ZXJydXB0aWJsZSBtc2xlZXAgaW4gd2FpdF9mb3JfZncoKSBibG9ja3MgdGFzayBm
cmVlemVyIGFuZA0KPnN5c3RlbSBzdXNwZW5kDQo+LS0NCj4NCj5jb21taXQgMjMxMWQxODljNTc1
NTNhZDYwOGQ2NzU3ODNjNWU2NjRhMDEwZjZlZg0KPkF1dGhvcjogTWljaGFlbCBKLiBSdWhsIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+DQo+ZHJtL3hlL3ZzZWM6IFN1cHBvcnQgbGF0ZSBi
aW5kIGZ3IGluZm9ybWF0aW9uDQo+DQo+Q1JJIEZXIGlzIGxvYWRlZCBvbiBwb3dlciBvbi4gIEJl
Y2F1c2Ugb2YgdGhpcywgYWNjZXNzIHRvIHRoZSBGVyBjYW5ub3QNCj5iZSBkb25lIHVudGlsIGl0
IGlzIHJ1bm5pbmcuDQo+DQo+VXBkYXRlIHRoZSBYRSBQTVQgcHJvYmUgYW5kIGFjY2VzcyB0byBj
aGVjayBmb3IgbGF0ZSBiaW5kIGRldmljZXMsDQo+dmVyaWZ5LCBhbmQgd2FpdCBmb3IgdGhlIGFw
cHJvcHJpYXRlIEZXIHN0YXRlIGJlZm9yZSBwcm9iZSBvciBhY2Nlc3MuDQo+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92c2VjLmMNCj4+IGluZGV4IGQxNDI3ZWM1MDcyODUuLmY5MDVlZjUxZGY2NTYgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdnNlYy5jDQo+DQo+WyAuLi4gXQ0KPg0KPj4gQEAgLTI4MSw2ICsyOTEsNDgg
QEAgc3RhdGljIGludCB4ZV9ndWlkX2RlY29kZSh1MzIgZ3VpZCwgaW50ICppbmRleCwgdTMyDQo+
Km9mZnNldCkNCj4+ICAJcmV0dXJuIC1FTk9ERVY7DQo+PiAgfQ0KPj4NCj4+ICtzdGF0aWMgdm9p
ZCBjcmlfbGF0ZV9iaW5kX3Byb2JlX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPj4g
K3sNCj4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0
IHhlX2RldmljZSwNCj5wbXQud29yay53b3JrKTsNCj4+ICsNCj4+ICsJaWYgKHhlX3N5c2N0cmxf
aXNfb29ibXNtX2Z3X3JlYWR5KHhlKSkgew0KPj4gKwkJY3JpX2xhdGVfYmluZF9wcm9iZSh4ZSk7
DQo+PiArCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArCQlyZXR1cm47DQo+PiArCX0NCj4+
ICsNCj4+ICsJeGUtPnBtdC5yZXRyeV9jb3VudCsrOw0KPj4gKw0KPj4gKwkvKiB3YWl0IHVwIHRv
IDIwIHNlY29uZHMgKi8NCj4+ICsJaWYgKHhlLT5wbXQucmV0cnlfY291bnQgPT0gVlNFQ19MQVRF
X0JJTkRfUkVUUlkpIHsNCj4+ICsJCWRybV93YXJuKCZ4ZS0+ZHJtLCAiUE1UIHByb2JlOiBMYXRl
IEJpbmRpbmcgZmFpbGVkIHRvDQo+Y29tcGxldGVcbiIpOw0KPj4gKwkJeGVfcG1fcnVudGltZV9w
dXQoeGUpOw0KPj4gKwkJcmV0dXJuOw0KPj4gKwl9DQo+PiArDQo+PiArCWlmICghc2NoZWR1bGVf
ZGVsYXllZF93b3JrKCZ4ZS0+cG10LndvcmssDQo+bXNlY3NfdG9famlmZmllcyhWU0VDX0xBVEVf
QklORF9ERUxBWV9NU0VDKSkpDQo+PiArCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArfQ0K
Pg0KPltTZXZlcml0eTogSGlnaF0NCj5Eb2VzIHNjaGVkdWxpbmcgdGhpcyBkZWxheWVkIHdvcmsg
b24gdGhlIGRlZmF1bHQgbm9uLWZyZWV6YWJsZSB3b3JrcXVldWUgcmlzaw0KPk1NSU8gYWNjZXNz
IGR1cmluZyBzeXN0ZW0gc3VzcGVuZD8NCg0KcnVudGltZV9nZXQgaXMgaGVsZCB1bnRpbCB0aGlz
IGNvbXBsZXRlcy4gIHRoZSBzeXN0ZW0gY2Fubm90IGdvIHRvIHN1c3BlbmQuDQoNCm0NCg0KPklm
IHRoZSBzeXN0ZW0gZW50ZXJzIHN1c3BlbmQgKFMzKSB3aGlsZSB0aGUgd29ya2VyIGlzIGluIGl0
cyBwb2xsaW5nIGxvb3AsDQo+dGhlIFBDSSBkZXZpY2UgaXMgcHV0IGludG8gdGhlIEQzIHN0YXRl
LiBCZWNhdXNlIHRoZSB3b3JrZXIgaXMgb24gYQ0KPm5vbi1mcmVlemFibGUgd29ya3F1ZXVlLCBp
dCBjb250aW51ZXMgcnVubmluZyBhbmQgY2FsbHMNCj54ZV9zeXNjdHJsX2lzX29vYm1zbV9md19y
ZWFkeSgpLCB3aGljaCBwZXJmb3JtcyBNTUlPIHJlYWRzIG9uIHBvd2VyZWQtDQo+ZG93bg0KPmhh
cmR3YXJlLg0KPg0KPj4gKw0KPj4gK3N0YXRpYyBib29sIHdhaXRfZm9yX2Z3KHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKQ0KPj4gK3sNCj4+ICsJaW50IHJldHJpZXMgPSBWU0VDX0xBVEVfQklORF9SRVRS
WTsgIC8qIHdhaXQgdXAgdG8gMjAgc2VjcyAqLw0KPj4gKw0KPj4gKwlpZiAoeGUtPmluZm8ucGxh
dGZvcm0gIT0gWEVfQ1JFU0NFTlRJU0xBTkQpDQo+PiArCQlyZXR1cm4gdHJ1ZTsNCj4+ICsNCj4+
ICsJd2hpbGUgKHJldHJpZXMtLSkgew0KPj4gKwkJaWYgKHhlX3N5c2N0cmxfaXNfb29ibXNtX2Z3
X3JlYWR5KHhlKSkNCj4+ICsJCQlyZXR1cm4gdHJ1ZTsNCj4+ICsNCj4+ICsJCW1zbGVlcChWU0VD
X0xBVEVfQklORF9ERUxBWV9NU0VDKTsNCj4+ICsJfQ0KPg0KPltTZXZlcml0eTogTWVkaXVtXQ0K
PkNvdWxkIHRoaXMgdW5pbnRlcnJ1cHRpYmxlIHNsZWVwIGRlbGF5IHRhc2sgZnJlZXppbmcgZm9y
IHVwIHRvIDIwIHNlY29uZHMNCj5kdXJpbmcgc3lzdGVtIHN1c3BlbmQ/DQo+DQo+SWYgdXNlcnNw
YWNlIGluaXRpYXRlcyBhIHJlYWQgb24gdGhlIFBNVCB0ZWxlbWV0cnkgc3lzZnMgZmlsZSwgY2Fs
bGluZw0KPnhlX3BtdF90ZWxlbV9yZWFkKCksIGl0IGVudGVycyB0aGlzIHdhaXRfZm9yX2Z3KCkg
bG9vcC4gSWYgYSBzeXN0ZW0gc3VzcGVuZCBpcw0KPnRyaWdnZXJlZCBjb25jdXJyZW50bHksIHRo
ZSB1bmludGVycnVwdGlibGUgbXNsZWVwKCkgbG9vcCBwcmV2ZW50cyB0aGUgdGFzaw0KPmZyb20g
aGFuZGxpbmcgdGhlIGZyZWV6ZSBzaWduYWwgYmVmb3JlIHRoZSAyMC1zZWNvbmQgZnJlZXplciB0
aW1lb3V0IGV4cGlyZXMuDQo+DQo+WyAuLi4gXQ0KPg0KPj4gQEAgLTQ3NiwxMiArNTQ0LDQ2IEBA
IHN0YXRpYyBlbnVtIHhlX3ZzZWMgZ2V0X3BsYXRmb3JtX2luZm8oc3RydWN0DQo+eGVfZGV2aWNl
ICp4ZSkNCj4+ICAJcmV0dXJuIHZzZWNfcGxhdGZvcm1zW3hlLT5pbmZvLnBsYXRmb3JtXTsNCj4+
ICB9DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIGNyaV9sYXRlX2JpbmRfcHJvYmUoc3RydWN0IHhlX2Rl
dmljZSAqeGUpDQo+PiArew0KPj4gKwlzdHJ1Y3QgaW50ZWxfdnNlY19wbGF0Zm9ybV9pbmZvICpp
bmZvOw0KPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsNCj4+ICsJZW51bSB4
ZV92c2VjIHBsYXRmb3JtOw0KPj4gKw0KPj4gKwlwbGF0Zm9ybSA9IGdldF9wbGF0Zm9ybV9pbmZv
KHhlKTsNCj4+ICsJaWYgKHBsYXRmb3JtICE9IFhFX1ZTRUNfQ1JJKQ0KPj4gKwkJcmV0dXJuOw0K
Pj4gKw0KPj4gKwlpbmZvID0gJnhlX3ZzZWNfaW5mb1twbGF0Zm9ybV07DQo+PiArCWlmICghaW5m
by0+aGVhZGVycykNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJZ3VhcmQobXV0ZXgpKCZ4ZS0+
cG10LmxvY2spOw0KPj4gKw0KPj4gKwlpbmZvLT5wcml2X2RhdGEgPSAmeGVfY3JpX3BtdF9jYjsN
Cj4+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBDUklfSURYX1RFTEVN
X0RJU0NPVkVSWSk7DQo+PiArDQo+PiArCWludGVsX3ZzZWNfcmVnaXN0ZXIoZGV2LCBpbmZvKTsN
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgdnNlY19kaXNhYmxlX2xhdGVfYmluZF93b3Jr
KHZvaWQgKmFyZykNCj4+ICt7DQo+PiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gYXJnOw0KPj4g
Kw0KPj4gKwkvKg0KPj4gKwkgKiBJZiB0aGUgcXVldWVkIHdvcmsgaXMgY2FuY2VsZWQsIHRoZSBy
dW50aW1lIHJlZmVyZW5jZSBuZWVkcyB0byBiZQ0KPj4gKwkgKiByZWxlYXNlZCBoZXJlLg0KPj4g
KwkgKi8NCj4+ICsJaWYgKGRpc2FibGVfZGVsYXllZF93b3JrX3N5bmMoJnhlLT5wbXQud29yaykp
DQo+PiArCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArfQ0KPg0KPltTZXZlcml0eTogTWVk
aXVtXQ0KPklzIGl0IHNhZmUgdG8gdXNlIGFuIGFzeW5jaHJvbm91cyBydW50aW1lIHB1dCBoZXJl
IGR1cmluZyB0aGUgZGV2aWNlIHJlbW92YWwNCj5wYXRoPw0KPg0KPldoZW4gZGV2aWNlIHJlbW92
YWwgdHJpZ2dlcnMgdGhpcyBmdW5jdGlvbiB2aWEgZGV2cmVzIGNsZWFudXAsIHRoZSBwZW5kaW5n
DQo+YXN5bmMgaWRsZS9zdXNwZW5kIHdvcmsgY2FuIGJlIGNhbmNlbGxlZCBieSBwbV9ydW50aW1l
X2Rpc2FibGUoKSwgbGVhdmluZw0KPnRoZSBoYXJkd2FyZSBpbiBhbiBhY3RpdmUgcG93ZXIgc3Rh
dGUgaW5kZWZpbml0ZWx5LiBTaG91bGQgdGhpcyBiZSBhDQo+c3luY2hyb25vdXMgcHV0ICh4ZV9w
bV9ydW50aW1lX3B1dF9zeW5jKCkpIGluc3RlYWQ/DQo+DQo+WyAuLi4gXQ0KPg0KPj4gQEAgLTQ4
OSwxMSArNTkxLDExIEBAIHZvaWQgeGVfdnNlY19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0K
PlsgLi4uIF0NCj4+ICAJY2FzZSBYRV9WU0VDX0NSSToNCj4+ICAJCXhlLT5wbXQuYmFzZV9vZmZz
ZXQgPSBDUklfUE1UX09GRlNFVDsNCj4+ICsNCj4+ICsJCXhlLT5wbXQucmV0cnlfY291bnQgPSAw
Ow0KPj4gKwkJSU5JVF9ERUxBWUVEX1dPUksoJnhlLT5wbXQud29yaywNCj5jcmlfbGF0ZV9iaW5k
X3Byb2JlX3dvcmspOw0KPj4gKw0KPj4gKwkJeGVfcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoeGUp
Ow0KPj4gKwkJaWYgKCF4ZV9zeXNjdHJsX2lzX29vYm1zbV9md19yZWFkeSh4ZSkpIHsNCj4+ICsJ
CQlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJnhlLT5wbXQud29yaywNCj4+ICsNCj5tc2Vjc190b19q
aWZmaWVzKFZTRUNfTEFURV9CSU5EX0RFTEFZX01TRUMpKTsNCj4+ICsJCQlyZXR1cm4gZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LA0KPj4gKw0KPgl2c2VjX2Rpc2FibGVfbGF0
ZV9iaW5kX3dvcmssDQo+PiArCQkJCQkJCXhlKTsNCj4+ICsJCX0NCj4+ICsNCj4NCj5bU2V2ZXJp
dHk6IEhpZ2hdDQo+Q2FuIHRoaXMgd29ya2VyIHRocmVhZCByYWNlIHdpdGggZGV2cmVzX3JlbGVh
c2VfYWxsKCkgZHVyaW5nIGRldmljZSB1bmJpbmQ/DQo+DQo+SWYgdGhlIGRyaXZlciBpcyB1bmJv
dW5kIHdoaWxlIHRoZSB3b3JrZXIgaXMgaW4gaXRzIHBvbGxpbmcgbG9vcCwNCj5kZXZyZXNfcmVs
ZWFzZV9hbGwoKSBzcGxpY2VzIHRoZSBkZXZyZXMgbGlzdCBhbmQgZXhlY3V0ZXMNCj52c2VjX2Rp
c2FibGVfbGF0ZV9iaW5kX3dvcmsoKSwgd2hpY2ggd2FpdHMgZm9yIHRoZSB3b3JrZXIgdG8gZmlu
aXNoLg0KPg0KPkhvd2V2ZXIsIHRoZSB3b3JrZXIgY2FsbHMgaW50ZWxfdnNlY19yZWdpc3Rlcigp
IGluIGNyaV9sYXRlX2JpbmRfcHJvYmUoKSwNCj53aGljaCBhZGRzIG5ldyBkZXZyZXMgaXRlbXMg
dG8gdGhlIGRldmljZS4gU2luY2UgZGV2cmVzX3JlbGVhc2VfYWxsKCkgb25seQ0KPnNwbGljZXMg
dGhlIGxpc3Qgb25jZSBiZWZvcmUgZXhlY3V0aW5nIGl0LCBhbnkgZGV2cmVzIGl0ZW1zIGFkZGVk
IGJ5IHRoZQ0KPndvcmtlciBhcmUgcGVybWFuZW50bHkgbGVha2VkLg0KPg0KPi0tDQo+U2FzaGlr
byBBSSByZXZpZXcgwrcNCj5odHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTYy
MDExMzkuMjM3NDUzMS0yMi0NCj5taWNoYWVsLmoucnVobEBpbnRlbC5jb20/cGFydD0xNw0K
