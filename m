Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCEB2737FC
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645938; cv=fail; b=FGQ9Mj8L2eeJ6c0N6Ul3JvYbcRdBPzIou/Degmdf3Vt5J9EiZpFuCtz3P/JcPGoSd5uJtdjSY8AzZg207FjiO//8jXjFH39/ibDRKMlkaiF2+ENtLZIJtb707CuNOOARVarCaj2+5ZtxWDZAkhvDxJLkRSQeESsHPBxVtpVpSRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645938; c=relaxed/simple;
	bh=1ktRQBiSstd4j4zUmNGLUEXr1jAP5H+p+tf+rAQWqoE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ka1hfKwSTYYkWSFS6aZs7jmqqgImHJKGo2XDeVi+YGYQ+C+rF8S8PgpKS15NTXLbr+/21RfSHb0V+gjoAGE1WP0uGVpZRRiPiwcdIJpLwcOl4v6CQO9FKZlwcJkOT5jR9Ibcu3YM8TM9z6OCnr7ZZM6laqhO4dTNcjVnrljHRbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcPO1P8J; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcPO1P8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645937; x=1818181937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1ktRQBiSstd4j4zUmNGLUEXr1jAP5H+p+tf+rAQWqoE=;
  b=NcPO1P8Js+O85SjLgDHArazk6BsLojI77NoV/n8p7vIIs39tsZJKq8g4
   2BnoBELD7/Bkwtz6Y5B2HUQIyKSNBLJWKPSCj/GebmFFj6CXVFkeXTGHq
   MFgH4j7+aZ7I35AzTEPpaZKN0JnO42+JsH+2jkghxtEbZzIfNvxbV1EJk
   Bgiwikj/y2vONNWgvg1DYnU6wXMBo4ZTeRv5t7ovPUXoBak37KdDk5edG
   C4EXI5QSAHHcDoGh/26EDomQ8XUk8o1pLecbqeQ6uWfdzp2LjRWm+RJdG
   Y274LhgR2XyxRtHtuA/+lM8oZngS1d/GlO7rjg1igMZepBSdjh1D7/6RD
   Q==;
