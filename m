Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AF49B210
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144609; cv=fail; b=Mos/lfrKzd2o+2foqVICGPlziTODRaBo2KQyZ8JVETJq1qWp9dIVjuXUEUz64R6eEWs1zt+p4uLEsgOIobZEWdEM9ha4VcYM4/5M/hqsOKVaaYyrqgs0a0cim+rcved2Et8BVGQV/a8gqiyM3NI1oE0FIRDJP3gUoSQLimCWCoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144609; c=relaxed/simple;
	bh=er3roYIf/jFbj6EIn23wiYFDBJce6XrIZl+uEYzD8/U=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=bw+yBtMaXIHMMiu2qDn2uWt2ljakFaubG8+Q5hRPzjkbF71tvs2jEfusl1JqyRyDYn9zJJsYcZ1N+ao50wdsjWVDhSZnQo08xV1zAHNEbQh5litRLcMp4albTThUGU0Vcc7I1GSv2VXF7TeNzsqFV6Mr3RXnvQGtBKKU3R+Ctfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrcSnHGo; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrcSnHGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789144608; x=1820680608;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:content-transfer-encoding:mime-version;
  bh=er3roYIf/jFbj6EIn23wiYFDBJce6XrIZl+uEYzD8/U=;
  b=JrcSnHGoig+LqehlWPvl9xh3XwI5SEFlzj3GGxEl/OPuUC1/Dx06R+P0
   ixK7oc/ypuv4m0VnsfFV+PPHFFWDPid5BIb+LmtsTva5yIDGulopb/X+N
   dNLOvS9oU8FQU0YVNMqjxh4W5gHEi023Gi/XGwLPVueVfoK6HkBhgN6M7
   UFSkTuPZPNKdNAgeBl1n/C1TuSaIyUu60IEsNSvQrOJ/GQYhR3KflaLAE
   3BOV64s3CrfdW5wq5rzZw95sywYVCWw4swh7LeAOwIeH6wn8MpD+Ji4bW
   oYEMDYkMzzNJd0sX0NbsFlwoPTotNZpLvUm0rzzUbQss5JUCgNJDVvDTg
   Q==;
X-CSE-ConnectionGUID: jkayS+9WTfK2MGfw7UWtsw==
X-CSE-MsgGUID: V/ShE++iSDibefQEoY3lug==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100771821"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100771821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:36:48 -0700
X-CSE-ConnectionGUID: bSruFoHgRFeC0Soh8haQEQ==
X-CSE-MsgGUID: PO8pkQovS+6IpbwQSSBd4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="275720186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:36:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 09:36:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 09:36:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 09:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey0hCafMPStwNyGkfhQWTj3gpc3ZEv6+vC/TASpX9w/w8C3ttyLhFqYGnzUfmVFekzNS+O50hjCd0ZrcaoDpLaVJv4UWkRFUkEmC2m3R3KNpUjsbmibOLrl/8yb8znJA73zAdkKefef+GiJsgjLPU+ivQimBy3HjjmZpKypbzUzL1FzS79yK+4Tm+yV0RKrxiVR5AG9JiD29bZHgxaDD5NZFa5zNu81SZPyX5F301FKvQgOeIhTseZsNt534+hBrH4eQgMF6sCW1DVlAowyfvzvY7LJ199DwPOV9SNQJSeBtvdlZFHhnC2qNxbYd4YROe3zod1LiFZZvpNlTtxtPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnzKWLmE4/L0VgMea4boc/Tkg08o3JbI+hAfUjOIKFA=;
 b=ImR15L+XP3wORIJ3JzbbeoHkqnYZe+hlkL8KFftDlTJ1pixHWPlxWJVo6r/tfyzHZMMZunFyvs0I18c8g0YrdTdHAtl2QwxW5wnxg4y6z/YaEn/rBgQDL7oiipOOXFpOYb1gmFRUbBwl4qlwHT0NhO/d39ANsHkU1aYT6a3QmUJXBHKBAT8OnWXiL5KcppmvvYzHvsOttyCH8B2re70EY/9ZSzZ4182C8iqaduh+LC4sDz83MIYOkpzVFkkQ8pvjWEOgaHUq8fYsGUggvcgrd17jMjqIXMNDNwKMGPGMiRx7DriOBvwgxlXLAsGx/hh78tZYGlYBZcWCAiimXw/CNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 16:36:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:36:43 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	<sashiko-reviews@lists.linux.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe: Keep reference to device descriptor
