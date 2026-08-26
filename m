Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AE2472AF
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787706005; cv=fail; b=qbPGgA1P+IjEeN8NaNIEwTKAZMUb4B+pT/0T9PRlNEgqA7nJ3qfQeQzyMQ9bPkVm9a2eW7K6BgJBz+KxYG6byk7L+HE3UDuF9EcJz13VRE6I6WB8Z6jp0z335iAc60NtJ8oi9w6NilZnY/Z9Phny1MO1oRFho4GUls9KJmw/0ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787706005; c=relaxed/simple;
	bh=d+6az7AAl/MV0AiFkqMxBQpFMtKjjMtsoWxCq1ZBKsw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iRa8xAdUikbSlyi2Vxut//hUfJ7A1klvD9WdKQ0jRoYLSvdcC2BxqJx33LpIe4pDxdNHH0D8vSocNhpjmNYjrmiUdXG2/zsVBpvILKw10tQWIrGZmcHrRKqsEDp7Wrp5jXfrVj3hm+dT384GlsiIbaHPXFVnNlVCU20Rqb0OKBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEo37Eqt; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEo37Eqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787706003; x=1819242003;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d+6az7AAl/MV0AiFkqMxBQpFMtKjjMtsoWxCq1ZBKsw=;
  b=CEo37Eqt09dJneK0VRmmDIU2uzuV+1x9DYaqWSIQJrlpc49I3S383Poo
   kLgitrkvLJdqPVn9T7XYQuSz9WdJ1lbfK17XN5Mk28FX1QPG0OOd1JBKh
   JfjeW5YSfAY8A0fxE3Upveifyrj3QdVZU23D23nt5hovFzpIRloXzFzmc
   fNibarHARJFFSwsLTGvNUasXm4JoLN/P3PDkrpvDWfjzo8cFGVWGQK+WX
   kdsTkghJJnP5gnK+ERHyabYUnofTm7H2FmxAuvEvVuOqI5teFf2vlk3iR
   zCt2br/HNhZ08UG2iyvHuMMy7kLIjXWgxc1Z8T742yfngpUH7sW5aEdRI
   Q==;
X-CSE-ConnectionGUID: Ej34R5sbRB2512CVc+DNfQ==
X-CSE-MsgGUID: G9eMcnnjRAu2MLfNX39ZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88103987"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="88103987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 18:00:02 -0700
X-CSE-ConnectionGUID: hS+JDPCpSnmiQ/n1hmdPQQ==
X-CSE-MsgGUID: B3xHag56TtCEzkeDG2y34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="270923006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 18:00:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 18:00:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 18:00:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 18:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHiI9aciG+uo5ckeKjV+gzbnRPijE9JInYM4S4yU2kVQdRzzClKV5Eyb1Iovc7VgaMnNZey0vyjHopCgjcGBOCvEe2tsaZ2Y+dfOzROPv6hwvg3GPEj1VNhedjFuqEOphD1g/JCGTDBUHG4z/E3yt32WkfOju2npfp/B8h+EsNod5lCtc26KEAX18d/BzW8q5/Kzb1s4pu9IQ94TZ2KUCCraVpWWv6u+G13hwwG6w7Ad7Cugh9rshf/u64u2xqeS3BF+5upZAMUjp0YSdka5PBkqQEgnLRBP2Y/9tHS5bbz666MK5d3BejjnjVoQcTSzdNYvNFTjfI11ZkQ1S0LO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58FaTGtD6CnG35PzJ5A1kSNJIPUATsjrxhE8XAWCPK0=;
 b=TWLDopDTueqM8PRNwJp58xeldMSHTf1xSEzN8YefZzSmF/SnTKJ0hM2OMeW/IfSl5ARjLWQvwzBEctsvzXj2XX6zBD3XmXJIf2zc/dI6e5cIpsaTOUQ8y2xQ9jjt83be60DEIEpSJ9Q1PC2zB3YN2z42XCuS/Ho8rxRdO2cxmtmwse4fz63G53HqXV7yrKMDW6VnvapiGSTKUtoajdMuifcQ9E7Wa36h5p4My+94QIbJ4g24iXq+Yxz9YrRjIWZgCTzr42Ie4ywAoHvAwgzro5nZRVl0hgyH/gT5iHKR8jDdaL+AaGK/kZJdnNWJAqpNWxrHf6eLoiyE3agSlgidUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 00:59:56 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 00:59:56 +0000