X-CSE-ConnectionGUID: 1rDoxiIiQruS972cDnQOTw==
X-CSE-MsgGUID: gwcQr4XzSn2nCR/tjRwX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98585144"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="98585144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:32:16 -0700
X-CSE-ConnectionGUID: NqAu9LBiRSCHQapVaNj2Uw==
X-CSE-MsgGUID: 8qTS1L8ZQT66rLsD+LTfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="288797190"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:32:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:32:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:32:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=folvWZp+JcfixPTdfxR84BD7oIvc4wxkSi39Rvn8U6hEffbBgH65aYBVaedh/SV5KWqsQJ/DKDTiI9Rko4lSWzos9nU41Ye4KnSmxLMJzpZ8+EmR1Cmp/F+BIE+zAvetjnfJ6UlZXR/dTNUAOhO82qWCtJPJTuwe1uAqhWY+oRK7anctFdyShIg1IKGWjEyelSgqtZjPJd0/8Tv9yZDQbvvkli//JyJHvBv5RZmXtfH9YY9q/iQPXJXOcPeP7WeXCsA7NAq8+9j7tpg6+2cNrdUkw82MpWTgc3LwUWC5ikGPLVd2mPenYWQNmwHa2Pfx3LLmvgW0r7IPeTT7nmpzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ktRQBiSstd4j4zUmNGLUEXr1jAP5H+p+tf+rAQWqoE=;
 b=vb2o8+cST48YKeuOUbBm1qtpszhOFU0gRRuAQtDj4nHbd3KObhyO6TAOBILVHq8wVED0DKL1saP86eLejgCDJr5DOIpwP4e356GNB/7VVNiceXkbTOfuozl4DXc9pJ7mIsrTzb0Lf0OorujTd79OBQXPMhlfNl7KethX2c6+XWmYRuplQ9gyfPMes6vqUleYqr9hw4PtyRFR9NLz0ndgX1SNVM8b9UzBxozC7zEfOwrthkUPr+PDGsSckDYyJ0NSnY1x/Cn4p9ddcvf1b9oFDzarP4QXELy48Jzz1dcIc/hgjiJBfg1+yCJKUCz9XUkB1zIquefoaP1v1kwXXB54Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB9499.namprd11.prod.outlook.com (2603:10b6:8:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 18:32:07 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 18:32:07 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdKpIo3+ofk7XMPk2/Jk3zAEG1iraa1F+AgAFeHjCAABvyUA==
Date: Thu, 13 Aug 2026 18:32:07 +0000
Message-ID: <IA1PR11MB6418E181584F80EB7372C938C1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-20-michael.j.ruhl@intel.com>
 <20260812195710.42D571F000E9@smtp.kernel.org>
 <IA1PR11MB64188482F342399132A766FCC1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64188482F342399132A766FCC1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB9499:EE_
x-ms-office365-filtering-correlation-id: bcf63580-ec78-4362-ff38-08def9692e0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: jcRBnzf5vDbH6TZkcmtROo9BxE6wAKNKX48DO9CsGs8GdfWPa9eubLoBolEFChMGCgjZaNDkQA0duZ9PCxcHOgZE3p9bN1FuJHKSOCPHOHtxXx4dTX+14tuByOU1QFBDhBcpUjyGLi2fD85IlMs2QtgFd41O5veE2Ek6+UgFPEca3rzfl6vEOX8L0iiYVKGC1+zutQhcgYDgAt7SXEQwZzHHSBXPTjamfaFS8WwH7moMAmoXsycaxIqzWbu7R7RXcxEZIniDL/W8BUoPiDQbjC/2GVlUPfaQ3sZ9whpdHgGR7wfiLL5XSZ+v0Q3s905XMc1bMApMMXf+I1ZlUF/x6NohWl9Y7HnYFErTescPcduqVas6LCw9a9GJCoq+ZvKFKG+5u/S5BdCa3AINPmhTfj2QDCVRYR9fnWFGadKbAYa/xz+tbeQAGBaH/iBd2SBcH/lBkibNNrSfcUnwygatEXjQyJRC+luHLTZAv1tDd9OJhiz5KrpSxm6p9FO0Hwp8x9d2bAUVL3nVr57GR5gCszpuakzaEdtAsnJko1xevNlrAHZFCj7+l3qYDicsB+OG0+i9tGTqUxmEPxMcRkzlP3wtFt8poG1oS6cEYhTCb7KFQC4EmUL/USv+ooU0AHzw1WgxxGFp23ZtMdFDMACSqrCQNvJXXIcceiz/vjAQ3kY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1R4cnhTQzNDZDJCcVF4T29YSjhOZitmVW4yVW4zaHYyMnhKb2l3bG14Tk9q?=
 =?utf-8?B?aFdMWGxYZUNvWGFERUVqYjVIcjlqTTVvOTZwYUVOM3NoekpMbWEvd2dPZ2Nw?=
 =?utf-8?B?VUZEbzNYRWsySGJxS0h3dDNRSXU1eENKS245UUt4MUtZNTUrQk9nNEU3L0VS?=
 =?utf-8?B?SzdabEIxbVEzblNXKzUvMXhadHVwNGZwU2NUQkpPZFhMNDdxZDE2NGdXUTd5?=
 =?utf-8?B?MmNOSEI2clRYMjVzWDEzVnE3czlyN2J1eHdZZjgzaklZQXlJZEw3MlQ0SDE3?=
 =?utf-8?B?eE1MeWlsQXVLazB0RlppUmkzNDY0M3ZlV0ZZYVVMeTJFWjhRYnFObUFMYXo2?=
 =?utf-8?B?aFhaZi9UVWNYQU1yR2JCclpUcUVkTENyLzgwQk5rR3B5NGx0MnhRNlFvZlh6?=
 =?utf-8?B?NTVDakJLVms2cEJra2t1TmFCVmlFV1dNREpwUWU3bE1HTDRHWitmc2lWVlZT?=
 =?utf-8?B?VUhUbzdud3dQNzk1R24vK2lpcndRSVFJK1hPL0hJQy92QzUrYm80S2FJK3JP?=
 =?utf-8?B?SnRNbWtveGppOGtpV0pOa0dKdnpONFFhNEZMZERBSzQxNVcrMnFUVncxd3Yz?=
 =?utf-8?B?REdiYlBzYTRWbDEydmlQaVBmTmtjZ0VValR2ak5CeUZ5WllSQWI4eGNzR2h3?=
 =?utf-8?B?MWNTTnNLaGt4R3FkZURUL3oyckl2eVd6dVJ5ZyswODRkTEZiNlh2R2hZczFB?=
 =?utf-8?B?VUdhN2crR1didThwVm9HUVFKYkl2VFVxNWRuaEovMFJvU29pYk1QNTNKT0p6?=
 =?utf-8?B?MjRCbzhvbXpkeE5zbFhLNGt3dHhGSTZDRU95Mm0zZW16aE9zSU9XWHZnc1pi?=
 =?utf-8?B?YVJ1dXAwQXZrdnZVT0pmZW9JcmpiMDNuVDh1SjRtOFFaYmpBaDVCV0JRWFZN?=
 =?utf-8?B?TlFQbVM1NUg3MGpvWkpiVVlVRnlVUkM5V0VNY01uWDJxRTBLbGVtN281UGgw?=
 =?utf-8?B?bENaMUNjaXcraDVPZ3ROTlpVMzI3aEdLNEFHaHlWTk9wU3o5bWhQKzJVOEZx?=
 =?utf-8?B?LzREZDRUbVVOQ2hNT1Jrem5WcjNzdm9aUk1lOFdWS2FIaEczQWdPdEp0SnBz?=
 =?utf-8?B?WXA3Vm82SW01WkF1WWZlVFFRTnRVQnFDTFQ2Z2dpMXhJY3F5SkVuRjR4cFJs?=
 =?utf-8?B?dUx4OHFlcHlJRWhIS1FQQUlLRTIyL0RyYUdNV1FJSWx3bEtoSCs1VHpWT0l4?=
 =?utf-8?B?cGpqRjBpYWI2OFJzeWp4SXlHUUF6WUxjY2I4NDBzeTllclNOQ2Q5ZjYwdUVC?=
 =?utf-8?B?bXEwZlo2UEZDYkJhRGZiSjFGamhtalpvZjYxajArYVprZ2pOekdSWEpVcU8v?=
 =?utf-8?B?SG5kZWx2ZXB3eHhWZVdRKzlaVWR2MC8zRHYrQ29weXlqRWxrSjBrNkk1ZU5G?=
 =?utf-8?B?RXRPb0NWQ1oxTTRNVTBHWngrSG95bnVYcnRBRk5GM2dmTE01dXJoeXZacWtJ?=
 =?utf-8?B?cVVrYmRDUGpjMjVlS3U1VDRVVjlZbDdUOXcrSjd1dG4xRlhQVUo5UW5ocC9C?=
 =?utf-8?B?NlJQQ0lYNk4zSVhuQnVwYVhrZllTQ2JxN3hzSXRSbU1zYUdPU001VktJTVdF?=
 =?utf-8?B?dUdWUGlMUFRGeXZlTDIrZVJtTDRFT04xMWlTS2RXSjRjQ3R5dHNFdENja1dx?=
 =?utf-8?B?SWp6YWx6VlNJdTlFcEc2TEZZRzRpcUZhTVhNRkJISFlkbVhKNWN2MkRjZ1pa?=
 =?utf-8?B?YUNUdWk0OUdBWGgvR2dUZzRxMFg1bmJocWF6c002MmhwY2N3R1BZNFpOWWlm?=
 =?utf-8?B?OVB3ZUJsMTVRZ3ZKMWM0d2NvRW4wMTNrZWdpQmJRa2FRUkY3ZnhRUUR1cmFH?=
 =?utf-8?B?SGlNblJLWGtCSWU2cmVVOU9TOERoNDNXY0l0OXArTUZWUGIveDVMZGJQOWQz?=
 =?utf-8?B?YnFjS3JrQjBJckpvaEEvdVdjQnFla2JNa1BPejg3VWxhRzEydERFV3JHQit2?=
 =?utf-8?B?Qy9pS2toQkJhTlRudGQ3Mk1sZEllRzhmZlNCQjhwdmdxS1FqRk9veUJxeGFu?=
 =?utf-8?B?dWdCM2pNVmt0VnpXaDBPTkl5UUp3dW1sVDdKdGVtVTE5c25EWGR6ZGlZQ1Nh?=
 =?utf-8?B?ejVBOFNLTXQ0NUNsNzVjYXhXT21vVWJ0cWlhK0s2bzEvTXBJWFJhdDBqbVNi?=
 =?utf-8?B?dlRsb2F2NXZUVGVYU0M2eW1tUnY1NlAvc216bjltVy9XbXh1dklReUpGdm9q?=
 =?utf-8?B?QklUbEM3ZDdpa1lnSW1QRG1iZGVyY3VTMlR0V0ovSGUyWEc2LzF3ZFFiYWor?=
 =?utf-8?B?eUp2VlB5a0d3M0h5TkJDUEVRbWRxSzB0YVg4NDRYWURNcGpqa1BPUWlkS2M5?=
 =?utf-8?B?clZqamJXU0czZitSK2xLRUxHc1NIVWNsR0FQQjFDb2ZNTG9kZmVEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qb48Fxj8dhtADe+YvG9u+kdDu0HilLxxLA+Uwg0PXvANiirVKa7M4Ti+GCbdUaQZTBOwqXGsHk2QK65d5qMSyM4QtTbBRf9eYI6TLt+Lz61c8oGkB2eQBnKrqDSr3q4eUXGhamu2WoFFCl/Rz8r7gVEhgcgMz5vQGvOlT4dXov8pUxFuotGHnI6aithBBukJng/KHlYojzO36wGe9MN01oQTNcWwoBAm1tdng3WFW6WrJJYPtCJm+L1a5UKxxs96yuwA6WyLteySgCSwnLmWCKDPmuSvGN1tXqdAi1osa+as6LAR94oELMqp+kC2Ch4HbzuY46Tu4PvwvSCuUQRb3g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf63580-ec78-4362-ff38-08def9692e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 18:32:07.1633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWjpdWCq8uHdIipqCK/oZAkDUtfx0tFmnAuhAMKVpQG1ulMrTV8FnlRax9X0/9+4knLWNJfICf7divoqKy9PRBgSJSMXztbYW+n6ChCBWTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9499
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFJ1aGwsDQo+TWlj
aGFlbCBKDQo+U2VudDogVGh1cnNkYXksIEF1Z3VzdCAxMywgMjAyNiAxMjo1MSBQTQ0KPlRvOiBz
YXNoaWtvLXJldmlld3NAbGlzdHMubGludXguZGV2DQo+Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMDgvMTBdIGRybS94ZS92c2VjOiBD
cmVzY2VudCBJc2xhbmQgUE1UIGNhbGxiYWNrcw0KPg0KPj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj5Gcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnPg0KPj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMiwgMjAyNiAzOjU3IFBNDQo+PlRvOiBS
dWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4+Q2M6IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj5TdWJqZWN0OiBSZTogW1BBVENIIHYyIDA4LzEwXSBk
cm0veGUvdnNlYzogQ3Jlc2NlbnQgSXNsYW5kIFBNVCBjYWxsYmFja3MNCj4+DQo+PlRoYW5rIHlv
dSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50
aWFsIGlzc3VlKHMpDQo+dG8NCj4+Y29uc2lkZXI6DQo+Pi0gW0hpZ2hdIEltcHJvcGVyIE1NSU8g
YWNjZXNzIGZvciAzMi1iaXQgY29udHJvbCByZWdpc3RlcnMgdXNpbmcgYnl0ZS13aXNlDQo+PmNv
cGllcyAobWVtY3B5X3RvaW8vbWVtY3B5X2Zyb21pbykuDQo+Pi0tDQo+Pg0KPj4tLS0gUGF0Y2gg
WzhdOiBbUEFUQ0ggdjIgMDgvMTBdIGRybS94ZS92c2VjOiBDcmVzY2VudCBJc2xhbmQgUE1UIGNh
bGxiYWNrcyAtLS0NCj4+Y29tbWl0IDY2NGFiNzcxNDdkZTZmNDU2YWYwY2VhZWFlNmE5OTZkZGQz
ZDZhNDANCj4+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT4NCj4+ZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFuZCBQTVQgY2FsbGJhY2tzDQo+Pg0KPj5U
aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGNhbGxiYWNrcyB0byBnZXQgdGhlIHN0YXR1cyBhbmQgY29u
dHJvbCBpbmZvcm1hdGlvbg0KPj5mb3IgQ1JJIFBNVCB1c2FnZS4gSXQgYWRkcyB0aGUgZ2x1ZSBs
b2dpYyB0byByZWdpc3RlciB0aGUgQ1JJIFBNVA0KPj5mdW5jdGlvbmFsaXR5IGluIHRoZSB4ZSBk
cml2ZXIuDQo+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4+IGluZGV4IGRjNDJiOTQ5MjQyOGEu
LjU3OGQ1OTA0OGIzOWMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zz
ZWMuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+DQo+PlsgLi4u
IF0NCj4+DQo+Pj4gK3N0YXRpYyBpbnQgeGVfcG10X3JlYWRfcmVnKHN0cnVjdCBkZXZpY2UgKmRl
diwgdTMyIGd1aWQsIHUzMiAqcmVnLCB1MzINCj4+b2Zmc2V0KQ0KPj4+ICt7DQo+Pg0KPj5bIC4u
LiBdDQo+Pg0KPj4+ICsJeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPj4+ICsJbXV0ZXhfbG9jaygm
eGUtPnBtdC5sb2NrKTsNCj4+PiArDQo+Pj4gKwl4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9y
ZWdpb24oeGUsIENSSV9JRFhfVEVMRU1fRElTQ09WRVJZKTsNCj4+PiArDQo+Pj4gKwltZW1jcHlf
ZnJvbWlvKHJlZywgZGlzY19hZGRyLCBzaXplb2YoKnJlZykpOw0KPj4NCj4+W1NldmVyaXR5OiBI
aWdoXQ0KPj5XaWxsIHRoaXMgY2F1c2UgdW5zdXBwb3J0ZWQgcmVxdWVzdHMgb3IgcmV0dXJuIGdh
cmJhZ2Ugb24gc29tZSBwbGF0Zm9ybXM/DQo+Pg0KPj5Vc2luZyBtZW1jcHlfZnJvbWlvKCkgZm9y
IGEgMzItYml0IHJlZ2lzdGVyIHJlYWQgb2Z0ZW4gZmFsbHMgYmFjayB0bw0KPj5ieXRlLXdpc2Ug
dHJhbnNhY3Rpb25zIChsaWtlIHJlcCBtb3ZzYikgaW5zdGVhZCBvZiBhIHNpbmdsZSAzMi1iaXQg
YXRvbWljDQo+PnRyYW5zYWN0aW9uLiBGb3IgTU1JTyBjb250cm9sIHJlZ2lzdGVycywgaXNzdWlu
ZyBmb3VyIDEtYnl0ZSBQQ0llDQo+PnRyYW5zYWN0aW9ucyBjYW4gY2F1c2UgdGhlIGhhcmR3YXJl
IHRvIGRyb3AgdGhlIHJlcXVlc3QuDQo+Pg0KPj5TaG91bGQgdGhpcyB1c2UgcmVhZGwoKSBvciB0
aGUgZHJpdmVyJ3MgeGVfbW1pb19yZWFkMzIoKSB3cmFwcGVyIGluc3RlYWQNCj4+dG8gZ3VhcmFu
dGVlIHRoZSBjb3JyZWN0IDMyLWJpdCB0cmFuc2FjdGlvbiB3aWR0aD8NCj4NCj4NCj54ZV9tbWlv
X3JlYWQzMiBtYWtlcyBzZW5zZS4gIEkgd2lsbCB1cGRhdGUuDQoNClVwb24gZnVydGhlciByZWZs
ZWN0aW9uLCB4ZV9tbWlvX3JlYWQzMigpIGlzIHVzZWQgZm9yIHVzaW5nIGRldmljZSByZWdpc3Rl
cnMsIGFuZCBoYXMNCmNvZGUgdG8gYWRkcmVzcyBzcGVjaWZpYyBIVyByZXF1aXJlbWVudHMuDQoN
CkZvciB0aGlzIGNvbnRleHQgdGhlICJyZWdpc3RlciIgaXMgcGFydCBvZiB0aGUgUE1UIGRpc2Nv
dmVyeSBzdHVjdCwgc28gZG9pbmcgYSBtZW1jcHkNCmlzIHJlYXNvbmFibGUuDQoNClNvIGtlZXBp
bmcgdGhpcyB0aGUgd2F5IGl0IGlzLg0KDQptDQoNCj5NDQo+DQo+Pj4gKw0KPj4+ICsJbXV0ZXhf
dW5sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPj4+ICsJeGVfcG1fcnVudGltZV9wdXQoeGUpOw0KPj4+
ICsNCj4+PiArZGV2X2V4aXQ6DQo+Pj4gKwlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+PiArDQo+Pj4g
KwlyZXR1cm4gcmV0Ow0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW50IHhlX3BtdF93cml0
ZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZ3VpZCwgdTMyIHJlZywgdTMyDQo+Pm9mZnNl
dCkNCj4+PiArew0KPj4NCj4+WyAuLi4gXQ0KPj4NCj4+PiArCXhlX3BtX3J1bnRpbWVfZ2V0KHhl
KTsNCj4+PiArCW11dGV4X2xvY2soJnhlLT5wbXQubG9jayk7DQo+Pj4gKw0KPj4+ICsJeGUtPnNv
Y19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBDUklfSURYX1RFTEVNX0RJU0NPVkVSWSk7
DQo+Pj4gKw0KPj4+ICsJbWVtY3B5X3RvaW8oZGlzY19hZGRyLCAmcmVnLCBzaXplb2YocmVnKSk7
DQo+Pg0KPj5bU2V2ZXJpdHk6IEhpZ2hdDQo+PkRvZXMgdGhpcyBoYXZlIHRoZSBzYW1lIGJ5dGUt
d2lzZSB0cmFuc2FjdGlvbiBpc3N1ZT8NCj4+DQo+PlNpbWlsYXIgdG8gdGhlIHJlYWQgcGF0aCBh
Ym92ZSwgdXNpbmcgbWVtY3B5X3RvaW8oKSBmb3IgYSBzaW5nbGUgMzItYml0DQo+PnJlZ2lzdGVy
IHdyaXRlIGNhbiByZXN1bHQgaW4gNCBieXRlLXNpemVkIE1NSU8gd3JpdGVzLiBTaG91bGQgdGhp
cyB1c2UNCj4+d3JpdGVsKCkgb3IgeGVfbW1pb193cml0ZTMyKCkgdG8gZW5zdXJlIGEgc2luZ2xl
IDMyLWJpdCBhdG9taWMgd3JpdGU/DQo+DQo+d2lsbCB1cGRhdGUgdG8geGVfbW1pb193cml0ZTMy
KCkuDQo+DQo+TQ0KPg0KPj4+ICsNCj4+PiArCW11dGV4X3VubG9jaygmeGUtPnBtdC5sb2NrKTsN
Cj4+PiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4+PiArDQo+Pj4gK2Rldl9leGl0Og0KPj4+
ICsJZHJtX2Rldl9leGl0KGlkeCk7DQo+Pj4gKw0KPj4+ICsJcmV0dXJuIHJldDsNCj4+PiArfQ0K
Pj4NCj4+WyAuLi4gXQ0KPj4NCj4+LS0NCj4+U2FzaGlrbyBBSSByZXZpZXcgwrcNCj4+aHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODEyMTkzNzQyLjIxNzAxODgtMTItDQo+Pm1p
Y2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTgNCg==