In-Reply-To: <40c7869e-3a3d-46c0-8d96-a907be19ddba@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-3-michal.wajdeczko@intel.com>
 <20260904171419.E21DF1F00A3D@smtp.kernel.org> <874ig3956l.fsf@intel.com>
 <546154dd-66e2-4c7e-9a0d-59c56f07b85c@intel.com>
 <40c7869e-3a3d-46c0-8d96-a907be19ddba@intel.com>
Date: Fri, 11 Sep 2026 13:36:38 -0300
Message-ID: <87v78bhhih.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: b006c80d-c9c7-4f17-25cb-08df1022dca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 2F2oHWrOal6dcxcPTaKVE9G1Nmy94S2XE63Zw2Ir7Gbt6ROuNYwM61lNn99/Dc7RjqNhj1SvLFc/9XfS1dx+vektvk6pwtwTiVsT5miV5195Ur9jlMTaoq4d3nVa+n/pMPzTnM7YNI9hF+HHO45D6Y02beFiYbjIVne3fr22aCMVXT8f/LM9DxLmFBQACImnVpyyImg88A5pzlywixelDBCt7/0IKhvzfd+Mhr5bPRr31BcXQqfVXmqMUEHDl5TgDlVstoJFRwiI9pM4mA1qq91kz3DQpH4LeT2RqOJCHDxboWRNS0tIcAef9LAbU5mubkgtnfzds9L1VRJAL5uS1ySWsdAar04UijUNSqrGs39ECCmWIdq3AaBf/KvpHfNZU03S4DJ5PBFP5rJrof9dQ7kzb7N9mo7w/US5+xMoG+CxxZQmbcEjQn47hpmDl72Ym9VLY3efyc0SM7bTw6Kt14sMc1IZYp/RrsBe1BRevyM40tqTcciz4Akub/HkTqs4blLKsioAom+dGMpDdOr4FBqSe6uKkPnyiUUhG2hGb4LwEQj6IkxZNzmCWGkOxIHh6E0jzTGdgwrAAFLdrj2Ve2alIvnd7GRgi5IruPImCXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9hdnAxdnJkcGtoRXk3OWR3QkVDcmtBRkZ1VFRHOS9UZGQxVHFXZTZPS1lF?=
 =?utf-8?B?MW9BbUFNVkZzZ1ZCMHpMaGJJZ2R0a2tZeFZXVW5pdmwxT2hjeWg3bEdxNGpm?=
 =?utf-8?B?cWlBMFplSjZRNFNtWlRtTXZ0UXhzYjM5Q0xHTnNJSmtINHY5Vzk0RWJEZndn?=
 =?utf-8?B?V09uamVPazVBRUk5eWI3blJEUTYxZmtFWGNkV3M5dS8wSUhQUXR0TVZJMm9E?=
 =?utf-8?B?dlcvOGNEenJENFhpTXczbDFqZFREclZYSlhieENlSnJpcG5ka3JPRTd3QS9x?=
 =?utf-8?B?VUY3aEloSmhOSU9ESm01RGlUZk1qU2RmTi9jaUVnQUQ2dU9jOE1vajJTRFg5?=
 =?utf-8?B?OFdqQzViSEM0ZXRLTW5lYW9HWVhLNXdLRlZKdzdWUnF4WFNzWUEwdWZhdkh1?=
 =?utf-8?B?RGU4Y0xpNTB6aGpLVVd5RlRkWlUzTDkxY2U0aE5vQk8vV1BKc3BqN255RHor?=
 =?utf-8?B?eWZrZUdPSHFsbm5laUJoQ0NwVXRxTVVhSlpvaDRFVVlpQlUzdzgwZkdNa0l0?=
 =?utf-8?B?T1d1dlREWERiK1VFNHYyaDV4c3RzVGlkOHQ2OWNkeC9MbW5FZk1KZUovaUVy?=
 =?utf-8?B?KzkwVlBNQjFnbFppU2J0eFFLNXAwYlA2ODFjTmc5WDdjZWlGdFQxYmdlLzNW?=
 =?utf-8?B?ZHRYZTRHVGRha3pMNEphMXVmNEhQWnVmVHRxRktBNUVNckFySVQ3OXZidmZN?=
 =?utf-8?B?dWFUNWQwaThXWXppK3M4OWtUWU0vT0FUbmdmQXo4SWhMZmZXZDh2MGVuYnhk?=
 =?utf-8?B?SWRyNlROL0RJN2lZVTB6UkRTQkxPNUVsUlZJZ2pEUFFKcU9XcEYzb2xRWGhv?=
 =?utf-8?B?WENTelRrTjBUNnc1S0RPeEFYNnN2TFdVRE1BcmdveStYR1RiZENqTjZndE9i?=
 =?utf-8?B?UlQ1TjN3V0RqQTdnbmEvck9IRzNMZVV1RnQ4MVdzMjArck9ZMEQ1Sm5OVkZQ?=
 =?utf-8?B?TTg2dXpPUW5Pa3dyOVo2TDZtMGVWK1RQY3phWURTRUxwKzFCYi9CUTJDMjRN?=
 =?utf-8?B?eGEwRmNpTWU0NnpOeVJvMFc1RVk2dUovM1lvRktJQmx5WEh5NmRKT1BoVXVF?=
 =?utf-8?B?cWZQQjBHLzAvVTAyNG0rQmhxQ0V4d2JTMVBZcVhBcnpLeFlHM3l6elhGQWto?=
 =?utf-8?B?Y1NzVkVwS1pUbVFsbVQzRkxUOFdRTjVYNS90aXkyK25DRWJSdEtvRlpQMTVI?=
 =?utf-8?B?UHNnamRwbTh1SVM5MXVGYU10UTFDMWhNREhEWU5veEs0bVIwNmZ0dUROZXlC?=
 =?utf-8?B?K3hrT09Tem5XQmllcVRSMlU2Tk54SWw1cktFK09NQ1BQTUZaci9ESWxlejlZ?=
 =?utf-8?B?c2J3VlhtNmNjK1FRckh5Q0lXemJtUFk5U3NGVGJGV2REODQ2TTI4Q2cwWHE1?=
 =?utf-8?B?cVhqSHc2NmowSklYK0pmRUJmWFlNUjZvWjAxUnlwVEtuV3JUNzBvSWtuQllr?=
 =?utf-8?B?b21kazAvSHV1TnlZZ3I5WW8ycjUxNzQ2VG1VcWw1Q1ZReHJna2toNVJRenho?=
 =?utf-8?B?VUZMN3ZWTWdpK1VKSEV5bWpnbzNkZWQ1WTJvMGZSQ2JWUVo5TjVpTXhRcG9P?=
 =?utf-8?B?UEhGNmxlc29SVHEzd012OHJCczlYTjkrSEU4bDNNZ3VrMTlaMk94blVvQ2lD?=
 =?utf-8?B?aHJMYUlnRFEzSHdhUDhtTmhETHRzSFllOFMzWUgrZ3VBU1VTcU5GOUpzZnIy?=
 =?utf-8?B?djNxNVdhalgyZFphaGZ2TWVvM1U1QWR5Smozcjk1MmtBVWhWRmsrU1BiQkQ0?=
 =?utf-8?B?NEpiRCttUW5EaGJVYnp4V0dsMnJMcHhheHl4M0JpeXJtRDFDbXBvdjVjM2VN?=
 =?utf-8?B?VTVBNm1lclFGZWp2ZkpTMG45WC9LR2UwNGxLRW02UG5VWTlYcGVBTFFla3dr?=
 =?utf-8?B?QVM0SjRMWnY2aHR0V3U1MFROY1Q2VVhRMG0yaW1SeW01aWFZV3g0V0thYUZz?=
 =?utf-8?B?VWFhTVBzcWo3R2dKVE5wSXJkSGFlcXY5QkdvNEE4dDJBRmVUNGlNbGlBVjB2?=
 =?utf-8?B?Nk80Qm5hTThFZHhmeWdXZW44QVpkQ3hmT1VoM2VCMVdzbUQxV2ZRbS9iQm9U?=
 =?utf-8?B?K2hiQUZQbUZRTE9ndkN3UWNld0lvQmdOcTlUbTIveDY1VHhhdUQzV0pTemVT?=
 =?utf-8?B?MnpJRkZUV01NUDB1eDVWOVhvN0ZPM0tPbS9RVWdBSDJXcldpTHdFMkpjUWRS?=
 =?utf-8?B?M0hLNFV3aU9PZlRueEJsK2ZaNER0alpxakhHZ1V3TmoxbVJqQzQrVFhTU1Zz?=
 =?utf-8?B?d0x2MnBLMzR6eHhpYVZUOHVKLzIzK05KZUZ1eDdFVnJtcjg2THRtbDQ2eGxK?=
 =?utf-8?B?cFozSUovUFlTM01KNFlFdHgxQjdkUUVCZFU1TkE1L0hDdUhMMU14QT09?=