Date: Tue, 25 Aug 2026 20:59:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/11] drm/xe/cper: APIs to prepare and log CPER record
Message-ID: <ao46iVYl0bHTNKbk@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-17-badal.nilawar@intel.com>
 <20260825180219.0EB5A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825180219.0EB5A1F000E9@smtp.kernel.org>
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS0PR11MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 3373eb6c-6cb8-4af9-cc57-08df030d5881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: blJiaETfu7r5z6W5KPMZUYqoYycHTuDfdYNJA/LenaJVeZaLWDY8PSTR5jMCOABhJ7Hfwm2mnotx0xjo7QwSEUEPY8W6/ZASHOkWxkC/Gj+PNM4EGEas71+/7Eus185h40Aquv5yG0Gl0z4OayUboNgt6R0z8E2VrZscgLlhNP39o/rX9mbEjoRvnmlZAsgSGPHiqVaWQ8B4GVzi0whd7iazOC1OiMd8FZv+TLdG4FUlUfYfZpHj42Y17+DVKW0Zr3Z54V1BvUJZtAEa6FUlTXAwLSxZ0fPohlAAthA0ZfEAm4KISWv1MUp6SGYXBLGzKxWbg8JeDUUGQi68/E9YoertN2tVJ7moEUy/mtNyYv34Wh9j1c9/me+6pp6/kaxuTERDF/n/iCs0IkhHW5a8aIsjTBR0eJsKGZFBJ835jQInF77C0WRKFK7egz+UC+Z8QXI87Y//qrykiaas1vDe1OLNXUk8YUW2TuQy1x3aG734JpfgDUzqLA91uPNzwl5sT2HIQadu3NCtBj1fCLMw09woBRrgOjuE0O+0zktSJCgBuUYqpEHEWjBFLzz1JhgPEtcv7g9js7k6dnByFCgHMhQ2uaBWr3rXT182iizbMO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hCjs92PhQMjRS+2jHMPDD+AGnUdSIx+Wa9JavdjrTjewhvWpPeLej/QIyu?=
 =?iso-8859-1?Q?N60vIwrXsiThIVOyBvpp0KxBoqa8ug6n7Nu7CmTaBZdp34bjSQMdqDfWnt?=
 =?iso-8859-1?Q?E199sdu6XlcUVFsv2s43dkD8TILizSqF6A1fUkJMBHMbJ715LFYohW4n74?=
 =?iso-8859-1?Q?5p5NhLGJ+3srWkajvAws0GwlUt6Y38EHdXxoMwjFW1qVYCd8Dz2ZbMx3si?=
 =?iso-8859-1?Q?qHKfb1rrhXClRR+4GwRTt5TBeKwbhvaG5+6cJsyIlZSuhy2uIcotax1CBJ?=
 =?iso-8859-1?Q?OK+8yWW+UfXDO7E4CsH7EdBfoEB1DoJ0yZlCbY+maY/PNMcA6MegX4SyHY?=
 =?iso-8859-1?Q?udpDYida7eAHHC8GMoZj/GhO/6hdZSOc0Ps8+fH01UjoIagUPc3iSD93tr?=
 =?iso-8859-1?Q?OFdFsYhXim4a6R8lSuiSBAJ6yaS8kD/iwj5VBMLFm4pmv56ElDSIAD69KM?=
 =?iso-8859-1?Q?aw7ziVkP4b3F8BM2hsVhq5MAIh8PNqwaLOiwUr8KXqyfO1fxv0w0wF7Qwj?=
 =?iso-8859-1?Q?8pyvjqpbNi53hlPIU6VsktArt7B8JlFMAJOBPXIxVOn5A6/+nyFi7FHBMr?=
 =?iso-8859-1?Q?m+FHun3XK8XmAQcRe2cKwNXTX02K0bqvxyDBaRQcXnB3xodvALFJjnrOY1?=
 =?iso-8859-1?Q?nbm5J911GrrvU0bKQvL5c+n5xMyb7aDamjyfzs7f4UBbPSu28GnwzrN5mj?=
 =?iso-8859-1?Q?g0HXmaeWIowZIXepspyMvAOYe9YMuLYrkW4nEDtN4u0DK2+78v5rR8qouV?=
 =?iso-8859-1?Q?osmfqoNNgcLEuTFfOoD8PmcmLF2G2s7Zx2cNC7q8RzA+7xHNr/m+X3kbxQ?=
 =?iso-8859-1?Q?HqsNrjG14s+r1X6QPvssdtcCjnO/M/WWEh/LYUJsCMj52qfuiQSjs+Hdh5?=
 =?iso-8859-1?Q?5UZkgeYFziVA9FPjhk/3Jq7IAzUxwZiqGy/jAoIGi2TvAcM6yECsCRz3Wl?=
 =?iso-8859-1?Q?FIuOFFN9UbQIJ9KRnIlsaGGRpm03RVF/Ohl/EhLOb0oJuK/cVaPshypv6T?=
 =?iso-8859-1?Q?HUhMe7S7iqg/Fu0Qj0D7+CvGVNv257TDDR5AVCOuNboSRWd0UuJzBfXpOA?=
 =?iso-8859-1?Q?O9/XfRp53S1a6uz5rMwXG/ebPyC27SY/3na6yKy5v0AfoBC/toWq7YmDJr?=
 =?iso-8859-1?Q?aoJ/dhHh77S1CkD4GgxFwcyM8NKXMI5c1nq6C+v7RsiN3Il+dOLWxCNZUJ?=
 =?iso-8859-1?Q?LrWdCA8aaV329NIBSnc8WUrWxGc4SEPObMTMpuuM737ywl95jTQs1RONOv?=
 =?iso-8859-1?Q?kdEav9FTejFLqFxX/4QZ4GdJn6BtCS6dhPFy8MecoTbKd0zWK/rWzd3kg4?=
 =?iso-8859-1?Q?F13gs86vYC7EZhou9DSUhXSwrilbr+000kX6bAngaDvYlC+XiDM64HZxjR?=
 =?iso-8859-1?Q?tLSG+EsGEkJOP7IR2CzqUGbqir6p/G2fjFdFs8zTBCQL0bBOugAJHMBkEV?=
 =?iso-8859-1?Q?6Axmfs5w2gYw83BsVqe85kpYs2jnqQ66mQ5kUCnsyDMLF29TZUfy/i1e1S?=
 =?iso-8859-1?Q?3okFAIfXzKqyD0EvjBx1yY6ZL/3D3yf8CmLaamHLt1v8InKc1GESfBAvwq?=
 =?iso-8859-1?Q?KBGCYxNOCyQtfux2QfxNVEUY5f0spcc1ACoF/JysXRAX+FWZNbqa7eppKU?=
 =?iso-8859-1?Q?iF52AXMea0KsG6zBi2o7wMiRbfcQRMMFKo7zQBXijqqkEPRafDvz+yOpsV?=
 =?iso-8859-1?Q?BTD7t9m3IXa3Vp8gspHnFzM91GSFR5BV2+yHT9YH+IPNCWr9S3NeeoH+BU?=
 =?iso-8859-1?Q?aSwSeHSeYczbbgHi6M2VoYj83O2R1ZBs0LkxOTeuNACUP0OweTZCrYuA/s?=
 =?iso-8859-1?Q?NN5mM9Xv5Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: IEMDn7OTHd/7wAUdFg8WZvEAXrukBuYzUVZZ8GoKtc/IMPkKEwtUJmK3Z2if+OPG8eId1IxziHKdLil8FbX+c4WKloc5K6Boqr/XlkFCKl1JSgGFuUJKihdo6BGrZw6fUft3GN0HZQFQbIEKcx8OwwMoJv84HvGq9OWRfA7t9Xna3guSHZTFbo3mc63dkR9j5ZesEU32U5MrPCDFei9Y4n3gJ4OXwzwEBBMwl3GkmOKKS/FFw7b1Y2iaQqSGiMUkhiLBA1tVYm28CTFm9mKJckqHHJWOr5MXH+tUtVcLKxXUu4lxe7oLUNexVA6gSUXLZ2sXk4HpERdywlxGEz/hEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3373eb6c-6cb8-4af9-cc57-08df030d5881
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 00:59:56.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCdmMh6pYTTXhyMs1otn/ce9XwgZ3xPPqXdRvA8T1R6VLj4oKYEp7rw/d90BsbjhgDZa7vPZG7pYKUqzELBiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
X-OriginatorOrg: intel.com

