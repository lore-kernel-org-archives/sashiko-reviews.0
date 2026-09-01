Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384A310784;
	Tue,  1 Sep 2026 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252102; cv=fail; b=fi3FHWgAdKtf1/8GSf91IMF+AzvAKyeyfsr9/YJw6ksjFa3ZIPbE8aR7tH3VRx5PAn1InqEE4bBaOgSkfuQXVWs39ySk14t4oyuee8xXjpDMbwXtQ9MtXC/PoxhqZAnZTCjwn0DF4L/AWh6lhnOm80u0E3SeEtrzniBCP1fVrjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252102; c=relaxed/simple;
	bh=ko2R+Q6RbLrFh/ECLr6u6vPJ2rkR1+G4RqMKMT4kU68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq+sePsAH5l6UioCdxLPwclBGs79YwnZosNQIw4jqT6Bfblk1aYfZhbxbvfPTREEKe4AUJVUxjvkoylvVcTXh73DlZLL054KE8qAZLVdY5iCKEwZ7bZOc7VBdzYLep+nAf051PTOE+uYsKQERqkAeLNlsQHPKp59AeZIOCkZZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MQui410s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i4u96pmz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MQui410s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i4u96pmz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6814pQir2167073;
	Tue, 1 Sep 2026 03:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BJPC7IAQVVMwJeVlZ1
	LgQkV/NIAJEnVxYPqoQFrA5CY=; b=MQui410s72WX7lKWIhwbdd3Lscclsoqe/X
	gERGeaIPYjTIMvdsOX+WvQ2+PH36Zz6cl+wW5AFEVM2PayO+D8AlkLpiUePpGr7K
	u0TbHQqWGc3Zf5/1YTN0U1KJuiDaxaWjya5YYmmoQ67cnEeSMNnu0Q9MwhH9WqkI
	2zOPXrvAphYNEp8PVvew/HZc+65/aYdG2qf5SuXPHqRKCMXGEgMJagb4oE6HMVxJ
	haiFuMUNB7Q9rZoYy+NFUHXMDuLO2fBo7UAJM5S6YuiVIiXf8+Gjtt2zUAvMqF6A
	B1w3OBkBHbkCqbAI592HryBTa0pMqRJ4DqGyDdOimlaVIEdW/y+w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020112.outbound.protection.outlook.com [52.101.61.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh3f0w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 03:41:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXUf13g0ikDbGO58ERbDnF7F2j/xZ+GwMOtGuJkG7iGuVOpa/b1w5vnT6eaJpxos6FjCXlmHTljgy5QOUTYiveXpQt+AL+4uC5VkqxUrwyK9Q4W5sDLNWu1BDfaojTNrnHMSnJkJhKog1vLisphxWasGuThMF8MZPXxCbTL8zxbti7d0ZmnP0zO2lxABa8+5UDrLSpEBVPULgAd8tyIEK+SE6PvEjbwH9rRjM1Ks3z8GoWIThh0z5tlj2OZl/XhE95tSVYs/HsxQ9mqvtx68nGHsYWC3W14UrXb7ZAxNPpi91tErFGv/kY0sfNWVhTMhRJsWJyH4Php1ka7ze4xdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJPC7IAQVVMwJeVlZ1LgQkV/NIAJEnVxYPqoQFrA5CY=;
 b=rAvwRzFCr4Ai4YgtWoTHIl0ZEYrltb/6wJ+OOAupk93Or6rG3RT+s7yQ0smC7MJkFGctW0XuZY4I9tFHiiyYmd5rFYm1WFjPxT/g98dKgw2d+gPMBuracKMCoWyfEDfQizwqKWQ0THIxSBAH0Z+KU2tL724MEmjfzV4YZKd9DTg8SRy9iyqnVzIw8XBqyzyerW17tDGnxC34aI/x5Aafe0dAMGF9Gc81YJFK1OOWAI0NEJ4UeEAc0/Q4BdpR8174zmsrkj29JKQ1mn5DocDFH8UuZwsteeewmHRb9wbGc9OXgAmNx0y8byfWKeuNkZ6Jkdzt7gJpCowry0c+EAs9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJPC7IAQVVMwJeVlZ1LgQkV/NIAJEnVxYPqoQFrA5CY=;
 b=i4u96pmzkbCsVdf2idoWQUTS9X/OPBlKbU+fwRDcNf7f+UfJRuvzUUYdMsOAq0Zr4FJ0h0LBnWcxJLNVPPULe3GLJxHokhO7GOmoHcGshzso9dRcQ9JNlEnKqhnU/5nWT81kECI5saLPiGOdf8h4/AHsvrDvSLBz6AFsxkHd84U=
Received: from BL1P221CA0038.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::9)
 by IA0PPFD89007390.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cd1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:41:21 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:5b5:cafe::8f) by BL1P221CA0038.outlook.office365.com
 (2603:10b6:208:5b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 08:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 08:41:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88A1E406544;
	Tue,  1 Sep 2026 08:41:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 74615820247;
	Tue,  1 Sep 2026 08:41:19 +0000 (UTC)
Date: Tue, 1 Sep 2026 09:41:18 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 1/2] soundwire: Add a helper function to indicate a
 device will detach
