Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609A438FF4
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156905; cv=fail; b=tYBv0WTAG462KTCzfA0GUIolzZYQTRWH4nSneL8HtsGM0H0ael0RFnSGIXRarxq36Kc9tnHkn1tACduCq+6EB9dTiPfkXbbI9pbXng2U5BIwXQXjl18rts/zGlCSYUBLzBaBQKS5/aqb3gd4aQgwCQqkG2b2vIeEpu+JZvb1tec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156905; c=relaxed/simple;
	bh=gyqA6b8V2x8fItxAwWy5Y1ReAYTu/zuxgRKr51wwOh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t1R5mO3M8Cu6YkGFEiTSUFnF74gXOOYu3I2gbka7K5sqcqCSRK23HGwVXs27SpuSqhEqd0M+gTantqPfCAvSWgIf0Z7nLeU8KgAo1PPF/0YwGd1B8/m5IC7leJ5pFcAYUOxyk0AyvlhuBSONtfuRQ1CDM+3mGhDh1yx0yt7UApM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5r5G88+; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5r5G88+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789156883; x=1820692883;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gyqA6b8V2x8fItxAwWy5Y1ReAYTu/zuxgRKr51wwOh4=;
  b=m5r5G88+PSzq3L8Sf7RhTmTKu1Q1DH5YK8O50MDBCRlYkGrV4qYPjf0k
   UThjd72EcgKS68fajQMu9bPLmjl7Xk0thcLYZ25KDLbUm4VwPso6/NWFc
   QMRrPLHoxWmlnKGJterJgJBCZNEFpBZqBp/sy82nvtcSE9MkcaYOHaHsn
   bGcx8UV7FgcbIWHCLQ5ftOWM+LtJYy6ysApN/PPJIqUwvKbTWnri31wJw
   gv0R+yBuZebYUUU+qAMldJ6Xl3YGHvDXwtdVuK1DUr2xyUrciYWj4/DCX
   0azxrptYkuLgCN5vUIHBjDWoL2GoSPNWaCzrXo7rEP0DFy9ZygKLyZcgY
   g==;
X-CSE-ConnectionGUID: TfSu39IYTdSh8PFCak5Byg==
X-CSE-MsgGUID: LDJdxq53SgKhJRoE7jolrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89635111"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89635111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:01:20 -0700
X-CSE-ConnectionGUID: F+7kQspjQXWw89Y73uuppw==
X-CSE-MsgGUID: AQd2VSddRuyrWDHIQjQZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="267722517"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:01:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:01:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 13:01:19 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaEwT2p8Dlv7qL7u74rNIUABYkJHj7xaTG/FFdLKArwoJ3VxY4hdbDwsuxlz1SgZ/pQ0zWkwyxrDLpgrti1JjktF0YEx9x456Zkk6sfHdJ+es/Mi0B/nLGUoAOPBr7hp0mdX1QhIOE+qc4S576DowfHZyuuCgdoHy1qc8AbYNFYJhrig7NjL0FoAjDMlzAIXsbJq2h5w9ViHSZd4VOH+f5qZxnUBAsqCunYgv5jJHcIGALiWCUvXgbRjM4DvGWWCJjUET5Eofp8n00EBw7fKhxw2fzDEwnWJlGQpdnoCCjQrFiJiQP4GnEbfLL2V/Hd2R4396NNzcbNC2GNhoxQRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyqA6b8V2x8fItxAwWy5Y1ReAYTu/zuxgRKr51wwOh4=;
 b=n5sKaqUzFbWpINCWBCaLCWVZkp9HvlsOqKHQjU5hpUBPoBNVg87q6cO1r4XwIx2gCXZqTmhmeT0SB+YnQz9d6x1IU/h7swuD55H0WPGr7G9ZF7GaYkXaXEEm6TYc1O7lXONhd48e/xEHQQXlIIUuI4SoJ5DTAvOYKkLhPTTC8zxed3OeD4HClK/16nFUvDyu1wMi1oHj5h+gLla2Jv9/lUft+ZSY/0KZLuO9AzRx6y2EMZH/g+aS1mtvprlYzK42vQtUg5OB4uUw9o2DhleOR39wy8iAMP7s0ZQFs4PmPAB7lsXK3ax37p2XDDwK95RHV8hlc5Kelljma6boL8XixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS4PR11MB570107.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 20:01:15 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:01:15 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 12/20] drm/xe/vsec: Support EAGAIN return value
