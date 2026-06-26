Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2953612D8
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782490882; cv=fail; b=qZf09ZghxFITY+F3ywQ4CihdoEPEo6fg/NVDfNRRwGhrK9weexgll6FJhNtV+WL7XkqeHzxUINTELjen64kRbMX51A7krosG5CfKWB0qgcHdMqUbDkxc8PpW1I0Pfp7Lc8ir+K7T4kkn4sKVzvJYq4hjw3db+N7P2U7jNCIffDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782490882; c=relaxed/simple;
	bh=TAf2PwXhVt+KBk4ScxET0azmrU9V1qKopPYsBefSm3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rQcPReKal7sbTFq1xZCtUWrgdxrsPdlGJr3Ze9twNV70gsCVoVTCgpcwn/Le7OCTU7sCE/eherZTEF5broa/xJN8RmmEKgCiYsJ6XQz92JebLTy3HA5vT0uw+iB+fg0PnCU1KuipladRDEBz72MY5e4VWDyPU7x4QA7+eQTSiqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cZnMo4aO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LNTnj78h; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cZnMo4aO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LNTnj78h"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFi2h12341931;
	Fri, 26 Jun 2026 11:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eOHAeALKl/AvsMeL1/qh+COaFpTfgJeXOw/Cfjw5i
	Es=; b=cZnMo4aOuHpQRcIqNGWBtOggvlA9hgiapP/M0vx3RglPDryJsdatZ7XjG
	PaCAx0KGn1ISASy5ghwyVMKX7cXXOBUQUG6YKJOBxLS5J4CJhIjypnM5dDVA6Zke
	j+QASsiXRLV1ArTjdnPpjtbcCuJD6Dz7qrtMFMi8tH9YLOHdduCUUGf2XYZEttlC
	vMueGQU+RwlGBuo/JcmxsCczzJItz3Gx8E4B0qNfiTHtoDK92oNJchloU4SJ4Q95
	j61i5KfCIjbbXezTP8+F8PnC2TqyRciYXvPLQwm2SC79hCym/JqcvwHVHZoEufHW
	mQnMtpKc06YnEhAcR+j/IqLMMW58g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f1h7vbrwn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 11:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnBgi4dX61/s3d1u2/GHuwfshuBK2/xEmqzwYcyoKbYOMQ8fujYn4itO5EnnSEKsfeJ14kbAmwR79BeP0g5yf83SfqAcqwwtGJNr+Iv+Mm6eZf1i4fyAWpyUT5QO5T8z09RrUAZSMhPp+ltQ4P3sQ+MoTuQ1OM/LCWnVRrfZUFUBhnajZyOsEo9p9NtRmZJEb8fSmMbnc4A5pzT6pomT7mYLBbVvtyBCPvBkLhGTPzrSnfvydsjUo0O2Q042CxRj8F48dYRn4jnUwKW5l9JdRyuimplk479cH3Knx+gk85IK37p/tUHc56GArX4RHk2fcRKNZLYbninJhdydfr9Elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOHAeALKl/AvsMeL1/qh+COaFpTfgJeXOw/Cfjw5iEs=;
 b=IiSpfUxigBlWKH5ZBLwotm0ucaFFgOaZxgM4wTSod55P/pjaE4PgskXsv7lOKKkhMjqW76ECAaLECNSiiFIwkolM3vWgnxFFaR/cFgEH3TTe9dmPh/GERi4LaWHROYnMbFF4ED1NZ5UnzWmtGGvC9cPs1CwGolcYCl1p78OW/SoVojUy0Lilo9aa/6SHlki9T9OgbF4QVePZdrE0Z/TlQ48ARof/B3kRnS+Rnbb23Myrhdk9YF1KmkOE0/z4WQpAuS+P3/o4FQJ5iCttO6CqfB2bOQNmmuA4xYArGc6nQzR+vuJOZKkXt3ALNpHdbY+PsP8Gs8esSOccRahY5KLj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOHAeALKl/AvsMeL1/qh+COaFpTfgJeXOw/Cfjw5iEs=;
 b=LNTnj78h1zLsDSntqRI/G8VunRHk1+4T6yZD6UI48NZeXjOJ96d1ejHL4bJbps4ycYYj4bUYEKN0FK+YL0R20XYBpBgQPESjZeIsE2Kx8x5S84wr7oxuKKoSGecMG6KcKMa1i9fDTe/tubvyyN6bEdZtBiEpS+UvF1JQbvIO/pU=
