Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793270888;
	b=0glvAWfw6eHKqlu8aC3f1DWgu10ZCFjLmbT+HZUTjW6nIT5j39FmOSMGDpYd3D/o5D1W
	 MuPfB+zJHIQ1NKsjwz2JTfOcZEC9nIy/cvphWmf/sfpAorFClh+3j3ebxdpW5WrNrXIk7
	 S5nwgRZYv/Vw4wBKXuz4HnvOPweVjsBvg/DZF2ek/SE5o/Qlhk8HTifglArYe3jJToMzs
	 BDzKtTTD76XRI0XEpLPiBMxHcTX9RHldtf/ZCaT2jVMTfpunnFlHGeM0vGWnWVWXIAgHp
	 g+9fD1CVIjH+PbAS97mQ+3VFFk/arZS6uQlMocVWKUG4AYR0uXKP6OBRh7N5VAcWVJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270888;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1jc7A4hWiEJcI6Ua2Z7gEAZepV6M/fLVtvfId/+JZ2s=;
	b=OGL3CHHAiXhQa70MVr2zCDbwp5++mE6xEJdyh8P7N2p0yRi/k3wsaMjY87eDEWm9n13e
	 kcbtySoB9ODuRoQjYRdX8B0zsjTeJo3+tMGc1HKZu88jjBXv+xwgQmY2bP0B1FkJfwtXd
	 8cGd4Ac0UDFPbIuie5Af24tBunn+N+5jwDtqH553/QVDvVOKNjKXE1Wopo4ZpANj1aAXE
	 s7Og6fe9oUCxKE/annJFmr2u4khr+kh8x2PUSFyHzd9IqtfjwJ33IHYAPm09/aStB+LYk
	 smuBqPxT8NPbBgZBzZFclLsNA66mJFPuGwCncwqpOHVqjY6FTWdPIhgXeoQW71+At0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Z/aWA4Vf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.12
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB5E606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z/aWA4Vf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjCo1KDdJyO9NZgI1n3Ml+v7xMqRUS/cgBePECZeOjWyyePPyuG3lwrz+SrvZyMpyC+6UlIVhd4yN4giP0l/Ps2mTWcvuc1ahCyLHgGbB2h3qdWxT6zVLEjSD5hpQXGftXzv/m5TtgZ4ksaa8dQjUaOjYgFWF923FwYsTfqJHMUE4nwlMtfOhSeEzxT68SUZcUAwIaYDSZNWXWJee9XKrREtUw95qPl2fcTQSt3s5ovBCmWkbHRWDl2Zz2gxAcOddGmZQgzxJ9WWbnOX5A4jqbAsCnlfvZdu6iNEg/CrBtXRUncjVvZLotrSN9Hv1sPd4ZH6EwQ8m4eXRF014aOsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jc7A4hWiEJcI6Ua2Z7gEAZepV6M/fLVtvfId/+JZ2s=;
 b=PSWLOqv6NsU9YT7TxmV1xTy2PEjhMhOWGhjZRDWMIZ1g8zeTdsz77YxJml5Vmkuumt72KmxSQ5oh+KVjT2M9WSBecNUPoc5o6zNMLucOSOdDY5cuNE2z/IYa6Xe4WDVGHss3BQIxFIbKriQiiD48GpYV383R5LG8sF5S+r+iItyJ2dFCCWt9d8ktzm7juyIjGNPZImp03lPoAlVjHfANjlTCFNMS+50xXSUmySElDwqf5K4kfjdFttjTPt0VDIDAdRzgGuoUaj39AzPF4O8Gm76VB9uFFkGlc6zwp7XwYKWahjRnxhjaBhbQ3yQ0ejreH/pPv9iOxYMPFuOY1PDayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jc7A4hWiEJcI6Ua2Z7gEAZepV6M/fLVtvfId/+JZ2s=;
 b=Z/aWA4VfGalsTalkLreMZURbwbnyXWbYZw4maeOVevdyvF69CjQdIQF+KSUTo3kVP/xKCttnhARxHRR8bbGXCN/d5zZpZtPM4TCxWFam4e0O+ae/WUc6TsThl6W+usoW2VwTtcvyT3fpPW7+1Nsl9j0ZAGP/mo/2ic8QE/zCcXHV3XEHHCvDXz1f15KBh0CGVdHc+EULJI8ukXiQ8dhDt54y47KMn6/hIq+A00YCt2HdzsbaSxFeyHfmOg3WzFaQD/TeQagrw51tgqENDvxSm3l9ay/zn2H0D3KmdTFzjUBK+nHUewGKhmhQqhnoCALFd04vwyl3r1sQZkO9860Flg==
