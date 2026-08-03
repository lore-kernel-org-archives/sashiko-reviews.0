Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346A28E0F;
	Mon,  3 Aug 2026 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796395; cv=fail; b=cr1mr3UBVo7/x9AtHXIYVrfhW1uzt1B87hO2HAOYvt3gX04INLc1nXbKW0RGD+1ZBuCaQwk+czeXEOz1Q4btLPSm6JL21sW2YmPYaji3DPuG2ggixAA+jkYEpRy+ntTJC45ZQjvYgI+5iyClaglnKyVa+aCx0ELLhHSYgW4IDX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796395; c=relaxed/simple;
	bh=i8WuN3/obAItlwIC1z6Nh2c8VX8bGkfiaHkZY4H1tWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ImiAE/blXKpwcc+P81fU6nLWvLjkbKsZY2jdxtvT4dAMK808K88a/vGbLQAU1zR8I7ZjzgKi3y9vfq9Nbi07onYbmNgMcglcpsedNfQMJKJfC+BFKgBdedHrmjGAHrQaeH87YinMlqYji6QqO5s6GrihOLLkRZf2NGfB8g1yGsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nooWmUyV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oJop9wDM; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nooWmUyV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oJop9wDM"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 673Jj3um565165;
	Mon, 3 Aug 2026 17:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eob3/b3XNqfe8+KsnmwKGe+XnBsMsxHtvFMjoRFt4
	Nk=; b=nooWmUyV2hr6E8n1Lq6Cvr4ZAMpWE3WZntd6FZbZzWgBLzfOVlGyCBsVQ
	auxZ/Z5jwBMyWpZ4Wur5lpnudRSTUzCr/nyZ6aeYNvFCVCD7uUFMlyU9X6GM3Gvy
	0JRVQSYqnU0wWDeNLA71JxR1yc3+Pfd2KDgEs9d9Cv6q3RaGQrS60PsO6QJMCn/w
	YCbtpdBJYU+9EqSKSOPOIzBkr7S1+IUVVwzym/nGIYXR/N91Ip76S2+N5kkh1AOX
	GL5Ajp0K42JMFZQ9VoLutr8XMSk/3foXW5wK4il2/bLLY+N3xRsI+jK1Q599q3XK
	+9SJIfnFUsp36uA6SSCqG/p+PivkQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpn92w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 17:33:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUcPFJEmoFTpUO2Ofb04OcMGGFmbLq90UYmsO5dbtsNVHl4BhLHG0XkkOKpZ8RVSUPt/lZV/tOAeWtn/rGtu0OvAeqINNglevHRmr9Iqk/2T0rFl3CBJ0sRFzdSsezi/w9mgKJptqYFp1JN918Ex/UI554VGcwoOJJ156gGZIcn6hroWJlIkGts3fNuvTT5npx1SoCnE1ogFjB+wjJv5DCQHCNWIBlYXQSzdv6aqS53uGOFtCvJcTZtp8YJc433P8a2sZ+PkVY4DakCfyQzJ83AZzRWYUVG7GxX/WJSMo710FH8fOe2blf40pvOFw3E7Kf7ms/pgUp+MP8UvWzJxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eob3/b3XNqfe8+KsnmwKGe+XnBsMsxHtvFMjoRFt4Nk=;
 b=dv4WeSWPPX9exQHI04yNDlYxJ1wjT0hNgxqYpYenT4g/THADKds1l8pZpb7TIIh9zi/gjxmDYuO68n+hCh65Uu/hDB0BrVUmY2xgYJ97ePJ/ZJShXOpbtHjYwWX24i/k4HOe/zfP6x3rtuUibpMSURuR70jCyWmX09n3GnlVzNWeJkCj+LmWbvwAHddauSpBb9wnMrRAvd1gdOfbc6J9KC1eIPF6d5QTMPNf4gcpi7pk2rdZadgQoHwdkgZTnfYTYGpRS5Dbgb2nrZU+DQJeoGUr3iGKwqTpUD6fQKX/PR+kXmvu3p8RnAM91Dx3ecJdcKxzAz5zJeyJO/CIkoq5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eob3/b3XNqfe8+KsnmwKGe+XnBsMsxHtvFMjoRFt4Nk=;
 b=oJop9wDMfi6tbxc0n12q2QfutYKuBasnaYqPUyc9IzNAmEwmL/1gl0fxU4HK/kjMoNYcOgyBcopLwpdg4l3xlvNmS4Tp1RO/WTOezCm+f3MOJOB54+gBFaABSa24klFUaPCq1APLV9/uxqGs/dDyLgyAz2e/rsEtsPsdED/m7NE=