Thread-Topic: [PATCH v7 12/20] drm/xe/vsec: Support EAGAIN return value
Thread-Index: AQHdQHPE8I/mEZTq+EyPYXrJhuoM7rbGZ/2AgANmrPA=
Date: Fri, 11 Sep 2026 20:01:15 +0000
Message-ID: <CH3PR11MB0461499B73E043915555828AF3C1BE2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-34-michael.j.ruhl@intel.com>
 <20260909160118.17CDF1F00A3A@smtp.kernel.org>
In-Reply-To: <20260909160118.17CDF1F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS4PR11MB570107:EE_
x-ms-office365-filtering-correlation-id: ac4f2a11-5fdf-494e-304f-08df103f6fa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: toRI4KQ/wTNVWIJaNnTKEeDbN8sM5oERQbxpzrSRsWg6TYlniL54m+RiTYqwCPuwHjBlu4//n3CHfc4l0KpAngkptO70s4+1d6kMhtFMqgK9q+DNedvmeccPlbojomablbeNCcbTJKr4P2sta8OU/ornUCnS3A7wEAilX76w+OsemuZ9LfKeUjozUdHhtePYZ/Eqdkp9dH2CY5xBiV96xvdDybPFpgcpgSFqmQxpYv8fNigWf2ZVnMohbCuEQtAXBoamQh0KZJmsChWjIeULgTNm7fPK2YdyE3VRNK0/aFxAIXsJtA8sl59j/sHvjXVlMg2nzJOYkYhPfoauGccC6dLQSIInGG4lvfnq9OxXJfZG9aPv+pDxvkG/6FWaTUmRd7c22Ph6kYpUFd9VXvsLRwPK5OYQwKiyNjTdiGTCTISKZaNyDu8EKHxYkm4kg6DBUnLwOEqkvUEImBhuZcGgfGe6iiB+BSxI2TiK3v+fX9C5vquqTpAoomdToj1RhkkSEBTje/GslfiBIDGPRLMutyoPVWdu26hhS1I9JNdj1LBt7NzQyOZix8/rx7T1vn2NRjL5ioa2IYdpW3kJpv+E8kC9xk2yUNZH4ioKRmojAiVzZFEV1JAePuiyb170YT918/bIb+mrcBMYRA/SyYa3+KPeE6GR5n67NtyEFslctuE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHFKaDU3TFNsMTdOajdIalpSYS9DTDYyUXd1dW81WG05UkdoUDZ4bmIxWmUz?=
 =?utf-8?B?VkpyWGZKYy9xM3VaemMwQ1h5YnpDQXI0Vm1qTkxlK1F3b1VKVi9iOWRWdkE3?=
 =?utf-8?B?aWFESk42Q1RHWVl0cjRMNUdraXVJWWNYNEQxc0lweXE1K2N2YkJ4c1hzYnYr?=
 =?utf-8?B?Z3Fpc2tLdkw0TEhCZVo2YkVkTHdNejdkcmovQ1VodmJ5UllqYjNLcTVQQlNH?=
 =?utf-8?B?THQ4N2ZvYldROW9CVzJxQVhFN3hXVkdMTGFnKzNUUDBhNTg5TlZYNjNrK01h?=
 =?utf-8?B?TmhWTmt6a0dHM1dTbXlPVnFlMVJhT1JlcVBTS1RmNnZmYlRTYW1IckxMSjJO?=
 =?utf-8?B?OUxOMEhWTWdYL05YMWE4UFhCWDNMdTFuK1k4YUtNR2RISzVpUXlSZjZIbVRr?=
 =?utf-8?B?aDNGL1BXWXdjbTNXWXc4UlZvWCtRSUx0UDZsWm1DRGs0Y0o0QjIwOHVyWjYz?=
 =?utf-8?B?Qm9ySUxlb3VSY3dwSVFOM2hBVEV5WXlUeC9halo1T0VBZVF0NUthY2lxbFBB?=
 =?utf-8?B?eVFQd2lFczAxa3JHMWROdmpnUUFobHRoTm43djNBN0t5ZlYwaXk4dStmMTJB?=
 =?utf-8?B?d2NyeUlxUzdsQnhVTTRKVkRHYTZXeitQeTBMSzE2UitZclNHNmxER0lVNVhI?=
 =?utf-8?B?ekFVbWQrbXc1NzhodWthaS9mUzdUT3BUTytxdyt3eDB5Zml6L1BYeWFvZUc2?=
 =?utf-8?B?MmhaT296WGJkdmRVQ0E1Q3gxQ1pWa0tpVDhFVHE2MnlIZTRIcGV0VU1kTFNs?=
 =?utf-8?B?V25rbWJpV3RFQjV2aXFxOTh1MmNCL2VnTjJOVEt0alVkQ3dveTI2SVlKdlFJ?=
 =?utf-8?B?TmxaQ1NWc3htenRCcE9QMTUzNEVucWR5cWhXMWo3WjhKTWd0Q0dTQ2ZEbzln?=
 =?utf-8?B?cUp5NEcvTStFMlk0MXZOa0YvakUvR2MySWVOWk9KVklxM3phZU02c3RVSUx5?=
 =?utf-8?B?c3lGSTJ2T0dFU1liR3VldDNnV0RqR3ZLd1dCNmxtbm5xcDhnTHNhWGRpcFRp?=
 =?utf-8?B?eFNIV0lPUk1qTkhCRzlNOU14ZzdYRDVTZGJNWDVZVm1LeXVGK3U4QjcvZmVV?=
 =?utf-8?B?NUVTZTFmdnZOMjZUeXNOWm44Z3M5VmdtUnJHRmVyVFNhaDZ2VWZucXhkTWox?=
 =?utf-8?B?QWpEblhyWlNvZVlqYmtjQ0FqQm1NVVdGRlhHY1hxYzRjRUlXM1E5cHdBQTJO?=
 =?utf-8?B?eEhXSEVhQkhTYVg4TWNRdXNSbmZOUWY1RWU4QXlOUndmVzZWZG5JcjJoay9l?=
 =?utf-8?B?T3ZFTmI4S2xtVUxWSTZiQzZCZHZlVTNRMUNWU29IRmdpWHdwRXJIQ3BFZkZW?=
 =?utf-8?B?T3RXLy8yK1dwRnhNdDErZHBuNDNnTXBnTk55eUdBTUFibjB1cTRaZnJlaTN4?=
 =?utf-8?B?dFpjZHIzelNYbnJtVmZ5UElsYVNDbVVua0NuSW5VZUVvblM4OHBuZ1ZIamNX?=
 =?utf-8?B?RXR0NnRDUEtVdXFmYTdVMUVhQm0wT0RZREEwbnRhMjhKT0Q4eWNUKzlWRHZW?=
 =?utf-8?B?aTZBdExYeVZYTEY5dUZZM3VLTGZQUHhQejVrVFA5N2QvQWZUV2prYlRvaStM?=
 =?utf-8?B?bHUvREZqV2VTQ2JBS3hQRDdrbW41by93YzIwWVR0MEU1cCs5Ulhkb2FReTgw?=
 =?utf-8?B?cjB6RVhJT2oyQS9xK00weSs1S2x3aWlJUDRsNmRvQ2xDNStybjhRdDZoNzRV?=
 =?utf-8?B?RkczZzhPOHJjYWVzTUFJRjFRTjNaWVZlbWhXTkp1YkkreFVCckpQWEEvQWxn?=
 =?utf-8?B?b0EyNlljVW1POVZENzRGTzlPTFRCcWhpNHhNZUJ4V3lEMlFGUHZhekh4K04v?=
 =?utf-8?B?c1kzclV2RU9waGcwblVKV2JZMmxwNmhmck5XaGdaNWlLUVNCZE9zd3FlZlgw?=
 =?utf-8?B?WFRndHRmUE1DRURvRHVoSzFrQXNyMys1elY4U0JCalVHU0Q2dEY4U29Gcy9o?=
 =?utf-8?B?SVFGQ2RoMlJrc1orN0RGcHZiWUYwR3VXMXNJRlNKKzN1T2h6WGRBWUZVNWpz?=
 =?utf-8?B?bGc1ekRCajZ1Z21jc29CODdyN1dDRTZXSWlXVG1NZjc3Qyt2QlBZdWhsa0VY?=
 =?utf-8?B?RUdocWVzeTlYUDB5RHB2MHhwZGRhQzVnSnM2enlaZHpiNmNCWUt0KzRGQi9y?=
 =?utf-8?B?dEJaNjJmZmd0Y1pwaGoxY2hXRndzTHZLcVN5UjdSbENPdm5td2pXdStSOHBa?=
 =?utf-8?B?eFVHZzl1ek9CMC83UXI0a3Z6b0tlTWVFTHlXUWxLRk9JWnBMb0pNWTAxdFlK?=
 =?utf-8?B?MmEvNmFVRmxZWGxiemZzOHhGUlJWb0NBTzVCeEZ1bGFNWjJwM0djYURtNWU1?=
 =?utf-8?B?OS9xV0pUMzZ0bnRXMC8vTnNXOU1mWnlsb1V3cDFySlBNTktSOGRKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uaxGcmfmSSGFnzQ5iq8tHpQu11vexbvQm/wK8/erUvXE66aHfdiIaoVqB9ySiGCqJFMtgQupWLZ57IP/6Qg8TbVLfhqJqlfl7Pl23+0PTYTWBhbS4xie8bG3c/z/aur6xw5V9QxLrNVfGLH12jm+UTAAgOPc6xgN8cEcub9xCKRPbsksqKaQ1Z+sWMrzXrKCKQoH4vxSOzi0ZDLdD05776e0eu+sfifPF7Hgmo2/RR+pO0ye4a+GoBOp4ryKhhFEU0F5CLOEhLAOQWVu4Df5VZ1IauAY0CZLGSCEED08qPCjrhJGeLMv9Bg2AJzps/MxNZ7oj4qVfmsbR7Ujeh25Ew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4f2a11-5fdf-494e-304f-08df103f6fa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 20:01:15.1351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpn+CZkHGLNztdHctaYNYK8A5MYdfDQdrBmh/0TJtskviSUXB+SLVd+9W7yQt/X9u1zExJCdPDbXVxbjjDaXawqAhL7VbCtU1IMOOSqyAZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB570107
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciA5
LCAyMDI2IDEyOjAxIFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50
ZWwuY29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBS
ZTogW1BBVENIIHY3IDEyLzIwXSBkcm0veGUvdnNlYzogU3VwcG9ydCBFQUdBSU4gcmV0dXJuIHZh
bHVlDQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZp
ZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4NCj5QcmUtZXhp
c3RpbmcgaXNzdWVzOg0KPi0gW01lZGl1bV0geGVfaHdtb25fZW5lcmd5X2dldCgpIGluY29ycmVj
dGx5IG1hc2tzIHRoZSAtRUFHQUlOIGVycm9yIGJ5DQo+cmV0dXJuaW5nIDAsIHdoaWNoIGNvcnJ1
cHRzIHBvd2VyIGNhbGN1bGF0aW9ucyBhbmQgcGVybWFuZW50bHkgaGlkZXMgc3lzZnMNCj5hdHRy
aWJ1dGVzLg0KPi0tDQo+DQo+Y29tbWl0IDk5ZTU3OGY2MmNiNjIxMmM4MjVhMTBhNWRlNTg3NTcx
N2M0NmQ0YTkNCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPg0KPmRybS94ZS92c2VjOiBTdXBwb3J0IEVBR0FJTiByZXR1cm4gdmFsdWUNCj4NCj5U
aGlzIGNvbW1pdCB1cGRhdGVzIGNhbGwgbG9jYXRpb25zIG9mIHhlX3BtdF90ZWxlbV9yZWFkKCkg
dG8gZXhwbGljaXRseQ0KPmlnbm9yZSB0aGUgLUVBR0FJTiByZXR1cm4gdmFsdWUgYW5kIHByZXZl
bnQgaXQgZnJvbSBsb2dnaW5nIHdhcm5pbmdzLg0KPg0KPlsgLi4uIF0NCj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdtb24uYw0KPmIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3bW9uLmMNCj4+IGluZGV4IDUyODRjYWI2NzAzZDguLmVjZDUyYTA0MTc1ZDAgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdtb24uYw0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2h3bW9uLmMNCj4+IEBAIC01MjIsNyArNTIyLDkgQEAgeGVfaHdtb25f
ZW5lcmd5X2dldChzdHJ1Y3QgeGVfaHdtb24gKmh3bW9uLA0KPmludCBjaGFubmVsLCBsb25nICpl
bmVyZ3kpDQo+PiAgCQkJCQl4ZV9tbWlvX3JlYWQzMihtbWlvLA0KPlBVTklUX1RFTEVNRVRSWV9H
VUlEKSwNCj4+ICAJCQkJCSZwbXRfdmFsLA0KPkJNR19FTkVSR1lfU1RBVFVTX1BNVF9PRkZTRVQs
CXNpemVvZihwbXRfdmFsKSk7DQo+PiAgCQlpZiAocmV0ICE9IHNpemVvZihwbXRfdmFsKSkgew0K
Pj4gLQkJCWRybV93YXJuKCZod21vbi0+eGUtPmRybSwgImVuZXJneSByZWFkIGZyb20gcG10DQo+
ZmFpbGVkLCByZXQgJWRcbiIsIHJldCk7DQo+PiArCQkJaWYgKHJldCAhPSAtRUFHQUlOKQ0KPj4g
KwkJCQlkcm1fd2FybigmaHdtb24tPnhlLT5kcm0sICJlbmVyZ3kgcmVhZA0KPmZyb20gcG10IGZh
aWxlZCwgcmV0ICVkXG4iLA0KPj4gKwkJCQkJIHJldCk7DQo+DQo+W1NldmVyaXR5OiBNZWRpdW1d
DQo+VGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBzaW5jZSB3
ZSBhcmUgbW9kaWZ5aW5nIHRoZQ0KPmVycm9yIGhhbmRsaW5nIGhlcmUsIGRvZXMgc3dhbGxvd2lu
ZyAtRUFHQUlOIGJyZWFrIHN5c2ZzIGF0dHJpYnV0ZQ0KPnJlZ2lzdHJhdGlvbiBhbmQgcnVudGlt
ZSBlbmVyZ3kgcmVwb3J0aW5nPw0KPg0KPkR1cmluZyBkZXZpY2UgaW5pdGlhbGl6YXRpb24sIHhl
X2h3bW9uX3JlZ2lzdGVyKCkgZXZhbHVhdGVzIHN5c2ZzIGF0dHJpYnV0ZQ0KPnZpc2liaWxpdHkg
YnkgY2FsbGluZyB4ZV9od21vbl9lbmVyZ3lfZ2V0KCk6DQo+DQo+eGVfaHdtb25fZW5lcmd5X2lz
X3Zpc2libGUoKSB7DQo+ICAgIC4uLg0KPiAgICBpZiAoaHdtb24tPnhlLT5pbmZvLnBsYXRmb3Jt
ID09IFhFX0JBVFRMRU1BR0UpIHsNCj4gICAgICAgIHhlX2h3bW9uX2VuZXJneV9nZXQoaHdtb24s
IGNoYW5uZWwsICZlbmVyZ3kpOw0KPiAgICAgICAgcmV0dXJuIGVuZXJneSA/IDA0NDQgOiAwOw0K
PiAgICB9DQo+ICAgIC4uLg0KPn0NCj4NCj5CZWNhdXNlIHhlX3ZzZWNfaW5pdCgpICh3aGljaCBz
ZXRzIFBNVCBiYXNlX29mZnNldCkgaXMgY2FsbGVkIGFmdGVyDQo+eGVfaHdtb25fcmVnaXN0ZXIo
KSBpbiB4ZV9kZXZpY2UuYywgdGhlIFBNVCByZWFkIGRldGVybWluaXN0aWNhbGx5IHJldHVybnMN
Cj4tRUFHQUlOIGR1cmluZyBwcm9iZS4NCj4NCj5CeSBzd2FsbG93aW5nIHRoZSBlcnJvciBoZXJl
IGFuZCByZXNldHRpbmcgdGhlIG91dHB1dCB0byAwOg0KPg0KPj4gIAkJCSplbmVyZ3kgPSAwOw0K
Pj4gIAkJCXJldHVybjsNCj4+ICAJCX0NCj4NCj5UaGUgdmlzaWJpbGl0eSBjaGVjayBzZWVzIGVu
ZXJneT0wIGFuZCBwZXJtYW5lbnRseSBoaWRlcyB0aGUgc3lzZnMgYXR0cmlidXRlcw0KPihlLmcu
LCBlbmVyZ3kxX2lucHV0KSBmb3IgQmF0dGxlbWFnZSBHUFVzLg0KDQpZZXMsIHRoaXMgaXMgYnJv
a2VuLg0KDQpUaGUgSFdNT04gY29kZSBzaG91bGQgbm90IGJlIHVzaW5nIHRoZSBWU0VDIEFQSSBi
ZWZvcmUgdGhlIFZTRUMgZmVhdHVyZSBpcw0KaW5pdGlhbGl6ZWQuDQoNClNvIHRoaXMgcGF0Y2gg
aXMgcmVhbGx5IGp1c3QgZW1waGFzaXppbmcgdGhhdCB0aGUgY3VycmVudCBjb2RlIGlzIG5vdCBx
dWl0ZSByaWdodC4NCg0KSSBhbSBnb2luZyB0byBkcm9wIHRoaXMgcGF0Y2ggYW5kIGNyZWF0ZSBh
IG5ldyBvbmUgdGhhdCB3aWxsIHJlLW9yZGVyaW5nIHRoZSBwcm9iZQ0Kc3RlcHMgdG8gbWFrZSBz
dXJlIHRoYXQgVlNFQyBpcyBpbml0aWFsaXplZCBiZWZvcmUgaXQgaXMgYWNjZXNzZWQuDQoNCk0N
Cg0KPkFkZGl0aW9uYWxseSwgaWYgLUVBR0FJTiBvY2N1cnMgZHVyaW5nIGEgbGF0ZXIgcnVudGlt
ZSByZWFkIGluDQo+eGVfaHdtb25fZW5lcmd5X3JlYWQoKSwgcmV0dXJuaW5nIDAgbWljcm9qb3Vs
ZXMgaW5zdGVhZCBvZiBwcm9wYWdhdGluZyB0aGUNCj5lcnJvciBjb2RlIGNvcnJ1cHRzIHBvd2Vy
IG1vbml0b3JpbmcgdG9vbHMgdGhhdCBjb21wdXRlIHBvd2VyIGZyb20gdGhpcw0KPm1vbm90b25p
YyBhY2N1bXVsYXRvci4NCj4NCj5Db3VsZCB3ZSBjaGFuZ2UgeGVfaHdtb25fZW5lcmd5X2dldCgp
IHRvIHJldHVybiBhbiBlcnJvciBjb2RlIGluc3RlYWQgb2YNCj52b2lkIHNvIGNhbGxlcnMgY2Fu
IGRpc3Rpbmd1aXNoIGJldHdlZW4gYW4gYWN0dWFsIDAgdmFsdWUgYW5kIGEgZmFpbHVyZT8NCj4N
Cj5bIC4uLiBdDQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDCtw0KPmh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkwOTE1NDczOS4xNTE1NTE0LTIyLQ0KPm1pY2hhZWwuai5y
dWhsQGludGVsLmNvbT9wYXJ0PTEyDQo=
