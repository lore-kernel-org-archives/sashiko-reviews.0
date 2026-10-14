Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97229B216
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000299; cv=fail; b=S4O6qwWdBMXSxC6yQGlo1oMLnhuIOZv0MSf4YkFhlm44RvRyFHZ/Gft9ju43Ig6inp5vDjzJ/u//mZlna0smx/R9qZ0qeCDD/ZLLUF66adOq6QEp7wSEchG7cSz80r8jcsMHbWbJZgT5uFEcwR2cIadPZuXVdeenYL4Oov1sdrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000299; c=relaxed/simple;
	bh=tKRCFhzlNw+r4hn1/U0Xc81KrNcax7XBqpTzMfvQLO4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O85jfW3kxviC3GDeu2APwuCd028vQwKanhKJQjQctHc9qGMkoNs5LGlcyJGulMFDs4N+7ulLvLnbEVEQY/BeqmzXAqA7250q4hlvCOg5vMfYR6QGQ8qHWBg8k5sB4lwRCFN+VQGZU4AUMDte3MQr+dFfytrwDDxacN1s7Ipd7Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkjJQetl; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkjJQetl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792000292; x=1823536292;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tKRCFhzlNw+r4hn1/U0Xc81KrNcax7XBqpTzMfvQLO4=;
  b=GkjJQetlfdjWjmCyQ7yY0fIi9eygFO1v3cbTmduMDLXKTh/acDBBWzrI
   MY138yT/dXvCrZsOoMD5uFSjzu/f/2qX9hgsqQlCr1pEXTIAoB1/J3J9U
   evEp5g507PTouf0AOkwmwz1Fl6eJgdRFOPqWCQL1x8zfwFq+Ri8MOxWVd
   9SDke9D2tM85T48rz47UiOUj+PIKooIB4Uiz+ESBtjGIL7KCxQe+ofQ+r
   jHPf0OfIuy5m4Ho7LhtJEBueFQnmXdknOsSBWbWv7i6IaqdWU03pS1hAN
   BB3MLARTo9ZKKjQo84jbKkwN1xbac8/sMt6WNDlIdqHIXYJq1Cs+IVzap
   A==;
X-CSE-ConnectionGUID: 7ldcDm+GTPOj4f+mykNTKQ==
X-CSE-MsgGUID: Q1yEPjfLTu+5qXPAG8kcmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="760536"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="760536"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:51:30 -0700
X-CSE-ConnectionGUID: fyqhGRvjSheVGctO9XKJNg==
X-CSE-MsgGUID: cmoxinrRT5aOi5z/awzy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3234588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:51:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:51:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:51:29 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWb8mplgVrakugu0Cg8PP1zyuk51ub2UjiGlGufpoPxorCnUQY3cv7NGBfscbgbTxGT2KutCUG3XMKzYxItc4RT2fbaZy2aOVzCGmnE7PVCt+VqjbkZgh//q7UsedLrHSezYcAH7W32c57pkYIPuIsibeL1FE+nZowEyum1JmTqDw4+pWOAx3YZXvo0RWKcKoDWcyPdtiWVY6Oa2B8Ezqk/65WgIEA0f+LJW6wp0zLjHc11QUw9XI2xxyKI2fXI4E9WMtlmErXD+eTw/swb1NB+W4EjmKyvJM0Wyfbgi6tX5DKR8dJbULiTv9c4zFknmy/ztlE4q219lC7NGdM3bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmS93HeS1spL0n47whoyKcyBdoNrenjDBoNihI7f06Y=;
 b=xsPjBaK0cBPPCDswaWtySHaFL806MpPvsuDrP1hrXANvNZgM2HocNKpBrgm0k16sq9dQ18zHIy5Qbd+2M6AE2sXi7ikWPpZndogcfamt9qmmJq5eKRp3LXHRYgSfyKjTCmzH5MEpjtxZWMeW0l0wvd37ZRi31W2j068Wa6JBmYH756iChzg9BJu+UylN7/Q7T9EFQ6DUZnacwSLPP5xFO07nGhTVutoOFlSQC+xm9P/lfPRO2GwwjWy69rfKTUTQ3ysnz3ooX92L2UOb6JIrsM7z08vfGkLlekM+/vUlPv+ILBnl++96sVn/ZXCnrgkFc1n8SiKUH9+A9zotrSqe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 14 Oct
 2026 17:51:12 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:51:12 +0000