Received: from CH5P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::9)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Thu, 29 Oct
 2026 10:48:03 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:610:1ef:cafe::57) by CH5P220CA0015.outlook.office365.com
 (2603:10b6:610:1ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 29 Oct 2026 10:48:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:48:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 03:47:47 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 03:47:46 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Thu, 29 Oct 2026 19:47:15 +0900
Message-ID: <20261029104721.817046-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-188742@kernel.org>
References: <cover.1793243187.git.jackyhuang@nvidia.com> <0d221cbd11c8b582d43b21e4156dfb7c83b121b3.1793243187.git.jackyhuang@nvidia.com> <sashiko-outbox-188742@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cec103b-6803-4bd6-b1bc-08df35aa1b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|22082099003|18002099003|6133799003|261026121527099003|56012099006|11063799006|4143699003|10067099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	1aIUkfp3T91JNGlBRCHIbmJuQ5i55mZbLzc3n25M7Y2K1yRo4l/5M9mSWPGanV6ccDze+aygqmHRiIPjdiZZEIfXCFJdYldb/LbtyVoRb3+2aCzILaTOhOolMzo9eZP7cE9TdGndBPfFwa32g8wpBnzkxebW5FJYM7EvlEc7MbEV0JlsGEugwcHJXLGkr/0Lr/1s3CpFgyZ3bdV5aBl0yDb7taDGs5m5S6oR07o7dD6544YwKWYuC2DxiRj3gDZtqLKO5JISq+AO3NMp1sR7gCvFn78Pa8xpLgfA5vFoM20Q68wT+AaJdvbLEONKkXB6LUPONJqSlq9rm6rUMQyjiXopIHXMS1LOpxe0fTRycDciKENnDJxcgrc0zRtsn238aApFgn2JD13f+be0oAuvCnTMM+C3sv5VV0P1uApHbj+CI8IvMH27YME+mux2sw+gSdihEFIxXkXEa9TxGcqu4TSJ7xG0gsZYatGz6Vx/3S0QCKR178H7I+vnW4P6Moo7UsRGPCaWnVjRM4/SfKskR3wLLJ5IfDK8/M7MmCG0LTG6/qA+uttZnnvctvuZp5W4e2Yt7BuH2EKmpG1KhN/CBkA0VDm+cJXzMgZ0Cr1Qyd9gBp51zKs+8SlNknM4p488InrKBGhh8X+U4n88tLJ5ki3C6Sc8cKRSKCX3UZdVRg28M4bQPt3a4ljBmEnt0Qv6Jjh1CptU7+aHuQli+pkr/w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(261026121527099003)(56012099006)(11063799006)(4143699003)(10067099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CH1qBtbf8f2zKzwfU/hLIWPIBKgxcigVQFLeEmiauBTY+6DaZYA3URS9pTVo9CC5P+rTQyLicHN9Ng5d5K4iS+SDCjMWH8mdJf2iA98UPi3yrXC6Ychg5onFGt1NLV/Yfgvx9KCFbjJzlqxvMNZvv+uhrPplQ/IvGtFOb6p96LCWM37s63rEIQagLG3VnzOiSgetfnv38qtbDaNtPDawgIP6IHr8zA4B2gk1e+OXYkQTwKSO3PhyQeWLKt3fcGKW2K6cno7wwjvIm0Yb3y/cOqCBtkGaJKNUYneOnAZ8JXZQ5xYIdinyBHXxHAY5YCMcJC8VALAhEX3pZuZJY4/DDMsyXdVFz6gx0gUzrbwxK4NrpgGYO/4s0uYUHjFnwY249r1fRB/QbBkp5yGdsq1tjx4Vl+CtPJXmsp9u1X810i9UWpbO32acLcsWsMGDhr7S
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:48:02.5372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cec103b-6803-4bd6-b1bc-08df35aa1b35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

On Thu, Oct 29, 2026 at 05:13:56AM +0000, sashiko-bot@kernel.org wrote:
> Similarly, further down in this file, the pca6408@20 expanders on
> &i2c_mcio_c0_south0 and &i2c_mcio_c1_south0 define identical "GPU1_*"
> gpio-line-names, and the pca6408@20 expanders on &i2c_mcio_c0c1_north3 and
> &i2c_mcio_c0c1_north6 define identical "E1S_*" gpio-line-names. Should those
> line names be disambiguated (for example with C1/C2 prefixes) so that
> consumers can address both instances by name?

These are alternative placements for different configurations. I'll
drop the C1 ones in v2, so the DTS only describes the C2 board and the
names become unique.

[ ... ]

> [Severity: High]
> Should i2c-mux@70, i2c-mux@71, and i2c-mux@75 on &i2c4 include the
> i2c-mux-idle-disconnect property (like the pca9546 muxes on &i2c6 and &i2c9)?

The muxes on i2c4 intentionally don't use i2c-mux-idle-disconnect.
Each of them carries MCTP-over-I2C channels, and MCTP endpoints send
their responses back to the BMC as separate transfers through the
selected channel. With idle-disconnect the channel is closed right
after the request, so responses can get lost. So I'd like to keep
them as is.

Thanks,
Jacky