Received: from SN7P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::21)
 by CY5PR10MB5961.namprd10.prod.outlook.com (2603:10b6:930:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Fri, 26 Jun
 2026 16:21:02 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::5) by SN7P222CA0003.outlook.office365.com
 (2603:10b6:806:124::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 16:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 16:21:02 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:21:01 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:21:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 26 Jun 2026 11:21:01 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65QGL0TX1407194;
	Fri, 26 Jun 2026 11:21:01 -0500
Message-ID: <61152efa-bcd1-462d-ad06-c3af365da4a2@ti.com>
Date: Fri, 26 Jun 2026 11:21:01 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add support for the phyCORE-AM67x
To: Nathan Morrisson <nmorrisson@phytec.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <sashiko-reviews@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <upstream@lists.phytec.de>
References: <20260626161014.1146128-1-nmorrisson@phytec.com>
 <20260626161014.1146128-2-nmorrisson@phytec.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260626161014.1146128-2-nmorrisson@phytec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|CY5PR10MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 41708752-3c55-456a-cfd7-08ded39eea4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|82310400026|376014|23010399003|56012099006|4143699003|3023799007|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	EBMDR905keJOqHfLlCT0bdq2BFfAVEwnBVopXdl49xfm0PBwufUbZ4nwi4MdXs4w3hTyxTrIvLiy3FzfsuVsFryS1N67DsgW22C0XZp00GJOknYYhbyNM0Js23J0Q/tYapI3WmIo8q+Hj2P/F6qoQIXGcdAZqlMkvuot8eQiQE9b6EOiTXlQhDmqE08I7nq3z+jAJotyLpxPFKRHbm6hhtdaDHk/ibFabdNp9s5VV6uddPBNKXrduUpRzcyckG0YMHPxZDJ+i0LCHukGSfOqUduCR+oyP17NuPXczGKTPg/mj8LIyVrHk/zG24Vu+EcmCABxXUJ83FUesM63rMB4CTxrYng4tM2pAP2uaa2AylWQpU0XdTQd+q/JqJRN7ymz3MPeA8ZAm3c8O6n3TdLbx4VB820OHpIkaeDaZn5V7PWTeD13e6mQO4cu0z6OqOOegjv/IyV1y69C+bDtmWmFexSWxkB0CuVlwpPnhU4KDjv63mediUUBMruzU6WZaTr31eUjnZgXPQKDnhSj3LqwJuV2O+Oujk+m5vWF/Oij9kLx9kaol8h/zNjQQ3YH8eRcV0jVTr5o6VfIn02Z8DgDrMB13F+A+qfjv2N/ova3da6XIt7yM+Yq85p7Szq7zqB2SpVz5HUp8SQ5cH7wtnKJkZ5/GBQBhAkR1qgGiRXkAiUKfh6uNdnvpunGPC/hvC82wC2OWu4TCiPSknCBsAp4PQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(82310400026)(376014)(23010399003)(56012099006)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dedGkaNxBrWor9+vmrH4gM6g2l9yuvyZVtrv6ioeABo1FzhXGVPWzpJ5/v1n90Mi5aojO67NXi9+FuoBG+yAn+MfrdDZPFr/29fVDyydJ3xOwi37u/JQsxuBCk8lqketyQuUjbD72INALb8I30gAUvj9dv6p8OrX1y+z0xlL2FCAaEFIUg4PJ8zlJaz+QsCcp7Pw/udOwC5ZB/RHDgTk+ijg8rseHMdMJsc0iLSiIAEaJ9e9VoctjyYeD8OsyMMZpn1uKZz7xUzGYvEXsQatRj3INvFoWcqsMe4in6pAO291kpLKt6k8ZjqY+RLW/yZKLmuYmjY5k42pSQjU9eb5md0e5cwJn/eQh+m/mW0Gxbs+rlCg0ZJed2n67QOFRvjOlGaPdGNRVU2JSjzc6pxm/WS0ekX5ySdU9n/tAjaGYCZtJG/V1iuPp77AkWIGfTOo
X-Exchange-RoutingPolicyChecked:
	UoCDpElkPGQtzLp43Inec5e4mL3pHCaXxL5AmV/heXN7ha/EJtQqQRUW6tH/aQ8xeTIqN7O0mVVoDbHBmTwXfRx6z+xqdydb82hBKbq5nnKIkyzlRLDQA/pcprSinXkhoefKYpz+/wUGZKIgR+y9FfUQ/41PzgYU/FMkj/fjOuwdzHejcIa6iSmaRboZ3mn3erFQRL5ueZHsKJIOD6S9+/xU/O8qfhx8G4RhlFHUMy4tl9QzlkplAGAO4qhfiqEeZytZmBLit3byigCMam+p3pBCeMaZOrBE8bl0UqrioCiS+85BLpdQk3JwiUqWd6z/Jrox2fMyleDKDOmUOVtfug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:21:02.1929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41708752-3c55-456a-cfd7-08ded39eea4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5961
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNSBTYWx0ZWRfX6RbyWzC1ntm0
 QBvG3icBGQZAdH8qIIv5NXfHQYK9LONMfM/gaLGBZyzgxc+5bpIcLB0GBtSO2y+4Weko809o/Ym
 fljkSyF3ZNTbfJCX1LIYdOBRQ+uJVPE=
X-Proofpoint-ORIG-GUID: _RBIW_717tN_B0dCVRQkVsLYblPiYlgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNSBTYWx0ZWRfX2ZukKabpoZsK
 hWbN6N+ueG8q9YpPGr+MoiGsUxR/2EYdY1QN5o2faWOLICaY2YwiFj42smJOHnKy4wKeKe3AWSD
 ns+C7rq4F/xhwgfZiMcSSRNjzSN+T4k3xZCirfYzSoJBgnApbreDsebWYPkZ2wX+0V4DRxnjZkz
 F/A9CVMDjkwj5agvM2H1ihPNDoAMxM7sqFG9DGwtl6hy3FyeAHRYCxrOHAKfmcJkfoGlUOVPxr8
 NlDannL7GM9TxwlPvCGRqoeJIrUTRu5jQ4Wy2PZ3xuqq3wjhUjLcvXqE5vM0HwrT9oIV6OUyMVJ
 OOoZMkNqDgXV6X8KRRSfntE3CsSkxhrZIBt62yZS1sGFuGk7Ihito5HMC2v6dBjO739MIjGXOkl
 B/oFuxMar10oKYDHMgw1nYmwGRKzZUFldDFONKqCHzTy81Z3TbdBnkRLWLCumMwDarbvcXXXLWj
 AYOYVDxahhsTxsj9EWw==
X-Proofpoint-GUID: _RBIW_717tN_B0dCVRQkVsLYblPiYlgD
X-Authority-Analysis: v=2.4 cv=SJJykuvH c=1 sm=1 tr=0 ts=6a3ea6f3 cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=JSOPZz9IAAAA:8
 a=sozttTNsAAAA:8 a=c_D1NCwFYeVaGgGCFm4A:9 a=QEXdDO2ut3YA:10
 a=B-1sCzwcsC-Wa9HVu-tL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260135

On 6/26/26 11:10 AM, Nathan Morrisson wrote:
> Add support for the PHYTEC phyCORE-AM67x SoM [1] and the
> corresponding phyBOARD-Rigel carrier board [2]. The phyCORE-AM67x SoM
> uses the TI AM67x SoC and can come with different sizes and models of
> DDR, eMMC, and SPI NOR Flash.
> 
> Supported features:
>    * Audio playback and recording
>    * CAN
>    * Debug UART
>    * eMMC
>    * Ethernet
>    * GPIO buttons
>    * Heartbeat LED
>    * I2C Current sensor
>    * I2C EEPROM
>    * I2C Light sensor
>    * I2C RTC
>    * Micro SD card
>    * PCIe
>    * SPI NOR flash
>    * USB
> 
> [1] https://www.phytec.com/product/phycore-am67x/
> [2] https://www.phytec.com/product/phyboard-am67x-development-kit/
> 
> Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

> Changes in v2:
>   * Move k3-j722s.dtsi include from the phyboard to phycore dts
>   * Remove cpsw_port2 node because it was already disabled
>   * Remove mcasp1 because it is used by HDMI, and HDMI is not included in this dts
>   * Fix typo in audio codec properties ai3xx-micbias-vg -> ai31xx-micbias-vg
>   * Use IRQ_TYPE_EDGE_FALLING instead of IRQ_TYPE_LEVEL_LOW for gpio expanders
> 
>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>   .../boot/dts/ti/k3-am67-phycore-som.dtsi      | 325 ++++++++++++
>   .../boot/dts/ti/k3-am6754-phyboard-rigel.dts  | 478 ++++++++++++++++++
>   3 files changed, 804 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 371f9a043fe5..623ee2369132 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
>   
>   # Boards with J722s SoC
> +dtb-$(CONFIG_ARCH_K3) += k3-am6754-phyboard-rigel.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> diff --git a/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
> new file mode 100644
> index 000000000000..1bbd6d024c60
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: Nathan Morrisson <nmorrisson@phytec.com>
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "k3-j722s.dtsi"
> +
> +/ {
> +	compatible = "phytec,am67-phycore-som", "ti,j722s";
> +	model = "PHYTEC phyCORE-AM67";
> +
> +	aliases {
> +		ethernet0 = &cpsw_port1;
> +		gpio0 = &main_gpio0;
> +		mmc0 = &sdhci0;
> +		rtc0 = &i2c_som_rtc;
> +		rtc1 = &wkup_rtc0;
> +		spi0 = &ospi0;
> +	};
> +
> +	memory@80000000 {
> +		/* 4G RAM */
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
> +		      <0x00000008 0x80000000 0x00000000 0x80000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		secure_tfa_ddr: tfa@9e780000 {
> +			reg = <0x00 0x9e780000 0x00 0x80000>;
> +			no-map;
> +		};
> +
> +		secure_ddr: optee@9e800000 {
> +			reg = <0x00 0x9e800000 0x00 0x01800000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0xa0000000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: memory@a0100000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0xa0100000 0x00 0xf00000>;
> +			no-map;
> +		};
> +	};
> +
> +	vcc_5v0_som: regulator-vcc-5v0-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V0_SOM";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins_default>;
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	leds_pins_default: leds-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x034, PIN_OUTPUT, 7)	/* (K22) OSPI0_CSN2.GPIO0_13 */
> +		>;
> +	};
> +
> +	mdio_pins_default: mdio-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0160, PIN_OUTPUT, 0)	/* (AC24) MDIO0_MDC */
> +			J722S_IOPAD(0x015c, PIN_INPUT, 0)	/* (AD25) MDIO0_MDIO */
> +		>;
> +		bootph-all;
> +	};
> +
> +	ospi0_pins_default: ospi0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
> +			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
> +			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
> +			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
> +			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
> +			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
> +			J722S_IOPAD(0x01c, PIN_INPUT, 0)	/* (L21) OSPI0_D4 */
> +			J722S_IOPAD(0x020, PIN_INPUT, 0)	/* (M26) OSPI0_D5 */
> +			J722S_IOPAD(0x024, PIN_INPUT, 0)	/* (N27) OSPI0_D6 */
> +			J722S_IOPAD(0x028, PIN_INPUT, 0)	/* (M27) OSPI0_D7 */
> +			J722S_IOPAD(0x008, PIN_INPUT, 0)	/* (L22) OSPI0_DQS */
> +			J722S_IOPAD(0x038, PIN_INPUT, 7)	/* (J22) OSPI0_CSn3.GPIO0_14 */
> +		>;
> +		bootph-all;
> +	};
> +
> +	pmic_irq_pins_default: pmic-irq-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x030, PIN_INPUT, 7)	/* (K23) OSPI0_CSN1.GPIO0_12 */
> +		>;
> +	};
> +
> +	rgmii1_pins_default: rgmii1-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x014c, PIN_INPUT, 0)	/* (AC25) RGMII1_RD0 */
> +			J722S_IOPAD(0x0150, PIN_INPUT, 0)	/* (AD27) RGMII1_RD1 */
> +			J722S_IOPAD(0x0154, PIN_INPUT, 0)	/* (AE24) RGMII1_RD2 */
> +			J722S_IOPAD(0x0158, PIN_INPUT, 0)	/* (AE26) RGMII1_RD3 */
> +			J722S_IOPAD(0x0148, PIN_INPUT, 0)	/* (AE27) RGMII1_RXC */
> +			J722S_IOPAD(0x0144, PIN_INPUT, 0)	/* (AD23) RGMII1_RX_CTL */
> +			J722S_IOPAD(0x0134, PIN_OUTPUT, 0)	/* (AF27) RGMII1_TD0 */
> +			J722S_IOPAD(0x0138, PIN_OUTPUT, 0)	/* (AE23) RGMII1_TD1 */
> +			J722S_IOPAD(0x013c, PIN_OUTPUT, 0)	/* (AG25) RGMII1_TD2 */
> +			J722S_IOPAD(0x0140, PIN_OUTPUT, 0)	/* (AF24) RGMII1_TD3 */
> +			J722S_IOPAD(0x0130, PIN_OUTPUT, 0)	/* (AG26) RGMII1_TXC */
> +			J722S_IOPAD(0x012c, PIN_OUTPUT, 0)	/* (AF25) RGMII1_TX_CTL */
> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +&mcu_pmx0 {
> +	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0)	/* (B9) WKUP_I2C0_SCL */
> +			J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)	/* (D11) WKUP_I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +&cpsw3g {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii1_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&cpsw3g_mdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mdio_pins_default>;
> +	status = "okay";
> +
> +	cpsw3g_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,min-output-impedance;
> +	};
> +};
> +
> +&cpsw_port1 {
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&cpsw3g_phy1>;
> +	status = "okay";
> +};
> +
> +&ospi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ospi0_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +
> +	serial_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +		spi-max-frequency = <25000000>;
> +		vcc-supply = <&vdd_1v8>;
> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <0>;
> +	};
> +};
> +
> +&sdhci0 {
> +	non-removable;
> +	bootph-all;
> +	ti,driver-strength-ohm = <50>;
> +	status = "okay";
> +};
> +
> +&wkup_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	bootph-all;
> +	status = "okay";
> +
> +	pmic@30 {
> +		compatible = "ti,tps65219";
> +		reg = <0x30>;
> +		buck1-supply = <&vcc_5v0_som>;
> +		buck2-supply = <&vcc_5v0_som>;
> +		buck3-supply = <&vcc_5v0_som>;
> +		ldo1-supply = <&vdd_3v3>;
> +		ldo2-supply = <&vdd_1v8>;
> +		ldo3-supply = <&vdd_3v3>;
> +		ldo4-supply = <&vdd_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_irq_pins_default>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		system-power-controller;
> +		ti,power-button;
> +
> +		regulators {
> +			vdd_3v3: buck1 {
> +				regulator-name = "VDD_3V3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v8: buck2 {
> +				regulator-name = "VDD_1V8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_lpddr4: buck3 {
> +				regulator-name = "VDD_LPDDR4";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vddshv_sdio: ldo1 {
> +				regulator-name = "VDDSHV_SDIO";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-allow-bypass;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v2: ldo2 {
> +				regulator-name = "VDD_1V2";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdda_1v8_phy: ldo3 {
> +				regulator-name = "VDDA_1V8_PHY";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v8_pll: ldo4 {
> +				regulator-name = "VDD_1V8_PLL";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +
> +	vdd_core: regulator-vdd-core@44 {
> +		compatible = "ti,tps62873";
> +		reg = <0x44>;
> +		bootph-pre-ram;
> +		regulator-name = "VDD_CORE";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <850000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	som_eeprom_opt: eeprom@51 {
> +		compatible = "atmel,24c32";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +	};
> +
> +	i2c_som_rtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +	};
> +};
> +
> +#include "k3-j722s-ti-ipc-firmware.dtsi"
> diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> new file mode 100644
> index 000000000000..e6e74910e0bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: Nathan Morrisson <nmorrisson@phytec.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "k3-serdes.h"
> +#include "k3-am67-phycore-som.dtsi"
> +
> +/ {
> +	compatible = "phytec,am6754-phyboard-rigel",
> +		     "phytec,am67-phycore-som", "ti,j722s";
> +	model = "PHYTEC phyBOARD-Rigel AM67";
> +
> +	aliases {
> +		gpio1 = &main_gpio1;
> +		mmc1 = &sdhci1;
> +		serial2 = &main_uart0;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +
> +	can_tc0: can-phy0 {
> +		compatible = "ti,tcan1042";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		standby-gpios = <&gpio_exp1 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	usb0_connector: connector {
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		label = "USB-C";
> +		data-role = "dual";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_usbc_power_pins_default>;
> +
> +		id-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			usb0_con: endpoint {
> +				remote-endpoint = <&usb0_ep>;
> +			};
> +		};
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_pins_default>;
> +
> +		key-home {
> +			label = "home";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&main_gpio1 23 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		key-menu {
> +			label = "menu";
> +			linux,code = <KEY_MENU>;
> +			gpios = <&gpio_exp1 4 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	pcie_refclk0: pcie-refclk0 {
> +		compatible = "gpio-gate-clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_pcie_usb_sel_pins_default>;
> +		clocks = <&serdes_refclk>;
> +		#clock-cells = <0>;
> +		enable-gpios = <&main_gpio0 22 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	vcc_1v8: regulator-vcc-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_3v3_aud: regulator-vcc-3v3-aud {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3_AUD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_3v3_mmc: regulator-vcc-3v3-mmc {
> +		/* TPS22963C OUTPUT */
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3_MMC";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_3v3_sw: regulator-vcc-3v3-sw {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3_SW";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_speaker: regulator-vcc-speaker {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_SPEAKER";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,widgets =
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Stereo Jack",
> +			"Speaker", "L SPKR",
> +			"Speaker", "R SPKR";
> +		simple-audio-card,routing =
> +			"MIC1RP", "Mic Jack",
> +			"Mic Jack", "MICBIAS",
> +			"Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"MIC1LM", "Stereo Jack",
> +			"MIC1LP", "Stereo Jack",
> +			"SPL", "L SPKR",
> +			"SPR", "R SPKR";
> +		simple-audio-card,name = "phyBOARD-Rigel";
> +		simple-audio-card,format = "dsp_b";
> +		simple-audio-card,bitclock-master = <&sound_master>;
> +		simple-audio-card,frame-master = <&sound_master>;
> +		simple-audio-card,bitclock-inversion;
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&mcasp0>;
> +		};
> +
> +		sound_master: simple-audio-card,codec {
> +			sound-dai = <&audio_codec>;
> +			clocks = <&audio_refclk1>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0a0, PIN_OUTPUT, 1)	/* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
> +		>;
> +	};
> +
> +	gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0054, PIN_INPUT, 7)	/* (T21) GPMC0_AD6.GPIO0_21 */
> +		>;
> +	};
> +
> +	gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0244, PIN_INPUT, 7)	/* (A24) MMC1_SDWP.GPIO1_49 */
> +		>;
> +	};
> +
> +	gpio_exp2_int_pins_default: gpio-exp2-int-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0050, PIN_INPUT, 7)	/* (T24) GPMC0_AD5.GPIO0_20 */
> +		>;
> +	};
> +
> +	gpio_keys_pins_default: gpio-keys-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x01d4, PIN_INPUT, 7)	/* (B21) UART0_RTSn.GPIO1_23 */
> +		>;
> +	};
> +
> +	main_i2c0_pins_default: main-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0)	/* (D23) I2C0_SCL */
> +			J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0)	/* (B22) I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_i2c1_pins_default: main-i2c1-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0)	/* (C24) I2C1_SCL */
> +			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0)	/* (A22) I2C1_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_mcan0_pins_default: main-mcan0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x1dc, PIN_INPUT, 0)	/* (C22) MCAN0_RX */
> +			J722S_IOPAD(0x1d8, PIN_OUTPUT, 0)	/* (D22) MCAN0_TX */
> +		>;
> +	};
> +
> +	main_mcasp0_pins_default: main-mcasp0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x1a8, PIN_INPUT, 0)	/* (C26) MCASP0_AFSX */
> +			J722S_IOPAD(0x1a4, PIN_INPUT, 0)	/* (D25) MCASP0_ACLKX */
> +			J722S_IOPAD(0x198, PIN_OUTPUT, 0)	/* (A26) MCASP0_AXR2 */
> +			J722S_IOPAD(0x194, PIN_INPUT, 0)	/* (A25) MCASP0_AXR3 */
> +		>;
> +	};
> +
> +	main_mmc1_pins_default: main-mmc1-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x023c, PIN_INPUT, 0)	/* (H22) MMC1_CMD */
> +			J722S_IOPAD(0x0234, PIN_INPUT, 0)	/* (H24) MMC1_CLK */
> +			J722S_IOPAD(0x0230, PIN_INPUT, 0)	/* (H23) MMC1_DAT0 */
> +			J722S_IOPAD(0x022c, PIN_INPUT, 0)	/* (H20) MMC1_DAT1 */
> +			J722S_IOPAD(0x0228, PIN_INPUT, 0)	/* (J23) MMC1_DAT2 */
> +			J722S_IOPAD(0x0224, PIN_INPUT, 0)	/* (H25) MMC1_DAT3 */
> +			J722S_IOPAD(0x0240, PIN_INPUT, 0)	/* (B24) MMC1_SDCD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_pcie_pins_default: main-pcie-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x07c, PIN_INPUT, 7)	/* (T23) GPMC0_CLK.GPIO0_31 */
> +		>;
> +	};
> +
> +	main_pcie_usb_sel_pins_default: main-pcie-usb-sel-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x058, PIN_INPUT, 7)	/* (T22) GPMC0_AD7.GPIO0_22 */
> +		>;
> +	};
> +
> +	main_uart0_pins_default: main-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (F19) UART0_RXD */
> +			J722S_IOPAD(0x01cc, PIN_OUTPUT, 0)	/* (F20) UART0_TXD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_usbc_power_pins_default: main-usbc-power-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x1b4, PIN_INPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
> +		>;
> +	};
> +};
> +
> +&audio_refclk1 {
> +	assigned-clock-rates = <25000000>;
> +};
> +
> +&main_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	veml6030: light-sensor@10 {
> +		compatible = "vishay,veml6030";
> +		reg = <0x10>;
> +		vdd-supply = <&vcc_3v3_sw>;
> +	};
> +};
> +
> +&main_i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c1_pins_default>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	audio_codec: audio-codec@18 {
> +		compatible = "ti,tlv320aic3110";
> +		reg = <0x18>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&audio_ext_refclk1_pins_default>;
> +		#sound-dai-cells = <0>;
> +		ai31xx-micbias-vg = <2>;
> +		reset-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
> +
> +		HPVDD-supply = <&vcc_3v3_aud>;
> +		SPRVDD-supply = <&vcc_speaker>;
> +		SPLVDD-supply = <&vcc_speaker>;
> +		AVDD-supply = <&vcc_3v3_aud>;
> +		IOVDD-supply = <&vcc_3v3_aud>;
> +		DVDD-supply = <&vcc_1v8>;
> +	};
> +
> +	gpio_exp0: gpio@20 {
> +		compatible = "nxp,pcf8574";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_exp0_int_pins_default>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-line-names = "CSI3_STROBE", "CSI3_TRIGGER",
> +				  "CSI3_SHUTTER", "CSI3_OE",
> +				  "CSI2_STROBE", "CSI2_TRIGGER",
> +				  "CSI2_SHUTTER", "CSI2_OE";
> +	};
> +
> +	gpio_exp1: gpio@21 {
> +		compatible = "nxp,pcf8574";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_exp1_int_pins_default>;
> +		interrupt-parent = <&main_gpio1>;
> +		interrupts = <49 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-line-names = "GPIO0_HDMI_RST", "GPIO1_CAN_nEN",
> +				  "GPIO2_LED", "GPIO3_MCU_CAN0_nEN",
> +				  "GPIO4_BUT2", "GPIO5_MCU_CAN1_nEN",
> +				  "GPIO6_AUDIO_GPIO", "GPIO7_AUDIO_USER_RESET";
> +	};
> +
> +	gpio_exp2: gpio@23 {
> +		compatible = "nxp,pcf8574";
> +		reg = <0x23>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_exp2_int_pins_default>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-line-names = "CSI1_STROBE", "CSI1_TRIGGER",
> +				  "CSI1_SHUTTER", "CSI1_OE",
> +				  "CSI0_STROBE", "CSI0_TRIGGER",
> +				  "CSI0_SHUTTER", "CSI0_OE";
> +	};
> +
> +	current-sensor@40 {
> +		compatible = "ti,ina233";
> +		reg = <0x40>;
> +		shunt-resistor = <18000>;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c02";
> +		reg = <0x51>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&main_mcan0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mcan0_pins_default>;
> +	phys = <&can_tc0>;
> +	status = "okay";
> +};
> +
> +&main_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart0_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&mcasp0 {
> +	#sound-dai-cells = <0>;
> +	op-mode = <0>; /* MCASP_IIS_MODE */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mcasp0_pins_default>;
> +	tdm-slots = <2>;
> +	serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
> +	       0 0 1 2
> +	       0 0 0 0
> +	       0 0 0 0
> +	       0 0 0 0
> +	>;
> +	status = "okay";
> +};
> +
> +&pcie0_rc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_pcie_pins_default>;
> +	num-lanes = <1>;
> +	phys = <&serdes1_pcie_link>;
> +	phy-names = "pcie-phy";
> +	reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	/* SD/MMC */
> +	vmmc-supply = <&vcc_3v3_mmc>;
> +	vqmmc-supply = <&vddshv_sdio>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc1_pins_default>;
> +	disable-wp;
> +	no-1-8-v;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&serdes_ln_ctrl {
> +	idle-states = <J722S_SERDES0_LANE0_USB>,
> +		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
> +};
> +
> +&serdes0 {
> +	status = "okay";
> +
> +	serdes0_usb_link: phy@0 {
> +		reg = <0>;
> +		cdns,num-lanes = <1>;
> +		#phy-cells = <0>;
> +		cdns,phy-type = <PHY_TYPE_USB3>;
> +		resets = <&serdes_wiz0 1>;
> +	};
> +};
> +
> +&serdes_wiz0 {
> +	status = "okay";
> +};
> +
> +&serdes1 {
> +	status = "okay";
> +
> +	serdes1_pcie_link: phy@0 {
> +		reg = <0>;
> +		cdns,num-lanes = <1>;
> +		#phy-cells = <0>;
> +		cdns,phy-type = <PHY_TYPE_PCIE>;
> +		resets = <&serdes_wiz1 1>;
> +	};
> +};
> +
> +&serdes_wiz1 {
> +	clocks = <&k3_clks 280 0>, <&k3_clks 280 1>, <&pcie_refclk0>;
> +	status = "okay";
> +};
> +
> +&usbss0 {
> +	ti,vbus-divider;
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	maximum-speed = "high-speed";
> +
> +	port {
> +		usb0_ep: endpoint {
> +			remote-endpoint = <&usb0_con>;
> +		};
> +	};
> +};
> +
> +&usbss1 {
> +	ti,vbus-divider;
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	phys = <&serdes0_usb_link>;
> +	phy-names = "cdns3,usb3-phy";
> +	maximum-speed = "super-speed";
> +};