On Tue, Aug 25, 2026 at 06:02:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional dereference of potentially NULL `THIS_MODULE->srcversion` causes kernel panic.
> - [Medium] Assigning `ktime_get_real_seconds()` to `rhdr->timestamp` violates the UEFI CPER standard, which requires a BCD timestamp.
> --
> 
> commit 1a8a9f568395a2ce2ede1bcececcf688f5a25b63
> Author: Badal Nilawar <badal.nilawar@intel.com>
> 
> drm/xe/cper: APIs to prepare and log CPER record
> 
> Add APIs to initialize Intel-specific CPER metadata, build a non-standard
> CPER record, and emit it via the xe_error_cper tracepoint.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> > new file mode 100644
> > index 0000000000000..371537052de35
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_cper.c
> [ ... ]
> > +void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[12],
> > +				u64 first_timestamp, u32 sig_id,
> > +				u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
> > +{
> [ ... ]
> > +	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
> > +	ihdr->valid_bits.pci_bdf = 1;
> > +
> > +#ifdef MODULE
> > +	strscpy(ihdr->drv_version, THIS_MODULE->srcversion, sizeof(ihdr->drv_version));
> 
> [Severity: High]
> Can this cause a kernel panic if the module's source version is not populated?
> 
> When the kernel is compiled without CONFIG_MODULE_SRCVERSION_ALL and the
> module lacks an explicit MODULE_VERSION macro, the build system does not
> generate the srcversion modinfo attribute. In this case,
> THIS_MODULE->srcversion is left as NULL during module load.
> 
> Since strscpy() does not handle NULL source pointers gracefully, this
> unconditional dereference of THIS_MODULE->srcversion in
> xe_cper_init_intel_err_hdr() could lead to a kernel panic when hardware
> error reporting is triggered.
> 
> > +	ihdr->valid_bits.drv_version = 1;
> > +#else
> > +	ihdr->valid_bits.drv_version = 0;
> > +#endif
> > +
> > +	fill_fw_id(xe, ihdr);
> > +}
> [ ... ]
> > +void xe_cper_record_emit(struct xe_device *xe, u8 severity,
> > +			 guid_t *notification_type,
> > +			 struct xe_cper_sec_intel_err_hdr *ihdr,
> > +			 const void *einfo, u32 einfo_len)
> > +{
> [ ... ]
> > +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
> > +	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
> > +	rhdr->revision          = CPER_RECORD_REV;
> > +	rhdr->signature_end     = CPER_SIG_END;
> > +	rhdr->section_count     = 1;
> > +	rhdr->error_severity    = severity;
> > +	rhdr->validation_bits   = CPER_VALID_TIMESTAMP;
> > +	rhdr->record_length     = total_len;
> > +	rhdr->timestamp         = ktime_get_real_seconds();
> 
> [Severity: Medium]
> Does this assign a raw binary Unix timestamp to a field that requires a BCD
> format?
> 
> ktime_get_real_seconds() returns a 64-bit binary integer representing
> seconds since the Unix epoch. However, the UEFI standard (UEFI 2.8+
> Appendix N.2.1) mandates that the timestamp field in a struct
> cper_record_header is a 64-bit BCD-encoded date and time value (Century,
> Year, Month, Day, Hours, Minutes, Seconds).
> 
> Assigning a raw binary Unix timestamp to rhdr->timestamp in
> xe_cper_record_emit() could cause standard CPER parsers to read invalid
> BCD characters or absurd dates.
> 
> > +	if (platform_id) {
> > +		rhdr->platform_id      = *platform_id;
> > +		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
> > +	}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260825175916.1103841-13-badal.nilawar@intel.com?part=4

please take a careful look to these... but overall this is in the right direction.
