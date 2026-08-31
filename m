Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5AE40963A;
	Mon, 31 Aug 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180307; cv=fail; b=pZP5N7PK/IClgziiQ3Zx0I4UT+PQ3M7IUkt3shrw9X52s3zv1coFyYR9ubwe9P2W4rLfztyXcuMpgnGMt+UyBEEAypGViyfALHy7BwZjfi5aTyZkVFEIY7Wu+X+kREzdn3e+3qDvGT+80BG1W4vWwQw8CmdcSJU5CboIVCTccLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180307; c=relaxed/simple;
	bh=C0+GByQ8ROvTySGabc9GclrWi3qWfUdCT+qO0+N7j0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJ7w6qH90AzbMhKPoZgfaHIOlutSRmea5dwCnqXr7y0SyqaWrJogBwJicJmH0qoCXh6QjjwxaEiV14v6bV5FFEgVlT45m9iRuDR0YRwiv4ebKZVqRg+BFWtkiALg2woFV0OF+u7k5ET4jc9k3H0RsvyQQ4GmtLoVrtGd4ykzhKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JtXocZlw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vWF7+TpX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JtXocZlw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vWF7+TpX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V41kKd1377116;
	Mon, 31 Aug 2026 07:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=WtsNwO/SG6NyRJiwsf
	7liC9Kai5pT6X2Ui/WIdmonPo=; b=JtXocZlwGPFU7EFWpXnAOxqHEfc9SBVaSG
	a5qUdSQ1Z3E3hxUTS5HramnW2Mqqry1H80PVSIJkF0ii49VWrqBWE42+Txt5vBgY
	XtuGJW2/D70cOrCahQ+KGtbt5d0s8vMbDYb0PBohn595azf/2CT1+GF9GSW3qrL/
	GhIREvA7hubYSuaxTM/h/+14WnwYqySSygVg0xJlQEczzQftXhPOrAkB5eNAWWrL
	XISirLwO3++JR9a9LzKG0lRRVJV/UcZfVk1culGQVYuC3CFZ0U64CAQ3yIujFR2b
	0aYYVbscqXMDTZIjeiHKd5E4P4KWevxQRB+jTb4pfoVgA7uODrPQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022078.outbound.protection.outlook.com [40.107.209.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyt2ax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 07:44:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSJTnJsbChHXBbvoQ00xXuytyEHrgtxAqmzPbW31cVwgQnquEyApca7CcBTv2EGiKetJgjwqLeOWqdaVw7QgxsYboHGzbv0IczowMvSCMf73rClJBt3Iqtzb7K6anmEv8y8X6tZlXkMYcRGEEKIB/2LJJirOYTqtoLbhnrdL9YwWvJ9bZjXp9pPkoxkhEkexZJt+6J6zanvHE0nTdFLu/UUuXGuxAxaY//f9Q3SKkumEx2MrA371ShfciULfKJ9tywDC9BWbmIQvfTySQAqWzUjAgEvshHLazCKfKhDLupZ0NaTiarq3PUu0y3DmghHQaOmnswN/q2dXVbK+YDzfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtsNwO/SG6NyRJiwsf7liC9Kai5pT6X2Ui/WIdmonPo=;
 b=xV3HaoWiOnxu7uoKkC5BnE/SI/BNiDRQZO0qeM+2yjUHD78DRLbAEcqlVzJK7LNrlTDQ0s6B0U/sUp0gr410VHpSOgt6bRlFaMg6hNW5g0+bHDjb7ZC63yeXvTZNH4+anuzCVMrySkDRs5IkEFMX/LrhQyDwfIK2oTWJwQl4mJT9LEmepKXEDSniTaSnFRBtGHO2rK7x984v29c/SEYzt9Mls3N1hUz+AHxlSgC6Dkg0Aj9X3ZCgezJTM8NLu64+XucftPbPClszpvayz49pvRVIqqo02kVgljdtqqIvYI10rEIxK+ta7bRUeAPC10Zy8jSsSDNl699uo5mQgAQPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtsNwO/SG6NyRJiwsf7liC9Kai5pT6X2Ui/WIdmonPo=;
 b=vWF7+TpXeEYIsDNBPAEnXk3E9n4OlJquvbSM1rSV0/uAKtRRDVsCtJI+/yr8WYRao52IThK58sQVH6rXfWA4xyg9vwm/N7kvng3kKgJE/hBG9L1bg1uXg8kfsXpSI152JafofZ9/4DNpMJmyzNY9U9u1imegmB6H0ExpcyQc7rg=
Received: from SN7PR04CA0218.namprd04.prod.outlook.com (2603:10b6:806:127::13)
 by CH9PR19MB9683.namprd19.prod.outlook.com (2603:10b6:610:2dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:44:53 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::1e) by SN7PR04CA0218.outlook.office365.com
 (2603:10b6:806:127::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 12:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 12:44:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88B67406544;
	Mon, 31 Aug 2026 12:44:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 74ACB820247;
	Mon, 31 Aug 2026 12:44:49 +0000 (UTC)
Date: Mon, 31 Aug 2026 13:44:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH 1/2] soundwire: Add a helper function to indicate a
 device will detach
Message-ID: <apV3QNkY36GmDSWQ@opensource.cirrus.com>
References: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
 <20260831115019.1616202-2-ckeepax@opensource.cirrus.com>
 <20260831120348.7F3241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831120348.7F3241F00A3D@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH9PR19MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe6a508-3878-44c5-b489-08df075da655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|34020700016|376014|61400799027|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tLFK632p3ul9IRrCknmsI7SKX9v/ieVQflURSSoeqW5tQyy6sUhd2BE8XIjwHknJsihcfH9VqBIXENsk0FGN8rAohmegGF5zut8BhaRG+fC2eIcddxLB4WueW0GTRJpginerc5bLUADsVY+1rpsXC7qk96MzDCnoPYnGprIfk2doej/hPdgF446ZOhdHlZUHjLgOoukSgurrHc+XDc0sEIl2lGwYOwBqcV4lyX8ru1b0unsQpjfhXOMBewSeLkYNNbNDkZT98M+uj0NpS6cfvRf52YhjSBfri/KuYGzGQ+EIHJYSyo0cbzbB5t6ggbV4NheG6J2wcSrj5c88vrVJzv65TvMJy7eKq8Nnxf0K16v2CK9MgkiDXg+EJeztfgDO1TTWBHcaY90sjVxJwSz6rj9UhP3LwYkMewsCH5IdexIGIwqvfTbeiDNG+CrdqhAvjOPd3xh4AeSkRpUp30MQLTHs1ZlLrRFyz3olvz9cnwbrXkHMrGSzNJzQP43zFE7XsHAif9v/NY5kwqUKKZ2mhJ0z8Qqplzvzph+ImRg9+nT+Sey0tAHgQueZ+SCc3RlcyomPAmiXGluOBQauXKmb0JxykEdIriVoI129Gw9vSTW+0QGpn3S1qa2YGCzbW8yh8vamegekVBiH2h0wAqJOTU6VC4br+oxBGpGlXL9PFjbuzyDXMHC+NKu+KuJ+ahclUmR3xJI/6kezYIt1uVKXnQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(34020700016)(376014)(61400799027)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D4n6oJaO63IY+EQ9fD70j962kSx+2ek0N0vaNSexRO6/CsiOaRWzCxBJWlOgv736Xf9eKp3u7lyiWV970b9p+fitLxmjd46FoBbh0C21vnKbThWnnIdQbLXI1KlIjjoHP9AxNkrH+vISdgf6b5kjmBWJZ1wrcsB+RX7S9388Tnd3RWNbYX14gjhieezZp+cNiZ3luQ0TsAi5KD400rCHRTDK62rLFMFPCXQ2nHMJYJdcVaTreBybP6mYK99+w7Mml/biEERw5ew/UmDqmND+YjjKL5sOC9VFDqWBQ10AmOo6vtcycFSOudxA4y1N9oprHmbpbbY7BuJ3E6EKUVg8foH0NKrFkalDou8VYbFVqpHN1+5gCaz5v/Z4Ax6qEy5qzRXu6Jtd7v8empdmE4D7yKSE/9Gw0T0jFZxv9gM8cv+jOakfPC2wAaloFi2gVhHE
X-Exchange-RoutingPolicyChecked:
	fbbZkH2hkD3BJoDPpJQpUhNJF8w/CsdQao06btLb3/mcOSCDmf6CA3dWkLPA6XWqSA3sIF/a8ZviR48yOe1cRG8xkEfD7sfa77Ap2/pI7cHcmYc0Ij8KFKnRKi4IHeR3P8qlxdNNO3GnUkcz96n1ORrdKqW2AEkXNRlyM4XzxixLWnB0laUSgGlod+MDlvFPfpcbALY+sWRXGIeaXNU5sADpG9ViJBbTJrl6uDAHP6hOkj+/ssftjLYY6qt1rix04PcveXNbl0t3KUhNaPLscsW2yWreXBEUNAeKYWHwdoAbTPhWe3VX+d/e9gJny7nQvd/zkOQZ1uDzU0t5GNLdzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:44:51.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe6a508-3878-44c5-b489-08df075da655
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9683
X-Proofpoint-GUID: FDJX3Zg042_QVMNUaW0nOg3eHuBBAxGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX20jNeBT9AKYs
 Cw57yX/gOFlwPJ3YWaeXrgn/ziAl+gz0S7MuK/S8QePgmjb2Y2tOE2yk1tyUZm37plZ7ddgF2gq
 okBYDDSVY4xG6RUPUatpGmxLl+gHNe9eQPnpDzFXpuvqmQmNqXGcEi+Wlj2TlJr2gwRldCmFX/N
 yIp34okfOUGl1sIZTl/kAIoQAuiKqnaw4mdu/yW881b1vMNachK+3YHaqIwT3FA1nTMqudEzHiB
 HR1NxJ6L77AVtxRiAT9qE2C6ZV7SGr+lu4kP/0F7V5fVFuUubN2ft0ito9JZgxv1705A9Ct64dK
 KRP14d5xLK5OiNKbcuZcwzvFdM2osyGEqnl+ysT7A7L6pb3/pQ+VLGAWZ3/1z1JjqReOhZkBteE
 IqIV5DG3AqHPovtO4i4UiyKal5ElDpSJviqDSi1mpbjFgDRx0DUIYvm++/PyMuQLaYK1aV/xKu9
 0o5s07r1mCvChuxMjow==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a95774b cx=c_pps
 a=d12s6WLQALnS74XQi9GLPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=ag9wvhxpiAUrDwjAiL4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FDJX3Zg042_QVMNUaW0nOg3eHuBBAxGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX7zMwewMb85xx
 KSgOZ82td9gqUyINVcw+u/DJipmsSc0nSVhGDglSuXVIO4zBxKxIEsS+GnNM+WS+ix7PE7Xv/KI
 l0UEXsSjyexIKHDpgOY06xFWfCpbt+Q=
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 31, 2026 at 12:03:47PM +0000, sashiko-bot@kernel.org wrote:
> > +/**
> > + * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
> > + * @slave: Pointer to the SoundWire peripheral.
> > + * @timeout_us: Timeout in microseconds.
> > + *
> > + * Inform the core that the peripheral is about to detach from the bus, this
> > + * is usually due to some implementation defined reset mechanism. After this
> > + * sdw_slave_wait_for_init() should be called to wait for the device to
> > + * return.
> > + *
> > + * Return: Zero on success, and a negative error code on failure.
> > + */
> 
> [Severity: Low]
> This isn't a bug, but the kernel-doc comment describes a @timeout_us parameter
> and a return value that do not exist in the inline function signature. Could
> these be removed to prevent kernel-doc warnings during W=1 builds?

Oops, sorry must have been from an earlier version of the patch.
Will get that fixed up for a v2.

> > +static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
> > +{
> > +	if (!slave)
> > +		return;
> > +
> > +	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
> > +	reinit_completion(&slave->enumeration_complete);
> > +	reinit_completion(&slave->initialization_complete);
> 
> [Severity: High]
> Does this function also need to update slave->status to SDW_SLAVE_UNATTACHED?
> 
> If a transient hardware unattach is missed (e.g., due to interrupt coalescing
> or scheduling delays), the core might see the device reattach as device 0.
> When sdw_handle_slave_status() processes this, it calls
> sdw_program_device_num() which checks if the status is SDW_SLAVE_UNATTACHED.
> 
> If slave->status is left as SDW_SLAVE_ATTACHED, sdw_program_device_num()
> aborts without reprogramming the device ID. This leaves the device stuck on
> device 0, failing enumeration and causing sdw_slave_wait_for_init() to time
> out.
> 

Potentially, however I would argue this is rather a separate
issue. If we missed an unattach and don't reprogram the slave ID
that is a much bigger problem.

I am less certain how possible the missing a detach is, that
likely depends on the host hardware but if we do the problems
run far deeper than just the wait for init function timing
out. I am also a little unkeen on setting SDW_SLAVE_UNATTACHED,
as the device hasn't actually unattached yet. It feels better
to me if that is still linked to the hosts view of the state,
the aim here is just to ensure we can't skip the wait.

Thanks,
Charles