Message-ID: <apaPrtVYpG19GVKR@opensource.cirrus.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>
 <20260831175145.9CD581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831175145.9CD581F000E9@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|IA0PPFD89007390:EE_
X-MS-Office365-Filtering-Correlation-Id: ce29d0d5-91a7-463e-3e91-08df0804cc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|61400799027|23010399003|36860700016|82310400026|10067099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	oaTaTbsix8m8ya1Lg7qRfOjZQYnXyWFDVyq4SjPDilUcxcbCRS0nnA30McXVTOWw8XaYACJneKc/OSKEHGyH0cnvhMXVvGdBSfJ6G5Db/0IqPMZLXr0irfJbpAXjdzA4f79nqLWMlvXx0KOfYq7TIwin1gp2fu4vm65qeP6cAoS3arKyxWvYIykRBDJE7rnA02dv8VfXf2M/FgsQ4iHCCXj3phPuK19FGymTetZ26wSKaQaI4/o28hOtdA4qD6Jo73uNPfMfOFWHy6MPOTY6/IZAQOWVaHw3yehP6J1FKvpE+ROoNMIF0p9G9zP+cx/+dfJIS1UPu9NFGv/cs8XD2gBI5mTuxt4eYarc+VcdBaMynIs0pNEJxFyYQbcJaC0b/ZXI9PQiHpCTaPInIL+Iy4K6PPnM2YXEAOAO+jKN/4wgqHqAEsPHOnE+D9R5n9ZR/fp6G6YoE5ZSlP5w0BfFsUzIkgZ0Ki8MvbecFpmsgA1KKw1y2NYhu3qGPvgj2hlxXEIPlZLqLV91nNMSNruXTiB0QK+rLdsNLfhSgVUqV5YDHmoNXQY34bwHsojnQKrHD17L6RvP9M9kxd/v/S45JANepPN+KLxbeVZnwNsFGyxIj0CVI57NqyBhA5auJ9hrEyOBwMY1yRnvqqgKrWM2tuSFYE2QjVZzIXHtSqpeUFIO9FE2jKsetv+PEDBHE/TZg6l1r5FH/v7QBK2ISCH+tQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(61400799027)(23010399003)(36860700016)(82310400026)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BW8lfgnMdUW1TtOSjushqM8hCzJY0PPDJ5/254UPUHxQCgRi2yhlsvWLSnMudeNcwZkbaA5XsFnQTYCr3W4i4L6o2RSlfmuJlIEr4xBsFvDcDFsJw0NS1ZXFk8aOIZeAkwHIFQulKZnbssCRHMjLUfiXip9/6xd1gpRdSoJPicQiLka8TGho2wZWij+Dm62XrVqVtP+ywm7QQBG95ZopfH9FJgI5xdGzpZN7rsHiudG4YHFcyrcLMI0G01eO4U5ao1yNGLxg/suG/0M8Qu/ukW5MhMXOjIfcRDIkZgDkIaUKwYP7y95IsLFLTBO5QwLbCyrQKFsSMYG0dn1uWpowD7vUdriU/j2NBeUHAJ7fAtYrYISfeA4gC4Blr77hA2KM/BPqltRJAezPLWtndGm1Uu2TtLnlevk2w+13EvqeYUpxNWfS7xEJTIz+hxxUEwEC
X-Exchange-RoutingPolicyChecked:
	ZLG3VJuD/74QH/vJSWCknYGI4JmEAbMD2XAg2HGIHjfmCB+k7vXJtPv3ROXTVys1Rcs5zmVhko74CwtzrwQ9JgAPM4x9PhgWEmrJpxZtCIQ9y1ubJIc8EkXhm70wQgVpGGGG0EPpBA20r0MjgjpdxHroEAB0pQVEQYnMrMbaH9OavWaBTMwdMGtqUKX8w5n3MrVr9TA2m5fjtk6sChzp65Zya5pjzrIv9XtUTKjXrQFZCVrpf2ZesOPPGM4BLgNk5t9HBtXkXmGbxf2oH1RZsYF5WzzQb8PjeG4eoxoS9gqIql49X+5Qe2qdiWnur9dhUklvqyxW9MgL6D0Ed4F+yQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:41:20.8941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce29d0d5-91a7-463e-3e91-08df0804cc57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD89007390
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3NiBTYWx0ZWRfX9r+YVuFgP/zg
 vGHnMl/T9IDsm2USozy8Vf2czrgCN+6aYBo+Bq+PvNbkdFthNc/ct5gv3e6q3MpjpzLwQ6o7Rgd
 M4g8y1Wa0OYRuBuB2ld0uxs6YhicEyPV9jCR9Uvk3jgzT8SKmdHduv/jnmPLYQ5eCpw4vQBdtJs
 jBvAEFI/jMPY0TCGUGNd0Qq9KTDOcr+HCM/wp+MJHtxL1UBGnx+FvhcSN3SXtvsQBVQvews1tcj
 gduXRQQ9eEgKTBAlpJJ5CJdjDiThoellHt7+nDmLqPrA7M0EE62tOEUrHJSV2907+VJV8lE8agc
 8Wc6uJVVJ+jlCFFLPqd889g7Sdcw01B57dUYxOY5Zy6OEoQyxoURz8ImCG2xVEQb7PCBRLGghJh
 T+VNHebs6OTxvcAKTm5ICTS39ra3GyMYHusB6zGaYTGwuhKwzv3saMMEMgS80miKB9QAwmccb8D
 RY5d4raI+lVRuZ0N67g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3NiBTYWx0ZWRfXxQYY37gcZptK
 yim01Snv4w214vp60DVParhBGlWSmpJCb97U8SnLJwz/PqAPDbh1znGzjJ1UmOHTJYsp54ZXDTj
 SpyPnp8M7FZTAq0hBT5aMOgMtb5ekik=