Received: from SA1PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:2d3::19)
 by PH0PR10MB5545.namprd10.prod.outlook.com (2603:10b6:510:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:33:08 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2d3:cafe::6e) by SA1PR03CA0006.outlook.office365.com
 (2603:10b6:806:2d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 22:33:07 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:33:07 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:33:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 17:33:07 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 673MX6EB3272568;
	Mon, 3 Aug 2026 17:33:07 -0500
Message-ID: <521646db-bba2-4630-9df0-b729570fb556@ti.com>
Date: Mon, 3 Aug 2026 17:33:06 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: ti: k3-am64: Enable IO expander interrupt
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-6-jm@ti.com>
 <20260729200934.C5BCE1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260729200934.C5BCE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|PH0PR10MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: a82afd3f-d393-4c87-1609-08def1af3104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vwmjv2aHWjonCX6THm9ZEIPuSjC36E8Z3G6aR8ajlbzS19pb5/h9fPYMewBVRRbIq5wNKy4qPFG5kETxQBotMnTZNGYE8WuvA9lQ+MAO3pKP/rhFVWO3IUcLgmd+oLUzSypjzOVQvAHfsC1f4z3z/+zvIxFqD680bLXAB+EZwF8zVeMKApaYF8Ca0mB6wGpRTLyK7amQXt6RFi/vlTtSN/MQbJtllM7Fyxx4Y4iA9s5D5a450RIFvyvihbebTxciUxs5fAEpcRT8Ul9tW0Hi8Htpx0KXWqPfOTXTej2yyTiJp/l8u2ueQVatZGkirdYiaTypHkLd6ID2jEjjEBl/2LkDOEJmnq/USqAVZJ/mFyTQz4Fh4jPufdXfcJeNYPwXorCaC26QiGUO/v/bFA+YXEWIN5gq/Np4ZeT01ony7JoUSN3BYEpyIjz4Vzel22/EMc6xrMT4JHSywvblvGTW9jFt47MZT8uMpdzb/ci0q2sI07KMxge5hGEmOw2du86s/1MZAuu96ho4bGzZ+eU4HcacHIq3a71kEcgf6ghrEQ4Arw7gahjMsOC3ppLfoz4c++Fx9ZqkRV+dzcqUShDfF+xVr8T5bGI5KraHVW0CEz5/lp2WXTBH9/T9v34FmixuMPm2QkNbnQj0mrsQhSqxQgg7TUOq5CPTr97QJ+XJAFnj7qRsdzpXLbGngpuw9HlN+MS3thy4KyrRZkbksW77Hw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+mmlQvmEtpAriezcxLfxMMYdJQOwBoqBeepfGyGBUM9bkB1mL8ssdg3uONNGW9lCpziqhOnhLEyzaC/N6MYaZFaD/QPHXT73BtTAfY4kJuDG/gYXGuppiT9Bjb6/1dPAGdvnQQ19+PXIQNrKonkhYpr05/v+Mr4oNoj6+RJU7vFfsFNwtcdZAt4QCMi/x3xGUrx1IkzS87QblzR1G0mMAhprD8Tt5QPwMeF8Wjq0VeROUW+BJ/WBOkWiWBrbTx5QaL2fqppMbOzmoPHgUipOKAnGptiuHE+krXGP5OsJUP0upgd14exLxMeaCDG9nm52Uef7F4PU6TgrsVO+M9g2/4PPWNXkngM7aC2K57D9bf7MsiJtD44hjuabXXdxNdoEsRUlgicsompQLShdac/rJThFBpckPjy+ivBUET2jozF6Tak5tODWhFwrb0hViP4e
X-Exchange-RoutingPolicyChecked:
	Xi0sNLZjLGxEGoQNbdNuY6IyQXzNIe6vQMqYNZlHrhtp6B6oMdRqTn5fYkis3t+4KNEh44AI6IaXPlK2CYQRP4z8MtDSvVV3Iuz+feLDKnUtAzJRAvlaD50Z/30bJAq32cIW47SAD3pTS1smNj+MTkINsVk3WLSwOIF4jdGmbkyq6jx0pKTeNmAMwW0nMGA2uPu/bW2a3EuCg5q/zyEssLD3Gbc+QVwxuvXsBD/qZ/4uKKdfLcIUoVdkQAtm+goy4g4af9X4D5jmecGbpPm01TF0j02f3CN9wLx1WfXsnu+Y+TR88Q0xsc3SbIrv5lfeWvEGKJUpVLoIKXsA1lBEBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:33:07.6344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82afd3f-d393-4c87-1609-08def1af3104
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5545
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NyBTYWx0ZWRfX8h+McK4cGxFW
 48319XCYl+b8WvRJlI8mofTDsaHCc3R5FZS1a6m7CgHPq5IPF5XCKTpLlsjqwYm6JCEbICVXNII
 XfSVHRX/SVI2ydyRGKByegn+xaRlLTGLznAm+BssytfJW4GQ4mYzN66ah3OtOuf4Y9M5rj1wqtz
 bml/u2Jcy+L+jUh6sG7r/0s7SfzDVljxguzkeuMYFpSAS/nizF7snJ2Wruyln762QvovTJBsfD0
 OH8fNnfhi4yMO3kt5eUOYT1oP1M8uMrZuFgLRo+OlzeEvOWgo3I+Qs3Cip5nJmXackRImRizoz8
 Skh+wnucIaebxBuy+2fhZ5Je/dNTj5sxoM38EzGC6fpn/p51OYVBh8xMOcKuH9Ffo8wyJu3x2tB
 F7K0Bci8L1hkiirc8qLTbQjtstSZJlTKZuUviR9R56hQ+neXjC83HSp/AA3BnBRdTBgRNsf92vt
 hqXJ9TSTTFq/FQTDguQ==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a711727 cx=c_pps
 a=I468VFW1STRMRX/li1H5LA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=pQq2DfU8KyCV5BTYdGQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Vmb-svSeyl88-kF95CWOCp9OqmkqqcSe
X-Proofpoint-GUID: Vmb-svSeyl88-kF95CWOCp9OqmkqqcSe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NyBTYWx0ZWRfXyABeMuxX5bCv
 NvfA9n0fMH5LgfPWCpddtPfotJ+U3zszbJe2qbtjhImEB5zb0qTSjlG6+zTw/Bgjpy74P50IPha
 JF7WCdhskIRSQc/O1ckNw+wRzOzdL+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030197

Hi all,

On 7/29/2026 3:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The IO expander interrupt is incorrectly configured with IRQ_TYPE_LEVEL_HIGH polarity for an active-low open-drain output.
> - [Medium] The pad configuration for the SK board removes the internal pull-up, potentially leaving the open-drain interrupt line floating.
> --

This patch will be sent as a separate series, due to Vignesh's review, 
will test on am64x devices and fix before repining then.

~ Judith

> 
> --- Patch [5]: [PATCH 5/8] arm64: dts: ti: k3-am64: Enable IO expander interrupt ---
> commit 846c9ea4531cda7562459d539ef568783fb1e41c
> Author: Judith Mendez <jm@ti.com>
> 
> arm64: dts: ti: k3-am64: Enable IO expander interrupt
> 
> On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
> remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> [ ... ]
>> @@ -481,6 +487,12 @@ exp1: gpio@22 {
>>   		bootph-all;
>>   		compatible = "ti,tca6424";
>>   		reg = <0x22>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
>> +		interrupt-parent = <&main_gpio1>;
>> +		interrupts = <78 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: High]
> Will setting this interrupt to IRQ_TYPE_LEVEL_HIGH cause an interrupt storm?
> 
> Since the TCA6424 IO expander has an active-low open-drain interrupt output,
> an active-high configuration might trigger continuously when the line is
> idle, eventually causing the kernel to disable the interrupt.
> 
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>>   		gpio-controller;
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> @@ -198,7 +198,6 @@ &main_pmx0 {
>>   	main_mmc1_pins_default: main-mmc1-default-pins {
>>   		bootph-all;
>>   		pinctrl-single,pins = <
>> -			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
>>   			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
>>   			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
> [ ... ]
>> @@ -210,6 +209,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
>>   		>;
>>   	};
>>   
>> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
> 
> [Severity: Medium]
> Does dropping the internal pull-up on this pad risk leaving the interrupt
> line floating?
> 
> The previous configuration for this pad on the SK board used
> PIN_INPUT_PULLUP. If the board lacks a dedicated external pull-up resistor
> for this open-drain interrupt, using PIN_INPUT might lead to spurious edge
> detections.
> 
>> +		>;
>> +		bootph-all;
>> +	};
> [ ... ]
>> @@ -383,6 +389,12 @@ exp1: gpio@70 {
>>   		bootph-all;
>>   		compatible = "nxp,pca9538";
>>   		reg = <0x70>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
>> +		interrupt-parent = <&main_gpio1>;
>> +		interrupts = <78 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: High]
> Could this also trigger an interrupt storm on the SK board?
> 
> Similar to the EVM board, the PCA9538 IO expander typically has an
> active-low open-drain interrupt. An active-high configuration will likely
> trigger unconditionally on boot.
> 
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
> 

