Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9883ACF02;
	Fri,  4 Sep 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524841; cv=fail; b=BqfvNM8hFz5sp/4aPz81rnJjHpLinp5Acee8bFVoSpvvMmliX3tG2r7zJKvy3QE/Evu24TMH9UHLuzSLVh7UracjrB9vVA0ubMrF52FCtRRlL8E7uPgqw1ry175VFXW+MRQAYE8lCJC8RHJhRaNyct/UOziVUmveGjp+ff5KAoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524841; c=relaxed/simple;
	bh=ygEIYn4QY4PpANW+DMzMvzcUFjQZwAX0fa4DMXIz63o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe0GEw5c+JzNNrN7udO9w86AjhxI4VXg4Hdyk9D6qFNyKcubsBnWjFpsfcS4bxvvVe+As5Bq2nBNS/bu2RHLoYZvjCYq9Yp2fy+i0z3/peCAXmwHBbNawom16/BAcWvWKKUGt7eUDAwQoR1bGkxD2EfuOTsB1XA/QHLC6+GXfSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q9aGz+yI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kz482SZR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Q9aGz+yI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kz482SZR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6846Yl441305646;
	Fri, 4 Sep 2026 07:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ES8QvMLZMZMPCWXNi4
	DKQMp3VBHNMuDkH0U7P3YjOXE=; b=Q9aGz+yIamEIyvwXdrRMzkGSAsZbdkI004
	0q7nyv7jetgGBFXihG7Iq9G6mKozrb3U9jKh93ZJOxh2w5SL9lNFsSpu9mBkNDQ/
	yrK206cX0ynOrTRDi0AoQ+4ZA5tuJZGlBHGMgbgobNQ83ckMfiwDdA7c0l+mLE0c
	BQD0R7U2hSCyHy3ObpHneT8N9NJBB58eR/QZmC1xPkdxu0LHivTW9SNqr9Uei7Mo
	f7QQ6XHj3yr2ASsImZ2n4EdGr/dJidUSkIolOaSXBOCwb5TzREMRE/JGyGMwufrn
	oxjxkTJ7ym45U/qowxmnETwtB0Dk6+YvYP8QvTxGa59e0y66ZsLg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022084.outbound.protection.outlook.com [40.93.195.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntng38-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 07:27:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQzGQmMy4tGFFwvnkSum1obuvSN1tVrFiAcvCEQBUxRCUBfwNEucAnHSzDfmmg+zzYk07jMfThd1smOqWG5QsAWispaszldMvDXUZyzRE+0G+rOQCSH6yryJ6F8Mfnea0NZdF7i/qoh4VSZP24yaSZGTeTJKrlqmF7AzXo8W0t/Wh4C3CmKAlvdfiqOHXnHzvXYOYJeXKoZ+FKw8fDUwpCeod6mfTDSH8pzu7YVO/ckjy4u4vND5gC7Pex60IlL2VfC01UiBobQHdj7lE14VoAOPrEtHXZGDhewWnSCC6ah6PbWaBE4B2NSrN+1U8wt3F3GIRj4ce4h5yZgibsceCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES8QvMLZMZMPCWXNi4DKQMp3VBHNMuDkH0U7P3YjOXE=;
 b=q5doQxB/RD00tHbuTFSYe2eYO3oe/yrhskyhpoDhgo0aXkxVwJUNgNKnsfGqOO+Lzjkq8Q24GSWbd9Si+UCuUJl0Y1rJJSbXU8D3tD4vXvI3sLz6YXTYKxfw3/WoxswbTz1G45CYu49CCFDqQZkz2mn7AJrkYA0OAxeu1N2Akg5rzxK8bzbKoPeZbs15rxmQdqv3jRciKhdheMFe7uvaWvesIEhF4Z1iZ3fl5eLMQNVeEd3eaWqldwnJWgoTjO2jMPjq6NT2JOOy3jERlnvPbcMEqEm40c19Y5JhfwCdl1L72RiMxH/VeEJf+bEVdx0RZVRY3cIhiIQ9faeOlldzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES8QvMLZMZMPCWXNi4DKQMp3VBHNMuDkH0U7P3YjOXE=;
 b=kz482SZRUo/5E1TUGHrBakE2+Z7h6r+Q2f5a3HJhlaCcRONIg2WmwPzlAlFNpc6v8csvBSbsMbKaLZP8eDwRMlRWpEBBQZobcMCS83SWK7a+k/DefeHGWznV7UyxbXpL3zoeoftJqgYQkjqBl17UsEmfUwTeay0QD2esyJ/yV7Q=
Received: from SJ0PR05CA0125.namprd05.prod.outlook.com (2603:10b6:a03:33d::10)
 by SA1PR19MB8927.namprd19.prod.outlook.com (2603:10b6:806:46b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 4 Sep 2026
 12:27:10 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::61) by SJ0PR05CA0125.outlook.office365.com
 (2603:10b6:a03:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Fri, 4
 Sep 2026 12:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 12:27:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E8AEB406545;
	Fri,  4 Sep 2026 12:27:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA187820247;
	Fri,  4 Sep 2026 12:27:06 +0000 (UTC)
Date: Fri, 4 Sep 2026 13:27:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: cs42l43: Move cancel_work_sync() into remove
Message-ID: <apq5GVrYnACaXdns@opensource.cirrus.com>
References: <20260904103925.292708-1-ckeepax@opensource.cirrus.com>
 <20260904104903.8ACC31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904104903.8ACC31F00A3D@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|SA1PR19MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a437b78-3c7d-4059-e0fd-08df0a7fd687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|34020700016|6133799003|10067099003|18002099003|16102099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jLYQUudVuUok8mqTbA0RfV/wpXgkT3s6U84ZEfUZSsTjXZEeqje66fS0X0JaBQsd/bB7vUl0fDoHhJ6F2wDhZ5MSMdmuEnMDzAYEdM8pZ7CPuaTJr+XAluOE/mKHN/Tl258NHpdKad+yUGjhRKjg/SoikjgTOr5iYfX4XMhQGIzPbpvaV2A9M7+FnYmGYugoMDmMyIzMsEWo6FghXCItlg2Ndrl82JYZhhlHJIqnfE+PSDeU+avgxgldrkq5ZjXuFONJiQlUQDLhT4T0jssgW1XiVD/2qCV59d6FvwiZ+30ibxTrxqpolR5ffUX83DL+SPUlTsxfm/2Q5sLCGlshCKngT2CSTybjrA+OsEa91xmTqD++871JpdPw7MNSFXw/08yq4MJW7spmR6kT63CG88TrRCAcO1ErVbx9assduWHDC2wJvMEQwCqc/TQIqor5XVhVEl/5E6WJ+z1bYSdWswortwmLAvTvo3j52/ZV5KaIZ6R4X2dsf7EDqGbYZ7+2bHbssiq2DBL+NSxk7FR/lGDLKEdLHGSbQMbaSTJU3uIehtTfRZlLCViaYNj3/gQoP50mhcH8PxrG0iYsJINqbkvnjxPfNjLaKyJ4JTSpi6nd55Oi0Htao6XJlCbzv0pB3awdy0C+QraaphUfZwn9Z+0bLIIMQvRrhSpHobxAa2kEahq2s++uLKcBmdobuEST6+z9iegTMcMtoBu/rH0VDQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(34020700016)(6133799003)(10067099003)(18002099003)(16102099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fWcdZsNrzBeRgc3mHvNVz5zQGRw5d7IPLWN0KBIBXNHVoVHeA2n2YVZ9acIpisYBI7Nn6SNfzC5eJoNCZK7dgi9WMYIkDGGvoRuysvbg0UYokMe+fvb6RtCBRozOQqxo8pbIrTJzQ/wJlTli3Y1aUNpXkH3w46fu6TgcaEGgCPvbiCUOrEWjmbMS/k3c0SUie6wzOWP89TlGP2gQLkw7wz2+b5/ydDlWRFHcH/tV8Hjrd2xYQwmLr67HQ0fQCRyuQH9UbfhEi1rNZSzksZ3yLGCd1clDKoV2ZrFXmeltXYthlIXZmdmLKHxE+PZyEje8s9L6f+b5d5os7n+n1qGU0QNjPRJOT0SlalO2x4JftqzROb9yvO269a6iN/9SlBQEVaOSpv83Lj6U1Q5VoLcAVPq6p5nMmyYCYu53uZ0I068dM7/ZRRyx8XfZcBWe/m1/
X-Exchange-RoutingPolicyChecked:
	hrNxa4mDh8TTQo8yJ5+vRQH6kcYaf6W6Nnz7+7qUYaXQZZRnuIddpmjpbykAT0FXFZ+ksTVHBinspEhGNoK+j+CJTOD3uwyH/zRRLwph//4p9V0FkYOYuZ9zc5PZ0kSb+rdNlvo70oLxvE2vW3JXyBEUCY5tZGo4JTaHbMV/ck/WqwCbt4q/cGibCnXGoUDeMHwDQXvTfgmruSqbTsJ8Os93Uk4NC1r283RNKMGjucEPslkziKelfPn1t1uF6ATw0mIE5I7j7qxifSBOP+m0iyJh0Ra4tmbtqwpkNU4nq0UAenfQRu3cfRkB6SRxZ6/4Pq1FZLdvvcZfklqARzAIzA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:27:08.2953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a437b78-3c7d-4059-e0fd-08df0a7fd687
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8927
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMiBTYWx0ZWRfXzw1JFkQGt4QN
 ujOc/Wwrw7Yus4rHRE+bcb9zMLk1uKUbc6ZS895C9OqNAGpDdGjie1mdpngZgkcWEkujv0u9tQU
 EAw9SCEPzjhVaW6aeUvNc1CJyflMRIBVP0SPkezvtQfx/rRclI+Sf4wU22pnUnvo25WCH2N/7w4
 A6zEQbTD92Uh0kFhL2XOktIdWem79MnNWmO9lzHg94ZvJ/ZbzDUvvVbOCOou9OSdbZ1NxMNaRjG
 8x/O1DuxJi8QNkWFIKKUPs6dg4o0yVjuTw+8GPZfD47HSRWJSHeDaUppldulh/avSTzijF0Fj2H
 c3WVpUw3Ux6eNUIBAUL0Tga6nvDrE91o6KxMaKg8ISGoBsjkaC1IXHCyjSH/hRQm2wUEAJRfCCN
 p2j4yKsi3umVN+Z2JEv0cpL9VDBXCr3LV0y1cjm7eSaffALDXbJKC5ihzxE8R25qoo4WcwC3tJ9
 OYkF8WBOVo7dR2lP7/g==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a9ab924 cx=c_pps
 a=VCX4fEh2TKPAo7eOWfrUPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=z53o13E5Fl5-SGuDw8YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMiBTYWx0ZWRfX1crtcA+n2002
 vG9Hd0Dl4UwscUdmHqDHO0QSPKJ54h9ywdua4554N0XNk10Gu0BKkaDsFMV2bKuJVCQ5Bd1Mnwb
 lUuP2fN3dI22z84r+R7UH6FI7q1rypw=
X-Proofpoint-ORIG-GUID: 3qLlxtTeZt3MP6PQZxqwnUJgpC3nOqY0
X-Proofpoint-GUID: 3qLlxtTeZt3MP6PQZxqwnUJgpC3nOqY0
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 04, 2026 at 10:49:03AM +0000, sashiko-bot@kernel.org wrote:
> > +void cs42l43_dev_remove(struct cs42l43 *cs42l43)
> > +{
> >  	cancel_work_sync(&cs42l43->boot_work);
> >  
> > -	cs42l43_power_down(cs42l43);
> > +	/* If the work never ran drop the pm_runtime reference from probe. */
> > +	if (!cs42l43->irq_chip.irq_drv_data)
> > +		pm_runtime_put_sync(cs42l43->dev);
> 
> [Severity: High]
> Can this heuristic cause a double pm_runtime_put_sync() call if the work
> executes but fails early?
> 
> If cs42l43_boot_work() runs but hits an early failure (for instance, a timeout
> or a device ID mismatch), the error path in the work item already handles
> dropping the PM reference and exits:
> 
> drivers/mfd/cs42l43.c:cs42l43_boot_work() {
>     ...
> err:
>     pm_runtime_put_sync(cs42l43->dev);
> }
> 
> Because the work failed early, cs42l43->irq_chip.irq_drv_data remains NULL.
> 
> If the driver is later unbound, cs42l43_dev_remove() will run.
> cancel_work_sync() will complete successfully since the work already finished,
> and this heuristic (!cs42l43->irq_chip.irq_drv_data) will evaluate to true.
> 
> Will this incorrectly drop the PM runtime reference a second time,
> causing a usage counter underflow?

Yeah that is fair, I will think this through a little more.

Thanks,
Charles