X-Proofpoint-GUID: 3lJu1QOkCFBBxwEu8064G4VvaxNKYzbR
X-Proofpoint-ORIG-GUID: 3lJu1QOkCFBBxwEu8064G4VvaxNKYzbR
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a968fb5 cx=c_pps
 a=xiYOG/ZI8GhAbW/PPonVsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=ag9wvhxpiAUrDwjAiL4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 31, 2026 at 05:51:45PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -1214,6 +1221,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
> >  
> >  #endif /* CONFIG_SOUNDWIRE */
> >  
> > +/**
> > + * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
> > + * @slave: Pointer to the SoundWire peripheral.
> > + *
> > + * Inform the core that the peripheral is about to detach from the bus, this
> > + * is usually due to some implementation defined reset mechanism. After this
> > + * sdw_slave_wait_for_init() should be called to wait for the device to
> > + * return.
> > + */
> > +static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
> > +{
> > +	if (!slave)
> > +		return;
> > +
> > +	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
> > +	reinit_completion(&slave->enumeration_complete);
> > +	reinit_completion(&slave->initialization_complete);
> 
> [Severity: Medium]
> Could this lockless modification of completion variables race with the
> SoundWire bus core?
> 
> If a slave driver calls sdw_slave_signal_unattach() to initiate a soft reset
> concurrently with the SoundWire bus master processing an asynchronous status
> change (such as a bus bounce):
> 
> CPU1
> sdw_slave_signal_unattach()
>    reinit_completion(&slave->initialization_complete);
> 
> CPU2
> sdw_handle_slave_status()
>    complete_all(&slave->initialization_complete);
> 
> If CPU2's complete_all() runs immediately after CPU1's reinit_completion(),
> the completion variable is marked as done.
> 
> Will a subsequent sdw_slave_wait_for_init() by the driver return immediately
> instead of waiting for the device to re-attach, causing the driver to
> mistakenly communicate with a detached resetting device?

I don't think this is worth stressing about. I think it is
technically correct (although any idea why reinit_completion
doesn't take the lock?), however we don't really expect slaves to
just fall off the bus. AFAIK all the current soundwire drivers
will exhibit fairly broken behaviour if the device plops off the
bus unexpectedly and this function is informing the core of an
expected detach, so should be called before that happens.

Thanks,
Charles