Date: Wed, 14 Oct 2026 13:51:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v13 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <as_BC39_06w-A0-0@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-5-karthik.poosa@intel.com>
 <sashiko-outbox-171241@kernel.org>
 <2348ff5c-6d98-4f9f-b4f5-1ca164920ddf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2348ff5c-6d98-4f9f-b4f5-1ca164920ddf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: f8039a76-88a9-482c-0318-08df2a1bbbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|6133799003|4143699003|11063799006|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4kkEwqYOp1pjIXcDVu7PkbOrVVE6FlmQxgUVIfuAhtXouSRYTUQ8e9R2zy/4uR4Q0hyNlSkljmZxEXUvit0fHSPJ88JDne3rXj1v1iEk0hExj/EX3kyNuf76GmuhPW10jYhzZeE5PZEQbAPNg7XWBep0puhN8lgcabUP1ZVQmi+s3nj7b37KUNTThw9LIQ3KRlem0asO8yKmCSBXo/iv2RuezGPlwAJMhuj0jqzkFtAJw3zyaLXzckKWW632BvFUXGDGI2/JnkjxyRVt0ITmw/qaVpvXVpJ4qxJ7SnU73cruC+uJIbrTqVJRNJjShXVHr7Sg1QVQzmA0ZRnU3gMBAVYYkG5CzQKlUBAmLDhJ00COfjLeZNNxc3fP84VzIInuTmeNNnr2v/o22Dt6YC7hzQ671AYBzomEhEaI7KyzePQKmyBNcSUizG/d+4bpWPk46zmxkEz81BNwZQNl/BbYjTJd6egNoPMh9HaiXnxi/Tox4opMhwTBQO8sbW8B4KQSPBHtJV7hYWo/IgsUiOAtUrUuydog6nxrHndTQmrbc6t2g6SIihks4+lPjdh8Zqh9j3fjEsopbxA5dhBsgZbpmIF1guPJZCwMRMlFO+Wc4f9xws8EPcYIMuPBc7VdoTjRifuefdMt/aL1TEy4/LrduTu4N/dpfLSVqHS7PmTYdjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(4143699003)(11063799006)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ceo/sGZBusAXTd1j2Qom7p8UoUHrhIclyxj5qTdG0DyGuYEWAtyD8Ob7+L?=
 =?iso-8859-1?Q?49dn0Z4r+OC9w6T1+vT73qdKl9N/oUMf7Kjm9BTNYzOj0v01+F0/Woovs4?=
 =?iso-8859-1?Q?Ottyp9o9w9ww9rZoOHsKp3YcnNOAiZ7mfBjfOfyiUgRtVBCHCmCzUJD9Aq?=
 =?iso-8859-1?Q?bBtfJKWXm+OPk2W4ySRjh4UdIIEhTLBhWntTVpb9F6FjsljMtK9ChyyeeC?=
 =?iso-8859-1?Q?+EFFYTeC3JOi4kdD0zweqPF6WLARZAJBImWq+yH38f/08RovdpyLzjs/NB?=
 =?iso-8859-1?Q?Vl7SXjwgsFD3QjB3woA6726IaF3CzyZFhcv8gP8vgKQOJl7pZtaC8mTgGa?=
 =?iso-8859-1?Q?sw37nkBhb+l6ma6MqfjOx3s4w6ePiuaUX6sGhbTpcZMEFeTzJTU4iXGE0n?=
 =?iso-8859-1?Q?ad3u8rMWkDowiYI5pJm0Yb1Mf9Xc8+P13in0/VdMz2Dp+exi5rZfD4FyjW?=
 =?iso-8859-1?Q?9xf0kOB+PocYo6N7/bK2QD875Momyg+wfmKwWk1XJHPRB0Oqru+w+o598w?=
 =?iso-8859-1?Q?FQNFiE2RstFashUMTLzf3wq1qFVgBQmISN/2B2mwAVAWG08LK6ggCb16Z0?=
 =?iso-8859-1?Q?OD49kes7tfcReJMuESuAEsi45oQ7U34OmqxwuhOMAn+BOPptYSI+z1r7gM?=
 =?iso-8859-1?Q?EZ6gPOPL/praL0zCZ4MAT/Yg7nSbUThA8881KnKHEfpzJnhz2lVRfKv7XF?=
 =?iso-8859-1?Q?oRe6843rl+K3exylDl4cCvvnpsZVO5QuPvTxvuBmVL+uj7VnX2VXiMBAdq?=
 =?iso-8859-1?Q?36QvU0WXWNfM0b53PF8In2ViPzjdT+EQuHpQVEVYn6JuaOufyv30hfBThk?=
 =?iso-8859-1?Q?0RPkeYQ5Xk56RAjguN1vJVDbQaZM739Q5DK/6zjN2HMK+RDQxmjiUqxcyO?=
 =?iso-8859-1?Q?89pu6E2r+oI4t5pjK6xvZ/zvWV8xuy6nlMsaqBjIEdlSkRJBvKzQy4UMH7?=
 =?iso-8859-1?Q?i7B359i6yrSIV38AKVEDfnUX94PejdPPVNw194FD3QDDgJMiiMbbgZUZm6?=
 =?iso-8859-1?Q?x4eyR0bemiosfpXtbn5bafLdWhU4Xl59amW+Bf3UDUtD/uT7S6a9QqLY3Y?=
 =?iso-8859-1?Q?ME7AvEb0X8oaV+AOOLlEUr037oVLa0w6f5B6Qjlkx4qDwtk4QjLPwgixV2?=
 =?iso-8859-1?Q?N1yeoGKeoGUI1BcvrtGEBurkdXv+HUHjLvgJTGrM9BU7L+aUimd0WYwHBa?=
 =?iso-8859-1?Q?YJlvibsSaN7rkafQkBZzdtN63xx3nVE/BmdZMohmpcRWWmRVUHSiVNYm9f?=
 =?iso-8859-1?Q?tAfSsWsNEhhyC2KAN+20xwyYJtlx84bo4kQk5pEeY3Wlq/o3G/lxGBGiAV?=
 =?iso-8859-1?Q?ACJlB+Nt+99/LwCxq6tn6XPuD0csYVQ1/NqRRwyjQlquSJrDR7nTOa1SOS?=
 =?iso-8859-1?Q?HvDty8OxxB4W/pPrJ0XDT9cuR2YsE3JRWxOF0CyUMPFo6oweoS7IvbqO3L?=
 =?iso-8859-1?Q?E9XwCw1I4a0dhq+Zruay9CsF34pOj2H+sLaDp+TVLEWYApWhBj5889r2/8?=
 =?iso-8859-1?Q?1l+BL8qNnhg+g17Qp215KXIHOMd9qSGsHcjX9XpfXD2vzhlrg/LpfkJTNN?=
 =?iso-8859-1?Q?zQMj3gZFU3g+tl57Sb+r9NSSIr+Jd6y4SMHZomsR0mt7wna+gQQvL1M29D?=
 =?iso-8859-1?Q?EH0pZw1ulmw/y4D+i/CQF41Yv77lsC7RqeXsb1r293/5t++IS/XeJbdrWV?=
 =?iso-8859-1?Q?R2vKCxDUUHg8OySCALTHhLHfADJfSL3g1124RdgwSXg6qbyHeehtXxKCL9?=
 =?iso-8859-1?Q?Yj4SN4wHkbpvYh1tXoTEde7+YLEXc4qo3ji39aK7zKZuCaUq81RlCfB99q?=
 =?iso-8859-1?Q?lnHks9kVaA=3D=3D?=
