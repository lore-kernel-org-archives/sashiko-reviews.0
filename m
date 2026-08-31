Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26A3DA5AE;
	Mon, 31 Aug 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180587; cv=fail; b=BGZuPeDT+rMr+AO+JOqh7iGUV2Ug0oeSQWdSmZXQLlRVlw38heeg2aeOgMA1d5l2At2mrYpx0V5cApEYyEYk6zBOSGCcu3FKcO5ul78hsFdKX0TcIL53hUoF6RcJdFAd3UgKcwR48W5MxrciJEN2UjeQtduf+cAwTUBn0TzfbDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180587; c=relaxed/simple;
	bh=dcxSoAC5KvXdiqJFQi+mga1axl25mtIuGeVTbeQPQx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwoKDMKUA+K5XLgZ+ZF30hhChU5TQMlSddUHeLvnAitP7x6iasBtBRJb8TukBI3Ymr7DDm3eHwR1QOMRWUS7XQskmrNJbJQngd8JyU1ZGX599pJZYpFHWrEEGpHP0pV0V2cB60uKFa/q7ayVRRIib+AMtEcN76Li4/s8RdgcY0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pXjNc0kW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SdGZj+A+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pXjNc0kW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SdGZj+A+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5UrZI1521523;
	Mon, 31 Aug 2026 07:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3+DtcwPX31XO/6K9q/
	FMwgS9aUbU16DxlDuSp6x7IMw=; b=pXjNc0kWVSNJQsyRIOMOcJ91u2x0tEDOm8
	BMcMmmb6U9Pz3uTmGqnx4XdMFL1KTrM66taJ6sam8828+QGMxTpgkCIH04GKdGEy
	wXB8GunXKF3zRwGj8GAAQTurDom5Zxp+7OXMh2krsDZWF0ZbfpI3s8ZNKKarTvDq
	bSENG9YnxfxXm99/PpJl3RAhwEDmp9WtL3fYouGuVfqclQXq1E1ZRNW4syEPk1VK
	Opo0qG2a+r8AZ//Rk9Vcn7UGUJve9Nc95BmsE58wKtnmWGRt/lp4nDuo2Vri6gPW
	x56vpgNedqVuZQzcRUR86/24FD4+d3nIhxrw5GQrrTj6hsvU9jOQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020089.outbound.protection.outlook.com [52.101.201.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyt2me-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 07:49:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPRy8D8zJCyzFLIDLLurvd9o2qSC7rnBP9m9t177WMaYlhxItppHtHUAByLRAsJAHNN2+zMpES0ExXfMChzNcGPKOAliEzZt9AUF80gXadAODJKKiBrTCon5SNBPGG3631EaYO+fjRIQn2Tg9brYthII4/ig9G6zEMNsQxW4hEc2fe9sQZrDUf4F5Gd2CuOBIW1/4mZXWzlNOb6LHFWNkzTLzJ5F6Iz4dTABgt+G6W4czVcJ/BbFgNOqofAdiPJoT574X/I2DIbcNIQhWJFV0ldg8kHEE7lWTozaR+kkr8Lr4+1RFZvbuWv3oubEuYd67ejaT5M/GDN+b00TjWiSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+DtcwPX31XO/6K9q/FMwgS9aUbU16DxlDuSp6x7IMw=;
 b=Bq8JPMQ83HPFmXby/eu6z/FF1AuK7sK+UpPPIu1Cap2pjSnrLk1fC4DBzjRD/pYa72luaDiSmL1/jr9oPULyWXXDwaRc+bexRTKAzRMQsw2o0K8U+lt15G5TT5cDlvxua9CXihxYK0/e+uKYX6p5Uov+BLmXRFIMENtEq+MYfOwXIv6owAlWNlplFRe6Y0cJWZERvaCT3SuHlM359XD5Y4AIi1WODhuQEcludaedHjZMnZIdFb94lX2wQTALtx8eiQywu5Jdsfow3TwETmbvl1bFH1LPGNhOwyEDQNdBTAYP/y2VqZAlpO7UPaBZHalk6mJ75zKpSH+yBUWT0XmJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+DtcwPX31XO/6K9q/FMwgS9aUbU16DxlDuSp6x7IMw=;
 b=SdGZj+A+Ck/YEhv/6/VFCh9bqngilYIS7PE9ayufO/D8PeJr9MjzJQhyc5IrN/5jdpDWTXme/9J0WaS+f8MpoUs/WmIF2cIa7Tr+1XaVST+d9btMhmi1JDHhJtuIpndCbhRXi6GrVW9Z7WiNb+bWKs4ddNHoXrRZKm4xRK9gJjw=
Received: from BN9PR03CA0145.namprd03.prod.outlook.com (2603:10b6:408:fe::30)
 by DM4PR19MB6511.namprd19.prod.outlook.com (2603:10b6:8:8a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:49:34 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::20) by BN9PR03CA0145.outlook.office365.com
 (2603:10b6:408:fe::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 12:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 12:49:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C650C406544;
	Mon, 31 Aug 2026 12:49:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B260A820247;
	Mon, 31 Aug 2026 12:49:32 +0000 (UTC)
Date: Mon, 31 Aug 2026 13:49:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <apV4W/Wg+K95R9tT@opensource.cirrus.com>
References: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
 <20260831115019.1616202-3-ckeepax@opensource.cirrus.com>
 <20260831120359.676641F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831120359.676641F00A3D@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DM4PR19MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d134a9-8804-4005-6b33-08df075e4f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|34020700016|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|4143699003|6133799003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Sd0xOEZiA1hn7og+0QbtYpvjZHebDg4VvhJALIUneG2S0G6BGHdgXpR34nPaMJ62dgUL68VxBDFpv8sEbvgrQ6NSuS+aZbXCzmZyCkiuBLKZqbGMq8OYhEQP7OZk5jjnH1r1JpgBsNeCjsYa2wVq/wFkjdgeCgkYICdcWSd1utmLbfK6dgNyQ7dXb65UY5lZvk1Xv/8kvXiEj9WtLRLzBNjpxTPRN3k8DqljmkM7SkE4PCZoiducVfJBmmoV8mpi19ZGXQZpBEBlj89UoL08N78INTJ06k9bP+WZamXydtKb/Q0lB7BaA6DN1eX68x7pFbmk/a2HFqzZ9mzXkErnXfT2l7BaHpSmKfWIHFfBv37hZsf3DnA/LQ/nsU8I7xXSvNq+mzOXoPC0l5dumZFaMfkjsSZ71BtNYQ65yzuE8gpXpVlrq2Rno19SBGhgkse0LOnMzmHyNsO5mbZu7fQJTC4hUjsCC3torIrEi0BjTm2HTN+KZBGWuW+D1L5jBGdjTTVvqtdTPDN0hLsChVLYxlN2xXttgpbXZ8fAEgD5oOa/P9nXzRQExYvzbSQ08eGW/rPkRNe2hBrVKNmbSpVhuS7aZpFl3qhxx4xm2uOUEILNXw8AvVKCarP8xBL1wcX87SAZIISO1pEeyrasb7E+V4cJ5pv8DUauOdS318P3nGh1mgZ2qm22OIp7jFoLLka2liwpM7Mf3EvMs1TuZQWyg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(34020700016)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9MlEtowUN9/Z0OpyTYU0vmN/WOR6RSoIIQ/Wy7sMHx9LO5i94rTpVCX0/Yoekta94mMCSEedYtac7oQuGk/OrUGs30kW94HdebofT1K2t7v9DeWEIcHPlGbozxPuPzLrbmWvk1uBd97Oe2xvjf8A6RmAcSURZK3meAdpAc9E1BpUr8bi1lqfLD/iCK9nXvvM2iwRsva67KAVRMcYqF9uaxT432MkhKVBr0b5bU+JUTjjuAjz3g2wkNKURW8o7I9J41AoToUYpHQYMJLxuN0UqH6P2NEcas46P1cqEdupDDrZkgNXXwLqFIthkJujaZ4dnQq8B2cuGptH6AC/e+VjjBGCfOErLyTTDcR6fDUepizd632tDMN4tSTcBL4jyT66T6r+GZk8PTIDvX3m4gvtarwh+/Glmqkkp0Z9LlXIk78NCNmRQ/Lgrisq8of0GxBe
X-Exchange-RoutingPolicyChecked:
	ocxq9VDswoCro1to6p5ME/nDx7sU1s0bi+GAi5Mbbm1VuKABSwz+WB5dD/sV4Rb3M4k2AhHdcqHVp84+GE8MHQ3QnoWLGgII+fiN2R1KewdWenxHqSQFoWXXx9iAs9hNZPeXKgSUjDCawnAXnOtRKsf317eXbj5eSBXPYkPxNy+LzaSpyvuXfeiM0xOb7NqXVBXUHvOLNkiM//qs//zI7gL7ECs5K5Usntn1oAf1JIzRmmAO9eHT1RBdzjcZRMdph3HPmx5HcsDOOmhwVzJkk/WBFvJB8jMxyYNzrlRmgQx38+nQSlW8DTNgV5veyx61JgwNctbEY0yZuYhadFEAhA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:49:34.2361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d134a9-8804-4005-6b33-08df075e4f0d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6511
X-Proofpoint-GUID: CRVWHNV9llwUNQHgtEqGtbsTUyypGqox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX38hs3xFQriOx
 y7uFkT+A8dy99+xyhSiZf22rJix+plCtcZ6LbD6ueTxZh5oWy5dzdMBjG5sMc24Ek2Xm6GmhYuf
 qSU6b+OYHHRZdYkvgTtHVZ7MihQ8+XzfG7TpCbV/QG8gPmuXeitqC7VBT5OfojhDuE2Dv6yNQQZ
 r0eVTCY7rLxFCTujJ8yByyvwGZqYFYDNd1PZevQJUeX0gkbIX4DR6x1nk8KB80xt9ThjjxgbE1F
 j1kRlWXQgnJFuHm2Bduuec3qQfy3QihiAWJ0daf85P6Doocc2JWGiJENzEtEDAgpkELy2ATyMHY
 zlrhmAhB3Op/38vgEcye+pcIW5pGDAjBfWK4Jqpx3BIarGpfNilV4QxFu/G/5R4Y48WbBbbSyIs
 +C2MBPQWquq6x25ce/WdjNwWECo3eoOZY5RL0kupoaFSmVFYpKEqwJ3Y7UkbbihNwcSP/W3zDQo
 CLkH7duCFUSQQq3OOCw==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a957864 cx=c_pps
 a=ztQKeGOog0QVs0B1QXIMEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=Ydsdkiz6_q6X5rYLnFEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: CRVWHNV9llwUNQHgtEqGtbsTUyypGqox
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX/Hd6XRw89iN/
 wPue0S8e+lhw2RVoP1SwyBcO+r7eaF3Bq2tOPzIIKNLh+x8n6IqNjKq3QorEtXHvWnGd2LdC/9N
 o2gRr0btJksgZpxNLtqcqIx3UjiAj2Q=
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 31, 2026 at 12:03:59PM +0000, sashiko-bot@kernel.org wrote:
> > --- a/drivers/mfd/cs42l43.c
> > +++ b/drivers/mfd/cs42l43.c
> [ ... ]
> > @@ -1115,7 +1103,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
> >  	dev_set_drvdata(cs42l43->dev, cs42l43);
> >  
> >  	mutex_init(&cs42l43->pll_lock);
> > -	init_completion(&cs42l43->device_detach);
> >  	init_completion(&cs42l43->firmware_download);
> >  	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
> 
> [Severity: High]
> This is a pre-existing issue, but is there a potential lifecycle memory leak 
> and use-after-free here regarding the asynchronous boot_work?
> 
> Later in cs42l43_dev_probe(), cs42l43_dev_remove() is registered as a devm 
> action via devm_add_action_or_reset(). If the driver is unbound shortly after 
> probe (e.g., via sysfs unbind or device hot-unplug), the devm teardown will 
> run and execute cs42l43_dev_remove(), which calls 
> cancel_work_sync(&cs42l43->boot_work). 
> 
> If cs42l43_boot_work() is concurrently running, cancel_work_sync() will 
> block. Inside the work, devm_mfd_add_devices() is called, which adds new 
> devres items to the device. Because devres_release_all() is already 
> iterating over its captured list of items during the unbind, these newly 
> added devm actions are skipped and permanently leaked.
> 
> This leaves the MFD child devices registered with pointers to a freed parent 
> cs42l43 structure, which could result in a use-after-free if those children 
> access their parent data. 
> 
> Should the boot_work synchronization be moved out of the devres teardown path 
> so it executes before devres_release_all() captures the release list?

This does sound like a legit issue, although probably pretty hard
to hit in practice. I will have a think about a patch for this,
although clearly separate from this chain.

Thanks,
Charles