X-Exchange-RoutingPolicyChecked: W30iBYLg18tPoAd8bawXMwrs+DaJkxbXUvibmiycTHwADdwPOaF4Lx/zrVZEHThj8MI3FMxa8YOuMrXnFfM+/Yyio1PpD5MfwQsT53qHH/nTURHa+j98fAaTMgIm7oQsOoloTQMMYscs6mcSmvxiFm7WIZLTQAMnVTgh51wmJIc3hprdGn/iBnyT9vkSBmG0AF4u7XI6oHtbPfiXW/FrvNJ0Sslg6OgVDqMSOhzSSF4NYEI/peY2Mxk0Oi1CiER80uTs+QYI3A62EBDoCPP+PbaWpVKpUo0iqWPjaFWE2EriaHu0ZyskvyF+GMOKKzeHBn+cFeisBWyUCoVyV8BmCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b006c80d-c9c7-4f17-25cb-08df1022dca2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:36:43.0391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jl67bJl++DJzbEHAlRR59IvTJrh04g6X/28xkoxThlWC8zNNRZ8/wa8BprC6whSh6aUC4d/N6PeGBEVZxY42Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
X-OriginatorOrg: intel.com

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 9/7/2026 9:30 PM, Michal Wajdeczko wrote:
>>=20
>>=20
>> On 9/5/2026 3:52 PM, Gustavo Sousa wrote:
>>> sashiko-bot@kernel.org writes:
>>>
>>>> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>>>> - [Medium] In test initialization, `xe->subplatform_desc` is incorrect=
ly assigned a pointer to a sentinel element instead of `NULL` when no subpl=
atform is matched.
>>>> --
>>>>
>>>> commit 2fbc7ea3deaa915eef829a4c64ec08fac1f4a8a9
>>>> Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>
>>>> drm/xe: Keep reference to device descriptor
>>>>
>>>> This patch stores a reference to the whole device descriptor and the
>>>> matched subplatform descriptor within the xe_device structure. This
>>>> change enables access to additional non-mutable device parameters.
>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/t=
ests/xe_pci.c
>>>>> index 4965a01f6ba52..48d5ee478fe69 100644
>>>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>>>> @@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>>>>  		return -ENODEV;
>>>>> =20
>>>>>  done:
>>>>> +	xe->desc =3D desc;
>>>>> +	xe->subplatform_desc =3D subplatform_desc;
>>>>
>>>> [Severity: Medium]
>>>> Will this assign a pointer to a sentinel element instead of NULL when =
no
>>>> subplatform is matched?
>>>>
>>>> In xe_pci_fake_device_init(), the search loop terminates when it reach=
es the
>>>> sentinel element:
>>>>
>>>> 	for (subplatform_desc =3D desc->subplatforms;
>>>> 	     subplatform_desc && subplatform_desc->subplatform;
>>>> 	     subplatform_desc++)
>>>> 		if (subplatform_desc->subplatform =3D=3D data->subplatform)
>>>> 			break;
>>>>
>>>> If data->subplatform is XE_SUBPLATFORM_NONE, the loop exits with
>>>> subplatform_desc pointing to the sentinel element of desc->subplatform=
s, not
>>>> NULL. The subsequent check (!subplatform_desc) evaluates to false.
>>>>
>>>> By directly assigning this value to xe->subplatform_desc, the test moc=
k
>>>> environment now gets a non-NULL pointer (the sentinel) for devices wit=
hout a
>>>> subplatform. Could this create a state inconsistency with production c=
ode,
>>>> causing tests checking if (xe->subplatform_desc) to falsely evaluate t=
o
>>>> true?
>>>
>>> Sashiko seems to be right here. I think we could initialize
>>> subplatform_desc to NULL and assign the one from the loop if we find a
>>> match.
>>=20
>> for the record: IMO this should be tagged as a pre-existing issue, as ev=
en
>> without storing a xe->subplatform_desc, tests code already could pass se=
ntinel
>> instead of NULL to the xe_info_init_early() which could in the future ma=
ke
>> some decisions based on non-null descriptor
>>=20
>> anyway, fix is done in separate series [2], which shall be merged before=
 this
>>=20
>> [2] https://patchwork.freedesktop.org/series/173450/=20
>
> this is now merged [3], can we move forward with this patch?
>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
> [3] https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/51c3ac1665265bf=
107d111927d242f0799ba11f8
>>=20
>>>
>>> --
>>> Gustavo Sousa
>>>
>>>>
>>>> --=20
>>>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904170531=
.516-1-michal.wajdeczko@intel.com?part=3D2
>>=20