X-Exchange-RoutingPolicyChecked: b75nUP1AHXn6CLQWvTcBesV404K4YQsymSLJZ5mjYXQwNK1DV0rCosrEDisCXEIZ4kThXwL2+omIEvLvgG8MG1qrFNhPGuB3/UpOi+8hHA9oZlAMz2Ejt9JdA2BlVekj0XgfmB/4MCuhQFUV9ZNBerc2v9E9VOGwUNob9gi6XACCw0FG88MBznIPz0bwEEZqKpMpQsVp8DaQM7eM+vz4WNzjD4kVjkF9byyHJYDO16kjKm87aDP8pHmx/M6orCDBmEWN3PNz9WJNtYTG26a1uGhP7Wwgs5szKR/jTgTySGM76bkYV5wOEISF1MZNgAeTMfON/Pik15KCgzS9B8RNRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8039a76-88a9-482c-0318-08df2a1bbbb7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:51:11.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFz2oKnrl0bIjxu4nd+e8E8OnIN3LzEb86eq1XpDB1bx9FmzeyJBOVcuaYgI5VinsDqSwNNkSGlEZBYxo1L1rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
X-OriginatorOrg: intel.com

On Wed, Oct 14, 2026 at 06:47:01PM +0530, Poosa, Karthik wrote:
> 
> On 14-10-2026 17:41, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] drm/xe/hwmon: mbx_temp_valid() fails to reject 0x80 (-0°C) as invalid
> > --
> > 
> > commit cc835292455ece8a38adb02fe6e4c345fc3aa89a
> > Author: Karthik Poosa <karthik.poosa@intel.com>
> > 
> > drm/xe/hwmon: Add helpers to validate thermal sensor readings
> > 
> > This commit adds mmio_temp_valid() and mbx_temp_valid() to validate
> > temperature sensor readings. It uses the has_temp_sentinel flag to gate
> > these checks and rejects 0xFF for mailbox and 0xFFFFFFFF for MMIO.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > index 1b4efbf4ac999..883a0ae1d90e3 100644
> > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > [ ... ]
> > > @@ -834,6 +837,30 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> > >   	return ret;
> > >   }
> > [ ... ]
> > > +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> > > +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> > > +{
> > > +	if (value == TEMP_MBX_INVALID)
> > > +		return false;
> > > +
> > > +	return hwmon->xe->info.has_temp_sentinel || value != 0;
> > [Severity: Low]
> > Does this raw byte check fail to reject 0x80?
> > 
> > Since 0x80 represents -0 degrees Celsius in the sign-magnitude format (sign
> > bit 7 is set, magnitude bits 6:0 are zero), it evaluates to true here
> > because 0x80 is not equal to 0.
> hardware will not send 0x80, so this case is not expected in practice.
> > 
> > > +}
> > > +
> > > +/* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
> > > +static int mbx_temp_decode(u8 value)
> > > +{
> > > +	int temp = value & TEMP_MBX_MAG;
> > > +
> > > +	return (value & TEMP_MBX_SIGN) ? -temp : temp;
> > If 0x80 is passed here, it decodes to 0 degrees Celsius.
> > 
> > This means the fallback safety logic in mbx_temp_valid() intended to reject
> > uninitialized 0 degrees Celsius readings can be bypassed if the hardware
> > returns 0x80 instead of 0x00. This could fold invalid readings into the
> > temperature average.
> > 
> > > +}
> same as above


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
